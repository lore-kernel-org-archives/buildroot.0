From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Sun,  3 May 2009 13:41:57 +0200
Subject: [Buildroot] [PATCH 3/4] scripts/package wizard: add support for
	subdirs
In-Reply-To: <1241350918-32451-1-git-send-email-markus.heidelberg@web.de>
References: <1241350918-32451-1-git-send-email-markus.heidelberg@web.de>
Message-ID: <1241350918-32451-4-git-send-email-markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>
---
 scripts/add_new_package.wizard |   27 ++++++++++++++++++++++-----
 1 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/scripts/add_new_package.wizard b/scripts/add_new_package.wizard
index d4127f4..902718d 100755
--- a/scripts/add_new_package.wizard
+++ b/scripts/add_new_package.wizard
@@ -42,6 +42,16 @@ else
 	STAGING="NO"
 fi
 
+echo "Enter an additional subdirectory below package/"
+echo "as category, or just press enter."
+read SUB_DIR
+
+if [ -z "$SUB_DIR" ]; then
+	CATEGORY_DIR=package
+else
+	CATEGORY_DIR=package/${SUB_DIR}
+fi
+
 echo "Enter any configure script options."
 read CONFIG_OPTIONS
 
@@ -49,9 +59,9 @@ URL=${DOWNLOAD_LOC%/*}
 TARBALL=${DOWNLOAD_LOC##*/}
 EXTENSION=${TARBALL##*.tar.}
 NAME_UPPER=`echo ${PACKAGE_NAME} | tr a-z- A-Z_`
-PACKAGE_DIR=`dirname $0`/../package/${PACKAGE_NAME}
+PACKAGE_DIR=`dirname $0`/../${CATEGORY_DIR}/${PACKAGE_NAME}
 
-mkdir ${PACKAGE_DIR}
+mkdir -p ${PACKAGE_DIR}
 
 sed -e 's/ *$//g' > ${PACKAGE_DIR}/${PACKAGE_NAME}.mk <<EOF
 #############################################################
@@ -70,7 +80,7 @@ ${NAME_UPPER}_CONF_OPT = ${CONFIG_OPTIONS}
 
 ${NAME_UPPER}_DEPENDENCIES = uclibc ${EXTRA_DEPS}
 
-\$(eval \$(call AUTOTARGETS,package,${PACKAGE_NAME}))
+\$(eval \$(call AUTOTARGETS,${CATEGORY_DIR},${PACKAGE_NAME}))
 EOF
 
 cat > ${PACKAGE_DIR}/Config.in <<EOF
@@ -82,9 +92,16 @@ config BR2_PACKAGE_${NAME_UPPER}
 	  ${URL}
 EOF
 
-echo "Just add: source \"package/${PACKAGE_NAME}/Config.in\""
-echo "to the file package/Config.in in an appropriate"
+echo "Just add: source \"${CATEGORY_DIR}/${PACKAGE_NAME}/Config.in\""
+echo "to the file ${CATEGORY_DIR}/Config.in in an appropriate"
 echo "location."
+
+if [ -n "$SUB_DIR" ]; then
+	echo "Additionally add: source \"${CATEGORY_DIR}/Config.in\""
+	echo "to the file package/Config.in in an appropriate"
+	echo "location."
+fi
+
 echo
 echo "You are now ready to build ${PACKAGE_NAME}"
 echo "Just run make menuconfig and select your new"
-- 
1.6.3.rc4.11.g6eda9
