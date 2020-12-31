From: Konrad Schwarz <konrad.schwarz@siemens.com>
Date: Thu, 31 Dec 2020 22:29:49 +0100
Subject: [Buildroot] [PATCH 3/3] package/environment-setup: improve
 legibility
In-Reply-To: <20201231212949.2415485-1-konrad.schwarz@siemens.com>
References: <20201231212949.2415485-1-konrad.schwarz@siemens.com>
Message-ID: <20201231212949.2415485-4-konrad.schwarz@siemens.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Replaces absolute paths in cross-compilation macros such as CC
with CROSS_COMPILE after first shortening CROSS_COMPILE to remove
leading directories.  This is possible, since the referenced
executables can be found by PATH search.

The primary movtivation for this is that the output of
build processes (make) becomes easier to read as less redundant
information is being presented.
Furthermore, the generated environment-setup script becomes easier
to read and manually modify, should this be necessary.

Although relying on PATH to find the cross-compilation executables
raises the possibility of mistakenly picking up wrong instances,
the names are fairly unique, so this risk should be acceptable.
Since in the original solution some executables were already being found
by PATH search (namely all those not specified by a make macro such as
CC), this change does not introduce fundamentally new risks.

Signed-off-by: Konrad Schwarz <konrad.schwarz@siemens.com>
---
 package/environment-setup/environment-setup.mk | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/package/environment-setup/environment-setup.mk b/package/environment-setup/environment-setup.mk
index 5cb703e421..920dc3003e 100644
--- a/package/environment-setup/environment-setup.mk
+++ b/package/environment-setup/environment-setup.mk
@@ -7,10 +7,17 @@
 define HOST_ENVIRONMENT_SETUP_INSTALL_CMDS
 	{ \
 	cat package/environment-setup/environment-setup &&\
-	printf 'export "%s"\n' $(TARGET_CONFIGURE_OPTS) &&\
+	printf 'export "CROSS_COMPILE=$(TARGET_CROSS)"\n' &&\
+	printf 'CROSS_COMPILE=$${CROSS_COMPILE#$$SDK_PATH/bin/}\n' &&\
+	printf 'export "%s"\n' $(TARGET_CONFIGURE_OPTS) |\
+			sed\
+			-e'/^export "PATH=/d'\
+			-e's:$(TARGET_CROSS):$${CROSS_COMPILE}:g'\
+			-e 's%$(HOST_DIR)/bin/%%g'\
+			-e 's%$(HOST_DIR)%\$$SDK_PATH%g'\
+			&&\
 	printf %b\
 	'export "ARCH=$(KERNEL_ARCH)"\n'\
-	'export "CROSS_COMPILE=$(TARGET_CROSS)"\n'\
 	'export CONFIGURE_FLAGS=\\\n'\
 		'"--target=$(GNU_TARGET_NAME) "\\\n'\
 		'"--host=$(GNU_TARGET_NAME) "\\\n'\
@@ -31,11 +38,7 @@ define HOST_ENVIRONMENT_SETUP_INSTALL_CMDS
 	\
 	$(if $(BR2_LINUX_KERNEL),\
 		'export "KERNELDIR=$(LINUX_BUILDDIR)"\n')\
-	; } |\
-	sed -e 's%$(HOST_DIR)%\$$SDK_PATH%g'\
-		-e 's%$(HOST_DIR)/bin/%%g'\
-		-e '/^export "PATH=/c\'\
-		>$(HOST_DIR)/environment-setup
+	; } >$(HOST_DIR)/environment-setup
 endef
 
 $(eval $(host-generic-package))
-- 
2.25.4
