Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED88E94602
	for <buildroot@archiver.kernel.org>; Mon,  9 Feb 2026 20:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BADDF60E68;
	Mon,  9 Feb 2026 20:31:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CLgB-TY2XRk7; Mon,  9 Feb 2026 20:31:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA0A760E45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770669114;
	bh=epD4XvTLRirdlDmUmW83C2qGh6PSFajYpRVJNYiD+JA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fhDsQICszsMaqmksAYkC3YYaDMMuTW+Qmfd/IN4cRaFgr4n3nyi6kI02AWs6/3mYf
	 VpnNiErmw1la3Y/lc0Hnd4RTpe2f9GwO60uJe4BmEcbCJi0Zajk12w8BgYkF8wIgc1
	 vQoAqOJIgi1AjBOXychrGrIPDHTJohQnIT0iA/DavUBjwV1ndRjeEUbTlX8lhsL/Jz
	 7bE3+hBYfRE1VPpPNspBTARG0lnoBvgqQINrIi4q8j1kcao50tYOpvgZPszM/WLlpe
	 N3+Vu5+pEg0KpwaaS5stdSHaGVsnfBpscItyydfxpGdn6m6W9iK/+P0vh3Q/o6ruw4
	 8V66/gViHb9Yw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA0A760E45;
	Mon,  9 Feb 2026 20:31:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CF14AF2
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 20:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B95F7400CE
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 20:31:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VEEuQVFvLQVF for <buildroot@buildroot.org>;
 Mon,  9 Feb 2026 20:31:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4B993400BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B993400BD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4B993400BD
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 20:31:51 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b67.dip0.t-ipconnect.de [91.58.11.103])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6DD5EA4C09DB
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 21:31:48 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46248)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vpXv9-0000000021p-1Uct
 for buildroot@buildroot.org; Mon, 09 Feb 2026 20:31:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  9 Feb 2026 21:31:47 +0100
Message-ID: <20260209203147.3837192-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1770669108;
 bh=LT4N7oshI/Iqai3HjnkhgaLJ8iFpmW1hXVQZZcl2V6c=;
 h=From:To:Subject:Date:From;
 b=kola7Bz8/N4srjI6d2r4KNft/xXg0kpM1HzJ/04hNpCwzODBWXt4jGtYobRPFBWdh
 JWhX0OwCrHNaC338ij0cc4LmhEtskgIv7qviu8pF/JsXKr4SU1JDlfhJBjzFxVzBhT
 Yh3on2q3eUukNrHwNVajqlRCyx1nryKzdVmL6/eJTukSK9KiwG5wroE/nksSxDypn2
 l4GmN2apojsw2bcR+kLL+gOowhttn9caR12D0WKpnOMFovuKl4URBecGa+ZPcm1lfi
 X0/ssfy9S7LVO0M5IJXqCIy/179khZmViSe2uJjRu+l4QzGKQC+tuldA1ty3Al1y8G
 /yGWkjYhu9RiA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=kola7Bz8
Subject: [Buildroot] [PATCH 1/1] package/openvpn: bump version to 2.6.19
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

https://github.com/OpenVPN/openvpn/releases/tag/v2.6.18
https://github.com/OpenVPN/openvpn/releases/tag/v2.6.19

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index 1fad2163c8..d172689685 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256  4cc8e63f710d3001493b13d8a32cf22a214d5e4f71dd37d93831e2fd3208b370  openvpn-2.6.17.tar.gz
+sha256  13702526f687c18b2540c1a3f2e189187baaa65211edcf7ff6772fa69f0536cf  openvpn-2.6.19.tar.gz
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 9740374bee..9dc4ef4714 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.6.17
+OPENVPN_VERSION = 2.6.19
 OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf libcap-ng
 OPENVPN_LICENSE = GPL-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
