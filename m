Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F95CA0ED1
	for <buildroot@archiver.kernel.org>; Fri, 15 Aug 2025 10:30:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBE6080F66;
	Fri, 15 Aug 2025 10:30:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qJny8VSOzqMW; Fri, 15 Aug 2025 10:30:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC07D80F02
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC07D80F02;
	Fri, 15 Aug 2025 10:30:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 52DB0196
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 10:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 39A4440220
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 10:30:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 75z64dKpe8kQ for <buildroot@buildroot.org>;
 Fri, 15 Aug 2025 10:30:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3C258403E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C258403E7
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3C258403E7
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 10:30:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 81F3F43221;
 Fri, 15 Aug 2025 10:30:05 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Aug 2025 12:29:58 +0200
Message-ID: <20250815103002.3871929-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250815103002.3871929-1-thomas.petazzoni@bootlin.com>
References: <20250815103002.3871929-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeefjedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehtdetueevgeeggfdvtdefffejtdffgefgvddthffgfeeifeeffefftdfglefgveenucffohhmrghinhepghhithhlrggsrdgtohhmpdgsuhhilhgurhhoohhtrdhorhhgnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdrhhhomhgvpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1755253805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R/2/wp102Qu63P2sFS2r53Gb5vt9asIqVx8shlnYEs8=;
 b=TfA/mluxRCbODHVzPWri7xIRvMICVhdKJupIiL2w1OWxqWCk/o1+7x7OTtL+MHNreWeuPT
 r5lnfIEsR11Pe6v+XmzERSZbomKo9i6hRx/Azujb2ff1NxI8ooc75oV8Qpbx+7eysaOVF0
 Q0ObPjB4vH6YM4Oux6MjrRSRq+lnHVYQ+8T0NPtYjK96DUo5fxE1vXRDFYHk+rRIt/MsU+
 nXN4a+B5xjq5/dxHv0Ge0SlQm4uyLfSj61LMwclymnQaWBLu7IiFaEDfvycbNCKrmrUU+Y
 EZmd0tyIfN1TtIX432i8024o/q3lmx8n/itZIEHxNp3Y1D2ZJXwKoIDI0cZaIA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TfA/mlux
Subject: [Buildroot] [PATCH 1/3] support/testing/tests/fs/test_iso9660.py:
 use a more recent toolchain
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The ISO9660 tests are currently using an old 2017 toolchain. Let's
switch to a modern toolchain, which is regularly updated. Also, we use
a toolchain based on glibc since grub2 doesn't build with recent
uClibc toolchains.

It will work around build issues with syslinux.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/10975828975
  https://gitlab.com/buildroot.org/buildroot/-/jobs/10975828871
  https://gitlab.com/buildroot.org/buildroot/-/jobs/10975828770

(Even though those should be fixed separately, as syslinux should
continue to build with old compilers not supporting std=gnu17)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/fs/test_iso9660.py | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/support/testing/tests/fs/test_iso9660.py b/support/testing/tests/fs/test_iso9660.py
index 3d08f2e895..1b86bfbfc1 100644
--- a/support/testing/tests/fs/test_iso9660.py
+++ b/support/testing/tests/fs/test_iso9660.py
@@ -4,16 +4,9 @@ import infra.basetest
 
 BASIC_CONFIG = \
     """
-    BR2_x86_pentium4=y
+    BR2_x86_core2=y
     BR2_TOOLCHAIN_EXTERNAL=y
-    BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
-    BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-    BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-i386-pentium4-full-2017.05-1078-g95b1dae.tar.bz2"
-    BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
-    BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_2=y
-    BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
-    # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
-    BR2_TOOLCHAIN_EXTERNAL_CXX=y
+    BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_STABLE=y
     BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
     BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
     BR2_LINUX_KERNEL=y
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
