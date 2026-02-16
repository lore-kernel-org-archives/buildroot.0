Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A687FE83830
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 20:28:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46C1260BB0;
	Mon, 16 Feb 2026 20:28:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q1nFBmTpjiXO; Mon, 16 Feb 2026 20:28:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C51360D7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771273734;
	bh=Zt9BGs0+H5xyr+KBMvYOVfSAjI5Bb3WQ4MMrbvOk0lM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Q3cCr1Jwa4Wk6r5X3JcAX+rmw78u4jkXLDarxhD5029eUkN6QbjZ2ud2/29F2F/VQ
	 EJip+xKlip5X6z/rbW4qOf3mtxUPfcrBCFjYivGXRqwppUahfJ0ti/O4lSD2lazbW1
	 mI7UrqqP3XU6omsyMut3McmAv1vr+8dkIqoNMBoNgDNJoWqXNXrLRuQGQYCggXqLEA
	 RD9pydgJp4XAxt24uMmwLzD/wMsVtBJScFW8OfeHyz1IpJtC26tJAMvpU7eijUXyja
	 +16GFpLTi6In6Y2UoKeBg4HW97edRufdQSeBzi7O9VOvHXYv8TAAAd8dpg/A/RINnK
	 VVkDuOr8imGYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C51360D7F;
	Mon, 16 Feb 2026 20:28:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6AC1D1EB
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 20:28:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C9EA83BD3
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 20:28:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uiLCi1sU5xpK for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 20:28:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AC08835E0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6AC08835E0
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 20:28:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 597EB86EF1; Mon, 16 Feb 2026 20:28:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 16 Feb 2026 21:19:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 31d58806d8113eba4f0cecb5b493eed575f42c46
X-Git-Newrev: 3b52fe6f2e0feb72e745991a1ad4645ffdc55713
X-Patchwork-Hint: ignore
Message-Id: <20260216202851.597EB86EF1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dtc: fix host build with glibc 2.43
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
Content-Type: multipart/mixed; boundary="===============7916855374836163039=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7916855374836163039==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3b52fe6f2e0feb72e745991a1ad4645ffdc55713
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

When trying to build host-dtc on a host with glibc 2.43, the build fails
on the following error:

  libfdt/fdt_overlay.c: In function ‘overlay_fixup_phandle’:
  libfdt/fdt_overlay.c:424:21: error: assignment discards ‘const’
  qualifier from pointer target type [-Werror=discarded-qualifiers]
    424 |                 sep = memchr(fixup_str, ':', fixup_len);
        |                     ^
  libfdt/fdt_overlay.c:434:21: error: assignment discards ‘const’
  qualifier from pointer target type [-Werror=discarded-qualifiers]
    434 |                 sep = memchr(name, ':', fixup_len);
        |                     ^
  fdtput.c: In function ‘create_node’:
  fdtput.c:235:11: error: assignment discards ‘const’ qualifier from
  pointer target type [-Werror=discarded-qualifiers]
    235 |         p = strrchr(node_name, '/');
        |           ^
  cc1: all warnings being treated as errors
  make[2]: *** [Makefile:359: fdtput.o] Error 1
  make[2]: *** Waiting for unfinished jobs....
  cc1: all warnings being treated as errors
  make[2]: *** [Makefile:359: libfdt/fdt_overlay.o] Error 1
  make[1]: *** [package/pkg-generic.mk:273:
  /home/alexis/src/buildroot/dtc/build/host-dtc-1.7.2/.stamp_built] Error 2
  make: *** [Makefile:83: _all] Error 2

The issue can be reproduced on master with this minimal defconfig on a
host having glibc 2.43:

  BR2_x86_64=y
  BR2_TOOLCHAIN_EXTERNAL=y
  BR2_PACKAGE_QORIQ_MC_UTILS=y

(QORIQ_MC_UTILS will pull HOST_DTC)

This error is due to some functions prototype update in glibc 2.43 for
ISO C23 (see [1], point 3 in the NEWS list). The corresponding fix has
already been integrated upstream, but it has not been released since
then.

