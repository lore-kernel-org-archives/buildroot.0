Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A84EC07E9D
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 21:32:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED72141040;
	Fri, 23 Sep 2022 21:32:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED72141040
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2dklCXLmUuI7; Fri, 23 Sep 2022 21:32:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11621401FB;
	Fri, 23 Sep 2022 21:32:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11621401FB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8086D1BF337
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 680EB401FB
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:32:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 680EB401FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rGoyyNyZhirb for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 21:31:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C68C240151
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 21:31:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C68C240151
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B2F9885EE1; Fri, 23 Sep 2022 21:31:56 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 23 Sep 2022 23:31:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 958b112d449fa167315147c768d7a4a19ca6ebea
X-Git-Newrev: ccc1cc949094c408169d5be845aff8bb6f39fb7a
X-Patchwork-Hint: ignore
Message-Id: <20220923213156.B2F9885EE1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmanette: fix static build
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

commit: https://git.buildroot.net/buildroot/commit/?id=ccc1cc949094c408169d5be845aff8bb6f39fb7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Import a one-line patch that removes the hardcoded usage of
shared_library() from the Meson build system in favor of plain
library(), which allows to choose a static build as well.

Fixes:
- http://autobuild.buildroot.net/results/7263324435d6d25d7da98824d4313e7c45071de8
- http://autobuild.buildroot.net/results/9e6c807455b5a4e8986e8388426d98024119aa9c

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...son-Un-hardcode-building-a-shared-library.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/libmanette/0001-Meson-Un-hardcode-building-a-shared-library.patch b/package/libmanette/0001-Meson-Un-hardcode-building-a-shared-library.patch
new file mode 100644
index 0000000000..a93a1f7219
--- /dev/null
+++ b/package/libmanette/0001-Meson-Un-hardcode-building-a-shared-library.patch
@@ -0,0 +1,34 @@
+From 003c2e84d95357bbbef72fb395ef85f1650097a3 Mon Sep 17 00:00:00 2001
+From: Adrian Perez de Castro <aperez@igalia.com>
+Date: Fri, 23 Sep 2022 14:35:51 +0300
+Subject: [PATCH] Meson: Un-hardcode building a shared library
+
+Use library() instead of shared_library() to allow specifying which kind
+of library to build with "meson setup --default-library ..."
+
+This allows more easily incorporating libmanette in an application e.g.
+as a Meson subproject which gets built into a program as a static
+library.
+
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+[Upstream status: https://gitlab.gnome.org/GNOME/libmanette/-/merge_requests/84]
+---
+ src/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/meson.build b/src/meson.build
+index c140cac..b71d090 100644
+--- a/src/meson.build
++++ b/src/meson.build
+@@ -63,7 +63,7 @@ if gudev.found()
+   libmanette_deps += [ gudev ]
+ endif
+ 
+-libmanette_lib = shared_library(
++libmanette_lib = library(
+   libmanette_module,
+   libmanette_sources,
+   c_args: libmanette_c_args,
+-- 
+2.37.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
