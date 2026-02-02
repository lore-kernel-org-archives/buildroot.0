Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9460CE7DEEF
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 14:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE7BF40B5B;
	Mon,  2 Feb 2026 14:24:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SDdcZDvTaC_U; Mon,  2 Feb 2026 14:24:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41FAC40A46
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770042252;
	bh=ZETLALxjnWg6dmWPs+EJce5NwjOSByPNisl+UjPdHLE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Tjl+VlvoJ8tu7ZergQKXzBP8GKLBQiMN36nR01en9a1OzLbDlqjmvNQzUT875pxrg
	 Nw0/f9BUkZGwKV9UR18h0sCjAgu2vCvjWUkeRaxw0CpOznwHI7QhYdCaUl1n8lWMTv
	 rg96/qOegU4/3oQgmFuL3lkyucNb9ASn2wj+o09sjEGiZRKQFMNllnDxNEO+TkZC6L
	 Ph5fwRhXSaaHlqLHuq0t2I01nsUxLTUQi87AY+bJ6yPW2iYuhE+7H+Etd/1meZKJs5
	 PGc444wYTv0ObMMkig6cpy+ORBL6q9bU8Uy/UMig8vhOiw65zgOZreW9rfoOTCmD1T
	 OwCirUpftYGpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41FAC40A46;
	Mon,  2 Feb 2026 14:24:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 43FFB23E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:24:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4009C60722
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:24:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4hcBqCDzVejb for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 14:24:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=207.54.77.171;
 helo=esa4.hc555-34.eu.iphmx.com; envelope-from=jimmy.wesolowski@mobileye.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 64108606BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64108606BD
Received: from esa4.hc555-34.eu.iphmx.com (esa4.hc555-34.eu.iphmx.com
 [207.54.77.171])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 64108606BD
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:24:08 +0000 (UTC)
X-CSE-ConnectionGUID: I0zokJS7T025kTIe5kYDSw==
X-CSE-MsgGUID: ko+gOtWkRreG/7QHgYU7dA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
 by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 16:24:04 +0200
X-CSE-ConnectionGUID: EnnlV6B1SwORiUVvnLuhwg==
X-CSE-MsgGUID: nJXTIR6SQe2uEZtfWm4k3Q==
Received: from unknown (HELO epgd074.me-corp.lan) ([10.154.54.6])
 by ces03_data.me-corp.lan with SMTP; 02 Feb 2026 16:26:10 +0200
Received: by epgd074.me-corp.lan (sSMTP sendmail emulation);
 Mon, 02 Feb 2026 16:24:03 +0200
To: buildroot@buildroot.org
Cc: guenther.harrasser@mobileye.com,
 Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
Date: Mon,  2 Feb 2026 16:23:54 +0200
Message-ID: <20260202142359.2577937-3-jimmy.wesolowski@mobileye.com>
In-Reply-To: <20260202142359.2577937-1-jimmy.wesolowski@mobileye.com>
References: <20260202142359.2577937-1-jimmy.wesolowski@mobileye.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
 t=1770042248; x=1801578248;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hoAaqxYq6fVqcMJvx7cQrIPIy+di+prW9mvz4ZmhhJg=;
 b=ViDJpYAPfNLuxxFtPhluSJnfI0TlXbxEiW7wdOKQJcD0EPXLSFFbohKc
 +vFOXgrpQbZnOZDqJyOCCtFrrxLySZhHiNmRui/BdG9ndSFy0FSVpXdli
 s/eohfiwST9tvp3HXxC4MMXvPiujquvIjyw32+FHtBpVlG3T4V8p6OJ+h
 0Q44z8ZgvYxIt1TZVV7jvjHDnuYcatDpzDa8ucLVUW6uXoo5hFbN87rga
 pn0bMoc5JiVC89U8Uz5djHZppbnlkgxr4DY9qhV7Gv66sFAEiwan3h2oV
 +tmRPlqoPKqUL0bNoFDf/xXfDVdkpWM/qJWQXIFHpEQkcatPR8aZwLvdW
 g==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mobileye.com
