Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09252C54E67
	for <buildroot@archiver.kernel.org>; Fri, 15 Mar 2024 19:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5BE06068C;
	Fri, 15 Mar 2024 19:57:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TpmOQOeWxNWq; Fri, 15 Mar 2024 19:57:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 414386087F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 414386087F;
	Fri, 15 Mar 2024 19:57:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C788A1BF307
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 19:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C1C1D81EE9
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 19:57:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1_8qpzIc-Gjr for <buildroot@lists.busybox.net>;
 Fri, 15 Mar 2024 19:57:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 04D3F8209C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04D3F8209C
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 04D3F8209C
 for <buildroot@busybox.net>; Fri, 15 Mar 2024 19:57:43 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-41405d77cd8so1779655e9.2
 for <buildroot@busybox.net>; Fri, 15 Mar 2024 12:57:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710532662; x=1711137462;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1dfhwNUMrCaUvYLxtIpufHZSthth4QPltYqquADi2ZM=;
 b=Eyb0fypHsF9pFGNEKLpspxovOXpMR5XI2HBIjTil4LuRigjCPHtqiryiYHxYZLcuxd
 EmdHZyLJkN9ksO8NGujLYUnucKb+mNMo3MpeULiVNCL/fDLoBfd7JLM5sMRduO0o2Ah+
 vlaeOwnaGVrIq8KoxYByjNKTQbBMf2bx51hjGRWihzpvCWvGqVe+QJQaQM1uc5coHZoN
 xg8RTHFzDXIusDRmRg5a3XKanG4RUCW5lDvbGW1ceAv/tcGvXxRkt4X/j0JGQSbkzXyC
 Z4IzqA+ZKnyUJo6H09n+0eXr3+FvuATD3KKDVzll5wBUN0/buUp4/N0yjD2wsi5NtgW0
 OO1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzIS4Oue23cGUS/35z+qB832akOcU1ozoxrpJFL9E3u8mA9yDca1WcpKk7DmW+ktrhYCbx4jE0Lt0lgJeOHFZYoMoY4yQ=
X-Gm-Message-State: AOJu0Yx5wyCPAvS6OF+nBFz6DSzZgeS4piZ/6TTuYlhsnzZFPcGsaxif
 +iM7oTmvDqi/KCYJwDgJJWGSZYhleDa8g+nLIIscM9TMbopadjyJdq3wsbm4X6Y=
X-Google-Smtp-Source: AGHT+IH55PFdj5lSNfSD7WVPm0luoQeOg41zzCLEKAtW0vnasrbWn8MQZC6buiSiE/O659oaKo1DPQ==
X-Received: by 2002:a05:600c:46cd:b0:413:ee35:55bc with SMTP id
 q13-20020a05600c46cd00b00413ee3555bcmr4505891wmo.37.1710532661600; 
 Fri, 15 Mar 2024 12:57:41 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a05600c310600b00413294ddb72sm6687084wmo.20.2024.03.15.12.57.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Mar 2024 12:57:41 -0700 (PDT)
Message-ID: <00accd1d-3060-404b-b3a9-13590ef4835c@mind.be>
Date: Fri, 15 Mar 2024 20:57:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20240313091412.20865-1-francois.perrad@gadz.org>
 <20240313091412.20865-4-francois.perrad@gadz.org>
In-Reply-To: <20240313091412.20865-4-francois.perrad@gadz.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1710532662; x=1711137462; darn=busybox.net;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1dfhwNUMrCaUvYLxtIpufHZSthth4QPltYqquADi2ZM=;
 b=BHCRYru5V5ZsMWdJ35BNUgn9b2ik8I+fLFDg0R1f8c5bud4CX9HcCj9ChKsAfwEFco
 uIPFcCVSi2lk9PryhBEKG2CWGkugqvaUf1DIg9ieesNyIaUmtex2yvcgoVnlrH8oEJOo
 nvn5mKtUgOf8qaLINB75U59Esbpmf97S0F1XzCJO7sU9V2cttjZQkPgFWyifEpvgM5H0
 +gSCY/lExFkdpVq+IlfCyXdzGa4FWDV7SMZy/ktQW/nehYSKVN1N6C4LnrSrwNI6nCbX
 gyF3fhak/OG5tZ5G9vRoSbf+ooFKaVbWFLHawNkV/r+MmeGmh835YNH+aqddUqRdH8An
 IUUg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BHCRYru5
Subject: Re: [Buildroot] [PATCH 04/31] package/diffutils: disable busybox
 diff
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Francois,

On 13/03/2024 10:13, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>   package/diffutils/diffutils.mk | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/package/diffutils/diffutils.mk b/package/diffutils/diffutils.mk
> index 111926686..fe20a0e67 100644
> --- a/package/diffutils/diffutils.mk
> +++ b/package/diffutils/diffutils.mk
> @@ -18,4 +18,8 @@ ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
>   DIFFUTILS_CONF_ENV += gl_cv_func_getopt_gnu=yes
>   endif
>   
> +define DIFFUTILS_BUSYBOX_CONFIG_FIXUPS
> +	$(call KCONFIG_DISABLE_OPT,CONFIG_DIFF)

  I don't understand the point of this series. In general, there is no reason to 
disable applets from busybox just because there's a "full" alternative installed 
on the system. Usually the busybox size difference is completely negligible 
compared to the the "full" installation size. And the busybox one can still be 
useful in some cases (when called as 'busybox diff' instead of 'diff').

  If you really care about removing the redundant busybox options, you can 
easily supply a custom busybox config.

  Is there a really good reason for all this?

  Regards,
  Arnout

> +endef
> +
>   $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
