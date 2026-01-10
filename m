Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4717D277C1
	for <buildroot@archiver.kernel.org>; Sat, 10 Jan 2026 18:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12A5160820;
	Sat, 10 Jan 2026 18:06:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BwQlZ4Kv0Ltf; Sat, 10 Jan 2026 18:06:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A88160842
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768068392;
	bh=WjSiLiJ31uE1uV+1HOBE9+Lctk4KdrHFZoW7rGGsjwM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AhVxErcbD4GoNQxwkMja+ZN7EzlQGMfPAmxG4aBFBQ3pT+xG1cqaTCiWv9qxtz2qi
	 9ijAocGgiQe3Jh55peKlEo4T3Lt5o2G84sF8UCs2eBqinltpTnhK3dOly0ehLhg7GR
	 Ip6qLl/RuSuqWkXppmi4RizP3bvSI+qkGmWeANQ1Q1EcR14BJxbqQwCsJDHueWgmuT
	 FFzCLeMi7kzsYDAL2+W4j1XqrzrJJyb37+IaUHPtCD6lq05zmfxoG2QUzpbIEIWv0T
	 UOinGa5rTDTG0YPECyFLhzJuzUl1kjNH6L+zAYxRAKRSL2PfJrtYqBp6NI5Tb/8+hn
	 GkwhMFaY/0eEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A88160842;
	Sat, 10 Jan 2026 18:06:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 395F512E
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 18:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BA7C60820
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 18:06:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VSbhAWrT7y1F for <buildroot@buildroot.org>;
 Sat, 10 Jan 2026 18:06:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F3E5260619
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3E5260619
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F3E5260619
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 18:06:29 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2A76AA4C362F;
 Sat, 10 Jan 2026 19:06:28 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46290)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vedM3-000000007rE-3gC7;
 Sat, 10 Jan 2026 18:06:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 10 Jan 2026 19:06:27 +0100
Message-ID: <20260110180627.2205930-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768068388;
 bh=euZ7ORuFG+Z4BSnAVl9klQl1clbOwlsbr6/HV99BAE0=;
 h=From:To:Cc:Subject:Date:From;
 b=M9GVDhZcUEPEVV5gm2oZPN3U7hHsmJv2JQMyK/UJcaXnTIUwhwzwz4s6W4rqtr3pc
 Rv9WMH0WI49DY3YWGKDvGr1vZ26N0vByYKGW3h4pyTQ1hnZiJwADgWSDRjZMz1+6bk
 uk4GN9R2Vv2Zsw7COqeEvWxOLvgrTtVM9dO4Swx8AMFxMQE2zCbncIiGULC8oH5TxS
 nIOmbmUeu0ut9TG6X+aWfNEeVVHMPhLKWNE567gDUsRWvEo38b9x8Pq012QyP3+CbB
 y/aKmE5wG6jFcLINubzsu5uFc/wyV1ISnyR41/szcnQbtVtrOPkKtZ8pNWHOiEr/My
 l/R49SIUibgEw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=M9GVDhZc
Subject: [Buildroot] [PATCH 1/1] package/lcms2: bump version to 2.18
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

https://github.com/mm2/Little-CMS/releases/tag/lcms2.18

Added sha256 tarball hash from github.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/lcms2/lcms2.hash | 7 ++++---
 package/lcms2/lcms2.mk   | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/lcms2/lcms2.hash b/package/lcms2/lcms2.hash
index eef8229eef..e2277ba610 100644
--- a/package/lcms2/lcms2.hash
+++ b/package/lcms2/lcms2.hash
@@ -1,5 +1,6 @@
-# From https://sourceforge.net/projects/lcms/files/lcms/2.17
-sha1  213382ca260cf761f264f185407f75bb1c6e2ce8  lcms2-2.17.tar.gz
+# From https://sourceforge.net/projects/lcms/files/lcms/2.18
+sha1  3917db04b8d19b62ea6c9d8f4ff0404d145aca4a  lcms2-2.18.tar.gz
+# From https://github.com/mm2/Little-CMS/releases/tag/lcms2.18
+sha256  ee67be3566f459362c1ee094fde2c159d33fa0390aa4ed5f5af676f9e5004347  lcms2-2.18.tar.gz
 # Locally computed:
-sha256  d11af569e42a1baa1650d20ad61d12e41af4fead4aa7964a01f93b08b53ab074  lcms2-2.17.tar.gz
 sha256  6dbd60437f8ef91d8de1f08ad75882547fd4931bfcc3566a0735f28db1484d31  LICENSE
diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
index 5137c7ea20..4ffad41014 100644
--- a/package/lcms2/lcms2.mk
+++ b/package/lcms2/lcms2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LCMS2_VERSION = 2.17
+LCMS2_VERSION = 2.18
 LCMS2_SITE = https://downloads.sourceforge.net/project/lcms/lcms/$(LCMS2_VERSION)
 LCMS2_LICENSE = MIT
 LCMS2_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
