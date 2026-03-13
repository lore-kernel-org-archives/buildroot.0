Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8BCD107BCE2
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 20:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96CD140CE3;
	Fri, 13 Mar 2026 20:57:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lflbStTJtpm8; Fri, 13 Mar 2026 20:57:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E180D40947
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773435451;
	bh=F+9zn7IuU3KfkLfyzPhSwroIf95SWwyTN/WIdYy75Wk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LBcVHH3fLStU2Jm2hmKtt5gaCSHDspI9WjsGBZE2Aqt6uMqXzBP6amCz6oIagRyaF
	 fEu5X5/ncMK7Xdy2Zp/6GSq02NNiU/pIn16O/oUO+MtrzK6IwJXTYOANLHSZIUvfd8
	 m6meQ8QVE0tGoC4mZ2gpt1xtfBbgDUJz7K8ovsByGaIigutbxoJPAANWLV0zLdf2Jh
	 g28A8On2nfx2NygzatB9nc5WEiXzHB1LP1IFM4gLFYLFSoYKSLLnu+47ntCBoX3H1s
	 ol4hq53S6EstgO0wmQYxbpCizKYt9D6mbjWm9e1261gYGRLB15H1Udd5S5tE0t3lbM
	 JHlijf5EAD4lg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E180D40947;
	Fri, 13 Mar 2026 20:57:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9AC681AF
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C82840947
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:57:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EZuJC9L2cHNB for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 20:57:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.176;
 helo=smtpcmd15176.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 852E440946
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 852E440946
Received: from smtpcmd15176.aruba.it (smtpcmd15176.aruba.it [62.149.156.176])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 852E440946
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:57:24 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 19ZRw53cVwf0D19ZRwhIvR; Fri, 13 Mar 2026 21:57:21 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 13 Mar 2026 21:57:20 +0100
Message-ID: <20260313205720.4037961-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfL7Ze+EJ7g+HuC86igwgZazYopb8Lc3GWj6OVBH7MmLRT62OBC+gXGVFix7VbEv5iM2XUukFYJhq0wrgnLqJadFWsduSX1SQE0qmUNActTOGd23bNIP5
 YFaaIQLmZ9ZKd/jpe+aIheTRTvOPtP76ljl1uToe8OPNdQvpiz/9AhadeGmhgeiU0LncjTNYrEgbqtPFbKXYAsYNfHk1TbeYigubwlhQmgz5ScGNzv3HR0B0
 ZCDKY04hrOjh+CktnGrysIH6SrhiPCWZs4s3cnX/LVk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1773435441; bh=wkNSfVw198OCni2GUq3xhke/AhUoGmQlqHAxeb4wgxs=;
 h=From:To:Subject:Date:MIME-Version;
 b=OUMptYtleUgQ1WFoi2Djnk3rhiis1hdNXi8tAXzm+F46VKu/F/VbZEZuJHt3q2jUE
 44iVk4GGi6Buar0niNfRJsEdjjxDEB0QQYDVjXR8B7iI83NY3Sa+g+Mc3dYXgZRc7p
 iOboV0nmK5wp+FgYObExad0dLTbBgLzUXzSbkXAW9LPt9kfAtBnrKjt10GuMe9qf7F
 fcx0X0AWrEYb9LL6pwgC/fycFyD8Vq9+jNiJq7Mhe+s5XWeSQqqjXW12HRDckou9a4
 qoqIJVlrwoi5detjcyu4CyF5vfcY5UUjwq+xByJ6jvUA43TSuyIOZiZG3VSMMd3ImX
 urjXp02QI6ADA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=OUMptYtl
Subject: [Buildroot] [PATCH] package/harfbuzz: bump version to 13.1.1
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

https://github.com/harfbuzz/harfbuzz/blob/13.1.1/NEWS

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/harfbuzz/harfbuzz.hash | 4 ++--
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index a6247282a8..e9683f19b0 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,4 +1,4 @@
-# From https://github.com/harfbuzz/harfbuzz/releases/tag/13.0.1
-sha256  3553d943401c34ab9b8c75f35cdb8452ca660233b0e9d4a22395ce5245484bd7  harfbuzz-13.0.1.tar.xz
+# From https://github.com/harfbuzz/harfbuzz/releases/tag/13.1.1
+sha256  e7f3b8bac3fdcc529985be8e84fbd65c675ac47ee58512b15a5dd620c79ffe2a  harfbuzz-13.1.1.tar.xz
 # Locally computed
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 51bef1a68a..6cedcc0fd8 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 13.0.1
+HARFBUZZ_VERSION = 13.1.1
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
