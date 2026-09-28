Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF802CA5FA1
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 21:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F7AB80A9F;
	Mon, 28 Sep 2026 21:09:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0_52Xk9wY_8a; Mon, 28 Sep 2026 21:09:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5B10380A75
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790629751;
	b=KgB+YVZ++Zj1KpxUSN5YRza6DhxkQ7qmt3WU5XGnrGnj4sNAVFjspG679l2v7be4vrmY
	 clHBXOxyE4g7LiAKG0SyMOHQ4lTa5kL84/jQA66ES31NcR4ckT4RBRJEDE8P5V1VAlBrw
	 qQliSfryVD2QWLVwp/6BkTSb3pI3RduRYqbiP6T4ym/Sp3P7VriyryD0YuDHE4p+726Z4
	 TbVRJVse0aOkjWecVK58Nfb8AlH+hYpnV2swZTEZ+XP2f8JETGMTYrDwNJX3taHEHVSzk
	 n9NDkeXCcnTXAv/wWWrvl126M2PVpxoFiXF23XZKUXVtPrLU4T8ptF2t24ripdug0OQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790629751;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ewOMh48TsTn9995dIpPccrhBPVNOb0fs4yQnIPch8YQ=;
	b=hty4veYEx6ZBdqhCeR17xvpSUTJ31zFCw6NvraJyV/MpU4/g6fx5aafQgUvbIwFIvh5e
	 X5ecxilTtsV+qA5deNy/gVYCX1X3WDdcwgmnK1GETCxN+q1lE4HncVQtxxlAFnTrDu86V
	 85/lK9dl8Lu2PCUqzoKVeUJxf4h4XECKyAIhgOygDriDjJHBZMRFLmssTNKOqKKMuNYbV
	 STaLQtzI6Wt1dU0KboyJ2oo9o+guPoGmtAMr6tHKG6NtUSRJjmi7DGcBH+7/Ecyg7ZNE4
	 25iVT97jOyteiANSBwwzkDhxJjJhPvoGGVYfL+3YGeA75Up9hb9YHv/Gx2uBSqXicmQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790629751;
	bh=ewOMh48TsTn9995dIpPccrhBPVNOb0fs4yQnIPch8YQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IgO6Y/NV2S3ygWNPMNnDI8bMY7vd+tmFCyeuhNB3kJIPicqa1zXL7YSCYcYkdMem4
	 DptOmSFfS5UhP2dBZYyfyPCQXkzZ7WiwEeKhpPN9N0NCJyf84ms2rWT0eOYDmS06hv
	 ppDtigBNFQDQehvuSDzfaikFeoSJi3VEtOOBebAJFvGSXcZOI5dnlNc64c8R7OSMMe
	 sQbGwm3lWdAf36bk7k4smjBvHKtoUIwihqGg2zNBD8Ble92lPn/FlxhEVwIYBuf0Tw
	 bLeZtWNdmcIQoARAKtolGI/m5bD6em/8zhHerkutxi57RJkBP1bLljP5OuiOQzjW4I
	 LzsX93YjAwIZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B10380A75;
	Mon, 28 Sep 2026 21:09:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4229672
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 27A3C80A75
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:09:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TR-lazoJApBW for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 21:09:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 05863809F8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790629749;
 b=W4Nqsuf/92ROXwOrUHlD7JnRk6n373tPrs+kJYcgu8sewpQLD75DE5V6xbk02+2gkDYa
 ZdD8fFglE47iuAgHJB6BgLEwtyfKP1UCOt6LQTnsDYOpsVAbesxuzisDELuHXFl4zXtmW
 Kk7XBDkbjERvoi/rDm/9/NK4y9Y/5gFJCkveTSf6O6Czfyjofv7KwG3RWfCKnraMEoqQU
 MOhOA9Lpxg8DTWZGaInhX4kygwhrsnJPjTVqUk9M/OoBYvg8dKPWqvojHq9IijDXMR2GN
 sKPdDsFw46By0jv0N5nq7pZS3ivScUyvYzgtKSzP/7/xv6ly8KTIoF7qE31RuZV96Qg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790629749;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=BYeCBYH216IZ/rGT6w4MPlnSPDm359qJt35iTTggEKQ=;
 b=jtSSyDw8CjYR/XBEW3ZrnSZwVl5bFqABqPP+ZXIXgddI0dFS4paoRAmceydU1ebSDXu8
 1TXu/Yvs8CKkE8P5zj+ZUVg1xhmZ3j+HT9Nwbth3MFpsmo7IrAADp9+s80vUwB7W9sfhX
 v3T9lbeQAIIRoF8Z6heKajxFWHmR0dam2PnmJiSteKtt2HYQFbNkUS29l0LA37Yw0Pf2x
 A5efb5tz00XYrs/gEd9aqftYh32xdgDV/p34KUUw2S4KKT2+YWlPTpB98iWrxS09bMlgS
 SummFKwK8LxrJFXN3JpXBLWuri2isSCqLKFqERBKEcLEj/8Hz+LMobVEZj5xFjl2Y9g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05863809F8
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:09:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 970898DCB1; Mon, 28 Sep 2026 21:07:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Sep 2026 23:08:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f20b1b166b2d7af64850d5ca19eed806602fd543
X-Git-Newrev: 8b57f2f4215992fd9f53af92d15b507dd5d433fb
X-Patchwork-Hint: ignore
Message-Id: <20260928210756.970898DCB1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/util-linux-libs: Do not install to
 target
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8b57f2f4215992fd9f53af92d15b507dd5d433fb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

util-linux-libs was introduced as an intermediate package to help break
circular dependencies with util-linux, and therefor only exists to provide
more basic versions of the libraries util-linux provide, to break these
dependency chains.

There is no need to install these to target as they will never be used
there.

Under all circumstances the libraries are built and installed by the main
util-linux package.

This only solves the confict for target, the conflict will remain for
staging as that conflict is much harder to solve.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: John Ernberg <j@j-ernberg.se>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/util-linux/util-linux-libs/util-linux-libs.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/util-linux/util-linux-libs/util-linux-libs.mk b/package/util-linux/util-linux-libs/util-linux-libs.mk
index 6716a656d2..d434a8f461 100644
--- a/package/util-linux/util-linux-libs/util-linux-libs.mk
+++ b/package/util-linux/util-linux-libs/util-linux-libs.mk
@@ -24,6 +24,11 @@ UTIL_LINUX_LIBS_LICENSE_FILES = README.licensing \
 # 0002-autotools-optionally-add-libpthread-to-uuid.pc.patch
 UTIL_LINUX_LIBS_AUTORECONF = YES
 
+# This package is only used to build other packages that have a depdendency
+# on util-linux libraries which in turn may be dependencies for the full
+# util-linux build. The libraries that are actually used on target are built
+# by the util-linux package.
+UTIL_LINUX_LIBS_INSTALL_TARGET = NO
 UTIL_LINUX_LIBS_INSTALL_STAGING = YES
 UTIL_LINUX_LIBS_DEPENDENCIES = \
 	host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
