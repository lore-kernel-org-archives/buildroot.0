Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 133B7EDE99C
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 09:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C014661266;
	Thu, 14 Sep 2023 09:54:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C014661266
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zZsyezIbcfGf; Thu, 14 Sep 2023 09:54:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE40160F42;
	Thu, 14 Sep 2023 09:54:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE40160F42
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E32741BF42E
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 09:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BBD6E41F20
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 09:52:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBD6E41F20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DBGvd1N0Y7jA for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 09:52:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E693041E79
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 09:52:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E693041E79
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D627386F2C; Thu, 14 Sep 2023 09:52:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 14 Sep 2023 11:48:55 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 3fc491c12765a358db6850ff7eaf2d5c5aec567c
X-Git-Newrev: 08d60b1c61177bc72a7813e76296a1faeaef21f1
X-Patchwork-Hint: ignore
Message-Id: <20230914095229.D627386F2C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/python-tornado:
 backport fix for CVE-2023-28370
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

commit: https://git.buildroot.net/buildroot/commit/?id=08d60b1c61177bc72a7813e76296a1faeaef21f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 317c4b8f60d1c81a87cb16d01a4f15ac733d858e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...Fix-an-open-redirect-in-StaticFileHandler.patch | 42 ++++++++++++++++++++++
 package/python-tornado/python-tornado.mk           |  2 ++
 2 files changed, 44 insertions(+)

diff --git a/package/python-tornado/0001-web-Fix-an-open-redirect-in-StaticFileHandler.patch b/package/python-tornado/0001-web-Fix-an-open-redirect-in-StaticFileHandler.patch
new file mode 100644
index 0000000000..357c6f2f12
--- /dev/null
+++ b/package/python-tornado/0001-web-Fix-an-open-redirect-in-StaticFileHandler.patch
@@ -0,0 +1,42 @@
+From ac79778c91bd9a4a92111f7e06d4b12674571113 Mon Sep 17 00:00:00 2001
+From: Ben Darnell <ben@bendarnell.com>
+Date: Sat, 13 May 2023 20:58:52 -0400
+Subject: [PATCH] web: Fix an open redirect in StaticFileHandler
+
+Under some configurations the default_filename redirect could be exploited
+to redirect to an attacker-controlled site. This change refuses to redirect
+to URLs that could be misinterpreted.
+
+A test case for the specific vulnerable configuration will follow after the
+patch has been available.
+
+Upstream: https://github.com/tornadoweb/tornado/commit/32ad07c54e607839273b4e1819c347f5c8976b2f
+[Thomas: backported to fix CVE-2023-28370]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ tornado/web.py | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/tornado/web.py b/tornado/web.py
+index cd6a81b4..05b571eb 100644
+--- a/tornado/web.py
++++ b/tornado/web.py
+@@ -2806,6 +2806,15 @@ class StaticFileHandler(RequestHandler):
+             # but there is some prefix to the path that was already
+             # trimmed by the routing
+             if not self.request.path.endswith("/"):
++                if self.request.path.startswith("//"):
++                    # A redirect with two initial slashes is a "protocol-relative" URL.
++                    # This means the next path segment is treated as a hostname instead
++                    # of a part of the path, making this effectively an open redirect.
++                    # Reject paths starting with two slashes to prevent this.
++                    # This is only reachable under certain configurations.
++                    raise HTTPError(
++                        403, "cannot redirect path with two initial slashes"
++                    )
+                 self.redirect(self.request.path + "/", permanent=True)
+                 return None
+             absolute_path = os.path.join(absolute_path, self.default_filename)
+-- 
+2.41.0
+
diff --git a/package/python-tornado/python-tornado.mk b/package/python-tornado/python-tornado.mk
index 2af86ecb18..f4a4c97d2a 100644
--- a/package/python-tornado/python-tornado.mk
+++ b/package/python-tornado/python-tornado.mk
@@ -12,5 +12,7 @@ PYTHON_TORNADO_LICENSE_FILES = LICENSE
 PYTHON_TORNADO_CPE_ID_VENDOR = tornadoweb
 PYTHON_TORNADO_CPE_ID_PRODUCT = tornado
 PYTHON_TORNADO_SETUP_TYPE = setuptools
+# 0001-web-Fix-an-open-redirect-in-StaticFileHandler.patch
+PYTHON_TORNADO_IGNORE_CVES += CVE-2023-28370
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
