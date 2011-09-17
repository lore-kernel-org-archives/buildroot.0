From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 17 Sep 2011 08:22:12 +0200
Subject: [Buildroot] [git commit] scripts: remove old, unmaintained,
	unused scripts
Message-ID: <20110917063642.894398D728@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8adad451a3d4e536dffe900d06ccd88740afe68b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 scripts/add_new_package.wizard |  120 ----------------------------------------
 scripts/create_ipkgs           |   82 ---------------------------
 scripts/get_linux_config.sh    |   77 -------------------------
 3 files changed, 0 insertions(+), 279 deletions(-)
 delete mode 100755 scripts/add_new_package.wizard
 delete mode 100755 scripts/create_ipkgs
 delete mode 100755 scripts/get_linux_config.sh

diff --git a/scripts/add_new_package.wizard b/scripts/add_new_package.wizard
deleted file mode 100755
index 4ee02df..0000000
--- a/scripts/add_new_package.wizard
+++ /dev/null
@@ -1,120 +0,0 @@
-#!/bin/sh
-
-echo "**** Autotools Add New Package Wizard ****"
-echo " This script will generate files to add a"
-echo " new package to buildroot."
-echo
-
-echo "What is the name of the package?"
-read PACKAGE_NAME
-
-echo "What is the version number?"
-read VERSION_NUM
-
-echo "What is the web address of the tarball?"
-read DOWNLOAD_LOC
-
-echo "Enter any known dependencies, separated"
-echo "by spaces, or just press enter."
-read EXTRA_DEPS
-
-echo "Enter a description of the package."
-read DESCRIPTION
-
-echo "Does autoreconf need to be run first? (y/n)"
-read ANSWER
-
-if [ "$ANSWER" = "y" ]; then
-	RECONF="YES"
-else
-	RECONF="NO"
-fi
-
-echo "Does it need to be installed to the staging dir?"
-echo "Say yes, if other packages depend on it."
-echo "(If not sure, just say yes. It will only use more"
-echo "space on your hard drive.)"
-read ANSWER
-
-if [ "$ANSWER" = "y" ]; then
-	STAGING="YES"
-else
-	STAGING="NO"
-fi
-
-echo "Enter an additional subdirectory below package/"
-echo "as category, or just press enter."
-read SUB_DIR
-
-if [ -z "$SUB_DIR" ]; then
-	CATEGORY_DIR=package
-else
-	CATEGORY_DIR=package/${SUB_DIR}
-fi
-
-echo "Enter any configure script options."
-read CONFIG_OPTIONS
-
-URL=${DOWNLOAD_LOC%/*}
-TARBALL=${DOWNLOAD_LOC##*/}
-EXTENSION=${TARBALL##*.tar.}
-NAME_UPPER=`echo ${PACKAGE_NAME} | tr a-z- A-Z_`
-PACKAGE_DIR=`dirname $0`/../${CATEGORY_DIR}/${PACKAGE_NAME}
-
-mkdir -p ${PACKAGE_DIR}
-
-sed -e 's/ *$//g' > ${PACKAGE_DIR}/${PACKAGE_NAME}.mk <<EOF
-#############################################################
-#
-# ${PACKAGE_NAME}
-#
-#############################################################
-${NAME_UPPER}_VERSION = ${VERSION_NUM}
-${NAME_UPPER}_SOURCE = ${PACKAGE_NAME}-\$(${NAME_UPPER}_VERSION).tar.${EXTENSION}
-${NAME_UPPER}_SITE = ${URL}
-${NAME_UPPER}_AUTORECONF = ${RECONF}
-${NAME_UPPER}_INSTALL_STAGING = ${STAGING}
-${NAME_UPPER}_INSTALL_TARGET = YES
-
-${NAME_UPPER}_CONF_OPT = ${CONFIG_OPTIONS}
-
-${NAME_UPPER}_DEPENDENCIES = uclibc ${EXTRA_DEPS}
-
-\$(eval \$(call AUTOTARGETS,${CATEGORY_DIR},${PACKAGE_NAME}))
-EOF
-
-cat > ${PACKAGE_DIR}/Config.in <<EOF
-config BR2_PACKAGE_${NAME_UPPER}
-	bool "${PACKAGE_NAME}"
-	help
-	  ${DESCRIPTION}
-
-	  ${URL}
-EOF
-
-echo
-echo "**** Manual steps to integrate your new package ****"
-echo
-
-echo "Add the following line to ${CATEGORY_DIR}/Config.in"
-echo "in an appropriate location:"
-echo "source \"${CATEGORY_DIR}/${PACKAGE_NAME}/Config.in\""
-
-if [ -n "$SUB_DIR" ]; then
-	echo
-	echo "Additionally add the following line to package/Config.in"
-	echo "in an appropriate location:"
-	echo "source \"${CATEGORY_DIR}/Config.in\""
-fi
-
-if [ -n "$EXTRA_DEPS" ]; then
-	echo
-	echo "You need to add \"depends on\" and/or \"select\" lines"
-	echo "to ${CATEGORY_DIR}/${PACKAGE_NAME}/Config.in"
-	echo "corresponding to the \"${NAME_UPPER}_DEPENDENCIES\" line"
-	echo "in ${CATEGORY_DIR}/${PACKAGE_NAME}/${PACKAGE_NAME}.mk"
-fi
-
-echo
-echo "After that run \"make menuconfig\", select your new package"
-echo "and run \"make\" to build \"${PACKAGE_NAME}\"."
diff --git a/scripts/create_ipkgs b/scripts/create_ipkgs
deleted file mode 100755
index 3b9b8af..0000000
--- a/scripts/create_ipkgs
+++ /dev/null
@@ -1,82 +0,0 @@
-#!/bin/sh
-
-# this script is very *alpha* so be gentle...
-
-# change these lines to your arch and maintainer name
-ARCH="avr32"
-PACK_MAINTAINER="John Voltz <john.voltz@gmail.com>"
-
-BUILDROOT_DIR=`pwd`
-
-echo "Creating ipkgs from your build directory..."
-echo "Please be patient, as this can take a long time.
-			"
-
-# create the ipkg directories
-mkdir -p ${BUILDROOT_DIR}/ipkg-temp
-mkdir -p ${BUILDROOT_DIR}/ipkg-out
-
-for PACKAGE in `ls -d ./build_*/*`; do
-	
-	# extract some info
-	NAME_WITHOUT_VER=${PACKAGE%-*}
-	VERSION=${PACKAGE#${NAME_WITHOUT_VER}-}
-	NAME_WITHOUT_DIR=${NAME_WITHOUT_VER#*/*/}
-	CLEAN_NAME=${NAME_WITHOUT_DIR//_/-}
-
-	# clean out the temp directory
-	rm -rf ${BUILDROOT_DIR}/ipkg-temp/*
-
-	# install the package to temp directory
-	cd ${PACKAGE}
-	echo "Installing ${NAME_WITHOUT_DIR} to ./ipkg-temp"
-	make DESTDIR=${BUILDROOT_DIR}/ipkg-temp DSTROOT=${BUILDROOT_DIR}/ipkg-temp install &> /dev/null 
-
-	# create the control file
-	cd ${BUILDROOT_DIR}
-	mkdir ${BUILDROOT_DIR}/ipkg-temp/CONTROL
-
-	# find it's corresponding buildroot package directory 
-	PACK_NAME=`find ./package -path './package/config' -prune -o -name ${NAME_WITHOUT_DIR}`
-	PACK_NAME=${PACK_NAME%./package/config}
-	PACK_NAME=${PACK_NAME#./package/config}
-	PACK_NAME=`echo -n ${PACK_NAME}`
-
-	# there must be an better way to extract the description and 
-	# dependencies from the Config.in and *.mk file. 
-	# Haven't figured it out just yet.
-	CONF_FILE=`cat ${PACK_NAME}/Config.in`
-	#MAKE_FILE=`cat ${PACK_NAME}/*.mk`
-	HELP_STR=${CONF_FILE#*help}
-	HELP_STR=${HELP_STR%%comment*}
-	HELP_STR=${HELP_STR%%choice*}
-	HELP_STR=${HELP_STR%%depends*}
-	HELP_STR=${HELP_STR%%http*}
-	HELP_STR=`echo -n ${HELP_STR}`
-
-	echo ${HELP_STR}
-
-	if [ "${PACK_NAME}" != "" ]; then
-		echo "Creating ipkg of: ${PACKAGE}"
-
-cat > ${BUILDROOT_DIR}/ipkg-temp/CONTROL/control <<EOF
-Package: ${CLEAN_NAME}
-Priority: optional
-Version: ${VERSION}
-Architecture: ${ARCH}
-Maintainer: ${PACK_MAINTAINER}
-Depends: uclibc
-Description: ${HELP_STR}
-EOF
-
-		# build the package
-		package/ipkg/ipkg-build ${BUILDROOT_DIR}/ipkg-temp ${BUILDROOT_DIR}/ipkg-out
-
-	fi
-
-	echo "Complete.
-					"
-
-done
-
-echo "ipkg builds are finished."
diff --git a/scripts/get_linux_config.sh b/scripts/get_linux_config.sh
deleted file mode 100755
index 6c00036..0000000
--- a/scripts/get_linux_config.sh
+++ /dev/null
@@ -1,77 +0,0 @@
-#!/bin/bash
-#######################################################################
-#
-# Copy successively all configs from the BSP directory (par #1)
-# to the Linux directory (par #2)
-# Do not copy config files for later linux versions than the current
-# A well-behaved filename is 
-# "<name>-linux-2.6.<major>.<minor>.config" or
-# "<name>-linux-2.6.<major>.config"
-#
-#######################################################################
-
-TOPDIR=`pwd`
-DEBUG=0
-# parameter #1	BOARD_PATH
-# parameter #2  LINUX26_DIR
-
-CONFIGS=`ls -X $1/*linux-2.6.*.config | sed s/[.]config// - | sort`
-LINUX26_DIR=`basename $2`
-LINUX26_CONFIG=${2}/.config
-LINUX_MAJOR_VERSION=${LINUX26_DIR:10:2}
-LINUX_MINOR_VERSION=${LINUX26_DIR:13}
-
-function DBG_PRINT
-{
-	if [ ${DEBUG} = 1 ] ; then
-		echo $1
-	fi
-}
-
-function linux_version()
-{
-	local KCONFIG
-	KCONFIG=`basename $1`
-	KERNEL=`echo ${KCONFIG} | sed s/.*linux-2.6./linux-2.6./g -`
-	THIS_MAJOR=${KERNEL:10:2}
-	THIS_MINOR=${KERNEL:13}
-	THIS_MINOR=${THIS_MINOR:=0}
-}
-
-# Try to be careful...
-DBG_PRINT MAJOR=\"${LINUX_MAJOR_VERSION}\"
-DBG_PRINT MINOR=\"${LINUX_MINOR_VERSION}\"
-
-for i in ${CONFIGS} ; do
-    DBG_PRINT FILE=$i
-    linux_version $i
-    DBG_PRINT KERNEL=${KERNEL}
-    if [ ${THIS_MAJOR} -lt ${LINUX_MAJOR_VERSION} ] ; then
-	    echo Copying `basename $i`.config ...
-	    cp $i.config ${LINUX26_CONFIG}
-    elif [ ${THIS_MAJOR} -eq ${LINUX_MAJOR_VERSION} ] ; then
-	if [ "${LINUX_MINOR_VERSION}X" = "X" ] ; then
-		if [ "${THIS_MINOR}X" = "X" ] ; then
-		    echo Copying `basename $i`.config ...
-		    cp $i.config ${LINUX26_CONFIG}
-		else		
-			return
-		fi
-	elif [ ${THIS_MINOR} -le ${LINUX_MINOR_VERSION} ] ; then
-	    echo Copying `basename $i`.config ...
-	    cp $i.config ${LINUX26_CONFIG}
-	fi
-    else		
-	return
-    fi
-done
-
-# Did not work... - be promisceous
-
-if [ ! -f "${LINUX26_CONFIG}" ] ; then \
-	for i in `ls $1/*linux*.config` ; do
-		echo Copying `basename $i` ...
-		cp $i ${LINUX26_CONFIG}
-	done
-fi
-
-- 
1.7.3.4
