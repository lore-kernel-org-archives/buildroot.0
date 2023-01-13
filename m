Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2F8C3DA78
	for <buildroot@archiver.kernel.org>; Fri, 13 Jan 2023 23:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61D6881F92;
	Fri, 13 Jan 2023 23:03:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61D6881F92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Adia6PGxViLT; Fri, 13 Jan 2023 23:03:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1378D817F5;
	Fri, 13 Jan 2023 23:03:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1378D817F5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1F26B1BF399
 for <buildroot@lists.busybox.net>; Fri, 13 Jan 2023 23:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF8F9607CE
 for <buildroot@lists.busybox.net>; Fri, 13 Jan 2023 23:03:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF8F9607CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UM-oHXUq9cbz for <buildroot@lists.busybox.net>;
 Fri, 13 Jan 2023 23:03:31 +0000 (UTC)
X-Greylist: delayed 00:08:54 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43B86605AF
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 43B86605AF
 for <buildroot@buildroot.org>; Fri, 13 Jan 2023 23:03:31 +0000 (UTC)
Received: from vfazio2.xes-mad.com (vfazio2.xes-mad.com [10.52.16.113])
 by mail.xes-mad.com (Postfix) with ESMTP id 2309620221;
 Fri, 13 Jan 2023 16:54:36 -0600 (CST)
From: Vincent Fazio <vfazio@xes-inc.com>
To: buildroot@buildroot.org
Date: Fri, 13 Jan 2023 16:54:24 -0600
Message-Id: <20230113225425.3301420-1-vfazio@xes-inc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=xes-inc.com; s=mail; 
 t=1673650476; bh=EROHzoX9uBoS0f+BDg4gmz5EzGRI/sm2UjCsT3OEaSc=;
 h=From:To:Cc:Subject:Date:From;
 b=xCeWi9ljYshPbKiW1Vjl+V3SRIiKsrUvSdGJcDgTdHhlWmPNPmMpHeLelEdTrqlY6
 wccMNstiW3OGj+J4M6ZjjGomg8bID10mPmVv8ZNVVo9VPVE20UXzjIGToqKvVglFHp
 uZJHM6aQ63x4LE1CSUS9NRLyyOl4ZxrMrmmt5rQo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com
 header.a=rsa-sha256 header.s=mail header.b=xCeWi9lj
Subject: [Buildroot] [PATCH 1/2] package/ipmitool: backport fixes for
 registry issues
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
 Vincent Fazio <vfazio@xes-inc.com>, Vincent Fazio <vfazio@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Vincent Fazio <vfazio@gmail.com>

Add upstream patches to:
  Fix the URL used for hte IANA PEN registry
  Make a missing registry file non-fatal
  Make downloading/installing the registry optional

The IANA PEN registry used by ipmitool takes up 4MB+. It is also not
"frozen" and can be updated at the whim of IANA. This causes headaches
when needing reproducible builds.

Registry installation will be disabled when BR2_REPRODUCIBLE is selected.

By default, the registry is not installed since it is largely a cosmetic
feature and not driving core functionality.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 .../0002-Fix-enterprise-numbers-URL.patch     |  33 ++++++
 ...t-require-the-IANA-PEN-registry-file.patch | 112 ++++++++++++++++++
 ...c-allow-disabling-registry-downloads.patch |  72 +++++++++++
 package/ipmitool/Config.in                    |  12 ++
 package/ipmitool/ipmitool.mk                  |   4 +
 5 files changed, 233 insertions(+)
 create mode 100644 package/ipmitool/0002-Fix-enterprise-numbers-URL.patch
 create mode 100644 package/ipmitool/0003-Do-not-require-the-IANA-PEN-registry-file.patch
 create mode 100644 package/ipmitool/0004-configure.ac-allow-disabling-registry-downloads.patch

