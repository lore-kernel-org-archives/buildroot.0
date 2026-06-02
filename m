Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39559CD6E57
	for <buildroot@archiver.kernel.org>; Tue,  2 Jun 2026 19:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45FA582229;
	Tue,  2 Jun 2026 19:44:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fijd0u8uwpY6; Tue,  2 Jun 2026 19:44:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA402821E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780429494;
	bh=U7Mr2vzGkcEwK2e2qwv3CbgVlL7J7o2SW0ngBtBunFw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WyFMp8SpY/gYTgc9DzA5ebqHbHkc0QKwtRX+hm7c4EQoAM56spUKb1h3752DS2f2n
	 vPdJhYMvsaui2ouComdgJm2p6c+dg/gdjUm16J4Y6mU1XrGy6D9hucp1KG4Y8ndiXN
	 FNZQNEiXr4fG5qMnmL9LFuOfRbTrT1drxfhsWOS7lMAmbJyxuKo7qYUJhkYkhvduK7
	 1Mklx7ecVP3YaypxmwjqqgnEVNT70KQKM5Mjlpo+P1CivWEwR6gDaKfNAH5zDDHf3D
	 DuQeaDEoc8aPD6QfFMvfKT37tUkWRtWGr9xmuFzOuqTd+57E/iXw6ZzvOmm3ps+e3h
	 pJNKPm2bWpqUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA402821E1;
	Tue,  2 Jun 2026 19:44:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E3F7D3
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 19:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B3BE41E4A
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 19:44:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eimpBHYKA_mw for <buildroot@buildroot.org>;
 Tue,  2 Jun 2026 19:44:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E2DFD41E47
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2DFD41E47
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E2DFD41E47
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 19:44:50 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a08ef.dip0.t-ipconnect.de [91.58.8.239])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C87F0A4C3852
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 21:44:47 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35892)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wUV2c-000000005Gs-4BQz
 for buildroot@buildroot.org; Tue, 02 Jun 2026 19:44:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  2 Jun 2026 21:44:47 +0200
Message-ID: <20260602194447.794218-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780429487;
 bh=IvU5vrmEgVMGcjzxNYrU+z2i1Am4xwiAcWqRChHz7uU=;
 h=From:To:Subject:Date:From;
 b=VAHwuJVA+KtFS1iA2wCSTkGjtb6iM+04vgMl7lN0iOfEzkNkTcC/9RzH4KPDrB8Bk
 AhazeyROnCVUmPUobO7WKWhrCkyDfS/+0ZzODtcHkv/Ku6aQ7OC9YiAqJ5z597eUFa
 DM2fWTRMmL+pSPSUohUg5WipC3qn+5ayQE0NCPqT40p07KROAOKwkR9GLydtuGQ51R
 ftRlB7kBXDJA/025FG+QQuHXV5qHN10Hx8DK6uJKuMxlHeDg+1tJbxWtZFDuYN2sc8
 53MtzuCk8n/SsLDdyfFcMz/7ny+Wcra+0x18QGdGrFwgdjXrICiCJfXx0ntg2hSXMw
 vpIBm4Xj2oyog==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=VAHwuJVA
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-server: security
 bump version to 21.1.23
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

https://lists.x.org/archives/xorg-announce/2026-June/003703.html
https://lists.x.org/archives/xorg-announce/2026-June/003702.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/d677191379c7a4bbd40d79be4f5565511550bf62

 package/x11r7/xserver_xorg-server/xserver_xorg-server.hash | 6 +++---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index b7adf1559d..5f10908c8a 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2026-April/003678.html
-sha256  1a242c8917c49ba29ccc1f6021613d8a2b9805dd0d271a66ae9d09f4b0bb06b3  xorg-server-21.1.22.tar.xz
-sha512  6cb37ff971e10eb4a7dfcb3e8071afd769c7632d50e4ad8bc948b810dc4847e152b8a05ec135f55e0695b35908abd07e7728ef85dd3135456fd532e919f440f4  xorg-server-21.1.22.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2026-June/003703.html
+sha256  e39832e5617dadaf072fdf9f0e19e5d2e1c2a13607ac280bac1aba9f8fe14634  xorg-server-21.1.23.tar.xz
+sha512  7eae854af1b5db1f5d1e59cb9d26b86d98fa176d4f80f70935c707f17982d0446a0a8ad8d29c922edbd208435f995b027604fbb72e62a7bf3ba79f2f570aa0bb  xorg-server-21.1.23.tar.xz
 # Locally calculated
 sha256  c9f90a6669109aad6c9a7c3b46cc2c574221a73b792afa419336816b49da5c11  COPYING
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index d1e7267c27..cecbb821ae 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XSERVER_XORG_SERVER_VERSION = 21.1.22
+XSERVER_XORG_SERVER_VERSION = 21.1.23
 XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.xz
 XSERVER_XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XSERVER_XORG_SERVER_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
