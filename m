Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E97CD5BD1
	for <buildroot@archiver.kernel.org>; Tue,  2 Jun 2026 17:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58A7C8233A;
	Tue,  2 Jun 2026 17:38:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gPgoNMAnPAqH; Tue,  2 Jun 2026 17:38:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 110D082329
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780421892;
	bh=oaN/+a0CnDhgNAmsdJEeO+CW2PaGMXR/UeXBlybRAmk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=V5yw/IMZmWyBWNWKoXrs+R7Dpzx01+eW2D8h9KrGqmzeD+i5fzAuIvj8qcOXgfzhG
	 HyAdlcSQdZrJ0fFZKLh8THGJ/WuUdMlj0jGldd8CXkk6usuDtwmPE2/WhMUGZAVJjY
	 DDoAZmDQvrrM7o/ZZxO8VQLU0ZYZCqM9WkYLChieetQi5TyZ0lOa3ckUmzQqrKLqH+
	 0kJWRhMxEP9ZGXYh2D7OMRHcW4bnWkU++xI2Bx/hRKPm91h1fdudRPHFNnSvUHQ02g
	 HtsNS/+SzsVdH1P5m6zJvu5i8KpQZWPNIzoU7VrmVgljvENJGbrYwZhwxDx6V6B1Vc
	 BvLa+tG9KghFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 110D082329;
	Tue,  2 Jun 2026 17:38:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 017B8D3
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 17:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E794040FC5
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 17:38:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GQ-KIi4G6L2j for <buildroot@buildroot.org>;
 Tue,  2 Jun 2026 17:38:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3FCAB40CEA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FCAB40CEA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3FCAB40CEA
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 17:38:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a08ef.dip0.t-ipconnect.de [91.58.8.239])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4A3DBA4C3A9E;
 Tue,  2 Jun 2026 19:38:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53566)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wUT40-000000008Qy-1Sr6;
 Tue, 02 Jun 2026 17:38:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
Date: Tue,  2 Jun 2026 19:38:04 +0200
Message-ID: <20260602173804.1630604-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780421885;
 bh=P/Gley5NrE3JFeuOYI0b2pz9LhlLo+pkcNWN/dngQuI=;
 h=From:To:Cc:Subject:Date:From;
 b=EL2YGdB8nWrUfJbXNdq4ObZpd+Lnli1ItYDGICu8cmnwc9kHJV87ydh/W4oCldwgS
 vV7UUPgvAbH+VPCGv5cLfAoC4REuoO9JnA0t9BcWu1eyiDd85RujFS72cX/HUqwOga
 ksiIsZwoU/GKRHFWNpZJG1zORrrTdTsaEP+cMgWmmNTyOYKFFvzaW8Hizqav9dzaqf
 jeANXhHkY5BnpNao9aQLaDJgp/oZDG8hf2pO/p02+jJm/SfG6JQOOv8IGFvTdLkfuy
 2toKkh6szmn2L16Jq4mvoYwD8BXMrnMIHghmX1D0Hef6OZQwUHEnKaYg7VPa6D6Axu
 2PI4IRUtygX3A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=EL2YGdB8
Subject: [Buildroot] [PATCH/next 1/1] package/stress-ng: bump version to
 0.21.02
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

https://github.com/ColinIanKing/stress-ng/releases/tag/V0.21.02
https://github.com/ColinIanKing/stress-ng/releases/tag/V0.21.01

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/c9ec2628a3f50729832e1bd2c68dc8e3fcbe6eb8

 package/stress-ng/stress-ng.hash | 2 +-
 package/stress-ng/stress-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/stress-ng/stress-ng.hash b/package/stress-ng/stress-ng.hash
index 81123b3587..706fed135a 100644
--- a/package/stress-ng/stress-ng.hash
+++ b/package/stress-ng/stress-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1339cbc6ccbff7e2ee2177bf0fd67e7b94e8ff7b07fe89bcfaec0280d800cf34  stress-ng-0.21.00.tar.gz
+sha256  71502d31f77987c3bda6931d47b44d7b03d8ac689e8154bbda676cf9d42e2b4e  stress-ng-0.21.02.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/stress-ng/stress-ng.mk b/package/stress-ng/stress-ng.mk
index 4181c5ed1a..59cd249291 100644
--- a/package/stress-ng/stress-ng.mk
+++ b/package/stress-ng/stress-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRESS_NG_VERSION = 0.21.00
+STRESS_NG_VERSION = 0.21.02
 STRESS_NG_SITE = $(call github,ColinIanKing,stress-ng,V$(STRESS_NG_VERSION))
 STRESS_NG_LICENSE = GPL-2.0+
 STRESS_NG_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