Subject: [Buildroot] [PATCH 3/3] package/xdp-tools: add new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Jimmy Durand Wesolowski via buildroot <buildroot@buildroot.org>
Reply-To: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This adds the XDP tools libxdp support.
Some patches are required to allow building against GCC BPF.

Some more work is needed to allow building against GCC or against Clang,
and to verify the support of the other components of XDP tools (xdp-bench,
xdp-dump, ...).

Change-Id: Ic389bcaa044ba8c176c5b92294d3d808bb0aefa6
Signed-off-by: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
---
 package/Config.in                             |   1 +
 ...le-add-support-for-other-BPF-compile.patch | 213 ++++++++++++++++++
 package/xdp-tools/Config.in                   |  61 +++++
 package/xdp-tools/xdp-tools.hash              |   5 +
 package/xdp-tools/xdp-tools.mk                | 110 +++++++++
 5 files changed, 390 insertions(+)
 create mode 100644 package/xdp-tools/0001-configure-Makefile-add-support-for-other-BPF-compile.patch
 create mode 100644 package/xdp-tools/Config.in
 create mode 100644 package/xdp-tools/xdp-tools.hash
 create mode 100644 package/xdp-tools/xdp-tools.mk

diff --git a/package/Config.in b/package/Config.in
index 94ea56b297..ff16b95d69 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -160,6 +160,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/valgrind/Config.in"
 	source "package/vmtouch/Config.in"
 	source "package/whetstone/Config.in"
+	source "package/xdp-tools/Config.in"
 endmenu
 
 menu "Development tools"
