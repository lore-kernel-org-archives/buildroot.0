Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B6CC30658
	for <buildroot@archiver.kernel.org>; Sat, 29 Jun 2024 07:31:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC6276084D;
	Sat, 29 Jun 2024 07:31:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R78Oa1n1CBnx; Sat, 29 Jun 2024 07:31:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2ECA160822
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2ECA160822;
	Sat, 29 Jun 2024 07:31:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 56B901BF86C
 for <buildroot@lists.busybox.net>; Sat, 29 Jun 2024 07:31:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4489084582
 for <buildroot@lists.busybox.net>; Sat, 29 Jun 2024 07:31:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gdq7ybz50NfW for <buildroot@lists.busybox.net>;
 Sat, 29 Jun 2024 07:31:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 93F2B80D0B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93F2B80D0B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 93F2B80D0B
 for <buildroot@buildroot.org>; Sat, 29 Jun 2024 07:31:05 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cda5.dip0.t-ipconnect.de [79.214.205.165])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1380DA4C0A6E
 for <buildroot@buildroot.org>; Sat, 29 Jun 2024 09:31:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59836)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1sNSY2-000000004l2-1ixG
 for buildroot@buildroot.org; Sat, 29 Jun 2024 07:31:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 29 Jun 2024 09:31:02 +0200
Message-Id: <20240629073102.772416-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1719646263;
 bh=6kACB+qcPV86/Yow7V3hHXSQYXcnxoa4uHwjgZgYOrk=;
 h=From:To:Subject:Date:From;
 b=Kea4MlRK1i2rn2kqAZbnmJXggqyWf7R9YP/ARFSYF5pFvd5NxiRhE4YclHdOIZwYZ
 9LchBh98P7yzp992nMQcnuzYo1FbMRb727tZwz6wyUZgUDJpgWKaHPndwOs/ypCSpT
 OoMIjXfW2UsWmIBT64LVL5tYTSs6CqFKsC/451FwAM4mKJEs01sSORsz2OXQczktiM
 3K51xhUM2rHijlKzCHyu6c1feBGJ+DONmKGUcPYRtmNgRxldeVByw4+5tp+R+trT9X
 m+iQdTFS3PnCgKiDJShhrdXDRYAZ5mVWsjG+kZVkVZ3EraXWv+i9/hfgB0pxkfvYtW
 Q5Yf2StKBZOSg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=Kea4MlRK
Subject: [Buildroot] [PATCH 1/1] package/libyuv: update patches to be
 applied with fuzz 0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed "support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0" reduced the fuzz factor.

Due to this change, libyuv fails to build with output:

    Applying 0001-i386-sse2.patch using patch:
    patching file include/libyuv/scale_row.h
    Hunk #1 FAILED at 33.
    1 out of 1 hunk FAILED -- saving rejects to file include/libyuv/scale_row.h.rej

Rebase the patch to fix the problem.

Fixes:
http://autobuild.buildroot.net/results/8ca446ee4bd657a661894dec66f45aa02b6a7325/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libyuv/0001-i386-sse2.patch | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libyuv/0001-i386-sse2.patch b/package/libyuv/0001-i386-sse2.patch
index b8ecb34d0f..2380bbc973 100644
--- a/package/libyuv/0001-i386-sse2.patch
+++ b/package/libyuv/0001-i386-sse2.patch
@@ -5,7 +5,7 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 diff -uNr libyuv-1411.org/include/libyuv/scale_row.h libyuv-1411/include/libyuv/scale_row.h
 --- libyuv-1411.org/include/libyuv/scale_row.h	2015-05-22 23:39:21.000000000 +0200
 +++ libyuv-1411/include/libyuv/scale_row.h	2015-05-25 12:35:17.000000000 +0200
-@@ -33,7 +33,7 @@
+@@ -55,7 +55,7 @@
  
  // The following are available on all x86 platforms:
  #if !defined(LIBYUV_DISABLE_X86) && \
@@ -13,4 +13,4 @@ diff -uNr libyuv-1411.org/include/libyuv/scale_row.h libyuv-1411/include/libyuv/
 +    (defined(_M_IX86) || defined(__x86_64__) || (defined(__i386__) && defined(__SSE2__)))
  #define HAS_FIXEDDIV1_X86
  #define HAS_FIXEDDIV_X86
- #define HAS_SCALEADDROWS_SSE2
+ #define HAS_SCALEADDROW_SSE2
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
