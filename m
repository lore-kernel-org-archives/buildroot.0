Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40BAFC433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:51:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08F4761165
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 08F4761165
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7779402FC;
	Tue, 21 Sep 2021 20:51:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ib9r8SAKD8QO; Tue, 21 Sep 2021 20:51:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C81CF40311;
	Tue, 21 Sep 2021 20:51:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8A8BC1BF47E
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2861A60ABF
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:51:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pe2gQJwBRO5Z for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 20:51:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B719160A3C
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 20:51:20 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id bx4so1355522edb.4
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 13:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1PSwUzMnKdNfA6htWI5RY6efa7W8o7scyykXLuPvvE0=;
 b=mjlI8ZELdT1gUJQhDyONqRsNj5udjE2nb5NqMb6dF76kldQ/iS0ivjd00z+VoPiqT6
 Oqfr5/Quld7yoAAlYVSKoSSVbyGfm6sBizpMjLOstVcOo6hcU8whWFroytRgMQQISrWp
 i/ODwj8uHXkbabz1miASw9+kMGE8W7HxdJXjHaPS02roj7XNU/7/psLuUvw7b6kkIlfj
 Y3jpZN3oxQBkBWkyOl/3qOsqBYWFpjC4h6M8RZi6lSgpkXq+XNlia3e2/y8hHvOZ5UZp
 5FF0d/xOCFYgULC49831HwXC/K74EpGJPXXl0I2niSQt9c4tPYuK8b4oKUtg/QGZKSZA
 B8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1PSwUzMnKdNfA6htWI5RY6efa7W8o7scyykXLuPvvE0=;
 b=fnuarOMWiwyiT6teVJcIGdE0PLjxQ70mD2ATkmmoRf8ef6if+CSznvGifVC3d8ue1f
 KsJJxon7oT9FD9vcKcp+8KBT9wbA70o5A6m6GluRWCT1zRm6J3pObGwDN+LMQbEOdHzL
 /MVLzP5/K2tSgYksm5rPsTy/ofNm+S+N7rErSZ2Qp7mZFkd8CItz3l1563wRzNBP6rJ1
 /h/ClN4d6d0tFpYj951zO7SLAgCODgm0+hIpWrbwppVq0FINnH4qyJ6nnZJBswkBvmFV
 6BJrCMYLW69KgIadd7KDYoNxTY/qpa2eXhtCOKwe4jvpALQlEfwlHBVl9SDMMLGB5V6v
 VXRw==
X-Gm-Message-State: AOAM530feQsFcwDtEU7LeciTHx4/nLa/RrYM76IYy4bdNiQOwXfIEQVK
 PXv9Cj/2hMXlongI11d352c6+JzQRss=
X-Google-Smtp-Source: ABdhPJyJMl3OsACV3froY2CDOv2hFvRy/1cZT7FKxM9eEfJgr7q3Bk2WCxUzvgWDZMEJysvbF/t+bw==
X-Received: by 2002:aa7:db85:: with SMTP id u5mr37526883edt.234.1632257478840; 
 Tue, 21 Sep 2021 13:51:18 -0700 (PDT)
