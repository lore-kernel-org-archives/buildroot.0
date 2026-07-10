Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2508C43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 12:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57B9940925;
	Fri, 10 Jul 2026 12:05:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RTrIH5-mUg4O; Fri, 10 Jul 2026 12:05:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 854BC40928
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783685101;
	bh=9G/++yQHPxuRnMWdIbPRznRitCkvMO7lTDaG1YHyUH4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=j1mEB/dSs2uIG9fSe8JE/QQqLDCZmhkfvNP5DL6NjYHRvLpRxGfB4+IUBSWjUSEn1
	 ZbPJQllSajfbCQG3ZxR9ZFUOjiyW+qYugihpH6LeLe54ihzr16MSJwoJyPuo3nmWv9
	 jksPA+EZJ87PCuYxq184//h+tBov0Q52ndTxv7IT/wRbbV4ZBsoLFbgM/BmJRcW+8g
	 GD6LNpgmR6tdUMfAvAYc3KOWj8FRq35aiOaYtrZ4u7C8/kcP7Xa2fMi5D7CXneyF8j
	 KOxOUS6Mo+0Arva6IIKdvZY077dgws6bSO2kAjv9sbURrcVMM/0XYsODQfd1/WvSdt
	 khULOZ1JFT17g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 854BC40928;
	Fri, 10 Jul 2026 12:05:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 270A9320
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 12:05:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CDA4810FE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 12:05:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8KDzqS4PZpvZ for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 12:04:59 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9E61B810FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E61B810FD
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9E61B810FD
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 12:04:58 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 34EC44403F3;
 Fri, 10 Jul 2026 15:04:51 +0300 (IDT)
To: buildroot@buildroot.org
Date: Fri, 10 Jul 2026 15:04:07 +0300
Message-ID: <bb6119f10459ad2ecba91904dbb3bc122f381a5c.1783685047.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1783685091;
 bh=cR6Gtks+Hbta9v683zLt75+DozCELRkJheF2HVWBmc0=;
 h=From:To:Cc:Subject:Date:From;
 b=i0YOl52LrzPSZxy6E1XNYiSXr6yX/llnS0d6kMmi8DnP0oud+ZYlB5c7Rb46q21FK
 HK5Gnk+ZeFWBlhdmgyiWxRxpKYNj8d38Ar3iQN7QTI8d0gckJDCvYirIGPZs3LVenx
 6Zn3cqBy8AHkrkkRMkKaV56x7qLQQQbEFkxrUHQpy6BnaNjyZQxtMOSX6aSqjCbWiD
 q4iNOoih2lcNaV8NqzXBl/GCJUx7lraggT9WfcABDbrrRwiOf25sYc5anJ26G7SGw2
 zv5SDnQseW0TeKphd/X3Cky3Jopf2rPMOzackMSLlY/JfyKEI7xDafDtJgzpKcAsVn
 zEr7/0Tq81J0g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=i0YOl52L
Subject: [Buildroot] [PATCH] package/socat: security bump to version 1.8.1.3
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes CVE-2026-56123: SOCKS5 client buffer overflow. Only signed char
platforms are affected.

  http://www.dest-unreach.org/socat/CHANGES

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/socat/socat.hash | 4 ++--
 package/socat/socat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/socat/socat.hash b/package/socat/socat.hash
index 3a4eec60c1cb..2fc8e4085317 100644
--- a/package/socat/socat.hash
+++ b/package/socat/socat.hash
@@ -1,7 +1,7 @@
 # From http://www.dest-unreach.org/socat/download.md5sum
-md5  5456f0f0c5d4505b68edcb10e23ef128  socat-1.8.1.1.tar.bz2
+md5  1a5b8ddff793847d80aa100d54b7cf76  socat-1.8.1.3.tar.bz2
 # From http://www.dest-unreach.org/socat/download.sha256sum
-sha256  5ebc636b7f427053f98806696521653a614c7e06464910353cbf54e2327adc1b  socat-1.8.1.1.tar.bz2
+sha256  25bc6476292b2e614220989c77b0b6fca87bb2525d9747b31a6639b1fb602418  socat-1.8.1.3.tar.bz2
 # Locally calculated
 sha256  86e46422f9381b386bd2eb6606f9d6c3ff479f905660d0f318c571292ab304b8  README
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index 3d40540599d7..311bdfda3abf 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SOCAT_VERSION = 1.8.1.1
+SOCAT_VERSION = 1.8.1.3
 SOCAT_SOURCE = socat-$(SOCAT_VERSION).tar.bz2
 SOCAT_SITE = http://www.dest-unreach.org/socat/download
 SOCAT_LICENSE = GPL-2.0 with OpenSSL exception
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
