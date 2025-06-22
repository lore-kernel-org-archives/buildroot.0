Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D74BC7115D
	for <buildroot@archiver.kernel.org>; Sun, 22 Jun 2025 17:37:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62EFD411FF;
	Sun, 22 Jun 2025 17:37:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xCVmpBiUWeQh; Sun, 22 Jun 2025 17:37:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35B7140E09
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35B7140E09;
	Sun, 22 Jun 2025 17:37:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A3CEB12C
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 17:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A06E816FD
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 17:37:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Me8KTP2iraPa for <buildroot@buildroot.org>;
 Sun, 22 Jun 2025 17:37:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5C8C9816FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C8C9816FA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C8C9816FA
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 17:37:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0bd3.dip0.t-ipconnect.de [91.58.11.211])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 89832A4C0F37;
 Sun, 22 Jun 2025 19:36:57 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34084)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uTOci-000000000EQ-2hNL;
 Sun, 22 Jun 2025 17:36:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sun, 22 Jun 2025 19:36:55 +0200
Message-Id: <20250622173655.2741255-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1750613817;
 bh=En+lSLw1cc87bYrz8l8Ak/5zPWEGM4BMdAsPflTrMVo=;
 h=From:To:Cc:Subject:Date:From;
 b=GK3UKQc+OTaTllb5J06pubek2CQybpz1MPj/szKzpnx1BrPi8zmxJzjb55GvKV6n4
 a8AP9LMrnJKaKGdT4AIiH5PwDeMM3PxuIsmamo2zlWA2mmD7JvwxPl4vy6KFGr9/QL
 ttalD/L3ReQdmcl2PLGmdn/OOcdr5MHuPgK0VnaoqUKIFCBZZMKqfFDimWZ2unKTwT
 Qi1SVsQvIRVbsnlM+sCd1KXoKCbIfTcfrbRCSOqqd3mfcbDeU59xcGZW9f9+nyfgvx
 My7qQtysBNhquivjCI13FidhvYO0H71WqdR/DPstJA6VBT/ON0c8tevqelUaWP0tGe
 0k6P6hEB5bIBw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=GK3UKQc+
Subject: [Buildroot] [PATCH v2 1/1] package/freeswitch: rework OpenCV4
 dependencies
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/commit/962081259d91fea1e9a59c1af85d9a85ba45d0dd

Fixes Kconfig warnings:

    WARNING: unmet direct dependencies detected for BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
      Depends on [n]: BR2_PACKAGE_OPENCV4 [=y] && !BR2_TOOLCHAIN_USES_UCLIBC [=n] && BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS [=n] && BR2_TOOLCHAIN_GCC_AT_LEAST_8 [=y]
      Selected by [y]:
      - BR2_PACKAGE_FREESWITCH [=y] && BR2_INSTALL_LIBSTDCPP [=y] && !BR2_STATIC_LIBS [=n] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_USE_MMU [=y] && BR2_USE_WCHAR [=y] && BR2_PACKAGE_OPENCV4 [=y]

Reported-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: instead of selecting packages we move the conditionals to the .mk
    file

 package/freeswitch/Config.in     | 3 ---
 package/freeswitch/freeswitch.mk | 2 +-
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/freeswitch/Config.in b/package/freeswitch/Config.in
index 4d700e549f..80d18e064d 100644
--- a/package/freeswitch/Config.in
+++ b/package/freeswitch/Config.in
@@ -14,9 +14,6 @@ config BR2_PACKAGE_FREESWITCH
 	select BR2_PACKAGE_OPENCV3_LIB_HIGHGUI if BR2_PACKAGE_OPENCV3
 	select BR2_PACKAGE_OPENCV3_LIB_IMGPROC if BR2_PACKAGE_OPENCV3
 	select BR2_PACKAGE_OPENCV3_LIB_OBJDETECT if BR2_PACKAGE_OPENCV3
-	select BR2_PACKAGE_OPENCV4_LIB_HIGHGUI if BR2_PACKAGE_OPENCV4
-	select BR2_PACKAGE_OPENCV4_LIB_IMGPROC if BR2_PACKAGE_OPENCV4
-	select BR2_PACKAGE_OPENCV4_LIB_OBJDETECT if BR2_PACKAGE_OPENCV4
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_SOFIA_SIP
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 02cbacab88..58ebc22298 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -283,7 +283,7 @@ FREESWITCH_DEPENDENCIES += opencv3
 FREESWITCH_ENABLED_MODULES += applications/mod_cv
 endif
 
-ifeq ($(BR2_PACKAGE_OPENCV4),y)
+ifeq ($(BR2_PACKAGE_OPENCV4_LIB_HIGHGUI)$(BR2_PACKAGE_OPENCV4_LIB_IMGPROC)$(BR2_PACKAGE_OPENCV4_LIB_OBJDETECT),yyy)
 FREESWITCH_DEPENDENCIES += opencv4
 FREESWITCH_ENABLED_MODULES += applications/mod_cv
 endif
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
