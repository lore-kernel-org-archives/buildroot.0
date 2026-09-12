Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D757C88E45
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 07:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43C4460601;
	Sat, 12 Sep 2026 07:40:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z8Mkt2_1qKZr; Sat, 12 Sep 2026 07:40:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 58BCE60614
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789198832;
	b=cCJ9/L18NmaHborPl47CaZkN1EksVB1u25zGDoLbZeS0EENNV0c7GMdzUl2w7o96cW+I
	 WqetTwJBU306qW7OgEetI9ssQ6eAS4fdfAz3MLn6nmwTaW3h1Tkx/GknqSWk/hpFSe5bz
	 pVkWASFaW3aNYRr8qviLIkuUE27XcbXlDm9RvMpWDygm2/KA4gCLvmgCLryp2zAw2zhJx
	 2RtVG8yB/MHaTp6Wnp2DFe01/duhhyXwPFRAMkq+O2n+QIeAdQQNG/vqJb1nrB3KoVS5Q
	 hDddiufQe4vkQRpqnmOl7QXDy+8MIMOFUOLMoIPHK9EpGwLXEdMBpTu4T9XYqaXe8gA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789198832;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=EPRvsPlB0tKkOwwd1bmrugT2i/hAT+/jIh6gLQRGkIY=;
	b=fh5c8cWze1JyDlDOW6Axvk0BzfydvoSYCfdFfj4gck6K3RSO4at2efExGdAmpMh/CUGU
	 puS8BkvXTPQ27gGtKuUX5pgGSdtEtC91j1vC3g/wyNNMU0V7X8Ztq0b1GCKeAj0RuRCD+
	 tasYVhOxOBZ8lYZ2qxUtPHOacDgvjTizn1kM/qdxSbSYXmoWUA+GYWQqzLgLikle+Oqf+
	 p/zeoqY1iaiglq+Qa2+eZEDLOEHHLY7uWxmjhgDSGp6cQIkqvq/jDWGP5JC007cTpTwAB
	 pHISTVMtBvWUiJvmiXaqkso6TnzNLILpafg6uSzKsa5+tKkYxdFJ0rMLxcG4j7v83aw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789198832;
	bh=EPRvsPlB0tKkOwwd1bmrugT2i/hAT+/jIh6gLQRGkIY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=j00h0DWydoxkXRiPUdIyiHB7ylPckyQTX11vb8TX19uONpbDk7WCrRP5KHGg8yExi
	 4ky5VRkYh/V4pQRyrJqylIs3GegjaLlTJsMre+gszA9F68ohYVZ0N9RZ0NQUEinWqU
	 F46qniKfo79R6u8r2TrTOQrTybVhCd+Q4meDQKORk114ZIgdW/QdYWOOr+CM/HLFMc
	 CCanGvhTnd+Z75n0aTy1wNtzyi3wittOOI6pK6F4AXw5Rn7aLbMRCV3ry5dnrHOJmU
	 krVxQOb7ACOwX/pZ4FGc22qWlDMo00T9pn1SdZgRCHNSXJOQK38S4YTB9C/VzwdBY/
	 r1SDliwcX8Guw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58BCE60614;
	Sat, 12 Sep 2026 07:40:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C42EF2E3
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 07:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9EF1405AC
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 07:40:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k0hHPMecalN8 for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 07:40:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org EBE12404C9
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789198830;
 b=T1MeuAur8o9jcMmUbUPEHJX2XaXBh6YBypmZhyVcqEEIiDPOOdMxhEfiZM7b19kAM93P
 BXZ+5OqKEZDmfcbwOIq9l8wifRGCIHJoj0rZxwM+mCQQCxy/S+yd4mCHcCcmfPSqx597F
 xZTNp7LtL2tEExUoTNCwagi0x+FXeV41GXEd1UUr4KxZEuvggWdk6k52/F+9U3QWjEHa6
 dt08tBDfG/4OZuEXAbgJP/VYSqQqf3oWfPMNAW3XdcdNKln7rpWBx7pxz/O8C6e5tPyBe
 xZJ/ylMYRzKbYSPbfZgagvbyPCLUYgbVJJXqfp+inpXdTOSSw02DfXayDRuaJAk/pdA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789198830;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Erqd8mVAFAQ5Ho5RWWUvF5vG0ISZBc9myUrNHDAVYHM=;
 b=IZIpED7eILdp7tQ1DpXeRP7ZCU2OiU0aw5tUekgWhqG6kADeeinY8+xAZr59xnzdgolc
 dWL+h+kmrKPMWwHeQBz0sjB7N10h42IcxreAs2kjwhFDIHwf9oauit+hQc+einVNFqwkj
 HHTQQYDpOSs7hIrZZbdbmfXOw3L1y2/u6meZ6DtRv+oOZJ3kh0YMycBioQ6wms7u2KFBO
 oEniJfTAXj1hc2zOIW9aIFJfdHU0CoWh3gc4Ygpv0CJAM6ylupCh0MqkOuv+N8TpORESZ
 c8BeEzn8MuoJuQGb1YqKcRr9hV8T690TBdyoJrtXOkzCWScibnPTEcGjtaR8JlmkojQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EBE12404C9
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 07:40:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A81AF8C981; Sat, 12 Sep 2026 07:39:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 12 Sep 2026 09:37:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4cb6193d2eca39b1bd79ff4867c842f507f692b8
X-Git-Newrev: 6f125a653038c9460b515b1f0d4c8c4be37d88c3
X-Patchwork-Hint: ignore
Message-Id: <20260912073925.A81AF8C981@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xz: security bump version to 5.8.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6f125a653038c9460b515b1f0d4c8c4be37d88c3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/tukaani-project/xz/releases/tag/v5.8.4

- lzma_alone_decoder(), lzma_lzip_decoder(),
  lzma_auto_decoder(), and lzma_microlzma_decoder(): Fix an
  invalid memory access after memory allocation has failed and
  the application reinitializes the existing decoder to decode
  a different file. This bug could at least result in a crash.
  This is tracked as GHSA-5qpq-xqfv-j9pg. CVE number is pending.
  (Also in v5.2, v5.4, and v5.6.)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xz/xz.hash | 4 ++--
 package/xz/xz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xz/xz.hash b/package/xz/xz.hash
index 488a3d55dc..270ac748db 100644
--- a/package/xz/xz.hash
+++ b/package/xz/xz.hash
@@ -1,5 +1,5 @@
-# From https://github.com/tukaani-project/xz/releases/tag/v5.8.3
-sha256  33bf69c0d6c698e83a68f77e6c1f465778e418ca0b3d59860d3ab446f4ac99a6  xz-5.8.3.tar.bz2
+# From https://github.com/tukaani-project/xz/releases/tag/v5.8.4
+sha256  3340ae48f88665abc78d71dc43446fb3f7e70b48fd59844ac0e14958cef6e00b  xz-5.8.4.tar.bz2
 
 # Hash for license files
 sha256  616a3ad264ce29b8f1cb97e53037b139d406899ca8d1f799651e17bfa09830b8  COPYING
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 056c168057..c3232966ee 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XZ_VERSION = 5.8.3
+XZ_VERSION = 5.8.4
 XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = https://github.com/tukaani-project/xz/releases/download/v$(XZ_VERSION)
 XZ_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
