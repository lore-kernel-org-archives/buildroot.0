Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D885C43458
	for <buildroot@archiver.kernel.org>; Mon, 29 Jun 2026 02:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B300C81246;
	Mon, 29 Jun 2026 02:12:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kDOpD13rS1CD; Mon, 29 Jun 2026 02:12:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C23E081230
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782699162;
	bh=EiHieLqMpqFdkC055OHXSv28mbQtYPnR0W4lhXU+8ts=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=VEFDiYsiStCZ/gvKRQLhSTUDFSoYeDsyMJPKiDVOE0FFvsLurSsuvTwOI8Ih3doZZ
	 C8dN0ZcDs3QfESXK9ficT1R/TaQ8rJgGDe5vnxfM5/YjWknopCMVC5o+vOAJmfa60a
	 p0cGRw33e/ZnL3Ry7BzEHehpPGfiW704rXljvN0HmlOvWpbfWAuOstzr5+uTEc49at
	 LaQAhpbvssVEQx9z6k4JuGk+nj76wAkS7Eg+dJc4EhOOscrvHwlBR+m7qnwN6tqMYG
	 OI16KyppH/GEOsu5fEf14FeJhlxP6gigDxy+fDE1B+k4XeCrNChbtl6/A8YssNN5aJ
	 +mxP+/yEatlMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C23E081230;
	Mon, 29 Jun 2026 02:12:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D44D2F3
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 02:12:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7AEDE81230
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 02:12:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vz8-xR2GANqK for <buildroot@buildroot.org>;
 Mon, 29 Jun 2026 02:12:40 +0000 (UTC)
X-Greylist: delayed 329 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 29 Jun 2026 02:12:40 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5ED7E811AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5ED7E811AC
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=77.109.144.132;
 helo=mail.ott.net; envelope-from=stefan@ott.net; receiver=<UNKNOWN> 
Received: from mail.ott.net (mail.ott.net [77.109.144.132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5ED7E811AC
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 02:12:40 +0000 (UTC)
Received: from relay.zh.ott.net (relay.zh.ott.net [IPv6:fd53:c48b:8ee5::17:1])
 by mail.ott.net (Postfix) with ESMTPS id 179404020577;
 Mon, 29 Jun 2026 04:07:05 +0200 (CEST)
Received: by relay.zh.ott.net (OpenSMTPD) with ESMTPS id 1294d115
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:YES); 
 Mon, 29 Jun 2026 04:07:04 +0200 (CEST)
Received: from localhost (mort [local])
 by mort (OpenSMTPD) with ESMTPA id def19861;
 Mon, 29 Jun 2026 02:06:58 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
	Stefan Ott <stefan@ott.net>
Date: Mon, 29 Jun 2026 04:06:36 +0200
Message-ID: <20260629020636.4066911-1-stefan@ott.net>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ott.net; s=onbz5; 
 t=1782698825; bh=WTwtrCssNqOGPefP/6AqF8y6DpC4fucHMF2VZoXr0A8=;
 h=From:To:Cc:Subject:Date:From;
 b=G5IRA/fNL1cx1afVg2VuVPj/QaGWGrg+1g7+xKfdwUrBFTp7RLqabSiU19suPmnGm
 uHMhgxoAib7G0HJ5nNqsQgsjldd8euX6AbVkOvgTb3a80hj9x9Qg2QZDEnOY0W9R4n
 L4si6sNxOMJyKCaHpG1UwenPyX1oae2QUSv85a1zf3ITH/KbV/5ngBNHznH/QjxfvF
 gPZbvkGd2ZCQz3XW4HCcwqFJpdOmGpy2afVc4M25Cd+oTNadz1j1rhgVUWD162Jbdu
 huJMEBfHoPxWEQc09lGebtyZ+E8VucmW5gAf7MTfFWyPeCbonw2ICrROZvJKncn+mo
 mFNmlmJSJDc3Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=ott.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=ott.net header.i=@ott.net header.a=rsa-sha256
 header.s=onbz5 header.b=G5IRA/fN
Subject: [Buildroot] [PATCH 1/1] package/libcec: Add option to use kernel
 framework
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Stefan Ott via buildroot <buildroot@buildroot.org>
Reply-To: Stefan Ott <stefan@ott.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As explained in libcec's README.raspberrypi.md:

  On a recent Raspberry Pi that's using the vc4_kms_3d dtoverlay,
  you have to use the Linux Kernel driver and disable the Raspberry Pi
  driver with -DHAVE_RPI_API=0 to use CEC.

This patch adds an option to do just that to the libcec package.

Signed-off-by: Stefan Ott <stefan@ott.net>
---
 package/libcec/Config.in | 9 +++++++++
 package/libcec/libcec.mk | 6 ++++++
 2 files changed, 15 insertions(+)

diff --git a/package/libcec/Config.in b/package/libcec/Config.in
index 2dddc53635..136891a6e3 100644
--- a/package/libcec/Config.in
+++ b/package/libcec/Config.in
@@ -13,6 +13,15 @@ config BR2_PACKAGE_LIBCEC
 
 	  http://libcec.pulse-eight.com
 
+config BR2_PACKAGE_LIBCEC_LINUX_API
+	bool "enable Linux kernel CEC framework support"
+	default y if BR2_arm || BR2_aarch64
+	depends on BR2_PACKAGE_LIBCEC
+	help
+	  enable modern Linux Kernel CEC Framework support
+
+	  This is needed to use CEC on the Raspberry Pi
+
 comment "libcec needs a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 4.7"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
index 0e730503da..f7c5bce204 100644
--- a/package/libcec/libcec.mk
+++ b/package/libcec/libcec.mk
@@ -24,6 +24,12 @@ ifeq ($(BR2_PACKAGE_XLIB_LIBXRANDR),y)
 LIBCEC_DEPENDENCIES += xlib_libXrandr
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCEC_LINUX_API),y)
+LIBCEC_CONF_OPTS += \
+	-DHAVE_RPI_API=0 \
+	-DHAVE_LINUX_API=1
+endif
+
 # Disable information about how libCEC is compiled.
 LIBCEC_CONF_OPTS += -DHAVE_GIT_BIN="" \
 	-DHAVE_WHOAMI_BIN="" \
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
