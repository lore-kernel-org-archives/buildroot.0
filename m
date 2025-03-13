Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85244C35FF1
	for <buildroot@archiver.kernel.org>; Thu, 13 Mar 2025 20:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57A0541796;
	Thu, 13 Mar 2025 20:49:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vDenjwTA454c; Thu, 13 Mar 2025 20:49:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FD29417CF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FD29417CF;
	Thu, 13 Mar 2025 20:49:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 33C64116
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 20:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F5C040486
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 20:49:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XyC7tyaBW7kQ for <buildroot@buildroot.org>;
 Thu, 13 Mar 2025 20:48:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D96A141759
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D96A141759
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 20:48:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C846387FBD; Thu, 13 Mar 2025 20:48:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 13 Mar 2025 21:36:52 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: f95260e2dc15d79047913eec8e61c9dd87b7b70c
X-Git-Newrev: 9b3d080b62bf6790d6183c93ab5482513ab6f5a0
X-Patchwork-Hint: ignore
Message-Id: <20250313204858.C846387FBD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/pkgconf: fix
 sysroot being prepended twice to the pkgdatadir path
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

commit: https://git.buildroot.net/buildroot/commit/?id=9b3d080b62bf6790d6183c93ab5482513ab6f5a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

When building webkit, I got this build error:

>>> webkitgtk 2.46.3 Building
GIT_DIR=. PATH="/home/thomas/br-test-pkg/bootlin-armv5-uclibc/host/bin:/home/thomas/br-test-pkg/bootlin-armv5-uclibc/host/sbin:/home/thomas/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin"
 /home/thomas/.local/bin/cmake --build
/home/thomas/br-test-pkg/bootlin-armv5-uclibc/build/webkitgtk-2.46.3/
-j25
ninja: error: '/home/thomas/br-test-pkg/bootlin-armv5-uclibc/host/arm-buildroot-linux-uclibcgnueabi/sysroot/home/thomas/br-test-pkg/bootlin-armv5-uclibc/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/share/wayland-protocols/unstable/pointer-constraints/pointer-constraints-unstable-v1.xml',
needed by 'WebKitGTK/DerivedSources/pointer-constraints-unstable-v1-protocol.c',
missing and no known rule to make it
make[1]: *** [package/pkg-generic.mk:289:
/home/thomas/br-test-pkg/bootlin-armv5-uclibc/build/webkitgtk-2.46.3/.stamp_built]
Error 1
make: *** [Makefile:83: _all] Error 2

The sysroot path is prepended twice to the path. This error persists
since a3b2bc8 "package/pkgconf: bump to version 2.3.0".

After digging into it, I found out that dropping "pkgdatadir" from the
patch does fix it. This is, in fact, the same, or similar problem that
was fixed in 3e74c13 "package/pkgconf: variable pkgdatadir also needs
sysroot prefixing, wayland patch III" years ago.

I was not able to find out which pkgconf commit caused the behavior
change. Commit a3b2bc8 bumped it from 1.6.3 to 2.3.0, which is a
considerable big change.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 139b580ca4aea35f5c451bce4a1b42da4cec2209)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ix-with-the-sysroot-a-subset-of-variables.patch | 25 +++++++++++-----------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/package/pkgconf/0001-Only-prefix-with-the-sysroot-a-subset-of-variables.patch b/package/pkgconf/0001-Only-prefix-with-the-sysroot-a-subset-of-variables.patch
index d25039ade2..986058d400 100644
--- a/package/pkgconf/0001-Only-prefix-with-the-sysroot-a-subset-of-variables.patch
+++ b/package/pkgconf/0001-Only-prefix-with-the-sysroot-a-subset-of-variables.patch
@@ -1,4 +1,4 @@
-From c1f9e60f46f2207f9dd07dd290ad5a2da05ad41d Mon Sep 17 00:00:00 2001
+From c912e9bb8d5be414fda74b2019deb2a6d2d041a0 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Sun, 16 Dec 2018 11:52:18 +0100
 Subject: [PATCH] Only prefix with the sysroot a subset of variables
