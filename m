Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2698FC79F85
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 10:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCBCE40580;
	Sun,  6 Sep 2026 10:14:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N_sji_LJ2kdp; Sun,  6 Sep 2026 10:14:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BFD09405D1
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788689651;
	b=VXcC7QAdrG9WoE7A2e52mTNC1Ma3SRKec74EJSQxj8WOOOhMUczmWcmDZrU8xaaUl6Qj
	 Zfr1aoMw/6+HnRHRf+hX82sj5AFPA6EjMzTEfxrlNfbaya5MbS2PgjDlMeIz2aCaNe59a
	 y86w02nfGkPYVMIHC/uT25cKGumikHj09gBpIg2bToqFCKw7T3YFsGQ8yJcjNj/c6dGFt
	 U0bU13cfG33ZJrIWwBFW3HlvdjtbXA2cDOw7nZvuy4hcHald+E43jZdRBEvhLl1bvbq7O
	 J0oSyIi48Xsy/qSwBR2BgqZ0on+CrZ8TXLiJwdywg4iwQdih0Pd5ySZkNmEk0OOjoSw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788689651;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/KcLHBo0C1VVskdhG8C9yypveuOYa+WN6werxWxV8c4=;
	b=k6t9sjN7xZL72swwSc9fd1Z2a2kFe4f9JR+a+dODs++RbiwdW2j4EhZaf00Oc4Gg2KU9
	 KgnjCEfDwSS/nGYQjInluCMexwyPcNULS3aqf5i0QnPUC5332FVwh4iEhf7Pj4EW/5oRX
	 85DJ0rVsHPQfmnYuSB0i5D9uTvMHfD/PQiny6GGlc7xIBiqldMYVdqzC17QBchCKlh32o
	 9iYiJXJyKIrXAJf+3KDlTl36rB1U7OjvXUNiW8+3mvBF3riDcji+nVWrHfJvnlHX8u1Nx
	 leIT6xZ/L8ednkJs/0wxiAxdP18obyfllmH25uQraklW5kx5ZDnD8ZppXxPKK1ttS1Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788689651;
	bh=/KcLHBo0C1VVskdhG8C9yypveuOYa+WN6werxWxV8c4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TJ50Iamt3Gn/XP8/ViUCYdxS7cFWror3A2et63avzhXpYs3jdeLXCUSCESHLSru8L
	 APiYBeS59qTK11udDbeqK8ADaifPXMF6TSDX1vEnAbt96gBjKA+013cUo//8NROhnz
	 nIs+liPzTpOq7Y6r/PqGzhc0JDAC1JwaqXvflzWLVuMZqxWSmQYPVtfbeJut+W5CUT
	 TB/gwXkI0PRtAB0Hn9QCEFP6bugBVNu2gceZ3P2UG72WqtFByFnkp+NVFU0YVFmAHQ
	 r2r8+0choDMJwEKzFhUn54cGc60EonXQL73NGFSRhx1Ck20u5kA5FFgnJNXOi8P0qI
	 a5q3s+F5XR+VQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFD09405D1;
	Sun,  6 Sep 2026 10:14:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C23B6990
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 10:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7F0780CFE
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 10:14:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vsIyMRcXCsDw for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 10:14:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8178A80C25
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788689648;
 b=O4irGthLzz+CzxhMnR/Vp1VVzm20gYH0UzVemj0kRaIdwcUNcvvlg5I7BQViSDFz0U3/
 JioYprRJbDmROVQJ6UUXksm4bVdOBkIBK+/T1/cS/rl+JyUcvm8yl2eNGNTd6mD9HONPM
 vgXnATOJLDXCAfm/kz29g/7GfX7t7cUutB7Rq6KjsxSMOzuHE/XM5QnBHkQF5uP8+gWvq
 tSjGJ/CWJHHY2Lo7mHoafu1DK2A236JmdvmAOyKCmNO1E2qb91eBEwC/6XjAqtRAkia3H
 BTgD3WFyLMr4FjZqpdHjzwq3FmXhEGdUAAxo1S06PZ0qmGYoXNZCOj7l8hozv16I6Rg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788689648;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=FbqipcNQ5QRtZU8msjnal7in+agAt8jwm1WzKoiwAnA=;
 b=Dc7Ee67kLvTAc6+94vohEnTgAMpFRRCIHi2hHe3sm7eY7pCEBZIIsgDCZ0ga3OYnqtM6
 8Aej6UK/fa+xWCC/sNY6t/eVnVUBcNpAPYh+C3QbGvSHgxaCjQRKrUCd7nlagI2JAuvoB
 4wBDkMV60dZRbY6LoaSQJMFPRMuN0jdcjRXqpXSyDmmmTZCv8c1Sz2t8yxUZdNJZWumHd
 7HivAyNEwguW6aCk5M8goKrFZaybv3xew2uhlmEOuQJajBYZ3KG/ie8+V0yGG3WAdgirf
 8bi9bRa3vuBTPEsXee4xg1R9ih7gddbkl+pRKsbVE6A4SPjx3Ecmi6fGl9grzrYS50Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8178A80C25
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 10:14:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 10CB295334; Sun,  6 Sep 2026 10:13:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Sep 2026 12:05:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 25b8142ef7b9e09ed7d273571ca61aa92888a39c
X-Git-Newrev: d148168e209fe07660d75f5e56ea00cb3e5f269c
X-Patchwork-Hint: ignore
Message-Id: <20260906101307.10CB295334@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libheif: security bump version to
 1.23.3
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d148168e209fe07660d75f5e56ea00cb3e5f269c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/strukturag/libheif/releases/tag/v1.23.3

