Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12824D25056
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E044B8466F;
	Mon, 12 Jan 2026 08:45:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SBYqInQsd0SW; Mon, 12 Jan 2026 08:45:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E8F58460A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768207536;
	bh=BpzQMPQflxTPFL1Tm87WFs4POXQ8FQzSl/zikq0AWZ4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VmMWBQTHtuvjtGjH99AsnshbAT3WcM9nuQm9y/2KzCt4RpAJMAv/v/KcHqunuIZ0i
	 R3GxUouxTS0LNspt3MauJskYYP53gMSWZXKOYnsOhsDWEG2PEGao36nTKi3rhn0PkX
	 I+bSD+12Bx55MWcyOurwMAN6ESbr/GWMqNhcrGJnsmXOIg0/fN6OHSAIqdYyEfST3O
	 FytmwRRIoytvQ+YokgOCGPbjImQJHeSHpbO9qvbllOLJ3l93Tb51DdKd1O1FqNuOhf
	 ya2iQaCkM1JqNRWXCJrp3WIJNEtudB7J6QZoMg20/ivUc+vUEUechMVNmXy0BWz4Fk
	 DSgF77aq4Vxqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E8F58460A;
	Mon, 12 Jan 2026 08:45:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C497C18D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB29361591
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:45:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JjPOEy0TYMAB for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:45:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A2B8061207
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2B8061207
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A2B8061207
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:45:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 19B27A4C41AB
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:31:04 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJC-000000007z0-3AbF
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:28:38 +0100
Message-ID: <20260112082950.2528445-30-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206664;
 bh=gCEY/saSHZaR9MnUCXvpy57bUlchP4OG6rRIY9A9JXc=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=f78a0WzAIF1ubjcXURqjzd0ASR3RYAxDLLuWIu9+ZnFuFEHOFzmBe8KHnGUGyWWtc
 nKt0mdWS+Uh9apTysT2lQffshgZCLsv9r9J2oGHwQthrlDoJr7SoF7HkBkU8t7DH5N
 MTh9Qyc04XguymCdmC+vCXZlmlKyaqS6AbBLxazBarqI+nq6tpPaA6CzrFEHBDtB33
 jrLP0up6QHEEMeLhQ7NkqvmkaBArlwEwnoW9iXw1G/pprta+p2HVIunILW8dnuvDAn
 LLifJrAUjTv+xaw1gAkdJL66gtM91G5eBlFB70Yiyx7V1lr/hZj0ymO1HfO31DDTWt
 mGZQSVHkX6+UA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=f78a0WzA
Subject: [Buildroot] [PATCH 030/102] package/x11r7/xlib_libSM: bump version
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
