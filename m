Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A8CCA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCD2941296;
	Sat,  3 Oct 2026 10:13:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BNjcisAncIiP; Sat,  3 Oct 2026 10:13:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org CC15B4107E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022390;
	b=L0bU8WHLMPKD08RH3UDf2RPOxCsH3/GmVQFI1BLtLxggEIzKlURh8a2f4cIMnYWVIo5V
	 eMvNvx9LtCG/erUThrGcdmOMujuLXcM6wyG9IPuT/9L/uo9lv0K0n/NJKUxBzftw5pGwz
	 NqTS8N+MA2/k2NsAgBedG572PUGSk74sj1UtxFAnjS3esAEeosm/J4ZkAJGC71ckVQ9O7
	 V0m/2xcF1SGsfQqooPpiWY0KRKmi9ZuO8GlxGJ9yXArYAebuDW2d7TXL/JDrr8BqE3KGZ
	 4+OfxKsoNy5nDuR5hiAP0lT59odE/us3CwhkE6l7G/dvNy+HFf1I8M8a28cOYH/fJdQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022390;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=vRlgoLUvby6QRT0By70EhPWDdFv9eDaeT3YqAG/I+44=;
	b=RlmY/07jl2EPM8mnqnTwYDCTa7cowdWUdcm4d5t0tlfyGUInw4WPYsndgW4s9RQGQiuI
	 wBRc4EoSwN8nP4Umnh301abxLb5im5T2HHuTJmAqnFzqECVRa1O1YrEQDrEN5G55bO3Gv
	 2DvMST4s9kqzVpqStli0Zl7vbvW0KIAdm5m75UD70Wu3D2SH+uHzugn9mv/fyt7zY+/yj
	 KSoo0Q9fZckvqLeaEdv2F2vSJdEI2npHKjj7JG6QP8y26GRVVZK7s0Y13kZVDmMxz1TCD
	 W3YeRAaoJ1WWwpUBHBiH5H8uKPeKsuP1+DPzIXK9saBj+OIdnIisdyhTh8hVKPQ7NJg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022389;
	bh=vRlgoLUvby6QRT0By70EhPWDdFv9eDaeT3YqAG/I+44=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=n/ocxoT0hpWjvg5qDMXrEx/LetISRPZEC0kGeuD/C5i59GbDdiWFKNVRqD+ejRZLo
	 /GDqfKL7CayDTQpljpEjoWN5xIRPO0lTOLQboC2rpXF7GSQcH0zrVcqLbzTc46geqn
	 B8pX01qNDtG1c4eM25oql5Xbw8CBZZjmIypzFC0kmpN3u7aLibJ53iNKNrSwwc71sI
	 gjL5Y8lfQ7kG2WpbJUx0GT7BZA51R6tFzn4yCfI8qCV4VmJlwDo0F8xjQYClbvwoJL
	 2TnKI8Gnr+xOLf4hlzmFQrABqyvxk0MlM/rAD+vZDaM90gOEoSiUu8bPI0oZWfKhnt
	 LlJTyWvo5TqZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC15B4107E;
	Sat,  3 Oct 2026 10:13:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9303E4B7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1FDB1400F6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:13:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zmQiK2hiYydR for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:13:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 3CC9F400AF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022383;
 b=MA7U7YKFYAtuiD5YSU1yRHClfBgG92yaSWq9JGFVvhXAo54sm8K3qUUshBR00pUeIoir
 V4wbUi/qVvPRG+60QCzk+TEHHF55RJAhedOLoV7rBL/9b6Pcl/4d6nRT3TqmsbjUr1bJx
 p5oxLqmRYQLg2mjahvOYN2aVWB97mMhPbLo772CuGKof1iiC+tdKX8n8rOznZ1mcvYXU9
 cc2ZylD8GjPNBCaEg5ae7FuU6W26yXcE2CwH6iSO+jLBHC0Uln9PtwWasx2SPSnXAvO3U
 h7Mb+ARpEE4IC6t0bY14j6Akl3YFuLNw/v+AK8H+FSCSyaNLVbfjjRVh1p5sjT09omw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022383;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=1/AD3rFrpYrDLBFml8Fzix55+0JTppgV5l6dWndOEwY=;
 b=VGJUQb0JJ6za/43W9hysqJz3TRK9jMVqVENQhCF9RugZ+aegiLqj405a3KjGKOv+ff+L
 5qW6A8q35QP8NAPVFgIOGnbIPYQg9aSbxKOGF2l0iCDLJDF8GxBUK1wwksvOxLpWQ+Kwq
 MkUwhF3ro/0CsO3g2dndnzJVLRE0KV6PXnmRsaS3Bc7mN6/oAtN9smO3FB2DIe6tke6jD
 Td5DrJHOOvttXYMvwE8d7/faYHjFaFmjjuKKDqF0kPuMOIT8qV6Ozvs2YgZrI1AIMoaSK
 jI0hOLZTWwHOOOJUxj33Y7/KLHQi//9YGifFrFkvl9rPW0lB2bEKNw52FyEJQz2yACw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3CC9F400AF
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:13:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 98B0388F01; Sat,  3 Oct 2026 10:11:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 12:11:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 55dbc49ec0132143e8aca89ea1e46586af3438cf
X-Git-Newrev: 1156357187bf15c06883a605dbe007e152397666
X-Patchwork-Hint: ignore
Message-Id: <20261003101148.98B0388F01@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pygments: bump version to
 2.21.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1156357187bf15c06883a605dbe007e152397666
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/python-pygments/python-pygments.hash | 4 ++--
 package/python-pygments/python-pygments.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pygments/python-pygments.hash b/package/python-pygments/python-pygments.hash
index 703e0f05d7..ce10f737ab 100644
--- a/package/python-pygments/python-pygments.hash
+++ b/package/python-pygments/python-pygments.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pygments/json
-md5  358297d0a1db8e4beff8eebc0620960e  pygments-2.20.0.tar.gz
-sha256  6757cd03768053ff99f3039c1a36d6c0aa0b263438fcab17520b30a303a82b5f  pygments-2.20.0.tar.gz
+md5  4d661a27d62d2924d4c7b4ab53aa6dcf  pygments-2.21.0.tar.gz
+sha256  610ca751c9bc2492b38eb9a38a7fbc93edbbb2d7182edaf34e66ae493dee5c8c  pygments-2.21.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a9d66f1d526df02e29dce73436d34e56e8632f46c275bbdffc70569e882f9f17  LICENSE
diff --git a/package/python-pygments/python-pygments.mk b/package/python-pygments/python-pygments.mk
index 1daf0db176..1b14b56d8c 100644
--- a/package/python-pygments/python-pygments.mk
+++ b/package/python-pygments/python-pygments.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYGMENTS_VERSION = 2.20.0
+PYTHON_PYGMENTS_VERSION = 2.21.0
 PYTHON_PYGMENTS_SOURCE = pygments-$(PYTHON_PYGMENTS_VERSION).tar.gz
-PYTHON_PYGMENTS_SITE = https://files.pythonhosted.org/packages/c3/b2/bc9c9196916376152d655522fdcebac55e66de6603a76a02bca1b6414f6c
+PYTHON_PYGMENTS_SITE = https://files.pythonhosted.org/packages/49/2e/ced460408999b33da6b31b0021b0f37d329e202d4169aeb164493778f25b
 PYTHON_PYGMENTS_LICENSE = BSD-2-Clause
 PYTHON_PYGMENTS_LICENSE_FILES = LICENSE
 PYTHON_PYGMENTS_CPE_ID_VENDOR = pygments
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
