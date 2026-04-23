Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F177FAD41B
	for <buildroot@archiver.kernel.org>; Thu, 23 Apr 2026 06:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32D6B40CD8;
	Thu, 23 Apr 2026 06:14:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ewp100RThriH; Thu, 23 Apr 2026 06:14:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AE6740CDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776924875;
	bh=DWP0ua0nCRYv26TvLQHk/saxrqXqUJ1SVzVrNQGhm4Q=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Vmqs64dZC7tpJFcNP6ZNscHs2zPbPJi8ha05FHKQoGIXeab93gvXAWFp2V+wCFfv5
	 wpsUxCKXdMdkeGL7SSYCjLIHDt+IDO4ucupI9Zguptl4M8SJIsq+R3EOj2YRx3YmhR
	 74M1tm0NiEUGqECnHVgHax/neh1qbAjyiqfeWTDXvO0hXZuWH/sNjqsLmj+ey99+Gm
	 2L56Hg6Bn4xNluiz5/Kebx7xyfsfxmYcyLSL5b3kajkSrqEorN9WhdM3no7sAK4rxf
	 ho9gx8PDjHMZgPjWbUSCceL6UM3/k2mE1+/x3VBQ5fxdvajbW1RekjHgMfEsdeaEa4
	 oKZsrXIuT5iKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AE6740CDB;
	Thu, 23 Apr 2026 06:14:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E693231
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 06:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 502FF81DF2
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 06:14:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HAdhSLxSFPHA for <buildroot@buildroot.org>;
 Thu, 23 Apr 2026 06:14:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4759981DF3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4759981DF3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4759981DF3
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 06:14:32 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0177.dip0.t-ipconnect.de [91.58.1.119])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5F5E0A4C0601
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 08:14:24 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51052)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wFnKS-000000004Fa-0Kqd
 for buildroot@buildroot.org; Thu, 23 Apr 2026 06:14:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 23 Apr 2026 08:14:24 +0200
Message-ID: <20260423061424.47374-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776924864;
 bh=12I98ouF/EN1JVySUYD9LjOi+NwTbrzhks264Kot3+c=;
 h=From:To:Subject:Date:From;
 b=IFg6BOuInZLA2V10KBqFyI5Pz2R0qR9FsyWJmNd9bP9yE2N5JKfihN6A/6wIKpMUS
 YCn+Qh0La9U/Y1gUrAM8DM+vNCm/NC4mzORtADItSVjbrkDwqPLVPjTZVPbhiUqAUW
 xh9FlwckCGVuz+7otaI1wAlKa+l0UNTAxfXnn2F5en3vcZEuVsJhKzpGWdoh+VBaRB
 3Jj7SQETw/Cr2elmc67Xb3gMqsWcfxg6XKRJwwU9c7k9GynltyHTP628T+LHwIC9yI
 u3ZH+H7Nwqb9sFg8WBDU7aAvZJyuMItoGJXpa+4jv4+8LPnbmp38jXORtH+GmH68Q9
 DWHMuujWbQzdg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=IFg6BOuI
Subject: [Buildroot] [PATCH 1/1] package/openvpn: security bump version to
 2.7.2
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

https://github.com/OpenVPN/openvpn/blob/v2.7.2/Changes.rst

Fixes CVE-2026-40215 & CVE-2026-35058.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index d01cb73c98..edfd25bfc9 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256  9858477ec2894a8a672974d8650dcb1af2eeffb468981a2b619f0fa387081167  openvpn-2.7.1.tar.gz
+sha256  9c3e150a595fc9a375221f2fa9f10524a9c064536cf81c96e3ba66c735b86f26  openvpn-2.7.2.tar.gz
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 3bc42f2db1..01e19b2627 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.7.1
+OPENVPN_VERSION = 2.7.2
 OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf libcap-ng
 OPENVPN_LICENSE = GPL-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
