Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3468CD343F
	for <buildroot@archiver.kernel.org>; Thu,  7 May 2026 17:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74BDC83C70;
	Thu,  7 May 2026 17:14:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 73x6dbCxeGhG; Thu,  7 May 2026 17:14:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81FCD83C71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778174063;
	bh=AEHjyXTasxcvPj5VhB8opIOVB/aYx8piECMVcnvqU3A=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FC4c65S7hV4rnXvN61TZ9nI+H5lelZoV/HkUT/Q5Gv5j3jVJktIdDs4zMAMjQ95hu
	 8EUpnQjAZqoQHOIVSRKnY4bjmryYKe7B+5ilqXfFmHFhj7EHf5nRhmQ0GfiGeUj9pR
	 cqVU1VQLcOi/bAi6yB9ppNqQ6VjxyuTidGz9+IUx2yapDynh1TjZBdDd6vtuuyxvPg
	 pBkWQ3mGxr2cSvSPwketxyloAScsrlxsAOb7C5691om97sugXYjFzMQlIUp9wXwb4b
	 2yA3BNixy1XndnD2Xp5bAK2sSu/lV7sG4S+9yGDDQymVo4PTpe9kRXGbObD4/IKUOM
	 5SGnW3i5+W1mw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81FCD83C71;
	Thu,  7 May 2026 17:14:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A45E317
 for <buildroot@buildroot.org>; Thu,  7 May 2026 17:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5BD8240832
 for <buildroot@buildroot.org>; Thu,  7 May 2026 17:14:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q_tLP85zMlUC for <buildroot@buildroot.org>;
 Thu,  7 May 2026 17:14:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2BE2E4080E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BE2E4080E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2BE2E4080E
 for <buildroot@buildroot.org>; Thu,  7 May 2026 17:14:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c188.dip0.t-ipconnect.de [79.214.193.136])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 035B1A4C21BA
 for <buildroot@buildroot.org>; Thu,  7 May 2026 19:14:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48864)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wL2Ij-000000001CS-2pXe
 for buildroot@buildroot.org; Thu, 07 May 2026 17:14:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  7 May 2026 19:14:17 +0200
Message-ID: <20260507171417.3971673-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778174058;
 bh=8FkqBfJMQEvXIxmOiFF/yKYt92LPWPASZe4hf51Gloo=;
 h=From:To:Subject:Date:From;
 b=KrhxlQ6oyAgRmITH4z0QNzeLvELb2kkaLhX9NqB847nw6kiHYgNoNMhXP+RwvfvWt
 6KD/0e9LSDhcrZf0AOprpiq1fvgr/uChIghi2u/zX7OBdl5YPtjjz+xNmm7rDcPaWm
 559scdm685CK1/UqLyMP0F2iSxX5q167AzL9abV2rBqBXCDRmYacTSXRPiJdj7rX/c
 1VhWlXj/WWwwpUfjU9GEIxFB+/0bo8WgYafo/6qIcFzKQYbGZzdHlfqEs9FiD0UIZZ
 O31ge5N7WZEzQKW/UTcEsD/opjh1k3TlfcuwBI1obL3/2iVRaEXdUfVnbCLhjjD+Fw
 cPjljDXfHu8MQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=KrhxlQ6o
Subject: [Buildroot] [PATCH 1/1] package/libdrm: bump version to 2.4.133
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

https://gitlab.freedesktop.org/mesa/libdrm/-/compare/libdrm-2.4.131...libdrm-2.4.133?from_project_id=177

Due to a missing announcement the tarball hashes were computed locally.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libdrm/libdrm.hash | 6 +++---
 package/libdrm/libdrm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index 52bf0c6228..8e49c566cd 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2025-December/003647.html
-sha256  45ba9983b51c896406a3d654de81d313b953b76e6391e2797073d543c5f617d5  libdrm-2.4.131.tar.xz
-sha512  d75894215600b648e25bbe13422901b650fb94bba8276d77971a49db7dc001819c9fc4b7e90ed82275f170a331687960ca5752cbb12064b2eec9c5c8eb60bf3c  libdrm-2.4.131.tar.xz
+# Locally computed
+sha256  fc68f9d0ba2ea63c9432a299e14fea09fad7a8a66e8039fcd7802ca59f77b4f5  libdrm-2.4.133.tar.xz
+sha512  2b8016f64d2553c6cec4870b01820c48eb3985cadc4e39846bcc54db6bcec9435f65ba7749fc8271020317489bc05625e991383569cba803cca85c686d1f4568  libdrm-2.4.133.tar.xz
 
 # Hash for license file
 sha256  d0a616a9020dc0271e36e6dd4bad174b4e2c2a42636f13785f8e18dd5f85fd83  data/meson.build
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 240c09b8b1..7972b60527 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.131
+LIBDRM_VERSION = 2.4.133
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
