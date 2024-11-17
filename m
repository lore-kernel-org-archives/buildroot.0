Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 808CDD10F20
	for <buildroot@archiver.kernel.org>; Sun, 17 Nov 2024 16:21:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A83084BB8;
	Sun, 17 Nov 2024 16:21:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UX8IrWQElCgn; Sun, 17 Nov 2024 16:20:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 917EE84B77
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 917EE84B77;
	Sun, 17 Nov 2024 16:20:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A7A85AF0
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 16:20:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 876CF408AD
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 16:20:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KW3nj_-ZOT18 for <buildroot@buildroot.org>;
 Sun, 17 Nov 2024 16:20:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CE56840096
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE56840096
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CE56840096
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 16:20:53 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2af:22b0:4a2:8c06:3742:179a])
 (Authenticated sender: vjardin@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id BE3782003DD;
 Sun, 17 Nov 2024 17:20:48 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
	Vincent Jardin <vjardin@free.fr>
Date: Sun, 17 Nov 2024 17:19:26 +0100
Message-ID: <20241117161927.27620-2-vjardin@free.fr>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241117161927.27620-1-vjardin@free.fr>
References: <3313806598076f4509530136ba913320@free.fr>
 <20241117161927.27620-1-vjardin@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731860451;
 bh=kpLary/4+tBFruF5fVBBucPngqWMLz7OOU09yxB06WA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mXvzNbdsHaGO8itzeZbI7DkGF+Q/Xr9BflcgtKrLIcmeZF6TNQG8V/iRuyoM+r01Z
 skxCYk122zqY0gt1OXSPh6u/R9mssSyin4ReAGd6LE/XDzJ7whZUIuxUk3hpIu2YRR
 eYMaCEajfU3IDlvC1N8rMuX2KNJrS7HYXc7mTEBJeywE2tVyMGupreoN6FWxibv9xY
 jfCzauje0bZI+kRYdtDNIVklBkR97H3aw/dic6Z0DG+AvQEdyDhj5FPsoY/v/xYeIX
 +zseNOFYf3gBZ9XR0uM/ScBd615r3gs5rZxhmgbUb//I0Fjlg3wsdlSTaqeWGTQoYS
 TPkRotGJJTM2Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mXvzNbds
Subject: [Buildroot] [PATCH v2 1/2] package/mstflint: add new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Collection of debug tools for the systems with a Mellanox/NVIDIA device.

Since  mst tools cannot be cross compiled. This serie of patch
that has been proposed for reviews to Mellanox enables a proper
dynamic linkage along with proper paths for cross compilations.

The pull request is available at:
  https://github.com/Mellanox/mstflint/pull/1026

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 DEVELOPERS                                    |   1 +
 package/Config.in                             |   1 +
 ...-fix-static-link-drop-LDFLAGS-static.patch | 250 ++++++++++++++++++
 ...-libxml2-do-not-enforce-isystem-path.patch |  51 ++++
 .../0003-configure.ac-libcurl-patch.patch     |  43 +++
 .../0004-openssl-add-missing-engine.h.patch   |  29 ++
 ...explicit-BUILD_DYNAMIC-for-Makefiles.patch |  43 +++
 ...06-libmtcr_ul-drop-install-exec-hook.patch |  29 ++
 .../0007-Makefile.am-dynamic-vs-static.patch  |  54 ++++
 .../0008-libmtcr_ul.so-missing-for-DPDK.patch |  29 ++
 package/mstflint/Config.in                    |  16 ++
 package/mstflint/mstflint.hash                |   4 +
 package/mstflint/mstflint.mk                  |  42 +++
 13 files changed, 592 insertions(+)
 create mode 100644 package/mstflint/0001-Makefile.am-fix-static-link-drop-LDFLAGS-static.patch
 create mode 100644 package/mstflint/0002-libxml2-do-not-enforce-isystem-path.patch
 create mode 100644 package/mstflint/0003-configure.ac-libcurl-patch.patch
 create mode 100644 package/mstflint/0004-openssl-add-missing-engine.h.patch
 create mode 100644 package/mstflint/0005-configure.ac-explicit-BUILD_DYNAMIC-for-Makefiles.patch
 create mode 100644 package/mstflint/0006-libmtcr_ul-drop-install-exec-hook.patch
 create mode 100644 package/mstflint/0007-Makefile.am-dynamic-vs-static.patch
 create mode 100644 package/mstflint/0008-libmtcr_ul.so-missing-for-DPDK.patch
 create mode 100644 package/mstflint/Config.in
 create mode 100644 package/mstflint/mstflint.hash
 create mode 100644 package/mstflint/mstflint.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3945803d53..32dcff4127 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3285,6 +3285,7 @@ F:	board/nvidia/bf3/
 F:	configs/nvidia_bf3_defconfig
 F:	package/bfscripts/
 F:	package/dpdk/
+F:	package/mstflint/
 
 N:	Vincent Prince <vincent.prince.fr@gmail.com>
 F:	package/nss-myhostname/
diff --git a/package/Config.in b/package/Config.in
index 1eb5e1e020..926e10cdbf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -569,6 +569,7 @@ endmenu
 	source "package/mhz/Config.in"
 	source "package/minicom/Config.in"
 	source "package/msr-tools/Config.in"
+	source "package/mstflint/Config.in"
 	source "package/mxt-app/Config.in"
 	source "package/nanocom/Config.in"
 	source "package/neard/Config.in"
diff --git a/package/mstflint/0001-Makefile.am-fix-static-link-drop-LDFLAGS-static.patch b/package/mstflint/0001-Makefile.am-fix-static-link-drop-LDFLAGS-static.patch
new file mode 100644
index 0000000000..7d14bb10ee
--- /dev/null
+++ b/package/mstflint/0001-Makefile.am-fix-static-link-drop-LDFLAGS-static.patch
@@ -0,0 +1,250 @@
+From b588c7ec89861924cb5c2e64997af4f23e05f21a Mon Sep 17 00:00:00 2001
+From: Vincent Jardin <vjardin@free.fr>
+Date: Tue, 12 Nov 2024 00:06:45 +0100
+Subject: [PATCH] Makefile.am: fix static link, drop LDFLAGS static
+
+I do not understand why some -static are enforced while dynamic
+linkage could be used.
+
+We should not have any -static in order to be able to link
+for the targets.
+
+Signed-off-by: Vincent Jardin <vjardin@free.fr>
+Upstream: https://github.com/Mellanox/mstflint/pull/1026
+---
+ cmdif/Makefile.am                                  |  4 ++--
+ dev_mgt/Makefile.am                                |  4 ++--
+ flint/Makefile.am                                  |  2 +-
+ mlxarchive/Makefile.am                             |  2 +-
+ mlxconfig/Makefile.am                              |  2 +-
+ mlxfwupdate/Makefile.am                            |  2 +-
+ mlxlink/Makefile.am                                |  2 +-
+ mlxreg/Makefile.am                                 |  2 +-
+ mstdump/crd_main/Makefile.am                       |  2 +-
+ mtcr_py/Makefile.am                                |  2 +-
+ reg_access/Makefile.am                             |  4 ++--
+ resourcetools/resourcedump_lib/src/sdk/Makefile.am |  4 ++--
+ small_utils/Makefile.am                            | 14 +++++++-------
+ 13 files changed, 23 insertions(+), 23 deletions(-)
+
+diff --git a/cmdif/Makefile.am b/cmdif/Makefile.am
+index 7bb332aa..d3a8ec9a 100644
+--- a/cmdif/Makefile.am
++++ b/cmdif/Makefile.am
+@@ -53,7 +53,7 @@ libcmdif_la_SOURCES = tools_cif.c tools_cif.h icmd_cif_common.c icmd_cif_common.
+ cmdif_pylibdir = $(libdir)/mstflint/python_tools/
+ cmdif_pylib_DATA = ${CCMDIF_SO} cmdif.py
+ ${CCMDIF_SO}: libcmdif.la
+-	$(CC) -g -Wall -pthread -shared ${CFLAGS} *.o -o ${CCMDIF_SO} \
+-	$(top_builddir)/tools_layouts/.libs/libtools_layouts.a $(top_builddir)/${MTCR_CONF_DIR}/.libs/libmtcr_ul.a
++	$(CC) -g -Wall -pthread -shared ${CFLAGS} .libs/*.o -o ${CCMDIF_SO} \
++	$(top_builddir)/tools_layouts/.libs/libtools_layouts.a $(top_builddir)/${MTCR_CONF_DIR}/.libs/libmtcr_ul.so
+ 
+ CLEANFILES = ${CCMDIF_SO}
+diff --git a/dev_mgt/Makefile.am b/dev_mgt/Makefile.am
+index a5f66e9f..40522343 100644
+--- a/dev_mgt/Makefile.am
++++ b/dev_mgt/Makefile.am
+@@ -50,9 +50,9 @@ dev_mgt_pylib_DATA = c_dev_mgt.so
+ dist_dev_mgt_pylib_DATA = dev_mgt.py
+ 
+ c_dev_mgt.so: libdev_mgt.la
+-	$(CC) -g -Wall -pthread -shared ${CFLAGS} tools_dev_types.o -o c_dev_mgt.so \
++	$(CC) -g -Wall -pthread -shared ${CFLAGS} .libs/tools_dev_types.o -o c_dev_mgt.so \
+ 	$(top_builddir)/reg_access/.libs/libreg_access.a \
+ 	$(top_builddir)/tools_layouts/.libs/libtools_layouts.a \
+-	$(top_builddir)/${MTCR_CONF_DIR}/.libs/libmtcr_ul.a
++	$(top_builddir)/${MTCR_CONF_DIR}/.libs/libmtcr_ul.so
+ 
+ CLEANFILES = c_dev_mgt.so
+diff --git a/flint/Makefile.am b/flint/Makefile.am
+index d990b95a..26a200c6 100644
+--- a/flint/Makefile.am
++++ b/flint/Makefile.am
+@@ -71,7 +71,7 @@ mstflint_DEPENDENCIES = \
+ 
+ LDADD_mstflint = ${LDL}
+ 
+-mstflint_LDFLAGS = -static
++#mstflint_LDFLAGS = -static
+ 
+ if ENABLE_DC
+ LDADD_mstflint += -lz
+diff --git a/mlxarchive/Makefile.am b/mlxarchive/Makefile.am
+index 5aa79942..aa0851d5 100755
+--- a/mlxarchive/Makefile.am
++++ b/mlxarchive/Makefile.am
+@@ -91,7 +91,7 @@ mstarchive_LDADD = libmstarchive.la \
+                    $(CURL_LIBS) \
+                    -llzma -lm ${LDL}
+ 
+-mstarchive_LDFLAGS = -static
++#mstarchive_LDFLAGS = -static
+ 
+ if ENABLE_OPENSSL
+ mstarchive_LDADD += $(top_builddir)/mlxsign_lib/libmlxsign.la -lcrypto -lssl
+diff --git a/mlxconfig/Makefile.am b/mlxconfig/Makefile.am
+index ac2d3459..42d48345 100755
+--- a/mlxconfig/Makefile.am
++++ b/mlxconfig/Makefile.am
+@@ -98,7 +98,7 @@ mstconfig_DEPENDENCIES = \
+ 
+ mstconfig_LDADD = $(mstconfig_DEPENDENCIES) ${LDL}
+ 
+-mstconfig_LDFLAGS = -static
++#mstconfig_LDFLAGS = -static
+ 
+ if DISABLE_XML2
+ AM_CXXFLAGS += -DDISABLE_XML2
+diff --git a/mlxfwupdate/Makefile.am b/mlxfwupdate/Makefile.am
+index 2ae7c3fd..4cecbacf 100755
+--- a/mlxfwupdate/Makefile.am
++++ b/mlxfwupdate/Makefile.am
+@@ -133,4 +133,4 @@ mstfwmanager_DEPENDENCIES += $(top_builddir)/mlxdpa/libmstdpa.a
+ endif
+ 
+ mstfwmanager_LDADD = $(mstfwmanager_DEPENDENCIES) $(LDADD_mstfwmanager)
+-mstfwmanager_LDFLAGS = -static
++#mstfwmanager_LDFLAGS = -static
+diff --git a/mlxlink/Makefile.am b/mlxlink/Makefile.am
+index 9d13198e..48c9436a 100644
+--- a/mlxlink/Makefile.am
++++ b/mlxlink/Makefile.am
+@@ -69,4 +69,4 @@ mstlink_DEPENDENCIES = \
+ 
+ mstlink_LDADD = $(mstlink_DEPENDENCIES) -llzma ${LDL} -lexpat
+ 
+-mstlink_LDFLAGS = -static
++#mstlink_LDFLAGS = -static
+diff --git a/mlxreg/Makefile.am b/mlxreg/Makefile.am
+index e90c2e72..6e478fd8 100644
+--- a/mlxreg/Makefile.am
++++ b/mlxreg/Makefile.am
+@@ -62,4 +62,4 @@ mstreg_DEPENDENCIES = \
+ 
+ mstreg_LDADD = $(mstreg_DEPENDENCIES) -llzma ${LDL} -lexpat
+ 
+-mstreg_LDFLAGS = -static
++#mstreg_LDFLAGS = -static
+diff --git a/mstdump/crd_main/Makefile.am b/mstdump/crd_main/Makefile.am
+index 6fd2abb1..8b521f23 100755
+--- a/mstdump/crd_main/Makefile.am
++++ b/mstdump/crd_main/Makefile.am
+@@ -39,5 +39,5 @@ bin_PROGRAMS = mstregdump
+ mstregdump_SOURCES = mstdump.c
+ mstregdump_LDADD = ../crd_lib/libcrdump.a ../../dev_mgt/libdev_mgt.la ../../reg_access/libreg_access.la ../../tools_layouts/libtools_layouts.la \
+ 			../../${MTCR_CONF_DIR}/libmtcr_ul.la  -lm ${LDL}
+-mstregdump_LDFLAGS = -static
++#mstregdump_LDFLAGS = -static
+ mstregdump_CFLAGS = -DMSTDUMP_NAME=\"mstregdump\" -DDEV_EXAMPLE=\"0b:00.0\"
+diff --git a/mtcr_py/Makefile.am b/mtcr_py/Makefile.am
+index 46fa4e60..3b847dcf 100644
+--- a/mtcr_py/Makefile.am
++++ b/mtcr_py/Makefile.am
+@@ -35,6 +35,6 @@ mtcr_pylibdir = $(libdir)/mstflint/python_tools/
+ mtcr_pylib_DATA = cmtcr.so
+ dist_mtcr_pylib_DATA = mtcr.py
+ cmtcr.so:
+-	$(CC) -g -Wall -pthread -shared ${CFLAGS} -o cmtcr.so -Wl,--whole-archive $(top_builddir)/${MTCR_CONF_DIR}/.libs/libmtcr_ul.a -Wl,--no-whole-archive
++	$(CC) -g -Wall -pthread -shared ${CFLAGS} -o cmtcr.so $(top_builddir)/${MTCR_CONF_DIR}/.libs/libmtcr_ul.so
+ 
+ CLEANFILES = cmtcr.so
+diff --git a/reg_access/Makefile.am b/reg_access/Makefile.am
+index 8e38c473..45068a19 100644
+--- a/reg_access/Makefile.am
++++ b/reg_access/Makefile.am
+@@ -57,7 +57,7 @@ reg_access_pylib_DATA = ${RREG_ACCESS_SO}
+ dist_reg_access_pylib_DATA = regaccess.py regaccess_hca_ext_structs.py regaccess_switch_ext_structs.py
+ 
+ ${RREG_ACCESS_SO}: libreg_access.la
+-	$(CC) -g -Wall -pthread -shared ${CFLAGS} *.o -o ${RREG_ACCESS_SO} \
+-	$(top_builddir)/tools_layouts/.libs/libtools_layouts.a $(top_builddir)/${MTCR_CONF_DIR}/.libs/libmtcr_ul.a
++	$(CC) -g -Wall -pthread -shared ${CFLAGS} .libs/*.o -o ${RREG_ACCESS_SO} \
++	$(top_builddir)/tools_layouts/.libs/libtools_layouts.a $(top_builddir)/${MTCR_CONF_DIR}/.libs/libmtcr_ul.so
+ 
+ CLEANFILES = ${RREG_ACCESS_SO}
+diff --git a/resourcetools/resourcedump_lib/src/sdk/Makefile.am b/resourcetools/resourcedump_lib/src/sdk/Makefile.am
+index aefc88a4..76619f59 100644
+--- a/resourcetools/resourcedump_lib/src/sdk/Makefile.am
++++ b/resourcetools/resourcedump_lib/src/sdk/Makefile.am
+@@ -63,7 +63,7 @@ libraryinclude_HEADERS = \
+ # if WIN_BUILD
+ # MTCR_LIB = $(MTCR_DIR)/.libs/libmtcr.dll.a
+ # else
+-MTCR_LIB = $(top_builddir)/${MTCR_CONF_DIR}/.libs/libmtcr_ul.a
++MTCR_LIB = $(top_builddir)/${MTCR_CONF_DIR}/.libs/libmtcr_ul.so
+ # endif
+ 
+ if ENABLE_RDMEM
+@@ -86,7 +86,7 @@ resource_dump_sdk_so_DEPS = \
+ 
+ # if !WIN_BUILD
+ libresource_dump_sdk.so: libresource_dump_sdk.la
+-	$(CC) -Wall -pthread -shared ${CFLAGS} $(COMPILER_FPIC) libresource_dump_sdk_la-resource_dump_sdk.o \
++	$(CC) -Wall -pthread -shared ${CFLAGS} $(COMPILER_FPIC) .libs/libresource_dump_sdk_la-resource_dump_sdk.o \
+ 	-o libresource_dump_sdk.so ${AM_LDFLAGS} $(resource_dump_sdk_so_DEPS)
+ # else
+ # libresource_dump_sdk.dll: libresource_dump_sdk.la
+diff --git a/small_utils/Makefile.am b/small_utils/Makefile.am
+index 4da2b6a4..00e26b9d 100644
+--- a/small_utils/Makefile.am
++++ b/small_utils/Makefile.am
+@@ -47,12 +47,12 @@ bin_SCRIPTS = mstfwreset
+ mstmread_SOURCES = mread.c
+ mstmread_DEPENDENCIES = $(top_builddir)/${MTCR_CONF_DIR}/libmtcr_ul.la
+ mstmread_LDADD = $(mstmread_DEPENDENCIES) ${LDL}
+-mstmread_LDFLAGS = -static
++#mstmread_LDFLAGS = -static
+ 
+ mstmwrite_SOURCES = mwrite.c
+ mstmwrite_DEPENDENCIES = $(top_builddir)/${MTCR_CONF_DIR}/libmtcr_ul.la
+ mstmwrite_LDADD = $(mstmwrite_DEPENDENCIES) ${LDL}
+-mstmwrite_LDFLAGS = -static
++#mstmwrite_LDFLAGS = -static
+ 
+ mstvpd_SOURCES = vpd.c
+ mstvpd_DEPENDENCIES = $(top_builddir)/mvpd/libmvpd.la \
+@@ -61,7 +61,7 @@ mstvpd_DEPENDENCIES = $(top_builddir)/mvpd/libmvpd.la \
+                $(top_builddir)/reg_access/libreg_access.la \
+                $(top_builddir)/tools_layouts/libtools_layouts.la
+ mstvpd_LDADD = $(mstvpd_DEPENDENCIES) ${LDL}
+-mstvpd_LDFLAGS = -static
++#mstvpd_LDFLAGS = -static
+ 
+ mstcongestion_SOURCES = congestion.cpp
+ mstcongestion_DEPENDENCIES = $(top_builddir)/cmdif/libcmdif.la \
+@@ -71,12 +71,12 @@ mstcongestion_DEPENDENCIES = $(top_builddir)/cmdif/libcmdif.la \
+                       $(top_builddir)/cmdparser/libcmdparser.a \
+                       $(top_builddir)/${MTCR_CONF_DIR}/libmtcr_ul.la
+ mstcongestion_LDADD = $(mstcongestion_DEPENDENCIES) ${LDL}
+-mstcongestion_LDFLAGS = -static
++#mstcongestion_LDFLAGS = -static
+ 
+ mstmcra_SOURCES = mcra.c
+ mstmcra_DEPENDENCIES = $(top_builddir)/${MTCR_CONF_DIR}/libmtcr_ul.la
+ mstmcra_LDADD = $(mstmcra_DEPENDENCIES) ${LDL}
+-mstmcra_LDFLAGS = -static
++#mstmcra_LDFLAGS = -static
+ 
+ if LINUX_BUILD
+ bin_PROGRAMS += mstfwctrl
+@@ -86,14 +86,14 @@ mstfwctrl_DEPENDENCIES = $(top_builddir)/${MTCR_CONF_DIR}/libmtcr_ul.la \
+                			 $(top_builddir)/dev_mgt/libdev_mgt.la \
+  	                     $(top_builddir)/reg_access/libreg_access.la
+ mstfwctrl_LDADD = $(mstfwctrl_DEPENDENCIES) ${LDL}
+-mstfwctrl_LDFLAGS = -static
++#mstfwctrl_LDFLAGS = -static
+ endif
+ 
+ mstmtserver_SOURCES = mtserver.c tcp.c tcp.h
+ mstmtserver_CFLAGS = -DMST_UL
+ mstmtserver_DEPENDENCIES = $(top_builddir)/${MTCR_CONF_DIR}/libmtcr_ul.la
+ mstmtserver_LDADD = $(mstmtserver_DEPENDENCIES) ${LDL}
+-mstmtserver_LDFLAGS = -static
++#mstmtserver_LDFLAGS = -static
+ 
+ SUBDIRS = mlxfwresetlib
+ MSTFWRESET_PYTHON_WRAPPER=mstfwreset
+-- 
+2.34.1
+
diff --git a/package/mstflint/0002-libxml2-do-not-enforce-isystem-path.patch b/package/mstflint/0002-libxml2-do-not-enforce-isystem-path.patch
new file mode 100644
index 0000000000..d7f85aeb2b
--- /dev/null
+++ b/package/mstflint/0002-libxml2-do-not-enforce-isystem-path.patch
@@ -0,0 +1,51 @@
+From 46579bfd3c1bdc64d24ba0c61f34034546980ef0 Mon Sep 17 00:00:00 2001
+From: Vincent Jardin <vjardin@free.fr>
+Date: Wed, 13 Nov 2024 10:40:32 +0100
+Subject: [PATCH] libxml2: do not enforce isystem path
+
+It is not compliant with cross compilation, it will lead to the
+following:
+
+aarch64-buildroot-linux-gnu-g++ -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2 -g0 -D_FORTIFY_SOURCE=1 -DHAVE_TERMIOS_H -DHAVE_SYS_PCI_H -isystem /usr/include/libxml2 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 conftest.cpp
+aarch64-buildroot-linux-gnu-g++: ERROR: unsafe header/library path used in cross-compilation: '-isystem' '/usr/include/libxml2'
+
+configure.ac: proper probe libxml2
+
+libxml2: CFLAGS and CXXFLAGS are used
+Makefiles are not using xml_CFLAGS
+
+Signed-off-by: Vincent Jardin <vjardin@free.fr>
+Upstream: https://github.com/Mellanox/mstflint/pull/1026
+---
+ configure.ac | 15 +++++----------
+ 1 file changed, 5 insertions(+), 10 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 2ce7d8d4..7cc0fb7e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -187,16 +187,11 @@ AC_ARG_ENABLE(xml2,
+             [enable_xml2="no"])
+ AC_MSG_RESULT($enable_xml2)
+ if test [ "x$enable_xml2" = "xyes" ] || [ test "x$enable_fw_mgr" = "xyes" ]; then
+-    # XML2 checks
+-    AC_LANG_PUSH([C++])
+-        if test "x$OS" = "xFreeBSD"; then
+-            CXXFLAGS="${CXXFLAGS} -isystem /usr/local/include/libxml2"
+-        else
+-            CXXFLAGS="${CXXFLAGS} -isystem /usr/include/libxml2"
+-        fi
+-        AC_CHECK_HEADER([libxml2/libxml/xpath.h],[],[AC_MSG_ERROR([libxml2: xpath.h is not found in the system PATH. make sure libxml2 headers are installed.])])
+-        AC_CHECK_LIB(xml2, xmlDocDumpFormatMemoryEnc,, AC_MSG_ERROR([cannot find xml2 xmlDocDumpFormatMemoryEnc() function. Try re-installing the library...]))
+-    AC_LANG_POP([C++])
++	PKG_CHECK_MODULES(xml, [libxml-2.0])
++	AC_SUBST(xml_CFLAGS)
++	AC_SUBST(xml_LIBS)
++	CXXFLAGS="$CXXFLAGS $xml_CFLAGS"
++	CFLAGS="$CFLAGS $xml_CFLAGS"
+ fi
+ 
+ AM_CONDITIONAL(DISABLE_XML2, [test  "x$enable_xml2" = "xno"])
+-- 
+2.34.1
+
diff --git a/package/mstflint/0003-configure.ac-libcurl-patch.patch b/package/mstflint/0003-configure.ac-libcurl-patch.patch
new file mode 100644
index 0000000000..76fe5bdcf8
--- /dev/null
+++ b/package/mstflint/0003-configure.ac-libcurl-patch.patch
@@ -0,0 +1,43 @@
+From 01209d569bf6508bc1e9ffa24c995b7114f6339a Mon Sep 17 00:00:00 2001
+From: Vincent Jardin <vjardin@free.fr>
+Date: Thu, 14 Nov 2024 00:47:01 +0100
+Subject: [PATCH] configure.ac: libcurl patch
+
+the include path cannot be hardcoded with:
+  /usr/include/curl/
+
+Signed-off-by: Vincent Jardin <vjardin@free.fr>
+Upstream: https://github.com/Mellanox/mstflint/pull/1026
+---
+ configure.ac | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 7cc0fb7e..aa903954 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -139,11 +139,20 @@ AC_ARG_ENABLE(fw-mgr,
+              [enable_fw_mgr="no"])
+ AC_MSG_RESULT($enable_fw_mgr)
+ if test "x$enable_fw_mgr" = "xyes"; then
++    # Find curl using pkg-config
++    PKG_CHECK_MODULES([CURL], [libcurl], [
++        CURL_INC_DIR=$(pkg-config --cflags-only-I libcurl | sed 's/-I//')
++    ], [
++        AC_MSG_ERROR([Cannot find curl via pkg-config. Please install libcurl development files.])
++    ])
++
+     AC_CHECK_HEADER(curl/curl.h,,AC_MSG_ERROR([cannot find curl/curl.h . this header is needed for compiling fw manager tool]))
++
+     AC_CHECK_HEADER(zlib.h,,AC_MSG_ERROR([cannot find zlib.h . this header is needed for compiling fw manager tool]))
+     AC_CHECK_LIB(z, uncompress,, AC_MSG_ERROR([cannot find zlib uncompress() function.]))
+     AC_CHECK_HEADER(lzma.h,,AC_MSG_ERROR([Cannot find lzma.h.]))
+-    CURL_INC_DIR=/usr/include/curl/
++
++    AC_SUBST([CURL_INC_DIR])
+ fi
+ 
+ # mlxdpa
+-- 
+2.34.1
+
diff --git a/package/mstflint/0004-openssl-add-missing-engine.h.patch b/package/mstflint/0004-openssl-add-missing-engine.h.patch
new file mode 100644
index 0000000000..fdb437bb37
--- /dev/null
+++ b/package/mstflint/0004-openssl-add-missing-engine.h.patch
@@ -0,0 +1,29 @@
+From 9990de4c8dfb0bd72093db2c40e51ef887fda5ca Mon Sep 17 00:00:00 2001
+From: Vincent Jardin <vjardin@free.fr>
+Date: Thu, 14 Nov 2024 01:08:05 +0100
+Subject: [PATCH] openssl: add missing engine.h
+
+engine is exported by openssl/engine.h ; if not, we can have some
+compilation warnings of some undefined symbols.
+
+Signed-off-by: Vincent Jardin <vjardin@free.fr>
+Upstream: https://github.com/Mellanox/mstflint/pull/1026
+---
+ mlxsign_lib/mlxsign_openssl_engine.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/mlxsign_lib/mlxsign_openssl_engine.cpp b/mlxsign_lib/mlxsign_openssl_engine.cpp
+index 8fc6bdc1..ecd28f57 100644
+--- a/mlxsign_lib/mlxsign_openssl_engine.cpp
++++ b/mlxsign_lib/mlxsign_openssl_engine.cpp
+@@ -34,6 +34,7 @@
+ #if !defined(NO_OPEN_SSL) && !defined(NO_DYNAMIC_ENGINE)
+ #include "mlxsign_openssl_engine.h"
+ #include <iostream>
++#include <openssl/engine.h>
+ #include <openssl/ssl.h>
+ #include <openssl/sha.h>
+ #include <openssl/rsa.h>
+-- 
+2.34.1
+
diff --git a/package/mstflint/0005-configure.ac-explicit-BUILD_DYNAMIC-for-Makefiles.patch b/package/mstflint/0005-configure.ac-explicit-BUILD_DYNAMIC-for-Makefiles.patch
new file mode 100644
index 0000000000..fc778b48f5
--- /dev/null
+++ b/package/mstflint/0005-configure.ac-explicit-BUILD_DYNAMIC-for-Makefiles.patch
@@ -0,0 +1,43 @@
+From ddafc9f5c5aa01e07f480a99e7a6398f22049165 Mon Sep 17 00:00:00 2001
+From: Vincent Jardin <vjardin@free.fr>
+Date: Thu, 14 Nov 2024 17:38:04 +0100
+Subject: [PATCH] configure.ac: explicit BUILD_DYNAMIC for Makefiles
+
+Thanks to this definition, we'll be able to ave cleaner Makefiles.
+
+Signed-off-by: Vincent Jardin <vjardin@free.fr>
+Upstream: https://github.com/Mellanox/mstflint/pull/1026
+---
+ configure.ac | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index aa903954..943352b7 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -275,6 +275,7 @@ AC_ARG_ENABLE([all_static],
+     [enable_all_static="no"])
+ AC_MSG_RESULT($enable_all_static)
+ 
++BUILD_DYNAMIC="yes"
+ AS_IF([test "x$enable_all_static" = "xyes"], [
+   if test "x$enable_dc" = "xyes"; then
+     AC_MSG_ERROR([cannot enable all static with enable dc . add --disable-dc to remove dependency with dynamic zlib])
+@@ -285,10 +286,14 @@ AS_IF([test "x$enable_all_static" = "xyes"], [
+   if test "x$enable_inband" = "xyes"; then
+     AC_MSG_ERROR([cannot enable all static with enable inband . add --disable-inband to remove dependency with dynamic inband])
+   fi
++  BUILD_DYNAMIC="no"
+   LDFLAGS="$LDFLAGS -all-static"
+   CFLAGS="$CFLAGS -DSQLITE_OMIT_LOAD_EXTENSION=0 -DIBVSMAD_DLOPEN"
+ ])
+ 
++# Define conditionals for the Makefile.am
++AM_CONDITIONAL([BUILD_DYNAMIC], [test "$BUILD_DYNAMIC" = "yes"])
++
+ AC_SUBST(TOOLS_CRYPTO)
+ AM_CONDITIONAL(ENABLE_OPENSSL, [test "x$enable_openssl" = "xyes" ])
+ AM_CONDITIONAL(ENABLE_CS, [test  "x$enable_cs" = "xyes" || test "x$enable_openssl" = "xyes" ])
+-- 
+2.34.1
+
diff --git a/package/mstflint/0006-libmtcr_ul-drop-install-exec-hook.patch b/package/mstflint/0006-libmtcr_ul-drop-install-exec-hook.patch
new file mode 100644
index 0000000000..42fd6a0d10
--- /dev/null
+++ b/package/mstflint/0006-libmtcr_ul-drop-install-exec-hook.patch
@@ -0,0 +1,29 @@
+From 3d6032e2df388a123a2f812ba1d9b0d701f4a21d Mon Sep 17 00:00:00 2001
+From: Vincent Jardin <vjardin@free.fr>
+Date: Thu, 14 Nov 2024 17:54:26 +0100
+Subject: [PATCH] libmtcr_ul: drop install-exec-hook
+
+the .so file should remain for the target when dynamic linkage is used.
+If the file is removed, none of the applications will be loadable.
+
+Signed-off-by: Vincent Jardin <vjardin@free.fr>
+Upstream: https://github.com/Mellanox/mstflint/pull/1026
+---
+ mtcr_ul/Makefile.am | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/mtcr_ul/Makefile.am b/mtcr_ul/Makefile.am
+index a2a644ee..828fa677 100644
+--- a/mtcr_ul/Makefile.am
++++ b/mtcr_ul/Makefile.am
+@@ -52,7 +52,3 @@ endif
+ 
+ libraryincludedir=$(includedir)/mstflint
+ libraryinclude_HEADERS = $(top_srcdir)/include/mtcr_ul/mtcr.h  $(top_srcdir)/include/mtcr_ul/mtcr_com_defs.h  $(top_srcdir)/include/mtcr_ul/mtcr_mf.h
+-
+-install-exec-hook:
+-	rm -f $(DESTDIR)$(pkglibdir)/libmtcr_ul.so* $(DESTDIR)$(pkglibdir)/libmtcr_ul.la
+-	ln -snf mstflint/libmtcr_ul.a $(DESTDIR)$(libdir)/
+-- 
+2.34.1
+
diff --git a/package/mstflint/0007-Makefile.am-dynamic-vs-static.patch b/package/mstflint/0007-Makefile.am-dynamic-vs-static.patch
new file mode 100644
index 0000000000..535ef0cd31
--- /dev/null
+++ b/package/mstflint/0007-Makefile.am-dynamic-vs-static.patch
@@ -0,0 +1,54 @@
+From cbc96409ac7a5804e62035544d1a89eb0067b56d Mon Sep 17 00:00:00 2001
+From: Vincent Jardin <vjardin@free.fr>
+Date: Thu, 14 Nov 2024 17:55:07 +0100
+Subject: [PATCH] Makefile.am: dynamic vs static
+
+start using DYNAMIC in order to be aligned with the
+  --enable-all-static
+argument.
+
+Signed-off-by: Vincent Jardin <vjardin@free.fr>
+Upstream: https://github.com/Mellanox/mstflint/pull/1026
+---
+ mlxsign_lib/Makefile.am | 6 ++++++
+ mtcr_ul/Makefile.am     | 5 +++++
+ 2 files changed, 11 insertions(+)
+
+diff --git a/mlxsign_lib/Makefile.am b/mlxsign_lib/Makefile.am
+index b0c7e652..804031b5 100644
+--- a/mlxsign_lib/Makefile.am
++++ b/mlxsign_lib/Makefile.am
+@@ -38,7 +38,13 @@ AM_CPPFLAGS = \
+ AM_CXXFLAGS = -Wall -W  -g -MP -MD -pipe $(COMPILER_FPIC)
+ AM_CXXFLAGS += -DTOOLS_CRYPTO_KEY='$(TOOLS_CRYPTO_KEY)' -DTOOLS_CRYPTO_IV='$(TOOLS_CRYPTO_IV)'
+ 
++if BUILD_DYNAMIC
++pkglib_LTLIBRARIES = libmlxsign.la
++libmlxsign_la_LDFLAGS = -version-info 0:0:0 -no-undefined
++else
+ noinst_LTLIBRARIES = libmlxsign.la
++endif
++
+ libmlxsign_la_SOURCES = mlxsign_lib.cpp mlxsign_lib.h mlxsign_com_def.h \
+                        mlxsign_openssl_engine.h mlxsign_openssl_engine.cpp \
+                        mlxsign_signer_interface.h mlxsign_signer_interface.cpp
+diff --git a/mtcr_ul/Makefile.am b/mtcr_ul/Makefile.am
+index 828fa677..59c50c5e 100644
+--- a/mtcr_ul/Makefile.am
++++ b/mtcr_ul/Makefile.am
+@@ -32,7 +32,12 @@
+ 
+ AM_CPPFLAGS = -I$(top_srcdir) -I$(top_srcdir)/include/mtcr_ul -I$(top_srcdir)/common -I$(top_srcdir)/dev_mgt
+ 
++if BUILD_DYNAMIC
+ pkglib_LTLIBRARIES = libmtcr_ul.la
++libmtcr_ul_la_LDFLAGS = -version-info 0:0:0 -no-undefined
++else
++noinst_LTLIBRARIES = libmtcr_ul.la
++endif
+ 
+ libmtcr_ul_la_SOURCES = mtcr_ul.c mtcr_ib.h  mtcr_int_defs.h\
+ 			mtcr_ib_res_mgt.h mtcr_ib_res_mgt.c\
+-- 
+2.34.1
+
diff --git a/package/mstflint/0008-libmtcr_ul.so-missing-for-DPDK.patch b/package/mstflint/0008-libmtcr_ul.so-missing-for-DPDK.patch
new file mode 100644
index 0000000000..6c417d819a
--- /dev/null
+++ b/package/mstflint/0008-libmtcr_ul.so-missing-for-DPDK.patch
@@ -0,0 +1,29 @@
+From 7f5822ca13630c56ebbd4b29cead926c7440f7a6 Mon Sep 17 00:00:00 2001
+From: Vincent Jardin <vjardin@free.fr>
+Date: Thu, 14 Nov 2024 22:15:05 +0100
+Subject: [PATCH] libmtcr_ul.so missing for DPDK
+
+DPDK assumes that the library shall be into /usr/lib instead of /usr/lib/mstflint/
+
+Signed-off-by: Vincent Jardin <vjardin@free.fr>
+Upstream: https://github.com/Mellanox/mstflint/pull/1026
+---
+ mtcr_ul/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mtcr_ul/Makefile.am b/mtcr_ul/Makefile.am
+index 59c50c5e..63fc8a73 100644
+--- a/mtcr_ul/Makefile.am
++++ b/mtcr_ul/Makefile.am
+@@ -33,7 +33,7 @@
+ AM_CPPFLAGS = -I$(top_srcdir) -I$(top_srcdir)/include/mtcr_ul -I$(top_srcdir)/common -I$(top_srcdir)/dev_mgt
+ 
+ if BUILD_DYNAMIC
+-pkglib_LTLIBRARIES = libmtcr_ul.la
++lib_LTLIBRARIES = libmtcr_ul.la
+ libmtcr_ul_la_LDFLAGS = -version-info 0:0:0 -no-undefined
+ else
+ noinst_LTLIBRARIES = libmtcr_ul.la
+-- 
+2.34.1
+
diff --git a/package/mstflint/Config.in b/package/mstflint/Config.in
new file mode 100644
index 0000000000..5882c4ac0e
--- /dev/null
+++ b/package/mstflint/Config.in
@@ -0,0 +1,16 @@
+comment "mstflint needs a toolchain w/ C++, wchar, dynamic library, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_MSTFLINT
+	bool "mstflint"
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_WCHAR
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_SQLITE
+	help
+	  Collection of Mellanox/NVIDIA firmware tools.
+
+	  https://github.com/Mellanox/mstflint
diff --git a/package/mstflint/mstflint.hash b/package/mstflint/mstflint.hash
new file mode 100644
index 0000000000..9764181d1d
--- /dev/null
+++ b/package/mstflint/mstflint.hash
@@ -0,0 +1,4 @@
+# Locally computed:
+sha256  611429a65701597fefe075b86b6408437f1dc83180ca9a6e18bfeb9add4af743  LICENSE
+sha256  626000ecc31d5cda8a50f49f0a8e8000b26079dfba72c0b8d0afe13ce35e8882  COPYING
+sha256  e4bc23f0512ecd3d6321bac9d80d4cca4f885b5264a12adbbc333c74b1baedae  mstflint-v4.30.0-1.tar.gz
diff --git a/package/mstflint/mstflint.mk b/package/mstflint/mstflint.mk
new file mode 100644
index 0000000000..a250a32310
--- /dev/null
+++ b/package/mstflint/mstflint.mk
@@ -0,0 +1,42 @@
+################################################################################
+#
+# mstflint
+#
+################################################################################
+
+MSTFLINT_VERSION = v4.30.0-1
+MSTFLINT_SITE = $(call github,Mellanox,mstflint,$(MSTFLINT_VERSION))
+MSTFLINT_LICENSE = GPL-2.0
+MSTFLINT_LICENSE_FILES = LICENSE COPYING
+
+MSTFLINT_INSTALL_STAGING = YES
+MSTFLINT_AUTORECONF = YES
+MSTFLINT_DEPENDENCIES = host-pkgconf
+
+# Infiniband dependency is not managed
+MSTFLINT_CONF_OPTS += --disable-inband
+MSTFLINT_CONF_OPTS += --disable-rdmem
+
+ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
+MSTFLINT_CONF_OPTS += --enable-openssl
+MSTFLINT_DEPENDENCIES += libopenssl
+endif
+
+ifeq ($(BR2_PACKAGE_EXPAT)$(BR2_PACKAGE_XZ),yy)
+MSTFLINT_CONF_OPTS += --enable-adb-generic-tools
+MSTFLINT_DEPENDENCIES += expat
+MSTFLINT_DEPENDENCIES += xz # lzma.h
+endif
+
+ifeq ($(BR2_PACKAGE_LIBCURL)$(BR2_PACKAGE_XZ),yy)
+MSTFLINT_CONF_OPTS += --enable-fw-mgr
+MSTFLINT_DEPENDENCIES += xz # lzma.h
+MSTFLINT_DEPENDENCIES += libcurl
+endif
+
+ifeq ($(BR2_PACKAGE_LIBXML2),y)
+MSTFLINT_CONF_OPTS += --enable-xml2
+MSTFLINT_DEPENDENCIES += libxml2
+endif
+
+$(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
