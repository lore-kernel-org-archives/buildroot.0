Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DAFFCCFA13
	for <buildroot@archiver.kernel.org>; Sun,  9 Nov 2025 08:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC7E76081F;
	Sun,  9 Nov 2025 08:22:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zT8bwb0aDece; Sun,  9 Nov 2025 08:22:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CCBF60810
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CCBF60810;
	Sun,  9 Nov 2025 08:22:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 959CD1CD
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 08:22:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 879DD4049E
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 08:22:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kbb2eb90vYoK for <buildroot@buildroot.org>;
 Sun,  9 Nov 2025 08:22:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3262F40406
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3262F40406
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3262F40406
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 08:22:11 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bd38.dip0.t-ipconnect.de [84.161.189.56])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E86ABA4C4697
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 09:22:08 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34092)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vI0ga-000000000OS-2SC7
 for buildroot@buildroot.org; Sun, 09 Nov 2025 08:22:08 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  9 Nov 2025 09:22:08 +0100
Message-ID: <20251109082208.744230-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1762676528;
 bh=QYW7OE5dGiSfyxLSMR+20qqBczpIwvoBzRpGlwTuxI4=;
 h=From:To:Subject:Date:From;
 b=EcCZWFZBGgmDM4fLyzi8quEqxPt27euszOO1kns8bCUB/A5c+20Xy/QC1O47sAcOi
 Y+zNTb7IrqUj703khmtq+2rTc7kOiSB+Qh2Tx+aNQNnleDJGmRaLbZNbkWz1sWUEL2
 YyM63P3lWgnQsumrTWI/TcKvFcB5qhbzfEVHygH4JL72a3MxbIZrlwp1HZtw6Tes+v
 KCPuunk1G7hO+yGbmFwp3Z9ZqA1FkDED+y9GDB1UzeL+Q2HyO5IDxsd+xiRp9z8otM
 vlyYQ/vKJBnGSUWR6KfQxi6+nHb/rZNtnovZ44m+6NmD2yGdyZGc9ldadJIRNPVf73
 w7mQ1BWG+0/RQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=EcCZWFZB
Subject: [Buildroot] [PATCH 1/1] package/libudfread: needs threads
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

This patch fixes the build for non-threaded toolchains occuring since the
bump to 1.2.0 by buildroot commit 537555a37f53360020a11df8065450d88e9d107c
and the switch of the build system to meson.

libudfread uses

dependency('threads', required: false)
https://code.videolan.org/videolan/libudfread/-/blob/1.2.0/meson.build?ref_type=tags#L66

which falsely detects threads support:

Run-time dependency threads found: YES

although the toolchain lacks threads support:

$ grep THREADS .config | grep =
BR2_PTHREADS_NONE=y

There is an open Meson bug report discussing this problem:
https://github.com/mesonbuild/meson/issues/553#issuecomment-421562520

The only dependees of libudfread, kodi and libbluray, depend on thread
support themselves so we require threads support for libudfread as well
to fix the build error.

Fixes:
https://autobuild.buildroot.net/results/839/839d1b879187454ba9064845451f2c2ff398a663/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libudfread/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libudfread/Config.in b/package/libudfread/Config.in
index c1f3f23af9..803bfee0f5 100644
--- a/package/libudfread/Config.in
+++ b/package/libudfread/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_LIBUDFREAD
 	bool "libudfread"
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  UDF reader
 
 	  https://code.videolan.org/videolan/libudfread
 
 comment "libudfread needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_SYNC_4 && !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
