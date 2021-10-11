Return-Path: <SRS0=49zi=O7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3902EC433F5
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 22:00:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2BF060184
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 22:00:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D2BF060184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88144403F0;
	Mon, 11 Oct 2021 22:00:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GwanZgIOAvwz; Mon, 11 Oct 2021 22:00:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E81C404EF;
	Mon, 11 Oct 2021 22:00:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6582A1BF865
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 22:00:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 54AF1403C8
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 22:00:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2FJE2Cqr3WfV for <buildroot@lists.busybox.net>;
 Mon, 11 Oct 2021 22:00:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D0B6A403D4
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 22:00:37 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id m22so60604060wrb.0
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 15:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q2KGL+YOWde6mo2HdGVn5eepa6dM+ox8y8nMBMH+cbM=;
 b=LGTehJCjXHoz1z7m6DBjdIF/VbR17zqK9nf6P8YW5Yx9A3MLZPcN8GrTWshsaVvU9D
 zod7qCWOPGv0c4hQ08x9xlouAtTB1Nx4Z3DAWYzXXtnpEEDA9zOdOSo65cfuS/0ZL0Bg
 EZaJU44oWDS+gw0UhuQTcIO8UyWVb9K5Dd4inqsmZRZ0abRCmY/GDngom4EoZzG/Syur
 gzIljpONOx7t8KoVQJAMyUzqXH+0uDhnyWdY/EFkH7YKSzIyWPfld08DvytHgzAw0Tu/
 scJnQdEQV8NkrHyOWE6wzkad/+wZlP4JbZCiXYeaVYTwcRfTOoecBeRKFRt2CUDtRHc6
 Uorw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q2KGL+YOWde6mo2HdGVn5eepa6dM+ox8y8nMBMH+cbM=;
 b=ux3pjSRwlrvwKaBwP4F9OV+4L6j3n84BpnVW+wtyCegSpwh3FAIUHhw72Q1Ge95mlL
 5KNGXbPls0yJOBWVkk/E+LTnM5zQx8J1zLmq0zPaKwz4MObAGH45upfMTxTqM6OiawRa
 J+28dJl8yh04E6FivT2hqiG1eD7zWZJCOAvhPDimm5NGK8FrgHsqtttr4Sw2mqXr4rb3
 iqnbcicZFIipjediIJVhXheZl/tC2pCPXxOIOFbt7z/KLrkQZoiAuzt6MLVFtBISczQi
 wlOeCoGHVBxs8EKBRN5jjg38MJFa0PLNle1UsQQR7m8GNp4TEysyDvsj2LDpmfjIZBQk
 LMDg==
X-Gm-Message-State: AOAM533hFSzh/WOuF6q8HHIGW4KjoA9YxNuaCJzAX3t47Og7JvRPF1NS
 c1B4hyRZ5X6NYSiGIhPvfG2S0lpQH90=
X-Google-Smtp-Source: ABdhPJz9YOMCrkA3SsyyufjzK3bG8RjX+8TraNwXlHHoILGJPJChIeo74jya6O3bFkia+G5lyVFUMQ==
X-Received: by 2002:adf:de07:: with SMTP id b7mr13714686wrm.56.1633989635918; 
 Mon, 11 Oct 2021 15:00:35 -0700 (PDT)
Received: from dell5510.suse.de (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id g25sm9214992wrc.88.2021.10.11.15.00.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 15:00:35 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 12 Oct 2021 00:00:23 +0200
Message-Id: <20211011220025.7998-2-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211011220025.7998-1-petr.vorel@gmail.com>
References: <20211011220025.7998-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [RFC PATCH 1/3] make: support: use `command -v' instead
 of `which'
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Markus Mayer <mmayer@broadcom.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

`which' has been discontinued after 2.21 release in 2015 due this (git
repository is empty [1]) and version shipped in Debian produces warning
[2]:

/usr/bin/which: this version of `which' is deprecated; use `command -v' in scripts instead.

`command is POSIX [3] and supported on all common shells (bash, zsh,
dash, busybox sh, mksh).

NOTE: originally merged as ca6a2907c2, but it had to be reverted due
errors [4] (originally reported [5]). Problems were:

1) Main problem was that make sometimes expected `command' as a
   binary/script and run it with execve() (or any other exec*()
   wrapper), instead of running it through a shell via system() [4]:

    $ make defconfig
    [...]
    $ make help
    make[1]: command: Command not found
    [...]

   Fixed by not relying to $(shell command -v ...) but shell with:
   $(shell $(SHELL) -c "command -v ...").

2) `command -v' handles only first parameter (unlike `which') [4].
   Hopefully fixed with quoting variables. Quoting variables is also
   needed, because both `command -v' without args and `type -p' exit 0.

