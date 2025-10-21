Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF1ACCD184
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 17:27:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4964A4065C;
	Tue, 21 Oct 2025 17:27:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OH4NovqjdeoK; Tue, 21 Oct 2025 17:27:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BFBC40642
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BFBC40642;
	Tue, 21 Oct 2025 17:27:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 216B870A
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 17:27:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 12FC860900
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 17:27:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dtpkPyHSEdj9 for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 17:27:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 601F06072F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 601F06072F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 601F06072F
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 17:26:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a021f.dip0.t-ipconnect.de [91.58.2.31])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CEDD4A4C2D81
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 19:26:55 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40640)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1vBG8N-000000007Yi-3ivv
 for buildroot@buildroot.org; Tue, 21 Oct 2025 17:26:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 21 Oct 2025 19:26:55 +0200
Message-ID: <20251021172655.3584823-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1761067615;
 bh=N1FWdbcHFE1qwqfglF/nCRFrc7kB+1WP+qYJaztMoTI=;
 h=From:To:Subject:Date:From;
 b=mC3mUTJFlrZw7pvuYuQ5etxkKit5tfXGFj9taLKPy86T5aWUGKC2meRzmsdqQQ3QA
 BDpgjzbaRflC8MPPSvoZ6b/1ecUWcT1qYK1v+lxawr7pu2JeWQ2COjH1oyp+cFN/lE
 WjTKPwwGaBqKpSGoAzNe3QOJxC+adLnbVBc6NiIJWe0obCZcQhEOx6/VldGQk4TOLs
 9zZmwmJwo/xZTl5G3EF6m/CKgJoLOFYZpSlHrjlWCitlhtwII+V4zx0bLHI4pJxEAd
 9Dj3BR9fuIUiqe+Qxmq06/fo/ia8yKxAm7mpm/tShUh3d1Y7lFGta6Y2EQBLnjVigl
 AWWeVX2ENTdng==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=mC3mUTJF
Subject: [Buildroot] [PATCH 1/1] package/dovecot: Fix build with icu 76.1
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

Buildroot commit dcee99507c6767230fd1faeeefe95f5662eb03a3 bumped icu
from version 73-2 to 77-1 causing a build error during linking.

Upstream is not expected to backport this patch to 2.3.x:
https://dovecot.org/mailman3/archives/list/dovecot@dovecot.org/thread/VT7D6XWB5ZRL7KIER445D3JR464CALPU/

Fixes:
https://autobuild.buildroot.org/results/94fc2de03b5d6afd32c457be7faf0ac06cc37212/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...onfigure-Explicitly-check-for-icu-uc.patch | 28 +++++++++++++++++++
 package/dovecot/dovecot.mk                    |  4 +++
 2 files changed, 32 insertions(+)
 create mode 100644 package/dovecot/0002-configure-Explicitly-check-for-icu-uc.patch

diff --git a/package/dovecot/0002-configure-Explicitly-check-for-icu-uc.patch b/package/dovecot/0002-configure-Explicitly-check-for-icu-uc.patch
new file mode 100644
index 0000000000..ea9aecebde
--- /dev/null
+++ b/package/dovecot/0002-configure-Explicitly-check-for-icu-uc.patch
@@ -0,0 +1,28 @@
+From 1ccd5b54a408d12fce0c94ab0bbaedbb5ef69830 Mon Sep 17 00:00:00 2001
+From: fundawang <fundawang@yeah.net>
+Date: Sun, 27 Oct 2024 22:11:21 +0800
+Subject: [PATCH] configure: Explicitly check for icu-uc
+
+Ensure we link against libicu-uc when it's split in v76.
+
+Upstream: https://github.com/dovecot/core/commit/1ccd5b54a408d12fce0c94ab0bbaedbb5ef69830
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[Bernd: backported to version 2.3.21.1]
+---
+ m4/want_icu.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/m4/want_icu.m4 b/m4/want_icu.m4
+index b656ef9f479..405a73b361f 100644
+--- a/m4/want_icu.m4
++++ b/m4/want_icu.m4
+@@ -1,7 +1,7 @@
+ AC_DEFUN([DOVECOT_WANT_ICU], [
+   if test "$want_icu" != "no"; then
+     if test "$PKG_CONFIG" != "" && $PKG_CONFIG --exists icu-i18n 2>/dev/null; then
+-      PKG_CHECK_MODULES(LIBICU, icu-i18n)
++      PKG_CHECK_MODULES(LIBICU, icu-i18n icu-uc)
+       have_icu=yes
+       AC_DEFINE(HAVE_LIBICU,, [Define if you want ICU normalization support for FTS])
+     elif test "$want_icu" = "yes"; then
diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index a48cd7536d..6612787a94 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -12,7 +12,11 @@ DOVECOT_LICENSE = LGPL-2.1, MIT, Public Domain, BSD-3-Clause, Unicode-DFS-2015
 DOVECOT_LICENSE_FILES = COPYING COPYING.LGPL COPYING.MIT
 DOVECOT_CPE_ID_VENDOR = dovecot
 DOVECOT_SELINUX_MODULES = dovecot
+DOVECOT_AUTORECONF = YES
+
+# add host-gettext for AM_ICONV macro needed for autoreconf
 DOVECOT_DEPENDENCIES = \
+	host-gettext \
 	host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
 	openssl
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
