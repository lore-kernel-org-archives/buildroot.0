Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD3EFC3DA7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 20:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D58F60AD4;
	Thu, 15 Aug 2024 20:18:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ve-1axY0wDNk; Thu, 15 Aug 2024 20:18:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D6E260B2C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D6E260B2C;
	Thu, 15 Aug 2024 20:18:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 514DF1BF3F4
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 20:18:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3FA0740249
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 20:18:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UYv-jiLmUXQO for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 20:18:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC9FB40144
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC9FB40144
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 20:18:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 53F8085F2C; Thu, 15 Aug 2024 20:18:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Aug 2024 22:15:02 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ff7787eadfc116f59a1f73cae8c47065810cb9d5
X-Git-Newrev: e929d75d7eed66f4aff4b57d0192d6332fb21257
X-Patchwork-Hint: ignore
Message-Id: <20240815201846.53F8085F2C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/rsyslog: extra plugins
 option introduced
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6250815584661186804=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6250815584661186804==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=e929d75d7eed66f4aff4b57d0192d6332fb21257
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The rsyslog package enables extra plugins based on the availability of
external dependencies. However, there are many cases where those
plugins are not needed, even when some of those external dependencies
are enabled. Allow disabling the build of plugins. This option is
useful in embedded systems to achieve compact footprint.

Signed-off-by: Konstantin Menyaev <KAMenyaev@salutedevices.com>
Signed-off-by: Flávio Tapajós <flavio.tapajos@newtesc.com.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rsyslog/Config.in  | 12 ++++++++++++
 package/rsyslog/rsyslog.mk | 35 +++++++++++++++++++----------------
 2 files changed, 31 insertions(+), 16 deletions(-)

diff --git a/package/rsyslog/Config.in b/package/rsyslog/Config.in
index d9e8b1ab6f..3c23de8346 100644
--- a/package/rsyslog/Config.in
+++ b/package/rsyslog/Config.in
@@ -17,6 +17,18 @@ config BR2_PACKAGE_RSYSLOG
 
 	  http://www.rsyslog.com
 
+if BR2_PACKAGE_RSYSLOG
+
+config BR2_PACKAGE_RSYSLOG_EXTRA_PLUGINS
+	bool "extra plugins"
+	default y
+	help
+	  Enable rsyslog plugins that require external
+	  dependencies. The different plugins will be automatically
+	  enabled if their dependencies are enabled.
+
+endif # BR2_PACKAGE_RSYSLOG
+
 comment "rsyslog needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index fac78795c2..98e5a8f8e8 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -15,12 +15,15 @@ RSYSLOG_CPE_ID_VENDOR = rsyslog
 RSYSLOG_IGNORE_CVES += CVE-2015-3243
 RSYSLOG_DEPENDENCIES = zlib libestr liblogging libfastjson host-pkgconf
 RSYSLOG_CONF_ENV = ac_cv_prog_cc_c99='-std=c99'
+
+ifeq ($(BR2_PACKAGE_RSYSLOG_EXTRA_PLUGINS),y)
 RSYSLOG_PLUGINS = imdiag imfile impstats imptcp \
 	mmanon mmaudit mmfields mmjsonparse mmpstrucdata mmsequence mmutf8fix \
 	mail omprog omruleset omstdout omuxsock \
 	pmaixforwardedfrom pmciscoios pmcisconames pmlastmsg pmsnare
+endif
 
-ifeq ($(BR2_PACKAGE_LIBRELP),y)
+ifeq ($(BR2_PACKAGE_LIBRELP)$(BR2_PACKAGE_RSYSLOG_EXTRA_PLUGINS),yy)
 RSYSLOG_DEPENDENCIES += librelp
 RSYSLOG_PLUGINS += relp
 endif
@@ -33,7 +36,7 @@ RSYSLOG_CONF_OPTS += \
 	--disable-mmkubernetes \
 	--disable-mmnormalize
 
-ifeq ($(BR2_PACKAGE_LIBCURL),y)
+ifeq ($(BR2_PACKAGE_LIBCURL)$(BR2_PACKAGE_RSYSLOG_EXTRA_PLUGINS),yy)
 RSYSLOG_DEPENDENCIES += libcurl
 RSYSLOG_CONF_OPTS += \
 	--enable-clickhouse \
@@ -52,35 +55,35 @@ RSYSLOG_CONF_OPTS += \
 	--disable-omhttpfs
 endif
 
-ifeq ($(BR2_PACKAGE_CIVETWEB_LIB),y)
+ifeq ($(BR2_PACKAGE_CIVETWEB_LIB)$(BR2_PACKAGE_RSYSLOG_EXTRA_PLUGINS),yy)
 RSYSLOG_DEPENDENCIES += apr-util civetweb
 RSYSLOG_CONF_OPTS += --enable-imhttp
 else
 RSYSLOG_CONF_OPTS += --disable-imhttp
 endif
 
-ifeq ($(BR2_PACKAGE_CZMQ),y)
+ifeq ($(BR2_PACKAGE_CZMQ)$(BR2_PACKAGE_RSYSLOG_EXTRA_PLUGINS),yy)
 RSYSLOG_DEPENDENCIES += czmq
 RSYSLOG_CONF_OPTS += --enable-imczmq --enable-omczmq
 else
 RSYSLOG_CONF_OPTS += --disable-imczmq --disable-omczmq
 endif
 
