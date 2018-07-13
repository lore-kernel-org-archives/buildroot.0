From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 13 Jul 2018 08:38:35 +0200
Subject: [Buildroot] [PATCH 1/5] core: add a rule to generate all our docker
 images
In-Reply-To: <cover.1531463897.git.yann.morin.1998@free.fr>
References: <cover.1531463897.git.yann.morin.1998@free.fr>
Message-ID: <eb30d1e5ea7357221be1e5465e7144153b70317a.1531463897.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Makefile | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Makefile b/Makefile
index 8d25c8a239..e2b8770d53 100644
--- a/Makefile
+++ b/Makefile
@@ -1071,6 +1071,8 @@ help:
 	@echo '  external-deps          - list external packages used'
 	@echo '  legal-info             - generate info about license compliance'
 	@echo '  printvars              - dump all the internal variables'
+	@echo '  docker4buildroot       - build docker images of some distros, with all the'
+	@echo '                           packages needed to use Buildroot already installed'
 	@echo
 	@echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
 	@echo '  make O=dir             - Locate all output files in "dir", including .config'
@@ -1131,6 +1133,17 @@ print-version:
 	(cd configs; LC_ALL=C ls -1 *_defconfig) | sed 's/$$/: *defconfig/' >> $@
 	./support/testing/run-tests -l 2>&1 | sed -r -e '/^test_run \((.*)\).*/!d; s//\1: *runtime_test/' | LC_ALL=C sort >> $@
 
+.PHONY: docker4buildroot
+docker4buildroot:
+	@if [ -z "$(BR2_DOCKER_VERSION)" ]; then \
+		printf "Please, set the version of the docker images with BR2_DOCKER_VERSION\n"; \
+		exit 1; \
+	fi
+	for d in support/docker/Dockerfile.*; do \
+		docker build -t "buildroot/$${d#*/Dockerfile.}:$(BR2_DOCKER_VERSION)" \
+			     -f "$${d}" "$${d%/*}" || exit 1; \
+	done
+
 include docs/manual/manual.mk
 -include $(foreach dir,$(BR2_EXTERNAL_DIRS),$(sort $(wildcard $(dir)/docs/*/*.mk)))
 
-- 
2.14.1
