Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E4C1CD3427
	for <buildroot@archiver.kernel.org>; Sat,  2 May 2026 18:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37872412B8;
	Sat,  2 May 2026 18:18:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O5FG6eIQKsxn; Sat,  2 May 2026 18:18:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 660A2412E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777745908;
	bh=royM+Tf3LGzUA7h5SEZB/ht4o35I2BeB2O4XoCDKtZQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MbNKG1UStCefyDM+x9P/mMzzBY7TQZnATbR/97kQX89A8uM5W5rxsFnl9YyaZnMgw
	 74kk3QhRm4s+avTTiJ48DCNKnnWH5OKGsWwAQImBZwH6BMScYVlTqaTBifQ+cic85W
	 vgtWgeVTwwQltCxj3l6MYwHzqDfbBh1mvJ1VbJ0PHuhXACuXcL9VlmkQKcnKLu7RKe
	 4C6FexDE6FBq5ax3dQoutnof3NRzoXjREoL+Kmxap9z/Oy3x+xy6UQKz7zJMcBq4UX
	 7b+76g0PM2eSwOUk80042ov/sr9emhFN01kCz7niKWAT66Zy6AgKk5ByNubT1mWvt7
	 hJ5WlbZGFNR3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 660A2412E6;
	Sat,  2 May 2026 18:18:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 614B2127
 for <buildroot@buildroot.org>; Sat,  2 May 2026 18:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 472A5610B4
 for <buildroot@buildroot.org>; Sat,  2 May 2026 18:18:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tEIkhu_CMD30 for <buildroot@buildroot.org>;
 Sat,  2 May 2026 18:18:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.116;
 helo=smtpdh17-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 17CFF610AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17CFF610AF
Received: from smtpdh17-1.aruba.it (smtpdh17-1.aruba.it [62.149.155.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 17CFF610AF
 for <buildroot@buildroot.org>; Sat,  2 May 2026 18:18:23 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id JEuywZGGEBhI9JEuywjW2p; Sat, 02 May 2026 20:18:21 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sat,  2 May 2026 20:11:16 +0200
Message-ID: <20260502181116.470697-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfHzeQyoKYYfVnvzNsqNI6MBI9QXgPGr8ELkLhsPgofzhuRV3GfZjr45pQlt3kRbY/m5jvGEM4lWgKx5mH5XoXNFqKu1MBSiZ9XUHx21xX28DvRmtls5d
 OJGChBe/CjNHLaCAB7ORcJwSP+jLulCEQBh01QVEM/FP2qZ+2KFY52aQtl8VjmgNysrPkitWAvLtT7bf7803O/GMIQqiQIXixzLAM2DUTGc5fzsbukmsC54T
 o9ASFTV7jOnHO4KPdKwr9fs14IFaPwPgt40+l2PX1wQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1777745901; bh=DL/luQeeNUc+q7IP/orFLIRAgKSn0pnEuDvQKG/FulA=;
 h=From:To:Subject:Date:MIME-Version;
 b=S7MARmkiHeAr6xLKIKxDYze9C7vIeD3IRgXMPP0kuLLBfqV48+ot0rL5U9/7gal9T
 7y28fGmFzkoiRdZvcbS6LH+SMKQ3CF6ekMwgb/cP6cIQKN228/3qVIAbkbsVd5KC0f
 avJd78rVF50873nBAvunrAwqsBLd0SdCnM3NVzv+wtuVjO9fCA2qWhNwk/5sNulLTd
 DQq9UfdMyCMWr7W8MDmSl/jqUwa3L6iFdCzp91/Qfduw+OE0/middhw6KhxfYo3cRh
 TWc50GpJeE5AGtuQjSXUxP7iC8F6hs7L8aK6/tbGl0LRsqJX7wjGe07OihP0oV3zOh
 NG8q7iNW3YIJA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=S7MARmki
Subject: [Buildroot] [PATCH] package/liblo: bump to version 0.35
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

Release Notes:
https://sourceforge.net/p/liblo/git/ci/master/tree/NEWS

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/liblo/liblo.hash | 8 ++++----
 package/liblo/liblo.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/liblo/liblo.hash b/package/liblo/liblo.hash
index cab192b421..8a317cff73 100644
--- a/package/liblo/liblo.hash
+++ b/package/liblo/liblo.hash
@@ -1,7 +1,7 @@
-# From http://sourceforge.net/projects/liblo/files/liblo/0.34/
-md5  14a65154e8f2609f558ce2648f1c99ef  liblo-0.34.tar.gz
-sha1  0bcc3f30a4cdd2f41fe6c20c48f92bcaeaa8e6bc  liblo-0.34.tar.gz
+# From http://sourceforge.net/projects/liblo/files/liblo/0.35/
+md5  fbe37b3e35f9dcdc4f90acfe513cc679  liblo-0.35.tar.gz
+sha1  1a17c007d9cc5e7a3333420c5d11479ffe0cbe0b  liblo-0.35.tar.gz
 
 # Locally computed
-sha256  69aa0cd365dba5ea7799b850a7da659ad303e6074bbd67f4ab84e4d6f5f6c3a4  liblo-0.34.tar.gz
+sha256  9acc4f7e5a24f33472e9acd7e409b7bd6810a46f0a1f3cfeecea22d60f3aae13  liblo-0.35.tar.gz
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/liblo/liblo.mk b/package/liblo/liblo.mk
index ab30feab81..2717022d58 100644
--- a/package/liblo/liblo.mk
+++ b/package/liblo/liblo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBLO_VERSION = 0.34
+LIBLO_VERSION = 0.35
 LIBLO_SITE = http://downloads.sourceforge.net/project/liblo/liblo/$(LIBLO_VERSION)
 
 LIBLO_LICENSE = LGPL-2.1+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
