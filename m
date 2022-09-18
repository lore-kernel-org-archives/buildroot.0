Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E46C32771
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 11:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07AED40951;
	Sun, 18 Sep 2022 11:38:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07AED40951
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XVq4UuoxZwZl; Sun, 18 Sep 2022 11:38:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3E6540907;
	Sun, 18 Sep 2022 11:38:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3E6540907
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DB4431BF3EE
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 11:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6D96404A0
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 11:38:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6D96404A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xSfLxaePNd7h for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 11:38:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DCF474011C
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 11:38:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCF474011C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C4E68850D6; Sun, 18 Sep 2022 11:38:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 13:27:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 15293e0360cffc8a5e33f57ef1b01a45f17b08d3
X-Git-Newrev: f2dc971589ee63ca939aa31809a2a4e49ce11c16
X-Patchwork-Hint: ignore
Message-Id: <20220918113809.C4E68850D6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdk-pixbuf: fix test compilation
 (don't build the test suite)
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

commit: https://git.buildroot.net/buildroot/commit/?id=f2dc971589ee63ca939aa31809a2a4e49ce11c16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Not needed + breaks compilation on some platforms.
The compilation error was seen on 2.42.8, but also relevant
for 2.42.9 to not compile the test suite.

The option was added in 2.42.9:
https://github.com/GNOME/gdk-pixbuf/commit/801eef111df624f4377baed9a90c94b6a2d4340c

```
[179/246] Generating tests/resources.c with a custom command
FAILED: tests/resources.c
/buildroot/output/host/bin/python3 /buildroot/output/build/host-gdk-pixbuf-2.42.8/build-aux/gen-resources.py --glib-compile-resources=/buildroot/output/host/bin/glib-compile-resources --pixdata=/buildroot/output/build/host-gdk-pixbuf-2.42.8/build/gdk-pixbuf/gdk-pixbuf-pixdata --loaders=/buildroot/output/build/host-gdk-pixbuf-2.42.8/build/gdk-pixbuf/loaders.cache --sourcedir=/buildroot/output/build/host-gdk-pixbuf-2.42.8/tests --source ../tests/resources.gresource.xml tests/resources.c
failed to load "/buildroot/output/build/host-gdk-pixbuf-2.42.8/tests/icc-profile.png": Couldn?t recognize the image file format for file ?/buildroot/output/build/host-gdk-pixbuf-2.42.8/tests/icc-profile.png?
../tests/resources.gresource.xml: Child process exited with code 1.
```

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdk-pixbuf/gdk-pixbuf.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 7a75ed23f6..4a513effbd 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -19,11 +19,13 @@ HOST_GDK_PIXBUF_DEPENDENCIES = host-libpng host-pkgconf host-libglib2
 
 GDK_PIXBUF_CONF_OPTS = \
 	-Dgio_sniffing=false \
+	-Dtests=false \
 	-Dinstalled_tests=false \
 	-Dman=false
 
 HOST_GDK_PIXBUF_CONF_OPTS = \
 	-Dgio_sniffing=false \
+	-Dtests=false \
 	-Dinstalled_tests=false \
 	-Dintrospection=disabled \
 	-Drelocatable=true \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
