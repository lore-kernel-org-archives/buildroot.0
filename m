Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DEEAF94CA7
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 19:04:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AF5760888;
	Tue, 21 Apr 2026 19:04:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fJzVJLnaMkzb; Tue, 21 Apr 2026 19:04:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 831E860882
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776798288;
	bh=etIWMvtwEsbrLUa/KoMbae0VSX7iLav/clXwSkZiPrA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hwGAYbIGtuGPz8l5NDZc73U0M+zZIKLRaEdRaHmsEKZlAp4C39nEBmUhWuCagdZ7P
	 NgT9qX/B9Djcwveb8nY+PQ+2URWHZdrBsLtBiMtVZpyw4NvKVtCZ6q1r3+poswW/Nb
	 C1ljf+1DLS/4YKyGYaGFF96kTd0aepaUhpJFsYcT1QFAFsvC2Pqwalug7VqxIw2UBA
	 y/GtRgRnw3q99aHU6npRSqQo1FGMmZo7SszVixIJEWVIwxWJAC4EdCCGss4PrHeEre
	 YN9Dj9AlbAMfZ2HqZxSIu+S+ul1YpuXfT1aCaCIuhVipwL9Z4JdZ7gteOYMO+kYTQ5
	 2lofSeSOOXtgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 831E860882;
	Tue, 21 Apr 2026 19:04:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CA58257
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 19:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0EB5A8024F
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 19:04:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1B1RbV1cN06Z for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 19:04:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EECD98407C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EECD98407C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EECD98407C
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 19:04:45 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0177.dip0.t-ipconnect.de [91.58.1.119])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1492BA4C0185;
 Tue, 21 Apr 2026 21:04:44 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48628)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wFGOp-0000000043t-3AY9;
 Tue, 21 Apr 2026 19:04:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
Date: Tue, 21 Apr 2026 21:04:43 +0200
Message-ID: <20260421190443.2722764-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776798284;
 bh=hDzOjNkeV4RH8R0iPZOHwPy4hFf9/5gJTi+KPoO8HDo=;
 h=From:To:Cc:Subject:Date:From;
 b=tmDRDzqNXBveupJ7ynYkh5SrU1TVYX6uZbp1l0hytbDGAw69xdazq67FMG0JZjeYV
 +BEFMNfe9dlgM73idoNN/U5swuZgUXWlHENJzISY5Xgh+t567RIsvcJ+w4ciD5mbLo
 rdq7WVARgi7DxyBw9XVXkMAZnSkjkcK2Al281InCzNbxC10lpGQpiADGadg9UJOD1Q
 tNbZK9krKqtkk8QL7hbCQtVFgt4KPYODfVRifls86Ntx/nJ7lfG/1X43TEAX5Dqljs
 Uf31FRCKkFVXKltIyofNFrKvwi10ekVFgyrWRR/pZq7akLbziTGNWHWwrliK6OWIeY
 pgweeu49/Ntng==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=tmDRDzqN
Subject: [Buildroot] [PATCH 1/1] package/cpp-httplib: bump version to 0.43.1
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

https://github.com/yhirose/cpp-httplib/compare/v0.41.0...v0.43.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/cpp-httplib/cpp-httplib.hash | 2 +-
 package/cpp-httplib/cpp-httplib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cpp-httplib/cpp-httplib.hash b/package/cpp-httplib/cpp-httplib.hash
index be9967f1e2..f3e05951e9 100644
--- a/package/cpp-httplib/cpp-httplib.hash
+++ b/package/cpp-httplib/cpp-httplib.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  6d38a6b74ea33ac3133b8352f2b55b557c1d42f36e1ed0c01f852e3218329d39  cpp-httplib-0.41.0.tar.gz
+sha256  000832a5b50b67b82a77845c09d832f6e492011cd0ef1d4f72f808eb6a4fbeb3  cpp-httplib-0.43.1.tar.gz
 sha256  4b45cbe16d7b71b89ae6127e26e0d90a029198ca5e958ad8e3d0b8bbed364d8b  LICENSE
diff --git a/package/cpp-httplib/cpp-httplib.mk b/package/cpp-httplib/cpp-httplib.mk
index c4a77b869d..e8bc0a56fe 100644
--- a/package/cpp-httplib/cpp-httplib.mk
+++ b/package/cpp-httplib/cpp-httplib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CPP_HTTPLIB_VERSION = 0.41.0
+CPP_HTTPLIB_VERSION = 0.43.1
 CPP_HTTPLIB_SITE = $(call github,yhirose,cpp-httplib,v$(CPP_HTTPLIB_VERSION))
 CPP_HTTPLIB_LICENSE = MIT
 CPP_HTTPLIB_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
