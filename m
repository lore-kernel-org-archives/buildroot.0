Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD50CFD352
	for <buildroot@archiver.kernel.org>; Mon, 24 Nov 2025 19:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76C97607BD;
	Mon, 24 Nov 2025 19:50:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W4mckanFflr5; Mon, 24 Nov 2025 19:50:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60943607CD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60943607CD;
	Mon, 24 Nov 2025 19:50:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EFFEF359
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 19:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D71A140A55
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 19:50:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t6sw0equgr3m for <buildroot@buildroot.org>;
 Mon, 24 Nov 2025 19:50:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E30C40A28
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E30C40A28
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 19:50:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E98EB85518; Mon, 24 Nov 2025 19:50:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 24 Nov 2025 20:42:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 85de5639c1354027ef107f1a83270d3c17c8af2c
X-Git-Newrev: d1380f5863e4927936d12ea98417de9ddbc9903f
X-Patchwork-Hint: ignore
Message-Id: <20251124195041.E98EB85518@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/depot-tools: fix running gclient.py
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d1380f5863e4927936d12ea98417de9ddbc9903f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As of Buildroot commit [1] which updated
the python-httplib2 package from 0.22.0 to 0.31.0, gclient.py has
been broken due to the internal socks.py file being removed from
the httplib directory (in upstream commit [2]).

As the depot-tools package doesn't have a build step, and is only
used when generating a flutter-engine tarball, no autobuild failures
have occured.

Add a simple patch that changes `import httplib2.socks` to
`import socks` and depend on the host-python-pysocks package.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/55a80f89d7321000591de349c7083a94c0349187
[2] https://github.com/httplib2/httplib2/commit/1a6ff781792099e9e14d7beb610bd99112b17b07

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/12188741354

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
[Julien:
 - change commit id to urls
 - add "Fixes:" link
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-gerrit_util.py-fix-importing-socks.patch  | 32 ++++++++++++++++++++++
 package/depot-tools/depot-tools.mk                 |  1 +
 2 files changed, 33 insertions(+)

diff --git a/package/depot-tools/0001-gerrit_util.py-fix-importing-socks.patch b/package/depot-tools/0001-gerrit_util.py-fix-importing-socks.patch
new file mode 100644
index 0000000000..46a1fe78d0
--- /dev/null
+++ b/package/depot-tools/0001-gerrit_util.py-fix-importing-socks.patch
@@ -0,0 +1,32 @@
+From e52f67026d7ce5b30887e1cfe486ed994169119d Mon Sep 17 00:00:00 2001
+From: Adam Duskett <adam.duskett@amarulasolutions.com>
+Date: Tue, 4 Nov 2025 11:58:37 +0100
+Subject: [PATCH] gerrit_util.py: fix importing socks
+
+As of commit 1a6ff781792099e9e14d7beb610bd99112b17b07,
+httplib2 removed the internal copy of socksipy module.
+
+The commit message specifically states to install pysocks.
+
+Upstream: unsubmitted
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ gerrit_util.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gerrit_util.py b/gerrit_util.py
+index eef2f5749..d866bc47a 100644
+--- a/gerrit_util.py
++++ b/gerrit_util.py
+@@ -35,7 +35,7 @@ from typing import NamedTuple, List, Optional
+ from typing import Tuple, TypedDict, cast
+ 
+ import httplib2
+-import httplib2.socks
++import socks
+ 
+ import auth
+ import gclient_utils
+-- 
+2.51.1
+
diff --git a/package/depot-tools/depot-tools.mk b/package/depot-tools/depot-tools.mk
index b62f844b90..a6d57a6e3b 100644
--- a/package/depot-tools/depot-tools.mk
+++ b/package/depot-tools/depot-tools.mk
@@ -14,6 +14,7 @@ HOST_DEPOT_TOOLS_DEPENDENCIES = \
 	host-python3 \
 	host-python-httplib2 \
 	host-python-pyparsing \
+	host-python-pysocks \
 	host-python-six
 
 define HOST_DEPOT_TOOLS_INSTALL_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
