Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F88C61DFD
	for <buildroot@archiver.kernel.org>; Mon, 31 Aug 2026 18:30:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87F4A405C9;
	Mon, 31 Aug 2026 18:30:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 68llW1RxhBhJ; Mon, 31 Aug 2026 18:30:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788201054;
	bh=7fBc94rAgLGFS9udcu015XYB4mcJb+HqmEavA2i3xBA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rcwq1bd/J7N0bJHlguRkgx4GgtGIVjCcGv/idjoD6gzKOYeRrE0lqN5oriMDv3Mln
	 Zre1oayGMa0oa0e0Eidhrh9QdXrSjVJxGtw7wSFgYew7EHp15KglC3ve6r92EitURC
	 0J6olRyMnRq+af/x//JnZwz3HLLLURKO9dvOlp5ZwacA7MoBE9NrxJ26kOZwa4a0Bl
	 DpzgpbfH441TFrKDb+/p34oaDOVe6SGYM98fnJW1g2FqC4wGukVzIyDODqtaDvf42W
	 Iu+UwLd3B51J5rleTIFrt77RPL41gHvoGwuEpLGcR+HJUfhbCZJSDG367jFNVNd1vU
	 cCqQ32jadh7BQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 352DD405BB;
	Mon, 31 Aug 2026 18:30:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2437323E
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 18:30:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1349E6066C
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 18:30:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0LX4RMORduWf for <buildroot@buildroot.org>;
 Mon, 31 Aug 2026 18:30:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=TZmmnQcO
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A8CD660608
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 18:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788201047;
 bh=Rq8Dvi25W2IZ0kGnfptspp2VK3Vn+z8N2lriYQdQE9Y=;
 h=From:To:Cc:Subject:Date:From;
 b=TZmmnQcOYJBAAlfF/A19R1GRpu+C2RqitC8pAgKrfsqPemYwlBpcfbkSfrANnW+FS
 6wXqjBprgWDouchUS415QKLIXafvDm+GZrR70E6XpX+h/XdYAee5appL7HEBDBd5t0
 Kve+iEr4e7bbj3nG+ESflf7pMqEuaRvnWe55u9KV8MNsK4fNB/1soHs9CoJy1qUT/n
 YV87ERqoZOxgop0aciP/rvlQUtDf2kzn2sO9k3pd5lM/AC+QxkS7Jr9IZ7HFFWVkAC
 l4IalohICH6sM4vJtNIyxEeDNqG5C9ebtyBZ5XIAR+EUmT6gNn/X7HrfHzSKgpLJfp
 DslgHQ46AzqcA==
Received: from fli4l.lan.fli4l (p54a1b089.dip0.t-ipconnect.de [84.161.176.137])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A8034A4C10CD;
 Mon, 31 Aug 2026 20:30:47 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x16mN-000000003kK-0O3a;
 Mon, 31 Aug 2026 18:30:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 31 Aug 2026 20:30:47 +0200
Message-ID: <20260831183047.2010441-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/expat: security bump version to
 2.8.4
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

https://github.com/libexpat/libexpat/blob/R_2_8_4/expat/Changes
https://blog.hartwork.org/posts/expat-2-8-4-released/

Fixes CVE-2026-66046, CVE-2026-76641, CVE-2026-76956 & CVE-2026-76957.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/cc20c258572c9f941f4e1d6cbcddae710023631a

 package/expat/expat.hash | 4 ++--
 package/expat/expat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index c5a8816f9b..d8b4eef2f9 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,4 +1,4 @@
-# From https://github.com/libexpat/libexpat/releases/tag/R_2_8_3
-sha256  f6256df90c906773d344da084402b7d3e4f22ed41b1a59c989098a83d3ea0c85  expat-2.8.3.tar.xz
+# From https://github.com/libexpat/libexpat/releases/tag/R_2_8_4
+sha256  656ae1cc8da3b4ea513bb4e254f33e6243938084c0ec6239da873376b09985a7  expat-2.8.4.tar.xz
 # Locally calculated
 sha256  31b15de82aa19a845156169a17a5488bf597e561b2c318d159ed583139b25e87  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index a82be75a4d..1e5b738463 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.8.3
+EXPAT_VERSION = 2.8.4
 EXPAT_SITE = https://github.com/libexpat/libexpat/releases/download/R_$(subst .,_,$(EXPAT_VERSION))
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
