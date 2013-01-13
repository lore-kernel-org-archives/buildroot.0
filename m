From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Jan 2013 15:52:13 +0100
Subject: [Buildroot] [PATCH 1/2] Integration with Buildroot Toolchain
	Eclipse plugin
In-Reply-To: <1358088734-23460-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1358088734-23460-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1358088734-23460-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Eclipse plugin at
https://github.com/mbats/eclipse-buildroot-toolchain-plugin allows
users of Eclipse to easily use the toolchain available in
Buildroot. To do so, this plugin reads
~/.buildroot-eclipse.toolchains, which contains the list of Buildroot
toolchains available on the system, and then offer those toolchains to
compile Eclipse projects.

In order to interface with this plugin, this commit adds an option
that allows the user to tell whether (s)he wants the Buildroot project
toolchain to be visible under this Eclipse plugin. It simply adds a
line in this ~/.buildroot-eclipse.toolchains file.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                                   |    7 +++++++
 support/scripts/eclipse-register-toolchain |   28 ++++++++++++++++++++++++++++
 toolchain/toolchain-common.in              |    7 +++++++
 3 files changed, 42 insertions(+)
 create mode 100755 support/scripts/eclipse-register-toolchain

diff --git a/Makefile b/Makefile
index 074674a..70cb229 100644
--- a/Makefile
+++ b/Makefile
@@ -336,6 +336,10 @@ TARGETS+=target-generatelocales
 endif
 endif
 
+ifeq ($(BR2_ECLIPSE_REGISTER),y)
+TARGETS+=toolchain-eclipse-register
+endif
+
 include fs/common.mk
 
 TARGETS_CLEAN:=$(patsubst %,%-clean,$(TARGETS))
@@ -531,6 +535,9 @@ target-generatelocales: host-localedef
 	done
 endif
 
+toolchain-eclipse-register:
+	./support/scripts/eclipse-register-toolchain `readlink -f $(O)` $(notdir $(TARGET_CROSS)) $(BR2_ARCH)
+
 source: dirs $(TARGETS_SOURCE) $(HOST_SOURCE)
 
 external-deps:
diff --git a/support/scripts/eclipse-register-toolchain b/support/scripts/eclipse-register-toolchain
new file mode 100755
index 0000000..dd9f158
--- /dev/null
+++ b/support/scripts/eclipse-register-toolchain
@@ -0,0 +1,28 @@
+#!/bin/sh
+
+project_directory=$1
+toolchain_prefix=$2
+architecture=$3
+
+TOOLCHAIN_ECLIPSE_FILE=${HOME}/.buildroot-eclipse.toolchains
+
+if test -f ${TOOLCHAIN_ECLIPSE_FILE} ; then
+    mv ${TOOLCHAIN_ECLIPSE_FILE} ${TOOLCHAIN_ECLIPSE_FILE}.tmp
+    cat ${TOOLCHAIN_ECLIPSE_FILE}.tmp | while read toolchain ; do
+	path=$(echo ${toolchain} | cut -f1 -d ':')
+        # Filter lines corresponding to still existing projects
+	echo "Testing ${path} ..."
+	if ! test -d ${path} ; then
+	    continue
+	fi
+	# .. and the current project
+	if test ${path} = ${project_directory} ; then
+	    continue
+	fi
+	echo ${toolchain} >> ${TOOLCHAIN_ECLIPSE_FILE}
+    done
+    rm ${TOOLCHAIN_ECLIPSE_FILE}.tmp
+fi
+
+# Add the toolchain
+echo "${project_directory}:${toolchain_prefix}:${architecture}" >> ${TOOLCHAIN_ECLIPSE_FILE}
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 9f11a39..f6905ae 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -131,3 +131,10 @@ config BR2_TARGET_LDFLAGS
 	string "Target linker options"
 	help
 	  Extra options to pass to the linker when building for the target.
+
+config BR2_ECLIPSE_REGISTER
+	bool "Register toolchain within Eclipse Buildroot plug-in"
+	help
+	  This options tells Buildroot to generate the necessary
+	  configuration files to make your toolchain appear within
+	  Eclipse, through the Eclipse Buildroot plugin.
-- 
1.7.9.5
