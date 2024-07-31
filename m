Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 931CAC3DA64
	for <buildroot@archiver.kernel.org>; Wed, 31 Jul 2024 06:12:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48FA381400;
	Wed, 31 Jul 2024 06:12:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M_94AwpOeNeh; Wed, 31 Jul 2024 06:12:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24F2581411
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24F2581411;
	Wed, 31 Jul 2024 06:12:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D70D51BF356
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 06:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4B0F4038E
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 06:12:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q84AJjKeT0IJ for <buildroot@lists.busybox.net>;
 Wed, 31 Jul 2024 06:12:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.67.36.66;
 helo=mout02.posteo.de; envelope-from=egorenar-dev@posteo.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 414024038B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 414024038B
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 414024038B
 for <buildroot@buildroot.org>; Wed, 31 Jul 2024 06:12:21 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout02.posteo.de (Postfix) with ESMTPS id 0506F240105
 for <buildroot@buildroot.org>; Wed, 31 Jul 2024 08:12:17 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4WYhZn3vMMz6tw3;
 Wed, 31 Jul 2024 08:12:17 +0200 (CEST)
From: Alexander Egorenkov <egorenar-dev@posteo.net>
To: buildroot@buildroot.org
Date: Wed, 31 Jul 2024 06:12:35 +0000
Message-ID: <20240731061235.18090-1-egorenar-dev@posteo.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=posteo.net; s=2017; 
 t=1722406338; bh=5NQJP7HR4N8qVzbzuF4Yd6VzGw2CCkTwyN7mFbSxIJs=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:From;
 b=iX44zIkqgUKVj5PcLB1i7irjzvPdc1cIuC0fqpRUaIUXoEJ59h5XVHxp1eu3fd8Ee
 bLs3mlN/KIR54l1dhjm3m1rjaOIuSlxH344q2KqygjSEips84ZOmxOKqUxVXXPWvgc
 JKgjMQ3F0Z6DPrJpB/kwcob9pFHqZanH+a/oG63oK588oxDuQuzC4v6Q+4qTBeyrdU
 tor01z0q39ugICx68iHKRd3ROHpx0xmwZ+p1aas5crRQX7RlBMUyqQ57juRoCl7FzM
 8JssuRGbJ+7zyDdjq/5/+VZtTBawzmVQkTaJWxH5VJRkmeRi821NHxfvYxpszhwtBa
 u2NP/suh9N4Dw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=posteo.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256
 header.s=2017 header.b=iX44zIkq
Subject: [Buildroot] [PATCH 1/1] package/makedumpfile: fix build with musl
 libc
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
Cc: Alexander Egorenkov <egorenar-dev@posteo.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

http://autobuild.buildroot.net/results/7a0ef4f3f3d3ecc6b84a573409302eae5ec90e39/

Fixes: 6a1c376492d6 ("package/makedumpfile: enable build with musl libc")
Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>
---
 .../0003-Fix-build-with-musl-libc.patch       | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/makedumpfile/0003-Fix-build-with-musl-libc.patch

diff --git a/package/makedumpfile/0003-Fix-build-with-musl-libc.patch b/package/makedumpfile/0003-Fix-build-with-musl-libc.patch
new file mode 100644
index 000000000000..26718fb7f6b9
--- /dev/null
+++ b/package/makedumpfile/0003-Fix-build-with-musl-libc.patch
@@ -0,0 +1,27 @@
+From 3ae383c5dfdbd4dc5cfb888b3cc187819658068b Mon Sep 17 00:00:00 2001
+From: Alexander Egorenkov <egorenar-dev@posteo.net>
+Date: Wed, 31 Jul 2024 07:43:50 +0200
+Subject: [PATCH 1/1] Fix build with musl libc
+
+musl libc defines PAGESIZE in its limits.h header file.
+
+Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>
+---
+ makedumpfile.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/makedumpfile.h b/makedumpfile.h
+index 6b43a8b44f93..54e894bfee2b 100644
+--- a/makedumpfile.h
++++ b/makedumpfile.h
+@@ -169,6 +169,7 @@ test_bit(int nr, unsigned long addr)
+ #define PTOB(X)			(((unsigned long long)(X)) << PAGESHIFT())
+ #define BTOP(X)			(((unsigned long long)(X)) >> PAGESHIFT())
+ 
++#undef PAGESIZE /* musl's limits.h defines PAGESIZE */
+ #define PAGESIZE()		(info->page_size)
+ #define PAGESHIFT()		(info->page_shift)
+ #define PAGEOFFSET(X)		(((unsigned long long)(X)) & (PAGESIZE() - 1))
+-- 
+2.46.0
+
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
