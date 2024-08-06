Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B588C49EA1
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 22:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D3DB60657;
	Tue,  6 Aug 2024 22:03:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EoVdyvV8_S7T; Tue,  6 Aug 2024 22:03:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8591460792
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8591460792;
	Tue,  6 Aug 2024 22:03:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8D5CF1BF30B
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 22:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7AC6860657
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 22:03:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3lzFcrATFrIV for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 22:03:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8A78060792
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A78060792
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A78060792
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 22:03:01 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 592F7B0051E;
 Wed,  7 Aug 2024 00:02:57 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed,  7 Aug 2024 00:02:50 +0200
Message-ID: <20240806220250.525433-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1722981778;
 bh=9PluETmAUJX/G9q+DaH/U/Y/Nm2TEQjOZVirdM1FJD0=;
 h=From:To:Cc:Subject:Date:From;
 b=vJ+dXHlL3izQ+JgII6H6qzjBQ7BSe+i67xajsUwll5SGrq/cNKqJd9/37iC1pc9Xu
 UpN/m1mKOoBuFJq1K1gJ2QhxvqKET+bs/QbctgR56t1hoAnlOat3JmehTRu5t7Ob2w
 WuVczdY93GmZkg8Q2SBdhuXfdQx1Z8Wq+Ya91uHrSYuzp9dqWGuavnZzHB6gUJMA4b
 vh1JMOZ8CL1UMNvH7UJOxq2P66yKCpQI7aF3htj1XpqZrMLp48ipaSiX81NYIjZRCH
 G4qlJ9XVCn65diMPDWURP1AdF4YeLRa8Jd3Lmvr1wzpz+cfkY05VNaPjIEhWfw2glI
 OD4tqfYIK+xvw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=vJ+dXHlL
Subject: [Buildroot] [PATCH 1/1] package/swipl: host-swipl needs host-zlib
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

host-swipl fails to configure with CMake error message:

    Could NOT find ZLIB (missing: ZLIB_LIBRARY ZLIB_INCLUDE_DIR)

This commit fixes the issue by adding the missing host-zlib
dependency.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/7520944006
---
 package/swipl/swipl.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/swipl/swipl.mk b/package/swipl/swipl.mk
index 9ba841084e..595f5e975b 100644
--- a/package/swipl/swipl.mk
+++ b/package/swipl/swipl.mk
@@ -9,6 +9,8 @@ SWIPL_SITE = https://www.swi-prolog.org/download/stable/src
 SWIPL_LICENSE = BSD-2-Clause
 SWIPL_LICENSE_FILES = LICENSE
 
+HOST_SWIPL_DEPENDENCIES = host-zlib
+
 SWIPL_DEPENDENCIES = host-swipl zlib
 
 # A host-swipl is needed to compile the target prolog boot
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
