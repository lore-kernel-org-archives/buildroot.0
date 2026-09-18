Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6047C982DA
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 12:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6ABEE40B6B;
	Fri, 18 Sep 2026 12:51:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S5bcJByLiZfy; Fri, 18 Sep 2026 12:51:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 34EFE40B77
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789735910;
	b=ADWX91Xn4A1ov63f28EswSIN+ta1Ls2oQJFDDFV2WTdU3zA9OwIw4C4M+n0bqXP6UH7L
	 fSBc5F6TU1HBbXiJaUbqGfyW2duwQvgBbfTnn8hlgbLATRqiyW/DVcJf2d2q3CRrXJ/0o
	 zRwpHjOr08nJP+DzcpvyHuRBzx7LxsFgoPTIUquBlIx6z2GZ6M5RY/QSzy5kikhF+g/67
	 r2PCPGa7dUUiEzVImKi+zccRBd33recHYkLbCWfmdZ76OmsZ9uV2wAylFjKQ9JzYAY8cU
	 f+J9nYTYdH+WMyNMPKTJTHzsBT0Igi6CQ8hsAro/1krr8Ft8lbwYLsCY802s+AWFjcw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789735910;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=pR30rzKiYLWqe+cyWcE9bCNY+SOFavUX5VyyIIa0i3Y=;
	b=pj3YYFWzyuaVgmUM/dOwIf3bqB0AvZTFdPHwAvJ01Q1I0Wwr1Ply1TIEqa26H+cqTU2d
	 uh2pzn5Tj+lpnsGgdZvWl0fspwk6k+445srLLEhDgaFb8IjA/kAwd5BRn0aiWeN0omYli
	 j6dvqiyEHNCuT7MR3472VNGxiY5T+C+gj1by4sVf3jD7/pFDQtE7czhLDB2p7PUoOpWSH
	 vLbpnlfJ7ovkprnMb7JFZyUjLJuVM9tH0FPKU1htwReg5ZghykDFFN8mBxz16/8dKBGhx
	 bXXwze7pz5LDMaO7D4HQ/njW3WbzLcNjFHMxZzVkuJjzuS90EaAwnbB3iJ7k4taMRjw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789735910;
	bh=pR30rzKiYLWqe+cyWcE9bCNY+SOFavUX5VyyIIa0i3Y=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bjQ9/oFQRwb8IxALE+Suoatx7KXS7Ck1MEQuZkw3yZN3q3CejGInruE0gy2jxGrwz
	 /VfUhv5swWq4SWsnDOXaZSEfUYb1cBdeZr5u+jzdX4S/X3olhCO9pSABZA7Ks8d57w
	 /L8umndML+sUMLJNOpwD/yZ8Q4/FzD43U8+ZXehuyyIh6qTWhXsa8kJtbMah3CaMbq
	 7iE7AAW13hELT4KcKRfAQAaAivXhV64cu0eGA4Yi/xX4PJtr7ECAbs3vZabge4pQfK
	 icYiC2G+gNyGsbo2yzP7d0V/Sf7uN4reaTkzrwb9R3EleW+qE8nwkkl7mAuR4QiSEe
	 sgr7tHhBxDvcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34EFE40B77;
	Fri, 18 Sep 2026 12:51:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7528342D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 12:51:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72CAD60D65
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 12:51:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qCWDoPgfabPx for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 12:51:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 01BBE60D62
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=62.149.156.42
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789735906;
 b=WmxszmlDkBvJFyZqkqcJWiPlfj55VLTxIpHLXsb/zo4KhNNlJ+0t9Seo8+7c4ZYYB35r
 ihRTb71wMOWvR9MdIeU01XknkXVAuXREO09JwkVsz7jnsl191yGZjC0AaODd8qfPHcnJO
 NQAy9Dy38TihuXDn/+1UtNTwQe2MRtDpdsM1gqFqaB7m8ANfe2ui4QSn8G7v+7W+TpdKp
 KLuKomPZECzMMNYhE7rLrr0xFWsouAKWkOAhYZNI14BVYR5Qro5YvZ/EsM39w4lvJy+I7
 V+HDHJS6TXqXTmY2BKdRM/ahkMXOt0ztm7D/0Naa8Ye5FqbOG3h4VUeICwP5M5ya7Kg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789735906;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-CMAE-Envelope;
 bh=euEtT6/InAH+dNcv1Kf6vw9a+kMzoF4cG5vz4vPaffk=;
 b=gek19dRvUlWGqvV//0s9DHWXZ7v9++1HRQiImqWjFy4eNjIUaZO+6BNJhS4eQgXma5hm
 A4S3PrHEESihZCaHMrpuj+IYICfMzfUNxLYtwpY/DH358kJD46igNCOQQKIJNbvaFW+WD
 eLlLrU4h7LAkgPGUGHTlOna9SxkQD65Jcy6zMaZxh7gk02W3MVJK/OaL73uoEImbGG/5K
 XAcPhCZ2EJIFzSBZpvjXscJVOx+Z2AnJVNILURiEabRehYPkXcTAda5SjpJoa8lCEot1g
 NXxP2/4N/eFr1AnXwA5lacNCOWqx3DspfFdBIUhTUWgUIg4Djw8zThGkUMS1otl4iSQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=benettiengineering.com; 
 dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1
 header.b=k9Qe9+w7; 
 arc=none smtp.remote-ip=62.149.156.42
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.42;
 helo=smtpcmd0642.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=k9Qe9+w7
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 01BBE60D62
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 12:51:44 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 7Y45xeeo9aAGr7Y45x7JH5; Fri, 18 Sep 2026 14:51:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1789735901; bh=G5Kef9cSb78IhW2bNSERucUt0/zDp4ReRKI1JRX2xMA=;
 h=From:To:Subject:Date:MIME-Version;
 b=k9Qe9+w7QSbCiWJvZgyM/bYwucULDQ3WSHiSeOSaUbL0rimQZbkrc5KGp7l5ECIcK
 s7KiARkMSgR4fi7sEkRtZNDz3hXF/AM2qTt2BqMSIaQWQ1MuH3jLTaeodZ7W9LrVMA
 U4VlbJH3TJn+o/wbp3ZteIvT6kKkmQlojHNIeCKHx1a3KNbsU++6eNH6jthxmOrdjj
 yWm+zA65ifo9YFEiZ7m2VJCLu1z0gQuesH6V4ORpkf+1WQMh8tNzWy4s17xx80z/Fk
 niEeTq1fqWcv8ryCAqKZvLx28TH77wR10OGa/w6BxKqgnYy4w/Wn7B/qxh86oL8GXx
 JIX0zXTatp6eg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Petr Vorel <petr.vorel@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 18 Sep 2026 14:48:36 +0200
