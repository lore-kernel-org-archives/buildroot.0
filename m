Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ECACCD6E7D
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:39:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D688C8206E;
	Fri,  5 Jun 2026 12:39:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hE427XvjZzj9; Fri,  5 Jun 2026 12:39:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7FD681E99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663148;
	bh=52qEakXJKOmD26AdULIIPdy3lu37DZ+ato/4L3K0G/Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Z/y64fPGMmwqW2hjP9ZJjvDI/lC3K17wxwElUZawZwDOsqrZW47kZF6DhatqTtL3A
	 zDQe/slmdapqA+Q6GcoEaRBH4P+QrP+zlEV7ZkoqWIWGIo96OYysy2t6483Z+f+1zA
	 YUg7ibpgbLMhnDZwxBHKWYRZ3ShJ4FMm1OamLzFfLjxCJ41fVMJH6TdCYA0HXv9ltU
	 COG5+UfTlJwMkInUdKe0zbPIUVs2TJN+g9APpw0EQh90QtLovoRm9O2aljvIMvndMm
	 /jWfIMF3PQOvTtW5q2trZqEEFP+MVM0eJNRg8VnhH2p49cfaK+5FsTHJ++m/UAPJAy
	 0AgXa5LHrEFOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7FD681E99;
	Fri,  5 Jun 2026 12:39:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 068F8F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37F5E81E58
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8tgXEcgaNwpz for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:37:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A609C81EC7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A609C81EC7
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CFD4787B2D; Fri,  5 Jun 2026 12:37:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 5 Jun 2026 14:27:32 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: c84ebd03a5a29cbea935cff0c8673da26a94299e
X-Git-Newrev: 2f825f1bf853adcd7dd231cb905889b0dc2da8b4
X-Patchwork-Hint: ignore
Message-Id: <20260605123714.CFD4787B2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/swupdate: fix
 build failure with luajit
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2f825f1bf853adcd7dd231cb905889b0dc2da8b4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Add local patche committed upstream to fix build failure due to missing
limits.h include.

This error happens when compiling swupdate with LuaJit. This can be
reproduced with the following configuration:

cat >configs/samba-bump_defconfig <<EOF
BR2_arm=y
BR2_cortex_a7=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PACKAGE_SWUPDATE=y
BR2_PACKAGE_LUAJIT=y
EOF
make olddefconfig
make swupdate

Fixes:
https://autobuild.buildroot.org/results/6ed019be7ff0144679f150dbd67cec4dd31fdb15/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[thomas: add configuration]
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0001-lua-add-limits.h-to-set-PATH_MAX.patch    | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/swupdate/0001-lua-add-limits.h-to-set-PATH_MAX.patch b/package/swupdate/0001-lua-add-limits.h-to-set-PATH_MAX.patch
new file mode 100644
index 0000000000..4dcc88cbfb
--- /dev/null
+++ b/package/swupdate/0001-lua-add-limits.h-to-set-PATH_MAX.patch
@@ -0,0 +1,30 @@
+From 3de6491463f4b1ddf2e792771831acfb705e246d Mon Sep 17 00:00:00 2001
+From: Stefano Babic <stefano.babic@swupdate.org>
+Date: Tue, 11 Feb 2025 09:08:15 +0100
+Subject: [PATCH] lua: add limits.h to set PATH_MAX
+
+This fixes github action (debian slim), with other builds the file is
+automatically included.
+
+Upstream: https://github.com/sbabic/swupdate/commit/3de6491463f4b1ddf2e792771831acfb705e246d
+Signed-off-by: Stefano Babic <stefano.babic@swupdate.org>
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ corelib/lua_interface.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/corelib/lua_interface.c b/corelib/lua_interface.c
+index 02d48259..ffe62d88 100644
+--- a/corelib/lua_interface.c
++++ b/corelib/lua_interface.c
+@@ -16,6 +16,7 @@
+ #include <sys/sysmacros.h>
+ #endif
+ #include <sys/types.h>
++#include <limits.h>
+ 
+ #include "lua.h"
+ #include "lauxlib.h"
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
