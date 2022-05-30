Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F210C433F5
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 19:02:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25383831E3;
	Mon, 30 May 2022 19:02:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AlaE3n_w2Q_A; Mon, 30 May 2022 19:02:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AA8182E29;
	Mon, 30 May 2022 19:02:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 094901BF38A
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 19:02:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC565409C3
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 19:02:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dNNaaEUskiZn for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 19:02:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6ED740991
 for <buildroot@buildroot.org>; Mon, 30 May 2022 19:02:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 0F9E08675D; Mon, 30 May 2022 18:50:31 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 30 May 2022 21:01:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b7d8ce5b181a55f25ca997553e558c5854140363
X-Git-Newrev: c34434d803c533742e65e1a93669f11f28301384
X-Patchwork-Hint: ignore
Message-Id: <20220530185031.0F9E08675D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-crossbar: use escape from
 markupsafe
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c34434d803c533742e65e1a93669f11f28301384
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The last version bump of python-werkzeug v2.1.2 introduced a runtime
issue in python-crossbar since escape from werkzeug has been removed
since werkzeug 2.1.0 [1].

This has been fixed in python-crossbar v24.4.1 but we do not want
to bump this package for the Buildroot release 2022.05. Instead
apply the same change as the upstream commit [2] using escape from
python-markupsafe package.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/2520606768

[1] https://github.com/pallets/werkzeug/commit/22d1e9ac13829b83347107a9b4d77072a8e1af6a
[2] https://github.com/crossbario/crossbar/commit/ca8d383f01231e2b3f986e791f215f12f2deee5d

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...bservice-wap-use-markupsafe-instead-of-we.patch | 40 ++++++++++++++++++++++
 package/python-crossbar/Config.in                  |  1 +
 2 files changed, 41 insertions(+)

diff --git a/package/python-crossbar/0003-crossbar-webservice-wap-use-markupsafe-instead-of-we.patch b/package/python-crossbar/0003-crossbar-webservice-wap-use-markupsafe-instead-of-we.patch
new file mode 100644
index 0000000000..65ffc508ab
--- /dev/null
+++ b/package/python-crossbar/0003-crossbar-webservice-wap-use-markupsafe-instead-of-we.patch
@@ -0,0 +1,40 @@
+From ac5fc826e33492bb0c4283a954389d7fd355fa61 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Mon, 30 May 2022 19:38:11 +0200
+Subject: [PATCH] crossbar/webservice/wap: use markupsafe instead of werkzeug
+
+wap.py use escape from werkzeug but it has been removed since
+the version 2.1.0 [1].
+
+Replace with escape from markupsafe like upstream commit [2]
+(wihout other changes).
+
+[1] https://github.com/pallets/werkzeug/commit/22d1e9ac13829b83347107a9b4d77072a8e1af6a
+[2] https://github.com/crossbario/crossbar/commit/ca8d383f01231e2b3f986e791f215f12f2deee5d
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ crossbar/webservice/wap.py | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/crossbar/webservice/wap.py b/crossbar/webservice/wap.py
+index 825558b1..6daa9b21 100644
+--- a/crossbar/webservice/wap.py
++++ b/crossbar/webservice/wap.py
+@@ -36,7 +36,12 @@ from collections.abc import Mapping, Sequence
+ 
+ from werkzeug.routing import Map, Rule
+ from werkzeug.exceptions import NotFound, MethodNotAllowed
+-from werkzeug.utils import escape
++
++try:
++    # removed in werkzeug 2.1.0
++    from werkzeug.utils import escape
++except ImportError:
++    from markupsafe import escape
+ 
+ from jinja2 import Environment, FileSystemLoader
+ from jinja2.sandbox import SandboxedEnvironment
+-- 
+2.35.3
+
diff --git a/package/python-crossbar/Config.in b/package/python-crossbar/Config.in
index 9625d9ce8e..60b60b1740 100644
--- a/package/python-crossbar/Config.in
+++ b/package/python-crossbar/Config.in
@@ -15,6 +15,7 @@ config BR2_PACKAGE_PYTHON_CROSSBAR
 	select BR2_PACKAGE_PYTHON_INCREMENTAL
 	select BR2_PACKAGE_PYTHON_JINJA2
 	select BR2_PACKAGE_PYTHON_LMDB
+	select BR2_PACKAGE_PYTHON_MARKUPSAFE
 	select BR2_PACKAGE_PYTHON_MISTUNE
 	select BR2_PACKAGE_PYTHON_NETADDR
 	select BR2_PACKAGE_PYTHON_PASSLIB
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
