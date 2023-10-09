Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF98DE95A9E
	for <buildroot@archiver.kernel.org>; Mon,  9 Oct 2023 15:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BDBA6129D;
	Mon,  9 Oct 2023 15:50:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BDBA6129D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9rHGl0CWBfZO; Mon,  9 Oct 2023 15:50:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F85A61156;
	Mon,  9 Oct 2023 15:50:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F85A61156
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DEAD81BF364
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 15:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3B78410E4
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 15:50:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3B78410E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hnqlwcaTKM5N for <buildroot@lists.busybox.net>;
 Mon,  9 Oct 2023 15:50:23 +0000 (UTC)
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 59FFC409F3
 for <buildroot@buildroot.org>; Mon,  9 Oct 2023 15:50:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59FFC409F3
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-351437112c1so19287845ab.3
 for <buildroot@buildroot.org>; Mon, 09 Oct 2023 08:50:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696866622; x=1697471422;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8GHDPBJEfy0x0fQKbcvlYMfxDXszJIfuzIjQPQRJ7Fc=;
 b=sY5jBSWcIxrstgsqpCSI7fuRufs2zyTc5sMSaJTFxl1fyEvR9Y2oKk8SWIMgCjeKYZ
 8H0E/OFoQzW7RtIM/sRvC4mJx7jmtQBpWnxS6NGFemlSVsKEAa2X5dSkpkzvqoW00WW5
 uW1DdW7YKmnUAr4snNV+XL0nFhifbj28mEBAK9JT717Ji2O37RqLrbYI1ob+G/neV4Vm
 R4PyVLhaIOIRNYzqhY0+Ie8nbJklAsML/VGeFJT7HlDlJ2oUoDU6pxoqGcml1M2C9psu
 fXlC0Z+U0CIf5eOeUVjKcjWmV9pq+y9CeJWhfciUb6jjIWz/nDJi0j2BfQ7VjBS5wnq5
 u2Sg==
X-Gm-Message-State: AOJu0YzU7SDU0GyoqGK6TaeOBGH3tr2i7k1qLN4JCxvIc1sVfSed2QBo
 nagGQQjVBS6s5RhSRzpZ/FFRsxJndFbsuw==
X-Google-Smtp-Source: AGHT+IGlDOa5LXPAzaKoZfFfqn0K7KDqfvWFqaB/C85tnxbwO721DTBdqKvUoaNNtY3pza5SVtCoGw==
X-Received: by 2002:a05:6e02:1808:b0:348:ac7f:69a2 with SMTP id
 a8-20020a056e02180800b00348ac7f69a2mr20640527ilv.15.1696866621772; 
 Mon, 09 Oct 2023 08:50:21 -0700 (PDT)
Received: from james-x399.localdomain (71-33-152-19.hlrn.qwest.net.
 [71.33.152.19]) by smtp.gmail.com with ESMTPSA id
 v13-20020a92c80d000000b0034e2572bb50sm2972955iln.13.2023.10.09.08.50.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 08:50:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  9 Oct 2023 09:50:18 -0600
Message-Id: <20231009155018.1310642-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696866622; x=1697471422; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8GHDPBJEfy0x0fQKbcvlYMfxDXszJIfuzIjQPQRJ7Fc=;
 b=Tk/EmArEsKcejgFyIMYYJMFDOIeVcWLMwr0DIYRFBe5t5uGAu0dtSMicGs+i7gIYl4
 uxErAMMKRaPTpDK/dx17Z1VCNqnKhO3VaTJJwpXawrxFgvReHLCBUOgQ6G99QqHV9MR2
 0OH6PvPruXSc2hVKy8GOJ87DYt//99Pd9q1lt0gfj8WmwRotTdD8GuMANIxJqGyR/4T7
 5jf+oDU1cm7f1NFQESUwEmYk5CLX13M3khmmyL9CpuEfdTAbMGDmoiFIFZCAymZFoheC
 mJ5sKVhGymarIq+Ez2924ji9oB/MxSJo5Opbxt32/82rmouegAd4iLjc95cazrayuG1h
 KXrw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Tk/EmArE
Subject: [Buildroot] [PATCH 1/1] package/libubootenv: bump to version 0.3.5
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch which is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...-fix-bug-when-SPI-flash-write-size-s.patch | 71 -------------------
 package/libubootenv/libubootenv.hash          |  2 +-
 package/libubootenv/libubootenv.mk            |  2 +-
 3 files changed, 2 insertions(+), 73 deletions(-)
 delete mode 100644 package/libubootenv/0002-Revert-fw_setenv-fix-bug-when-SPI-flash-write-size-s.patch

