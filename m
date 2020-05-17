From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 May 2020 23:41:38 +0200
Subject: [Buildroot] [PATCH 2/4 v2] support/docker: add script to generate
 docker iamges
In-Reply-To: <cover.1589751688.git.yann.morin.1998@free.fr>
References: <cover.1589751688.git.yann.morin.1998@free.fr>
Message-ID: <b7c22346be9c030f714864671b2ea334c20c5142.1589751688.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/docker/build-all | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100755 support/docker/build-all

diff --git a/support/docker/build-all b/support/docker/build-all
new file mode 100755
index 0000000000..4f3217e7fe
--- /dev/null
+++ b/support/docker/build-all
@@ -0,0 +1,17 @@
+#!/bin/sh
+set -e
+
+BR2_DOCKER_VERSION="${1}"
+
+if [ -z "${BR2_DOCKER_VERSION}" ]; then
+    printf "Usage: ${0} VERSION\n"
+    exit 1
+fi
+
+CONTEXT_DIR="${0%/*}"
+for d in "${CONTEXT_DIR}"/Dockerfile.*; do \
+    distro="${d#*/Dockerfile.}"
+    docker build \
+        -t "buildroot/${distro}:${BR2_DOCKER_VERSION}" \
+        -f "${d}" "${CONTEXT_DIR}"
+done
-- 
2.20.1
