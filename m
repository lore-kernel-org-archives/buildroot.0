From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 16 Nov 2018 16:27:19 +0100
Subject: [Buildroot] [PATCH] support/dependencies: add a check for a
 suitable gzip
Message-ID: <20181116152719.24591-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Recently, some hash mismatch have been reported, both by users as well
as autobuilder failures, about tarballs generated from git repositories.

This turned out to be caused by users having the 'gzip' command somehow
aliased to 'pigz' (which stand for: parallel implementation of gzip,
which takes advantage of multi-processor system to parallelise the
compression).

Unfortunately, the output of pigz-compressed archives differ from that
of gzip (even though they *are* valid gzip-compressed streams).

Add a dependency check that ensures that gzip is not pigz. If that is
the case, bail out and refuse to build.

This is a stop-gap measure in preparation of the release. A complete
solution would accept pigz as a decompressor (because that is totally
OK), and ensure that we do build a host-gzip package should that be
needed. This is a much bigger endeavour, so this simple solution is
deemed enough for the release (after all, use of pigz is just atypical
enough that it should not pose such a problem for users to reverti to
using plain gzip).

Fixes:
    http://autobuild.buildroot.org/results/330/3308271fc641cadb59dbf1b5ee529a84f79e6d5c/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Marcin Niestr?j <m.niestroj@grinn-global.com>
Cc: Erico Nunes <nunes.erico@gmail.com>
---
 support/dependencies/check-host-gzip.mk |  3 +++
 support/dependencies/check-host-gzip.sh | 21 +++++++++++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 support/dependencies/check-host-gzip.mk
 create mode 100755 support/dependencies/check-host-gzip.sh

diff --git a/support/dependencies/check-host-gzip.mk b/support/dependencies/check-host-gzip.mk
new file mode 100644
index 0000000000..867bbb04f8
--- /dev/null
+++ b/support/dependencies/check-host-gzip.mk
@@ -0,0 +1,3 @@
+ifeq (,$(call suitable-host-package,gzip))
+$(error No suitable gzip found)
+endif
diff --git a/support/dependencies/check-host-gzip.sh b/support/dependencies/check-host-gzip.sh
new file mode 100755
index 0000000000..350fe552d5
--- /dev/null
+++ b/support/dependencies/check-host-gzip.sh
@@ -0,0 +1,21 @@
+#!/bin/sh
+
+candidate="$1" # ignored
+
+gzip="$(which gzip)"
+if [ ! -x "${gzip}" ]; then
+    exit 1
+fi
+
+# gzip displays its version string on stdout
+# pigz displays its version string on stderr
+version="$("${gzip}" --version 2>&1)"
+case "${version}" in
+  (*pigz*)
+    printf "%s (%s) is not acceptable as a gzip implementation\n" \
+        "${gzip}" "${version}" >&2
+    exit 1
+    ;;
+esac
+
+printf "%s" "${gzip}"
-- 
2.14.1
