Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE05EE7735F
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 16:58:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F2C240C49;
	Sat, 30 Sep 2023 16:58:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F2C240C49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zIOjfVHvdP5o; Sat, 30 Sep 2023 16:58:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B20C40396;
	Sat, 30 Sep 2023 16:58:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B20C40396
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5D0E71BF48D
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 16:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3702883CDA
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 16:57:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3702883CDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pbLRbefXf6k7 for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 16:57:58 +0000 (UTC)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7638883CD7
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 16:57:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7638883CD7
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-32329d935d4so9877028f8f.2
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 09:57:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696093076; x=1696697876;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M92TyUHATqmtqtsKJUDsSk9VQXZj8RvEd4AiIvwNJQE=;
 b=wet4630quWcFZS21vgEexg3OsDU3By1oITHeemeJhokr3hvF7zc8qX2Od4AO+YLSDk
 ptEz38iAccyTp8aq5eC0wfHe+fVTC+h46uCRWJzNPAMOdxr+xoZX6Ufx7MBKnYWMFhit
 naVQUH5RC4f/Z3SBtmMSgLa70OiRQxdEFIHMEs3HFfmH5QaAtHum8M/CtifByOD41Pyu
 aje0bGyXpyBZyBLUBr+F2G85n7mGlLPMcnMHkQH9wHLNMrGTYtnYh/lpY09dhnPVRT/0
 aSacpJQ0tmYdyqk6gvmxTMv5v4rU5ZN22TjT7B8WfRAbtw/L1JiwTTjOdBabke1R2QYf
 fQZw==
X-Gm-Message-State: AOJu0YzWdT5KUPH7s5z2cIagAgCgF0nA242GBbf7LrUS8P/KUljkCDmE
 dCEL+/pkBdV0rlopET6CB0SJCQ==
X-Google-Smtp-Source: AGHT+IEC3ZfNDd7NPKg2VviPKzh3MHQhgVx4PDogFlGdYmhisgaPwY8FAJfmise0oGs9VcKd5o4PtA==
X-Received: by 2002:adf:d4c2:0:b0:31a:e8e6:8a96 with SMTP id
 w2-20020adfd4c2000000b0031ae8e68a96mr6557714wrk.67.1696093076420; 
 Sat, 30 Sep 2023 09:57:56 -0700 (PDT)
Received: from ?IPV6:2a01:cb04:4ad:b00:5ddb:2bcd:94e3:5264?
 (2a01cb0404ad0b005ddb2bcd94e35264.ipv6.abo.wanadoo.fr.
 [2a01:cb04:4ad:b00:5ddb:2bcd:94e3:5264])
 by smtp.gmail.com with ESMTPSA id
 z5-20020adfe545000000b003177074f830sm5614174wrm.59.2023.09.30.09.57.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Sep 2023 09:57:55 -0700 (PDT)
Message-ID: <1280749b-2dfe-af85-62fb-a2fcebe6a7a3@mind.be>
Date: Sat, 30 Sep 2023 18:57:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Angelo Compagnucci <angelo@amarulasolutions.com>, buildroot@buildroot.org
References: <20221004110421.137795-1-angelo@amarulasolutions.com>
 <20221004110421.137795-5-angelo@amarulasolutions.com>
In-Reply-To: <20221004110421.137795-5-angelo@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1696093076; x=1696697876; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M92TyUHATqmtqtsKJUDsSk9VQXZj8RvEd4AiIvwNJQE=;
 b=b/gfXZBTWZ58nssjkJxyf58YWttQsLkd25Cr9TPw0Xjzboy8gdImJsGaElUAA8Lk1b
 LvcGdYSAE/3H5aT3D2DwXJvuCuoTlvAawtUV5bMsfq2mhWIQYTKKWVp23/va/LRfas4U
 ECxEEb6mq57XhxFu4cvZ8uM41hkHhOOEb+y/R6LX453HyTsgZcGUGunmwMW1PwQM+6ds
 1kmmUK/TkRicu5varhujnB4qKoQU/E7D3q0lby0Jd1+cihI/mkGaqNEd3fCV41BgVdEi
 /XhNoQTwgBu+y+6peVGb09mNaUAz61WMXiAqINXjmjOibbBVtf8zomaxQZzx/x4FOrBO
 I0AA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=b/gfXZBT
Subject: Re: [Buildroot] [PATCH v4 4/5] package/ifupdown-scripts: add wifi
 configuration when enabled
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



On 04/10/2022 13:04, Angelo Compagnucci wrote:
> Add a proper wpa-conf line to the interfaces files to let the system
> bring up the wifi interface and the related wpa supplicant.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
> Changes:
> v3:
> * add "|| true" lo let the command exit without error when
>    BR2_SYSTEM_CONNECT_WIFI is empty (me)
> 
>   package/ifupdown-scripts/ifupdown-scripts.mk | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/package/ifupdown-scripts/ifupdown-scripts.mk b/package/ifupdown-scripts/ifupdown-scripts.mk
> index 5ef032142c..ebaf234143 100644
> --- a/package/ifupdown-scripts/ifupdown-scripts.mk
> +++ b/package/ifupdown-scripts/ifupdown-scripts.mk
> @@ -28,6 +28,8 @@ define IFUPDOWN_SCRIPTS_DHCP
>   		echo "  pre-up /etc/network/nfs_check"; \
>   		echo "  wait-delay 15"; \
>   		echo "  hostname \$$(hostname)"; \
> +		test -n "$(BR2_SYSTEM_CONNECT_WIFI)" && \
> +			echo "  wpa-conf /etc/wpa_supplicant.conf" || true; \

  You can write this as

		$(if $(BR2_SYSTEM_CONNECT_WIFI),echo "  wpa-conf /etc/wpa_supplicant.conf")

(but as I said, I think it's better to have a separate BR2_SYSTEM_WLAN section.)


  Regards,
  Arnout

>   	) >> $(TARGET_DIR)/etc/network/interfaces
>   endef
>   define IFUPDOWN_SCRIPTS_DHCP_OPENRC
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