Received: from localhost.localdomain (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id f18sm15093edt.60.2021.09.21.13.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 13:51:18 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Sep 2021 22:51:11 +0200
Message-Id: <20210921205112.39176-2-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921205112.39176-1-petr.vorel@gmail.com>
References: <20210921205112.39176-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [RFC PATCH 1/2] make: support: use `command -v' instead
 of `which'
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

`which' has been discontinued after 2.21 release in 2015 due this (git
repository is empty [1]) and version shipped in Debian produces warning
[2]:

/usr/bin/which: this version of `which' is deprecated; use `command -v' in scripts instead.

`command is POSIX [3] and supported on all common shells (bash, zsh,
dash, busybox sh, mksh).

Patch tested on dash as the default shell.

[1] https://git.savannah.gnu.org/cgit/which.git
[2] https://salsa.debian.org/debian/debianutils/-/commit/3a8dd10b4502f7bae8fc6973c13ce23fc9da7efb
[3] https://pubs.opengroup.org/onlinepubs/9699919799/utilities/command.html

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
index c960b53a6d..1b080bc10f 100644
--- a/Makefile
+++ b/Makefile
@@ -284,12 +284,12 @@ HOSTAS := as
 endif
 ifndef HOSTCC
 HOSTCC := gcc
-HOSTCC := $(shell which $(HOSTCC) || type -p $(HOSTCC) || echo gcc)
+HOSTCC := $(shell command -v $(HOSTCC) || type -p $(HOSTCC) || echo gcc)
 endif
 HOSTCC_NOCCACHE := $(HOSTCC)
 ifndef HOSTCXX
 HOSTCXX := g++
-HOSTCXX := $(shell which $(HOSTCXX) || type -p $(HOSTCXX) || echo g++)
+HOSTCXX := $(shell command -v $(HOSTCXX) || type -p $(HOSTCXX) || echo g++)
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
+HOSTAR := $(shell command -v $(HOSTAR) || type -p $(HOSTAR) || echo ar)
+HOSTAS := $(shell command -v $(HOSTAS) || type -p $(HOSTAS) || echo as)
+HOSTCPP := $(shell command -v $(HOSTCPP) || type -p $(HOSTCPP) || echo cpp)
+HOSTLD := $(shell command -v $(HOSTLD) || type -p $(HOSTLD) || echo ld)
+HOSTLN := $(shell command -v $(HOSTLN) || type -p $(HOSTLN) || echo ln)
+HOSTNM := $(shell command -v $(HOSTNM) || type -p $(HOSTNM) || echo nm)
+HOSTOBJCOPY := $(shell command -v $(HOSTOBJCOPY) || type -p $(HOSTOBJCOPY) || echo objcopy)
+HOSTRANLIB := $(shell command -v $(HOSTRANLIB) || type -p $(HOSTRANLIB) || echo ranlib)
+SED := $(shell command -v sed || type -p sed) -i -e
 
 export HOSTAR HOSTAS HOSTCC HOSTCXX HOSTLD
 export HOSTCC_NOCCACHE HOSTCXX_NOCCACHE
diff --git a/package/Makefile.in b/package/Makefile.in
index 86db62ba5b..09092fad54 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -4,7 +4,7 @@ endif
 ifndef HOSTMAKE
 HOSTMAKE = $(MAKE)
 endif
-HOSTMAKE := $(shell which $(HOSTMAKE) || type -p $(HOSTMAKE) || echo make)
+HOSTMAKE := $(shell command -v $(HOSTMAKE) || type -p $(HOSTMAKE) || echo make)
 
 # If BR2_JLEVEL is 0, scale the maximum concurrency with the number of
 # CPUs. An additional job is used in order to keep processors busy
@@ -222,8 +222,8 @@ else
 TARGET_STRIP = /bin/true
 STRIPCMD = $(TARGET_STRIP)
 endif
-INSTALL := $(shell which install || type -p install)
-UNZIP := $(shell which unzip || type -p unzip) -q
+INSTALL := $(shell command -v install || type -p install)
+UNZIP := $(shell command -v unzip || type -p unzip) -q
 
 APPLY_PATCHES = PATH=$(HOST_DIR)/bin:$$PATH support/scripts/apply-patches.sh $(if $(QUIET),-s)
 
@@ -237,7 +237,7 @@ HOST_LDFLAGS  += -L$(HOST_DIR)/lib -Wl,-rpath,$(HOST_DIR)/lib
 # the path to the system perl, before a host-perl built by Buildroot
 # might get installed into $(HOST_DIR)/bin and therefore appears
 # in our PATH. This system perl will be used as INTLTOOL_PERL.
-export PERL=$(shell which perl)
+export PERL=$(shell command -v perl)
 
 # host-intltool needs libxml-parser-perl, which Buildroot installs in
 # $(HOST_DIR)/lib/perl, so we must make sure that the system perl
diff --git a/support/dependencies/check-host-bison-flex.mk b/support/dependencies/check-host-bison-flex.mk
index 14a232fd44..e5db578941 100644
--- a/support/dependencies/check-host-bison-flex.mk
+++ b/support/dependencies/check-host-bison-flex.mk
@@ -5,10 +5,10 @@
 # that runs on host, e.g. Kconfig. To build code for target use plain
 # host-{bison,flex}.
 
-ifeq ($(shell which bison 2>/dev/null),)
+ifeq ($(shell command -v bison 2>/dev/null),)
 BR2_BISON_HOST_DEPENDENCY = host-bison
 endif
 
-ifeq ($(shell which flex 2>/dev/null),)
+ifeq ($(shell command -v flex 2>/dev/null),)
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
index 4f8a2ba3de..ffd20e2809 100755
--- a/support/dependencies/check-host-lzip.sh
+++ b/support/dependencies/check-host-lzip.sh
@@ -2,9 +2,9 @@
 
 candidate="$1"
 
-lzip=`which $candidate 2>/dev/null`
+lzip=`command -v $candidate 2>/dev/null`
 if [ ! -x "$lzip" ]; then
-	lzip=`which lzip 2>/dev/null`
+	lzip=`command -v lzip 2>/dev/null`
 	if [ ! -x "$lzip" ]; then
 		# echo nothing: no suitable lzip found
 		exit 1
diff --git a/support/dependencies/check-host-python3.sh b/support/dependencies/check-host-python3.sh
index 17cafd2883..7b3f4f8451 100755
--- a/support/dependencies/check-host-python3.sh
+++ b/support/dependencies/check-host-python3.sh
@@ -14,7 +14,7 @@ shift
 # a more recent version.
 
 for candidate in "${@}" ; do
-	python3=`which $candidate 2>/dev/null`
+	python3=`command -v $candidate 2>/dev/null`
 	if [ ! -x "$python3" ]; then
 		continue
 	fi
diff --git a/support/dependencies/check-host-tar.sh b/support/dependencies/check-host-tar.sh
index b7d607a47a..369e1ae393 100755
--- a/support/dependencies/check-host-tar.sh
+++ b/support/dependencies/check-host-tar.sh
@@ -2,9 +2,9 @@
 
 candidate="$1"
 
-tar=`which $candidate`
+tar=`command -v $candidate`
 if [ ! -x "$tar" ]; then
-	tar=`which tar`
+	tar=`command -v tar`
 	if [ ! -x "$tar" ]; then
 		# echo nothing: no suitable tar found
 		exit 1
diff --git a/support/dependencies/check-host-xzcat.sh b/support/dependencies/check-host-xzcat.sh
index 10f1c4562a..1fbcecf0ff 100755
--- a/support/dependencies/check-host-xzcat.sh
+++ b/support/dependencies/check-host-xzcat.sh
@@ -2,9 +2,9 @@
 
 candidate="$1"
 
-xzcat=`which $candidate 2>/dev/null`
+xzcat=`command -v $candidate 2>/dev/null`
 if [ ! -x "$xzcat" ]; then
-	xzcat=`which xzcat 2>/dev/null`
+	xzcat=`command -v xzcat 2>/dev/null`
 	if [ ! -x "$xzcat" ]; then
 		# echo nothing: no suitable xzcat found
 		exit 1
diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index c604a9efcc..c5dcb86231 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -58,7 +58,7 @@ fi
 check_prog_host()
 {
 	prog="$1"
-	if ! which $prog > /dev/null ; then
+	if ! command -v $prog > /dev/null ; then
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
+COMPILER=$(command -v $HOSTCC_NOCCACHE 2> /dev/null)
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
+CXXCOMPILER=$(command -v $HOSTCXX_NOCCACHE 2> /dev/null)
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
+	if ! command -v $prog > /dev/null ; then
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
index 68d7a3fe21..e3f61294f8 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -74,7 +74,7 @@ endif
 ifeq ($(TOOLCHAIN_EXTERNAL_INSTALL_DIR),)
 ifneq ($(TOOLCHAIN_EXTERNAL_PREFIX),)
 # if no path set, figure it out from path
-TOOLCHAIN_EXTERNAL_BIN := $(dir $(shell which $(TOOLCHAIN_EXTERNAL_PREFIX)-gcc))
+TOOLCHAIN_EXTERNAL_BIN := $(dir $(shell command -v $(TOOLCHAIN_EXTERNAL_PREFIX)-gcc))
 endif
 else
 TOOLCHAIN_EXTERNAL_REL_BIN_PATH = $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_REL_BIN_PATH))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
