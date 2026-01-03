Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 873EFFC617E
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 15:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2638E607DF;
	Sat,  3 Jan 2026 15:21:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7rApJzI2P9g2; Sat,  3 Jan 2026 15:21:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 375DB6083F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767453715;
	bh=wEWuqaN5oBCEB1YpOHs2SCjVuSBddXlLIBYgWr6tVa0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VkEe+ANYXPYlDPTAHryEVIZR7OBEDnXttxenBZ5wztfOjDY6purlrdzTCPN/0HS/b
	 v0Cebtt+CCTzeKobN2e2ay7q+iLIHH+3tLnBXrUj4uQrAWj09knJrmBtr3RHEIk6wn
	 KbPTw4ndCnmean36s3FbJ7JMM8FGglRsqfAIo26cSCHXEyqVDIH0p+LFUOAfBxwCB9
	 hxm2+fufqJqxPh+HYgKBD5GcgEcyNSGbUTMwquStlS1vHgqKG6WwvaR46MhviSVDBN
	 mUwoQQQUOStXL9OlCmZMJeBaEMQuERAUU9YE5fvH3E8i56/JddQDtvZDAX2s8zmAq6
	 hsSLE/8AfyMQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 375DB6083F;
	Sat,  3 Jan 2026 15:21:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C1A8249
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 15:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E4F440177
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 15:21:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZrbuNyzZDVYl for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 15:21:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3DCD540067
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DCD540067
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3DCD540067
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 15:21:52 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 75468A4C327E;
 Sat,  3 Jan 2026 16:21:50 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35110)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vc3Ru-000000004Pu-0HtH;
 Sat, 03 Jan 2026 15:21:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Mario Lang <mlang@blind.guru>
Date: Sat,  3 Jan 2026 16:21:50 +0100
Message-ID: <20260103152150.1127812-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767453710;
 bh=IbIryT1u1CoT7hmcI2hYSSdeQCeTL1O5ZOkf0BIJDRg=;
 h=From:To:Cc:Subject:Date:From;
 b=Ed+AA+uG2Vuiy0rsH3rZFZt8ZkMN6PVByDuScZZL6WuL6H3BFCFL0c9uLJVqlKP3R
 /QL6+bvFtpIIYSQutce2J3ocpBp49wZjTLU+pWKH0T9xyUvj4QiS95lGcSL3IC5smg
 53vyuBJjs8C0cd67AMLXOT38LsLQnBn5s7m+qN5dfepNXA481PXpXyn9d4CSXKlVDU
 6FYI2xXE0XARgycf9dt9tcJEEB5VCimFF2W4jkbelMY5+PsIVmQpXJAppJ65weRZWl
 pv3PS3xcCgnM1bzteNO8dSUht2u2B4LbK5iLlGbBDlga8SGMccVALFUPPCoT1qv2pA
 8CV7RX9Cs5Wbw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Ed+AA+uG
Subject: [Buildroot] [PATCH 1/1] package/brltty: fix musl build
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
https://autobuild.buildroot.net/results/76d/76d18437241d1281566b76ed1cec2ba99c3532da/

The build error was not introduced by the recent bump to 6.8. The oldest
build error with the previous brltty version 6.6 used in buildroot dates
back to 2023:
https://autobuild.buildroot.net/results/78a/78a7fe6edfb84c2b15fff32aa475c975ecd5bdbc/

and with brltty 6.4 to 2022:
https://autobuild.buildroot.net/results/a5b/a5b338ce9865fc7afaecd9b671e6a8f290548374/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0004-check-for-functions-inb-outb.patch   | 98 +++++++++++++++++++
 package/brltty/brltty.mk                      |  1 +
 2 files changed, 99 insertions(+)
 create mode 100644 package/brltty/0004-check-for-functions-inb-outb.patch

