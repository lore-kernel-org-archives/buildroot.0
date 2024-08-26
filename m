Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E25C5321E
	for <buildroot@archiver.kernel.org>; Mon, 26 Aug 2024 04:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A058D80EC4;
	Mon, 26 Aug 2024 04:20:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j316H1P1tyNL; Mon, 26 Aug 2024 04:20:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91F6180EC8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91F6180EC8;
	Mon, 26 Aug 2024 04:20:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E39431BF2C0
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 04:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D160340289
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 04:20:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MOegOYl1Jguf for <buildroot@lists.busybox.net>;
 Mon, 26 Aug 2024 04:20:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0315440284
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0315440284
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0315440284
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 04:20:37 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id B29123536440; Mon, 26 Aug 2024 06:20:33 +0200 (CEST)
Date: Mon, 26 Aug 2024 06:20:33 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZswCkVaE2/Bw7RC+@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1724646033; bh=ZWTpjUrS0DPdaCKUN3eHqQDBpb3QxKkjbEhNBxMa//I=;
 h=Date:From:To:Subject:From;
 b=j0tMG3xULwn4ZM4cmJLUeRgV7nareKNrSX3Zxc6PP5verm0stTWvNs+FpoNvB5/cY
 kcX2bsYbwf3WA1cwT/5ukA5Dp2gUqsOISIcFadDLXYKKX425swJipFC2NAs7W1JV/V
 HwSthTTEgQHrSAyx1xhw0yo/9RSn0sOrtDVdKwrM4IpRLwnFQoaC1YC24W+cDbZ+nh
 sO51lEeU29fDh8bJdI9ERzAKDHpDxSVPEzxRdCXl+chXU+Lg5ujuhaKJbFTCaabbtA
 s8Kq0zRRcejCPACDsHM1L80iZYuCMrh7zEyUUn0jSMjQGvku7nkMNAI+jOFWk1633t
 ri8Vo72qTV2gg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=j0tMG3xU
Subject: [Buildroot] [PATCH] package/xserver_xorg-server: security update to
 21.1.13
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

See here for the security page of Xorg:
https://www.x.org/wiki/Development/Security/

Several CVE's were fixed in this release.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.hash | 6 +++---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index be636936e2..3520de242f 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2024-January/003442.html
-sha256  1aa0ee1adad0b2db7f291f3823a4ab240c7f4aea710e89f5ef4aa232b6833403  xorg-server-21.1.11.tar.gz
-sha512  e41bf71955691e66084a67fc20643632087f0326d5eddc31e6edd118d05005b8ab536738c181f4c352f331ec8fc8f23ae1b45f237592fa5d7eddbffe43638b08  xorg-server-21.1.11.tar.gz
+# From https://lists.x.org/archives/xorg-announce/2024-April/003504.html
+sha256  2864b6a5359ab41c5a6132c69b5d0c9af6eb85ad26d433edb012c914029de752  xorg-server-21.1.13.tar.gz
+sha512  9bf5617d577dd3526a9578daedc1f2e3527da6913841f8fc78a2bda311ebf1560e84e31942cb8133a2a2ac99487c13b9153db6fb2d00859fc24d053f6b91fe34  xorg-server-21.1.13.tar.gz
 # Locally calculated
 sha256  4cc0447a22635c7b2f1a93fec4aa94f1970fadeb72a063de006b51cf4963a06f  COPYING
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 1d0807ffec..05ba938c30 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XSERVER_XORG_SERVER_VERSION = 21.1.11
+XSERVER_XORG_SERVER_VERSION = 21.1.13
 XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.gz
 XSERVER_XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XSERVER_XORG_SERVER_LICENSE = MIT
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
