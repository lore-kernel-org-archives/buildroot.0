Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A53BC5B572
	for <buildroot@archiver.kernel.org>; Wed, 19 Aug 2026 20:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15FC0405AB;
	Wed, 19 Aug 2026 20:19:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 21YjweQ8NVQB; Wed, 19 Aug 2026 20:19:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787170795;
	bh=XUXwI30kvRQlibRnzZ4GuLHJQCGxcqojlJ6QTRLshCA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=g1d08qkI2SMX22LmBa2q5wahBCbqU1OS+m4Yn22WPV89I8sjGjXrTIYKRgfjo8qA2
	 VV89ukl4fGO+FcAizWDIlSh5vxIwL3vxafvKFGG1jnmTvTwMFAPfM9uQvxlDbf3a//
	 0T32G+1va28oHY08Jibpo0HA1HGMxtYyvi/XcB316wNfq8RLP0u9JihmVt1fb1ehR6
	 rFQ2g0f0LEptStVERMyO4Fl15pN6sob/XtpMf2Iynkqt1BCVb50JgZmOMSmUNL+ydp
	 jVfF8FuvD+9DWVkl9lSWG6t9y9XIMsdbLXwbmWveyHEHRxJNoCjk9zs30iRCObhSUO
	 9W07dZNI6dNgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BD09405AE;
	Wed, 19 Aug 2026 20:19:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F82829B
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 20:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1585E80BA9
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 20:19:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sv2jmYkRrzhQ for <buildroot@buildroot.org>;
 Wed, 19 Aug 2026 20:19:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.83;
 helo=smtpcmd0883.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=ZA7Hrysk
Received: from smtpcmd0883.aruba.it (smtpcmd0883.aruba.it [62.149.156.83])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E6E2280B8C
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 20:19:49 +0000 (UTC)
Received: from localhost.localdomain ([93.136.190.209])
 by Aruba SMTP with ESMTPSA
 id wmlGweB5tZCONwmlGwSCwb; Wed, 19 Aug 2026 22:19:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1787170786; bh=u2uLR/3QYEanSK4DDI5AQ6Br0+XWeXNKj3NKb+mmqzM=;
 h=From:To:Subject:Date:MIME-Version;
 b=ZA7HryskMeqZRp3Ll1P1XheCrU98kAoImMt66nb42akpX2l8er0PC+KfntFMrIPfN
 eR1aPdHzwlqKPv+mMPMjXhOj7MHcxE3xvxGe3BRW2Q2dCp6Tg8aSUy4z1nCmAgd1oX
 WzoZe+7eUKb1OrnQBpoHnpc1ejsiL030tXY/7gYgDs9u8PLTbvZq2EDS/ikwN6UJzG
 zg657QkXQU3em3pTxQo4tmHqgQJGSi5iZHHdGJCpJ821dVGzXrsGLB4j6+Myq2faNJ
 PDIMIxoJRR0C13Cgb3jB7lebIq+QoXdCOpQua8qjEDq96icQGY9o7jrrKgWdbz/3Dw
 GSASZQ4otVWdw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 19 Aug 2026 22:19:44 +0200
Message-ID: <20260819201944.330108-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfDXLBIYHA2a9hkbB0EnBINarER5hI24gK1XWmXpl3IjSgJGt24fU3nM3f67kwzSTQccOuKu/pFqpHNfir8krx94fL4CDjNPt44MLbca+703rz/wndw5g
 cMXGFR6oAGndtgnWYjrGqbM5Np7vxJBQ04eXt1Rqh7/Up5r53RUEiIV8H5bHmzVL/04Zd8KTx48l3QHptuDg9KWBUPZPNFhUIDWyFo0jXjX3i4HqD9FnEBzk
 dW6w3Bzvk4Qud/zgluXGRn58a0WS33KIJejPQjhdFbUCmfEKg98qbKWkXb01G2ak
Subject: [Buildroot] [PATCH] package/bind: bump version to 9.20.27
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

https://downloads.isc.org/isc/bind9/9.20.27/doc/arm/html/notes.html#notes-for-bind-9-20-27
https://downloads.isc.org/isc/bind9/9.20.27/doc/arm/html/changelog.html

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 36ff7b2d0a..2131f51978 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.20.26/bind-9.20.26.tar.xz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.20.27/bind-9.20.27.tar.xz.asc
 # with key 706B6C28620E76F91D11F7DF510A642A06C52CEC
-sha256  55248def0f870c4c46b3de72978ea972615131516663188a4564dca1d20bf350  bind-9.20.26.tar.xz
+sha256  145ab7a50b33a06d9d488b5e668c887e754f42acf8954e2b5dc7e238b080e4a0  bind-9.20.27.tar.xz
 sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 172bbf79b5..2b42e87d62 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.20.26
+BIND_VERSION = 9.20.27
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