-ifeq ($(BR2_PACKAGE_GNUTLS),y)
+ifeq ($(BR2_PACKAGE_GNUTLS)$(BR2_PACKAGE_RSYSLOG_EXTRA_PLUGINS),yy)
 RSYSLOG_DEPENDENCIES += gnutls
 RSYSLOG_CONF_OPTS += --enable-gnutls
 else
 RSYSLOG_CONF_OPTS += --disable-gnutls
 endif
 
-ifeq ($(BR2_PACKAGE_HIREDIS),y)
+ifeq ($(BR2_PACKAGE_HIREDIS)$(BR2_PACKAGE_RSYSLOG_EXTRA_PLUGINS),yy)
 RSYSLOG_DEPENDENCIES += hiredis
 RSYSLOG_CONF_OPTS += --enable-omhiredis
 else
 RSYSLOG_CONF_OPTS += --disable-omhiredis
 endif
 
-ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
+ifeq ($(BR2_PACKAGE_LIBGCRYPT)$(BR2_PACKAGE_RSYSLOG_EXTRA_PLUGINS),yy)
 RSYSLOG_DEPENDENCIES += libgcrypt
 RSYSLOG_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
 RSYSLOG_CONF_OPTS += --enable-libgcrypt
@@ -88,21 +91,21 @@ else
 RSYSLOG_CONF_OPTS += --disable-libgcrypt
 endif
 
-ifeq ($(BR2_PACKAGE_LIBMAXMINDDB),y)
+ifeq ($(BR2_PACKAGE_LIBMAXMINDDB)$(BR2_PACKAGE_RSYSLOG_EXTRA_PLUGINS),yy)
 RSYSLOG_DEPENDENCIES += libmaxminddb
 RSYSLOG_CONF_OPTS += --enable-mmdblookup
 else
 RSYSLOG_CONF_OPTS += --disable-mmdblookup
 endif
 
-ifeq ($(BR2_PACKAGE_LIBPCAP),y)
+ifeq ($(BR2_PACKAGE_LIBPCAP)$(BR2_PACKAGE_RSYSLOG_EXTRA_PLUGINS),yy)
 RSYSLOG_DEPENDENCIES += libpcap
 RSYSLOG_CONF_OPTS += --enable-impcap
 else
 RSYSLOG_CONF_OPTS += --disable-impcap
 endif
 
-ifeq ($(BR2_PACKAGE_MARIADB),y)
+ifeq ($(BR2_PACKAGE_MARIADB)$(BR2_PACKAGE_RSYSLOG_EXTRA_PLUGINS),yy)
 RSYSLOG_DEPENDENCIES += mariadb
 RSYSLOG_CONF_OPTS += --enable-mysql
 RSYSLOG_CONF_ENV += ac_cv_prog_MYSQL_CONFIG=$(STAGING_DIR)/usr/bin/mysql_config
@@ -110,7 +113,7 @@ else
 RSYSLOG_CONF_OPTS += --disable-mysql
 endif
 
-ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
+ifeq ($(BR2_PACKAGE_POSTGRESQL)$(BR2_PACKAGE_RSYSLOG_EXTRA_PLUGINS),yy)
 RSYSLOG_DEPENDENCIES += postgresql
 RSYSLOG_CONF_OPTS += --enable-pgsql
 RSYSLOG_CONF_ENV += ac_cv_prog_PG_CONFIG=$(STAGING_DIR)/usr/bin/pg_config
@@ -118,28 +121,28 @@ else
 RSYSLOG_CONF_OPTS += --disable-pgsql
 endif
 
-ifeq ($(BR2_PACKAGE_QPID_PROTON),y)
+ifeq ($(BR2_PACKAGE_QPID_PROTON)$(BR2_PACKAGE_RSYSLOG_EXTRA_PLUGINS),yy)
 RSYSLOG_DEPENDENCIES += qpid-proton
 RSYSLOG_CONF_OPTS += --enable-omamqp1
 else
 RSYSLOG_CONF_OPTS += --disable-omamqp1
 endif
 
-ifeq ($(BR2_PACKAGE_RABBITMQ_C),y)
+ifeq ($(BR2_PACKAGE_RABBITMQ_C)$(BR2_PACKAGE_RSYSLOG_EXTRA_PLUGINS),yy)
 RSYSLOG_DEPENDENCIES += rabbitmq-c
 RSYSLOG_CONF_OPTS += --enable-omrabbitmq
 else
 RSYSLOG_CONF_OPTS += --disable-omrabbitmq
 endif
 
-ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID)$(BR2_PACKAGE_RSYSLOG_EXTRA_PLUGINS),yy)
 RSYSLOG_DEPENDENCIES += util-linux
 RSYSLOG_CONF_OPTS += --enable-uuid
 else
 RSYSLOG_CONF_OPTS += --disable-uuid
 endif
 
-ifeq ($(BR2_INIT_SYSTEMD),y)
+ifeq ($(BR2_INIT_SYSTEMD)$(BR2_PACKAGE_RSYSLOG_EXTRA_PLUGINS),yy)
 RSYSLOG_CONF_OPTS += \
 	--enable-imjournal \
 	--enable-omjournal \
@@ -151,7 +154,7 @@ RSYSLOG_CONF_OPTS += \
 	--disable-omjournal
 endif
 
-ifeq ($(BR2_PACKAGE_LIBDBI_DRIVERS),y)
+ifeq ($(BR2_PACKAGE_LIBDBI_DRIVERS)$(BR2_PACKAGE_RSYSLOG_EXTRA_PLUGINS),yy)
 RSYSLOG_CONF_OPTS += --enable-libdbi
 RSYSLOG_DEPENDENCIES += libdbi-drivers
 else

--===============6250815584661186804==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6250815584661186804==--
