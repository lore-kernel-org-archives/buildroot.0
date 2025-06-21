Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD49C71157
	for <buildroot@archiver.kernel.org>; Sat, 21 Jun 2025 08:41:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A279F81A33;
	Sat, 21 Jun 2025 08:41:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dG7X3cFxjS4M; Sat, 21 Jun 2025 08:41:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADD0681F0D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADD0681F0D;
	Sat, 21 Jun 2025 08:41:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C2302E2
 for <buildroot@buildroot.org>; Sat, 21 Jun 2025 08:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3EAD410E4
 for <buildroot@buildroot.org>; Sat, 21 Jun 2025 08:41:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T8L7Y7PtXhu7 for <buildroot@buildroot.org>;
 Sat, 21 Jun 2025 08:41:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C250A40EC1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C250A40EC1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C250A40EC1
 for <buildroot@buildroot.org>; Sat, 21 Jun 2025 08:41:12 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b017.dip0.t-ipconnect.de [84.161.176.23])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CE519A4C2C55
 for <buildroot@buildroot.org>; Sat, 21 Jun 2025 10:40:42 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47132)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uStmE-000000002Ts-3ES8
 for buildroot@buildroot.org; Sat, 21 Jun 2025 08:40:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 21 Jun 2025 10:40:40 +0200
Message-Id: <20250621084042.376001-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1750495243;
 bh=5bj8LHqyXXgu0f1jUCWTKtjdQEPnjBsz2/ozLht1pGE=;
 h=From:To:Subject:Date:From;
 b=MgM/5wCQQ5NNWyi27sjO698u51TML53aF1xafMpja0eMZ3ESVEW5+NZ5qV/Vrpkth
 CW9GTet9dCwxb92onyaL9P6la6x1dlc2JT437G1f8TwI+B8ybruMOSyO0T9cC69hp/
 lBuQX6GvUDvI/6N0nnDll0jSzKCIRrE664ALEBu76HhjUYpgEIxPi7B/buFbGl0YhR
 9Rr8xbJnskuy1Bmwk2i3gTurMu7Qus2yUARWzzxYy6HatdtyQ3YmoUMPUDrjbfOgBW
 3pHhnMd7mL46hYt5HxBcKiJwB8PCltoP2vxzeLHAFhesbuPZRBKZwr48qpqH3t8QUO
 jBDi5u1IytUrQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=MgM/5wCQ
Subject: [Buildroot] [PATCH 1/3] package/ntp: link with -latomic if needed
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

Adding "-latomic" to $LIBS in the environment of the configure script
fails due to $LIBS being reset in ntp_libntp.m4, line 18.
To fix the build error a new configure option is needed.

Fixes:
https://autobuild.buildroot.org/results/261e630f20dd20b7f606a7bcbd8fa7b50ce82fbe/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ntp/0005-libatomic.patch | 33 ++++++++++++++++++++++++++++++++
 package/ntp/ntp.mk               |  4 ++++
 2 files changed, 37 insertions(+)
 create mode 100644 package/ntp/0005-libatomic.patch

diff --git a/package/ntp/0005-libatomic.patch b/package/ntp/0005-libatomic.patch
new file mode 100644
index 0000000000..79ed7db68a
--- /dev/null
+++ b/package/ntp/0005-libatomic.patch
@@ -0,0 +1,33 @@
+Add support for libatomic
+
+Upstream: https://bugs.ntp.org/show_bug.cgi?id=3985
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+diff -uNr ntp-4.2.8p18.orig/sntp/m4/ntp_libntp.m4 ntp-4.2.8p18/sntp/m4/ntp_libntp.m4
+--- ntp-4.2.8p18.orig/sntp/m4/ntp_libntp.m4	2024-05-07 13:21:13.000000000 +0200
++++ ntp-4.2.8p18/sntp/m4/ntp_libntp.m4	2025-06-21 10:14:58.090815230 +0200
+@@ -656,6 +656,23 @@
+     ;;
+ esac
+ 
++AC_ARG_ENABLE(
++    [libatomic],
++    [AS_HELP_STRING(
++	[--enable-libatomic],
++	[+ Compiler needs libatomic]
++    )],
++    [ntp_have_libatomic=$enableval]
++)
++
++AC_MSG_RESULT([$ntp_have_libatomic])
++
++case "$ntp_have_libatomic" in
++ yes)
++    LIBS="$LIBS -latomic"
++    ;;
++esac
++
+ 
+ AC_CHECK_HEADERS([priv.h])
+ case "$ac_cv_header_priv_h" in
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index 1a7c7e7937..7731df88ed 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -35,6 +35,10 @@ else
 NTP_CONF_OPTS += --without-crypto --disable-openssl-random
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+NTP_CONF_OPTS += --enable-libatomic
+endif
+
 ifeq ($(BR2_TOOLCHAIN_HAS_SSP),y)
 NTP_CONF_OPTS += --with-hardenfile=linux
 else
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
