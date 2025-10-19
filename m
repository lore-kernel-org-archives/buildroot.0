Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 975A0CCD183
	for <buildroot@archiver.kernel.org>; Sun, 19 Oct 2025 13:39:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A11461134;
	Sun, 19 Oct 2025 13:39:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8i1p3mWZTFa2; Sun, 19 Oct 2025 13:39:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6F0F61126
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6F0F61126;
	Sun, 19 Oct 2025 13:39:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A059543F
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 13:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C94F41249
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 13:39:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1FqSodbUk59r for <buildroot@buildroot.org>;
 Sun, 19 Oct 2025 13:39:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87A98411E2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87A98411E2
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 13:39:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 75F9587554; Sun, 19 Oct 2025 13:39:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Oct 2025 14:32:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 99c5c21b14e86ef53520868a6bee672d6e249c3b
X-Git-Newrev: bd5934cd7e6bea10c0ce5d854e1e57962489c9ac
X-Patchwork-Hint: ignore
Message-Id: <20251019133932.75F9587554@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/siproxd: Add upstream patch to fix
 build with gcc >= 14
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
Content-Type: multipart/mixed; boundary="===============5599910297185109518=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5599910297185109518==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=bd5934cd7e6bea10c0ce5d854e1e57962489c9ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
https://autobuild.buildroot.net/results/679/679fe86eea2001aed2baf066abf3ae43b38567b5/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../siproxd/0001-Fix-compilation-on-gcc-14.patch   | 50 ++++++++++++++++++++++
 package/siproxd/siproxd.mk                         |  2 +
 2 files changed, 52 insertions(+)

diff --git a/package/siproxd/0001-Fix-compilation-on-gcc-14.patch b/package/siproxd/0001-Fix-compilation-on-gcc-14.patch
new file mode 100644
index 0000000000..0a55969703
--- /dev/null
+++ b/package/siproxd/0001-Fix-compilation-on-gcc-14.patch
@@ -0,0 +1,50 @@
+From 985c2cd198213b250c61d8c6621af52e318c4c12 Mon Sep 17 00:00:00 2001
+From: crumpled-acronym <60061744+crumpled-acronym@users.noreply.github.com>
+Date: Mon, 30 Jun 2025 12:32:02 +0200
+Subject: [PATCH] Fix compilation on gcc >= 14
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+`./configure` fails for gcc >= 14 with the following error
+
+```
+checking "libosip prefix"...
+checking for osip_init in -losip2... yes
+checking for parser_init in -losipparser2... yes
+checking libosip2 version > 3.0.0... *** ERROR: libosip2-3.x.x is required!
+```
+
+which in fact is caused by the test program in `ACX_CHECK_LIBOSIP_VERSION` function in `acinclude.m4` due to
+
+```
+conftest.c:4:3: error: return type defaults to ‘int’ [-Wimplicit-int]
+    4 | main() {
+      | ^~~~
+```
+
+This patch fixes the issue!
+
+Upstream: https://github.com/hb9xar/siproxd/commit/985c2cd198213b250c61d8c6621af52e318c4c12
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ acinclude.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/acinclude.m4 b/acinclude.m4
+index 6fa4828..8164246 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -340,7 +340,7 @@ dnl pointer to the structure (bad)
+ AC_COMPILE_IFELSE(
+ [AC_LANG_SOURCE([
+   #include <osipparser2/osip_parser.h>
+-  main() {
++  int main() {
+   osip_message_t t;
+   int  e;
+   e=t.contacts.nb_elt;
+-- 
+2.47.3
+
diff --git a/package/siproxd/siproxd.mk b/package/siproxd/siproxd.mk
index 228f0855a6..faabb68a24 100644
--- a/package/siproxd/siproxd.mk
+++ b/package/siproxd/siproxd.mk
@@ -12,6 +12,8 @@ SIPROXD_LICENSE_FILES = COPYING
 
 SIPROXD_DEPENDENCIES = libosip2 libtool sqlite
 
+# 0001-Fix-compilation-on-gcc-14.patch
+SIPROXD_AUTORECONF = YES
 SIPROXD_CONF_OPTS = --without-included-ltdl
 
 $(eval $(autotools-package))

--===============5599910297185109518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5599910297185109518==--
