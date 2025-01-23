Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D7FCC02182
	for <buildroot@archiver.kernel.org>; Thu, 23 Jan 2025 21:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1401285089;
	Thu, 23 Jan 2025 21:35:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RDIq_qxKK1_k; Thu, 23 Jan 2025 21:35:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A2778509D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A2778509D;
	Thu, 23 Jan 2025 21:35:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D5676B88
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 21:35:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C38D28509F
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 21:35:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DGs8NLB5ySeE for <buildroot@buildroot.org>;
 Thu, 23 Jan 2025 21:35:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D2F9B8509D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2F9B8509D
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D2F9B8509D
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 21:35:52 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 1F6F9B00535;
 Thu, 23 Jan 2025 22:35:48 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Julien Olivain <ju.o@free.fr>
Date: Thu, 23 Jan 2025 22:35:41 +0100
Message-ID: <20250123213541.1737622-1-ju.o@free.fr>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737668150;
 bh=tA7ix42g67aLHhu/DETuJlSmIJAPlPqZiHQLhp/NobA=;
 h=From:To:Cc:Subject:Date:From;
 b=UN6eXWMoYctY5opBWf5Uam3efnRSHfJSP0hON7DppOfzyGIas9sdT6N7Fv/AJTFji
 ojrEPvnCkjUVZCku6iySCJiyhy5BciqjEa/his2yWQKyTO0dIysubNzXzSu1aaGphI
 yzwWxzYFA+HjORhtVmI82gG9jketmdAwVxD+SjjrUARSv6E6FoVDS9PdUcihI/U1ni
 BltQGbGLccJsVBF5M/stDCZNXJSinYk4T884FIDEUzh71DhSyur4ZAfEutSXlaaLr/
 64eeT065r5uuW/y4ChcZ6IyIUotLGfXf8vmQ59wWODOvFvazY/FKXZwbMIuOm0VKao
 d9qSsMkRr8bVA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UN6eXWMo
Subject: [Buildroot] [PATCH 1/1] utils/check-symbols: allow BR2_BROKEN to be
 unused
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

Commit [1] introduced the BR2_BROKEN hidden symbol. The intent of
this symbol is to temporarily mark a configuration known to be broken.
This commit was added to fix an undefined usage of the symbol, in a
previous commit [2].

With this somewhat special symbol, it is also perfectly normal to
have no use of it.

Running the command "utils/check-symbols" in a state there is no usage
of the BR2_BROKEN, the script fails with output:

    Config.in:15: BR2_BROKEN defined but not referenced

This commit adds an exception for this symbol, allowing it to be
unused in the whole Buildroot tree.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/8925433382

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/2ddc5808cd19f577917566ad83e2a3835d6d43b9
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/11a8cdd2bbbd0ef4adf600e4792d75f6f2122ec8

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/8937458243
---
 utils/checksymbolslib/br.py | 4 ++++
 utils/checksymbolslib/db.py | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/utils/checksymbolslib/br.py b/utils/checksymbolslib/br.py
index f9dc336e64..a4c1b84c56 100644
--- a/utils/checksymbolslib/br.py
+++ b/utils/checksymbolslib/br.py
@@ -45,6 +45,10 @@ symbols_not_defined_for_fake_virtual_packages = [
     'BR2_PACKAGE_PROVIDES_TOOLCHAIN_BUILDROOT',
     'BR2_PACKAGE_PROVIDES_TOOLCHAIN_BARE_METAL_BUILDROOT',
 ]
+# Config.in
+symbols_possibly_unused = [
+    'BR2_BROKEN',
+]
 # fs/common.mk
 suffixes_not_defined_for_all_rootfs_types = [
     '_BZIP2',
diff --git a/utils/checksymbolslib/db.py b/utils/checksymbolslib/db.py
index 71b1e9e816..cb0dfa476f 100644
--- a/utils/checksymbolslib/db.py
+++ b/utils/checksymbolslib/db.py
@@ -155,6 +155,8 @@ class DB:
                 continue
             if legacy_usage in entries:
                 continue
+            if symbol in br.symbols_possibly_unused:
+                continue
             if symbol in br.symbols_used_only_in_source_code:
                 continue
             if symbol in br.symbols_used_only_for_host_variant:
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
