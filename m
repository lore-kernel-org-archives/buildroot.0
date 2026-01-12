Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A11E7D25049
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:20:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7097561180;
	Mon, 12 Jan 2026 08:20:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HWJYGm8TSx2v; Mon, 12 Jan 2026 08:20:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8744161466
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768206047;
	bh=BpzQMPQflxTPFL1Tm87WFs4POXQ8FQzSl/zikq0AWZ4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TwCiPXG8oEni6WW8qjAtddZP1aZXBYI8YLhxiGSsMjT6k8uuHuGUs58dPji2rfRWl
	 YZX8yKKfr/JsWhp3adtIJPGdrEw0oScBnwiOErWNNuLSPjkXKBZr8VRN4rvr8DI3if
	 IlKSdB1CNFAjE6qBcKb9Msdd897SMSpIeTCFXuKxQ2t2gF7gQi7KTAf7QEEg+H5tHE
	 +aUNW5JaGyXQt9BOBlB/Fw2KNIuhlmEPZ8yGkc8Tk7CXwyAoL0C0K7CyQALI6EMOIS
	 8Wus5ts/0UI2cE1TY9ZkG3SQ+c1LCTpuOaSaupAs7YigSHlJeJlshjsHRBN8wXdtah
	 BVEl0dsnHj/XQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8744161466;
	Mon, 12 Jan 2026 08:20:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BAF8812E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:20:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD93740703
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:20:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BAGdmHx764Ud for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:20:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A13FD414E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A13FD414E2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A13FD414E2
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:20:44 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4BAB2A4C4177
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:46 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuW-000000003M6-2eeJ
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:03:06 +0100
Message-ID: <20260112080419.2516889-31-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205146;
 bh=gCEY/saSHZaR9MnUCXvpy57bUlchP4OG6rRIY9A9JXc=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=DTMlrdWNlPgrH2NML3lgmXUrVF48euA3UIpElNFSj9CFWaM9JmaSs0ZCQWmU0nnuA
 1ITQN7MqdbzbRSSsr5RWWjQ4r1wB+eVzc5j8gjOyZvABDZx+zYciqVCS9sICx1n5za
 XTQmAsNH3jH1sfWomWB9s5zKUpok8/wZhipDknOre8ImClcpdkPVaTBoVrfIYURQBe
 mao9VBGl+BQzrYsJEt380seO5A/72irUE0A2hJOecoKWOJZB/q8CZ2YKRpXqTSwTih
 Hm1Jvv6VU0aZt78QA3gerZ3GmA6lE95l3a8oelAm6hEk4RFu7/9YXm1YQ7DwiqkvOf
 t57PdRPtWbZ+w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=DTMlrdWN
Subject: [Buildroot] [PATCH 031/104] package/x11r7/xlib_libSM: bump version
 to 1.2.6
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

https://lists.x.org/archives/xorg-announce/2025-March/003592.html
https://lists.x.org/archives/xorg-announce/2024-December/003569.html

Updated license hash due to upstream commit:
https://gitlab.freedesktop.org/xorg/lib/libsm/-/commit/e0628f5ca2168a413b8b39f20ec62ae4f725bc63

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xlib_libSM/xlib_libSM.hash | 8 ++++----
 package/x11r7/xlib_libSM/xlib_libSM.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xlib_libSM/xlib_libSM.hash b/package/x11r7/xlib_libSM/xlib_libSM.hash
index 3068c85b93..63a2684742 100644
--- a/package/x11r7/xlib_libSM/xlib_libSM.hash
+++ b/package/x11r7/xlib_libSM/xlib_libSM.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-December/003307.html
-sha256  fdcbe51e4d1276b1183da77a8a4e74a137ca203e0bcfb20972dd5f3347e97b84  libSM-1.2.4.tar.xz
-sha512  7f1d41b7b6c5dd456c49ccad7740c3ba9791a2793fa50fd94814a4164ce2e20c4a0a0ad42a87708e494ed5c23f611be6d3ccd9ef1e9add6d46ac545e2b0f6f86  libSM-1.2.4.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-March/003592.html
+sha256  be7c0abdb15cbfd29ac62573c1c82e877f9d4047ad15321e7ea97d1e43d835be  libSM-1.2.6.tar.xz
+sha512  e544a1dc49a03390f76af35837bfd01f749b806d88d3ee806f20311c47ff53d0aeea4744feb875958031b17d50b57a89dcc41d81241c09333c88b268c44653a7  libSM-1.2.6.tar.xz
 # Locally computed
-sha256  af7926a14d85ad367622688636e8c9c6f7807c8a6867536af1c530b5c262bfba  COPYING
+sha256  136fb258a67a2810302c6cd99525b068e6f875b8f1031a93b34edad3ffc740a5  COPYING
diff --git a/package/x11r7/xlib_libSM/xlib_libSM.mk b/package/x11r7/xlib_libSM/xlib_libSM.mk
index 8e5c90127a..6e3c59796f 100644
--- a/package/x11r7/xlib_libSM/xlib_libSM.mk
+++ b/package/x11r7/xlib_libSM/xlib_libSM.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBSM_VERSION = 1.2.4
+XLIB_LIBSM_VERSION = 1.2.6
 XLIB_LIBSM_SOURCE = libSM-$(XLIB_LIBSM_VERSION).tar.xz
 XLIB_LIBSM_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBSM_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
