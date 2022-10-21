Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB138C38A2D
	for <buildroot@archiver.kernel.org>; Fri, 21 Oct 2022 19:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9936F84438;
	Fri, 21 Oct 2022 19:51:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9936F84438
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3XjNuvMkH2N3; Fri, 21 Oct 2022 19:51:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C488842E4;
	Fri, 21 Oct 2022 19:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C488842E4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A5E3E1BF846
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 19:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FB89842BB
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 19:51:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FB89842BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k4MEcQil5xSh for <buildroot@lists.busybox.net>;
 Fri, 21 Oct 2022 19:51:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A21CB842E3
 for <buildroot@buildroot.org>; Fri, 21 Oct 2022 19:51:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A21CB842E3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8CB5D86F78; Fri, 21 Oct 2022 19:51:23 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 21 Oct 2022 21:02:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 822cc1ebc42cc43877a20ca51d94689aed3e4424
X-Git-Newrev: 9d948e1b34e4e6e199111feb29803d14dbfc120b
X-Patchwork-Hint: ignore
Message-Id: <20221021195123.8CB5D86F78@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain: support gconv modules from
 glibc >= 2.34
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

commit: https://git.buildroot.net/buildroot/commit/?id=9d948e1b34e4e6e199111feb29803d14dbfc120b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Startig with glibc 2.34, the gconv modules description has been split in
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
