Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D3C0C531C9
	for <buildroot@archiver.kernel.org>; Fri, 24 Jul 2026 17:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 044C640B79;
	Fri, 24 Jul 2026 17:44:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OkvAB-OauLSg; Fri, 24 Jul 2026 17:44:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA9DB40B54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784915055;
	bh=1tEQD6rInkRYWKINhdfwrBtLp85sI/pGNUS9+s+poWc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GI+h1ZBoIy5W2KtVv9E7j0GpaPYyvCNQFLk19eCxISdVCWRyL5yCkHoh5U/0kS2tE
	 lpYg0mmu4dF3603J94pI4bBrmP8Q75pA4TZO6YmsNYANnqAFgAxg6TxN4uAy0jtZ3E
	 GQnUwFDrM+ggDwrpuGRNEAE1+iKWCH55Rrz/3LG0knwKa2qJj/88U6UjMI6FnB9ibd
	 fgLy7UusEJtJniYDF1aHpYV4AJiGohoKB0ee7WB3LXAWw4qVhgUH2s0a3zme2mdawR
	 0US6DugA3vM9kmTch68BY+le1VoYpdSo6FuTOdzyzr/uG/aIghabWWV9JZZzGq+1c1
	 +VGbLkIB5igxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA9DB40B54;
	Fri, 24 Jul 2026 17:44:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A9D4EB
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 17:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 30AB0608C1
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 17:44:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3AgIyOOa_vzE for <buildroot@buildroot.org>;
 Fri, 24 Jul 2026 17:44:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1F45D607AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F45D607AD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1F45D607AD
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 17:44:13 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a00d2.dip0.t-ipconnect.de [91.58.0.210])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 47457A4C3E5E
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 19:44:11 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36932)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wnJwR-000000006Uj-1H1F
 for buildroot@buildroot.org; Fri, 24 Jul 2026 17:44:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 24 Jul 2026 19:44:10 +0200
Message-ID: <20260724174410.324552-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1784915051;
 bh=wrU1Qi7XWGAWsirRBzMWWWdX0oh2GhV2ywsu/QliA7g=;
 h=From:To:Subject:Date:From;
 b=Lp7xI8tbaCz0NOZ20+P1lFWS/l3ItwBlqhgWK/nmWObKuEzc3hV+RaZbJz6/MAMzq
 QIjxBswP1bIQKnBHysb0C/xcjB4O+hemd8C+azAd/njJ8eUyZct7gGeYD/qlZ47EqT
 VPn5I/YYGzIZAkrkhCViI/djclvqYyjWqUFyjmrcaUMkM+k2+jUYZgMifVnStWDA2r
 9CFTG1UcGM02C9MEoLV7M86KxShiQ8OwMA0KaQfeoW2JG021ZoLacCH/GirLCNZ/V7
 K900K+FmjHRieG2ix1cjQ5BJnb03zuqYWnfDlgLESgzT/qk8kQzm8H6dnsoQprHcaP
 o39F0DoIBdw6g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Lp7xI8tb
Subject: [Buildroot] [PATCH 1/1] package/zix: bump version to 0.8.2
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

https://gitlab.com/drobilla/zix/-/blob/v0.8.2/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/599e9094c4e6bb822f35d3f3e674dd372a9747ce

 package/zix/zix.hash | 4 ++--
 package/zix/zix.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zix/zix.hash b/package/zix/zix.hash
index 3472f5de71..63c8e4e84b 100644
--- a/package/zix/zix.hash
+++ b/package/zix/zix.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking signature
-# https://download.drobilla.net/zix-0.8.0.tar.xz.sig
-sha256  e9b6fe3ede984fa53f2edcebdabb35fb99ace807722772156aea49c079cad191  zix-0.8.0.tar.xz
+# https://download.drobilla.net/zix-0.8.2.tar.xz.sig
+sha256  4c73aab0f8cbbfe56b00c8c6d648316021e699c5ae6cbf254391ef309047e67b  zix-0.8.2.tar.xz
 sha256  1314cc14fb947491491c517c533ac7de4f6798585f922a472358082c25ac1881  COPYING
diff --git a/package/zix/zix.mk b/package/zix/zix.mk
index e4d89b5104..cb8406ea9b 100644
--- a/package/zix/zix.mk
+++ b/package/zix/zix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZIX_VERSION = 0.8.0
+ZIX_VERSION = 0.8.2
 ZIX_SITE = https://download.drobilla.net
 ZIX_SOURCE = zix-$(ZIX_VERSION).tar.xz
 ZIX_LICENSE = ISC
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