diff --git a/package/xdp-tools/0001-configure-Makefile-add-support-for-other-BPF-compile.patch b/package/xdp-tools/0001-configure-Makefile-add-support-for-other-BPF-compile.patch
new file mode 100644
index 0000000000..cef3c3798f
--- /dev/null
+++ b/package/xdp-tools/0001-configure-Makefile-add-support-for-other-BPF-compile.patch
@@ -0,0 +1,213 @@
+From 75844533449ce924f7798feda42747c130b7359b Mon Sep 17 00:00:00 2001
+From: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
+Date: Mon, 26 Jan 2026 12:23:44 +0200
+Subject: [PATCH] configure/Makefile: add support for other BPF compilers
+
+We should allow other compilers than Clang for BPF. Now that the support
+for BPF in GCC is completed (https://lwn.net/Articles/975412/), it should
+be possible to compile XDP tools with GCC.
+
+Upstream: N/A not yet upstreamed to XDP tools.
+
+Signed-off-by: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
+---
+ configure                 | 74 +++++++++++++++++++++++++++------------
+ lib/common.mk             |  2 +-
+ lib/libxdp/Makefile       |  2 +-
+ lib/libxdp/tests/Makefile |  2 +-
+ lib/util/Makefile         |  2 +-
+ 5 files changed, 55 insertions(+), 27 deletions(-)
+
+diff --git a/configure b/configure
+index f363ef6..acbb581 100755
+--- a/configure
++++ b/configure
+@@ -3,6 +3,8 @@
+ # This is not an autoconf generated configure
+ #
+ 
++set -e -o pipefail
++
+ # Output file which is input to Makefile
+ CONFIG_FINAL=config.mk
+ CONFIG=".${CONFIG}.tmp"
+@@ -20,7 +22,6 @@ check_opts()
+     echo "PRODUCTION:=${PRODUCTION}" >>$CONFIG
+     echo "DYNAMIC_LIBXDP:=${DYNAMIC_LIBXDP}" >>$CONFIG
+     echo "MAX_DISPATCHER_ACTIONS:=${MAX_DISPATCHER_ACTIONS}" >>$CONFIG
+-    echo "BPF_TARGET:=${BPF_TARGET}" >>$CONFIG
+ }
+ 
+ find_tool()
+@@ -54,13 +55,14 @@ find_tool()
+ check_toolchain()
+ {
+     local emacs_version
+-    local clang_version
++    local bpf_compiler_version
++    local bpf_compiler_major
+     local bpftool_version
+ 
+     : ${PKG_CONFIG:=pkg-config}
+     : ${CC=gcc}
+     : ${OBJCOPY=objcopy}
+-    : ${CLANG=clang}
++    : ${BPF_COMPILER=clang}
+     : ${M4=m4}
+     : ${EMACS=emacs}
+     : ${BPFTOOL=bpftool}
+@@ -68,9 +70,9 @@ check_toolchain()
+     : ${ARCH_INCLUDES=}
+     : ${ARCH_NAME=}
+ 
+-    CLANG=$(find_tool clang "$CLANG")
++    BPF_COMPILER=$(find_tool "${BPF_COMPILER}" "${BPF_COMPILER}")
+ 
+-    for TOOL in $PKG_CONFIG $CC $OBJCOPY $CLANG $M4 $READELF; do
++    for TOOL in $PKG_CONFIG $CC $OBJCOPY $BPF_COMPILER $M4 $READELF; do
+         if [ ! $(command -v ${TOOL} 2>/dev/null) ]; then
+             echo "*** ERROR: Cannot find tool ${TOOL}" ;
+             exit 1;
+@@ -79,17 +81,42 @@ check_toolchain()
+ 
+     ARCH_NAME=$($CC -print-multiarch 2>/dev/null)
+ 
+-    clang_version=$($CLANG --version | sed -nE 's/.*clang version ([[:digit:]]+).*/\1/p')
+-    if [ "$?" -ne "0" ]; then
+-        echo "*** ERROR: Couldn't execute '$CLANG --version'"
+-        exit 1
+-    fi
+-
+-    echo "Found clang binary '$CLANG' with version $clang_version (from '$($CLANG --version | head -n 1)')"
+-    if [ "$clang_version" -lt "11" ]; then
+-        echo "*** ERROR: Need LLVM version 11+, '$CLANG' is version $clang_version"
+-        [ -n "$RELAXED_LLVM_VERSION" ] || exit 1
+-    fi
++    case ${BPF_COMPILER} in
++	*clang* )
++	    if ! bpf_compiler_version=$("${BPF_COMPILER}" --version | head -n1); then
++		echo "*** ERROR: Couldn't execute '${BPF_COMPILER} --version'"
++		exit 1
++	    fi
++	    bpf_compiler_major=$(
++		echo "${bpf_compiler_version}" \
++		    | sed -nE 's/.*clang version ([[:digit:]]+).*/\1/p')
++	    echo "Found clang binary '${BPF_COMPILER}' with version ${bpf_compiler_version}"
++	    if [ "$bpf_compiler_major" -lt "11" ]; then
++		echo "*** ERROR: Need LLVM version 11+, '${BPF_COMPILER}' is version ${bpf_compiler_version}"
++		[ -n "$RELAXED_LLVM_VERSION" ] || exit 1
++	    fi
++	    BPF_CFLAGS="${BPF_CFLAGS} -target \"${BPF_TARGET}\""
++	    ;;
++
++	*gcc* )
++	    if ! bpf_compiler_version=$("${BPF_COMPILER}" -dumpversion); then
++		echo "*** ERROR: Couldn't execute '${BPF_COMPILER} -dumpversion'"
++		exit 1
++	    fi
++	    bpf_compiler_major="$( \
++		echo "${bpf_compiler_version}" \
++		    | sed --regexp-extended 's|([[:digit:]]+)\..+|\1|')"
++	    echo "Found GCC binary '${BPF_COMPILER}' with version ${bpf_compiler_version}"
++	    if [ "${bpf_compiler_major}" -lt 15 ]; then
++		echo "*** ERROR: Need GCC version 15+, '${BPF_COMPILER}' is version ${bpf_compiler_version}"
++	    fi
++	    ;;
++
++	* )
++	    echo "*** ERROR: Unknown compiler ${BPF_COMPILER}"
++	    exit 1
++	    ;;
++    esac
+ 
+     if ! command -v $EMACS >/dev/null 2>&1; then
+         EMACS=""
+@@ -128,12 +155,13 @@ check_toolchain()
+     echo "PKG_CONFIG:=${PKG_CONFIG}" >>$CONFIG
+     echo "CC:=${CC}" >>$CONFIG
+     echo "OBJCOPY:=${OBJCOPY}" >>$CONFIG
+-    echo "CLANG:=${CLANG}" >>$CONFIG
++    echo "BPF_COMPILER:=${BPF_COMPILER}" >>$CONFIG
+     echo "M4:=${M4}" >>$CONFIG
+     echo "EMACS:=${EMACS}" >>$CONFIG
+     echo "ARCH_INCLUDES:=$ARCH_INCLUDES" >> $CONFIG
+     echo "READELF:=${READELF}" >> $CONFIG
+     echo "BPFTOOL:=${BPFTOOL}" >> $CONFIG
++    echo "BPF_CFLAGS+=${BPF_CFLAGS}" >> $CONFIG
+     [ -n "$BPFTOOL" ] && echo "HAVE_FEATURES+=BPFTOOL" >>"$CONFIG"
+ }
+ 
+@@ -442,12 +470,12 @@ endif
+ 
+ 
+ ifeq (\$(VERBOSE), 0)
+-    QUIET_CC       = @echo '    CC       '\$@;
+-    QUIET_CLANG    = @echo '    CLANG    '\$@;
+-    QUIET_LINK     = @echo '    LINK     '\$@;
+-    QUIET_INSTALL  = @echo '    INSTALL  '\$@;
+-    QUIET_M4       = @echo '    M4       '\$@;
+-    QUIET_GEN      = @echo '    GEN      '\$@;
++    QUIET_CC           = @echo '    CC       '\$@;
++    QUIET_BPF_COMPILER = @echo '    CC_BPF   '\$@;
++    QUIET_LINK         = @echo '    LINK     '\$@;
++    QUIET_INSTALL      = @echo '    INSTALL  '\$@;
++    QUIET_M4           = @echo '    M4       '\$@;
++    QUIET_GEN          = @echo '    GEN      '\$@;
+ endif
+ EOF
+ }
+diff --git a/lib/common.mk b/lib/common.mk
+index ce24c48..15b438b 100644
+--- a/lib/common.mk
++++ b/lib/common.mk
+@@ -108,7 +108,7 @@ $(ALL_EXEC_TARGETS): %: %.c  $(OBJECT_LIBBPF) $(OBJECT_LIBXDP) $(LIBMK) $(LIB_OB
+ 	 $< $(USER_EXTRA_C) $(LDLIBS)
+ 
+ $(XDP_OBJ): %.o: %.c $(KERN_USER_H) $(EXTRA_DEPS) $(BPF_HEADERS) $(LIBMK)
+-	$(QUIET_CLANG)$(CLANG) -target $(BPF_TARGET) $(BPF_CFLAGS) -O2 -c -g -o $@ $<
++	$(QUIET_BPF_COMPILER)$(BPF_COMPILER) $(BPF_CFLAGS) -O2 -c -g -o $@ $<
+ 
+ $(BPF_SKEL_H): %.skel.h: %.bpf.o
+ 	$(QUIET_GEN)$(BPFTOOL) gen skeleton $< name $(notdir ${@:.skel.h=}) > $@
+diff --git a/lib/libxdp/Makefile b/lib/libxdp/Makefile
+index 7ea7e7e..78c2f8b 100644
+--- a/lib/libxdp/Makefile
++++ b/lib/libxdp/Makefile
+@@ -138,7 +138,7 @@ $(EMBEDDED_XDP_OBJS): %.embed.o: %.o
+ 	$(Q)$(OBJCOPY)  --rename-section .data=.rodata,alloc,load,readonly,data,contents $@
+ 
+ $(XDP_OBJS): %.o: %.c $(BPF_HEADERS) $(LIBMK)
+-	$(QUIET_CLANG)$(CLANG) -target $(BPF_TARGET) $(BPF_CFLAGS) -O2 -c -g -o $@ $<
++	$(QUIET_BPF_COMPILER)$(BPF_COMPILER) $(BPF_CFLAGS) -O2 -c -g -o $@ $<
+ 
+ .PHONY: man
+ ifeq ($(EMACS),)
+diff --git a/lib/libxdp/tests/Makefile b/lib/libxdp/tests/Makefile
+index aed8b4d..a9961c4 100644
+--- a/lib/libxdp/tests/Makefile
++++ b/lib/libxdp/tests/Makefile
+@@ -85,7 +85,7 @@ $(STATIC_LINK_TARGETS): %: %.c  $(OBJECT_LIBBPF) $(STATIC_OBJECT_LIBXDP) $(LIBMK
+ 	 $< $(USER_EXTRA_C) $(STATIC_LDLIBS)
+ 
+ $(BPF_OBJS): %.o: %.c $(BPF_HEADERS) $(LIBMK) $(EXTRA_DEPS)
+-	$(QUIET_CLANG)$(CLANG) -target $(BPF_TARGET) $(BPF_CFLAGS) -O2 -c -g -o $@ $<
++	$(QUIET_CLANG)$(BPF_COMPILER) $(BPF_CFLAGS) -O2 -c -g -o $@ $<
+ 
+ run: all
+ 	$(Q)env CC="$(CC)" CFLAGS="$(CFLAGS) $(LDFLAGS)" CPPFLAGS="$(CPPFLAGS)" LDLIBS="$(LDLIBS)" V=$(V) $(TEST_RUNNER) $(TEST_FILE) $(RUN_TESTS)
+diff --git a/lib/util/Makefile b/lib/util/Makefile
+index 64a6efc..3e2ebd2 100644
+--- a/lib/util/Makefile
++++ b/lib/util/Makefile
+@@ -18,7 +18,7 @@ clean:
+ BPF_CFLAGS += -I$(HEADER_DIR) $(ARCH_INCLUDES)
+ 
+ $(UTIL_BPF_OBJS): %.o: %.c $(KERN_USER_H) $(BPF_HEADERS) $(LIBMK)
+-	$(QUIET_CLANG)$(CLANG) -target $(BPF_TARGET) $(BPF_CFLAGS) -O2 -c -g -o $@ $<
++	$(QUIET_BPF_COMPILER)$(BPF_COMPILER) $(BPF_CFLAGS) -O2 -c -g -o $@ $<
+ 
+ $(UTIL_SKEL_H): %.skel.h: %.bpf.o
+ 	$(QUIET_GEN)$(BPFTOOL) gen skeleton $< name ${@:.skel.h=} > $@
+-- 
+2.43.0
+
diff --git a/package/xdp-tools/Config.in b/package/xdp-tools/Config.in
new file mode 100644
index 0000000000..8c9cd6a165
--- /dev/null
+++ b/package/xdp-tools/Config.in
@@ -0,0 +1,61 @@
+config BR2_PACKAGE_XDP_TOOLS
+	bool "xdp-tools"
+	select BR2_PACKAGE_LIBBPF
+	help
+	  This package is the collection of utilities and example code
+	  that uses the XDP library.
+
+if BR2_PACKAGE_XDP_TOOLS
+config BR2_PACKAGE_XDP_TOOLS_LIBXDP
+	bool "libxdp"
+	depends on BR2_PACKAGE_HOST_GCC_BPF_AT_LEAST_15 || BR2_PACKAGE_LLVM_BPF
+	help
+	  The libxdp library itself
+if !BR2_PACKAGE_HOST_GCC_BPF_AT_LEAST_15 && !BR2_PACKAGE_LLVM_BPF
+comment "libxdp requires host-gcc version 15 or above, or LLVM with BPF support"
+endif
+
+if !BR2_PACKAGE_LLVM_BPF
+comment "Only libxdp is supported with GCC BPF"
+endif
+
+if BR2_PACKAGE_LLVM_BPF
+config BR2_PACKAGE_XDP_TOOLS_XDP_BENCH
+	bool "xdp-bench"
+	help
+	  An XDP benchmarking tool
+
+config BR2_PACKAGE_XDP_TOOLS_XDP_DUMP
+	bool "xdp-dump"
+	select BR2_PACKAGE_LIBPCAP
+	help
+	  A tcpdump-like tool for capturing packets at the XDP layer
+
+config BR2_PACKAGE_XDP_TOOLS_XDP_FILTER
+	bool "xdp-filter"
+	help
+	  A simple packet filtering utility powered by XDP
+
+# config BR2_PACKAGE_XDP_TOOLS_XDP_FORWARD
+# 	bool "xdp-forward"
+# 	help
+# 	  An XDP forwarding plane
+comment "xdp-forward is not yet supported"
+
+config BR2_PACKAGE_XDP_TOOLS_XDP_LOADER
+	bool "xdp-loader"
+	help
+	  A command-line utility for loading XDP programs using libxdp
+
+# config BR2_PACKAGE_XDP_TOOLS_XDP_MONITOR
+# 	bool "xdp-monitor"
+# 	help
+# 	  A simple XDP tracepoint monitoring tool
+comment "xdp-monitor is not yet supported"
+
+config BR2_PACKAGE_XDP_TOOLS_XDP_TRAFFICGEN
+	bool "xdp-trafficgen"
+	help
+	  An XDP-based packet generator
+endif
+endif
diff --git a/package/xdp-tools/xdp-tools.hash b/package/xdp-tools/xdp-tools.hash
new file mode 100644
index 0000000000..39c5c47dd3
--- /dev/null
+++ b/package/xdp-tools/xdp-tools.hash
@@ -0,0 +1,5 @@
+# Hashes from: https://github.com/xdp-project/xdp-tools/releases
+sha256  9f6eb9f2275c2431f59a80a99549b27c66832a751dd03c5993c6bc3f5c724b25  xdp-tools-1.5.8.tar.gz
+
+# Locally computed:
+sha256  734d0b7377af175d51c5ae07c061037862eb8d0d5a335544cfef9861c1895a2a  LICENSE
diff --git a/package/xdp-tools/xdp-tools.mk b/package/xdp-tools/xdp-tools.mk
new file mode 100644
index 0000000000..61bd7f6602
--- /dev/null
+++ b/package/xdp-tools/xdp-tools.mk
@@ -0,0 +1,110 @@
+################################################################################
+#
+# xdp-tools
+#
+################################################################################
+
+XDP_TOOLS_VERSION = 1.5.8
+XDP_TOOLS_SITE = https://github.com/xdp-project/xdp-tools/releases/download/v$(XDP_TOOLS_VERSION)
+XDP_TOOLS_LICENSE = GPL-2.0, LGPL-2.1, BSD-2-Clause
+XDP_TOOLS_LICENSE_FILES = LICENSE LICENSE.BSD-2-Clause LICENSE.LGPL-2.1
+XDP_TOOLS_DEPENDENCIES += host-gcc-bpf libbpf
+XDP_TOOLS_INSTALL_STAGING = YES
+XDP_TOOLS_BIN_ARCH_EXCLUDE = /usr/lib/bpf
+
+XDP_TOOLS_BPF_CFLAGS = "--sysroot=$(STAGING_DIR)"
+# We need to pass the sysroot, *and* we pass our own header location before
+# xdp-tools uses its own bundled location "headers/".
+XDP_TOOLS_BPF_CFLAGS += "-I$(STAGING_DIR)/usr/include"
+
+ifeq ($(BR2_PACKAGE_LLVM_BPF),y)
+  XDP_TOOLS_DEPENDENCIES = llvm
+  XDP_TOOLS_CONF_ENV = BPF_COMPILER=clang
+else
+  # "#pragma clang attribute" are not supported by GCC and require adaptation in
+  # xdp-tools
+  XDP_TOOLS_BPF_CFLAGS += "-DBPF_NO_PRESERVE_ACCESS_INDEX"
+  XDP_TOOLS_CONF_ENV = BPF_COMPILER=$(BPF_TARGET_NAME)-gcc
+endif
+
+XDP_TOOLS_CONF_ENV += BPF_CFLAGS="$(XDP_TOOLS_BPF_CFLAGS)"
+
+# We do not want to build the man pages, which is controlled by Emacs
+# availability
+XDP_TOOLS_CONF_ENV += EMACS=invalid
+
+# Many options are not handled by the custom (not autotools) configure, so we
+# pass them at build/install time
+XDP_TOOLS_MAKE_ENV += BPF_OBJECT_PATH="$(STAGING_DIR)/usr/lib/bpf"
+XDP_TOOLS_MAKE_ENV += HEADER_DIR="$(STAGING_DIR)/usr/include"
+XDP_TOOLS_MAKE_ENV += LIBBPF_LDLIBS="$(STAGING_DIR)/usr/lib"
+XDP_TOOLS_MAKE_ENV += LIBBPF_DIR="$(STAGING_DIR)/usr/lib"
+XDP_TOOLS_MAKE_ENV += PREFIX="/usr"
+XDP_TOOLS_MAKE_ENV += CPPFLAGS="--sysroot=$(STAGING_DIR)"
+
+ifeq ($(BR2_PACKAGE_XDP_TOOLS_LIBXDP),y)
+  XDP_TOOLS_TARGETS += libxdp
+endif # BR2_PACKAGE_XDP_TOOLS_LIBXDP=y
+
+ifeq ($(BR2_PACKAGE_XDP_TOOLS_XDP_BENCH),y)
+  XDP_TOOLS_TARGETS += xdp-bench
+endif # BR2_PACKAGE_XDP_TOOLS_XDP_BENCH=y
+
+ifeq ($(BR2_PACKAGE_XDP_TOOLS_XDP_DUMP),y)
+  XDP_TOOLS_TARGETS += xdp-dump
+  XDP_TOOLS_DEPENDENCIES += libpcap
+endif # BR2_PACKAGE_XDP_TOOLS_XDP_DUMP=y
+
+ifeq ($(BR2_PACKAGE_XDP_TOOLS_XDP_FILTER),y)
+  XDP_TOOLS_TARGETS += xdp-filter
+endif # BR2_PACKAGE_XDP_TOOLS_XDP_FILTER=y
+
+ifeq ($(BR2_PACKAGE_XDP_TOOLS_XDP_FORWARD),y)
+  XDP_TOOLS_TARGETS += xdp-forward
+endif # BR2_PACKAGE_XDP_TOOLS_XDP_FORWARD=y
+
+ifeq ($(BR2_PACKAGE_XDP_TOOLS_XDP_LOADER),y)
+  XDP_TOOLS_TARGETS += xdp-loader
+endif # BR2_PACKAGE_XDP_TOOLS_XDP_LOADER=y
+
+ifeq ($(BR2_PACKAGE_XDP_TOOLS_XDP_MONITOR),y)
+  XDP_TOOLS_TARGETS += xdp-monitor
+endif # BR2_PACKAGE_XDP_TOOLS_XDP_MONITOR=y
+
+ifeq ($(BR2_PACKAGE_XDP_TOOLS_XDP_TRAFFICGEN),y)
+  XDP_TOOLS_TARGETS += xdp-trafficgen
+endif # BR2_PACKAGE_XDP_TOOLS_XDP_TRAFFICGEN=y
+
+# xdp-tools uses clang, which does not receive the sysroot, so we pass it in
+# BPF_CFLAGS
+ifneq ($(XDP_TOOLS_TARGETS),)
+define XDP_TOOLS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(XDP_TOOLS_MAKE_ENV) \
+		$(MAKE) $(XDP_TOOLS_MAKE_OPTS) \
+		--directory $(@D) \
+		$(XDP_TOOLS_TARGETS)
+endef
+
+define XDP_TOOLS_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(XDP_TOOLS_MAKE_ENV) \
+		$(MAKE) $(XDP_TOOLS_MAKE_OPTS) \
+		--directory $(@D) \
+		DESTDIR=$(STAGING_DIR) \
+		$(if $(findstring libxdp,$(XDP_TOOLS_TARGETS)),libxdp_install) \
+		$(if $(filter-out libxdp,$(XDP_TOOLS_TARGETS)),install)
+endef
+
+# As opposed to the man pages, there is no way to avoid installing the tests on
+# the target, so we need to remove the whole usr/share/xdp-tools.
+define XDP_TOOLS_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(XDP_TOOLS_MAKE_ENV) \
+		$(MAKE) $(XDP_TOOLS_MAKE_OPTS) \
+		--directory $(@D) \
+		DESTDIR=$(TARGET_DIR) MAN_FILES= \
+		$(if $(findstring libxdp,$(XDP_TOOLS_TARGETS)),libxdp_install) \
+		$(if $(filter-out libxdp,$(XDP_TOOLS_TARGETS)),install)
+	$(RM) -rf $(TARGET_DIR)/usr/share/xdp-tools
+endef
+endif # XDP_TOOLS_TARGETS != ""
+
+$(eval $(autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
