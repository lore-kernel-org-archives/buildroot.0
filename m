Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF7A4EDEBEC
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 20:02:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74BBE606D9;
	Tue,  3 Mar 2026 20:02:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uG4bIOhf65Mk; Tue,  3 Mar 2026 20:02:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 474DD6060D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772568127;
	bh=AMQn9gtcXsCVsW2RntO4ZEr0ifUPGMhhoz0QRIu5MUg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=SPm9ru5Xqa2F9Wj8UFXKD7VXayO5q/aaU7HgmKg4TcUoRSICnu45Uh/S4Ib35Wznf
	 z5YQRAzk4dFAEQoKPiA48hkSRB4ej+tq6RJ4dD7i+nKQF+IW1XoNpFZhOTaqXm6Lmj
	 VNqYiEUgIADknFp+8YSpX4IVpRRK2N79GDsXNfN2wsvkE1kj9TUun+fzuyug1lsxhC
	 AVlR+iEnNf74Nb6M37vjiNhhSYZ3UQBlMkkyBxw196wf9XYINl/r76j7mp4O2LnRuF
	 GfyGo/pwLex1r/z2f0DinEE2GylxwfbUL61LYWY5qXFRjETiUUyriLAIt4O41OGciU
	 9mmC4Y6/GcfsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 474DD6060D;
	Tue,  3 Mar 2026 20:02:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CA64025B
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B04E5810E2
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:02:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tu2Zl5oOoaAU for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 20:02:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 962FE8100A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 962FE8100A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 962FE8100A
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:02:04 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a04ca.dip0.t-ipconnect.de [91.58.4.202])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 32A5EA4C3406;
 Tue,  3 Mar 2026 21:01:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53148)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vxVvL-000000003gI-3TmR;
 Tue, 03 Mar 2026 20:00:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  3 Mar 2026 21:00:45 +0100
Message-ID: <20260303200054.784253-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260303200054.784253-1-bernd@kuhls.net>
References: <20260303200054.784253-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772568062;
 bh=FOJ3lAcCfJ2Dyu0pQytA3C5DKJ2C+DKsxKKxOUwiP20=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=puuO+21SbnGDNAuFIgNhp64nVJy+HgIb7ZhXhLNs7R5sYO9Bp5Mhy3VNz3mZrIIdU
 N4U1MtcP8l9WEBe2SQpJdI4k466+EveUx9rgr4Yh2EWou11oUOJ9NkRfX/YdAiO27x
 fKhih6Ing2hQfzzDtdEN5E4HtuzvOzFlGENqE8Iq+PwzqVaEtLp0OiTcJD7nx+a4YP
 fBQYv68Q9qhkp5RwyBudw2BeofGWLDYhiZiHPSelJb5tfOjq/03qS7T9dkKTsnxkI+
 g67Tmju5EvV/kVaFlDHM3Rs8/b5AxoegBaeMtgz9AePyjUvpM77KPqX1hbYxjr3zch
 xPwbefyPkcO0A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=puuO+21S
Subject: [Buildroot] [PATCH/next 06/14] package/ntp: fix build with glibc
 2.43
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
Cc: =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Pieter De Gendt <pieter.degendt@gmail.com>, Petr Vorel <petr.vorel@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

sntp/crypto.c includes sntp/config.h, then sntp/crypto.h which includes
ntp_stdlib.h which in turn includes l_stdlib.h that contains

  #ifndef HAVE_MEMCHR
  extern void *memchr(const void *s, int c, size_t n);
  #endif

and breaks the build with glibc 2.43.

sntp/config.h does not contain any information about memchr() while the
top-level config.h does but this top-level config.h is not included
because sntp/Makefile lacks -I$(top_builddir) so sntp/config.h gets
included which does not define HAVE_MEMCHR although glibc does provide
memchr() but sntp/configure lacks a check for memchr().

This was not a problem with previous glibc versions but due to recent
C23 changes in glibc the ntp build is now broken.

To fix the problem we add a configure check for memchr() to
sntp/configure so HAVE_MEMCHR gets defined in sntp/config.h.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ntp/0007-memchr.patch | 42 +++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/ntp/0007-memchr.patch

diff --git a/package/ntp/0007-memchr.patch b/package/ntp/0007-memchr.patch
new file mode 100644
index 0000000000..a9c21042be
--- /dev/null
+++ b/package/ntp/0007-memchr.patch
@@ -0,0 +1,42 @@
+Fix build with glibc 2.43
+
+sntp/crypto.c includes sntp/config.h, then sntp/crypto.h which includes
+ntp_stdlib.h which in turn includes l_stdlib.h that contains
+
+  #ifndef HAVE_MEMCHR
+  extern void *memchr(const void *s, int c, size_t n);
+  #endif
+
+and breaks the build with glibc 2.43:
+
+./../include/l_stdlib.h:225:14: error: expected identifier or '(' before '_Generic'
+  225 | extern void *memchr(const void *s, int c, size_t n);
+
+sntp/config.h does not contain any information about memchr() while the
+top-level config.h does but this top-level config.h is not included
+because sntp/Makefile lacks -I$(top_builddir) so sntp/config.h gets
+included which does not define HAVE_MEMCHR although glibc does provide
+memchr() but sntp/configure lacks a check for memchr().
+
+This was not a problem with previous glibc versions but due to recent
+C23 changes in glibc the ntp build is now broken.
+
+To fix the problem we add a configure check for memchr() to
+sntp/configure so HAVE_MEMCHR gets defined in sntp/config.h.
+
+Upstream: https://bugs.ntp.org/show_bug.cgi?id=4015
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+diff -uNr ntp-4.2.8p18/sntp/m4/ntp_libntp.m4 ntp-4.2.8p18/sntp/m4/ntp_libntp.m4
+--- ntp-4.2.8p18/sntp/m4/ntp_libntp.m4	2024-05-07 13:21:13.000000000 +0200
++++ ntp-4.2.8p18/sntp/m4/ntp_libntp.m4	2026-02-19 21:50:37.291724180 +0100
+@@ -77,7 +77,7 @@
+     ;;
+ esac
+ 
+-AC_CHECK_FUNCS([getclock stime timegm strlcpy strlcat])
++AC_CHECK_FUNCS([getclock memchr stime timegm strlcpy strlcat])
+ 
+ # Bug 2713
+ LDADD_LIBUTIL=
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
