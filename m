Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C981CD4F3C
	for <buildroot@archiver.kernel.org>; Sun, 17 May 2026 20:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E01476F81F;
	Sun, 17 May 2026 20:38:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vYLz0e7UMPnf; Sun, 17 May 2026 20:38:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D213C6F818
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779050311;
	bh=e5+VlvzPgK1iUKH6JUvfu4ruTyB2LepC8Y+FdlkWlTA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DBdW3EZrpoWptFiFEihKywfTgZC49dnn/DjQeJBMJ4pbF+yS9OVWRAs2sgDpqtRFU
	 u9JirB+HAiZtfoX24xXI3bfJ+DlJjvWvu4QYCb5S+ag1ebJtrGhdCElIieH5vR7h0w
	 usLxetP31gj99zclfKIa2UdEeoSjpCS7ttWP3wSx39qa59eRZL99373ZB3kiZIth2U
	 SHf2Zxw25hIozu58RkNPFA6VqvPlwanVvNE8y1gjWBLtmnAVXJUA4U+NlvpJge0aLj
	 kiwtgQNAHqwiUeXyuhHGOUv83YB6GiMc/Pq3oGg6Eimn4DXGHQhr//puOUNAP6eB7A
	 4XSxV7Q+lJgOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D213C6F818;
	Sun, 17 May 2026 20:38:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 94FCC390
 for <buildroot@buildroot.org>; Sun, 17 May 2026 20:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86C5C42315
 for <buildroot@buildroot.org>; Sun, 17 May 2026 20:38:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p7EU3wJw7eav for <buildroot@buildroot.org>;
 Sun, 17 May 2026 20:38:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7942641CD3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7942641CD3
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7942641CD3
 for <buildroot@buildroot.org>; Sun, 17 May 2026 20:38:28 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 9F8D86012D;
 Sun, 17 May 2026 22:38:21 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Martin Bark <martin@barkynet.com>, Richard Braun <rbraun@sceen.net>,
 Julien Olivain <ju.o@free.fr>
Date: Sun, 17 May 2026 22:38:06 +0200
Message-ID: <20260517203806.375813-2-ju.o@free.fr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260517203806.375813-1-ju.o@free.fr>
References: <20260517203806.375813-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1779050306;
 bh=Zh3Z1Cc92/TYdsSMwJhB2BlhonTWBJ4v7bz6nlVWYqI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QWi28xL9YBCnPldTB9Eb8T+0K+sNiwgyQ1XEeHWJOi63lI7tMOOefXs+Ef+7dI0GN
 AF/k2kfRXFOYSdIiOrRwHLXcyUNBu4f392zPhEOTBGQ+96Y6o74jo7QDNdI1pU5vLN
 tPduJr4Mz7Li8lj90QS6I3avVRdgppph0E7+IbafGdwG7OH9JPiBoI1Wvf+cnuF1LY
 lt5fBckmO0ZEqNaFZ03d/1QhoArgo43hB0zhd5cULkdN6J9MTK/v/y4wHgywAa45qT
 DiT0WiRKX/O7bobrnBifcii8KcCsmq7xIBcVXHH6TNSI0GrPOOWH7i8wiE/d12zCsS
 NnCR/RyaS9ybQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=QWi28xL9
Subject: [Buildroot] [PATCH next 2/2] package/tzdata: bump to 2026b
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For release notes, see:
https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/VX2Z3CBO6KHTYZNBBKFFWM7ZCI6TVCXP/

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/tzdata/tzdata.hash | 4 ++--
 package/tzdata/tzdata.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tzdata/tzdata.hash b/package/tzdata/tzdata.hash
index fcf7bffd24..4d4d410ce1 100644
--- a/package/tzdata/tzdata.hash
+++ b/package/tzdata/tzdata.hash
@@ -1,4 +1,4 @@
-# https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/TAGXKYLMAQRZRFTERQ33CEKOW7KRJVAK/
-sha512  1e33f7212fd0ae2ad3c16e68f0c1fc7a6ad26a126b8406c379a5768d79604c6a816054bd0fe3a63228d70cd6a1fc2b1bae2a9f8014e102d3727eb9d21affa1f1  tzdata2025c.tar.gz
+# https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/VX2Z3CBO6KHTYZNBBKFFWM7ZCI6TVCXP/
+sha512  a44882258c0a7fbe587e8b73d6bb3cd5be7d4788976ea742adbbf176eb3b33e5bd7d1714b2fffe2972b1a42e7335eac39ed0bd63e819bb421550f8cae1df4f2f  tzdata2026b.tar.gz
 # Locally computed:
 sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index a7b6dd8f65..71f8fc3ac1 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TZDATA_VERSION = 2025c
+TZDATA_VERSION = 2026b
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = https://www.iana.org/time-zones/repository/releases
 TZDATA_SELINUX_MODULES = tzdata
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
