Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F063D262A0
	for <buildroot@archiver.kernel.org>; Tue, 20 Jan 2026 20:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0A6081EB4;
	Tue, 20 Jan 2026 20:45:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ir_GvHVWsmY4; Tue, 20 Jan 2026 20:45:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F4C381EAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768941925;
	bh=alsyBWDF0Sz27xPZ4aaZzNYsVDNPm5TzmLeZmHOKaTI=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=DRx5v6Rz4TPvibg5GF5whR0jQkaqgx0/ZBsgzAJC+NXiZ7RZajJ0Xxx4FaPBw8pw/
	 BTSCfkZmRuRJquQG0Lg2rgv3Bw+GtvCR3+ITamvBL4gfALrifpTexfOYadLqDPlavv
	 m0CZWCU2ZOEBSW7V+E4IZBHGgZb/4KL2XWhQltrMEsbYI6QZIeOvXbxd5zziBFNSVa
	 59nwjF71y/iG++pFs4oBRNBvC8M36wpnpq0AXh7zpOSybESG/c+IejEdyT2BwuTtlO
	 mZGp4vMP/8znZfxNrV4O2GHyJN088hoonT/76oivyWJ+q8WVwa0y5WQkT0tN3J2Jfp
	 jzf3KdWr4eBUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F4C381EAD;
	Tue, 20 Jan 2026 20:45:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C4496160
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 20:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B02B960ADB
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 20:45:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aAL8d4m7NgtX for <buildroot@buildroot.org>;
 Tue, 20 Jan 2026 20:45:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A505960ADA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A505960ADA
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A505960ADA
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 20:45:22 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id DA25E19F593;
 Tue, 20 Jan 2026 21:45:18 +0100 (CET)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Tue, 20 Jan 2026 21:45:14 +0100
Message-ID: <20260120204514.21040-1-ju.o@free.fr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1768941920;
 bh=Q70ZY4L3397RM9LsxNDDYxhWLrEk95KDg4ROtZMbY3w=;
 h=From:To:Cc:Subject:Date:From;
 b=OH0ZXnAdnu1qMPbc4mN1d+EdO0cjezOqC7Oww55WKRr3onu/PDKq30wqrVegOdFiu
 9CVeuQ3v+5pNbYJK4OqkMwoWIA7/73ptqQ4JNcd368QROxWswcPbFVnq5k9vYgzJJL
 2htv+V27wQyEHV9JlDJ+FhggoDseThaYBO0kbNICc7rIF/yYEt7cvK/VMBvlYeLNwj
 WnuYnCKHwSYh+ALiNnohDj5zyI/6w+D+fArPESxh3O2mRuSZCY7bcmBPPxAY0feiQL
 jH+phYlWb2k0WA8k4LKQct2fIeLlLxGmYG+zw/4b+HdTwQVZvdHqLhJeGurN2xwKHU
 mzIIS0RGedFNQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OH0ZXnAd
Subject: [Buildroot] [PATCH 1/1] package/pv: bump to version 1.10.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log since 1.9.0, see:
https://codeberg.org/ivarch/pv/src/tag/v1.10.3/docs/NEWS.md

Upstream commit [1], included in version 1.9.42, introduced a use
of fork(). This commit adds this new dependency.

The pgp key ID used to sign the source archive changed. This commit
updates the comment in the hash file.

[1] https://codeberg.org/ivarch/pv/commit/fb7c05c2629cfa9770b44b7bf71e0faced60b55d

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/12788190798
https://gitlab.com/jolivain/buildroot/-/pipelines/2274708990
---
 package/pv/Config.in | 1 +
 package/pv/pv.hash   | 4 ++--
 package/pv/pv.mk     | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/pv/Config.in b/package/pv/Config.in
index 671f78e8c9..b9a98df958 100644
--- a/package/pv/Config.in
+++ b/package/pv/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PV
 	bool "pv"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Pipe Viewer - is a terminal-based tool for
 	  monitoring the progress of data through a
diff --git a/package/pv/pv.hash b/package/pv/pv.hash
index 6b0ffbc02e..76595904d4 100644
--- a/package/pv/pv.hash
+++ b/package/pv/pv.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking pgp signature
-# using key: 4267B4F90F2678A112169BD61D1EF7581B45E9A0
+# using key: D8FF44A79CC8A61EF694FA7EB883E01314DA8E84
 # from: https://codeberg.org/a-j-wood.gpg
-sha256  b38d69d7fc0785eb5eb3c57e8b12a7334f862047bf84b18f414365335399469a  pv-1.9.0.tar.gz
+sha256  aa1630c79af6960a8922ffa64d2c3e7f87486da21fcb57e277824294fd266742  pv-1.10.3.tar.gz
 
 # Hash for license file
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  docs/COPYING
diff --git a/package/pv/pv.mk b/package/pv/pv.mk
index 1266d83a07..41a7280f6f 100644
--- a/package/pv/pv.mk
+++ b/package/pv/pv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PV_VERSION = 1.9.0
+PV_VERSION = 1.10.3
 PV_SITE = https://www.ivarch.com/programs/sources
 PV_LICENSE = GPL-3.0+
 PV_LICENSE_FILES = docs/COPYING
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
