Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3B6C46467
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 18:40:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0029D60FE5;
	Thu, 19 Jan 2023 18:40:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0029D60FE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H5arHGmZDsFo; Thu, 19 Jan 2023 18:40:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED57A61109;
	Thu, 19 Jan 2023 18:39:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED57A61109
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E24B11BF33E
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 18:39:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE20261109
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 18:39:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE20261109
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id boKBYh5PwAf5 for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 18:39:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3838360FE5
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3838360FE5
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 18:39:56 +0000 (UTC)
Received: from vfazio2.xes-mad.com (vfazio2.xes-mad.com [10.52.16.113])
 by mail.xes-mad.com (Postfix) with ESMTP id BE43A20352;
 Thu, 19 Jan 2023 12:39:55 -0600 (CST)
From: Vincent Fazio <vfazio@xes-inc.com>
To: buildroot@buildroot.org
Date: Thu, 19 Jan 2023 12:39:53 -0600
Message-Id: <20230119183953.1609871-1-vfazio@xes-inc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=xes-inc.com; s=mail; 
 t=1674153595; bh=h3Va6q/t8K4PjDRRhCFZ4yfAl1vHzZI+c8XyVFK4KyU=;
 h=From:To:Cc:Subject:Date:From;
 b=GvQjM5hNTBlRIua/Tx2Uwk+/EFedZbC6JntLf7wyKVtGPTo2LMRGpbByEpw2ii9Tn
 x8bFjVLSZMMrtkta5LQafGZfyLKC9AzkKoPc8YlUzVh1cjLWvwo1oNDiz1I0x/Sv48
 BHU+DA2DDCCnnmsVuh7D28haoJjMROBr5ZwEUBVc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com
 header.a=rsa-sha256 header.s=mail header.b=GvQjM5hN
Subject: [Buildroot] [PATCH 1/1] package/ipmitool: allow configuring PEN
 registry source
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
Cc: Floris Bos <bos@je-eigen-domein.nl>, Heiko Thiery <heiko.thiery@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vincent Fazio <vfazio@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Vincent Fazio <vfazio@gmail.com>

The default, the IANA PEN registry used by ipmitool is large (4 MiB+)
and changes at the whim of IANA, meaning reproducible builds may not be
possible by using the default package.

Add a configuration option to specify the source of the registry file.

Remote and local files are supported. If no source is specified, no
registry file will be installed to the target.

Backport upstream patches to allow this to add requisite support:
  Make a missing registry file non-fatal
  Make downloading/installing the registry optional

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
Co-Developed-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...t-require-the-IANA-PEN-registry-file.patch | 115 ++++++++++++++++++
 ...c-allow-disabling-registry-downloads.patch |  75 ++++++++++++
 package/ipmitool/Config.in                    |  12 ++
 package/ipmitool/ipmitool.mk                  |  20 +++
 4 files changed, 222 insertions(+)
 create mode 100644 package/ipmitool/0003-Do-not-require-the-IANA-PEN-registry-file.patch
 create mode 100644 package/ipmitool/0004-configure.ac-allow-disabling-registry-downloads.patch