Message-ID: <20260918124836.3563681-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfNWS5/rPk9m9dmV2qe0wpobovTlvVvS4K6J3dKx+E/7FsQFV37uCGPbuWcft3fvsZOzoB8xhzXhVqpRN2ZhGXoS6X0sfvVCUrUY7MBx2AgnMoN4wm2g1
 u0WgX5U8T1Dc7qg5jmMFXVv+pCKK9UJUk0nUT5t86ouNQ1NkHh8KQ5ZaKd2NGVrKFhvJQJRbcyWrGO8mUk555pWytWZVatcUMOb2n7ufC2BUBX6maeL1KvaS
 2dii9zWCC0H+dmceFOr3XRbcusW/gmPqGikXBoLPe6umpu85TIY3yRPo4SA3bfTvpdM6VuGjIGSllYK12L8ZugU11KkovLFIDHZB88QA0cPINu41K6ERnb1C
 0ZU4dQhN
Subject: [Buildroot] [PATCH] package/rpcbind: bump version to 1.3.1
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

Changelog:
https://sourceforge.net/projects/rpcbind/files/rpcbind/1.3.1/1.3.1-ChangeLog/download

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rpcbind/rpcbind.hash | 6 +++---
 package/rpcbind/rpcbind.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/rpcbind/rpcbind.hash b/package/rpcbind/rpcbind.hash
index 3059751050..ab08688c49 100644
--- a/package/rpcbind/rpcbind.hash
+++ b/package/rpcbind/rpcbind.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/rpcbind/files/rpcbind/1.2.9/
-sha1  111058e312e0634f8bd23a783ea4f99912ced085  rpcbind-1.2.9.tar.bz2
+# From https://sourceforge.net/projects/rpcbind/files/rpcbind/1.3.1/
+sha1  17fc27ab73ae9d73a77324e9282fe601534c724c  rpcbind-1.3.1.tar.bz2
 
 # Locally computed:
-sha256  ce5f1a87c566ef0b2897a28f50a75c1dc23fec413a46a7f4183423b6b6aa991b  rpcbind-1.2.9.tar.bz2
+sha256  8e551b445f5172f8ef218845af342fb2a2d741b57ce8c777c781a01ea92f92a5  rpcbind-1.3.1.tar.bz2
 sha256  2b9477d2f4ab277b29702958f0058546edc120aae4b5fb8b8d1a9652104e1ba3  COPYING
diff --git a/package/rpcbind/rpcbind.mk b/package/rpcbind/rpcbind.mk
index 96025624ff..30030fdeba 100644
--- a/package/rpcbind/rpcbind.mk
+++ b/package/rpcbind/rpcbind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPCBIND_VERSION = 1.2.9
+RPCBIND_VERSION = 1.3.1
 RPCBIND_SITE = https://downloads.sourceforge.net/project/rpcbind/rpcbind/$(RPCBIND_VERSION)
 RPCBIND_SOURCE = rpcbind-$(RPCBIND_VERSION).tar.bz2
 RPCBIND_LICENSE = BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
