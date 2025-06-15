Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B729C71135
	for <buildroot@archiver.kernel.org>; Sun, 15 Jun 2025 16:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B148780E7B;
	Sun, 15 Jun 2025 16:16:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qMqkFFaKjy2C; Sun, 15 Jun 2025 16:16:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDC2380DD9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDC2380DD9;
	Sun, 15 Jun 2025 16:16:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D5502198
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 16:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB6FA80DCC
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 16:16:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jyY1QyCKZWl7 for <buildroot@buildroot.org>;
 Sun, 15 Jun 2025 16:16:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D269E80DD9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D269E80DD9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D269E80DD9
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 16:16:51 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a08ea.dip0.t-ipconnect.de [91.58.8.234])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D574EA4C0402
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 18:16:35 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51760)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uQq27-000000006MP-0BXS
 for buildroot@buildroot.org; Sun, 15 Jun 2025 16:16:35 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 15 Jun 2025 18:16:35 +0200
Message-Id: <20250615161635.2499294-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250615161635.2499294-1-bernd@kuhls.net>
References: <20250615161635.2499294-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1750004195;
 bh=vXS+k6SDKmV0bKt9zNXco6+44j+0fjygZvRb8+gJYb8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=C76X6n8PUukgmi6zt30w7hSyIM3xosvXpPbQPx661mtbDy8XKfWgh1DJ7MO6PuX0e
 MH7dqmpNWjdTWG3K5kx6fdNY1EGysniTlmQZ1g9/04OQdh0YH0vPQFl02z0tQdqdeX
 1gfsNHneIha+0/7vVQRzpFUx2YhDKlZtInHJm9UkbZP5F3hiekE6G4+h4zacWAkIuw
 uZcueG99xtwjDy8l3kMHg0j08WgY+NduEiylT1Riv6axOBa2f4t6zx27vp7NT+Mfcj
 bYS+pPPREiMQx9GYNSJvCT5rjAkMI4jqVeSQHOTciYXdKs3XODA+6M5yiqlzvnR8Y0
 gRTmjU7scQdhg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=C76X6n8P
Subject: [Buildroot] [PATCH 2/2] package/samba4: bump version to 4.22.2
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

Release notes:
https://www.samba.org/samba/history/samba-4.22.2.html
https://www.samba.org/samba/history/samba-4.22.1.html
https://www.samba.org/samba/history/samba-4.22.0.html

Rebased patch 0001 due to upstream commit
https://github.com/samba-team/samba/commit/4dbbfcb00401d7a797154c812587bfe2dda0aea1

An import of the host-python ssl module was added to wscript with commit
https://github.com/samba-team/samba/commit/549f67a9e655149b1ede7e2858836cb7811cc78c
Select BR2_PACKAGE_HOST_PYTHON3_SSL to provide the new dependency.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...d-find-pre-built-heimdal-build-tools-in-case-of-.patch | 8 ++++----
 package/samba4/Config.in                                  | 1 +
 package/samba4/samba4.hash                                | 4 ++--
 package/samba4/samba4.mk                                  | 2 +-
 4 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/samba4/0001-build-find-pre-built-heimdal-build-tools-in-case-of-.patch b/package/samba4/0001-build-find-pre-built-heimdal-build-tools-in-case-of-.patch
index eb0ea099b7..8d223e38a0 100644
--- a/package/samba4/0001-build-find-pre-built-heimdal-build-tools-in-case-of-.patch
+++ b/package/samba4/0001-build-find-pre-built-heimdal-build-tools-in-case-of-.patch
@@ -33,7 +33,7 @@ BUG: https://bugzilla.samba.org/show_bug.cgi?id=14164
 
 Signed-off-by: Uri Simchoni <uri@samba.org>
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
-[Bernd: rebased for version 4.11.13, 4.17.7 & 4.20.3]
+[Bernd: rebased for version 4.11.13, 4.17.7, 4.20.3 & 4.22.1]
 ---
  wscript_configure_embedded_heimdal | 11 +++++++++++
  wscript_configure_system_heimdal   | 11 -----------
@@ -43,10 +43,10 @@ diff --git a/wscript_configure_embedded_heimdal b/wscript_configure_embedded_hei
 index 8c55ae2..4fdae80 100644
 --- a/wscript_configure_embedded_heimdal
 +++ b/wscript_configure_embedded_heimdal
-@@ -13,3 +13,14 @@
- # when this will be available also in
- # system libraries...
+@@ -15,3 +15,14 @@
  conf.define('HAVE_CLIENT_GSS_C_CHANNEL_BOUND_FLAG', 1)
+ 
+ conf.define('HAVE_KRB5_INIT_CREDS_STEP', 1)
 +
 +def check_system_heimdal_binary(name):
 +    if conf.LIB_MAY_BE_BUNDLED(name):
diff --git a/package/samba4/Config.in b/package/samba4/Config.in
index 6aff82bb3d..6f3ff003a4 100644
--- a/package/samba4/Config.in
+++ b/package/samba4/Config.in
@@ -15,6 +15,7 @@ config BR2_PACKAGE_SAMBA4
 	select BR2_PACKAGE_CMOCKA
 	select BR2_PACKAGE_E2FSPROGS
 	select BR2_PACKAGE_GNUTLS
+	select BR2_PACKAGE_HOST_PYTHON3_SSL
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 6c4205853e..e80ad7a87d 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.21.6.tar.asc
-sha256  681bad60f57959436350751bc89e893b8c106ac882cc7420f93f419e1d188688  samba-4.21.6.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.22.2.tar.asc
+sha256  d9ac8e224a200159e62c651cf42307dc162212ec25d04eb6800b9a7ccfbcc3c1  samba-4.22.2.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 7ba0aa3346..e94ff1d441 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.21.6
+SAMBA4_VERSION = 4.22.2
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
