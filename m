From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Jan 2020 21:43:38 +0100
Subject: [Buildroot] [git commit] core/dependencies: check if we need to
 build our own host-coreutils
Message-ID: <20200106203440.0DB9D80E2B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a95ea4b64dc9ca41b5ec94ec5aaf9937a3906709
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/dependencies/check-host-coreutils.mk |  6 ++++++
 support/dependencies/check-host-coreutils.sh | 12 ++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/support/dependencies/check-host-coreutils.mk b/support/dependencies/check-host-coreutils.mk
new file mode 100644
index 0000000000..87a3f446ea
--- /dev/null
+++ b/support/dependencies/check-host-coreutils.mk
@@ -0,0 +1,6 @@
+# Check whether the host's coreutils are up to date enough
+# to provide 'ln --relative' and 'realpath'.
+
+ifeq (,$(call suitable-host-package,coreutils))
+BR2_COREUTILS_HOST_DEPENDENCY = host-coreutils
+endif
diff --git a/support/dependencies/check-host-coreutils.sh b/support/dependencies/check-host-coreutils.sh
new file mode 100755
index 0000000000..4d36d74933
--- /dev/null
+++ b/support/dependencies/check-host-coreutils.sh
@@ -0,0 +1,12 @@
+#!/bin/sh
+
+# Exit on the first error
+set -e
+
+# Does ln supports the --relative/-r option?
+ln --relative --help >/dev/null 2>&1
+
+# Does realpath exist?
+realpath --help >/dev/null 2>&1
+
+echo OK
