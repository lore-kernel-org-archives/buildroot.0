Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD10CD98F2
	for <buildroot@archiver.kernel.org>; Sat, 20 Jun 2026 18:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 263256F967;
	Sat, 20 Jun 2026 18:47:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cJWg0NHdVbvO; Sat, 20 Jun 2026 18:47:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 590FA6F954
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781981227;
	bh=5V3ZyRmhQK4TWe5BV9BpARl6cdJtkH0Me/UqTmhYA08=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=b/RPf66sOnPXDXs+Xp7oR8M718aflYxqs6NPNFBuDVDIVRVGVO+y6tL/0hu92XBrj
	 6Kns3jEXuoc0ZBfAg77qJpYtthFZl9/zXsanLR5d6vLfgrFQqd1dN8y18C4pixdNYO
	 kYgu6HunPJ2SpShm2f88L1TZ1GcHTKi4FeoUwPzOVqxZncylSfltN85CEIDI0Wzy09
	 7henDk2uXysOupeOyd2BgvplhpbtavAMVo8BY1wt9HO1e7JdfCenBMd5HZxlVSvKrz
	 x5fwUfQeD1kTwI0mR/TaEkqSFcUrjvEPgxmgYxay0jaFRGAJ8oSQRy5P0D9c91+D5F
	 yHS+UYgOCJE2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 590FA6F954;
	Sat, 20 Jun 2026 18:47:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9461E2D7
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 18:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91C004EBD4
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 18:47:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vdSPuxg_Sp8A for <buildroot@buildroot.org>;
 Sat, 20 Jun 2026 18:47:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2A1C84EB7C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A1C84EB7C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2A1C84EB7C
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 18:47:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c132.dip0.t-ipconnect.de [79.214.193.50])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A73EBA4C11F8;
 Sat, 20 Jun 2026 20:47:00 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35450)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wb0iR-000000006lm-0lJo;
 Sat, 20 Jun 2026 18:47:00 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sat, 20 Jun 2026 20:46:51 +0200
Message-ID: <20260620184651.3823451-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1781981220;
 bh=atpOOjJoYhZjlmvJG8pSEhpWDBfMUhOmnBYPiNrPRQ4=;
 h=From:To:Cc:Subject:Date:From;
 b=Xo+bTheMIpJtdzTTHYPYb0i+Ok88pv21skh9uhEFCmT5UX1ppuDyXhqFUbpYEtVqg
 1hPprIWochd5CK6JbtCr2Yf4I4HRiTUthJh/ePTRmb2ivwQx5u5+XYWacdsgqqvpiW
 x80JIN1EM/pE+p1hPDUhHhYQK+k0FD8PXKoA/7mAB6szv6kilJm9txA4EkwmDpAAzb
 9h6f5bs35MjetzOJcjRM35r+uAGMC86uCDiL4Tmgxvj/kGrmoRIrnwSjSMB5bL4/dL
 AscUNTIKT7/s4ML06lwMBKkE4OccIs0r+wgyGeQExAl1prndID4p2dQETJlV4+R2Qe
 IbiMfLvYz2n4A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Xo+bTheM
Subject: [Buildroot] [PATCH 1/1] package/util-linux: allow musl build for
 login/runuser/su
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

Buildroot commit f89ca996b6deb660b53c33196b8b309fac659bf9 fixed the
build of linux-pam with musl in 2020 but did not remove the restric-
tions in place for login/runuser/su which were added earlier with
these commits:

login (2015): 25ecd24579f293ef4fcc6847094c4af39f4113af
runuser (2017): 09860f354ae0824cfead384e994d3f119e22b851
su (2017): c6488923fb785ac11f6ec78e53db5da22203b178

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/commits/75fbf2c4a4cb132b66c59560f0470ebc063416fc

 package/util-linux/Config.in | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index c63cec2a9c..df7435e71a 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -210,17 +210,15 @@ config BR2_PACKAGE_UTIL_LINUX_LOGIN
 	depends on BR2_ENABLE_LOCALE # linux-pam
 	depends on BR2_USE_WCHAR # linux-pam
 	depends on !BR2_STATIC_LIBS # linux-pam
-	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
 	depends on BR2_USE_MMU # fork(), linux-pam
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # linux-pam
 	select BR2_PACKAGE_LINUX_PAM
 	help
 	  Begin a session on the system
 
-comment "login needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library, gcc >= 4.9"
+comment "login needs a toolchain w/ wchar, locale, dynamic library, gcc >= 4.9"
 	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
 		|| BR2_STATIC_LIBS \
-		|| BR2_TOOLCHAIN_USES_MUSL \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_UTIL_LINUX_LOSETUP
@@ -366,7 +364,6 @@ config BR2_PACKAGE_UTIL_LINUX_RUNUSER
 	bool "runuser"
 	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR) # linux-pam
 	depends on !BR2_STATIC_LIBS
-	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
 	depends on BR2_USE_MMU # fork(), linux-pam
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # linux-pam
 	select BR2_PACKAGE_LINUX_PAM
@@ -375,10 +372,9 @@ config BR2_PACKAGE_UTIL_LINUX_RUNUSER
 	  to ask for a password, because it may be executed by the root
 	  user only)
 
-comment "runuser needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library, gcc >= 4.9"
+comment "runuser needs a toolchain w/ wchar, locale, dynamic library, gcc >= 4.9"
 	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
 		|| BR2_STATIC_LIBS \
-		|| BR2_TOOLCHAIN_USES_MUSL \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS
@@ -411,17 +407,15 @@ config BR2_PACKAGE_UTIL_LINUX_SU
 	bool "su"
 	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR) # linux-pam
 	depends on !BR2_STATIC_LIBS
-	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
 	depends on BR2_USE_MMU # fork(), linux-pam
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # linux-pam
 	select BR2_PACKAGE_LINUX_PAM
 	help
 	  Run a command with substitute user and group ID
 
-comment "su needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library, gcc >= 4.9"
+comment "su needs a toolchain w/ wchar, locale, dynamic library, gcc >= 4.9"
 	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
 		|| BR2_STATIC_LIBS \
-		|| BR2_TOOLCHAIN_USES_MUSL \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_UTIL_LINUX_SULOGIN
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
