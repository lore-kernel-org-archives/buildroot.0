Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA26CD6E4A
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 07:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E4EC60C20;
	Wed,  3 Jun 2026 07:23:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VK8kGaegAUvO; Wed,  3 Jun 2026 07:23:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE18E60A67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780471401;
	bh=9ejOT/z/LrV7d2/1S0G+PM2QeqGxyy8MAtwU9st/Q4w=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rwhn9Su+GU/nd7qu0VkCWeUXFnwrpf9DqYMuMFug7ZmOUKeazTjPX3PKKnTvezCYY
	 ugVqPCK6zR35fBgxEnKWLpQAMheiMMsgIMrOv/vBdjI/uiNuKTzKtz2zsHkMHGPhHH
	 AbGMwWsFkogdGeOKhVjdTBLoPsEd6ZgB1IQ2PfCrd0ogGlMNyeQ+vdXeSF/1EX4GPh
	 UIbac6SKugsr/B16DtBnLv8D3sB0+vdL9xb9nbjdHW6kGMId/6mLmC/diN8WEh4U19
	 eMc/5k3CiIMw5/BFeC6E+Dum//rfy4r1UpTl7eIr1c/Yy/4UggFI8TRwq9Oas4Vv8S
	 ovI+0Xjz+OpDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE18E60A67;
	Wed,  3 Jun 2026 07:23:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BE7BD192
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 07:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AFC3082F9E
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 07:23:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jm7vJgywXgE1 for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 07:23:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.132;
 helo=smtpcmd12132.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 590F4822E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 590F4822E8
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 590F4822E8
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 07:23:16 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id UfwXw3xfvP2aDUfwYwGf3u; Wed, 03 Jun 2026 09:23:14 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed,  3 Jun 2026 09:23:12 +0200
Message-ID: <20260603072312.956030-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfNEufivDLGe3A4isFAftn6owOcfY+LU5aAfCHvgF6F16wruXj22qo3nWu6x6i/G7a7JY9QFJC5UvDXw9kkYVaQC62BsNajoNUn5ytEJXicyXRqFmM7al
 d6sg40SgovC/uLCo4zbzD3FyKZgJK7folpMkQVhmyqq0FhGNxL7Br3y7tJSH2DLZk03jLcPJk/h51/xIatC+FcQ5zUr4e7GIGWLflnJasN4aHkcJVvQsSFVZ
 ut9DSFugQRwwvzSHBaiFlEzn/vPcNq3bTwtuCvQ9C2A=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1780471394; bh=rVDjglYU6eBSXSq22jd34QwxtQNEj7xuqJaQLZf1vWA=;
 h=From:To:Subject:Date:MIME-Version;
 b=bMGoP4UqN9k5Gi5gkTSjb9W+M9/6CNkkjo30SFr5mJ9iHAm1atNFpd8KDB4WwL8si
 HsawY96X93M2teSnuLNP+AF5gzc+HchExWYa1vWl9V1tdx/0+OIEuisP4rlT+p8Xgf
 93jKk2hEt1GAU083jJwsUm+oNUvHpdEgqni7ITBzvrXj52XFatrhkl79SSHOLn8z+r
 sL31IdZAmwRrHekOD7rGysuWwN4tjJmx+gEga2yFDADwlRYwHgcYJiaRQO6CKBZpeM
 ADb5NjTxgZHZR99F4LsmHU8IG2eq/XUvE4+H7NYsxuPuKuQFqMZpXCRpyf1urP7gK1
 G7rWDRDDw4wtw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=bMGoP4Uq
Subject: [Buildroot] [for-2025.02.x] package/swupdate: fix build failure due
 to missing limits.h
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

Add local patche committed upstream to fix build failure due to missing
limits.h include.

Fixes:
https://autobuild.buildroot.org/results/6ed019be7ff0144679f150dbd67cec4dd31fdb15/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...001-lua-add-limits.h-to-set-PATH_MAX.patch | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/swupdate/0001-lua-add-limits.h-to-set-PATH_MAX.patch

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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