Patch tested on both bash and dash as /bin/sh on various distros with
having different make versions, including these previously affected
(4.2.1, 4.0, 3.81).

[1] https://git.savannah.gnu.org/cgit/which.git
[2] https://salsa.debian.org/debian/debianutils/-/commit/3a8dd10b4502f7bae8fc6973c13ce23fc9da7efb
[3] https://pubs.opengroup.org/onlinepubs/9699919799/utilities/command.html
[4] https://lore.kernel.org/buildroot/20210930200402.GO1504958@scaer/
[5] https://lore.kernel.org/buildroot/YVTIghzHs82uFBIe@pevik/T/#m95c17eb8374e4e3dd6eee700d397aa12cca0739e

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 Makefile                                      | 22 +++++++++----------
 package/Makefile.in                           |  8 +++----
 support/dependencies/check-host-bison-flex.mk |  4 ++--
 support/dependencies/check-host-cmake.sh      |  2 +-
 support/dependencies/check-host-gzip.sh       |  2 +-
 support/dependencies/check-host-lzip.sh       |  4 ++--
 support/dependencies/check-host-python3.sh    |  2 +-
 support/dependencies/check-host-tar.sh        |  4 ++--
 support/dependencies/check-host-xzcat.sh      |  4 ++--
 support/dependencies/dependencies.sh          | 16 +++++++-------
 .../pkg-toolchain-external.mk                 |  2 +-
 11 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/Makefile b/Makefile
index c960b53a6d..2317655272 100644
--- a/Makefile
+++ b/Makefile
@@ -284,12 +284,12 @@ HOSTAS := as
 endif
 ifndef HOSTCC
 HOSTCC := gcc
-HOSTCC := $(shell which $(HOSTCC) || type -p $(HOSTCC) || echo gcc)
+HOSTCC := $(shell $(SHELL) -c "command -v '$(HOSTCC)' || type -p '$(HOSTCC)' || echo gcc")
 endif
 HOSTCC_NOCCACHE := $(HOSTCC)
 ifndef HOSTCXX
 HOSTCXX := g++
-HOSTCXX := $(shell which $(HOSTCXX) || type -p $(HOSTCXX) || echo g++)
+HOSTCXX := $(shell $(SHELL) -c "command -v '$(HOSTCXX)' || type -p '$(HOSTCXX)' || echo g++")
 endif
 HOSTCXX_NOCCACHE := $(HOSTCXX)
 ifndef HOSTCPP
@@ -310,15 +310,15 @@ endif
 ifndef HOSTRANLIB
 HOSTRANLIB := ranlib
 endif
