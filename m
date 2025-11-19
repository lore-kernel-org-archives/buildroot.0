Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA9DFCF58E5
	for <buildroot@archiver.kernel.org>; Wed, 19 Nov 2025 20:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8215584011;
	Wed, 19 Nov 2025 20:20:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ku-X4cKiR471; Wed, 19 Nov 2025 20:20:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAA5B8401E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAA5B8401E;
	Wed, 19 Nov 2025 20:20:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 41AF12A9
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 20:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3350160B0B
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 20:20:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k6Fqr1df9GrA for <buildroot@buildroot.org>;
 Wed, 19 Nov 2025 20:20:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2E665607E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E665607E9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2E665607E9
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 20:20:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b06c.dip0.t-ipconnect.de [84.161.176.108])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 34945A4C72B4
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 21:20:17 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58478)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vLof2-000000005IF-3hGl
 for buildroot@buildroot.org; Wed, 19 Nov 2025 20:20:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 19 Nov 2025 21:20:16 +0100
Message-ID: <20251119202016.563421-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763583617;
 bh=RuuRadNjtHZwseUkXGy8C7IBW6sgplIflUnVbUssxgo=;
 h=From:To:Subject:Date:From;
 b=1NNJH5VVZI5HR0n6DDTHyG4uU60Q51APJTBIu4jtQg2QtQrq7QbtjBuRaWcshrxBN
 wQMCsGP9o2AbxslcC7cVCdUzNmhPEA0lyoBJ6Xq8rf2HCAPCzK7YrYZ3aUYkVMJV4d
 +7yWY1My7Ss5f3xPPA7KcUmP0Dl0naC3n5zWh0ZJfCJDtzvnXb2TCrDXBM/1dik0T2
 CZfG5v7xsBEGBjnA4E/TJ843mulFU1/Y1+zPI5VaHHLH/WA3u/q1wKqhZncvlY8Wtn
 zzjgh+VqyXANAVBM3KGfUIiEZW0hFYgCcQLKpxpRsqh3dOakliCwHv79nWS+srnBCy
 AuJn+gF6LABAA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=1NNJH5VV
Subject: [Buildroot] [PATCH 1/1] package/openvpn: security bump version to
 2.6.16
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

Fixes CVE-2025-13086.

Release notes:
https://sourceforge.net/p/openvpn/mailman/message/59261309/

Changelog:
https://github.com/OpenVPN/openvpn/blob/release/2.6/ChangeLog
https://github.com/OpenVPN/openvpn/blob/release/2.6/Changes.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index 353e8a8051..0123babe4b 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256  e35513ee15995e3c71adfd8891b9f33522896c70b3baa2ed9a23c7a42c4d7bde  openvpn-2.6.15.tar.gz
+sha256  05cb5fdf1ea33fcba719580b31a97feaa019c4a3050563e88bc3b34675e6fed4  openvpn-2.6.16.tar.gz
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 26558c3d16..0175c51d63 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.6.15
+OPENVPN_VERSION = 2.6.16
 OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf libcap-ng
 OPENVPN_LICENSE = GPL-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
