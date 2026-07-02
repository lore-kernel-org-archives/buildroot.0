Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 805D8C43458
	for <buildroot@archiver.kernel.org>; Thu,  2 Jul 2026 18:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 276F54189C;
	Thu,  2 Jul 2026 18:04:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n13r5t_Ka_bf; Thu,  2 Jul 2026 18:04:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11FB9418A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783015450;
	bh=YCDGqhmNL4/HgHZaopsTjsM5BXHltapqsdtPUzVydK4=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=M2FiMrrenvP4bKFuJL/vJ3iszMYMHGekBujjczTlNRIacuzV0bau9XqRnN5suTAl4
	 +EBRaJCrliCb/O5icKmN1vw9ePnGNC20QY9CvqrM3gkIMY8tr2AGFwWSFvMe3cEUes
	 yEw7yYKLp7nx2yItbhCQ18dLCWi6ngQrVpWtCw3Yt+w1Vv96SeBWkaXud34uiNloAU
	 tqlL0WcdKjGRvcmD5kFu0pZheborQGHN5atAfHj47JiCtz2PcaacB5x85RZ31ur/Av
	 liAsOaQUyqAhy0IzTr12ghCnJjIMpDrXKQY9p5Pv67UWiVT2gDY0//70rI0hs75Ypa
	 F0n8ZFdNHFsXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11FB9418A0;
	Thu,  2 Jul 2026 18:04:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 43D8C363
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 18:04:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 369AB40291
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 18:04:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hDOBU5b4970U for <buildroot@buildroot.org>;
 Thu,  2 Jul 2026 18:04:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 19F5E4025A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19F5E4025A
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 19F5E4025A
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 18:04:06 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 6987831E0B1F; Thu, 02 Jul 2026 20:04:04 +0200 (CEST)
Date: Thu, 2 Jul 2026 20:04:04 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <akaoFOYUuiUwVnnc@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.90+deb13.1-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1783015444; bh=tr/i9iJb5m3ayau3uFif2xM+aa7OamJPc+9ZjBv75KY=;
 h=Date:From:To:Subject:From;
 b=XEnbUfpWrZcoSCOgBcg/YXWpdqxV08FBhxrQyBlY4FNbI9/CazZHce/UJXqReyb6x
 nCKzkwXB8LUc3H0GL5AfUWRtJz+pcMfdIs8cfWF7CVnhY+WtujguQs9Qm7wVkYspYe
 UVR59JvJj/D79zE34ptQWkGmVDYWvoxMS2O1VgLgx+9G6r2EK1j08UOT7u1IsRMWcX
 hTOwKcziF6usxiKojHtnBZZigPSEP+crDjq4aJ8VzX/V3JiVj7W577xwFGO68n7yrK
 4KI3M8h6WLKuiNG8oeP3deoE6ndLk0nUeZJod4TGEUb5DZ8lYeGhUiONj9S/jQ+TP6
 7UVkCPiTIlngQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
Subject: [Buildroot] [PATCH] package/lighttpd: bump to 1.4.84
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

See here for changes:
https://www.lighttpd.net/2026/06/17/1.4.84/
https://www.lighttpd.net/2026/06/14/1.4.83/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/lighttpd/lighttpd.hash | 8 ++++----
 package/lighttpd/lighttpd.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
index 2a7c3c5e84..d0ee0a5da9 100644
--- a/package/lighttpd/lighttpd.hash
+++ b/package/lighttpd/lighttpd.hash
@@ -1,6 +1,6 @@
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.82.sha512sum
-sha512  a8ced6e61b6768d31fb643c1f75af906ee975000286a9a522415571878c7979fd9e5e39f36871e8f34f6ca5d3702fa4b20a0c1203b57ba446dae2dbb6efa71b4  lighttpd-1.4.82.tar.xz
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.82.sha256sum
-sha256  abfe74391f9cbd66ab154ea07e64f194dbe7e906ef4ed47eb3b0f3b46246c962  lighttpd-1.4.82.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.84.sha512sum
+sha512  47d3e802093822f5aa42b9b3324a95668d305c2e2074366b12be9bc812291ba423576e08b2a163a5f752b110139a76c7973086fbc01051f8f639998d8146ed00  lighttpd-1.4.84.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.84.sha256sum
+sha256  076dd43bec8f2ba9ce6db7e7ca7e8ad72271cd529805ead2400b56efaa026f70  lighttpd-1.4.84.tar.xz
 # Locally calculated
 sha256  5c98cad2fbaf5c5e2562bcbab401a7c557c1bb1bac9914ecc63730925052fb13  COPYING
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index a126e96167..613715b889 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIGHTTPD_VERSION_MAJOR = 1.4
-LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).82
+LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).84
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
 LIGHTTPD_LICENSE = BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
