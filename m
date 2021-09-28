Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 053A7C433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 15:38:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 041F9611EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 15:38:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 041F9611EF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92744818BE;
	Tue, 28 Sep 2021 15:38:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wxf5yHybjEpc; Tue, 28 Sep 2021 15:38:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8A50817F5;
	Tue, 28 Sep 2021 15:38:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B3B331BF681
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 15:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A3CC7817F5
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 15:38:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XcyNTIMOPnMR for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 15:38:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpng3.i.mail.ru (smtpng3.i.mail.ru [94.100.177.149])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 28E5E8174C
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 15:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=VXAPm8nI3t9D5F9EqD2J0GRRx3w0Dpi+1FpKzItn14w=; 
 t=1632843499;x=1633448899; 
 b=KDjsecEEFznIvwWgC5VZA/uMNTaLM2HpXEPv7ANbnk288ja1Rlqtp9FSOYe1BU5i/cN/pXt4fVlPjL9ehl5WO2xxftqNjrkfORXWYZ15gdZS/Y2Ezkky8riPWRpLGQl7ncN0t3pm5bD2xwQMLB3Hwb0u4Pfj8hHXWDCio6yd6amChRabqrfdjLoKcWtKhRx1/pmVLAgC8G7YnOsNylQrSAU4SYOEUHQ5a8BJJ/dAD6M7qUKrswMWe2Q0RIcT8fy+box/KItKBR7Ax6EFwEdKFW1D/tVLtKlSzdwqBEajOvrXFILzDDFxiXBpS6HI/paLsLGuwAsD3KwhS5WQKppHTg==;
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1mVFBP-0001ZP-4C; Tue, 28 Sep 2021 18:38:15 +0300
To: buildroot@buildroot.org
Date: Tue, 28 Sep 2021 18:38:13 +0300
Message-Id: <20210928153813.1593886-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Authentication-Results: smtpng3.m.smailru.net;
 auth=pass smtp.auth=fido_max@inbox.ru
 smtp.mailfrom=fido_max@inbox.ru
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD96A58C36AA2E99649DFE41A06634A2C4EB30EB11CC09FFC21182A05F538085040294C05852265C7EC1639344282BB2E5D81A05A9DC9184D12913BB2FC8F706466
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7370F4F695FFFC24BEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006374ECA27954A00B6C3EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38BBCA57AF85F7723F254DD2D1820B1189B399A4CBE7BA4830D20879F7C8C5043D14489FFFB0AA5F4BFA417C69337E82CC2CC7F00164DA146DAFE8445B8C89999728AA50765F7900637DCE3DBD6F8E38AFD389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC821E93C0F2A571C7BF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA7E827F84554CEF5019E625A9149C048EE9ECD01F8117BC8BEE2021AF6380DFAD18AA50765F790063735872C767BF85DA227C277FBC8AE2E8B7A115A9DF4E0DE7975ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975C5D501480F54144100FD961CAFFA43BFB5D7E5B2AE7D476999C2B6934AE262D3EE7EAB7254005DCED556CBE7F905700A49510FB958DCE06DB6ED91DBE5ABE359A3485EE9140A7D39D1B2EFE7B39F7738393EDB24507CE13387DFF0A840B692CF8
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34829444FF2D8CB89BBAB8B75371971F1FDD5165A1DDC80E9038BC50F1B7D5C8FB7D9580BB7956C5901D7E09C32AA3244C8056F3FED5C63D28E6770FB356D8D6E895A9E0DC41E9A4CF729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojWaDhU1ub98blRR5d9pNfBQ==
X-Mailru-Sender: 689FA8AB762F7393C37E3C1AEC41BA5DE75232BF479EEECEC5D8D49F97E0D2E298CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888E0D4ABDE8C577C2ED
X-Mras: Ok
Subject: [Buildroot] [PATCH 1/1] package/postgis: bump version to 3.1.4
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
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release-notes: https://git.osgeo.org/gitea/postgis/postgis/raw/tag/3.1.4/NEWS

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/postgis/postgis.hash | 2 +-
 package/postgis/postgis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/postgis/postgis.hash b/package/postgis/postgis.hash
index 15983565b4..b1c19f029e 100644
--- a/package/postgis/postgis.hash
+++ b/package/postgis/postgis.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  71e929553bb73a0413206a0f92df5180ac6579c500d8ddce3a03559f1b349fcb  postgis-3.1.3.tar.gz
+sha256  dc8e3fe8bc532e422f5d724c5a7c437f6555511716f6410d4d2db9762e1a3796  postgis-3.1.4.tar.gz
 sha256  55b69f22e1752830dd565852dc7ff242daf289dbd3a6bfede5db43f90d2e28c9  LICENSE.TXT
diff --git a/package/postgis/postgis.mk b/package/postgis/postgis.mk
index b3d97b2774..3a340c680e 100644
--- a/package/postgis/postgis.mk
+++ b/package/postgis/postgis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGIS_VERSION = 3.1.3
+POSTGIS_VERSION = 3.1.4
 POSTGIS_SITE = https://download.osgeo.org/postgis/source
 # parallel build issues
 POSTGIS_MAKE = $(MAKE1)
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
