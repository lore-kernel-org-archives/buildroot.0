Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18912C433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Jul 2022 06:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A450841745;
	Wed, 13 Jul 2022 06:38:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A450841745
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1-S6ZUJzzz7w; Wed, 13 Jul 2022 06:38:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E509416E5;
	Wed, 13 Jul 2022 06:38:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E509416E5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 39A841BF4D6
 for <buildroot@lists.busybox.net>; Wed, 13 Jul 2022 06:38:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D779840C7
 for <buildroot@lists.busybox.net>; Wed, 13 Jul 2022 06:38:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D779840C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EsgTS-qH-H2B for <buildroot@lists.busybox.net>;
 Wed, 13 Jul 2022 06:38:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1E09840BE
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F1E09840BE
 for <buildroot@busybox.net>; Wed, 13 Jul 2022 06:38:20 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id os14so18151824ejb.4
 for <buildroot@busybox.net>; Tue, 12 Jul 2022 23:38:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6ctomdul2JDx+YcdicyW3WXjkih0UKJtkejZLU2wPMc=;
 b=5tcJaGn3ZmS3M2XOLy0AkI+Rb/BU8IiiexXzbd+cyoNMsWT9f1MYDC2PsHPIiK8h5c
 /pTbozqTzsbuNvDMlCLen7YY6pqCT43HK4vR7nZmqiY1DiujpCn7IlvlU5FsHmKorx99
 sYyZpLJ4Oqql5YOM3smSHrrlXMZAiNNxQUXz0U5zt8/8TkHFQdyPCYm3LnGTrq73NsRz
 oYDLZu7XkZF69f0hhVzkKsb3omTzd6Hza/GpDWZ28xldHysY+wYIgg4hxAiXsb8kHXid
 yYwz3WzRObWoV8qeWzUAXO90c7j/JF9GwTzJ1vhGxBUXAOWIRxHTZ9LRgj/NhfijGdEF
 ITPQ==
X-Gm-Message-State: AJIora+CxIfwNu3HLjA5biVi+FZ3SeOhuwzqT0omtOctU8VI1t4HtaEX
 NurM2dh5lNM0reHxg3LQr64=
X-Google-Smtp-Source: AGRyM1t3Ibj4Df2AABzd5lExV+IuvW0Z5/no3gYeUdmakdf2WWYAWpFt50+rFEn9NLr1f5qa4Fdyvw==
X-Received: by 2002:a17:906:9b8a:b0:722:e6e0:33d with SMTP id
 dd10-20020a1709069b8a00b00722e6e0033dmr1823529ejc.317.1657694298802; 
 Tue, 12 Jul 2022 23:38:18 -0700 (PDT)
Received: from einstein.dilieto.eu (smtp.dilieto.eu. [188.68.43.228])
 by smtp.gmail.com with ESMTPSA id
 d6-20020a056402144600b004316f94ec4esm7268430edx.66.2022.07.12.23.38.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 23:38:18 -0700 (PDT)
Date: Wed, 13 Jul 2022 08:38:15 +0200
From: Nicola Di Lieto <nicola.dilieto@gmail.com>
To: Baruch Siach <baruch@tkos.co.il>
Message-ID: <Ys5oV/gCnSknmvtJ@einstein.dilieto.eu>
References: <d88aa72dcbbcbf5988e643e3ecd0a49e1a455d94.1654802516.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d88aa72dcbbcbf5988e643e3ecd0a49e1a455d94.1654802516.git.baruch@tkos.co.il>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6ctomdul2JDx+YcdicyW3WXjkih0UKJtkejZLU2wPMc=;
 b=iXyqJcknb7T15KuMUJgRGT+iWW9yFyjHVj0pwFhpt0CwVkdQL4st7m99Ka3aQFFogU
 HiBcl0vv9HwXztxLMHKTvoqz4u2ZWUNlNX60jZb9CQ05+LMzTDYKUX7A+iiv/6Fi/9qU
 OESHP9kkJYd+VoE9WcuHphujDJ4FrdMnwpnvoOD2GmiU6RwFKde2dBaobhGs3YXSbbPN
 htDp+BJu9aODVvsr3r3oiytjMGwJtDC7//D53b8JZkIm3hHSefsQjTUHWfTejXl69QoK
 iZKP4Qv5coGQqEmZNH2XprQ12b/CFIpC0ZXeYPRG9VJ2yW6S6R/EIOWxzbGPWbiQv7Mg
 7TcQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=iXyqJckn
Subject: Re: [Buildroot] [RFC PATCH] package/uacme: requires TLS support in
 libcurl
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
Cc: buildroot@busybox.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

I am afraid this won't work because unlike curl, uacme only supports 
OpenSSL, GnuTLS and mbedTLS. If either BearSSL or WolfSSL are chosen as 
the SSL library, uacme will fail at configure stage.

On Thu, Jun 09, 2022 at 10:21:56PM +0300, Baruch Siach wrote:
>uacme configure script fails when libcurl does not support TLS. This
>means that BR2_PACKAGE_LIBCURL_TLS_NONE is incompatible with uacme. But
>there is no way to change the choice to something other than
>BR2_PACKAGE_LIBCURL_TLS_NONE. So instead make uacme depend on libcurl
>and !BR2_PACKAGE_LIBCURL_TLS_NONE.
>
>As a result we can no longer select BR2_PACKAGE_OPENSSL since it causes
>recursive dependency. The existence of encryption library is implied
>when !BR2_PACKAGE_LIBCURL_TLS_NONE. So we can drop that 'select'
>entirely.
>
>Fixes:
>http://autobuild.buildroot.net/results/4e16f1d958ac3d30e26e7f17bdffc47834b0e2bd/
>http://autobuild.buildroot.net/results/4e16f1d958ac3d30e26e7f17bdffc47834b0e2bd/
>http://autobuild.buildroot.net/results/25280409b32282b4dd40b1e88127051439380f3d/
>
>Cc: Nicola Di Lieto <nicola.dilieto@gmail.com>
>Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>---
> package/uacme/Config.in | 7 +++++--
> 1 file changed, 5 insertions(+), 2 deletions(-)
>
>diff --git a/package/uacme/Config.in b/package/uacme/Config.in
>index d69343611557..4b20cbcdfe4b 100644
>--- a/package/uacme/Config.in
>+++ b/package/uacme/Config.in
>@@ -1,8 +1,7 @@
> config BR2_PACKAGE_UACME
> 	bool "uacme"
> 	depends on BR2_USE_MMU # fork()
>-	select BR2_PACKAGE_OPENSSL if !(BR2_PACKAGE_GNUTLS || BR2_PACKAGE_MBEDTLS)
>-	select BR2_PACKAGE_LIBCURL
>+	depends on BR2_PACKAGE_LIBCURL && !BR2_PACKAGE_LIBCURL_TLS_NONE
> 	help
> 	  uacme is a client for the ACMEv2 protocol described in
> 	  RFC8555, written in plain C with minimal dependencies
>@@ -14,6 +13,10 @@ config BR2_PACKAGE_UACME
>
> 	  https://github.com/ndilieto/uacme
>
>+comment "uacme needs libcurl with TLS support"
>+	depends on BR2_USE_MMU
>+	depends on !BR2_PACKAGE_LIBCURL || BR2_PACKAGE_LIBCURL_TLS_NONE
>+
> if BR2_PACKAGE_UACME
>
> config BR2_PACKAGE_UACME_UALPN
>-- 
>2.35.1
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
