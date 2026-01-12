Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33EAFD25044
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A139614C5;
	Mon, 12 Jan 2026 08:09:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YG22exsNgyEO; Mon, 12 Jan 2026 08:09:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BE9A614CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205358;
	bh=IaLP7Zdy2s5NW/9+akx4DPLGiD6/dKZ556km7QKPEDE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Os9kOGApOIJ2wqIkCrB8TM1gbNZo71NWnmR5c73xcdfYjRmx+Izns3lIr9kTci59h
	 5BNC0EiHIWUrD0bm0Xr+DLL6GapJZCtCmtsXkU0Dg8e+XnIJrB4tS9aDbG0O+MDn9J
	 JE3lQ4xBNWZ3I5ypmL0SB7hxkQTG763FvHJMv4sV1AnB2WQ7ilCONkRdPQopGbxL0q
	 L0Z5VI4/OsWsGrEgzK/cI4Pg2Tqn3kbUVBZm7mH4jyBvKcmrlskUN1Ej7cJJ8WAjOv
	 Kn7LmmrVXVDSxxKg651DZCTBy3xfnliyy3kl140BB2xsAwaEvT7+ieryPwuShh6Ef6
	 PuVg3CKVITyyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BE9A614CC;
	Mon, 12 Jan 2026 08:09:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A2BFF18D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 88F0B614CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:09:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KlI2OZ480dG6 for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:09:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7F6C2614C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F6C2614C5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7F6C2614C5
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:09:16 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B8A6EA4C3B3A
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:06 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuZ-000000003M6-2e37
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:03:48 +0100
Message-ID: <20260112080419.2516889-73-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205106;
 bh=ci8CCKjGLM6mTli65wpS3J1tc5oNhy46bO5DoITCmSU=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=aVEDgfSglseFClWvm2LDSxmaPbN2Wq4/CRvkqY1IccOitFVAkftnbatrd7i16TV8Z
 7F5Hec/axkx8QxOr+leqRzRRZHeG5LETeNduf2/JBl+QAeBlehP3sxwV1gQXSqe9N6
 vNe5IV1uojj8LzAT+RA8k0uduV//WzoEisGvmq8YUFKL9HpNaU39r3l4MR4tt83cwV
 12TidoRc/edEBeR/KxpoM1XbGS/XeleSDNhGc6KvQIp/ePp8RZ0x7NNaozPlJn6DCJ
 YuZDesuCT4IWg98ZOjw3ANf8Dap90zYXHJkXCkaZBKzNxNiRKeW8FbGk7NQdJWg4Mb
 Tg8IMm4iSniTg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=aVEDgfSg
Subject: [Buildroot] [PATCH 073/104] package/x11r7/xapp_xedit: bump version
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