-HOSTAR := $(shell which $(HOSTAR) || type -p $(HOSTAR) || echo ar)
-HOSTAS := $(shell which $(HOSTAS) || type -p $(HOSTAS) || echo as)
-HOSTCPP := $(shell which $(HOSTCPP) || type -p $(HOSTCPP) || echo cpp)
-HOSTLD := $(shell which $(HOSTLD) || type -p $(HOSTLD) || echo ld)
-HOSTLN := $(shell which $(HOSTLN) || type -p $(HOSTLN) || echo ln)
-HOSTNM := $(shell which $(HOSTNM) || type -p $(HOSTNM) || echo nm)
-HOSTOBJCOPY := $(shell which $(HOSTOBJCOPY) || type -p $(HOSTOBJCOPY) || echo objcopy)
-HOSTRANLIB := $(shell which $(HOSTRANLIB) || type -p $(HOSTRANLIB) || echo ranlib)
-SED := $(shell which sed || type -p sed) -i -e
+HOSTAR := $(shell '$(SHELL)' -c "command -v '$(HOSTAR)' || type -p '$(HOSTAR)' || echo ar")
+HOSTAS := $(shell '$(SHELL)' -c "command -v '$(HOSTAS)' || type -p '$(HOSTAS)' || echo as")
+HOSTCPP := $(shell '$(SHELL)' -c "command -v '$(HOSTCPP)' || type -p '$(HOSTCPP)' || echo cpp")
+HOSTLD := $(shell '$(SHELL)' -c "command -v '$(HOSTLD)' || type -p '$(HOSTLD)' || echo ld")
+HOSTLN := $(shell '$(SHELL)' -c "command -v '$(HOSTLN)' || type -p '$(HOSTLN)' || echo ln")
+HOSTNM := $(shell '$(SHELL)' -c "command -v '$(HOSTNM)' || type -p '$(HOSTNM)' || echo nm")
+HOSTOBJCOPY := $(shell '$(SHELL)' -c "command -v '$(HOSTOBJCOPY)' || type -p '$(HOSTOBJCOPY)' || echo objcopy")
+HOSTRANLIB := $(shell '$(SHELL)' -c "command -v '$(HOSTRANLIB)' || type -p '$(HOSTRANLIB)' || echo ranlib")
+SED := $(shell $(SHELL) -c "command -v sed || type -p sed") -i -e
 
 export HOSTAR HOSTAS HOSTCC HOSTCXX HOSTLD
 export HOSTCC_NOCCACHE HOSTCXX_NOCCACHE
diff --git a/package/Makefile.in b/package/Makefile.in
index 86db62ba5b..2ba4d8b381 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -4,7 +4,7 @@ endif
 ifndef HOSTMAKE
 HOSTMAKE = $(MAKE)
 endif
-HOSTMAKE := $(shell which $(HOSTMAKE) || type -p $(HOSTMAKE) || echo make)
+HOSTMAKE := $(shell $(SHELL) -c "command -v '$(HOSTMAKE)' || type -p '$(HOSTMAKE)' || echo make")
 
 # If BR2_JLEVEL is 0, scale the maximum concurrency with the number of
 # CPUs. An additional job is used in order to keep processors busy
@@ -222,8 +222,8 @@ else
 TARGET_STRIP = /bin/true
 STRIPCMD = $(TARGET_STRIP)
 endif
-INSTALL := $(shell which install || type -p install)
-UNZIP := $(shell which unzip || type -p unzip) -q
+INSTALL := $(shell $(SHELL) -c "command -v install || type -p install")
+UNZIP := $(shell $(SHELL) -c "command -v unzip || type -p unzip") -q
 
 APPLY_PATCHES = PATH=$(HOST_DIR)/bin:$$PATH support/scripts/apply-patches.sh $(if $(QUIET),-s)
 
@@ -237,7 +237,7 @@ HOST_LDFLAGS  += -L$(HOST_DIR)/lib -Wl,-rpath,$(HOST_DIR)/lib
 # the path to the system perl, before a host-perl built by Buildroot
 # might get installed into $(HOST_DIR)/bin and therefore appears
 # in our PATH. This system perl will be used as INTLTOOL_PERL.
-export PERL=$(shell which perl)
+export PERL=$(shell $(SHELL) -c "command -v perl")
 
 # host-intltool needs libxml-parser-perl, which Buildroot installs in
 # $(HOST_DIR)/lib/perl, so we must make sure that the system perl
diff --git a/support/dependencies/check-host-bison-flex.mk b/support/dependencies/check-host-bison-flex.mk
index 14a232fd44..b6cec369f1 100644
--- a/support/dependencies/check-host-bison-flex.mk
+++ b/support/dependencies/check-host-bison-flex.mk
@@ -5,10 +5,10 @@
 # that runs on host, e.g. Kconfig. To build code for target use plain
 # host-{bison,flex}.
 
