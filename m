Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ABB4FAD3E2
	for <buildroot@archiver.kernel.org>; Wed, 22 Apr 2026 23:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83C2C4097C;
	Wed, 22 Apr 2026 23:34:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UJXm8i-9h9m3; Wed, 22 Apr 2026 23:34:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FE1C4097E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776900882;
	bh=fDpQXIPdXqijSW8bRFBIRg+8srtakblk2q0EUwJHCcg=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=O2ERh30Rm3A6q4xWzxsTi4aaX/CYbMEJHzsoXIDMAgxiDINe8npd+GvbkTVXB9CzO
	 wqUP5jynVnpNtVlaZ+u9vE9EoiDW6VTYMp3Urtk5UEClP7sMV4ckz39RTdD1jpmF6k
	 iBpPMYobmZZwBN1mzdFLfYIk7PgoDIPLrr0qLrqdQj89MDQXTn/tROhLVRo7sZ6ZTq
	 hrLWjCrcxQ/kGtkq6euL3rPbMDyUBZX9nwDTBVGjtM3w194pAueDNK5m3ZOML3uCXH
	 Y/liyNVQ3wUnTzhhAZd9jdkeaDtrmU0bPamhDr2NKMNgUBWCnU/Na3qIQFRRH1AufT
	 d5mExZ/c6FWeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FE1C4097E;
	Wed, 22 Apr 2026 23:34:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C063224D
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 23:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A585A4097E
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 23:34:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d_GOO8GNKmZG for <buildroot@buildroot.org>;
 Wed, 22 Apr 2026 23:34:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 217024097C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 217024097C
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 217024097C
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 23:34:38 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M6Daq-1wHrsp2Vdw-009qxe; Thu, 23
 Apr 2026 01:34:35 +0200
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>
Date: Thu, 23 Apr 2026 01:34:21 +0200
Message-ID: <20260422233421.1804260-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:R2JP0IdxU6Kkqia077w/EQXR6S2qWjJcLdzbt6aO/hu8nj4oT3R
 p+XlP0EbBpsoGvgPkedrBTrc+Cm+uh81NJLFcmBfTiMdfC7ye4XzQ1wi4247wjys9tPIMeY
 Lm21OVX8mXML3T5a9onU8kkk9ZcE6DJE7ieNwuvYxJPK/F/Zr6tqHX5ZW051LZLoiZQjP/m
 iAQNVi0oSkypM54QKs1cQ==
UI-OutboundReport: notjunk:1;M01:P0:XYFgo4avCcw=;P0vIguPIVwasfQAZ081DAZcIVyC
 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
 N5Q2A4DPH/mmJwaZ0vJ6gUiVC+vuUVFhXugE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1776900875; x=1777505675; i=fiona.klute@gmx.de;
 bh=3Pq3h9mwbDlTafPQJ6ThQ58AmbnKODFDsWVRpaN2z6M=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=SoxkA14pUcFPZohnWkbXXokIHNnyW/PorR9QlattveffLlkQ1BDZOp5ZiUdelWxC
 ffDZECAAhvdQo1k1GeyjMpO7kkT3HSzOZgPYS614ZkSp0+2mKl/WrKs/BH0SD2kxJ
 1YHus+VMm73JP/gDfyyBE5fV6AWjA+wFjY1NFQHSWj8xaUoH9Ap4HQ3F+7eD3l+rr
 wvIAx/PpeCoDkFZzwl8EOr8fQOvKdn5hASm0iJApwbip5XqyCKWmXUqr2eI4l6PgD
 Z94g0l7+wb77FsDYXXa131z5TINbVyIGDVcSQjZoNIxLaw2Lkb2bwNsVIyoxG9638
 lq0ZLIL37xVQ2N3AMA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=SoxkA14p
Subject: [Buildroot] [PATCH 1/1] package/btrfs-progs: remove unnecessary
 autoreconf
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 1c11f9020ad98db11e6d67066d0fdb2cfab27605 removed the patch
changing configure.ac with the bump to 6.10, so it is no longer
needed.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
This patch is a side effect of me trying to update btrfs-progs to
6.19.1, I see now why so far nobody did: It breaks building a btrfs
rootfs image with fakeroot, because fakeroot does not handle nftw (which
btrfs-progs started using with 6.10.1).
See: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1081976

This little cleanup should still make sense. :-)

 package/btrfs-progs/btrfs-progs.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index 273c7e37f2..8691a5710e 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -13,9 +13,6 @@ BTRFS_PROGS_LICENSE = GPL-2.0, LGPL-2.1+ (libbtrfsutil)
 BTRFS_PROGS_LICENSE_FILES = COPYING libbtrfsutil/COPYING
 BTRFS_PROGS_INSTALL_STAGING = YES
 
-# 0002-btrfs-progs-add-uClibc-ng-compatibility-for-printf-f.patch
-BTRFS_PROGS_AUTORECONF = YES
-
 # Doesn't autodetect static-only and tries to build both
 ifeq ($(BR2_STATIC_LIBS),y)
 BTRFS_PROGS_MAKE_OPTS = static
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
