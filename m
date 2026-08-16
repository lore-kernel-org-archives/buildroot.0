Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C067AC5DF66
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 21:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E595760629;
	Sun, 16 Aug 2026 21:52:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G8Rxjf35Nbik; Sun, 16 Aug 2026 21:52:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CC866060E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786917168;
	bh=0zPXzKixdc/iwzC9i8pNB46X7qhtj/pNaVmOiRLOrXg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EB9G2sFWRUbk4X0y/Y2QqbtYa0Ho0YpAWgX4yhGE3dAY+M0BtnCFFjJW261Jw+y7X
	 8dISbdRPsn2mfduBbBTfahApx+yxjZ1B+d7k1LYXMmJ2V2wZfoXfqZtTSafA97dEF6
	 FEbM2vLmFElXXYbx7MAowpkcHjcxe7lwm22izi6RZzWuhwzg6LzbbkDNfUtXA4UIvx
	 BHkJ7dnlyYGZoCspjH9pWOmDTAylwtWfMt+/sdJ/J+Ye0S5X2BFMU/8Q/udfou9vdz
	 vrvbwlAZ/ZKYn/LEFF4b6In5rLxX4o9AWB5YUVhn0yPJb17nBUlBhfcN5++SFjAGzh
	 Bs+vbonbJwqKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CC866060E;
	Sun, 16 Aug 2026 21:52:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 27DA923F
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 21:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E3A1405DC
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 21:52:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8KWBR-EDnIRU for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 21:52:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.243;
 helo=smtpcmd01-sus.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F167A405C9
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F167A405C9
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Bswl58+r
Received: from smtpcmd01-sus.aruba.it (smtpcmd01-sus.aruba.it [62.149.158.243])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F167A405C9
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 21:52:42 +0000 (UTC)
Received: from localhost.localdomain ([93.136.165.114])
 by Aruba SMTP with ESMTPSA
 id vimVwwJ9z3FmdvimWwBUod; Sun, 16 Aug 2026 23:52:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1786917160; bh=N8xVd9bfgtJTygaVeOlHYi+rB293w8VBAsiKSnuaxX0=;
 h=From:To:Subject:Date:MIME-Version;
 b=Bswl58+rwSGGRjquFN1v6K9HBE982Il5MPdUZWtXt2HOJhvJh7QezOBXQr/eqSJXO
 YY+o2BhyFBaubrD2Xug2dZqC2hrsZjyoWHE5AlObf0X90j/No0e6DpaCVZ2wxN836b
 D2PZ+i1qC2jY0UDPgTy/p7InBoAq4sC4Wdr2uAJ8Sy6U7SKxanD9xZnh4NNjKzaGvS
 KNxUpNZeqdjmeawdejsYRGasdOdwciDU1X1lZypCuYe5JoWj//kK4+tGNnQLlBc7C8
 apL+JS98a4e5RrtfQIwZi4wVh8HaJ1liFJFr3Q7f6zlRUhJhFALmIOYxO5iUbAvgYF
 6T2p//HpwLFYg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pierre-Jean Texier <texier.pj2@gmail.com>
Date: Sun, 16 Aug 2026 23:52:24 +0200
Message-ID: <20260816215224.122758-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfAov3/vks8XcBP3AyTejsB3ZwMoZ0tpD9IKp9o6jXm/cO8EgREEaCheM7MLjAYSNpQXnJrKx0OXbublufg07Eo+C9mKBcdr/z0aY6MlU06S5soENysyK
 +FBcp7/ThrPlipWY/fnkNyqMpj5Gpy4hBziQQqArQBYxQhu+9CeODSSL6qVYtVgTkpMqBWW9etJgcHTd7tfO2Iy3RFCuGxIHvGRlbKx0dQyR9fOJ1Do3J1NZ
 b4p+jgKxNmUJLAkVD8P3EQlzJSeLupuowgAURXlKCZvYZiK7fVjGyjNuIT5LGCwlfaC5MNTmeJPKmr2RgZoiyA==
Subject: [Buildroot] [PATCH] package/mongoose: security bump to version 7.23
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

Release notes:
https://github.com/cesanta/mongoose/releases/tag/7.23

Fixes CVE-2026-73261, CVE-2026-73260, CVE-2026-63626, CVE-2026-73252,
CVE-2026-73251.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/mongoose/mongoose.hash | 2 +-
 package/mongoose/mongoose.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mongoose/mongoose.hash b/package/mongoose/mongoose.hash
index 1a60b0c89c..80cf033774 100644
--- a/package/mongoose/mongoose.hash
+++ b/package/mongoose/mongoose.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  87727cd2c240ff559b16e9710d44b61ba3513dbee50428bd8ee1596d7c58460a  mongoose-7.22.tar.gz
+sha256  93208f164038b05d156935b8b725063e1afb3984a362dbcf3a9ea37b6f1f2255  mongoose-7.23.tar.gz
 sha256  f0d9cfd6f7d92f6ec061a5fb2882f67d2521a151bf09a637c33ca6181834b048  LICENSE
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 207d31cdfa..abb36aeb2c 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGOOSE_VERSION = 7.22
+MONGOOSE_VERSION = 7.23
 MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
 MONGOOSE_LICENSE = GPL-2.0
 MONGOOSE_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
