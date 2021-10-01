Return-Path: <SRS0=lBh3=OV=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDAC7C433EF
	for <buildroot@archiver.kernel.org>; Fri,  1 Oct 2021 18:10:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D84B6135E
	for <buildroot@archiver.kernel.org>; Fri,  1 Oct 2021 18:10:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4D84B6135E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 206AA42619;
	Fri,  1 Oct 2021 18:10:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gjDwFK8dCPez; Fri,  1 Oct 2021 18:10:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2762A4261A;
	Fri,  1 Oct 2021 18:10:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E0C1D1BF2B0
 for <buildroot@lists.busybox.net>; Fri,  1 Oct 2021 18:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD9C5843EC
 for <buildroot@lists.busybox.net>; Fri,  1 Oct 2021 18:10:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gUSzWp1hWJQr for <buildroot@lists.busybox.net>;
 Fri,  1 Oct 2021 18:10:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE513843E7
 for <buildroot@buildroot.org>; Fri,  1 Oct 2021 18:10:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id C7A098DA80; Fri,  1 Oct 2021 18:08:05 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 1 Oct 2021 20:09:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6cddc00399759296ab64fad4956380d89cd71609
X-Git-Newrev: 556a0a11044b3544b500d97716a7e887ada011fa
X-Patchwork-Hint: ignore
Message-Id: <20211001180805.C7A098DA80@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "make: support: use `command -v'
 instead of `which'"
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=556a0a11044b3544b500d97716a7e887ada011fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit ca6a2907c27c8171336643d1ab41bd5c34ee3794.

Switching to using 'command -v' instead of 'which', opened a can of
worms that is hard to fix in a timely manner:

  - recursive call to 'make' from a post-build, post-iamge script, fails
    because of a redefinition of HOSTCC_NOCCACHE (a bug on its own that
    needs a separate fix anyway) [0];

  - 'make' believeing it can call "simple" commands with execve() et al.
    instead of passing them through a shell via system(), and thus
    failing to find 'command' in the PATH [1].

[0] https://lore.kernel.org/buildroot/20211001175329.GA1973888@lbrmn-mmayer.ric.broadcom.net/T/#m95c17eb8374e4e3dd6eee700d397aa12cca0739e
[1] https://lore.kernel.org/buildroot/20211001180304.GV1504958@scaer/T/#m3a8f36bd76ec7d8e5038a6c8932bb6ffe23ea268

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Makefile                                           | 22 +++++++++++-----------
 package/Makefile.in                                |  8 ++++----
 support/dependencies/check-host-bison-flex.mk      |  4 ++--
 support/dependencies/check-host-cmake.sh           |  2 +-
 support/dependencies/check-host-gzip.sh            |  2 +-
 support/dependencies/check-host-lzip.sh            |  4 ++--
 support/dependencies/check-host-python3.sh         |  2 +-
 support/dependencies/check-host-tar.sh             |  4 ++--
 support/dependencies/check-host-xzcat.sh           |  4 ++--
 support/dependencies/dependencies.sh               | 16 ++++++++--------
 .../toolchain-external/pkg-toolchain-external.mk   |  2 +-
 11 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/Makefile b/Makefile
index 1b080bc10f..c960b53a6d 100644
--- a/Makefile
+++ b/Makefile
@@ -284,12 +284,12 @@ HOSTAS := as
 endif
 ifndef HOSTCC
 HOSTCC := gcc
-HOSTCC := $(shell command -v $(HOSTCC) || type -p $(HOSTCC) || echo gcc)
+HOSTCC := $(shell which $(HOSTCC) || type -p $(HOSTCC) || echo gcc)
 endif
 HOSTCC_NOCCACHE := $(HOSTCC)
 ifndef HOSTCXX
 HOSTCXX := g++
-HOSTCXX := $(shell command -v $(HOSTCXX) || type -p $(HOSTCXX) || echo g++)
+HOSTCXX := $(shell which $(HOSTCXX) || type -p $(HOSTCXX) || echo g++)
 endif
 HOSTCXX_NOCCACHE := $(HOSTCXX)
 ifndef HOSTCPP
@@ -310,15 +310,15 @@ endif
 ifndef HOSTRANLIB
 HOSTRANLIB := ranlib
 endif
-HOSTAR := $(shell command -v $(HOSTAR) || type -p $(HOSTAR) || echo ar)
-HOSTAS := $(shell command -v $(HOSTAS) || type -p $(HOSTAS) || echo as)
-HOSTCPP := $(shell command -v $(HOSTCPP) || type -p $(HOSTCPP) || echo cpp)
-HOSTLD := $(shell command -v $(HOSTLD) || type -p $(HOSTLD) || echo ld)
-HOSTLN := $(shell command -v $(HOSTLN) || type -p $(HOSTLN) || echo ln)
-HOSTNM := $(shell command -v $(HOSTNM) || type -p $(HOSTNM) || echo nm)
-HOSTOBJCOPY := $(shell command -v $(HOSTOBJCOPY) || type -p $(HOSTOBJCOPY) || echo objcopy)
-HOSTRANLIB := $(shell command -v $(HOSTRANLIB) || type -p $(HOSTRANLIB) || echo ranlib)
-SED := $(shell command -v sed || type -p sed) -i -e
+HOSTAR := $(shell which $(HOSTAR) || type -p $(HOSTAR) || echo ar)
+HOSTAS := $(shell which $(HOSTAS) || type -p $(HOSTAS) || echo as)
+HOSTCPP := $(shell which $(HOSTCPP) || type -p $(HOSTCPP) || echo cpp)
+HOSTLD := $(shell which $(HOSTLD) || type -p $(HOSTLD) || echo ld)
+HOSTLN := $(shell which $(HOSTLN) || type -p $(HOSTLN) || echo ln)
+HOSTNM := $(shell which $(HOSTNM) || type -p $(HOSTNM) || echo nm)
+HOSTOBJCOPY := $(shell which $(HOSTOBJCOPY) || type -p $(HOSTOBJCOPY) || echo objcopy)
+HOSTRANLIB := $(shell which $(HOSTRANLIB) || type -p $(HOSTRANLIB) || echo ranlib)
+SED := $(shell which sed || type -p sed) -i -e
 
 export HOSTAR HOSTAS HOSTCC HOSTCXX HOSTLD
 export HOSTCC_NOCCACHE HOSTCXX_NOCCACHE
diff --git a/package/Makefile.in b/package/Makefile.in
index 09092fad54..86db62ba5b 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -4,7 +4,7 @@ endif
 ifndef HOSTMAKE
 HOSTMAKE = $(MAKE)
 endif
-HOSTMAKE := $(shell command -v $(HOSTMAKE) || type -p $(HOSTMAKE) || echo make)
+HOSTMAKE := $(shell which $(HOSTMAKE) || type -p $(HOSTMAKE) || echo make)
 
 # If BR2_JLEVEL is 0, scale the maximum concurrency with the number of
 # CPUs. An additional job is used in order to keep processors busy
@@ -222,8 +222,8 @@ else
 TARGET_STRIP = /bin/true
 STRIPCMD = $(TARGET_STRIP)
 endif
-INSTALL := $(shell command -v install || type -p install)
-UNZIP := $(shell command -v unzip || type -p unzip) -q
+INSTALL := $(shell which install || type -p install)
+UNZIP := $(shell which unzip || type -p unzip) -q
 
 APPLY_PATCHES = PATH=$(HOST_DIR)/bin:$$PATH support/scripts/apply-patches.sh $(if $(QUIET),-s)
 
@@ -237,7 +237,7 @@ HOST_LDFLAGS  += -L$(HOST_DIR)/lib -Wl,-rpath,$(HOST_DIR)/lib
 # the path to the system perl, before a host-perl built by Buildroot
 # might get installed into $(HOST_DIR)/bin and therefore appears
 # in our PATH. This system perl will be used as INTLTOOL_PERL.
-export PERL=$(shell command -v perl)
+export PERL=$(shell which perl)
 
 # host-intltool needs libxml-parser-perl, which Buildroot installs in
 # $(HOST_DIR)/lib/perl, so we must make sure that the system perl
diff --git a/support/dependencies/check-host-bison-flex.mk b/support/dependencies/check-host-bison-flex.mk
index e5db578941..14a232fd44 100644
--- a/support/dependencies/check-host-bison-flex.mk
+++ b/support/dependencies/check-host-bison-flex.mk
@@ -5,10 +5,10 @@
 # that runs on host, e.g. Kconfig. To build code for target use plain
 # host-{bison,flex}.
 
-ifeq ($(shell command -v bison 2>/dev/null),)
+ifeq ($(shell which bison 2>/dev/null),)
 BR2_BISON_HOST_DEPENDENCY = host-bison
 endif
 
-ifeq ($(shell command -v flex 2>/dev/null),)
+ifeq ($(shell which flex 2>/dev/null),)
 BR2_FLEX_HOST_DEPENDENCY = host-flex
 endif
diff --git a/support/dependencies/check-host-cmake.sh b/support/dependencies/check-host-cmake.sh
index f202d72a98..fadeae9f6b 100755
--- a/support/dependencies/check-host-cmake.sh
+++ b/support/dependencies/check-host-cmake.sh
@@ -11,7 +11,7 @@ shift
 for candidate; do
 
     # Try to locate the candidate. Discard it if not located.
-    cmake=`command -v "${candidate}" 2>/dev/null`
+    cmake=`which "${candidate}" 2>/dev/null`
     [ -n "${cmake}" ] || continue
 
     # Extract version X.Y from versions in the form X.Y or X.Y.Z
diff --git a/support/dependencies/check-host-gzip.sh b/support/dependencies/check-host-gzip.sh
index 4dbce72676..5f344c5f9b 100755
--- a/support/dependencies/check-host-gzip.sh
+++ b/support/dependencies/check-host-gzip.sh
@@ -2,7 +2,7 @@
 
 candidate="$1" # ignored
 
-gzip="$(command -v gzip)"
+gzip="$(which gzip)"
 if [ ! -x "${gzip}" ]; then
     # echo nothing: no suitable gzip found
     exit 1
diff --git a/support/dependencies/check-host-lzip.sh b/support/dependencies/check-host-lzip.sh
index ffd20e2809..4f8a2ba3de 100755
--- a/support/dependencies/check-host-lzip.sh
+++ b/support/dependencies/check-host-lzip.sh
@@ -2,9 +2,9 @@
 
 candidate="$1"
 
-lzip=`command -v $candidate 2>/dev/null`
+lzip=`which $candidate 2>/dev/null`
 if [ ! -x "$lzip" ]; then
-	lzip=`command -v lzip 2>/dev/null`
+	lzip=`which lzip 2>/dev/null`
 	if [ ! -x "$lzip" ]; then
 		# echo nothing: no suitable lzip found
 		exit 1
diff --git a/support/dependencies/check-host-python3.sh b/support/dependencies/check-host-python3.sh
index 7b3f4f8451..17cafd2883 100755
--- a/support/dependencies/check-host-python3.sh
+++ b/support/dependencies/check-host-python3.sh
@@ -14,7 +14,7 @@ shift
 # a more recent version.
 
 for candidate in "${@}" ; do
-	python3=`command -v $candidate 2>/dev/null`
+	python3=`which $candidate 2>/dev/null`
 	if [ ! -x "$python3" ]; then
 		continue
 	fi
diff --git a/support/dependencies/check-host-tar.sh b/support/dependencies/check-host-tar.sh
index 369e1ae393..b7d607a47a 100755
--- a/support/dependencies/check-host-tar.sh
+++ b/support/dependencies/check-host-tar.sh
@@ -2,9 +2,9 @@
 
 candidate="$1"
 
-tar=`command -v $candidate`
+tar=`which $candidate`
 if [ ! -x "$tar" ]; then
-	tar=`command -v tar`
+	tar=`which tar`
 	if [ ! -x "$tar" ]; then
 		# echo nothing: no suitable tar found
 		exit 1
diff --git a/support/dependencies/check-host-xzcat.sh b/support/dependencies/check-host-xzcat.sh
index 1fbcecf0ff..10f1c4562a 100755
--- a/support/dependencies/check-host-xzcat.sh
+++ b/support/dependencies/check-host-xzcat.sh
@@ -2,9 +2,9 @@
 
 candidate="$1"
 
-xzcat=`command -v $candidate 2>/dev/null`
+xzcat=`which $candidate 2>/dev/null`
 if [ ! -x "$xzcat" ]; then
-	xzcat=`command -v xzcat 2>/dev/null`
+	xzcat=`which xzcat 2>/dev/null`
 	if [ ! -x "$xzcat" ]; then
 		# echo nothing: no suitable xzcat found
 		exit 1
diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index c5dcb86231..c604a9efcc 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -58,7 +58,7 @@ fi
 check_prog_host()
 {
 	prog="$1"
-	if ! command -v $prog > /dev/null ; then
+	if ! which $prog > /dev/null ; then
 		echo >&2
 		echo "You must install '$prog' on your build machine" >&2
 		exit 1
@@ -75,7 +75,7 @@ check_prog_host "sed"
 check_prog_host "/usr/bin/file"
 
 # Check make
-MAKE=$(command -v make 2> /dev/null)
+MAKE=$(which make 2> /dev/null)
 if [ -z "$MAKE" ] ; then
 	echo
 	echo "You must install 'make' on your build machine";
@@ -96,9 +96,9 @@ if [ $MAKE_MAJOR -lt 3 ] || [ $MAKE_MAJOR -eq 3 -a $MAKE_MINOR -lt 81 ] ; then
 fi;
 
 # Check host gcc
-COMPILER=$(command -v $HOSTCC_NOCCACHE 2> /dev/null)
+COMPILER=$(which $HOSTCC_NOCCACHE 2> /dev/null)
 if [ -z "$COMPILER" ] ; then
-	COMPILER=$(command -v cc 2> /dev/null)
+	COMPILER=$(which cc 2> /dev/null)
 fi;
 if [ -z "$COMPILER" ] ; then
 	echo
@@ -122,9 +122,9 @@ if [ $COMPILER_MAJOR -lt 4 -o $COMPILER_MAJOR -eq 4 -a $COMPILER_MINOR -lt 8 ] ;
 fi;
 
 # check for host CXX
-CXXCOMPILER=$(command -v $HOSTCXX_NOCCACHE 2> /dev/null)
+CXXCOMPILER=$(which $HOSTCXX_NOCCACHE 2> /dev/null)
 if [ -z "$CXXCOMPILER" ] ; then
-	CXXCOMPILER=$(command -v c++ 2> /dev/null)
+	CXXCOMPILER=$(which c++ 2> /dev/null)
 fi
 
 if [ -z "$CXXCOMPILER" ] ; then
@@ -164,7 +164,7 @@ fi
 # Check that a few mandatory programs are installed
 missing_progs="no"
 for prog in perl tar wget cpio unzip rsync bc ${DL_TOOLS} ; do
-	if ! command -v $prog > /dev/null ; then
+	if ! which $prog > /dev/null ; then
 		echo "You must install '$prog' on your build machine";
 		missing_progs="yes"
 		if test $prog = "svn" ; then
@@ -198,7 +198,7 @@ if [ "${PATCH_MAJOR}" -lt 2 ] || [ "${PATCH_MAJOR}" -eq 2 -a "${PATCH_MINOR}" -l
 fi
 
 if grep ^BR2_NEEDS_HOST_UTF8_LOCALE=y $BR2_CONFIG > /dev/null; then
-	if ! command -v locale > /dev/null ; then
+	if ! which locale > /dev/null ; then
 		echo
 		echo "You need locale support on your build machine to build a toolchain supporting locales"
 		exit 1 ;
diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index e3f61294f8..68d7a3fe21 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -74,7 +74,7 @@ endif
 ifeq ($(TOOLCHAIN_EXTERNAL_INSTALL_DIR),)
 ifneq ($(TOOLCHAIN_EXTERNAL_PREFIX),)
 # if no path set, figure it out from path
-TOOLCHAIN_EXTERNAL_BIN := $(dir $(shell command -v $(TOOLCHAIN_EXTERNAL_PREFIX)-gcc))
+TOOLCHAIN_EXTERNAL_BIN := $(dir $(shell which $(TOOLCHAIN_EXTERNAL_PREFIX)-gcc))
 endif
 else
 TOOLCHAIN_EXTERNAL_REL_BIN_PATH = $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_REL_BIN_PATH))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
