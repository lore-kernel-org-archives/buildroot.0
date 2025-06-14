Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB04C71141
	for <buildroot@archiver.kernel.org>; Sat, 14 Jun 2025 11:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37F9C8115A;
	Sat, 14 Jun 2025 11:35:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5gs1ZTs1pxFO; Sat, 14 Jun 2025 11:35:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A512810B3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A512810B3;
	Sat, 14 Jun 2025 11:35:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E7AD151
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 11:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14ADD810B0
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 11:35:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KDsfRSrTH0Cy for <buildroot@buildroot.org>;
 Sat, 14 Jun 2025 11:35:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1ED0E8108D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1ED0E8108D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1ED0E8108D
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 11:35:17 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cb5b.dip0.t-ipconnect.de [79.214.203.91])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EFE0EA4C01D4;
 Sat, 14 Jun 2025 13:35:14 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55818)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uQPAJ-0000000047M-092X;
 Sat, 14 Jun 2025 11:35:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Jun 2025 13:35:14 +0200
Message-Id: <20250614113514.78033-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1749900914;
 bh=UDldIk3BQwOI31+Uso2KrWqP5Wm6RUoC+HLFoq6h7Mw=;
 h=From:To:Cc:Subject:Date:From;
 b=daMPDQtAH/46IDQIkbvY88miGOWHpafm/MTIvDMuaJb6gMN7tAan5RqbLFq8gO/Ck
 qGQtNPRCFzEpVFSbuTuhV2osg6vvuJM0qvPKgeJCFkHZG0i5y5kNOoGUbwv55oGum7
 nBelzDeoK+dJeWv7zJY5zJ1/GpRdJDgwOR82nT2poQ78CS4+SwYGnQbymtuYIENBmj
 sLHJ2qGFiaDqzOfkZKotLvthsH7bA2Y9IBkICFDOuQOqX1G0nEvoqOh03/+6OykWxf
 Ay0Lh2r7kM5pmeatnhCVwzhtJ9SAIWBxP71Kn5hrWo4zqZ6kmF7LcTGdv0QBcPHyA6
 5fg51JkpMrBUQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=daMPDQtA
Subject: [Buildroot] [PATCH 1/1] package/python-glslang: fix host-python3
 dependency
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

python-glslang is a host-only package and the host-python3 dependency
was wrongly added as target dependency with buildroot commit
f9fe0cf8f64f8ea48f3ee4af28053d7bea52b61f.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-glslang/python-glslang.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-glslang/python-glslang.mk b/package/python-glslang/python-glslang.mk
index 94f480e30a..c3e87da94a 100644
--- a/package/python-glslang/python-glslang.mk
+++ b/package/python-glslang/python-glslang.mk
@@ -8,6 +8,6 @@ PYTHON_GLSLANG_VERSION = 11.13.0
 PYTHON_GLSLANG_SITE = $(call github,KhronosGroup,glslang,$(PYTHON_GLSLANG_VERSION))
 PYTHON_GLSLANG_LICENSE = BSD-3-Clause
 PYTHON_GLSLANG_LICENSE_FILES = LICENSE.txt
-PYTHON_GLSLANG_DEPENDENCIES = host-python3
+HOST_PYTHON_GLSLANG_DEPENDENCIES = host-python3
 
 $(eval $(host-cmake-package))
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
