Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC6D5C55162
	for <buildroot@archiver.kernel.org>; Sun,  2 Aug 2026 19:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3956B8095E;
	Sun,  2 Aug 2026 19:44:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PtkXKpr1Rj6P; Sun,  2 Aug 2026 19:44:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5464A80969
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785699883;
	bh=Pxb/i1IOYZTTYxGMtysV9jeWH14E1wm/6XsEe19XR8I=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=hjU7Z4FNV1Bw14vy75ZN61hgjCeNsgqrwidoT9AJEP8RoH8Wn09+F/n5Wi+0dopSH
	 6P1uMLlg8KmQ5dPP4gvzakytUF9+aOyBsS8524ziF7ED/+2lRXRtWj344kw9CgyTc/
	 jIiK9UA0EW54ZKwdilE3EtuxheIHdkBR1Rl9ysAgNWrOAJfyO1eFlnnH36IiGkNWjj
	 4L3H0skF47j8GRbME/tBKSZ62IEgKKZD1cUwHvQ87LAX18fOJeDtb1h9G8bqt3aHgk
	 hZZfkGzMgCbxIKhHLx9xQm6ZuW7fXInt/NBPgOJYAgw3+BetcVvj1Cw3tRVIvjiMFO
	 fAjA/HgkNXsYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5464A80969;
	Sun,  2 Aug 2026 19:44:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 54D222CE
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 19:44:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A74B80969
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 19:44:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JJ4GySXLiINE for <buildroot@buildroot.org>;
 Sun,  2 Aug 2026 19:44:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9D1158095E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D1158095E
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9D1158095E
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 19:44:37 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N6KUT-1x1HP13zGz-0152O6; Sun, 02
 Aug 2026 21:44:35 +0200
To: buildroot@buildroot.org
Date: Sun,  2 Aug 2026 21:44:21 +0200
Message-ID: <20260802194421.1914703-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260802194421.1914703-1-fiona.klute@gmx.de>
References: <20260802194421.1914703-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:AtH0HmDki39riC77aOgEWXcV4Z2dplNsTwMwyW+7+pF9/aULs5L
 3A6+cjp9nDClEvkL25vU+2/7A0S5HKVnWCKEpTI9SVM2//Z1Pt0YY4BVdId/Cdm6O7Bmm7P
 m4X9jTejoAM+Ygt8v5TpXpOp5VCYr+mVBjpc3JuXxvBtBfB9Lowi8qAw/bdsQM7/whuNuMd
 CpGXbzu5C7LK/wAVJuJfg==
UI-OutboundReport: notjunk:1;M01:P0:msgnNmOYgIQ=;ESD9rlvW+jdNY3MCxJPa/Mh6Ntm
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1785699875; x=1786304675; i=fiona.klute@gmx.de;
 bh=LGzzE+4fKWwMtr8QGO2qnDT3q6zuTEw50Z2LP+yoTHc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=tSphTGckGs+x1OJIq/Y49uH95Inr/jhHql+v/F9Ieisnq7fPWizMnAUvgRAkWXM2
 86coo9cnZSIFR2GZKLOpcQjF94DrWeuXKGQm+71KrhRl2DyD4vAhZFjeX7clG82Nw
 OEk8H0iSqHhr4IgZiD3vuv2L+53dH2FbF/kX7V+6bZrVdBXGAtNIvnsNz5xsNz8sx
 10ytArYF5vqIRinmU9Bh9T4NyHsTHaEGASl9BaSo8QciTbhi9J5+xLnwXOKqvQSSZ
 2FbaBRcja1BgbES9WlhTY5y2Cp9h+P4rIk7PghQBz8B/AtQZTdZpACFeXvPx6HHid
 9TZ7J1b5rrRGUaT/vA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=tSphTGck
Subject: [Buildroot] [PATCH v3 2/2] package/btrfs-progs: bump to version 7.1
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
Cc: Julien Olivain <ju.o@free.fr>, Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream changelog:
https://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git/tree/CHANGES?h=v7.1

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
Changes v2 -> v3:
* update to btrfs-progs 7.1 instead of 7.0

 package/btrfs-progs/btrfs-progs.hash | 2 +-
 package/btrfs-progs/btrfs-progs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/btrfs-progs/btrfs-progs.hash b/package/btrfs-progs/btrfs-progs.hash
index f12c76c2ee..38bf9cf4a0 100644
--- a/package/btrfs-progs/btrfs-progs.hash
+++ b/package/btrfs-progs/btrfs-progs.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/sha256sums.asc
-sha256  3382a84e3fcfe1ffdea07a61ab3f4e86665d38fa35f1f34548d5df867423e0df  btrfs-progs-v6.10.tar.xz
+sha256  d1f55cc2971398c9142eaa79d203e63d586a3b4b867f956664a1d68322cd4e34  btrfs-progs-v7.1.tar.xz
 # Locally computed
 sha256  0d5bf346df9e635a29dcdddf832dc5b002ca6cdc1c5c9c6c567d2a61bb0c5c15  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  libbtrfsutil/COPYING
diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index 8691a5710e..ad724657a7 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BTRFS_PROGS_VERSION = 6.10
+BTRFS_PROGS_VERSION = 7.1
 BTRFS_PROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/kdave/btrfs-progs
 BTRFS_PROGS_SOURCE = btrfs-progs-v$(BTRFS_PROGS_VERSION).tar.xz
 BTRFS_PROGS_DEPENDENCIES = host-pkgconf lzo util-linux zlib
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
