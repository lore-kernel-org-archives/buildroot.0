Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FDE7C433F5
	for <buildroot@archiver.kernel.org>; Fri, 30 Sep 2022 15:49:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DCFA611B8;
	Fri, 30 Sep 2022 15:49:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DCFA611B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OBdF7Hz9PwPI; Fri, 30 Sep 2022 15:49:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 910E2611AE;
	Fri, 30 Sep 2022 15:49:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 910E2611AE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 117D41BF3DE
 for <buildroot@lists.busybox.net>; Fri, 30 Sep 2022 15:49:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0EDC4112B
 for <buildroot@lists.busybox.net>; Fri, 30 Sep 2022 15:49:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0EDC4112B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P15UJJ944U2u for <buildroot@lists.busybox.net>;
 Fri, 30 Sep 2022 15:49:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D22A54102B
 for <buildroot@buildroot.org>; Fri, 30 Sep 2022 15:49:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D22A54102B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE7B4866D4; Fri, 30 Sep 2022 15:49:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 30 Sep 2022 17:46:13 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 4cc3e577aaaeec8f0001af5adcdf2bee4683b402
X-Git-Newrev: 10932e5fca6c9eb0b48d41fc849a30d50bad325e
X-Patchwork-Hint: ignore
Message-Id: <20220930154903.BE7B4866D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/freetype: fix
 CVE-2022-27404, CVE-2022-27405, CVE-2022-27406
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

commit: https://git.buildroot.net/buildroot/commit/?id=10932e5fca6c9eb0b48d41fc849a30d50bad325e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

This fixes CVE-2022-27404, CVE-2022-27405, CVE-2022-27406 by backporting
patches from master branch.

Cc: Quentin Schulz <foss+buildroot@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-sfnt-Avoid-invalid-face-index.patch       | 46 ++++++++++++++++++++++
 ...objs.c-ft_open_face_internal-Properly-gua.patch | 39 ++++++++++++++++++
 ...-ftobjs.c-FT_Request_Size-Guard-face-size.patch | 30 ++++++++++++++
 package/freetype/freetype.mk                       |  7 ++++
 4 files changed, 122 insertions(+)

