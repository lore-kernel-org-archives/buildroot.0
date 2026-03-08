Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF42F5513C
	for <buildroot@archiver.kernel.org>; Sun,  8 Mar 2026 10:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 442EC6103A;
	Sun,  8 Mar 2026 10:42:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1G3ao9eA7tIS; Sun,  8 Mar 2026 10:42:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65C4E61043
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772966577;
	bh=VHCRwYr0xZZ4QTqXwWi5un0LqxFNKeBo78BjR3NUmWk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=loaWxZLJlJzIaWMBIiSwAEDYZ+35JlXlF74xetdF/LwXphNkqmAm4Zqf2H4+8dmwi
	 HV/RQq84lXovxUtGUVVsWoK9mKWufXbe8LMcYxqsjbkWQtbK20VsigpcFiIL1lK2Oa
	 i/Wg1CsYiOSOeNFh0L5ecWBuPnyUCv2f/4/i6nRs+9nz+3RsLbM9UPrx21nFata0A8
	 PMcpU5QW0GyWgE7mnkYlsSjCapirKbFv9GIuXnJOGEPBF+Vp54XE+T6qjjsuguoqEv
	 dt8UABmRW3Zj4QDZw7nPi48sis1MGDLt0eEF4oIZK4h1gckvbFELsibN7ioZlijK3l
	 0aCYHhsVa+aHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65C4E61043;
	Sun,  8 Mar 2026 10:42:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2473A158
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 10:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0AAD161043
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 10:42:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LulL0by5gEem for <buildroot@buildroot.org>;
 Sun,  8 Mar 2026 10:42:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2CA706103A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CA706103A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2CA706103A
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 10:42:55 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c66e.dip0.t-ipconnect.de [79.214.198.110])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 407CFA4C3862
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 11:42:53 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56662)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vzBb2-000000004JX-3FGZ
 for buildroot@buildroot.org; Sun, 08 Mar 2026 10:42:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  8 Mar 2026 11:42:52 +0100
Message-ID: <20260308104252.1729989-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772966573;
 bh=ZR2LT9YN8kGHc+w6TKYdUlRI2vmhHwHuihwp6y7qPP0=;
 h=From:To:Subject:Date:From;
 b=sXHfxmgCnI4qNVUJ1j1g+6kHrRRyNq+13JUR72qss5ymzlHatMMihSuWjdmVY3ASb
 N8zH7aBtFisGNewSet55E/m1EoSWkXf79NbdQSz38hwMVPOsXcCCdJioUkPuwohAgb
 ecHAnYATWGmA0dLtdtjQ/ugzQ1ArXSAsMiuKFM/jyZvvV4JUYZ8MdDGavoEUGnNmi/
 pJ8CPuO7AVcjvVieLuMmt2zp54jDdJvoH6vwryxHV5L8C1stDlOrTRjgE6+Hj/pgMi
 qrVx0HXGjS7pzxzEsy+XI4jgJ5OOj6xmPREVK83KsHkj9O1D2GYaFwXxf4/a+Hoskm
 Cfiz1Y+RYfLag==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=sXHfxmgC
Subject: [Buildroot] [PATCH 1/1] package/libuv: bump to version 1.52.1
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

https://github.com/libuv/libuv/blob/v1.52.1/ChangeLog

There's no newer release of uvw, and the current version of uvw
continues to build with libuv 1.52.1.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libuv/libuv.hash | 2 +-
 package/libuv/libuv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
index 8becf44d50..366296fcdd 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  2ceca1a7577633cf92794db5bf5512370f6cd45a5746d6e14f8c20aeab0a547b  libuv-v1.51.0-dist.tar.gz
+sha256  c5f14915e2fa7b83b6111c3bc477920559499e10d95f852707420c8725b82d6a  libuv-v1.52.1-dist.tar.gz
 sha256  16de0c32b265cb7d46a6d3bd614f259dd4d693a5e26b3407b04aae8d73041f0c  LICENSE
 sha256  262c44bd2cdba037e6d2a82fba15f5800d292bc993a6f5d6b6ea487744d02836  LICENSE-extra
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index b38f3c62ac..b0a538c625 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -6,7 +6,7 @@
 
 # When bumping libuv, check if a new version of uvw is available
 # and bump it too.
-LIBUV_VERSION = 1.51.0
+LIBUV_VERSION = 1.52.1
 LIBUV_SOURCE = libuv-v$(LIBUV_VERSION)-dist.tar.gz
 LIBUV_SITE = https://dist.libuv.org/dist/v$(LIBUV_VERSION)
 LIBUV_DEPENDENCIES = host-pkgconf
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
