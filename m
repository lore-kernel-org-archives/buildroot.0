From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Jan 2013 21:45:09 +0100
Subject: [Buildroot] [git commit] eclipse support: document script and add
	checks
Message-ID: <20130114204457.4AF4C9703D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d671715c109eb3c237ed925d5a0971d2eae89362
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As requested by Peter, add a bit of documentation in the
eclipse-register-toolchain script, and add a few more checks (even
though this script is not intended to be executed manually, which is
also now mentionned in the documentation).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 support/scripts/eclipse-register-toolchain |   48 ++++++++++++++++++++++++++++
 1 files changed, 48 insertions(+), 0 deletions(-)

diff --git a/support/scripts/eclipse-register-toolchain b/support/scripts/eclipse-register-toolchain
index dd9f158..6f91998 100755
--- a/support/scripts/eclipse-register-toolchain
+++ b/support/scripts/eclipse-register-toolchain
@@ -1,11 +1,59 @@
 #!/bin/sh
 
+# This script registers the toolchain of a Buildroot project into the
+# Eclipse plugin. To do so, it adds a new line for the Buildroot
+# toolchain into the $HOME/.buildroot-eclipse.toolchains file, which
+# the Eclipse Buildroot plugin reads to discover automatically the
+# available Buildroot toolchains on the system.
+#
+# This script should typically not be called manually. Instead, one
+# should enable the BR2_ECLIPSE_REGISTER configuration option, which
+# will lead Buildroot to automatically call this script with the
+# appropriate arguments.
+#
+# Usage:
+#  eclipse-register-toolchain project-directory toolchain-prefix architecture
+#
+#   project-directory is the absolute path to the Buildroot project
+#   output directory (which contains the host/, target/, build/,
+#   images/, etc. subdirectories). It should be an absolute and
+#   canonical path.
+#
+#   toolchain-prefix is the prefix of the cross-compilation tools, i.e
+#   'arm-linux-' if the cross-compiler executable is 'arm-linux-gcc'.
+#
+#   architecture is the lower-cased name of the architecture targetted
+#   by the Buildroot project.
+
+if test $# -ne 3; then
+    echo "Invalid number of arguments."
+    echo "Usage: $0 project-directory toolchain-prefix architecture"
+    exit 1
+fi
+
 project_directory=$1
 toolchain_prefix=$2
 architecture=$3
 
+if test ! -d ${project_directory} ; then
+    echo "Non-existing project directory ${project_directory}"
+    exit 1
+fi
+
+if test ! -d ${project_directory}/host ; then
+    echo "Your project directory does not look like a Buildroot output"
+    exit 1
+fi
+
+if test ! -e ${project_directory}/host/usr/bin/${toolchain_prefix}gcc ; then
+    echo "Cannot find the cross-compiler in the project directory"
+    exit 1
+fi
+
 TOOLCHAIN_ECLIPSE_FILE=${HOME}/.buildroot-eclipse.toolchains
 
+# First, we remove all lines from the ${TOOLCHAIN_ECLISPE_FILE} that
+# correspond to toolchains that no longer exist.
 if test -f ${TOOLCHAIN_ECLIPSE_FILE} ; then
     mv ${TOOLCHAIN_ECLIPSE_FILE} ${TOOLCHAIN_ECLIPSE_FILE}.tmp
     cat ${TOOLCHAIN_ECLIPSE_FILE}.tmp | while read toolchain ; do
