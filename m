Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 864C7C55174
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 16:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B24880E8B;
	Sat,  8 Aug 2026 16:27:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d_lfPqMlORW8; Sat,  8 Aug 2026 16:27:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A52180E91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786206448;
	bh=nKQv/YqGj4J1V0IvwkchyR/m8FBM0u3FVLnstcAEnmU=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=IpBAYCm33YWCL1p7M66KpXte3Z+dmEs+W2iAddJWpEsQB44mjCX/IMJMkUyVvjv3f
	 Y2yQ9cQ1UEJUXrWlmCjwRSHV4FMHsOtuHcNfy2GiXh436sSu15m5f0M5Qw6VDDDmNy
	 mdi6lAbhXm6JjORAmY/g2wkaTVrfpY8V0qyirFZ9SyJebQNLmqrAISlHw5c6uoXZ0u
	 aQ25H6Ixqqc4b7iqKtb8a3xcpEnZIkKhX9p94T1Ds1O4eF7dWsCXU7TcQRMQvCD18W
	 3zV/V8KjfTKoxwH/BFCB+BYA/xAinplhq5Z+zxqqvKjTfPAIi1YwVdAOUwoqIpLX+a
	 nXtXxeSUw9y2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A52180E91;
	Sat,  8 Aug 2026 16:27:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AAE03282
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 16:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91804400D3
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 16:27:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VLAn7bJgh7ZP for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 16:27:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CF5E94008F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF5E94008F
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CF5E94008F
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 16:27:25 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id C20384E41162
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 16:27:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8E2D06045E
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 16:27:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C3A7311C4859D; 
 Sat,  8 Aug 2026 18:27:17 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  8 Aug 2026 18:27:15 +0200
Message-ID: <20260808162715.1331483-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1786206438; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=JUnIaSMHJkraU5YTH97gEc4daHjdJpTbV5U6wuGI4Yw=;
 b=j4Hr1s/bF513iZTboW+YyHT8MIQ2AkhpWc9B7sQu5yghjSCiMc648TugaTOeGhLx02eMkh
 Bznn4y7oVbZ7N9XxB5g5q+9s41xWvml6ZaixHBIJJL/moWLJlZwO0+nuKwsokw8zzd65Ws
 LJQlzT0h3s6s5IndHgfW1rHpkdCNnuA2NDPx+Ot3knVx8InTknMiYJDkQmig/xAN6sPt+v
 /+4XYznvrZadsYI5AdMvkdw6GFKfJSOPNoEhTglxXloGk+ESunJCBZdKgCNrN5VDB7//Kq
 tD1o3BD9xbY+b0fUwivcfd0zq7jVf4rbzaG8Uf8NM+qXsFrY3ejlGu/mp4Ylgg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=j4Hr1s/b
Subject: [Buildroot] [PATCH] package/genext2fs: bump version to 1.6.2
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

Upstream doesn't provide any useful changelog, but the number of
1.5.0..1.6.2 commits is reasonable:

bfc28c7 Define {MAX_,}RESERVED_BLOCKS as floats
5b93731 Recover automatic block number calculation
d6e659d Correct message for minimum block count
1b2a30e Correct also commented code to take into account reserved blocks
944a4fd Indirect blocks must be taken into account for stats
3e2fce1 Restore (MAX_)RESERVED_BLOCKS to integer division
b571221 Add missing newlines on error messages.
cd4ff51 don't call ftruncate() on stdout
6909cde Enable system locale - change from the standard (C) to system locale.
9651f5d Fix alignment issues for strict architectures
4a99c22 Hardcode length of hardcoded char array instead of sizeof(long)
1f38ba4 Add ordered directory traversal
84c2d01 Add ordered directory traversal test
467ebe5 Fix formatting of man page references
810c12e Fix auto-block calculation from PR #5 merge
28988bd Skip device table entry when parent path is not a directory (from PR #33)
45191ab Fix ordered directory traversal from PR #34 merge
b615521 configure.ac: teach autoreconf to detect and install macros in m4
81028ca configure.ac: upgrade ancient snprintf macro to modern autoconf-archive edition
67661a1 Fix EXTRA_DIST: reference new ax_func_snprintf.m4 instead of deleted ac_func_snprintf.m4
907737e Remove incorrect address
4c4343d Add licensing information
cb5f584 Add license information
a60ccd9 Use strrchr to split path:dest so host paths may contain colons (fixes #23)
44ff03d Implement sparse_super feature with superblock/GDT backups (fixes #29)
8b8f2d1 Add extended attributes (xattr) support (fixes #9)
d0a9274 Optimize block/inode allocation for large filesystems (fixes #31)
b69c34e Fix -d dir:/path destination: restore colon after stats pass, auto-create intermediate dirs
2c38700 Add 9 functional tests for previously untested features
3d3bcb6 remove useless NEWS file
03dee74 Bump version to 1.6.0 (fixes #28)
c8f41b9 Make xattr copying opt-in with -X/--xattrs flag (fixes #40)
3324695 Bump version to 1.6.1
4e5d8ae Update README: add -X/--xattrs, SOURCE_DATE_EPOCH, and missing device table types
bf5b1a0 Bump version to 1.6.2

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/genext2fs/genext2fs.hash | 2 +-
 package/genext2fs/genext2fs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/genext2fs/genext2fs.hash b/package/genext2fs/genext2fs.hash
index 20bb1c641b..75e40f0caf 100644
--- a/package/genext2fs/genext2fs.hash
+++ b/package/genext2fs/genext2fs.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  d3861e4fe89131bd21fbd25cf0b683b727b5c030c4c336fadcd738ada830aab0  genext2fs-1.5.0.tar.gz
+sha256  b8aba9af48e664fa60134af696a57b3bb4ebd2b2878533d7611734e90b883ecc  genext2fs-1.6.2.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/genext2fs/genext2fs.mk b/package/genext2fs/genext2fs.mk
index adfa412e66..c2c7abbaf5 100644
--- a/package/genext2fs/genext2fs.mk
+++ b/package/genext2fs/genext2fs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GENEXT2FS_VERSION = 1.5.0
+GENEXT2FS_VERSION = 1.6.2
 GENEXT2FS_SITE = $(call github,bestouff,genext2fs,v$(GENEXT2FS_VERSION))
 GENEXT2FS_LICENSE = GPL-2.0
 GENEXT2FS_LICENSE_FILES = COPYING
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
