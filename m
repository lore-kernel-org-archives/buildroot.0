Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4331DC43458
	for <buildroot@archiver.kernel.org>; Sun, 12 Jul 2026 00:10:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6E7E817AB;
	Sun, 12 Jul 2026 00:10:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yQQRS-FSTly5; Sun, 12 Jul 2026 00:10:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5362819D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783815045;
	bh=86qE1lSOyNsbXBAgDWFok0vMlDLNjnrdPIeQKIwoXE8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nAhgrB7g+DuQYEtzAmrf5XgttbauowqX4zPwojEQyhEteq4Bzv/AmY1XVfvAuxWZx
	 2ZjItYbY2u0s3Dj4gK1fq5haVoOk6jasrPtBQQebZpEysjgVE1IcO0+hX99GIqDqPI
	 E1/NeZ7EYFf/M7X+4Kyutmvgh1SDzrAi5+hBUrRp7DLiBt7vyEfMYIWQzUGo4Aw4Z4
	 tDSFhMSun3EhYBfhqiFBN9MdYNj5Inj8/CpNEPr+tOs62xb0BIXvw/FeY6aBe/efi3
	 9AbdLH+Y4zJD07xo24LS3q6bZu6VS+rnYevqPpsHGZ80DHJ/hcjiThsjUSmos0OL87
	 Wd9JbsBO/Ldlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5362819D5;
	Sun, 12 Jul 2026 00:10:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 618CB2EE
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 00:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 47A21606A5
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 00:10:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oO7XoxPzOP7m for <buildroot@buildroot.org>;
 Sun, 12 Jul 2026 00:10:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5C4786078C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C4786078C
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5C4786078C
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 00:10:42 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MMXQ5-1wRrcN2QGF-00X3w3; Sun, 12
 Jul 2026 02:10:40 +0200
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>
Date: Sun, 12 Jul 2026 02:10:13 +0200
Message-ID: <20260712001013.101890-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260712001013.101890-1-fiona.klute@gmx.de>
References: <20260712001013.101890-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:ZN+H/MZe2Dhwi0e/5IU9USaEazsZ3T44ITckauy7wHphKcqakjk
 kXQYIVyS41otri5Z26ej3ivsnJDORVYJktZyfAMnI6p2E5qf861XbPXPn28Bnw87DLCdefF
 2FtaFcOc01uy0FupXQDjaFpt1LyjJaJHxGUAmh1PM9sJ794Zeuju2QMJmfgn/WvVSa6z2OH
 kjqOhYzqFbDdy0Qq6iriQ==
UI-OutboundReport: notjunk:1;M01:P0:VJxetGMYaJ0=;LjW1QdouMCqHGJNg96JiLaAmzZg
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1783815040; x=1784419840; i=fiona.klute@gmx.de;
 bh=7NXQa0F7vClNiyD3ZKmgRzx1rMfgmhJ/ZLj1PXiKEZc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=dkmqtOei6av7SNAv1gBXtuwtxLvE/lhEQwqkSm96C63jfruUP995taXKQQoDmERo
 Ph2gFb8yz8ttudiQ4/PqulUqHfMDLEySLrA0R11ZKH5Dv06Ivmh2xaQmODRZNdfBr
 iRQn2gjvmZ+f07WFsHJNbQ1eIiB97khilNV01CuFBxRsmT03s/OmIPYmHpShrll0T
 1gR/UAS7DzoafaPVarLZIF96o1EkZOcsk0iE9/yyIUOQ1DvlWJdTzFsk58cDuhSzu
 g/1LtBUvgZT9dAtfdUHelCFwGujvgxkgze3rXbvvfxTMtISp68wXKdAVAvWqk0Ktp
 1W64TdXRMunekVO8uw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=dkmqtOei
Subject: [Buildroot] [PATCH 2/2] package/btrfs-progs: bump version to 7.0
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

Upstream changelog:
https://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git/tree/CHANGES?h=v7.0

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/btrfs-progs/btrfs-progs.hash | 2 +-
 package/btrfs-progs/btrfs-progs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/btrfs-progs/btrfs-progs.hash b/package/btrfs-progs/btrfs-progs.hash
index f12c76c2ee..cf3a8d381d 100644
--- a/package/btrfs-progs/btrfs-progs.hash
+++ b/package/btrfs-progs/btrfs-progs.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/sha256sums.asc
-sha256  3382a84e3fcfe1ffdea07a61ab3f4e86665d38fa35f1f34548d5df867423e0df  btrfs-progs-v6.10.tar.xz
+sha256  c286d6876cbcd72327a0b417e4cfd280353ec23e37b549fdbcd7800a832d9a99  btrfs-progs-v7.0.tar.xz
 # Locally computed
 sha256  0d5bf346df9e635a29dcdddf832dc5b002ca6cdc1c5c9c6c567d2a61bb0c5c15  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  libbtrfsutil/COPYING
diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index 8691a5710e..d9a3a8a858 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BTRFS_PROGS_VERSION = 6.10
+BTRFS_PROGS_VERSION = 7.0
 BTRFS_PROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/kdave/btrfs-progs
 BTRFS_PROGS_SOURCE = btrfs-progs-v$(BTRFS_PROGS_VERSION).tar.xz
 BTRFS_PROGS_DEPENDENCIES = host-pkgconf lzo util-linux zlib
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