diff --git a/package/freetype/0001-sfnt-Avoid-invalid-face-index.patch b/package/freetype/0001-sfnt-Avoid-invalid-face-index.patch
new file mode 100644
index 0000000000..e7410afd30
--- /dev/null
+++ b/package/freetype/0001-sfnt-Avoid-invalid-face-index.patch
@@ -0,0 +1,46 @@
+From 818eea8aa682f867e4fbeb9794959a28864e4acc Mon Sep 17 00:00:00 2001
+From: Werner Lemberg <wl@gnu.org>
+Date: Thu, 17 Mar 2022 19:24:16 +0100
+Subject: [PATCH] [sfnt] Avoid invalid face index.
+
+Fixes #1138.
+
+* src/sfnt/sfobjs.c (sfnt_init_face), src/sfnt/sfwoff2.c (woff2_open_font):
+Check `face_index` before decrementing.
+
+Backport: https://gitlab.freedesktop.org/freetype/freetype/-/commit/53dfdcd8198d2b3201a23c4bad9190519ba918db
+Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
+---
+ src/sfnt/sfobjs.c  | 2 +-
+ src/sfnt/sfwoff2.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/sfnt/sfobjs.c b/src/sfnt/sfobjs.c
+index 789102479..ea17ca8f4 100644
+--- a/src/sfnt/sfobjs.c
++++ b/src/sfnt/sfobjs.c
+@@ -566,7 +566,7 @@
+     face_index = FT_ABS( face_instance_index ) & 0xFFFF;
+ 
+     /* value -(N+1) requests information on index N */
+-    if ( face_instance_index < 0 )
++    if ( face_instance_index < 0 && face_index > 0 )
+       face_index--;
+ 
+     if ( face_index >= face->ttc_header.count )
+diff --git a/src/sfnt/sfwoff2.c b/src/sfnt/sfwoff2.c
+index 5ee8dea28..2da697d69 100644
+--- a/src/sfnt/sfwoff2.c
++++ b/src/sfnt/sfwoff2.c
+@@ -2086,7 +2086,7 @@
+     /* Validate requested face index. */
+     *num_faces = woff2.num_fonts;
+     /* value -(N+1) requests information on index N */
+-    if ( *face_instance_index < 0 )
++    if ( *face_instance_index < 0 && face_index > 0 )
+       face_index--;
+ 
+     if ( face_index >= woff2.num_fonts )
+-- 
+2.37.3
+
diff --git a/package/freetype/0002-src-base-ftobjs.c-ft_open_face_internal-Properly-gua.patch b/package/freetype/0002-src-base-ftobjs.c-ft_open_face_internal-Properly-gua.patch
new file mode 100644
index 0000000000..75a071fc26
--- /dev/null
+++ b/package/freetype/0002-src-base-ftobjs.c-ft_open_face_internal-Properly-gua.patch
@@ -0,0 +1,39 @@
+From edbc2be0ccac0d524de82b5f9737d7f070dbf8cd Mon Sep 17 00:00:00 2001
+From: Werner Lemberg <wl@gnu.org>
+Date: Sat, 19 Mar 2022 06:40:17 +0100
+Subject: [PATCH] * src/base/ftobjs.c (ft_open_face_internal): Properly guard
+ `face_index`.
+
+We must ensure that the cast to `FT_Int` doesn't change the sign.
+
+Fixes #1139.
+
+Backport: https://gitlab.freedesktop.org/freetype/freetype/-/commit/22a0cccb4d9d002f33c1ba7a4b36812c7d4f46b5
+Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
+---
+ src/base/ftobjs.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/src/base/ftobjs.c b/src/base/ftobjs.c
+index 883f1a897..e00dcc57b 100644
+--- a/src/base/ftobjs.c
++++ b/src/base/ftobjs.c
+@@ -2451,6 +2451,15 @@
+ #endif
+ 
+ 
++    /* only use lower 31 bits together with sign bit */
++    if ( face_index > 0 )
++      face_index &= 0x7FFFFFFFL;
++    else
++    {
++      face_index &= 0x7FFFFFFFL;
++      face_index  = -face_index;
++    }
++
+ #ifdef FT_DEBUG_LEVEL_TRACE
+     FT_TRACE3(( "FT_Open_Face: " ));
+     if ( face_index < 0 )
+-- 
+2.37.3
+
diff --git a/package/freetype/0003-src-base-ftobjs.c-FT_Request_Size-Guard-face-size.patch b/package/freetype/0003-src-base-ftobjs.c-FT_Request_Size-Guard-face-size.patch
new file mode 100644
index 0000000000..65d9fb1954
--- /dev/null
+++ b/package/freetype/0003-src-base-ftobjs.c-FT_Request_Size-Guard-face-size.patch
@@ -0,0 +1,30 @@
+From f975217879490247cf8622c65cfef73b5642e787 Mon Sep 17 00:00:00 2001
+From: Werner Lemberg <wl@gnu.org>
+Date: Sat, 19 Mar 2022 09:37:28 +0100
+Subject: [PATCH] * src/base/ftobjs.c (FT_Request_Size): Guard `face->size`.
+
+Fixes #1140.
+
+Backport: https://gitlab.freedesktop.org/freetype/freetype/-/commit/0c2bdb01a2e1d24a3e592377a6d0822856e10df2
+Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
+---
+ src/base/ftobjs.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/base/ftobjs.c b/src/base/ftobjs.c
+index e00dcc57b..46baf5fed 100644
+--- a/src/base/ftobjs.c
++++ b/src/base/ftobjs.c
+@@ -3332,6 +3332,9 @@
+     if ( !face )
+       return FT_THROW( Invalid_Face_Handle );
+ 
++    if ( !face->size )
++      return FT_THROW( Invalid_Size_Handle );
++
+     if ( !req || req->width < 0 || req->height < 0 ||
+          req->type >= FT_SIZE_REQUEST_TYPE_MAX )
+       return FT_THROW( Invalid_Argument );
+-- 
+2.37.3
+
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 912e6c4daa..4d06ae964a 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -15,6 +15,13 @@ FREETYPE_CPE_ID_VENDOR = freetype
 FREETYPE_DEPENDENCIES = host-pkgconf
 FREETYPE_CONFIG_SCRIPTS = freetype-config
 
+# 0001-sfnt-Avoid-invalid-face-index.patch
+FREETYPE_IGNORE_CVES += CVE-2022-27404
+# 0002-src-base-ftobjs.c-ft_open_face_internal-Properly-gua.patch
+FREETYPE_IGNORE_CVES += CVE-2022-27405
+# 0003-src-base-ftobjs.c-FT_Request_Size-Guard-face-size.patch
+FREETYPE_IGNORE_CVES += CVE-2022-27406
+
 # harfbuzz already depends on freetype so disable harfbuzz in freetype to avoid
 # a circular dependency
 FREETYPE_CONF_OPTS = --without-harfbuzz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