-ifeq ($(shell which bison 2>/dev/null),)
+ifeq ($(shell $(SHELL) -c "command -v bison 2>/dev/null"),)
 BR2_BISON_HOST_DEPENDENCY = host-bison
 endif
 
-ifeq ($(shell which flex 2>/dev/null),)
+ifeq ($(shell $(SHELL) -c "command -v flex 2>/dev/null"),)
 BR2_FLEX_HOST_DEPENDENCY = host-flex
 endif
diff --git a/support/dependencies/check-host-cmake.sh b/support/dependencies/check-host-cmake.sh
index fadeae9f6b..f202d72a98 100755
--- a/support/dependencies/check-host-cmake.sh
+++ b/support/dependencies/check-host-cmake.sh
@@ -11,7 +11,7 @@ shift
 for candidate; do
 
     # Try to locate the candidate. Discard it if not located.
-    cmake=`which "${candidate}" 2>/dev/null`
+    cmake=`command -v "${candidate}" 2>/dev/null`
     [ -n "${cmake}" ] || continue
 
     # Extract version X.Y from versions in the form X.Y or X.Y.Z
diff --git a/support/dependencies/check-host-gzip.sh b/support/dependencies/check-host-gzip.sh
index 5f344c5f9b..4dbce72676 100755
--- a/support/dependencies/check-host-gzip.sh
+++ b/support/dependencies/check-host-gzip.sh
@@ -2,7 +2,7 @@
 
 candidate="$1" # ignored
 
-gzip="$(which gzip)"
+gzip="$(command -v gzip)"
 if [ ! -x "${gzip}" ]; then
     # echo nothing: no suitable gzip found
     exit 1
diff --git a/support/dependencies/check-host-lzip.sh b/support/dependencies/check-host-lzip.sh
index 4f8a2ba3de..5cdfb8252a 100755
--- a/support/dependencies/check-host-lzip.sh
+++ b/support/dependencies/check-host-lzip.sh
@@ -2,9 +2,9 @@
 
 candidate="$1"
 
-lzip=`which $candidate 2>/dev/null`
+lzip=`command -v "$candidate" 2>/dev/null`
 if [ ! -x "$lzip" ]; then
-	lzip=`which lzip 2>/dev/null`
+	lzip=`command -v lzip 2>/dev/null`
 	if [ ! -x "$lzip" ]; then
 		# echo nothing: no suitable lzip found
 		exit 1
diff --git a/support/dependencies/check-host-python3.sh b/support/dependencies/check-host-python3.sh
index 17cafd2883..ca504da6ac 100755
--- a/support/dependencies/check-host-python3.sh
+++ b/support/dependencies/check-host-python3.sh
@@ -14,7 +14,7 @@ shift
 # a more recent version.
 
 for candidate in "${@}" ; do
-	python3=`which $candidate 2>/dev/null`
+	python3=`command -v "$candidate" 2>/dev/null`
 	if [ ! -x "$python3" ]; then
 		continue
 	fi
diff --git a/support/dependencies/check-host-tar.sh b/support/dependencies/check-host-tar.sh
index b7d607a47a..0f0f80038d 100755
--- a/support/dependencies/check-host-tar.sh
+++ b/support/dependencies/check-host-tar.sh
@@ -2,9 +2,9 @@
 
 candidate="$1"
 
-tar=`which $candidate`
+tar=`command -v "$candidate"`
 if [ ! -x "$tar" ]; then
-	tar=`which tar`
+	tar=`command -v tar`
 	if [ ! -x "$tar" ]; then
 		# echo nothing: no suitable tar found
 		exit 1
diff --git a/support/dependencies/check-host-xzcat.sh b/support/dependencies/check-host-xzcat.sh
index 10f1c4562a..a022c64faf 100755
--- a/support/dependencies/check-host-xzcat.sh
+++ b/support/dependencies/check-host-xzcat.sh
@@ -2,9 +2,9 @@
 
 candidate="$1"
 
-xzcat=`which $candidate 2>/dev/null`
+xzcat=`command -v "$candidate" 2>/dev/null`
 if [ ! -x "$xzcat" ]; then
