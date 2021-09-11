Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE396C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 20:31:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1558F610A3
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 20:31:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1558F610A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABF9C81B0A;
	Sat, 11 Sep 2021 20:31:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XSKC55TZqJq1; Sat, 11 Sep 2021 20:31:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20DE481AEA;
	Sat, 11 Sep 2021 20:31:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 538741BF2CB
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 20:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F1FE607D0
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 20:31:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ngBNsjVb4zRD for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 20:31:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA73F6059C
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 20:31:16 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id qq21so5810066ejb.10
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 13:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZOV4+O7h7UpM8qmW1hcdABrzLqIRJa3AgFrxSPuW0BE=;
 b=LjOjKUJejrJv2vdd+HSJoMXcjmM6VLj2ZgCp1XokihXn8ihGD63Sc8l4yEPbyV4os4
 epwowmWU5GyhCtwqZYVg35baxx5844uxWYtUnVb/0Zv1bwvC2zIPkMowbSBmgUhGPDu8
 GGQrKrcicENlVI6HZEpHRTIW5f62Abxu7PUCyUgOH3/HS2Bc87sOdYtNAsPNaZleodmU
 bZ2gbDupoXZRtc9VnTcTLfMwC3nSsbx/3NgblDNaGWraD4VGkcVGIgdwjh7x5iezMNs2
 ZqXMEXo939TqrRkuJUGiafLKq6QkT6C7xPAAiRhDKNXwPwYyVLyxmc+Ti7caRx3pbEqo
 orrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ZOV4+O7h7UpM8qmW1hcdABrzLqIRJa3AgFrxSPuW0BE=;
 b=Z1r+1JN0Pu9N28bo+PJZQXrebW8EOszGWWgfg2a1lle4WXInqqBpQf+E2CeRzVM2cQ
 t9VpN1kU5F12ViLc9KM26kpkPmmH2rXOCzEFlTi0HeUcrf7rgiidgVvXu6UD/cGMLjVp
 5Rs812OTm71Xc2ZzaUMLHhgcpwK2ull/S2Ha22UNghXyUUx+J6ank9QlhA3tQpnm7gTv
 yiU1NCtEueHqypSVo1vBRSoL0Xv7viNr2x4/LUuRoHyXxhAj+EeL/GMrHisBrl0EZFH/
 D2I0RStQ2dKjHR9CNtwhOaa2Zo/QG6SZejkE32Kylg3XFAE07u+ciS3Vx1OGq5GA1lAm
 d1KQ==
X-Gm-Message-State: AOAM530aQTwhIaX3cFcGgm6GEKzu8/63gSv3DxC++czuwzqajD4MDert
 nQGO5DiUq7cRoSF9OnnNCXaxAU5Fwlmymg==
X-Google-Smtp-Source: ABdhPJwlfhdLN3yPfDSHU7/n8GqJROlFxKM/uUJuEDpxTzPnpZ3RQvYFyBEQ73pOMWz67jRN+fDMuA==
X-Received: by 2002:a17:907:1de0:: with SMTP id
 og32mr4365758ejc.348.1631392274989; 
 Sat, 11 Sep 2021 13:31:14 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id o22sm1393123edi.89.2021.09.11.13.31.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 13:31:14 -0700 (PDT)
To: James Knight <james.d.knight@live.com>, buildroot@buildroot.org
References: <20210904204025.15457-1-james.d.knight@live.com>
 <DM6PR08MB3993D7A0D181CE64EFFF613BA0D09@DM6PR08MB3993.namprd08.prod.outlook.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <a21945ca-9a6e-1993-4cf4-f9848c495747@mind.be>
Date: Sat, 11 Sep 2021 22:31:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <DM6PR08MB3993D7A0D181CE64EFFF613BA0D09@DM6PR08MB3993.namprd08.prod.outlook.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 2/3] package/rpm: explicit audit option
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 04/09/2021 22:40, James Knight wrote:
> Support for Linux audit has existed [1] since a v4.15 release; manage
> the configuration option explicitly.
> 
> [1]: https://github.com/rpm-software-management/rpm/commit/ad16a04b6e41612cdef6ab8755ad31c8b880a9fd
> 
> Signed-off-by: James Knight <james.d.knight@live.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/rpm/rpm.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
> index 816deceff7..e9d2adf690 100644
> --- a/package/rpm/rpm.mk
> +++ b/package/rpm/rpm.mk
> @@ -38,6 +38,13 @@ else
>  RPM_CONF_OPTS += --without-acl
>  endif
>  
> +ifeq ($(BR2_PACKAGE_AUDIT),y)
> +RPM_DEPENDENCIES += audit
> +RPM_CONF_OPTS += --with-audit
> +else
> +RPM_CONF_OPTS += --without-audit
> +endif
> +
>  ifeq ($(BR2_PACKAGE_DBUS),y)
>  RPM_DEPENDENCIES += dbus
>  RPM_CONF_OPTS += --enable-plugins
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
