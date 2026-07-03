Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8357C43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 19:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B282607EE;
	Fri,  3 Jul 2026 19:50:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bqlz7kjzPLoG; Fri,  3 Jul 2026 19:50:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EEB260757
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783108206;
	bh=1Y44FbWH7Xz+LFPmdUCtNMAv0NR4ac+cvnB5v7lUM2s=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UlhzuvZwm6U+sTJAzfLcNIms2pzqbKfyhPMbKMTLE1Oy5RVW1e8gyFn8w8w5jgKZJ
	 o3p+cwW2Kl601tkOw8OL4RIzicjFTM0igA5g+l4KApLO4aq9/VXuUCVkri7CIFFkyE
	 G2kQUl5t2PefT6oiNUup0E54peJpcTk++hJyBt4dWN2SRL7ajnbhMdP2B9eJg185D4
	 iGwy98ng+bYn02ed4wkeVvmaWV+WGL6xamslnoM20v+WgTFkzdENZCpyl3MMeJwpxX
	 7b7ghGdTMCj520CwG/Nr/y7zboFL+yhsN1AjIp6qoZvN2tFLFDAT9KhMRZXv3JdLYk
	 0Bzs64lkKqThA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EEB260757;
	Fri,  3 Jul 2026 19:50:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F34F14F
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 19:50:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 35913400E4
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 19:50:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TblGf9MBanAv for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 19:50:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 181CB40086
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 181CB40086
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 181CB40086
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 19:50:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0df2.dip0.t-ipconnect.de [91.58.13.242])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1FD83A4C0A0E
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 21:50:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58620)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wfjtg-0000000017w-3Jlb
 for buildroot@buildroot.org; Fri, 03 Jul 2026 19:50:00 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  3 Jul 2026 21:50:00 +0200
Message-ID: <20260703195000.3703134-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783108201;
 bh=ha2quK4iIXEBHLLZ0a5VvMpqcewzWC4wJ1E7hmLmScE=;
 h=From:To:Subject:Date:From;
 b=o4pSuaND25dzPPYsH8Z3nEZIw+YU68wdbBWCyhXRQW+he1mAr9axYzPGSw4kNYz/1
 fuvQxZnAgrsodlJmSROr5wwll2h8mZ9Rai/1UulcWpw9fEo5sUhHmaMklHk0i8LdOd
 zd2cT1IUh73Sr1xI0OyFUiUNu4o633WnB5c/ydDpADX4TY4n0Hp8jZU/HDFjCvwtae
 Z5mBK9VccFAgVlnDerkCJ3VP0rIwaHzC6ByPF08onvUjssW4a9KkLLSMCUflW+9dM+
 k4ZdBIPm9V20ABc9ENfthJldJPOHE3BRl7+DrSolPwygTCsjHM6awVeOozypa1OGM8
 OfesBGohVGk7Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=o4pSuaND
Subject: [Buildroot] [PATCH 1/1] package/openvpn: security bump version to
 2.7.5
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

https://github.com/OpenVPN/openvpn/blob/v2.7.5/Changes.rst

Fixes CVE-2026-11771, CVE-2026-12932, CVE-2026-12996, CVE-2026-13117,
CVE-2026-13122, CVE-2026-13379 & CVE-2026-13698.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/03d2baa5c943ea74a3fb5ec4220efa52b52084bb

 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index 438212a4bb..651f430534 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256  18db05f3d5eee3663db1914590044e5f96ff5cd47b6e7846c6a350806c23dbce  openvpn-2.7.4.tar.gz
+sha256  c6864b3c7d4e059c7d6ce22d1b5fa646c8b379a06af872eeb9792b6083a44ac4  openvpn-2.7.5.tar.gz
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 68f0d30e4c..d5fd308e63 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.7.4
+OPENVPN_VERSION = 2.7.5
 OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf libcap-ng
 OPENVPN_LICENSE = GPL-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
