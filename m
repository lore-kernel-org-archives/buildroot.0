Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B73FFF885D
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 19:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6E8584CA5;
	Sun, 26 Apr 2026 19:26:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LcToPv97clDk; Sun, 26 Apr 2026 19:26:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D167684CAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777231602;
	bh=D8EJIkTXh24miKsTlDSb1whLUKodKYzel+G7y6cvVpQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=o7pBrAEluq0vgXBvk0I3lIw9u8gVwWm/ds2+OUwTlNvvBiPEE7LUu2Kzuj+F4Osts
	 iFDwFpv4j5wlNw/wqOVO/ZsH/WBbQOWsFpH4u7dEh1zvYbkTGBLx/jXu1pvuXqVEI6
	 45sAVM8b+UJws+PpP/4bw0sM5wxjTG6GAIDfpnQdwj2AoRIdwjbE5sL+Sd4V81HNa8
	 eT9X7N2Dv9Y2EAtTCupPbi6gggrk2SzO6LD04+GFKakRCQBpNonahKMYgO6kvuehLB
	 7iYBnZdHQk1t42ewyy0/CEikJLhRBhM4aOzZpuH5okMyGm91ld4xHXfp2T+fM+kV3s
	 pJF8Gzoi5K56g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D167684CAB;
	Sun, 26 Apr 2026 19:26:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AFE84231
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 19:26:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9550A61C80
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 19:26:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yd9H2cpoFGQH for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 19:26:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.102;
 helo=smtpcmd10102.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A481461305
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A481461305
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A481461305
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 19:26:37 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id H57jw1pn2IfDkH57jwtgm8; Sun, 26 Apr 2026 21:26:35 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Johan Oudinet <johan.oudinet@gmail.com>
Date: Sun, 26 Apr 2026 21:23:20 +0200
Message-ID: <20260426192320.183163-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfDF4tsl8JtlViByKcmN/w9lizU2Lrlzbhv5qxzvUxOot/Lz/9ngqD0iqfE7XJJQ3Vyez6sNY5ZP9FVP2OZEjkyDccYG+fNWjTptKT0RI8MaC1nQJFMJH
 6FZ6/QCFJuwsIzzvn59N6IuOsSkxhRfMyo/QCf2m/8pQxexoiVinSc9jJxJb0T/67q1Cy55N+MyLuECgZOUvsQ1BCt7aKqImoQEguyB+b9/htoGsi7WlDbdf
 mlHKa8gBlDGnhnqGbF0Oy5rInVccZgiRMx7en2AQAxMscbVlptrOQMKiGSm5rgw9TcBRBZlgV8qbvd9+0/mrjg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1777231595; bh=mMZDz2857C0655KTrXPP26O8OgUuzr5d5Tipru0LRVA=;
 h=From:To:Subject:Date:MIME-Version;
 b=Hmw5KhoTAdOxqzs5CnJosCPdGHZwzGbf025LAgmuMFcHcs+wUGRfeUNi6fJxunslt
 8hkP0P+/8CVwtwrbjuBJHgHmnMZvfM6vOsCfv4P82JbLvWDoslDLnBUhCGkLm97MFE
 syeHLotdkqHokbHr2QoRXCf+cSCGKrn9FD5SgyVZyVC0KxI8FF7xD9t0JwNZ/7Oo81
 NBKDjRKsWp5d0itpu31Ay4+15UFNeCLi/34PdYXKbqEKh3YlNFdmZ+HbDaBnFqqINz
 rqja37zdo+mcyJEbjtQW6+1z1qya0w7JQIVGUtYJJxSARtek19Zbm7MZ008ewXIWgt
 inXTUwGf4HVSQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Hmw5KhoT
Subject: [Buildroot] [PATCH] package/erlang-jiffy: bump to version 2.0.0
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

Release Notes:
https://github.com/davisp/jiffy/releases/tag/2.0.0

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/erlang-jiffy/erlang-jiffy.hash | 2 +-
 package/erlang-jiffy/erlang-jiffy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-jiffy/erlang-jiffy.hash b/package/erlang-jiffy/erlang-jiffy.hash
index b5cbb99f0e..79647e2b96 100644
--- a/package/erlang-jiffy/erlang-jiffy.hash
+++ b/package/erlang-jiffy/erlang-jiffy.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  44b93897b0ca4f085b9424d8673b3a78ff85daaaca4d055a40e2a03a8cf4587a  erlang-jiffy-1.1.3.tar.gz
+sha256  d4ef3fe9a231f4fa3d2f5b4be905c2d2a116b96d56433c66b5d7bd2dace5d52c  erlang-jiffy-2.0.0.tar.gz
 sha256  0fa8afad2f02c08850a16e36fe55376ee19732b3a116a0207f2a73c857777a49  LICENSE
diff --git a/package/erlang-jiffy/erlang-jiffy.mk b/package/erlang-jiffy/erlang-jiffy.mk
index b0839210d6..55fb14c000 100644
--- a/package/erlang-jiffy/erlang-jiffy.mk
+++ b/package/erlang-jiffy/erlang-jiffy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_JIFFY_VERSION = 1.1.3
+ERLANG_JIFFY_VERSION = 2.0.0
 ERLANG_JIFFY_SITE = $(call github,davisp,jiffy,$(ERLANG_JIFFY_VERSION))
 ERLANG_JIFFY_LICENSE = MIT (core), \
 	BSD-3-Clause (Google double conversion library), \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
