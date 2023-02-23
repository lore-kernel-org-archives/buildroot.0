Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB40C636D6
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 15:02:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61F2540528;
	Thu, 23 Feb 2023 15:02:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61F2540528
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LBF6B-M9ruWF; Thu, 23 Feb 2023 15:02:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93B54410CC;
	Thu, 23 Feb 2023 15:02:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93B54410CC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3AA5D1BF4E3
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 15:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 213C780DA3
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 15:02:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 213C780DA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GlpObP68YMff for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 15:02:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCEF6822CE
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BCEF6822CE
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 15:02:29 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id j3so7191127wms.2
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 07:02:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CvG0yxoiFppn9fAi1DSvLN4q9XbdmPep4DaMHhrf3No=;
 b=GGFyXssZ7+3vHHHF+DeVszd704IdZLMH2FhcBSYJuo6sKon4knsJvORSoPLlCHJsU5
 9Idt+V7jAgkTU+G4SqePX+SUGayOWKCFrwV3B+OGEUqpB6y4UdLPAbwPMrCzza3IfM+T
 2Tj/uKcxBuuzdJwfSFxwP1H1WHTZx49131yWBun5iqVya0VlN8ux3G/GVSyTypL+nA8V
 MrPxk+KOeZAuzSgN/jTiRpEUAIn/Qx795nB+99F/vQ3pU+TgaT7HV1+Au8N13v2WjVdP
 4yCTQN+g4OYXQi2OyXqUKdel75mVmxvctdm/+cSYvRyf4W25l2u1rRhhOJamotSWcWOZ
 +EUg==
X-Gm-Message-State: AO0yUKWdr+iVfK96rOsK1x+z9B0GTCFfLbZWF+/W0n4P3gGYW1Zq9zYY
 3E4N8lrG/eDJa5Fzbe+cmoZsH5otTd8T6/jWIfYjOtQg
X-Google-Smtp-Source: AK7set/C0jKwFfHN+ROS1O5UTvf947f4gX5zmgCLZrQXMRKhT3pHmgunj4NI7Q8doitjHhcfj0GAOg==
X-Received: by 2002:a05:600c:4a90:b0:3ea:dbdd:dd54 with SMTP id
 b16-20020a05600c4a9000b003eadbdddd54mr443685wmp.2.1677164547520; 
 Thu, 23 Feb 2023 07:02:27 -0800 (PST)
Received: from wintermute.localnet (77.109.114.132.adsl.dyn.edpnet.net.
 [77.109.114.132]) by smtp.gmail.com with ESMTPSA id
 3-20020a05600c024300b003daf7721bb3sm11558443wmj.12.2023.02.23.07.02.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 07:02:09 -0800 (PST)
From: Frank Vanbever <frank.vanbever@mind.be>
To: buildroot@buildroot.org, peter@korsgaard.com
Date: Thu, 23 Feb 2023 16:01:41 +0100
Message-ID: <2902185.e9J7NaK4W3@wintermute>
In-Reply-To: <20230115173240.81077-1-fontaine.fabrice@gmail.com>
References: <20230115173240.81077-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CvG0yxoiFppn9fAi1DSvLN4q9XbdmPep4DaMHhrf3No=;
 b=CD8tFxVcIWZ61iS/nyEN2U7a/U1kvTXwTPuzxShMfRgqfHRpV8WY45yqrfj/AkeVNq
 OHWZ8P/P8/TSzL/Uu/xjOQPNmG2rbv9fEPMfYqtXxo6g7F8/hWbsLuscJxJ73BAzzLOk
 pT81nZzYCtdFwxeZb0RYcGk074OoOmON5PTJd+KkFVqkhdWILcIN1/OGSrIzdGmSAp9P
 paB09Tv/QKJpqJJXMHaBheqjuta6hjQK7NuKue1GpplQR3VHhDWbR/mg+oc2/9bORiLv
 nHkRM/RKGzFlxR5zWELB5Elx3uW86v79RU80hEGaAUk5hhvF4sdZHDVh4+Nw7e3JPKdt
 wKDA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CD8tFxVc
Subject: Re: [Buildroot] [PATCH 1/1] package/libmodsecurity: bump to version
 3.0.8
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Yann Morin <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

Any version of libmodsecurity < 3.0.8 is affected by CVE-2022-48279 [1] so this 
bump is also relevant for 2022.11.x (3.0.7) and 2022.02.x (3.0.6)

I originally backported the fix from 3.0.8 to 3.0.7 and it comes in at just 
under 1MB. This rightfully triggered a quarantine in the mailing list and is a 
pretty good sign that a version bump might be a better course of action here.

Best regards,
Frank

[1] https://nvd.nist.gov/vuln/detail/CVE-2022-48279

On zondag 15 januari 2023 18:32:40 CET Fabrice Fontaine wrote:
> https://github.com/SpiderLabs/ModSecurity/releases/tag/v3.0.8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libmodsecurity/libmodsecurity.hash | 4 ++--
>  package/libmodsecurity/libmodsecurity.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libmodsecurity/libmodsecurity.hash
> b/package/libmodsecurity/libmodsecurity.hash index 087157d162..7ba0ef7f18
> 100644
> --- a/package/libmodsecurity/libmodsecurity.hash
> +++ b/package/libmodsecurity/libmodsecurity.hash
> @@ -1,4 +1,4 @@
> -# From
> https://github.com/SpiderLabs/ModSecurity/releases/download/v3.0.7/modsecur
> ity-v3.0.7.tar.gz.sha256 -sha256 
> cfd8b7e7e6a0e9ca4e19b9adeb07594ba75eba16a66da5e9b0974c0117c21a34 
> modsecurity-v3.0.7.tar.gz +# From
> https://github.com/SpiderLabs/ModSecurity/releases/download/v3.0.8/modsecur
> ity-v3.0.8.tar.gz.sha256 +sha256 
> e241c89b3cd7e58a863d0d0d6b9b8ba4d33ffb0f51171044c258c62e3e7956c7 
> modsecurity-v3.0.8.tar.gz # Localy calculated
>  sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4 
> LICENSE diff --git a/package/libmodsecurity/libmodsecurity.mk
> b/package/libmodsecurity/libmodsecurity.mk index 916ba8fbcb..e83fda895f
> 100644
> --- a/package/libmodsecurity/libmodsecurity.mk
> +++ b/package/libmodsecurity/libmodsecurity.mk
> @@ -4,7 +4,7 @@
>  #
>  ###########################################################################
> #####
> 
> -LIBMODSECURITY_VERSION = 3.0.7
> +LIBMODSECURITY_VERSION = 3.0.8
>  LIBMODSECURITY_SOURCE = modsecurity-v$(LIBMODSECURITY_VERSION).tar.gz
>  LIBMODSECURITY_SITE =
> https://github.com/SpiderLabs/ModSecurity/releases/download/v$(LIBMODSECURI
> TY_VERSION) LIBMODSECURITY_INSTALL_STAGING = YES




_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
