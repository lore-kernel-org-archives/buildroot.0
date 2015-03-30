From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 30 Mar 2015 18:07:20 -0300
Subject: [Buildroot] [PATCH v3 01/15] toolchain/helpers: add check for
	mandatory uClibc options
In-Reply-To: <1427749654-30153-1-git-send-email-gustavo@zacarias.com.ar>
References: <1427749654-30153-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1427749654-30153-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/helpers.mk | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 3121da4..5d6390e 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -238,6 +238,7 @@ check_musl = \
 # Check the conformity of Buildroot configuration with regard to the
 # uClibc configuration of the external toolchain, for a particular
 # feature.
+# If 'Buildroot option name' ($2) is empty it means a mandatory option.
 #
 # $1: uClibc macro name
 # $2: Buildroot option name
@@ -246,13 +247,20 @@ check_musl = \
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
+ 		fi ; \
 	fi
 
 #
-- 
2.0.5
