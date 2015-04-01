From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Apr 2015 22:41:27 +0200
Subject: [Buildroot] [git commit] toolchain/helpers: add check for mandatory
	uClibc options
Message-ID: <20150401205855.9DE5381918@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1c51a80a7fce5429bbc42df24a27eb5e60f23a85
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We currently only check that the Buildroot configuration matches what is
available in the toolchain.

Since we're going to remove the check for LFS and make it a mandatory
feature, we will lose the corresponding buildroot option, so we won't be
able to use check_uclibc_feature as-is.

Introduce a magic value passed as the buildroot option name to recognise
checks for mandatory uclibc options that do not have a corresponding
option in buildroot.

If the buildroot option name is empty then the check is against a
mandatory uclibc option.

If a mandatory uclibc option is missing we reject the toolchain as being
unusable by buildroot.

[Thomas: minor tweaks in comment, remove space instead of tab.]

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/helpers.mk |   24 +++++++++++++++++-------
 1 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 3121da4..c1d2878 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -239,6 +239,9 @@ check_musl = \
 # uClibc configuration of the external toolchain, for a particular
 # feature.
 #
+# If 'Buildroot option name' ($2) is empty it means the uClibc option
+# is mandatory.
+#
 # $1: uClibc macro name
 # $2: Buildroot option name
 # $3: uClibc config file
@@ -246,13 +249,20 @@ check_musl = \
 #
 check_uclibc_feature = \
 	IS_IN_LIBC=`grep -q "\#define $(1) 1" $(3) && echo y` ; \
-	if [ "$($(2))" != "y" -a "$${IS_IN_LIBC}" = "y" ] ; then \
-		echo "$(4) available in C library, please enable $(2)" ; \
-		exit 1 ; \
-	fi ; \
-	if [ "$($(2))" = "y" -a "$${IS_IN_LIBC}" != "y" ] ; then \
-		echo "$(4) not available in C library, please disable $(2)" ; \
-		exit 1 ; \
+	if [ -z "$(2)" ] ; then \
+		if [ "$${IS_IN_LIBC}" != "y" ] ; then \
+			echo "$(4) not available in C library, toolchain unsuitable for Buildroot" ; \
+			exit 1 ; \
+		fi ; \
+	else \
+		if [ "$($(2))" != "y" -a "$${IS_IN_LIBC}" = "y" ] ; then \
+			echo "$(4) available in C library, please enable $(2)" ; \
+			exit 1 ; \
+		fi ; \
+		if [ "$($(2))" = "y" -a "$${IS_IN_LIBC}" != "y" ] ; then \
+			echo "$(4) not available in C library, please disable $(2)" ; \
+			exit 1 ; \
+		fi ; \
 	fi
 
 #
