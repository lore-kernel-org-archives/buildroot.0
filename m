Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 635ABC5CFC1
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 10:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E9F2812E3;
	Sat, 15 Aug 2026 10:03:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KQWFIovNCZ8F; Sat, 15 Aug 2026 10:03:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15C938126A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786788201;
	bh=EvMz/AgVa3egrK+4aR2Uetb3v+bEcj3XoU6CbwAx0LQ=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=meVyhoBkIPzmfKXnrtgLoJUf+NQQlZrYNLdocwUHu4JEpaz9QM5I0f6qfZIpqDoar
	 C54pTVuIvfCTXK0XQlG8UrHXrmzISUkagd/MWlkHedo8skHlM/6jJvFUoPsagqthw5
	 KVMUvuENY7XVpf2s3ovjjDSDkltWct23gmQOJgFY3Li5e12Bp+M9D1eXb3GYTBCwct
	 GY8XvXNG9IpEqXIBD5aa5gFl2q3TD/H90RAvxtuariwvuvIVa6r4APbteBqni6SNaI
	 u1g60zrIZFmz5KYC+qorPveQSukSYMVuxQol57zyOjEuzCiUUp6BR9jEVlnY6EYG/0
	 AyuuE1TT7nffg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15C938126A;
	Sat, 15 Aug 2026 10:03:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 816F333B
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 10:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5EC1C8126A
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 10:03:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jb9R9XEoHN4p for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 10:03:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6570980F2F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6570980F2F
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6570980F2F
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 10:03:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 0D6FB1A1660
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 10:03:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BD295604AA
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 10:03:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C9FFF11C4F4A4; 
 Sat, 15 Aug 2026 12:03:08 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 15 Aug 2026 12:03:06 +0200
Message-ID: <20260815100306.100753-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/cramfs: bump to version 2.2
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

Changes:

Security and robustness release.  Notable cramfsck changes:

  * Reject dirent names containing "/", "." or ".." to close a path
    traversal during `cramfsck -x` (reported in issue #12).
  * Open regular files with O_CREAT|O_EXCL during extraction to
    prevent duplicate-dirent attacks from truncating files reached
    via a previously-extracted symlink.
  * Fix outbuffer NUL termination and a 1-byte overflow in
    do_symlink when running with both -v and -x.
  * Harden romfs_read against truncated/malformed images by
    zero-filling the window buffer and checking lseek/read returns.
  * Reject directory entries that extend past their parent's size.

Documentation: README now documents cramfsck and lists all current
mkcramfs options; stale hard-link and endianness claims corrected;
NOTES trimmed of the 25-year-old Future Development section.

(See https://github.com/npitre/cramfs-tools/releases/tag/v2.2)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cramfs/cramfs.hash | 2 +-
 package/cramfs/cramfs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cramfs/cramfs.hash b/package/cramfs/cramfs.hash
index 672266b468..3795c862c9 100644
--- a/package/cramfs/cramfs.hash
+++ b/package/cramfs/cramfs.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  cdb7a4ecad034f063b6456b37cdf653ae31758a224c32161e54712a9d7f01cc3  cramfs-2.1.tar.gz
+sha256  6217c93cbfa79ae720bad4139739c1bd7a665928a9bfc2dd820b98df27c66da2  cramfs-2.2.tar.gz
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/cramfs/cramfs.mk b/package/cramfs/cramfs.mk
index 85706d1a8e..a6196ca85e 100644
--- a/package/cramfs/cramfs.mk
+++ b/package/cramfs/cramfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRAMFS_VERSION = 2.1
+CRAMFS_VERSION = 2.2
 CRAMFS_SITE = $(call github,npitre,cramfs-tools,v$(CRAMFS_VERSION))
 CRAMFS_LICENSE = GPL-2.0+
 CRAMFS_LICENSE_FILES = COPYING
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
