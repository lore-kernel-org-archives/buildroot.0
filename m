From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 13 Mar 2015 15:22:00 -0300
Subject: [Buildroot] [PATCH 01/15] toolchain/helpers: add mandatory check
	for uclibc toolchain options
In-Reply-To: <1426270934-15499-1-git-send-email-gustavo@zacarias.com.ar>
References: <1426270934-15499-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1426270934-15499-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Take 'm' as parameter in $2 (buildroot option name) in
check_uclibc_feature to indicate that a toolchain option is mandatory,
and bail out with an appropiate message if that's the case.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/helpers.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 3121da4..ef657ee 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -238,6 +238,7 @@ check_musl = \
 # Check the conformity of Buildroot configuration with regard to the
 # uClibc configuration of the external toolchain, for a particular
 # feature.
+# If 'Buildroot option name' ($2) = 'm' it means a mandatory option.
 #
 # $1: uClibc macro name
 # $2: Buildroot option name
@@ -246,6 +247,10 @@ check_musl = \
 #
 check_uclibc_feature = \
 	IS_IN_LIBC=`grep -q "\#define $(1) 1" $(3) && echo y` ; \
+	if [ "$(2)" = "m" -a "$${IS_IN_LIBC}" != "y" ] ; then \
+		echo "$(4) not available in C library, toolchain unsuitable for Buildroot" ; \
+		exit 1 ; \
+	fi ; \
 	if [ "$($(2))" != "y" -a "$${IS_IN_LIBC}" = "y" ] ; then \
 		echo "$(4) available in C library, please enable $(2)" ; \
 		exit 1 ; \
-- 
2.0.5
