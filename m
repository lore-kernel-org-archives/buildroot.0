Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A807DCD4851
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 14:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCB1B40F62;
	Tue, 12 May 2026 14:06:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V6EecmIiIxmj; Tue, 12 May 2026 14:06:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A25F40E57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778594777;
	bh=i+pj+PDvNyq6RPOx1vpomDsKl25exL/18GsyiaWJfl0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cyKj5qN7aad5GU2qGUrCfyVJpm7Xm9CJwXXHcgjrU7bQ8dK5TjzmdrLE5zt+gosrp
	 oYsI8n7yS+FJaszatx6V/TX6Ue5tcYy/Z9ZUI1ze/zo+PF/KCRbXlAjJcH1ulxrs+u
	 0QiT2OQyow9l3kxK9igjGgZR9ntIKKNXuBgYh4hhNQKcVdS3cCbaoA4Gc1nKZr6zWt
	 14tQNQqYcU2ZjY4BPWLK4zKNBp0jWvQUKG/o5ztD3Ot2qNxPCORued2PC8cskPMvG/
	 9iDE9oruuhYdzBrHrKz65oVHIQH+JYMcKgqnXgIRAv1oiC5TvWwnE375/wlzARF7cF
	 5D/xSu4vaVxGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A25F40E57;
	Tue, 12 May 2026 14:06:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 33C4315F
 for <buildroot@buildroot.org>; Tue, 12 May 2026 14:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2577160DA8
 for <buildroot@buildroot.org>; Tue, 12 May 2026 14:06:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o3zjDsZq1bvT for <buildroot@buildroot.org>;
 Tue, 12 May 2026 14:06:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7F79660DA6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F79660DA6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7F79660DA6
 for <buildroot@buildroot.org>; Tue, 12 May 2026 14:06:13 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b10b.dip0.t-ipconnect.de [84.161.177.11])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F24F3A4C0933
 for <buildroot@buildroot.org>; Tue, 12 May 2026 16:06:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39832)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wMnkQ-000000004qc-2il1
 for buildroot@buildroot.org; Tue, 12 May 2026 14:06:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 12 May 2026 16:06:10 +0200
Message-ID: <20260512140610.52172-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778594771;
 bh=7k59TzYC+blun4/41lL/CPeapFENPYTn4B9EecP0Xzw=;
 h=From:To:Subject:Date:From;
 b=ecG0Rron8Xts/ObpA6QvTmDLR0PM6uODS+yKbSjIvrqhqtfyI53PAzBHhu3hxs5k9
 9+ETHLKcgEhuTM9VNZPHfsFe4VdxZ/r2KGdPKUCzZd/MXimxk0LRMd4qROTyAWojzm
 fZAPC6pDW6Y3K9b0ALpS1PfOqm98se/HQPa5E0JwXOGG8CHdP6p00IooT6tXWSIVQy
 CqeOGcQ5mimMT16DG8vHMCO9vlvv/S4NUWBL37svUYS1hWqoaMq2+9GQndKvRgig1B
 GB1dQeheQqtZtwzkevv+l7Ss429XO5ql4fGIbuEcYo33qha6qmbj6dGbri1T4F0oiC
 tLHSqTj2Ne6Bw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=ecG0Rron
Subject: [Buildroot] [PATCH 1/1] package/liburiparser: security bump version
 to 1.0.2
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

https://github.com/uriparser/uriparser/blob/uriparser-1.0.2/ChangeLog

Fixes CVE-2026-44927 & CVE-2026-44928.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/liburiparser/liburiparser.hash | 4 ++--
 package/liburiparser/liburiparser.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/liburiparser/liburiparser.hash b/package/liburiparser/liburiparser.hash
index c18df8eb98..ad5bf40d47 100644
--- a/package/liburiparser/liburiparser.hash
+++ b/package/liburiparser/liburiparser.hash
@@ -1,4 +1,4 @@
-# From https://github.com/uriparser/uriparser/releases/tag/uriparser-1.0.1
-sha256  acd18cfb14d1851705f863f7a625be693fb3971fb85d4996faa21147f0315fcb  uriparser-1.0.1.tar.xz
+# From https://github.com/uriparser/uriparser/releases/tag/uriparser-1.0.2
+sha256  7b2496f9622b4b201186a3d159d278605f1fb7262402a10cc1c0824889798b00  uriparser-1.0.2.tar.xz
 # Locally calculated
 sha256  287f09e6546a9610f949f89e8fb937cacfeabd7bfaa8c8a0c18312193bf04ad3  COPYING.BSD-3-Clause
diff --git a/package/liburiparser/liburiparser.mk b/package/liburiparser/liburiparser.mk
index d8dcc22063..9d1b9a1aac 100644
--- a/package/liburiparser/liburiparser.mk
+++ b/package/liburiparser/liburiparser.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBURIPARSER_VERSION = 1.0.1
+LIBURIPARSER_VERSION = 1.0.2
 LIBURIPARSER_SOURCE = uriparser-$(LIBURIPARSER_VERSION).tar.xz
 LIBURIPARSER_SITE = https://github.com/uriparser/uriparser/releases/download/uriparser-$(LIBURIPARSER_VERSION)
 LIBURIPARSER_LICENSE = BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
