Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9FACF8853
	for <buildroot@archiver.kernel.org>; Fri,  4 Oct 2024 17:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EDB394136A;
	Fri,  4 Oct 2024 17:39:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iVKhfGe4nso2; Fri,  4 Oct 2024 17:39:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B2394021C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B2394021C;
	Fri,  4 Oct 2024 17:39:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D60D61BF390
 for <buildroot@lists.busybox.net>; Fri,  4 Oct 2024 17:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D26944021C
 for <buildroot@lists.busybox.net>; Fri,  4 Oct 2024 17:39:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 44PiwaqO3TsV for <buildroot@lists.busybox.net>;
 Fri,  4 Oct 2024 17:39:15 +0000 (UTC)
X-Greylist: delayed 601 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 04 Oct 2024 17:39:15 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 31BE8401DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31BE8401DD
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.241.56.152;
 helo=mout-p-102.mailbox.org; envelope-from=ralf.dragon@lindra.de;
 receiver=<UNKNOWN> 
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 31BE8401DD
 for <buildroot@buildroot.org>; Fri,  4 Oct 2024 17:39:15 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4XKwMc0XLRz9syP;
 Fri,  4 Oct 2024 19:22:04 +0200 (CEST)
From: Ralf Dragon <hypnotoad@lindra.de>
To: buildroot@buildroot.org
Date: Fri,  4 Oct 2024 19:21:06 +0200
Message-Id: <20241004172105.2050317-1-hypnotoad@lindra.de>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4XKwMc0XLRz9syP
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lindra.de; s=MBO0001; t=1728062524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=5y69N0IV9CvJE5xdYRsOhxxPSuNICjvtjJB/AuTpb70=;
 b=eGceab/FpuSPUqI+nQZMQKN6I2mNSQkwafXFEd734iE9aEkPZDdxQGCNrLyJY4lUFnAs7O
 HH2pju/Q2OuudkZt8EWA37jAeXJgL75qEfHE49IdCSX+r9ArcDujI3wUHAY2+NcgIUnPDQ
 cyJ0Kg1GmJQDx9Fikgb7+Yzq0U9zdTdamkfuxqogvK+1+I8vbNc4hNcAa75VM/CvWisW5/
 EBepiNjGf12btFtpteG+LvJM8oOOYKnKrJkQJfNrb/5nEVUpC97mAAlKND85p5u1f3isSi
 lUTgHn6AMfRobXeyec1jTN12IMsrDzMbu/iYzrtXkAB8nTMqBrv0WvokqYjKEg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=lindra.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=lindra.de header.i=@lindra.de header.a=rsa-sha256
 header.s=MBO0001 header.b=eGceab/F
Subject: [Buildroot] [PATCH] package/x11vnc: Fix multiple symbol definition
 error
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Martin Kepplinger <martink@posteo.de>, Ralf Dragon <hypnotoad@lindra.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Error seems to happen if LIBVNCSERVER_HAVE_LIBPTHREAD is defined:
/bin/ld: x11vnc-xwrappers.o:(.bss+0x494): multiple definition of
`clientMutex'; x11vnc-8to24.o:(.bss+0x59600): first defined here

Patch is from https://bugs.gentoo.org/706840 . It moves the
implementation from header to a source file, thus avoiding multiple
definitions.

Signed-off-by: Ralf Dragon <hypnotoad@lindra.de>
---
Backport to: 2024.02.x
---
 .../x11vnc/0003-Fix-multi-definition.patch    | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/x11vnc/0003-Fix-multi-definition.patch

diff --git a/package/x11vnc/0003-Fix-multi-definition.patch b/package/x11vnc/0003-Fix-multi-definition.patch
new file mode 100644
index 0000000000..504159efe9
--- /dev/null
+++ b/package/x11vnc/0003-Fix-multi-definition.patch
@@ -0,0 +1,45 @@
+From a48b0b1cd887d7f3ae67f525d7d334bd2feffe60 Mon Sep 17 00:00:00 2001
+From: Alexander Tsoy <alexander@tsoy.me>
+Date: Tue, 28 Jan 2020 22:21:01 +0300
+Subject: [PATCH] Fix build with -fno-common
+
+GCC 10 defaults to -fno-common
+---
+ src/util.c | 3 +++
+ src/util.h | 6 +++---
+ 2 files changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/src/util.c b/src/util.c
+index a82a1a4..6a52ebf 100644
+--- a/src/util.c
++++ b/src/util.c
+@@ -47,6 +47,9 @@ int hxl = 0;
+ #ifdef LIBVNCSERVER_HAVE_LIBPTHREAD
+ MUTEX(x11Mutex);
+ MUTEX(scrollMutex);
++MUTEX(clientMutex);
++MUTEX(inputMutex);
++MUTEX(pointerMutex);
+ #endif
+ 
+ int nfix(int i, int n);
+diff --git a/src/util.h b/src/util.h
+index 35c1afd..99b5dd1 100644
+--- a/src/util.h
++++ b/src/util.h
+@@ -102,9 +102,9 @@ extern struct timeval _mysleep;
+ #ifdef LIBVNCSERVER_HAVE_LIBPTHREAD
+ extern MUTEX(x11Mutex);
+ extern MUTEX(scrollMutex);
+-MUTEX(clientMutex);
+-MUTEX(inputMutex);
+-MUTEX(pointerMutex);
++extern MUTEX(clientMutex);
++extern MUTEX(inputMutex);
++extern MUTEX(pointerMutex);
+ #endif
+ 
+ #define X_INIT INIT_MUTEX(x11Mutex)
+-- 
+2.24.1
+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