Fixes the following CVEs:

(CVE numbers will be added when assigned.)

CVE-2026-XXXXX (GHSA-x8r2-mggj-j6wr) Heap buffer overflow (write) in the
 uncompressed (unci) mixed-interleave decoder when the two chroma
 components declare different bit depths. Both the written bytes and the
 overflow length are controlled by the file. (critical)

CVE-2026-XXXXX (GHSA-8fmq-r4pf-7m57) Permanent decoder deadlock through
 a reference cycle between an image and its alpha auxiliary image. The
 alpha edge was not covered by the cycle guard and re-entered a held
 mutex. (high)

CVE-2026-XXXXX (GHSA-w7mc-p8jc-p853) Heap out-of-bounds read in the
 YCbCr 4:2:0 to 16-bit interleaved RGB conversion when the chroma
 planes have a lower bit depth than luma. Heap memory could end up in
 the decoded image. YCbCr conversions with mismatched luma and chroma
 bit depths are now rejected. (high)

CVE-2026-XXXXX (GHSA-4jqm-2x34-6f6r) Heap buffer overflow in the SVT-AV1
 encoder plugin when encoding a high-bit-depth alpha channel, and a
 double free on its send-picture error path. (high)

CVE-2026-84451 (GHSA-hh47-fhqr-cj2r) Incomplete fix for
 GHSA-73p7-m7gg-w2jv: the tile range check of the unci decoder (without
 icef) could still overflow, allowing an out-of-bounds read. (medium)

CVE-2026-XXXXX (GHSA-4h82-g446-83fm) Heap out-of-bounds read when
 converting odd-height 4:2:0 frames of an uncompressed (uncv) image
 sequence to RGB. (medium)

CVE-2026-XXXXX (GHSA-9rj8-5mp5-26c9) Out-of-bounds read in the RGB to
 YCbCr identity-matrix color conversion when the R, G, and B planes
 have different bit depths. (medium)

CVE-2026-84450 (GHSA-gh5q-69gg-c964) A clap property combined with an
 oversized ispe reached an assert() in the Fraction arithmetic and
 aborted the process (incomplete fix for GHSA-jc8f-p23p-5hjg). An error
 is returned instead. (medium)

(GHSA-mw6f-29j3-76f4) Several smaller findings:
 heif_image_handle_get_depth_image_handle() and
 heif_image_handle_get_depth_image_representation_info() dereferenced a
 null pointer on files without a depth image; the TIFF input decoder of
 the example tools had an unbounded EXIF tag allocation and a division
 by zero on zero YCbCr subsampling; assert()s in the PNG input decoder
 are now error returns; integer overflow in the Go binding's
 ImageAccess.GetPlane(); heif-view now verifies the decoded frame size
 before display. (medium)

(GHSA-8857-r8x5-7499) Undefined behavior (negative shift) in the HDR
 bit-depth up-conversion for target bit depths above 16. Such
 conversions are now rejected. (low)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libheif/libheif.hash | 4 ++--
 package/libheif/libheif.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
index 31fe79b16e..6001e84ce9 100644
--- a/package/libheif/libheif.hash
+++ b/package/libheif/libheif.hash
@@ -1,4 +1,4 @@
-# From https://github.com/strukturag/libheif/releases/tag/v1.23.2
-sha256  8bd5d41d19dc84536d118b04774709f244df6104ef66d623dad5fa4650143405  libheif-1.23.2.tar.gz
+# From https://github.com/strukturag/libheif/releases/tag/v1.23.3
+sha256  11c1179e0e4bec33624b87f22ec42c1e993a40d946d44d26f9c431cf1456a863  libheif-1.23.3.tar.gz
 # Locally computed:
 sha256  fa81ce652315b013359d6e8e4744335f31a50c7c192907176d3632f78a3b4596  COPYING
diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index 755a9909c4..1614dafc74 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHEIF_VERSION = 1.23.2
+LIBHEIF_VERSION = 1.23.3
 LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
 LIBHEIF_LICENSE = LGPL-3.0+
 LIBHEIF_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
