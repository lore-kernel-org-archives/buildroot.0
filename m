From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Nov 2018 15:14:58 +0100
Subject: [Buildroot] [git commit] support/dependencies: add a check for a
 suitable gzip
Message-ID: <20181202071558.D40BD82855@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2218dc85bef9bb1c9d27788e5ac69593144fe268
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Recently, some hash mismatch have been reported, both by users as well
as autobuilder failures, about tarballs generated from git repositories.

This turned out to be caused by users having the 'gzip' command somehow
aliased to 'pigz' (which stand for: parallel implementation of gzip,
which takes advantage of multi-processor system to parallelise the
compression).

Unfortunately, the output of pigz-compressed archives differ from that
of gzip (even though they *are* valid gzip-compressed streams).

Add a dependency check that ensures that gzip is not pigz. If that is
the case, define a conditional dependency to host-gzip, that is used as
a download dependency for packages that will generate compressed files,
i.e. cvs, git, and svn.

Fixes:
    http://autobuild.buildroot.org/results/330/3308271fc641cadb59dbf1b5ee529a84f79e6d5c/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Marcin Niestr??j <m.niestroj@grinn-global.com>
Cc: Erico Nunes <nunes.erico@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-generic.mk                  |  4 +++-
 support/dependencies/check-host-gzip.mk |  3 +++
 support/dependencies/check-host-gzip.sh | 21 +++++++++++++++++++++
 3 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index f34f46afc8..ef890981bb 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -583,7 +583,9 @@ $(2)_DEPENDENCIES += host-skeleton
 endif
 
 ifneq ($$(filter cvs git svn,$$($(2)_SITE_METHOD)),)
-$(2)_DOWNLOAD_DEPENDENCIES += $(BR2_TAR_HOST_DEPENDENCY)
+$(2)_DOWNLOAD_DEPENDENCIES += \
+	$(BR2_GZIP_HOST_DEPENDENCY) \
+	$(BR2_TAR_HOST_DEPENDENCY)
 endif
 
 ifeq ($$(filter host-tar host-skeleton host-fakedate,$(1)),)
diff --git a/support/dependencies/check-host-gzip.mk b/support/dependencies/check-host-gzip.mk
new file mode 100644
index 0000000000..bf9a369a7d
--- /dev/null
+++ b/support/dependencies/check-host-gzip.mk
@@ -0,0 +1,3 @@
+ifeq (,$(call suitable-host-package,gzip))
+BR2_GZIP_HOST_DEPENDENCY = host-gzip
+endif
diff --git a/support/dependencies/check-host-gzip.sh b/support/dependencies/check-host-gzip.sh
new file mode 100755
index 0000000000..5f344c5f9b
--- /dev/null
+++ b/support/dependencies/check-host-gzip.sh
@@ -0,0 +1,21 @@
+#!/bin/sh
+
+candidate="$1" # ignored
+
+gzip="$(which gzip)"
+if [ ! -x "${gzip}" ]; then
+    # echo nothing: no suitable gzip found
+    exit 1
+fi
+
+# gzip displays its version string on stdout
+# pigz displays its version string on stderr
+version="$("${gzip}" --version 2>&1)"
+case "${version}" in
+  (*pigz*)
+    # echo nothing: no suitable gzip found
+    exit 1
+    ;;
+esac
+
+printf "%s" "${gzip}"