@@ -22,15 +22,17 @@ Buildroot development. All other paths are not prefixed by the sysroot.
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 [Updated to include gobject-introspection paths]
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
+[Dropped the pkgdatadir path]
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
 ---
- libpkgconf/tuple.c | 65 ++++++++++++++++++++++++++++++++--------------
- 1 file changed, 46 insertions(+), 19 deletions(-)
+ libpkgconf/tuple.c | 64 ++++++++++++++++++++++++++++++++--------------
+ 1 file changed, 45 insertions(+), 19 deletions(-)
 
 diff --git a/libpkgconf/tuple.c b/libpkgconf/tuple.c
-index 83f6a47..a2aa427 100644
+index 83f6a47..d56fcec 100644
 --- a/libpkgconf/tuple.c
 +++ b/libpkgconf/tuple.c
-@@ -178,6 +178,21 @@ dequote(const char *value)
+@@ -178,6 +178,20 @@ dequote(const char *value)
  	return buf;
  }
  
@@ -44,7 +46,6 @@ index 83f6a47..a2aa427 100644
 +	"includedir",
 +	"libdir",
 +	"mapdir",
-+	"pkgdatadir",
 +	"sdkdir",
 +	NULL,
 +};
@@ -52,7 +53,7 @@ index 83f6a47..a2aa427 100644
  static const char *
  find_sysroot(const pkgconf_client_t *client, pkgconf_list_t *vars)
  {
-@@ -237,14 +252,20 @@ pkgconf_tuple_add(const pkgconf_client_t *client, pkgconf_list_t *list, const ch
+@@ -237,14 +251,20 @@ pkgconf_tuple_add(const pkgconf_client_t *client, pkgconf_list_t *list, const ch
  {
  	char *dequote_value;
  	pkgconf_tuple_t *tuple = calloc(1, sizeof(pkgconf_tuple_t));
@@ -74,7 +75,7 @@ index 83f6a47..a2aa427 100644
  	else
  		tuple->value = strdup(dequote_value);
  
-@@ -294,22 +315,8 @@ pkgconf_tuple_find(const pkgconf_client_t *client, pkgconf_list_t *list, const c
+@@ -294,22 +314,8 @@ pkgconf_tuple_find(const pkgconf_client_t *client, pkgconf_list_t *list, const c
  	return NULL;
  }
  
@@ -99,7 +100,7 @@ index 83f6a47..a2aa427 100644
  {
  	char buf[PKGCONF_BUFSIZE];
  	const char *ptr;
-@@ -318,7 +325,7 @@ pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const
+@@ -318,7 +324,7 @@ pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const
  	if (!(client->flags & PKGCONF_PKG_PKGF_FDO_SYSROOT_RULES) &&
  		(!(flags & PKGCONF_PKG_PROPF_UNINSTALLED) || (client->flags & PKGCONF_PKG_PKGF_PKGCONF1_SYSROOT_RULES)))
  	{
@@ -108,7 +109,7 @@ index 83f6a47..a2aa427 100644
  			bptr += pkgconf_strlcpy(buf, client->sysroot_dir, sizeof buf);
  	}
  
-@@ -381,7 +388,7 @@ pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const
+@@ -381,7 +387,7 @@ pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const
  				{
  					size_t nlen;
  
@@ -117,7 +118,7 @@ index 83f6a47..a2aa427 100644
  					nlen = pkgconf_strlcpy(bptr, parsekv, remain);
  					free(parsekv);
  
-@@ -432,6 +439,26 @@ pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const
+@@ -432,6 +438,26 @@ pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const
  	return strdup(buf);
  }
  
@@ -145,5 +146,5 @@ index 83f6a47..a2aa427 100644
   * !doc
   *
 -- 
-2.34.1
+2.43.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