diff --git a/package/brltty/0004-check-for-functions-inb-outb.patch b/package/brltty/0004-check-for-functions-inb-outb.patch
new file mode 100644
index 0000000000..275f17ae3c
--- /dev/null
+++ b/package/brltty/0004-check-for-functions-inb-outb.patch
@@ -0,0 +1,98 @@
+From 876bdd3153c791a51422a43403143ff10acb6e82 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sat, 3 Jan 2026 15:35:48 +0100
+Subject: [PATCH] check for functions inb & outb
+
+Musl C library provides sys/io.h but inb and outb are missing on some
+archs. This patch adds a configure check ported from sane-backends:
+https://github.com/solanoalves/sane-backend/blob/059b97962ecb1b1ab068f524988d16c5b55bbd29/configure.ac#L314
+to fix build errors detected by buildroot autobuilders:
+https://autobuild.buildroot.net/results/76d/76d18437241d1281566b76ed1cec2ba99c3532da//build-end.log
+
+./ports_glibc.c: In function 'readPort1':
+./ports_glibc.c:54:10: error: implicit declaration of function 'inb' [-Wimplicit-function-declaration]
+   54 |   return inb(port);
+      |          ^~~
+./ports_glibc.c: In function 'writePort1':
+./ports_glibc.c:63:3: error: implicit declaration of function 'outb' [-Wimplicit-function-declaration]
+   63 |   outb(value, port);
+      |   ^~~~
+
+Upstream: https://github.com/brltty/brltty/pull/510
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ Programs/ports_glibc.c |  4 ++--
+ config.h.in            |  3 +++
+ configure.ac           | 19 +++++++++++++++++++
+ 3 files changed, 24 insertions(+), 2 deletions(-)
+
+diff --git a/Programs/ports_glibc.c b/Programs/ports_glibc.c
+index 4233f9ea0..4a57f626d 100644
+--- a/Programs/ports_glibc.c
++++ b/Programs/ports_glibc.c
+@@ -50,7 +50,7 @@ disablePorts (unsigned short int base, unsigned short int count) {
+ 
+ unsigned char
+ readPort1 (unsigned short int port) {
+-#ifdef HAVE_SYS_IO_H
++#ifdef BRLTTY_HAVE_SYS_IO_H_WITH_INB_OUTB
+   return inb(port);
+ #else /* HAVE_SYS_IO_H */
+   return 0;
+@@ -59,7 +59,7 @@ readPort1 (unsigned short int port) {
+ 
+ void
+ writePort1 (unsigned short int port, unsigned char value) {
+-#ifdef HAVE_SYS_IO_H
++#ifdef BRLTTY_HAVE_SYS_IO_H_WITH_INB_OUTB
+   outb(value, port);
+ #endif /* HAVE_SYS_IO_H */
+ }
+diff --git a/config.h.in b/config.h.in
+index 537d3af92..edea70cea 100644
+--- a/config.h.in
++++ b/config.h.in
+@@ -331,6 +331,9 @@ extern "C" {
+ /* Define this if the header file sys/io.h exists. */
+ #undef HAVE_SYS_IO_H
+ 
++/* Define to 1 if you have the <sys/io.h> providing inb,outb. */
++#undef BRLTTY_HAVE_SYS_IO_H_WITH_INB_OUTB
++
+ /* Define this if the header file sys/modem.h exists. */
+ #undef HAVE_SYS_MODEM_H
+ 
+diff --git a/configure.ac b/configure.ac
+index b78d482f6..0a2a70dd0 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -961,6 +961,25 @@ AC_CHECK_FUNCS([shmget shm_open])
+ AC_CHECK_FUNCS([getpeereid getpeerucred getzoneid])
+ AC_CHECK_FUNCS([mempcpy wmempcpy])
+ 
++dnl sys/io.h might provide ioperm but not inb,outb (like for
++dnl non i386/x32/x86_64 with musl libc)
++if test "${ac_cv_header_sys_io_h}" = "yes"; then
++  AC_MSG_CHECKING([for inb,outb (provided by sys/io.h)])
++  AC_LINK_IFELSE(
++    [AC_LANG_PROGRAM([[#include <sys/io.h>]],
++      [[inb(0);outb(0,0);]])],
++    [AC_MSG_RESULT([yes])
++      brltty_cv_have_sys_io_h_with_inb_outb="yes"],
++    [AC_MSG_RESULT([no])
++      brltty_cv_have_sys_io_h_with_inb_outb="no"
++      AC_MSG_WARN([sys/io.h does not provide inb,outb (non i386/x32/x86_64 arch?)])])
++  if test "$brltty_cv_have_sys_io_h_with_inb_outb" = "yes"; then
++    AC_DEFINE(BRLTTY_HAVE_SYS_IO_H_WITH_INB_OUTB, 1, [Define to 1 if you have the <sys/io.h> providing inb,outb.])
++  fi
++else
++  brltty_cv_have_sys_io_h_with_inb_outb="no"
++fi
++
+ case "${host_os}"
+ in
+    cygwin*|mingw*)
+-- 
+2.47.3
+
diff --git a/package/brltty/brltty.mk b/package/brltty/brltty.mk
index 5e24288cbb..4952210121 100644
--- a/package/brltty/brltty.mk
+++ b/package/brltty/brltty.mk
@@ -40,6 +40,7 @@ BRLTTY_CONF_OPTS = \
 # Autoreconf is needed because we're patching configure.ac in
 # 0001-Fix-linking-error-on-mips64el and
 # 0002-configure.ac-link-fv-driver-with-ltinfo-only-if-avai.
+# 0004-check-for-functions-inb-outb.patch
 # However, a plain autoreconf doesn't work, because this package
 # is only autoconf-based.
 define BRLTTY_AUTOCONF
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
