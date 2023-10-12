Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016D8CDB474
	for <buildroot@archiver.kernel.org>; Thu, 12 Oct 2023 21:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28DFB610A0;
	Thu, 12 Oct 2023 21:14:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28DFB610A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xQmgS4hHhWAe; Thu, 12 Oct 2023 21:14:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23CFC6105F;
	Thu, 12 Oct 2023 21:14:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23CFC6105F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4311F1BF32B
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 21:14:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C2C240489
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 21:14:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C2C240489
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4qkpcT9NIcwg for <buildroot@lists.busybox.net>;
 Thu, 12 Oct 2023 21:14:09 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DC16340273
 for <buildroot@buildroot.org>; Thu, 12 Oct 2023 21:14:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC16340273
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-405497850dbso15086545e9.0
 for <buildroot@buildroot.org>; Thu, 12 Oct 2023 14:14:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697145246; x=1697750046;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+G2/FlGTFFQ5IcVfa4yfaVCqppcoBuwUflPL7ZbkonU=;
 b=quGmHPvmV6D/U+tDmaR6WZb63s9mWdd4AJqUqoFEYcdnW9Oq/iCeUbcee7YVVrXMl2
 nrLpzzECW2uLPaDEq7ifM0gUPxX+qPfoaUwwsYU43doS6r6k7a1EuLQwV1oqL1F+Sf5n
 o4odcgSFYmtuAO+amZzSg9b9mxeJquEGdOE0hK5aKjXEnTrl6hV4NO+tiERXqniQQ41A
 erkjufxt2ao+ezVRHErhpyYOyQbqEGcfYtg90k31fHXGe/BAoLafRampE1GuBNm1SgLz
 HRHxgQReUUP++PPr+p2urksOXRBRdxoXUXf+cgRgwuK+v0CxO9USjw7YQkk8oMD6mgj7
 Y6ow==
X-Gm-Message-State: AOJu0YxcCde91fv+LjVWuEvMr5W3iXeGIR34/lfnlhEMhTHVI8TgARFN
 LUNpQjRNHQPAxuVVj+5iEnuxbveurK4=
X-Google-Smtp-Source: AGHT+IF/MhLUraHUWCjTWKi/4CZrOT8g9C4B8NfQpoHKqILZkzuwamNnfPH5the4KVn0LJ2lzKOgxg==
X-Received: by 2002:adf:f452:0:b0:31f:fed4:d79d with SMTP id
 f18-20020adff452000000b0031ffed4d79dmr22223454wrp.30.1697145246318; 
 Thu, 12 Oct 2023 14:14:06 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 i12-20020a5d630c000000b00326b8a0e817sm19200689wru.84.2023.10.12.14.14.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 14:14:05 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 12 Oct 2023 23:13:57 +0200
Message-ID: <20231012211357.643153-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697145246; x=1697750046; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+G2/FlGTFFQ5IcVfa4yfaVCqppcoBuwUflPL7ZbkonU=;
 b=OLs9q4HpKEMLm/wtWsf0fD7wHvKLvrwqo7yXP+v5fNnpOR7KKtkkx9IOuKZP+lx26v
 2wbeiur7UPzVe9nR/zAUiRjpDC/poM6bCcGtZbth42Ve7VxjvT31optCIBysbca+bFs9
 5dutmiKeVYFwUzWqtCXLVu5Ray0iDCYq7VmxhvQtadriBsndqZdr6Qpa6wubL760uKJS
 0acnqOUuNTENdCUWrpGA9Wyhy0q0p4+DPQgvkCae9gdbRP5DOhKeUv4jk3yLCzRPlca6
 oB+OZE0QfA/S/6f94Eh5me/UjQhzGEy3pLXL19lshYIOiGK9/Jgx3mIAl1vd8dwrsZED
 OSvA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OLs9q4Hp
Subject: [Buildroot] [PATCH 1/1] package/netsnmp: fix musl build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following musl build failure raised since bump to version 5.9.4
in commit 868603755c16296ae2a61845891edeafc36e48ca:

large_fd_set.c: In function 'LFD_SET':
../include/net-snmp/net-snmp-config.h:1614:30: error: unknown type name 'unknown'; did you mean 'union'?
 1614 | #define NETSNMP_FD_MASK_TYPE unknown
      |                              ^~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/394ebf93621c33dc2ddf370297268e6de9de7c9a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...onfiguration-of-NETSNMP_FD_MASK_TYPE.patch | 38 +++++++++++++++++++
 package/netsnmp/netsnmp.mk                    |  2 +
 2 files changed, 40 insertions(+)
 create mode 100644 package/netsnmp/0001-Fix-configuration-of-NETSNMP_FD_MASK_TYPE.patch

diff --git a/package/netsnmp/0001-Fix-configuration-of-NETSNMP_FD_MASK_TYPE.patch b/package/netsnmp/0001-Fix-configuration-of-NETSNMP_FD_MASK_TYPE.patch
new file mode 100644
index 0000000000..91a00aec27
--- /dev/null
+++ b/package/netsnmp/0001-Fix-configuration-of-NETSNMP_FD_MASK_TYPE.patch
@@ -0,0 +1,38 @@
+From a62169f1fa358be8f330ea8519ade0610fac525b Mon Sep 17 00:00:00 2001
+From: Adam Gajda <adgajda@users.noreply.github.com>
+Date: Mon, 2 Oct 2023 16:40:31 +0200
+Subject: [PATCH] Fix configuration of NETSNMP_FD_MASK_TYPE
+
+Upstream: https://github.com/net-snmp/net-snmp/commit/a62169f1fa358be8f330ea8519ade0610fac525b
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure                        | 2 +-
+ configure.d/config_project_types | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure b/configure
+index 9f0a173d8a..945a27c663 100755
+--- a/configure
++++ b/configure
+@@ -30871,7 +30871,7 @@ CFLAGS="$CFLAGS -Werror"
+ 
+ { printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for the type of fd_set::fds_bits" >&5
+ printf %s "checking for the type of fd_set::fds_bits... " >&6; }
+-for type in __fd_mask __int32_t unknown; do
++for type in __fd_mask __int32_t long\ int unknown; do
+   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+ /* end confdefs.h.  */
+ 
+diff --git a/configure.d/config_project_types b/configure.d/config_project_types
+index 1b4c66b95e..a78e8ebb06 100644
+--- a/configure.d/config_project_types
++++ b/configure.d/config_project_types
+@@ -66,7 +66,7 @@ netsnmp_save_CFLAGS=$CFLAGS
+ CFLAGS="$CFLAGS -Werror"
+ 
+ AC_MSG_CHECKING([for the type of fd_set::fds_bits])
+-for type in __fd_mask __int32_t unknown; do
++for type in __fd_mask __int32_t long\ int unknown; do
+   AC_COMPILE_IFELSE([AC_LANG_PROGRAM([
+ #include <sys/select.h>
+ #include <stddef.h>
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index b0c35aa894..a79c13c611 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -40,6 +40,8 @@ NETSNMP_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) LIB_LDCONFIG_CMD=true inst
 NETSNMP_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) LIB_LDCONFIG_CMD=true install
 NETSNMP_MAKE = $(MAKE1)
 NETSNMP_CONFIG_SCRIPTS = net-snmp-config
+# We're patching configure.d/config_project_types
+NETSNMP_AUTORECONF = YES
 
 define NETSNMP_USERS
 	snmp -1 snmp -1 * - - - snmpd user
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
