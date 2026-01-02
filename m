Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEBD5FA374B
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 14:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E00240629;
	Fri,  2 Jan 2026 14:12:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YNxApyMf2Bme; Fri,  2 Jan 2026 14:12:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5396405DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767363135;
	bh=fqLs3SDq00d0JukNDmKvEY6V+haUxrIBHZn+3jnf/K8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LPv/0LEn7Patxym/70Hrou0KE1NfK/h6gu5vru7lhrdwdedJEfVjOXD4ssTOP6I8x
	 zNNiB0fqQSLWKy8b8ScTlhWhUfCyOi/A7BVJEt8lWRyNZhUKrVxs0jFvjbmriONLPb
	 RQUmqBi2kwdv85/TRNh4k4WPSY1uu7nyyB70h380nnjNNWOBccCeEoUC0UYHDQQOzq
	 Ri2zjahSGO5vBJwq+sK+HABPMU/Pqgb/wWaZjNlxG+2+L0s1Lbf8abaZ/Z01bAdPU7
	 4n/hiIruPTjN5aSkQoAnPddWcT9Mh0/aFvirm39n8RX/gL6maqX5NIrZnSkfaB8Wdb
	 68yxiHs+SDDGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5396405DC;
	Fri,  2 Jan 2026 14:12:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 35C81351
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 14:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 339DE405DC
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 14:12:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 13TTpvwuWW53 for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 14:12:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1F7BD40582
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F7BD40582
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1F7BD40582
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 14:12:13 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 46A9BA4C2A6E
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:12:11 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34526)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vbfsw-000000007ao-46yi
 for buildroot@buildroot.org; Fri, 02 Jan 2026 14:12:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  2 Jan 2026 15:12:10 +0100
Message-ID: <20260102141210.167234-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767363131;
 bh=vVZT1nmu0oPPjgnyTY/+Z2bwiNKG2oDzmlaWNMdzzFk=;
 h=From:To:Subject:Date:From;
 b=VmM14/hD33D4h21ZyRKi6eNwoOplb+T0ZZVCQvk8feBde5sCm7GD8g5U/cxkUuSVk
 YHbldLl803jLh/6J6fEQQjTAjSnmJx0xAjPr+F/3MI4fUtnRICwVzRgHeQUiGlMA9w
 t7cVC48ReN6cXjEtskB1BFz/24L1b9az3k9sWRWL9yXeEeZlp1jlF0gCVzzS5sSb8r
 MZmtx97KiwXBi1jY57NuMDylEsh16wdS0moUjE/nPG2ylnTukLfftgEn2YCRExWN2J
 xdqxDsM2dBzYdDfnfKWqdzoaCgb7ItLLOYZsK+NOSZpx7/ArAuVYOUtpUb7RGYZh4k
 a5xXZ+QTwmFkg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=VmM14/hD
Subject: [Buildroot] [PATCH 1/1] package/dav1d: bump version to 1.5.3
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

https://code.videolan.org/videolan/dav1d/-/blob/1.5.3/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/dav1d/dav1d.hash | 4 ++--
 package/dav1d/dav1d.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dav1d/dav1d.hash b/package/dav1d/dav1d.hash
index 22dbf7220d..b6bae42e8f 100644
--- a/package/dav1d/dav1d.hash
+++ b/package/dav1d/dav1d.hash
@@ -1,4 +1,4 @@
-# From https://download.videolan.org/pub/videolan/dav1d/1.5.2/dav1d-1.5.2.tar.xz.sha256
-sha256  cce88ebcffd3f790bde49caa75f97b9cc2dd54ca8f57e38c62707266ec71bc4e  dav1d-1.5.2.tar.xz
+# From https://download.videolan.org/pub/videolan/dav1d/1.5.3/dav1d-1.5.3.tar.xz.sha256
+sha256  732010aa5ef461fa93355ed2c6c5fedb48ddc4b74e697eaabe8907eaeb943011  dav1d-1.5.3.tar.xz
 # Locally computed
 sha256  dd92c3c2247c5651606fc23a5e2d6a1ebc5ace9a3e49cbde0e12f05ad1cb1ee5  COPYING
diff --git a/package/dav1d/dav1d.mk b/package/dav1d/dav1d.mk
index f9cfd171d5..011ab2ddf0 100644
--- a/package/dav1d/dav1d.mk
+++ b/package/dav1d/dav1d.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAV1D_VERSION = 1.5.2
+DAV1D_VERSION = 1.5.3
 DAV1D_SOURCE = dav1d-$(DAV1D_VERSION).tar.xz
 DAV1D_SITE = https://download.videolan.org/pub/videolan/dav1d/$(DAV1D_VERSION)
 DAV1D_LICENSE = BSD-2-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
