From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 18 Dec 2019 21:39:04 +0100
Subject: [Buildroot] [PATCH 2/5] core/dependencies: check if we need to
 build our own host-coreutils
In-Reply-To: <cover.1576701539.git.yann.morin.1998@free.fr>
References: <cover.1576701539.git.yann.morin.1998@free.fr>
Message-ID: <eb8d3816d6cf3097e6584ff4cb7ac50db83a0b30.1576701539.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/dependencies/check-host-coreutils.mk |  6 ++++++
 support/dependencies/check-host-coreutils.sh | 12 ++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 support/dependencies/check-host-coreutils.mk
 create mode 100755 support/dependencies/check-host-coreutils.sh

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
-- 
2.20.1