diff --git a/package/ipmitool/0002-Fix-enterprise-numbers-URL.patch b/package/ipmitool/0002-Fix-enterprise-numbers-URL.patch
new file mode 100644
index 0000000000..af62d22459
--- /dev/null
+++ b/package/ipmitool/0002-Fix-enterprise-numbers-URL.patch
@@ -0,0 +1,33 @@
+From 1edb0e27e44196d1ebe449aba0b9be22d376bcb6 Mon Sep 17 00:00:00 2001
+From: Alexander Amelkin <alexander@amelkin.msk.ru>
+Date: Tue, 22 Nov 2022 13:55:33 +0300
+Subject: [PATCH] Fix enterprise-numbers URL
+
+IANA has changed their URL scheme, and the content at the old URL for
+enterprise-numbers switched from text/plain to text/html.
+
+Fix Makefile.am to use the new URL
+
+Resolves ipmitool/ipmitool#377
+
+Signed-off-by: Alexander Amelkin <alexander@amelkin.msk.ru>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index ce3267f..3182a52 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -41,7 +41,7 @@ MAINTAINERCLEANFILES = Makefile.in aclocal.m4 configure configure-stamp \
+ 	$(distdir).tar.gz $(distdir).tar.bz2
+ 
+ SUBDIRS = lib src include doc contrib control
+-IANA_PEN = http://www.iana.org/assignments/enterprise-numbers
++IANA_PEN = http://www.iana.org/assignments/enterprise-numbers.txt
+ 
+ dist-hook:
+ 	cp control/ipmitool.spec $(distdir)
+-- 
+2.25.1
+
diff --git a/package/ipmitool/0003-Do-not-require-the-IANA-PEN-registry-file.patch b/package/ipmitool/0003-Do-not-require-the-IANA-PEN-registry-file.patch
new file mode 100644
index 0000000000..6ac5ce989b
--- /dev/null
+++ b/package/ipmitool/0003-Do-not-require-the-IANA-PEN-registry-file.patch
@@ -0,0 +1,112 @@
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
index 0000000000..7c070cb51f
--- /dev/null
+++ b/package/ipmitool/0004-configure.ac-allow-disabling-registry-downloads.patch
@@ -0,0 +1,72 @@
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
index dbd6483110..ed3b918f9d 100644
--- a/package/ipmitool/Config.in
+++ b/package/ipmitool/Config.in
@@ -9,6 +9,18 @@ config BR2_PACKAGE_IPMITOOL
 
 if BR2_PACKAGE_IPMITOOL
 
+comment "IANA PEN Registry will not be installed on reproducible builds"
+	depends on BR2_REPRODUCIBLE
+
+config BR2_PACKAGE_IPMITOOL_PEN_REGISTRY
+	bool "install PEN registry"
+	depends on !BR2_REPRODUCIBLE
+	help
+	  Install the IANA PEN registry. 
+	  Shows manufacturer name in certain commands. 
+	  
+	  Not installing the registry saves ~4.3 MB.
+
 config BR2_PACKAGE_IPMITOOL_LANPLUS
 	bool "enable lanplus interface"
 	select BR2_PACKAGE_OPENSSL
diff --git a/package/ipmitool/ipmitool.mk b/package/ipmitool/ipmitool.mk
index b9f60d8151..f97d94693b 100644
--- a/package/ipmitool/ipmitool.mk
+++ b/package/ipmitool/ipmitool.mk
@@ -14,6 +14,10 @@ IPMITOOL_CPE_ID_VENDOR = ipmitool_project
 IPMITOOL_AUTORECONF = YES
 IPMITOOL_DEPENDENCIES = host-pkgconf
 
+ifneq ($(BR2_PACKAGE_IPMITOOL_PEN_REGISTRY),y)
+IPMITOOL_CONF_OPTS += --disable-registry-download
+endif
+
 ifeq ($(BR2_PACKAGE_FREEIPMI),y)
 IPMITOOL_DEPENDENCIES += freeipmi
 IPMITOOL_CONF_OPTS += --enable-intf-free
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