diff --git a/package/libubootenv/0002-Revert-fw_setenv-fix-bug-when-SPI-flash-write-size-s.patch b/package/libubootenv/0002-Revert-fw_setenv-fix-bug-when-SPI-flash-write-size-s.patch
deleted file mode 100644
index 414cb3d205..0000000000
--- a/package/libubootenv/0002-Revert-fw_setenv-fix-bug-when-SPI-flash-write-size-s.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 35bbc4d8155ed86ca7200e060dad98bdfbce684d Mon Sep 17 00:00:00 2001
-From: Stefano Babic <sbabic@denx.de>
-Date: Thu, 15 Jun 2023 16:54:46 +0200
-Subject: [PATCH] Revert "fw_setenv: fix bug when SPI flash write size !=
- sector size"
-
-This reverts commit 44ecc1c216007272a6f99a104a71c9d410969d9e.
-
-mtd writesize was errouneously interpreted as maximum allowed size, but
-it is the minimum size. The patch raises performance issues because on
-NOR flashes single bytes are written.
-
-Signed-off-by: Stefano Babic <sbabic@denx.de>
-Upstream: https://github.com/sbabic/libubootenv/commit/9f17a00ee56dc5cfb1d9b51e6639d67b64cb3309
-Signed-off-by: Brandon Maier <brandon.maier@collins.com>
----
- src/uboot_env.c | 29 +++++++++--------------------
- 1 file changed, 9 insertions(+), 20 deletions(-)
-
-diff --git a/src/uboot_env.c b/src/uboot_env.c
-index c5eefe7..76e2619 100644
---- a/src/uboot_env.c
-+++ b/src/uboot_env.c
-@@ -712,8 +712,6 @@ static int mtdwrite(struct uboot_flash_env *dev, void *data)
- 		sectors = dev->envsectors ? dev->envsectors : 1;
- 		buf = data;
- 		while (count > 0) {
--			int blockcount;
--
- 			erase.start = start;
- 
- 			skip = is_nand_badblock(dev, start);
-@@ -744,26 +742,17 @@ static int mtdwrite(struct uboot_flash_env *dev, void *data)
- 				ret =-EIO;
- 				goto devwrite_out;
- 			}
--
--			blockcount = blocksize;
--
--			/* writesize can be different than the sector size. */
--
--			while (blockcount > 0) {
--				if (lseek(dev->fd, start, SEEK_SET) < 0) {
--					ret =-EIO;
--					goto devwrite_out;
--				}
--				if (write(dev->fd, buf, dev->mtdinfo.writesize) != dev->mtdinfo.writesize) {
--					ret =-EIO;
--					goto devwrite_out;
--				}
--
--				blockcount -= dev->mtdinfo.writesize;
--				start += dev->mtdinfo.writesize;
--				buf += dev->mtdinfo.writesize;
-+			if (lseek(dev->fd, start, SEEK_SET) < 0) {
-+				ret =-EIO;
-+				goto devwrite_out;
-+			}
-+			if (write(dev->fd, buf, blocksize) != blocksize) {
-+				ret =-EIO;
-+				goto devwrite_out;
- 			}
- 			MTDLOCK(dev, &erase);
-+			start += dev->sectorsize;
-+			buf += blocksize;
- 			count -= blocksize;
- 			ret += blocksize;
- 		}
--- 
-2.41.0
-
diff --git a/package/libubootenv/libubootenv.hash b/package/libubootenv/libubootenv.hash
index b881994bfd..887ad6843d 100644
--- a/package/libubootenv/libubootenv.hash
+++ b/package/libubootenv/libubootenv.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  78faadcfac67e50273e5d4e95e6cf6fee3d486ce9dc568d1fe25312271a88768  libubootenv-0.3.4.tar.gz
+sha256  dc27ddcb377e259d898256e90449bc3128437660cacc33dc75f6630d3e52c44e  libubootenv-0.3.5.tar.gz
 sha256  0558101984550fa84d1d13c2af11d116c20079d2be58711e8d99cadce7009192  LICENSES/CC0-1.0.txt
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSES/LGPL-2.1-or-later.txt
 sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSES/MIT.txt
diff --git a/package/libubootenv/libubootenv.mk b/package/libubootenv/libubootenv.mk
index b4c9588107..e5f5e9b15a 100644
--- a/package/libubootenv/libubootenv.mk
+++ b/package/libubootenv/libubootenv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUBOOTENV_VERSION = 0.3.4
+LIBUBOOTENV_VERSION = 0.3.5
 LIBUBOOTENV_SITE = $(call github,sbabic,libubootenv,v$(LIBUBOOTENV_VERSION))
 LIBUBOOTENV_LICENSE = LGPL-2.1+, MIT, CC0-1.0
 LIBUBOOTENV_LICENSE_FILES = LICENSES/CC0-1.0.txt \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
