Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 297F01093177
	for <buildroot@archiver.kernel.org>; Fri, 20 Mar 2026 06:53:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB83C41CE7;
	Fri, 20 Mar 2026 06:53:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GxvxP8eC8TsX; Fri, 20 Mar 2026 06:53:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F399F41CF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773989620;
	bh=iDETKkgc2whXTA/Twe2gnEYuteKZz8Ml1ArqFXQQYac=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fyB2Q4ocanoESsdxzDs1ll89FShwc+bigfKwdizTJxp7QskxsSRBKOZJv5F6wE8sM
	 vzaTYYEdGMrriVBDSoAvBFxktYY3WlHSNFuiV2LnRRQRy5aTi1cCmcUsGmHCg0TcOY
	 tU2Bp9QPQGN2gOoYXOl6DM1kHkvdu+uYMzxRO4PZxUEqXIht3bvmdYgQT3Xna9nt6n
	 YowUITf8ja2Ze+5Uicb2EogtCptjmawm/2KOo5MQv+GOhTSb00prCKxJU8f+mmbDMt
	 m9VYHfvIpydclYVhE+wSK3I2hMlGuBN4slxHh3Kjfaxnjgj/Y7k9g07ldqedsiAozf
	 6EOnE9maAw0wQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F399F41CF5;
	Fri, 20 Mar 2026 06:53:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A7B025C
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 06:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C0FB61ABC
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 06:53:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I9pcAB-dnEVw for <buildroot@buildroot.org>;
 Fri, 20 Mar 2026 06:53:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5A58A61ABB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A58A61ABB
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5A58A61ABB
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 06:53:36 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -982868499; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 20 Mar 2026 06:53:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1w3Tjf-0000000A1w0-21jA;
 Fri, 20 Mar 2026 07:53:31 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 20 Mar 2026 07:53:29 +0100
Message-ID: <20260320065330.2390703-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=A+FGtOppxM5d99aOy/XgSmBign4SIFOtsfO5ycVCCtlbxrc7qeZ5oNmRhaMBERxY9EGygqs3xVYwuuaXlacisr3ekHcQMA0nI9NW1OjuFDfxx2Jbvlg5YA2NDgs9TjgafdOW12jsQJEimVhQUglfHNDXa0tO/EeWZamYLOt8Hf4ORvzHnEp0Kjw3IgE9E0ZoJld3cGz23JUiBzLY0De9aFEwLJHfM/TLRwUlMNKJ/42vQVAJ9DVgb6k0eO59YdHnOdHu95RU+VYW1JEd4X6QyY+rroMPlwZGFd7143iRmUW3F2J4fxorkTHWAKCl7XPHjL3ZEihoX/rFjCuLywYuxw==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=41L20UVpPqiHw8xBvsaHNDY8B1dXELrVoMbfQ88EpsU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=A+FGtOpp
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/wireguard-tools: bump version to
 1.0.20260223
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

For details, see the announcement:
https://lists.zx2c4.com/pipermail/wireguard/2026-February/009514.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireguard-tools/wireguard-tools.hash | 4 ++--
 package/wireguard-tools/wireguard-tools.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireguard-tools/wireguard-tools.hash b/package/wireguard-tools/wireguard-tools.hash
index d959d964d4..52e50fb752 100644
--- a/package/wireguard-tools/wireguard-tools.hash
+++ b/package/wireguard-tools/wireguard-tools.hash
@@ -1,4 +1,4 @@
-# https://lists.zx2c4.com/pipermail/wireguard/2025-May/008789.html
-sha256  b6f2628b85b1b23cc06517ec9c74f82d52c4cdbd020f3dd2f00c972a1782950e  wireguard-tools-1.0.20250521.tar.xz
+# https://lists.zx2c4.com/pipermail/wireguard/2026-February/009514.html
+sha256  af459827b80bfd31b83b08077f4b5843acb7d18ad9a33a2ef532d3090f291fbf  wireguard-tools-1.0.20260223.tar.xz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard-tools/wireguard-tools.mk b/package/wireguard-tools/wireguard-tools.mk
index 958d7a3ef0..444581b397 100644
--- a/package/wireguard-tools/wireguard-tools.mk
+++ b/package/wireguard-tools/wireguard-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREGUARD_TOOLS_VERSION = 1.0.20250521
+WIREGUARD_TOOLS_VERSION = 1.0.20260223
 WIREGUARD_TOOLS_SITE = https://git.zx2c4.com/wireguard-tools/snapshot
 WIREGUARD_TOOLS_SOURCE = wireguard-tools-$(WIREGUARD_TOOLS_VERSION).tar.xz
 WIREGUARD_TOOLS_LICENSE = GPL-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
