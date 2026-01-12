Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA31D25050
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 627D884579;
	Mon, 12 Jan 2026 08:34:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KprtWHX-wRiI; Mon, 12 Jan 2026 08:34:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8717B844F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768206872;
	bh=IaLP7Zdy2s5NW/9+akx4DPLGiD6/dKZ556km7QKPEDE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oE43lBQ35L3Rig63WbRj9YDnelEFHDDIG7Cob2e8HDzEzaSdmesrzjtIkf+G4Zf7A
	 HFV0Bwy9yqVSK3151N00/a6PVEiLinl0DbYHnJFnbGr2U1OxQulbNwibwPPeCAHpVF
	 mES/QEHTFPbtL3LGcxMaIM4MhLlGcobNJjDbkH2JGEOeny4QgxVxFVTbT+hj2XFEEa
	 j6RZ3ChTZxyHxRTc+mtjU6JE9+jGoZrVd73EJoDduN7en7ipLcqzLSsN08xolilJjj
	 0N9pGvhzJ0Yz/RMAYxZAna8Nbg/q3sww6JC6WQG0NMi57sY1/7egt0Lsj/wRVH6aQP
	 iviROei1KgbYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8717B844F9;
	Mon, 12 Jan 2026 08:34:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 04FD418D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:34:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA93C614F6
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:34:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GE4zkGCSzKIX for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:34:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D51A5614E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D51A5614E7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D51A5614E7
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:34:29 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4C0DAA4C3A6A
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:30:22 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJF-000000007z0-2W6n
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:29:20 +0100
Message-ID: <20260112082950.2528445-72-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206622;
 bh=ci8CCKjGLM6mTli65wpS3J1tc5oNhy46bO5DoITCmSU=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=q3ssuPRsJB54pAesy17fZjeFpFsW8OMrOOh4Q5atleLLXm12/B7SIXPZL7gN0/nYH
 owO2IPCO3ENPZkPuGDSS+FqYJZf5ZhZvFwxvc6PydEuEFKvvIt8PyHZuz+h0WyCPsp
 n0+Nd3aJzU+9sjezAKOVyg4KoO6RjHknjhxqWmh1s9CzMpw6ekqTopOs/LvuYOf/y8
 zwcb1h+DvTo0kUlA4lrT1apaptawq5BXxwfnMHxGv1FHM/Fvhl8nsg0uup0v/r6eZc
 YLNqxPgKTP56ryxjASTetK2ijiuF9BbITbh7mar7/8ezVU1DO+2scwVerAtyd8rI+A
 mlAcU96bKCm4w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=q3ssuPRs
Subject: [Buildroot] [PATCH 072/102] package/x11r7/xapp_xedit: bump version
 to 1.2.4
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

https://lists.x.org/archives/xorg-announce/2024-March/003484.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xedit/xapp_xedit.hash | 6 +++---
 package/x11r7/xapp_xedit/xapp_xedit.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xedit/xapp_xedit.hash b/package/x11r7/xapp_xedit/xapp_xedit.hash
index d550dbc8c6..4e1ff428cb 100644
--- a/package/x11r7/xapp_xedit/xapp_xedit.hash
+++ b/package/x11r7/xapp_xedit/xapp_xedit.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-April/003149.html
-sha256  bdd33afeeca881622e55d2cf28f07b4a98f083d0a2573c0b9048f25bdd62db2f  xedit-1.2.3.tar.xz
-sha512  1089c35ef961e53f74cc7d892960e1ee7f0da17529e3173e7f7764b0eb4ee94d1e068cb177d8502ca55c1dd6808962d4b1427e303adc7e6db80be8828557f45a  xedit-1.2.3.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-March/003484.html
+sha256  b00d488b29cd007fadf9a4e44193cbdd72b48c94080be5ebc02565f21f9a2a71  xedit-1.2.4.tar.xz
+sha512  30819ec491f9a02db95c20eb8653389b29bf4a4a5c54701d156db67fcb8fade5276dcb3a656dca245c958d75d0ee6fe50ab207e040ce0065d9d9a1bd58d5b24c  xedit-1.2.4.tar.xz
 # Locally computed
 sha256  6d3e4092277ea08fc6b3180dba061120ea53ee965afb84fce16f8ab3d35bb47a  COPYING
diff --git a/package/x11r7/xapp_xedit/xapp_xedit.mk b/package/x11r7/xapp_xedit/xapp_xedit.mk
index 5aae798f05..91dd01554c 100644
--- a/package/x11r7/xapp_xedit/xapp_xedit.mk
+++ b/package/x11r7/xapp_xedit/xapp_xedit.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XEDIT_VERSION = 1.2.3
+XAPP_XEDIT_VERSION = 1.2.4
 XAPP_XEDIT_SOURCE = xedit-$(XAPP_XEDIT_VERSION).tar.xz
-XAPP_XEDIT_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XEDIT_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XEDIT_LICENSE = MIT
 XAPP_XEDIT_LICENSE_FILES = COPYING
 XAPP_XEDIT_DEPENDENCIES = xlib_libXaw
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
