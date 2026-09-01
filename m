Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13370C61DD3
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 14:11:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B279E80742;
	Tue,  1 Sep 2026 14:11:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rfyJ7AF3Q4f5; Tue,  1 Sep 2026 14:11:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788271887;
	bh=JUS0TWfJruYxVR9tKqD9wvt7Rr2UNV3xKRkhkm5+h7w=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Y0iNhCzYZzzYvevq+BNoyojiNuLNJFW8XyoJEhMKe0Nu2bB1D36IWhHCbDo2lx0SS
	 6J4IlS8bUQmiOBj7cTzwMgX6vOPZcUhD9NMFLwLnnYewmZ0NytOIKVHpsmhoupJwgr
	 XPIC8lti4F8KA8ku8yAu5xJCEUbR2+V46pZV+AfUBZojXz3IP13Dx2Kf1n1EVxBqDv
	 hbC+4qvLblEHYrcypRZthJJwgS73le27DsmEv5bxv/R1lxNHYiPiEVE+qYwbxL4l3L
	 qznAcnTN/eIxQzmSoHy7KVVxCu13WvwtWFINvI1Q4nkEUrOIjsNksvGbLhf2aALKcT
	 0doGBDrLa6jCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E68D80AD6;
	Tue,  1 Sep 2026 14:11:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AE9A6E45
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 14:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 951254064A
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 14:11:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u7AXmxShYZ0m for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 14:11:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B3D240648
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 14:11:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 699BC9340A; Tue,  1 Sep 2026 14:10:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 1 Sep 2026 16:09:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8dea6e7c089cb5d4fa7bd788fc6e07c9f19f70a8
X-Git-Newrev: 0742e67d2f94118d4227d29e409dc50de0acfb07
X-Patchwork-Hint: ignore
Message-Id: <20260901141024.699BC9340A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/drogon: Fix incomplete 'struct tm'
 type on uClibc
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0742e67d2f94118d4227d29e409dc50de0acfb07
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add a patch including <time.h> in Date.h to fix the following build
failure:

  Date.cc:98:28: error: return type 'struct trantor::tm' is incomplete
     98 | struct tm Date::tmStruct() const
        |                            ^~~~~

Fixes:
- https://autobuild.buildroot.org/results/e48e0fc1b95a8ad5de964b1e6d12bc45ac39f0b4

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...2-Fix-incomplete-struct-tm-type-on-uClibc.patch | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/drogon/0002-Fix-incomplete-struct-tm-type-on-uClibc.patch b/package/drogon/0002-Fix-incomplete-struct-tm-type-on-uClibc.patch
new file mode 100644
index 0000000000..4fad84664c
--- /dev/null
+++ b/package/drogon/0002-Fix-incomplete-struct-tm-type-on-uClibc.patch
@@ -0,0 +1,36 @@
+From cd29aa61d299c82d82d3285215fc4fc65e4d4fb9 Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Date: Sun, 30 Aug 2026 12:00:00 +0200
+Subject: [PATCH] Fix incomplete 'struct tm' type on uClibc
+
+Fix a build failure [1] reported by Buildroot autobuild for the
+mips/uClibc configuration:
+
+  Date.cc:98:28: error: return type 'struct trantor::tm' is incomplete
+     98 | struct tm Date::tmStruct() const
+        |                            ^~~~~
+
+Add the missing include to Date.h.
+
+[1] https://autobuild.buildroot.org/results/e48e0fc1b95a8ad5de964b1e6d12bc45ac39f0b4/
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: https://github.com/an-tao/trantor/pull/415
+---
+ trantor/utils/Date.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/trantor/trantor/utils/Date.h b/trantor/trantor/utils/Date.h
+index 4367d76e0305..41b02d355d14 100644
+--- a/trantor/trantor/utils/Date.h
++++ b/trantor/trantor/utils/Date.h
+@@ -16,6 +16,7 @@
+ 
+ #include <trantor/exports.h>
+ #include <stdint.h>
++#include <time.h>
+ #include <string>
+ 
+ namespace trantor
+-- 
+2.43.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
