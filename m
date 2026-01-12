Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF6DD25049
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9140807C1;
	Mon, 12 Jan 2026 08:19:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R8pWEsG-KvBE; Mon, 12 Jan 2026 08:19:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8A548083A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205987;
	bh=y+TrB50qb44lD9fNVv9puWgPSt6Dg8/yT0S8lonAM0w=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gk8bjGqzhmuWUKH9TX6XMtBJachK4UysN5xC0P0zH90apWCIK4AkzZeSFs7YlwuaX
	 VATGqBIa4LR1cHPC9T/nJAonsH53xwEyxJ5IdTr+gAA69A1B5kQoPhcnQUUHy4OElU
	 Qhx7i5aeSQEpXoCg3bpjwCvejHMtkhyAan88R+lrEoXtSQRH6kGUs+uTMjRxENGCpN
	 /bfBt6ZlFkHP7MlGzoKW0TCFql2A3sQp1Fj0eeOtkMMmGBF62xQXVGSrDfxxBZjoB7
	 dOxlwyQ05hkYuWgUtK5YPET0ucN7ew9XRh1SMMLXQSkbrSVxKRc2tn7V3urdg4/Z35
	 M/a6+IJy/M5xw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8A548083A;
	Mon, 12 Jan 2026 08:19:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E5DB12E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3585D84435
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:19:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2e7Y47Si-rqn for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:19:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3428A807C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3428A807C1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3428A807C1
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:19:44 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DF36BA4C40D8
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:44 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuW-000000003M6-1Bca
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:03:01 +0100
Message-ID: <20260112080419.2516889-26-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205144;
 bh=YjY5OVlJbDDybcAdADTTfJMkcqxvPWOHcXYrFla755o=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=KrHtPb0gfarg6J8ICpbKjT0B2vg9EHe8XfSn5O3YKolw9DbRDq/MpcPJfjJ3P2kct
 cj23Hrbm+TdsZkzzPs+yua+820sYZ6hR33KYZ+cPB6/mjDN3VDfewBmCv1RTHKFbAA
 y8CrNWuh/bAJb144HI+HcAXUIObTSEdOxbXkOSPMGeYeiyt8gJxd0D3Q+HadEFpijY
 JwNM3zde8PaA7B7/DUf3wkuWUOnKPLHUWbxPDaUZXxhOllRUROQ//OTVkWw9E6nNxB
 YaQ8p7xzxW3xJwl8xKRgWQdTY1NKicUny2szeIZbpH7425slU78SLj3gBgyc+LJsQa
 N2PSgO/X3pfZg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=KrHtPb0g
Subject: [Buildroot] [PATCH 026/104] package/x11r7/xapp_showfont: bump
 version to 1.0.7
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

https://lists.x.org/archives/xorg-announce/2025-May/003602.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_showfont/xapp_showfont.hash | 6 +++---
 package/x11r7/xapp_showfont/xapp_showfont.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_showfont/xapp_showfont.hash b/package/x11r7/xapp_showfont/xapp_showfont.hash
index 7bec4e8728..9b6e0b4276 100644
--- a/package/x11r7/xapp_showfont/xapp_showfont.hash
+++ b/package/x11r7/xapp_showfont/xapp_showfont.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-August/003207.html
-sha256  2b9b9f06e65e095ed76ce560b701b9fc47fa63310ee706b54c8787af061d0e56  showfont-1.0.6.tar.xz
-sha512  21a318519492f4ba46a8bcb3590097fc5f96fe01fdb557257ae56bae813671952a2aad6c0df8cd69659e06708571c398e6d97969224cf692e22c8a35c8e6c363  showfont-1.0.6.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-May/003602.html
+sha256  8f725d641c12ef07746d16c892240823eccd045444a1ea182eddf229cc178fe7  showfont-1.0.7.tar.xz
+sha512  6c27b280976d22f35071136e139a654c7be41f5cca3b450a3aa36f8a026b151e700d4e386b0fde8deccef50f8d43338f5d105977a7d11861fccab6c05e480d70  showfont-1.0.7.tar.xz
 # Locally computed
 sha256  c32217021e0507207e2ee6da3fcee3d9e32816003a7153b3357c08cdc97934a8  COPYING
diff --git a/package/x11r7/xapp_showfont/xapp_showfont.mk b/package/x11r7/xapp_showfont/xapp_showfont.mk
index a805f35231..9240345310 100644
--- a/package/x11r7/xapp_showfont/xapp_showfont.mk
+++ b/package/x11r7/xapp_showfont/xapp_showfont.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_SHOWFONT_VERSION = 1.0.6
+XAPP_SHOWFONT_VERSION = 1.0.7
 XAPP_SHOWFONT_SOURCE = showfont-$(XAPP_SHOWFONT_VERSION).tar.xz
 XAPP_SHOWFONT_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_SHOWFONT_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
