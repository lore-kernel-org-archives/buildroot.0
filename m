Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6BAAFD004A
	for <buildroot@archiver.kernel.org>; Sun,  1 Mar 2026 10:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D1A3418FB;
	Sun,  1 Mar 2026 10:37:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pjzd9E42zEC3; Sun,  1 Mar 2026 10:37:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93407418F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772361449;
	bh=BUBBHtWKyMw1nnWpm1s+ApgdUwG1fPkuFzc2SAtTatM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gFkJY4109w125Y1Hg37vqR0MpFqtSVbxS/Jub0sVpLx/SX8o1SYbd5ETlMZZ0XUoL
	 5LVLFPW+pOteb08iEfvOysQLDBmz24k4H++cZAvddgaV8U7U4kCC/rQxNUj/WgJpNh
	 h5BYpG9mc9iK1WZTBEDJPUXCNzS32cg2ir8EqKUPdpeZot0VlT5zMVX/GkxaW0RynG
	 dtP2GueMwoLmX37T39BCTbKThzNGorsGrCi7yS9XSyW6FvP3sXxUTABKIaSDIghk6w
	 M01I3p5bdApE3pR+UAGqwaBLYHcOoDe/u3tFE7Gts5bkMp0zyIjnnDOVnBGIg8hZ8c
	 hsSPR0MMeimRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93407418F3;
	Sun,  1 Mar 2026 10:37:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BEC6231
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 10:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99670404EF
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 10:37:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7uvCBj2jCkx7 for <buildroot@buildroot.org>;
 Sun,  1 Mar 2026 10:37:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0562340499
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0562340499
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0562340499
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 10:37:26 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0c16.dip0.t-ipconnect.de [91.58.12.22])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 170FAA4C32BB
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 11:37:23 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54076)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vweAs-000000001OU-1fja
 for buildroot@buildroot.org; Sun, 01 Mar 2026 10:37:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  1 Mar 2026 11:37:22 +0100
Message-ID: <20260301103722.3526268-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772361443;
 bh=x8ZFJQZLqTcso/8jsDvlJEtoRopnmtp0xeIcVCxIERU=;
 h=From:To:Subject:Date:From;
 b=jK0WoWWF1MtplACg6+pebagqWLfMxic5REKdv6H0yhND/DpLR1C+n/Xu+NsWfvaBz
 TDjfCnEJAeuryWR330FmyUiFgKwyWet9IrDt4LaUConeKJQOEu8K/16ATeoSgMq7Vg
 3qhY00OtK91BvDIB5n4Nxh0df/n8CTMVvXisRrznRzylzWl0GnERk6EPvmYDNduqpv
 jz4wfhJmo1oP/dzppkdtooQFKAt+PdZW4sPzbs7vAdD9JN+k6JuwBMkqI2tmotV7L0
 3VuxgX49jtOt7pU+GS+mIhDltdA/ADU6HArv85j0/vWXOnvhXVSNM//zkjgumlEbOq
 uOuG/sUWYQIXg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=jK0WoWWF
Subject: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.23.6
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

Release notes of this bugfix release:
https://www.samba.org/samba/history/samba-4.23.6.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index cc07b2527b..84ada82bfd 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.23.5.tar.asc
-sha256  593a43ddd0d57902237dfa76888f7b02cb7fc7747111369cb31e126db4836b9f  samba-4.23.5.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.23.6.tar.asc
+sha256  e3dabd8b5e42dc97669fa0faef032510a94e496b58f7067082e5036d88f0e702  samba-4.23.6.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 5d9eacef90..2631f2dcad 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.23.5
+SAMBA4_VERSION = 4.23.6
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
