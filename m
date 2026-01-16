Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6AAC98302
	for <buildroot@archiver.kernel.org>; Fri, 16 Jan 2026 23:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03E0D6E4FA;
	Fri, 16 Jan 2026 23:27:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tRCpDwOEe2ir; Fri, 16 Jan 2026 23:27:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D1A261CFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768606047;
	bh=rsboKC4uPti3Rcudre1PFbUykvh0dXKYxy76OhdDIZY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZUi/viIaYqD76bJyrnOki8EJt+nl/TH9qvM9B1caB/IhArL7cL1LpY3Irs4xHjTCX
	 b/PSWdYGlWfd1TAHeE5drBQMo5/WND80cjatI6eJImT5fqxooXUSbTkiUyEkWbOvXp
	 QLroTiV+XAX+0JyknIazJkbEqHbYyj8hKJOLIISV4FjWzEhhlzv30qW/5CG4/FqWu7
	 litwg6hXrf/xxePZO/eis5Eaw4II8awe8CYdyPqDFC5Y+ZQGlealAqtCCRClIZa3qL
	 oSGZ1xeRUX7WTUTnWl4vDAGl2oE+ixCy4qNAINHeQnarSoR9eWMwd/nLk8i7jtzAuO
	 7izARUx3YSpSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D1A261CFA;
	Fri, 16 Jan 2026 23:27:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AC5942CC
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 23:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C33541F9D
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 23:27:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c9Kp7wEH7bAM for <buildroot@buildroot.org>;
 Fri, 16 Jan 2026 23:27:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EB34F41F9F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB34F41F9F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB34F41F9F
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 23:27:21 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc04.dip0.t-ipconnect.de [84.161.188.4])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 34992A4C1107;
 Sat, 17 Jan 2026 00:27:18 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51342)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vgtDp-0000000013S-1Y90;
 Fri, 16 Jan 2026 23:27:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sat, 17 Jan 2026 00:27:17 +0100
Message-ID: <20260116232717.937891-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768606038;
 bh=AMd23CsyHBHquu/x1fbk5vHD1no9l7pjw2GxAwQq85Q=;
 h=From:To:Cc:Subject:Date:From;
 b=rhsnIWkz3cEZM+szbATmsRgiHq7kNGbVlKZK9MmAx6C91acAFgwTZi17myulCpnSX
 JROGE2hrpKLUbXetA23lB4gOYpIR1njtBGU/evXJ4ubdiIApsGAjeZGWxgA/0sH2wW
 LdHom09oCC03VimOGPOshsYjXFCWTetZrP2AOjJ0pC+6v8z/9pI2au5KR66x9rWH0f
 frtsLUfNc1iSJeHM6h5xH3VcFZEyWUHUKcF6qqvevygDNlDAJLapgkpq/2L+CyQw20
 PFppwABZ9qK1hJotC33YZfXROQHxg1BTgJeygKOM+p6rr3c6IcuMKMesuek+EYOm0E
 YuGwmTR1uwYvw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=rhsnIWkz
Subject: [Buildroot] [PATCH v2 1/1] package/util-linux: optionally add
 libpthread to uuid.pc
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

Buildroot commit 31af509b4f4fe52f67bd9109b8732a55b8f9cd2d bumped
util-linux from version 2.40.2 to 2.41.1.

Upstream release 2.40.3 contains
https://github.com/util-linux/util-linux/commit/e143539d30fd18afb3ba6d3c6e50a260d4219895
which unconditionally adds -lpthread to uuid.pc causing build errors for
other packages using non-threaded toolchains like erofs-utils.

Fixes:
https://autobuild.buildroot.net/results/582/5827995db2a805e0c8a04fde8498eff6f28aa6d8/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: patched autoconf files instead of sed'ing uuid.pc (Thomas)

 ...optionally-add-libpthread-to-uuid.pc.patch | 42 +++++++++++++++++++
 package/util-linux/util-linux.mk              |  3 ++
 2 files changed, 45 insertions(+)
 create mode 100644 package/util-linux/0001-autotools-optionally-add-libpthread-to-uuid.pc.patch

diff --git a/package/util-linux/0001-autotools-optionally-add-libpthread-to-uuid.pc.patch b/package/util-linux/0001-autotools-optionally-add-libpthread-to-uuid.pc.patch
new file mode 100644
index 0000000000..1c48d639b6
--- /dev/null
+++ b/package/util-linux/0001-autotools-optionally-add-libpthread-to-uuid.pc.patch
@@ -0,0 +1,42 @@
+From a06adacd1009174b7ca35f529a2db165f6c1f3aa Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Fri, 16 Jan 2026 23:33:34 +0100
+Subject: [PATCH] autotools: optionally add libpthread to uuid.pc
+
+Fixes https://github.com/util-linux/util-linux/issues/3210#issuecomment-3477915953
+
+Upstream: https://github.com/util-linux/util-linux/pull/3973
+
+[Bernd: backported to 2.41.3]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ Makefile.am        | 1 +
+ libuuid/uuid.pc.in | 2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 01e99701d..cd1d157ce 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -189,6 +189,7 @@ edit_cmd = sed \
+ 	 -e 's|@usrbin_execdir[@]|$(usrbin_execdir)|g' \
+ 	 -e 's|@usrsbin_execdir[@]|$(usrsbin_execdir)|g' \
+ 	 -e 's|@SOCKET_LIBS[@]|$(SOCKET_LIBS)|g' \
++	 -e 's|@PTHREAD_LIBS[@]|$(PTHREAD_LIBS)|g' \
+ 	 -e 's|@VERSION[@]|$(VERSION)|g' \
+ 	 -e 's|@ADJTIME_PATH[@]|$(ADJTIME_PATH)|g' \
+ 	 -e 's|@LIBUUID_VERSION[@]|$(LIBUUID_VERSION)|g' \
+diff --git a/libuuid/uuid.pc.in b/libuuid/uuid.pc.in
+index 51929fe80..a40dc6644 100644
+--- a/libuuid/uuid.pc.in
++++ b/libuuid/uuid.pc.in
+@@ -7,5 +7,5 @@ Name: uuid
+ Description: Universally unique id library
+ Version: @LIBUUID_VERSION@
+ Cflags: -I${includedir}/uuid
+-Libs.private: @SOCKET_LIBS@ -lpthread
++Libs.private: @SOCKET_LIBS@ @PTHREAD_LIBS@
+ Libs: -L${libdir} -luuid
+-- 
+2.47.3
+
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index d0a03be404..1cd2364944 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -37,6 +37,9 @@ UTIL_LINUX_LICENSE_FILES = README.licensing \
 
 UTIL_LINUX_CPE_ID_VENDOR = kernel
 
+# 0001-autotools-optionally-add-libpthread-to-uuid.pc.patch
+UTIL_LINUX_AUTORECONF = YES
+
 UTIL_LINUX_INSTALL_STAGING = YES
 UTIL_LINUX_DEPENDENCIES = \
 	host-pkgconf \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
