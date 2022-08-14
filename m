Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A002C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 23:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C046781991;
	Sun, 14 Aug 2022 23:44:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C046781991
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id brArJ_pGpEZL; Sun, 14 Aug 2022 23:44:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 068558186E;
	Sun, 14 Aug 2022 23:43:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 068558186E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 594CF1BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3499860E27
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:40:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3499860E27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jDGcLUqoGCNR for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 23:40:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95FBF60C09
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 95FBF60C09
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 23:40:14 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id k2so5839017vsk.8
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 16:40:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=up0YvfafiPzLFonkxWJkvhswg4oQu/oysH4FUX38kPY=;
 b=lljyGywxkccgOamm6k1sGAgwonajYVrLOfYYcCSVMJ6AgOJh2H/UprZS8XaGMpNswu
 VnAdJsbJvHxK3z/u6B4qdOuhuzb73uQIlBVunLGEIpsVCB6OTTFjlALSaI4gi2MoMSS8
 dCHS6UM5zOApwpBiMxzm9XABrceEk0IcCCOU2+OdoUsT7im1jWtFXbTF0Lsf19eWRXSh
 gYXxrVZ71ka7KdzmEfHoGheELNKo8JSPqNpgnx3Ht+0bthJN7z838pQBmV9oHeChDvUP
 3K8E0mWOjNwCI9gGApv8MpocevM9Ad2yzdHxdV7vltMZI0SpTj8TyM6C7N0SlXkNporl
 z+iQ==
X-Gm-Message-State: ACgBeo1IX/TtUbqd0bmdFMUeeh+/Uca6dXytZUvU3HSH6Ij/kCLdRuoI
 0e6vDFO6H3KJkefdDoPwXtloYVYewlg=
X-Google-Smtp-Source: AA6agR5ztamttwc/UgGZGVFH1fZucURDi60/xmAuK22Hc3S/oxaDvF5a93cmBRsp/hAwBketeJXHBg==
X-Received: by 2002:a67:e149:0:b0:388:470e:f716 with SMTP id
 o9-20020a67e149000000b00388470ef716mr5540371vsl.77.1660520413490; 
 Sun, 14 Aug 2022 16:40:13 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 z15-20020ab020cf000000b0038342b58f6csm4037769ual.17.2022.08.14.16.40.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 16:40:12 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 20:38:34 -0300
Message-Id: <20220814233845.2247022-23-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
References: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=up0YvfafiPzLFonkxWJkvhswg4oQu/oysH4FUX38kPY=;
 b=gdQKAXIqCULyMdXB8buVQRDqZTmW8v1dqLOr8VKmyFmb7LkzYFnrcFNBdtlLo0hWkJ
 /9hPSSgw8cm49C4sIPxMMIdO0w2MIBebovhPGufaYyVUalBD1IpUleOxMS3mcv+5aFgy
 N9Z3AUHLE6mhbCL5+fZIt+o/ZBCszQrKbqO4UAuP0KU3HTpCcjRF/d19T43PtvnOLLme
 xqdR+jYPmNM8jWN7RgeJmoEckwbhYI7V+FgVidcSZ9S2ZkfQFvuSCAuVratgFGqvlUDR
 uaGOE1b3cOxTucPfkbreQchLeUczMl5YvoLjhOEH6d9SP4PhLeev0hNTxzYfK6T4P0fo
 zdNw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=gdQKAXIq
Subject: [Buildroot] [PATCH 22/33] package/gstreamer1/gst1-plugins-bad: fix
 typo on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The typo was added by commit 'bad657ddfc openal: fix atomic handling' from
2016.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index cd5a2c7b11..bcb4cb1545 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -527,11 +527,11 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENAL
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	depends on BR2_PAKCAGE_OPENAL_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 	select BR2_PACKAGE_OPENAL
 
 comment "openal plugin needs a toolchain w/ NPTL, C++, gcc >= 4.9"
-	depends on BR2_PAKCAGE_OPENAL_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
 		|| !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
