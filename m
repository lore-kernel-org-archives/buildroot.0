Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA0BC369B8
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 12:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B15A56064D;
	Mon, 14 Apr 2025 12:19:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GwHZ6kqYwg3O; Mon, 14 Apr 2025 12:19:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFD496066D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFD496066D;
	Mon, 14 Apr 2025 12:19:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9213F251
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 12:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82EBA81A0D
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 12:19:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cbc2Spd-Zk6z for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 12:19:31 +0000 (UTC)
X-Greylist: delayed 71633 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 14 Apr 2025 12:19:31 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 773D3818A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 773D3818A2
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 773D3818A2
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 12:19:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 98A3143B18;
 Mon, 14 Apr 2025 12:19:28 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 14 Apr 2025 14:19:22 +0200
Message-ID: <20250414121925.1955131-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvddtheefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepteeltefhvdeuteegvddvjeejteffgefgvdeigeeuvedvueevtdeluedvgfeuuedtnecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhorhhgnecukfhppedvrgdtvdemkeegfeegmeelfhdtleemvdektddumeefsgelmeejsggtfhemheehleehmegvfhefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegfeegmeelfhdtleemvdektddumeefsgelmeejsggtfhemheehleehmegvfhefvgdphhgvlhhopeifihhnughsuhhrfhdrrddpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpt
 hhtohepfhhonhhtrghinhgvrdhfrggsrhhitggvsehgmhgrihhlrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1744633168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=8xutN52IZfSqjC1hSLaAO/4bxCGf2p0aKkAFJdJF6gw=;
 b=LfrwYCs+nIgVskIsx/H8Ofl5NHwYdWcUr0JsjOQ20fsVlrgo6NVjhRv/GoylNfwnAT5twx
 /xOgwU96uaQVbjjJeEToB2TodopsHBFXBdxNavi0/CWoh8zP+HwqYpDXdJCpAI2p3x2fPD
 GyrmyQR3Uy9HWIpgj0RRmDLzi9Dx2vLkXeU5rapVqKXs6NB44duoxdx4f94TgIBdHga8sf
 yMyvfTy+N3MjslQcV0xE2A7uDgBDv3UKKbNtd6bBRv4Ji0nwVpHm10/TXjJenPETqlm9tM
 Rm3GpLKHcjcG6FI+zeC+CXTtfwnt34vlRKFu7+MEVxIN5VwUZ4yicQm61XSyFQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LfrwYCs+
Subject: [Buildroot] [PATCH 1/2] package/libv4l: backport upstream patch to
 fix time_t issue
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

libv4l has some really special code that is built explicitly with
_FILE_OFFSET_BITS=32, which doesn't work with _TIME_BITS=64, causing
build failures when BR2_TIME_BITS_64=y. This build issue has been
fixed upstream. While how the upstream patch exactly works is unclear,
it's the patch that upstream has decided to implement to resolve the
build issue, so we simply backport it.

The issue exists since at least upstream commit
99f245f5e2826c7ae3ac8de530bc2fbd906eb62b, which was merged in
v4l-utils 1.26.0.

Fixes:

  https://autobuild.buildroot.org/results/616608ef2a44efff67fa21b3263b341da82744c4/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...on.build-fix-arm-_TIME_BITS-64-error.patch | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/libv4l/0001-meson.build-fix-arm-_TIME_BITS-64-error.patch

diff --git a/package/libv4l/0001-meson.build-fix-arm-_TIME_BITS-64-error.patch b/package/libv4l/0001-meson.build-fix-arm-_TIME_BITS-64-error.patch
new file mode 100644
index 0000000000..db59eae7e6
--- /dev/null
+++ b/package/libv4l/0001-meson.build-fix-arm-_TIME_BITS-64-error.patch
@@ -0,0 +1,37 @@
+From 6faf5e963eadeab8b7d47d5b3c14f06e0ae1da01 Mon Sep 17 00:00:00 2001
+From: Hans Verkuil <hverkuil@xs4all.nl>
+Date: Sat, 12 Apr 2025 12:30:13 +0200
+Subject: [PATCH] meson.build: fix arm _TIME_BITS=64 error
+
+Undefine _TIME_BITS to avoid this error on 32-bit arm:
+
+/usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
+
+Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
+Upstream: d517cfdcdc16533ab7e06e97c07ca089cf261aef
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ meson.build | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 269a9da7..31927cda 100644
+--- a/meson.build
++++ b/meson.build
+@@ -53,8 +53,12 @@ v4l2_wrapper_args = [
+     # As the library needs to provide both 32-bit and 64-bit versions
+     # of file operations, disable transparent large file support (fixes
+     # 'Error: symbol `open64/mmap64' is already defined' compile failure
+-    # otherwise)
++    # otherwise).
++    #
++    # Also disable _TIME_BITS=64 since this is allowed only with
++    # _FILE_OFFSET_BITS=64, which is now 32.
+     '-U_FILE_OFFSET_BITS',
++    '-U_TIME_BITS',
+     '-D_FILE_OFFSET_BITS=32',
+     '-D_LARGEFILE64_SOURCE',
+ ]
+-- 
+2.49.0
+
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
