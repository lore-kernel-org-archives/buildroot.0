Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B87E6FE29
	for <buildroot@archiver.kernel.org>; Tue, 23 Dec 2025 20:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4016C4071F;
	Tue, 23 Dec 2025 20:22:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id roDCqN74yXQk; Tue, 23 Dec 2025 20:22:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A94340751
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766521357;
	bh=xfxFHNZiPFu6TPSBFJGc6DNnLyu7Ucmg+wYz0qycFIo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZzsJhgFrgw/a+B2z9PiJVKNwQV91iAGH0iCJlx+VICw/xHkvQv04vL+xI2ueIc36L
	 rOIINO+JyTJtAcXuWWZaDvrWIO3jcG3wMOZj9RNgrrzTY/nxbjSgl6oFvoOvftnf47
	 xRIky0nOAlmh9G5m7oUS2iJgvz7I8Y/0IUdsp7Hn524mpGetxCZpv4pz2NO1DRXUX1
	 11xYQKNgmch6smEN/Xap4nS6T6w0FZuXfGJfwCE+ZPK88FdO6oNy9CamQuDSAyp+55
	 JvlfiOdv0Gq3uEREdfiMmmXuJ7ijZEb9J2rlvPTSk6R1+ahd9aGuD0rp7tdOWYppMa
	 bZ/GQuyCN8qsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A94340751;
	Tue, 23 Dec 2025 20:22:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2567124B
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 20:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17987400D6
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 20:22:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oocEgACXrcb2 for <buildroot@buildroot.org>;
 Tue, 23 Dec 2025 20:22:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.117;
 helo=smtpcmd11117.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 61B144009C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61B144009C
Received: from smtpcmd11117.aruba.it (smtpcmd11117.aruba.it [62.149.156.117])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 61B144009C
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 20:22:32 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id Y8tqvue6cfibdY8tqvUMLY; Tue, 23 Dec 2025 21:22:31 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 23 Dec 2025 21:22:28 +0100
Message-ID: <20251223202230.3132006-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfAi5qQ+kBa5XRj9q8Fji4N0wyOlYqSOFSYNRg54WUKwRc40FN+dFWuXF2TasrzwH1bstUH9e1XF7HyTG3rYjA7yCsRupqvy8mZlbK4PKiCYcTj4o8TTc
 W2WLF2kkjTjqkpFDnG4A+tkFndZ8VIlnJRpyooURIOG2OAwo+5WaTIC1MgZHprd/Bnzz6SBp5DEkMq0pSDgmR+UckZ3xMm5ymZ1tWqnwRKi7s795PCJ8Opi9
 VvaldDQCLiKbGiM1Ag1zUcAwCsAWw0I/WC9AsiSqU/E=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1766521351; bh=syjE3v0TQpSV48GQAUZ9Xoh4Yyj+Gf4wiJgDIr4uIHM=;
 h=From:To:Subject:Date:MIME-Version;
 b=eQZ5XkzNoIoYosvzrPQ+y3Cu5qmK/OOTqgFa40i/q7IizD9Y4smeVgCuv6Zvp/hj8
 BZhJGYCCIimoVoHd2QUm/P+D7zdAjQuBWBBXz8U9MB2lODIHDMX/fFGtnfIC/gQsnX
 N7zu8cqG2H/6tp0e6ohQbaJgrBUT+OZ9IC+synxoHmgNI8QH6aP6a9zz8Yo1K6NCq4
 GyKdwrt1+eRwfkeqeogfCEdpkp2V2kGO+va1uEOEAwlsWScIcebx6o5RGbSk8gl9Zq
 ZTRMrLtutclHOYildJHIi1IK6GExjxueWd7bL+EpwFISMXUgtwQfAssFJtgPGbsWcA
 VMSoTV0hqdY1w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=eQZ5XkzN
Subject: [Buildroot] [PATCH] package/zlib-ng: bump to 2.3.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release Notes: https://github.com/zlib-ng/zlib-ng/releases/tag/2.3.2

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/zlib-ng/zlib-ng.hash | 2 +-
 package/zlib-ng/zlib-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zlib-ng/zlib-ng.hash b/package/zlib-ng/zlib-ng.hash
index d128565469..a9f879ea18 100644
--- a/package/zlib-ng/zlib-ng.hash
+++ b/package/zlib-ng/zlib-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a73343c3093e5cdc50d9377997c3815b878fd110bf6511c2c7759f2afb90f5a3  zlib-ng-2.2.4.tar.gz
+sha256  6a0561b50b8f5f6434a6a9e667a67026f2b2064a1ffa959c6b2dae320161c2a8  zlib-ng-2.3.2.tar.gz
 sha256  6c9f0d975b41afaa34d22f55bb8986ce69e5cb7ad327cb2b28820cd425edf5ee  LICENSE.md
diff --git a/package/zlib-ng/zlib-ng.mk b/package/zlib-ng/zlib-ng.mk
index 68a3b2d6f3..275c5b86f0 100644
--- a/package/zlib-ng/zlib-ng.mk
+++ b/package/zlib-ng/zlib-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZLIB_NG_VERSION = 2.2.4
+ZLIB_NG_VERSION = 2.3.2
 ZLIB_NG_SITE = $(call github,zlib-ng,zlib-ng,$(ZLIB_NG_VERSION))
 ZLIB_NG_LICENSE = Zlib
 ZLIB_NG_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
