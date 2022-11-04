Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C8FAC433FE
	for <buildroot@archiver.kernel.org>; Fri,  4 Nov 2022 07:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4ED440B5C;
	Fri,  4 Nov 2022 07:53:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4ED440B5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qziFv0jXYoAv; Fri,  4 Nov 2022 07:53:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2469404F1;
	Fri,  4 Nov 2022 07:53:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2469404F1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 673E21BF976
 for <buildroot@lists.busybox.net>; Fri,  4 Nov 2022 07:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40A7F6104D
 for <buildroot@lists.busybox.net>; Fri,  4 Nov 2022 07:52:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40A7F6104D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BRh0CrcYEkDG for <buildroot@lists.busybox.net>;
 Fri,  4 Nov 2022 07:52:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6122A61038
 for <buildroot@buildroot.org>; Fri,  4 Nov 2022 07:52:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6122A61038
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5138A87D80; Fri,  4 Nov 2022 07:52:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 4 Nov 2022 08:41:54 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 89fa62f1ae6dc06b9b70a30f5394b20cc248977c
X-Git-Newrev: 311c54f1925519f8740546c59b4c66c9610692ca
X-Patchwork-Hint: ignore
Message-Id: <20221104075258.5138A87D80@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] toolchain: support gconv
 modules from glibc >= 2.34
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

commit: https://git.buildroot.net/buildroot/commit/?id=311c54f1925519f8740546c59b4c66c9610692ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Starting with glibc 2.34, the gconv modules description has been split in
two:
  - a common definition in the old location, /usr/lib/gconv/gconv-modules
  - specific definitions in a subdirectory, /usr/lib/gconv/gconv-modules.d/

This is done so as to simplify the handling of glibc gconv modules, and
eventually to segregate those outside of glibc, and so that third-parties
may also provide their own gconv converters and their definitions.

And starting with that same glibc version, most of the gconv modules
definitions are moved to an extra configuration file in that
sub-directory.

It is thus no longer possible to use special code pages, like cp850,
which are very useful to access FAT-formatted devices.

Add support for this new gconv layout, while keeping support for older
glibc versions. Note that the modules themselves are not moved or
renamed, just the definition files have changed.

Instead of passing the one old gonv modules definitions file on stdin,
we pass the base directory to that file, and move into the script the
responsibility to find all the gconv definition files.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9d948e1b34e4e6e199111feb29803d14dbfc120b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/expunge-gconv-modules | 22 ++++++++++++++++------
 toolchain/toolchain.mk                |  9 +++++++--
 2 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/support/scripts/expunge-gconv-modules b/support/scripts/expunge-gconv-modules
index bc60fc0ce4..e9ac48ca3f 100755
--- a/support/scripts/expunge-gconv-modules
+++ b/support/scripts/expunge-gconv-modules
@@ -1,11 +1,17 @@
 #!/usr/bin/env bash
 
 # This script is used to generate a gconv-modules file that takes into
-# account only the gconv modules installed by Buildroot. It receives
-# on its standard input the original complete gconv-modules file from
-# the toolchain, and as arguments the list of gconv modules that were
-# actually installed, and writes on its standard output the new
-# gconv-modules file.
+# account only the gconv modules installed by Buildroot, and generates
+# a stripped-down gconv-moduels file on its stdout.
+# It takes two arguments:
+#   $1: the directory where to look for gconv modules definitions
+#   $2: a space-separated list of gconv modules that were actually
+#       installed
+
+# Starting with glibc-2.34, modules definitions are located in multiple
+# files:
+#   ${1}/gconv-modules
+#   ${1}/gconv-modules.d/*.conf
 
 # The format of gconv-modules is precisely documented in the
 # file itself. It consists of two different directives:
@@ -19,7 +25,11 @@
 # we handle each with slightly different code, since the second never has
 # associated aliases.
 
-awk -v files="${2}" '
+for f in ${1}/gconv-modules ${1}/gconv-modules.d/*.conf; do
+    [ -e "${f}" ] || continue
+    cat "${f}"
+done \
+|awk -v files="${2}" '
 $1 == "alias" {
     aliases[$3] = aliases[$3] " " $2;
 }
diff --git a/toolchain/toolchain.mk b/toolchain/toolchain.mk
index 08d1649603..fe87a72ed4 100644
--- a/toolchain/toolchain.mk
+++ b/toolchain/toolchain.mk
@@ -27,6 +27,10 @@ define TOOLCHAIN_GLIBC_COPY_GCONV_LIBS
 		$(INSTALL) -m 0644 $(STAGING_DIR)/usr/lib/$${d}/gconv/*.so \
 				   $(TARGET_DIR)/usr/lib/gconv \
 		|| exit 1; \
+		if [ -d $(STAGING_DIR)/usr/lib/$${d}/gconv/gconv-modules.d ]; then \
+			cp -a $(STAGING_DIR)/usr/lib/$${d}/gconv/gconv-modules.d \
+				$(TARGET_DIR)/usr/lib/gconv/ || exit 1; \
+		fi; \
 	else \
 		for l in $(TOOLCHAIN_GLIBC_GCONV_LIBS); do \
 			$(INSTALL) -m 0644 -D $(STAGING_DIR)/usr/lib/$${d}/gconv/$${l}.so \
@@ -41,8 +45,9 @@ define TOOLCHAIN_GLIBC_COPY_GCONV_LIBS
 				 || exit 1; \
 			done; \
 		done; \
-		./support/scripts/expunge-gconv-modules "$(TOOLCHAIN_GLIBC_GCONV_LIBS)" \
-			<$(STAGING_DIR)/usr/lib/$${d}/gconv/gconv-modules \
+		./support/scripts/expunge-gconv-modules \
+			$(STAGING_DIR)/usr/lib/$${d}/gconv \
+			"$(TOOLCHAIN_GLIBC_GCONV_LIBS)" \
 			>$(TARGET_DIR)/usr/lib/gconv/gconv-modules; \
 	fi
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
