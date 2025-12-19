Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C999D7879C
	for <buildroot@archiver.kernel.org>; Fri, 19 Dec 2025 16:30:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B72028408D;
	Fri, 19 Dec 2025 16:30:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hXqWJ1J5y7bi; Fri, 19 Dec 2025 16:30:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DAF784090
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766161832;
	bh=HxHB40HVEMgNYO+Z9LJxHDqfDK+cnZOznnEV7bgbhn8=;
	h=Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=e5ztmeOGxVfkA9DrpEkkickni+SDoA8d7EoI5Hl4I3l2qCWsevPALGu5pcrqTTbOl
	 3B/uFI+IwE0Ymn/+ghiROSkLUe0XHWTkxdh2/w2cZnZcl2992j301euqNmvvL/3NYA
	 KgN09OlnjTkmBWSY5pdSbxQCNt73CGS7DLFURselvADaqBd9Kb6G8kTjNkyqdIPOep
	 RITpEx+EcfqpzKLz6IT95bX/h5+UCX/sBmPFDmSRxt8ltebnzo2n00B+F2LPbnt0yg
	 kxbZhvCKeAEEXorYdHLkBHXgAzIJsPGXF55D4mA6M9OT15IUu4iSYZF8R2kP8t3OCd
	 IQqAHWOK7MrOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DAF784090;
	Fri, 19 Dec 2025 16:30:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BCA7293
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 16:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5DD8D84090
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 16:30:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pPoqVM-F18ym for <buildroot@buildroot.org>;
 Fri, 19 Dec 2025 16:30:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=bastien.curutchet@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 736968408D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 736968408D
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 736968408D
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 16:30:29 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id C2BD61A22E9;
 Fri, 19 Dec 2025 16:30:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 999426071D;
 Fri, 19 Dec 2025 16:30:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E973510AA9366; Fri, 19 Dec 2025 17:30:21 +0100 (CET)
Date: Fri, 19 Dec 2025 17:30:15 +0100
MIME-Version: 1.0
Message-Id: <20251219-rasdaemon-v4-1-2cdc992de787@bootlin.com>
References: <20251219-rasdaemon-v4-0-2cdc992de787@bootlin.com>
In-Reply-To: <20251219-rasdaemon-v4-0-2cdc992de787@bootlin.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Fiona Klute <fiona.klute@gmx.de>, 
 Bastien Curutchet <bastien.curutchet@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766161822; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ZPphgnWwGqA5X4ZfoNGH5u2y9CtIVZ6XeIMvB4PatqM=;
 b=WTsZ3feI/4sa7JDghmApxq/rNNZTgDZDnhHhf5zJkmDFG0KBtK5LQ+0BSDSjIvkvKCgDqr
 A98da7hGE6Lri3SXpAiAYiYT56bhNNabzczHhSD33MfFGeQazs41InRaUdLierrGVdrZfn
 JyYpz/TCgOQl1y8aMAQlVYpGfUNW+lW+LKStLJoXxmKRFKcyyNV38dCEd3dBteZh9YXD01
 3KAV/hn7vY16XhH6qLEIq/UvCkX3tJKYHJBmgBYt7zz2A8m8cRAcR/2/YkuA06nix18XDh
 AXXPSrJ2kHUPXQ8SsjVZH1vc8tNQEdlYwWNh01+FYcYQChqEOg/7pDCbjKgSIw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=WTsZ3feI
Subject: [Buildroot] [PATCH v4 1/2] package/rasdaemon: Add rasdaemon package
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
From: Bastien Curutchet via buildroot <buildroot@buildroot.org>
Reply-To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rasdaemon is a tool that aims to replace the edac-tool and provide a way
to collect all hardware error events reported by the Linux kernel in a
common framework.

Add a new package to support rasdaemon in the 'Hardware handling'
section. It depends on libtraceevents to detect the ftrace events
generated by the kernel. There is currently a build issue when sqlite
isn't availaible while it's supposed to be an optional dependency. This
build issue is fixed by patch 0001 (which has been also submitted to the
rasdaemon project itself).

Support for the PCIe AER events is optionnal and implies a dependency on
pciutils so also add a dedicated 'sub-option' to enable it.

Add a SYSV init script to start / stop the daemon

Add myself to the DEVELOPERS file.

