Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A97CD149CD
	for <buildroot@archiver.kernel.org>; Fri, 25 Oct 2024 16:57:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93CA9407A1;
	Fri, 25 Oct 2024 16:57:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UIize3ME0__K; Fri, 25 Oct 2024 16:57:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3ADE84078D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3ADE84078D;
	Fri, 25 Oct 2024 16:57:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CA5D2316
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 16:57:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2ADAD60652
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 16:57:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qMcSfaOQZLC0 for <buildroot@buildroot.org>;
 Fri, 25 Oct 2024 16:57:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54F8E605DB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54F8E605DB
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 16:57:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3DEE5836D2; Fri, 25 Oct 2024 16:57:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 25 Oct 2024 18:54:19 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 8824652187e4b80ac314b448c2e60e5c6fdebf1b
X-Git-Newrev: 7cb57554b8c1a0b612bd119bb0cc4a6207d8ae4f
X-Patchwork-Hint: ignore
Message-Id: <20241025165703.3DEE5836D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/bootgen: add
 patch to fix crash with -verify
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7cb57554b8c1a0b612bd119bb0cc4a6207d8ae4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

The 2023.2 version forgets to populate the iHT structure before accessing
it, leading to a segfault. Add a patch submitted upstream to fix that.

Notice that this is fixed in the 2024.1 version as there ReadBinaryFile()
now calls ReadHeaderTableDetails():

https://github.com/Xilinx/bootgen/commit/3a0f879c611d67072aad3461f1c72d1a284cd5fc#diff-404aa20e03f1035b725ac1ea6e64c28477bb65c1663da67f64ffdb1a60552cee

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-Fix-segmentation-fault-that-occurs-durin.patch | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/package/bootgen/0001-verifyimage-Fix-segmentation-fault-that-occurs-durin.patch b/package/bootgen/0001-verifyimage-Fix-segmentation-fault-that-occurs-durin.patch
new file mode 100644
index 0000000000..096dbac27e
--- /dev/null
+++ b/package/bootgen/0001-verifyimage-Fix-segmentation-fault-that-occurs-durin.patch
@@ -0,0 +1,50 @@
+From f7825edbd1c85380cfb5ef0cf2c16c910954f57c Mon Sep 17 00:00:00 2001
+From: Charlie Johnston <charlie.johnston@loftorbital.com>
+Date: Mon, 5 Aug 2024 13:07:25 -0700
+Subject: [PATCH] verifyimage: Fix segmentation fault that occurs during
+ verifyimage.
+
+In commit d02322b, the behavior of ReadBinaryFile was changed such
+that it no longer populated iHT. This caused VerifyAuthentication
+to access a null iHT value resulting a segmentation fault.
+
+This fix changes VerifyAuthentication to call ReadHeaderTableDetails
+instead, where the old functionality of ReadBinaryFile now lives.
+
+Signed-off-by: Charlie Johnston <charlie.johnston@loftorbital.com>
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+Upstream: https://github.com/Xilinx/bootgen/pull/36
+---
+ verifyimage-versal.cpp | 2 +-
+ verifyimage-zynqmp.cpp | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/verifyimage-versal.cpp b/verifyimage-versal.cpp
+index 5490663..5656e50 100755
+--- a/verifyimage-versal.cpp
++++ b/verifyimage-versal.cpp
+@@ -34,7 +34,7 @@
+ /*******************************************************************************/
+ void VersalReadImage::VerifyAuthentication(bool verifyImageOption)
+ {
+-    ReadBinaryFile();
++    ReadHeaderTableDetails();
+ 
+     if (iHT->headerAuthCertificateWordOffset != 0)
+     {
+diff --git a/verifyimage-zynqmp.cpp b/verifyimage-zynqmp.cpp
+index d4812e6..d73272c 100755
+--- a/verifyimage-zynqmp.cpp
++++ b/verifyimage-zynqmp.cpp
+@@ -50,7 +50,7 @@ static void RearrangeEndianess(uint8_t *array, uint32_t size)
+ /*******************************************************************************/
+ void ZynqMpReadImage::VerifyAuthentication(bool verifyImageOption)
+ {
+-    ReadBinaryFile();
++    ReadHeaderTableDetails();
+ 
+     if (iHT->headerAuthCertificateWordOffset != 0)
+     {
+-- 
+2.39.5
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
