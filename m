Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8981EEB7EAC
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 09:31:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51A9940776;
	Wed,  4 Mar 2026 09:31:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jyIz3NtgWOXo; Wed,  4 Mar 2026 09:31:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4844F4082D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772616669;
	bh=DXRCib/g6KBDqqTztSbgs7F4LGV3CXMpimqBdPALjkk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bUQa8g/MP0ysCBSv83Q3MkoGFKdj47u6fRvLR6lP5bsyElxmCscQWl8keuAwgXO0z
	 YCx/pujd4pwr7vB4rbiqv4jeL/YIsxEz8xZEKRCzTb3oH6iybsKFk6pHBoHhwYy5mL
	 +ccmU5weBA4ZEulVjqdySQkRcvz+YKmcT9Y803XX56aEHX9Hs+hwaley6nRCE8eVVx
	 qXO3ex/n8W5MrjTEiq1yswGVw5mxWW3Dtzlysi7gophcoYT5BpuiPLPvXNJMBtgmPH
	 epOnyPhzD1+9SaR1rxAUutKQHW7UJK/XTWNQn8iM6Gwkhs/Zp+f6idKRk2IZO8NkV+
	 NsZnIr1QwNkNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4844F4082D;
	Wed,  4 Mar 2026 09:31:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D2A1F1EB
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 09:31:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8BDF4082A
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 09:31:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0F9yo164LPaQ for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 09:31:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E005740710
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E005740710
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E005740710
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 09:31:02 +0000 (UTC)
Received: from 91-154-227-245.elisa-laajakaista.fi ([91.154.227.245]
 helo=kodama) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vxiZG-008qDz-Rx; Wed, 04 Mar 2026 10:30:59 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 9174ff3e;
 Wed, 4 Mar 2026 09:30:57 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Cc: Thomas Devoogdt <thomas@devoogdt.com>
Date: Wed,  4 Mar 2026 11:30:25 +0200
Message-ID: <20260304093057.3638503-1-aperez@igalia.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=H3klEyCyiwsQflw9CtsyxdCHBRvZxoHeniQNNyG1mak=; b=NbZTiQvcA+ok1I6fnI7pYld8nH
 R0qN4tHgOt1X1GzAE6B7p8DrvKNWGbMGLmb66c+dR480YDPxVGtJ6ifdlE4ewTYZM8srWVH6P05qO
 Jy+v8Og07OK5mRUKVnstOnI4c3b6LYl+uRzDcA+gxff49CyVVHhtCmznW1TJSJYoj6427Meoppp19
 So+MsNz5qBxfe7fVNZPTmUT3AxiFAIwLAJ42yCYzIBFeoITIAK+gyFdLf8K/w9KHBPrVKFyvF5Hwp
 oZmE32kWfxDJB0qooG5LiVsrXRackjEgm5h1CoWADL+E0yP0vRsQ1YEESZM3VcSGx6/7xEyu4NvGv
 PaQTkGEw==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=NbZTiQvc
Subject: [Buildroot] [PATCH] package/libsoup3: security bump to 3.6.6
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

While there is only one CVE numebr assigned (CVE-2025-14523) for one of
the patches included in this release, the bulk of the the changes are
security fixes.

Release notes may be found at:

  https://gitlab.gnome.org/GNOME/libsoup/-/commit/25eac153004f777581ca2d95e31a02ca96844332

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/libsoup3/libsoup3.hash | 4 ++--
 package/libsoup3/libsoup3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libsoup3/libsoup3.hash b/package/libsoup3/libsoup3.hash
index 32aa7382fa..c0b860875c 100644
--- a/package/libsoup3/libsoup3.hash
+++ b/package/libsoup3/libsoup3.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/libsoup/3.6/libsoup-3.6.5.sha256sum
-sha256  6891765aac3e949017945c3eaebd8cc8216df772456dc9f460976fbdb7ada234  libsoup-3.6.5.tar.xz
+# From https://download.gnome.org/sources/libsoup/3.6/libsoup-3.6.6.sha256sum
+sha256  51ed0ae06f9d5a40f401ff459e2e5f652f9a510b7730e1359ee66d14d4872740  libsoup-3.6.6.tar.xz
 # Locally calculated
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libsoup3/libsoup3.mk b/package/libsoup3/libsoup3.mk
index 0db587a93a..34a9ed2741 100644
--- a/package/libsoup3/libsoup3.mk
+++ b/package/libsoup3/libsoup3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSOUP3_VERSION_MAJOR = 3.6
-LIBSOUP3_VERSION = $(LIBSOUP3_VERSION_MAJOR).5
+LIBSOUP3_VERSION = $(LIBSOUP3_VERSION_MAJOR).6
 LIBSOUP3_SOURCE = libsoup-$(LIBSOUP3_VERSION).tar.xz
 LIBSOUP3_SITE = https://download.gnome.org/sources/libsoup/$(LIBSOUP3_VERSION_MAJOR)
 LIBSOUP3_LICENSE = LGPL-2.0+
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