Reviewed-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 DEVELOPERS                                         |  3 ++
 package/Config.in                                  |  1 +
 ...aemon-fix-build-when-sqlite-isn-t-enabled.patch | 46 ++++++++++++++++
 package/rasdaemon/Config.in                        | 26 +++++++++
 package/rasdaemon/S95rasdaemon                     | 63 ++++++++++++++++++++++
 package/rasdaemon/rasdaemon.hash                   |  3 ++
 package/rasdaemon/rasdaemon.mk                     | 40 ++++++++++++++
 7 files changed, 182 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index db001d6bb0707a5877c0849fa85fa736377e60dd..b1ead6d26c4e8ff160bcc7ed85b0945ac5e551dc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -341,6 +341,9 @@ F:	package/tcpdump/
 F:	package/ti-uim/
 F:	package/uhubctl/
 
+N:	Bastien Curutchet <bastien.curutchet@bootlin.com>
+F:	package/rasdaemon/
+
 N:	Baxiche Su <baxiche@gmail.com>
 F:	package/qt6/qt6multimedia/
 
diff --git a/package/Config.in b/package/Config.in
index 12f327cb273526781d931b834e24d0df5024e80e..1a93cec2fa22e3a6e70acbf799b32b00d5e8b5de 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -584,6 +584,7 @@ endmenu
 	source "package/pru-software-support/Config.in"
 	source "package/pulseview/Config.in"
 	source "package/qoriq-cadence-dp-firmware/Config.in"
+	source "package/rasdaemon/Config.in"
 	source "package/raspi-gpio/Config.in"
 	source "package/rdma-core/Config.in"
 	source "package/read-edid/Config.in"
