Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E06FD2502F
	for <buildroot@archiver.kernel.org>; Sun, 11 Jan 2026 11:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DE2F4068A;
	Sun, 11 Jan 2026 11:56:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z7dn3VywT_DL; Sun, 11 Jan 2026 11:56:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B15D4065D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768132611;
	bh=RRK4iBOdK6MsT5OCFr+UJi2zwU4JZ3Qtk/m2Vuwao/g=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gGOZOsfZM3PLXcvzE19QQkiCsMibN/qZJu4cgohv93t5LkmPx68dTXfbkLUaMncpW
	 c+kwNLpLqWofJFAROrGNpzzAnZSgyaGTQpndHVHMz6sNunHF9QxkUmM38fX38YsWIb
	 A7HXkcjTrVdPcN5uEWx6dYH7ICBe5tj/OdtBbd1+wVu83kDoRuQtujyAuImtKve9MR
	 vpzPlItpImQcm+lL4qxQllVkeuDYCAPESgGtxPXg0S58yWV24u44m+pIxPLAaDRnji
	 iQO28Co7TY5h/dZucTIrTwDqppP9K+KMO9B1ivtk3DNeK8sVcOMMw3Tw0q1oCwOidL
	 N9QFIvDlY2ySg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B15D4065D;
	Sun, 11 Jan 2026 11:56:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 899C712E
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 11:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C005606DB
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 11:56:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EchDdnmM0X8O for <buildroot@buildroot.org>;
 Sun, 11 Jan 2026 11:56:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6C98C60669
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C98C60669
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6C98C60669
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 11:56:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 30331A4C3943
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 12:56:46 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60456)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1veu3p-000000007Hx-3aHT
 for buildroot@buildroot.org; Sun, 11 Jan 2026 11:56:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 Jan 2026 12:56:45 +0100
Message-ID: <20260111115645.2780818-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768132606;
 bh=KHxXwKGCfgv68QRZ/DEJTD6bLdl6vm9tHo2atQE2Wzs=;
 h=From:To:Subject:Date:From;
 b=aiw56vFGj0R+p0zDPzETDyLTdUip1FiDifr95XsUkGegjSg9Z1f1KdxavLTb98FmO
 VP1Co6pA/3QzV3FnyuKqFXVLH0l1tFy9nBGDFjqQwbXX79AQlFxnBWKepVY9hDGNn3
 TeATH5SsO7DmipnEjeBthdokEjPYG0o6H7th03EAIdKvLr9xEFb6CFdJa7OcyGU8Q+
 rjBUuzaQv0iePrPsAXMqfmIN/QMLcUjPMUwu8snHcZuMq+eGZYOtMfYRp3jwp+SOCh
 qCDhvKnBVPU9U5Gc3dQiCLq7J9rZBZzg4sW5lfU8k659xRgkI2pXGeqq3vlxMqhR82
 MQbRKQXYaqdcA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=aiw56vFG
Subject: [Buildroot] [PATCH 1/1] package/icu: bump version to 78.2
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

https://github.com/unicode-org/icu/releases/tag/release-78.2

Added tarball hash from github.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/icu/icu.hash | 3 ++-
 package/icu/icu.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/icu/icu.hash b/package/icu/icu.hash
index 4f60681c54..d79b95b174 100644
--- a/package/icu/icu.hash
+++ b/package/icu/icu.hash
@@ -1,3 +1,4 @@
+# From https://github.com/unicode-org/icu/releases/tag/release-78.2
+sha256  3e99687b5c435d4b209630e2d2ebb79906c984685e78635078b672e03c89df35  icu4c-78.2-sources.tgz
 # Locally computed
-sha256  6217f58ca39b23127605cfc6c7e0d3475fe4b0d63157011383d716cb41617886  icu4c-78.1-sources.tgz
 sha256  e55522d81edc687a341a4411e0776e54ca654e90147f354a90458aaced4116af  LICENSE
diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index 6ac2085700..64d750a5ac 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -7,7 +7,7 @@
 # Git tags (and therefore versions on release-monitoring.org) use the
 # XX-Y format, but the tarballs are named XX_Y and the containing
 # directories XX.Y.
-ICU_VERSION = 78.1
+ICU_VERSION = 78.2
 ICU_SOURCE = icu4c-$(ICU_VERSION)-sources.tgz
 ICU_SITE = \
 	https://github.com/unicode-org/icu/releases/download/release-$(ICU_VERSION)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
