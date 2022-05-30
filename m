Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D7FC433EF
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 20:26:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16D6741960;
	Mon, 30 May 2022 20:26:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dMw984Xvg83u; Mon, 30 May 2022 20:26:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57FC141A62;
	Mon, 30 May 2022 20:26:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 377331BF97C
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 263458412C
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:26:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xKEc1qA_nRfq for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 20:26:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C2A184122
 for <buildroot@buildroot.org>; Mon, 30 May 2022 20:26:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9CF76867B3; Mon, 30 May 2022 20:14:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 30 May 2022 22:26:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1d969398e4eda833734bab9744078cce434d8db2
X-Git-Newrev: 9eeb5cd96dcfb6b579eb745ee5f7e76fcdc51251
X-Patchwork-Hint: ignore
Message-Id: <20220530201450.9CF76867B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fbv: fix build with giflib and gcc
 >= 10
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9eeb5cd96dcfb6b579eb745ee5f7e76fcdc51251
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with giflib and gcc >= 10:

/nvmedata/autobuild/instance-30/output-1/per-package/fbv/host/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/11.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: gif.o: in function `fh_gif_load':
gif.c:(.text+0x338): undefined reference to `m_rend_gif_decodecolormap'

Fixes:
 - http://autobuild.buildroot.org/results/dca603a61b1fd0558992b4a40152d23b5b9c0049

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fbv/0007-gif.c-fic-build-with-gcc-10.patch | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/fbv/0007-gif.c-fic-build-with-gcc-10.patch b/package/fbv/0007-gif.c-fic-build-with-gcc-10.patch
new file mode 100644
index 0000000000..57d5777b61
--- /dev/null
+++ b/package/fbv/0007-gif.c-fic-build-with-gcc-10.patch
@@ -0,0 +1,36 @@
+From 8877207b290da1c3bc100f2705c30e6bdafcd985 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 26 May 2022 23:59:46 +0200
+Subject: [PATCH] gif.c: fic build with gcc >= 10
+
+Fix the following build failure with gcc >= 10::
+
+/nvmedata/autobuild/instance-30/output-1/per-package/fbv/host/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/11.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: gif.o: in function `fh_gif_load':
+gif.c:(.text+0x338): undefined reference to `m_rend_gif_decodecolormap'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/dca603a61b1fd0558992b4a40152d23b5b9c0049
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not upstreamable (most active fork dropped gif
+support: https://github.com/godspeed1989/fbv/pull/17)]
+---
+ gif.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gif.c b/gif.c
+index 689e549..5560f25 100644
+--- a/gif.c
++++ b/gif.c
+@@ -48,7 +48,7 @@ int fh_gif_id(char *name)
+     return(0);
+ }
+ 
+-inline void m_rend_gif_decodecolormap(unsigned char *cmb,unsigned char *rgbb,ColorMapObject *cm,int s,int l, int transparency)
++static inline void m_rend_gif_decodecolormap(unsigned char *cmb,unsigned char *rgbb,ColorMapObject *cm,int s,int l, int transparency)
+ {
+     GifColorType *cmentry;
+     int i;
+-- 
+2.35.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
