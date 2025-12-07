Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 793EAD2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 14:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5144B60B97;
	Sun,  7 Dec 2025 14:43:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7_8J9q_Jqdg3; Sun,  7 Dec 2025 14:43:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48BDC60AA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765118629;
	bh=sIuamxenKk7pf9aqu9KmxsCWdFkpu7FS3nJ7tKUdBOw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=VkS5L+JPbBIPyEo0w/4C/xnDM4mCOm91WGoPM75OUt09sRV4jfpbURsF3s9sq+X9Q
	 gHBqmdKkgWn82GlgnnT665LpQl5S9MrWUZ/xOUkkH98dBdl5Htqy+3jximxqFO4Om+
	 BvtXudKvd20AhxEABHxJJhpFU+LQ2RuZgXwHO08CWBxbGt3FZUen6WDgiaV7kT1k2m
	 Qu0U6vBGuTVElEhxyzSPXCXIw3BWmk9tU9qStBw9Nbcj9etL+VmplhIQMlpk2uNZHV
	 WIj5OomTzc/n502UKMW66TZs3ep1nkA3eQbRw1IkqmGFIqoiAQylkT9fFqOrNGInbr
	 LLrWI5NxWz6vQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48BDC60AA1;
	Sun,  7 Dec 2025 14:43:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F71C2CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 312C3821C5
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:43:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vQ14jgRUQaCX for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 14:43:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2E7BD821BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E7BD821BF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2E7BD821BF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:43:47 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A9E61A4C097B;
 Sun,  7 Dec 2025 15:42:53 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56734)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSFyG-00000000416-0N4i;
 Sun, 07 Dec 2025 14:42:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Dec 2025 15:42:16 +0100
Message-ID: <20251207144243.3696572-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251207144243.3696572-1-bernd@kuhls.net>
References: <20251207144243.3696572-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765118573;
 bh=jvlHfWtsNnkf+afqsdGewUqNTCZAjDA1Ylx3ZSUZxD0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=LpIs8fI/ClVsGeAqwVRtzKpeiBE/9yJREiocHypElOLzhO0PyK0lUognNQhOOeWgc
 LN5hiDP3PyMvm84CV6aon5OtH2VwhzRLtp8hFTKtUEW4cu5C6VLedm7kZruMZBWUiL
 q7wUvFexOsjTJTvBqw41y9/n6ogaEfLKqjagy6rD1BESvJSPOSzXHF4jnDUrmYm0HB
 IQFsRdQlC0GaQPQeT9PoKHa8BwftZKGwbntusP+qVcbh585UWuQaYIkj50fQg1GULh
 59+ipPIgkFBEiz2Pqt0W+D6cM+un7WM049ggzSlgKVzmOHO9W9NtA3gHFEKhHCd+JN
 buiYWZ+R1VJ+Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=LpIs8fI/
Subject: [Buildroot] [PATCH/next 07/33] package/odhcp6c: bump version
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
Cc: Alexander Clouter <alex+buildroot@digriz.org.uk>,
 Jean Burgat <jeanburgat33@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Alessandro Partesotti <a.partesotti@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Prabhu Sannachi <prabhu.sannachi@collins.com>,
 Denis Bodor <lefinnois@lefinnois.net>,
 James Hilliard <james.hilliard1@gmail.com>, Jianhui Zhao <zhaojh329@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 James Knight <james.knight@collins.com>, Simon Dawson <spdawson@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Michael Vetter <jubalh@iodoru.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/odhcp6c/odhcp6c.hash | 2 +-
 package/odhcp6c/odhcp6c.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/odhcp6c/odhcp6c.hash b/package/odhcp6c/odhcp6c.hash
index f1641d7101..86c9c659c4 100644
--- a/package/odhcp6c/odhcp6c.hash
+++ b/package/odhcp6c/odhcp6c.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c5cadd71a72e94df6b664d3e9f0b1eeffa779ba9624ab35b6a93c7172fe378a0  odhcp6c-53f07e90b7f1da6977143a488dd5cb73a33b233b-git4.tar.gz
+sha256  e9cfddfcc12c4ca0bf8d8211bb72c7018c0e0f8da6903d680da122b4ce551c56  odhcp6c-f19dd37fb467c9cf10cad57aefa0d048312d7dfd-git4.tar.gz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/odhcp6c/odhcp6c.mk b/package/odhcp6c/odhcp6c.mk
index dd3a9d3e28..20756bb1e8 100644
--- a/package/odhcp6c/odhcp6c.mk
+++ b/package/odhcp6c/odhcp6c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ODHCP6C_VERSION = 53f07e90b7f1da6977143a488dd5cb73a33b233b
+ODHCP6C_VERSION = f19dd37fb467c9cf10cad57aefa0d048312d7dfd
 ODHCP6C_SITE = https://git.openwrt.org/project/odhcp6c.git
 ODHCP6C_SITE_METHOD = git
 ODHCP6C_LICENSE = GPL-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