diff --git a/package/ipmitool/0003-Do-not-require-the-IANA-PEN-registry-file.patch b/package/ipmitool/0003-Do-not-require-the-IANA-PEN-registry-file.patch
new file mode 100644
index 0000000000..3f35a78af2
--- /dev/null
+++ b/package/ipmitool/0003-Do-not-require-the-IANA-PEN-registry-file.patch
@@ -0,0 +1,115 @@
+From 26b088193a55624df4cbe2a0d33c7bba5bca108d Mon Sep 17 00:00:00 2001
+From: Vincent Fazio <vfazio@gmail.com>
+Date: Sat, 7 Jan 2023 21:02:48 -0600
+Subject: [PATCH] Do not require the IANA PEN registry file
+
+Previously, ipmitool would fail to run if the local copy of the IANA PEN
+registry could not be parsed.
+
+When the registry is not available the manufacturer will be "Unknown" but
+ipmitool will otherwise function so should not be considered fatal.
+
+Also, fix an issue with improperly handling the `oem_info_list_load`
+return value. Previously, in `ipmi_oem_info_init`, if `oem_info_list_load`
+returned a negative value due to the registry file not existing, an
+improper count would cause `oem_info_init_from_list` to aallocate a list
+that didn't encompass the full header/tail list.
+
+  IANA PEN registry open failed: No such file or directory
+    Allocating      3 entries
+    [     1] 16777214 | A Debug Assisting Company, Ltd.
+    [     0]  1048575 | Unspecified
+
+Now, use a signed int and ensure a valid count of loaded OEMs is used.
+
+Signed-off-by: Vincent Fazio <vfazio@gmail.com>
+
+[vfazio: backport from upstream 26b088193a55624df4cbe2a0d33c7bba5bca108d]
+Signed-off-by: Vincent Fazio <vfazio@gmail.com>
+---
+ include/ipmitool/ipmi_strings.h |  2 +-
+ lib/ipmi_main.c                 |  5 +----
+ lib/ipmi_strings.c              | 19 +++++--------------
+ 3 files changed, 7 insertions(+), 19 deletions(-)
+
+diff --git a/include/ipmitool/ipmi_strings.h b/include/ipmitool/ipmi_strings.h
+index 17c37c6..d60179c 100644
+--- a/include/ipmitool/ipmi_strings.h
++++ b/include/ipmitool/ipmi_strings.h
+@@ -55,7 +55,7 @@ extern const struct valstr ipmi_integrity_algorithms[];
+ extern const struct valstr ipmi_encryption_algorithms[];
+ extern const struct valstr ipmi_user_enable_status_vals[];
+ extern const struct valstr *ipmi_oem_info;
+-int ipmi_oem_info_init();
++void ipmi_oem_info_init();
+ void ipmi_oem_info_free();
+ 
+ extern const struct valstr picmg_frucontrol_vals[];
+diff --git a/lib/ipmi_main.c b/lib/ipmi_main.c
+index a673a30..510bc2d 100644
+--- a/lib/ipmi_main.c
++++ b/lib/ipmi_main.c
+@@ -853,10 +853,7 @@ ipmi_main(int argc, char ** argv,
+ 	}
+ 
+ 	/* load the IANA PEN registry */
+-	if (ipmi_oem_info_init()) {
+-		lprintf(LOG_ERR, "Failed to initialize the OEM info dictionary");
+-		goto out_free;
+-	}
++	ipmi_oem_info_init();
+ 
+ 	/* run OEM setup if found */
+ 	if (oemtype &&
+diff --git a/lib/ipmi_strings.c b/lib/ipmi_strings.c
+index 26b359f..c8fc2d0 100644
+--- a/lib/ipmi_strings.c
++++ b/lib/ipmi_strings.c
+@@ -1719,39 +1719,30 @@ out:
+ 	return rc;
+ }
+ 
+-int ipmi_oem_info_init()
++void ipmi_oem_info_init()
+ {
+ 	oem_valstr_list_t terminator = { { -1, NULL}, NULL }; /* Terminator */
+ 	oem_valstr_list_t *oemlist = &terminator;
+ 	bool free_strings = true;
+-	size_t count;
+-	int rc = -4;
++	int count;
+ 
+ 	lprintf(LOG_INFO, "Loading IANA PEN Registry...");
+ 
+ 	if (ipmi_oem_info) {
+ 		lprintf(LOG_INFO, "IANA PEN Registry is already loaded");
+-		rc = 0;
+ 		goto out;
+ 	}
+ 
+-	if (!(count = oem_info_list_load(&oemlist))) {
+-		/*
+-		 * We can't identify OEMs without a loaded registry.
+-		 * Set the pointer to dummy and return.
+-		 */
+-		ipmi_oem_info = ipmi_oem_info_dummy;
+-		goto out;
++	if ((count = oem_info_list_load(&oemlist)) < 1) {
++		lprintf(LOG_WARN, "Failed to load entries from IANA PEN Registry");
++		count = 0;
+ 	}
+ 
+ 	/* In the array was allocated, don't free the strings at cleanup */
+ 	free_strings = !oem_info_init_from_list(oemlist, count);
+ 
+-	rc = IPMI_CC_OK;
+-
+ out:
+ 	oem_info_list_free(&oemlist, free_strings);
+-	return rc;
+ }
+ 
+ void ipmi_oem_info_free()
+-- 
+2.25.1
+
diff --git a/package/ipmitool/0004-configure.ac-allow-disabling-registry-downloads.patch b/package/ipmitool/0004-configure.ac-allow-disabling-registry-downloads.patch
new file mode 100644
index 0000000000..9a995b9a14
--- /dev/null
+++ b/package/ipmitool/0004-configure.ac-allow-disabling-registry-downloads.patch
@@ -0,0 +1,75 @@
+From be11d948f89b10be094e28d8a0a5e8fb532c7b60 Mon Sep 17 00:00:00 2001
+From: Vincent Fazio <vfazio@gmail.com>
+Date: Wed, 11 Jan 2023 22:55:51 -0600
+Subject: [PATCH] configure.ac: allow disabling registry downloads
+
+Some environments require reproducible builds. Since the IANA PEN
+registry is constantly updating and there is no snapshot available,
+installing ipmitool via `make install` is not reproducible.
+
+Provide a configure mechanism to disable the registry download/install..
+
+[vfazio: backport from upstream be11d948f89b10be094e28d8a0a5e8fb532c7b60]
+Signed-off-by: Vincent Fazio <vfazio@gmail.com>
+---
+ configure.ac | 30 ++++++++++++++++++++----------
+ 1 file changed, 20 insertions(+), 10 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 4ee1be8..1dd2742 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -18,8 +18,6 @@ AC_PROG_LN_S
+ AC_PROG_MAKE_SET
+ AC_CHECK_PROG([RPMBUILD], [rpmbuild], [rpmbuild], [rpm])
+ AC_CHECK_PROG([SED], [sed], [sed])
+-AC_CHECK_PROG([WGET], [wget], [wget])
+-AC_CHECK_PROG([CURL], [curl], [curl])
+ 
+ AC_HEADER_STDC
+ AC_CHECK_HEADERS([stdlib.h string.h sys/ioctl.h sys/stat.h unistd.h paths.h])
+@@ -56,21 +54,33 @@ if test "x$exec_prefix" = "xNONE"; then
+ 	exec_prefix="$prefix"
+ fi
+ 
+-if test "x$WGET" = "x"; then
+-	if test "x$CURL" = "x"; then
++dnl allow enabling/disabling the fetching of the IANA PEN registry
++AC_ARG_ENABLE([registry-download],
++	[AC_HELP_STRING([--enable-registry-download],
++			[download/install the IANA PEN registry [default=yes]])],
++	[xenable_registry_download=$enableval],
++	[xenable_registry_download=yes])
++
++AM_CONDITIONAL([DOWNLOAD], [false])
++
++if test "x$xenable_registry_download" = "xyes"; then
++	AC_CHECK_PROG([WGET], [wget], [wget])
++	AC_CHECK_PROG([CURL], [curl], [curl])
++
++	if test "x$WGET" = "x" && test "x$CURL" = "x"; then
+ 		AC_MSG_WARN([** Neither wget nor curl could be found.])
+ 		AC_MSG_WARN([** IANA PEN database will not be installed by `make install` !])
+ 	else
+-		DOWNLOAD="$CURL --location --progress-bar"
+ 		AM_CONDITIONAL([DOWNLOAD], [true])
++		if test "x$WGET" != "x"; then
++			DOWNLOAD="$WGET -c -nd -O -"
++		else
++			DOWNLOAD="$CURL --location --progress-bar"
++		fi
+ 	fi
+-else
+-	DOWNLOAD="$WGET -c -nd -O -"
+-	AM_CONDITIONAL([DOWNLOAD], [true])
+ fi
+ 
+-AC_MSG_WARN([** Download is:])
+-AC_MSG_WARN($DOWNLOAD)
++AC_MSG_WARN([** Download is: $DOWNLOAD])
+ AC_SUBST(DOWNLOAD, $DOWNLOAD)
+ 
+ dnl
+-- 
+2.25.1
+
diff --git a/package/ipmitool/Config.in b/package/ipmitool/Config.in
index dbd6483110..8e217ecc45 100644
--- a/package/ipmitool/Config.in
+++ b/package/ipmitool/Config.in
@@ -9,6 +9,18 @@ config BR2_PACKAGE_IPMITOOL
 
 if BR2_PACKAGE_IPMITOOL
 
+config BR2_PACKAGE_IPMITOOL_PEN_REG_URI
+	string "IANA PEN registry URL or path"
+	default "http://www.iana.org/assignments/enterprise-numbers.txt"
+	help
+	  Enter an URL or a file path to the PEN registry to use.
+
+	  Note that the official registry is 4MiB+ and may change any
+	  time and is thus not guaranteed to be reproducible.
+
+	  Leave empty to not use a registry; vendor IDs will be
+	  displayed instead of the corresponding names.
+
 config BR2_PACKAGE_IPMITOOL_LANPLUS
 	bool "enable lanplus interface"
 	select BR2_PACKAGE_OPENSSL
diff --git a/package/ipmitool/ipmitool.mk b/package/ipmitool/ipmitool.mk
index 5e34434a03..6fc4283e47 100644
--- a/package/ipmitool/ipmitool.mk
+++ b/package/ipmitool/ipmitool.mk
@@ -13,6 +13,8 @@ IPMITOOL_CPE_ID_VENDOR = ipmitool_project
 IPMITOOL_AUTORECONF = YES
 IPMITOOL_DEPENDENCIES = host-pkgconf
 
+IPMITOOL_CONF_OPTS += --disable-registry-download
+
 ifeq ($(BR2_PACKAGE_FREEIPMI),y)
 IPMITOOL_DEPENDENCIES += freeipmi
 IPMITOOL_CONF_OPTS += --enable-intf-free
@@ -47,4 +49,22 @@ endef
 IPMITOOL_POST_INSTALL_TARGET_HOOKS += IPMITOOL_REMOVE_IPMIEVD
 endif
 
+IPMITOOL_PEN_REG_URI = $(call qstrip,$(BR2_PACKAGE_IPMITOOL_PEN_REG_URI))
+
+ifneq ($(IPMITOOL_PEN_REG_URI),)
+ifneq ($(findstring ://,$(IPMITOOL_PEN_REG_URI)),)
+IPMITOOL_EXTRA_DOWNLOADS += $(IPMITOOL_PEN_REG_URI)
+BR_NO_CHECK_HASH_FOR += $(notdir $(IPMITOOL_PEN_REG_URI))
+IPMITOOL_PEN_REG = $(IPMITOOL_DL_DIR)/$(notdir $(IPMITOOL_PEN_REG_URI))
+else
+IPMITOOL_PEN_REG = $(IPMITOOL_PEN_REG_URI)
+endif #findstring
+
+define IPMITOOL_INSTALL_PEN_REG
+	$(INSTALL) -D -m 0644 $(IPMITOOL_PEN_REG) \
+		$(TARGET_DIR)/usr/share/misc/enterprise-numbers
+endef
+IPMITOOL_POST_INSTALL_TARGET_HOOKS += IPMITOOL_INSTALL_PEN_REG
+endif
+
 $(eval $(autotools-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