Bring the corresponding upstream patch to allow host-dtc to build on
affected hosts.

[1] https://lists.gnu.org/archive/html/info-gnu/2026-01/msg00005.html

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../dtc/0002-fix-discarded-const-qualifiers.patch  | 88 ++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/package/dtc/0002-fix-discarded-const-qualifiers.patch b/package/dtc/0002-fix-discarded-const-qualifiers.patch
new file mode 100644
index 0000000000..95db886389
--- /dev/null
+++ b/package/dtc/0002-fix-discarded-const-qualifiers.patch
@@ -0,0 +1,88 @@
+From 9a1c801a1a3c102bf95c5339c9e985b26b823a21 Mon Sep 17 00:00:00 2001
+From: Stephen Gallagher <sgallagh@redhat.com>
+Date: Tue, 6 Jan 2026 14:19:30 -0500
+Subject: Fix discarded const qualifiers
+
+It's unsafe to implicitly discard the const qualifier on a pointer. In
+overlay_fixup_phandle(), this was probably just an oversight, and making
+the "sep" variable a const char * is sufficient to fix it.
+
+In create_node(), however, the "p" variable is directly modifying the
+buffer pointed to by "const char* node_name". To fix this, we need to
+actually make a duplicate of the buffer and operate on that instead.
+
+This introduces a malloc()/free()  and an unbounded strdup() into the
+operation, but fdtput isn't a long-running service and the node_name
+argument comes directly from argv, so this shouldn't introduce a
+significant performance impact.
+
+Signed-off-by: Stephen Gallagher <sgallagh@redhat.com>
+Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
+Upstream: https://git.kernel.org/pub/scm/utils/dtc/dtc.git/commit/?id=9a1c801a1a3c102bf95c5339c9e985b26b823a21
+Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
+
+---
+ fdtput.c             | 8 +++++---
+ libfdt/fdt_overlay.c | 3 ++-
+ meson.build          | 1 +
+ 3 files changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/fdtput.c b/fdtput.c
+index 05f2b93..fdb581a 100644
+--- a/fdtput.c
++++ b/fdtput.c
+@@ -254,19 +254,21 @@ static int create_paths(char **blob, const char *in_path)
+ static int create_node(char **blob, const char *node_name)
+ {
+ 	int node = 0;
+-	char *p;
++	const char *p;
++	char *path = NULL;
+ 
+ 	p = strrchr(node_name, '/');
+ 	if (!p) {
+ 		report_error(node_name, -1, -FDT_ERR_BADPATH);
+ 		return -1;
+ 	}
+-	*p = '\0';
+ 
+ 	*blob = realloc_node(*blob, p + 1);
+ 
+ 	if (p > node_name) {
+-		node = fdt_path_offset(*blob, node_name);
++		path = xstrndup(node_name, (size_t)(p - node_name));
++		node = fdt_path_offset(*blob, path);
++		free(path);
+ 		if (node < 0) {
+ 			report_error(node_name, -1, node);
+ 			return -1;
+diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
+index e6b9eb6..51a3859 100644
+--- a/libfdt/fdt_overlay.c
++++ b/libfdt/fdt_overlay.c
+@@ -407,7 +407,8 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
+ 		const char *fixup_str = value;
+ 		uint32_t path_len, name_len;
+ 		uint32_t fixup_len;
+-		char *sep, *endptr;
++		const char *sep;
++		char *endptr;
+ 		int poffset, ret;
+ 
+ 		fixup_end = memchr(value, '\0', len);
+diff --git a/meson.build b/meson.build
+index 66b44e8..501b706 100644
+--- a/meson.build
++++ b/meson.build
+@@ -18,6 +18,7 @@ add_project_arguments(
+     '-Wshadow',
+     '-Wsuggest-attribute=format',
+     '-Wwrite-strings',
++    '-Wdiscarded-qualifiers',
+   ]),
+   language: 'c'
+ )
+-- 
+cgit 1.2.3-korg
+
+

--===============7916855374836163039==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7916855374836163039==--
