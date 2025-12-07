Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A4ED2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 18:57:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B7C1814BD;
	Sun,  7 Dec 2025 18:57:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uXi6BY16d6Sy; Sun,  7 Dec 2025 18:57:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EC6D814C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765133820;
	bh=eM5iFqB2ltefQn6SDvaww1PWuqtcfjhoyJWeMCwTMaM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aKvyOHxQXlybmKib2U9w/SSAsefNZtoucn+/Tn85P+dyDQk4iWRcscYUiSQ/aRKKq
	 6+VqeByKQEBk4/GBko1PvxcvgjdInVsmI87kwgq5dBXShG3t/mNwbZVpLuzgaBg0yG
	 ELdHTSbdr/fI7RXyUaWmYyfPBCCQbmWY+SB3R5rogpKW+opwgtV7OVyV08Dl9gNV8b
	 vucMaAECSfSLoywz6pSOZgzHe19jHtl25SwI/EvJS+tbsgYXGVkpmx6O0s5x6qkLD/
	 B2v5c0gs6fq/a30NvM//+J64hwIfR+skZKbCT/PuONPEbHaBzVx+sfN10fRjDfGpNE
	 oQBfvRH9+EE3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EC6D814C1;
	Sun,  7 Dec 2025 18:57:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 61D82E7
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 18:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40A17406BA
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 18:56:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O0GxaP2wiLy9 for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 18:56:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5287F40345
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5287F40345
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5287F40345
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 18:56:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 74FAAA4C07A5
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 19:56:55 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57648)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSJwE-000000006g9-3Htr
 for buildroot@buildroot.org; Sun, 07 Dec 2025 18:56:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Dec 2025 19:56:55 +0100
Message-ID: <20251207185655.351235-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765133815;
 bh=p94ZpckdL68kPaIXm6YyswxN2mxsvezbDza6XjfjwBA=;
 h=From:To:Subject:Date:From;
 b=FgKRzyYW8ViNZDIDpOQiOAJL3dB8X8ys1TPhV7VruSldRQtMUYJFekV67lssnHJPD
 WsPJHKWfRlLkZHNpO4kasq0QMMf0JlQYG/BeWn7dnjmXI7m3CWHpf37/7PKJoZ49HW
 T0KJJVXKxsc+nDXzQoakMBqLvyLoR2aRRD8NORrmS3t4NeNwupFf4nkhrKKyvIzT29
 IFswthsC8Q12WRZAqOi+oyrVpB/G/hGIiHZvPo7+EmaONsMG1+jVKcvIso9Mtz0rHc
 2/LFg2FabsS5JZYOSA9worVN3FNVdGwoHqrij98/Qt9VrW2Vf0MPTXYbF4eo3Onk0v
 y6ioTu56pzd8Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=FgKRzyYW
Subject: [Buildroot] [PATCH/next 1/1] package/openvpn: bump version to 2.6.17
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

Release notes:
https://sourceforge.net/p/openvpn/mailman/message/59266231/

CVE-2025-13751 which is fixed by this bump does only affect Windows.

Changelog:
https://github.com/OpenVPN/openvpn/blob/release/2.6/ChangeLog
https://github.com/OpenVPN/openvpn/blob/release/2.6/Changes.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index 0123babe4b..1fad2163c8 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256  05cb5fdf1ea33fcba719580b31a97feaa019c4a3050563e88bc3b34675e6fed4  openvpn-2.6.16.tar.gz
+sha256  4cc8e63f710d3001493b13d8a32cf22a214d5e4f71dd37d93831e2fd3208b370  openvpn-2.6.17.tar.gz
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 0175c51d63..9740374bee 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.6.16
+OPENVPN_VERSION = 2.6.17
 OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf libcap-ng
 OPENVPN_LICENSE = GPL-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