diff --git a/package/rasdaemon/0001-rasdaemon-fix-build-when-sqlite-isn-t-enabled.patch b/package/rasdaemon/0001-rasdaemon-fix-build-when-sqlite-isn-t-enabled.patch
new file mode 100644
index 0000000000000000000000000000000000000000..2dccbec55f10ee45b4ea1abadda217b9a0f924c1
--- /dev/null
+++ b/package/rasdaemon/0001-rasdaemon-fix-build-when-sqlite-isn-t-enabled.patch
@@ -0,0 +1,46 @@
+From 8eaf25c30554c7cc457406ce5895b8087904cb2b Mon Sep 17 00:00:00 2001
+From: Bastien Curutchet <bastien.curutchet@bootlin.com>
+Date: Wed, 17 Dec 2025 11:38:52 +0100
+Subject: [PATCH] rasdaemon: fix build when sqlite isn't enabled
+
+Build without SQLite enabled through --enable-sqlite3 still fails if
+sqlite isn't available:
+>   CC       rasdaemon-rasdaemon.o
+> In file included from rasdaemon.c:17:
+> ras-record.h:11:10: fatal error: sqlite3.h: No such file or directory
+>    11 | #include <sqlite3.h>
+>       |          ^~~~~~~~~~~
+> compilation terminated.
+
+Include the sqlite header only if the SQLite feature is enabled.
+
+Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
+Upstream: https://github.com/mchehab/rasdaemon/pull/234
+---
+ ras-record.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/ras-record.h b/ras-record.h
+index 21edcd6..cb03f4e 100644
+--- a/ras-record.h
++++ b/ras-record.h
+@@ -8,7 +8,6 @@
+ #ifndef __RAS_RECORD_H
+ #define __RAS_RECORD_H
+ 
+-#include <sqlite3.h>
+ #include <fcntl.h>
+ #include <stdbool.h>
+ #include <stdint.h>
+@@ -320,6 +319,8 @@ struct ras_cxl_memory_sparing_event;
+ 
+ #ifdef HAVE_SQLITE3
+ 
++#include <sqlite3.h>
++
+ struct sqlite3_priv {
+ 	sqlite3		*db;
+ 	sqlite3_stmt	*stmt_mc_event;
+-- 
+2.52.0
+
diff --git a/package/rasdaemon/Config.in b/package/rasdaemon/Config.in
new file mode 100644
index 0000000000000000000000000000000000000000..64ae4a82632db12f8915aee9b9d947945762438d
--- /dev/null
+++ b/package/rasdaemon/Config.in
@@ -0,0 +1,26 @@
+config BR2_PACKAGE_RASDAEMON
+	bool "rasdaemon"
+	depends on !BR2_STATIC_LIBS # libtraceevent
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBTRACEEVENT
+	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
+	help
+	  rasdaemon is a tool that collects all hardware error events
+	  reported by the Linux Kernel from several sources (EDAC, MCE
+	  PCI, ...) into one common framework.
+
+	  https://github.com/mchehab/rasdaemon
+
+if BR2_PACKAGE_RASDAEMON
+
+config BR2_PACKAGE_RASDAEMON_AER
+	bool "Enable AER support"
+	select BR2_PACKAGE_PCIUTILS
+	help
+	  Enable handling of AER (Advanced Error Reporting) events on
+	  PCIe
+
+endif
+
+comment "rasdaemon needs a toolchain w/ threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/rasdaemon/S95rasdaemon b/package/rasdaemon/S95rasdaemon
new file mode 100644
index 0000000000000000000000000000000000000000..390ff9c9029ba9122217f13eb88bac7715c1c05f
--- /dev/null
+++ b/package/rasdaemon/S95rasdaemon
@@ -0,0 +1,63 @@
+#!/bin/sh
+#
+# S95rasdaemon	Starts Rasdaemon.
+#
+# shellcheck disable=SC2317 # functions are called via variable
+
+DAEMON="rasdaemon"
+PIDFILE="/var/run/$DAEMON.pid"
+
+start() {
+	printf "Starting %s: " "$DAEMON"
+
+	if ! grep -q debugfs /proc/mounts ; then
+		echo "FAIL : debugfs is missing"
+		return 1
+	fi
+
+	start-stop-daemon --start --pidfile "$PIDFILE" --make-pidfile \
+		--background --exec "/usr/sbin/$DAEMON" -- -f
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+stop() {
+	printf "Stopping %s: " "$DAEMON"
+	start-stop-daemon --stop --pidfile "$PIDFILE" --exec "/usr/sbin/$DAEMON"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+		return "$status"
+	fi
+	while start-stop-daemon --stop --test --quiet --pidfile "$PIDFILE" \
+		--exec "/sbin/$DAEMON"; do
+		sleep 0.1
+	done
+	rm -f "$PIDFILE"
+	return "$status"
+}
+
+restart() {
+	stop
+	start
+}
+
+reload() {
+	restart
+}
+
+case "$1" in
+	start|stop|reload|restart)
+		"$1"
+		;;
+	*)
+		echo "Usage: $0 {start|stop|reload|restart}"
+		exit 1
+esac
diff --git a/package/rasdaemon/rasdaemon.hash b/package/rasdaemon/rasdaemon.hash
new file mode 100644
index 0000000000000000000000000000000000000000..e1b600a4893bef2f58c86f6d742fb7cbcb480fc8
--- /dev/null
+++ b/package/rasdaemon/rasdaemon.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  7e12459f9477036491ac2b1e4c07cc3e8efea6dcd30525a263ab1f83910b773a  rasdaemon-0.8.4.tar.gz
+sha256  39bc367cd7cd291d217447632b28a74be414a52b142b1875ac8789184aeca7b2  COPYING
diff --git a/package/rasdaemon/rasdaemon.mk b/package/rasdaemon/rasdaemon.mk
new file mode 100644
index 0000000000000000000000000000000000000000..a6f53a7b6abc898800d57b75235709875fcde7fa
--- /dev/null
+++ b/package/rasdaemon/rasdaemon.mk
@@ -0,0 +1,40 @@
+################################################################################
+#
+# rasdaemon
+#
+################################################################################
+
+RASDAEMON_VERSION = 0.8.4
+RASDAEMON_SITE = $(call github,mchehab,rasdaemon,v$(RASDAEMON_VERSION))
+RASDAEMON_LICENSE = GPL-2.0+
+RASDAEMON_LICENSE_FILES = COPYING
+RASDAEMON_AUTORECONF = YES
+
+RASDAEMON_DEPENDENCIES = libtraceevent
+# rasdaemon uses argp.h which is not provided by uclibc or musl by default.
+# Use the argp-standalone package to provide this.
+ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
+RASDAEMON_DEPENDENCIES += argp-standalone
+RASDAEMON_CONF_ENV += LIBS="-largp"
+endif
+
+ifeq ($(BR2_PACKAGE_SQLITE),y)
+RASDAEMON_CONF_OPTS += --enable-sqlite3
+RASDAEMON_DEPENDENCIES += sqlite
+else
+RASDAEMON_CONF_OPTS += --disable-sqlite3
+endif
+
+ifeq ($(BR2_PACKAGE_RASDAEMON_AER),y)
+RASDAEMON_DEPENDENCIES += pciutils
+RASDAEMON_CONF_OPTS += --enable-aer
+else
+RASDAEMON_CONF_OPTS += --disable-aer
+endif
+
+define RASDAEMON_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D package/rasdaemon/S95rasdaemon \
+		$(TARGET_DIR)/etc/init.d/S95rasdaemon
+endef
+
+$(eval $(autotools-package))

-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