-	xzcat=`which xzcat 2>/dev/null`
+	xzcat=`command -v xzcat 2>/dev/null`
 	if [ ! -x "$xzcat" ]; then
 		# echo nothing: no suitable xzcat found
 		exit 1
diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index c604a9efcc..e720e9372e 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -58,7 +58,7 @@ fi
 check_prog_host()
 {
 	prog="$1"
-	if ! which $prog > /dev/null ; then
+	if ! command -v "$prog" > /dev/null ; then
 		echo >&2
 		echo "You must install '$prog' on your build machine" >&2
 		exit 1
@@ -75,7 +75,7 @@ check_prog_host "sed"
 check_prog_host "/usr/bin/file"
 
 # Check make
-MAKE=$(which make 2> /dev/null)
+MAKE=$(command -v make 2> /dev/null)
 if [ -z "$MAKE" ] ; then
 	echo
 	echo "You must install 'make' on your build machine";
@@ -96,9 +96,9 @@ if [ $MAKE_MAJOR -lt 3 ] || [ $MAKE_MAJOR -eq 3 -a $MAKE_MINOR -lt 81 ] ; then
 fi;
 
 # Check host gcc
-COMPILER=$(which $HOSTCC_NOCCACHE 2> /dev/null)
+COMPILER=$(command -v "$HOSTCC_NOCCACHE" 2> /dev/null)
 if [ -z "$COMPILER" ] ; then
-	COMPILER=$(which cc 2> /dev/null)
+	COMPILER=$(command -v cc 2> /dev/null)
 fi;
 if [ -z "$COMPILER" ] ; then
 	echo
@@ -122,9 +122,9 @@ if [ $COMPILER_MAJOR -lt 4 -o $COMPILER_MAJOR -eq 4 -a $COMPILER_MINOR -lt 8 ] ;
 fi;
 
 # check for host CXX
-CXXCOMPILER=$(which $HOSTCXX_NOCCACHE 2> /dev/null)
+CXXCOMPILER=$(command -v "$HOSTCXX_NOCCACHE" 2> /dev/null)
 if [ -z "$CXXCOMPILER" ] ; then
-	CXXCOMPILER=$(which c++ 2> /dev/null)
+	CXXCOMPILER=$(command -v c++ 2> /dev/null)
 fi
 
 if [ -z "$CXXCOMPILER" ] ; then
@@ -164,7 +164,7 @@ fi
 # Check that a few mandatory programs are installed
 missing_progs="no"
 for prog in perl tar wget cpio unzip rsync bc ${DL_TOOLS} ; do
-	if ! which $prog > /dev/null ; then
+	if ! command -v "$prog" > /dev/null ; then
 		echo "You must install '$prog' on your build machine";
 		missing_progs="yes"
 		if test $prog = "svn" ; then
@@ -198,7 +198,7 @@ if [ "${PATCH_MAJOR}" -lt 2 ] || [ "${PATCH_MAJOR}" -eq 2 -a "${PATCH_MINOR}" -l
 fi
 
 if grep ^BR2_NEEDS_HOST_UTF8_LOCALE=y $BR2_CONFIG > /dev/null; then
-	if ! which locale > /dev/null ; then
+	if ! command -v locale > /dev/null ; then
 		echo
 		echo "You need locale support on your build machine to build a toolchain supporting locales"
 		exit 1 ;
diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 68d7a3fe21..2d9d9a5d49 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -74,7 +74,7 @@ endif
 ifeq ($(TOOLCHAIN_EXTERNAL_INSTALL_DIR),)
 ifneq ($(TOOLCHAIN_EXTERNAL_PREFIX),)
 # if no path set, figure it out from path
-TOOLCHAIN_EXTERNAL_BIN := $(dir $(shell which $(TOOLCHAIN_EXTERNAL_PREFIX)-gcc))
+TOOLCHAIN_EXTERNAL_BIN := $(dir $(shell $(SHELL) -c "command -v '$(TOOLCHAIN_EXTERNAL_PREFIX)-gcc)'")
 endif
 else
 TOOLCHAIN_EXTERNAL_REL_BIN_PATH = $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_REL_BIN_PATH))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
