Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E853FC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EC9D849AC;
	Fri, 28 Feb 2025 17:14:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VHUsTJSqSOUD; Fri, 28 Feb 2025 17:14:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 088A585BCE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 088A585BCE;
	Fri, 28 Feb 2025 17:14:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 15AF51DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68C4B42D1E
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HRdZvIdRutXH for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B8E742FD6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B8E742FD6
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E9C885E25; Fri, 28 Feb 2025 16:30:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Feb 2025 11:01:05 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ea3f2d9f93a782e9f0decfb132fe50d2577197f5
X-Git-Newrev: fa9823907405bd775e43d24c00fe2ab5cda050a0
X-Patchwork-Hint: ignore
Message-Id: <20250228163033.2E9C885E25@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] utils/check-symbols: allow
 BR2_BROKEN to be unused
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fa9823907405bd775e43d24c00fe2ab5cda050a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
Signed-off-by: Romain Naour <romain.naour@smile.fr>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
