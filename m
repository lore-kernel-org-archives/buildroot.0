Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A32C3ABB2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 15:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9F24410F6;
	Mon, 16 Sep 2024 15:13:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N9ib0PpZ35an; Mon, 16 Sep 2024 15:13:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6923740C6F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6923740C6F;
	Mon, 16 Sep 2024 15:13:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 218BB1BF41D
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 15:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DDDB740C2A
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 15:12:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RueNDuaKMCBc for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 15:12:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::644; helo=mail-ej1-x644.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0F49C40C6F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F49C40C6F
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0F49C40C6F
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 15:12:23 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id
 a640c23a62f3a-a8a765f980dso86480866b.1
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 08:12:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726499542; x=1727104342;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VWMAkbEFHNfGhLPk2talQ4v13JTmY9zsXtAUeFdsZ6U=;
 b=IiFtfCEMPiB1MiqOVWr3bvSZDuKmu7oXuqcVjlm5RIGS3IiJ4b7s1salM812uH6r61
 eznBqIqpF5gIOPaRODCXBeIYmHYfGtH3OW8GPuR+AaYbYbSWSGjXPQI0rJUUrymZae9q
 kXe5hH8y6A0CEuuxunKWyRrk4BMyon+qzMhw+MJMhpUkqseOkpH4hVWCWzJpr+vly03X
 Xq+oClvvOBtTApSPUQjCVrBL6qcoLY4oj3RTlWOtfjpPKvT7KOkzttdjuDI2eGTJwF62
 PnRdoetyU3K0u2TY5/Nb7rwptU1oVSFxWdzIRzjMmjULncaxGHqp7eGC8JewIYKcUQcp
 9Vtg==
X-Gm-Message-State: AOJu0YyhsFn0UFglp1xqkB8Y3pVHqNiA121j+cx8PYHEtWJRymXRrFMy
 KrOMYv4g8LiyGqIov+2Lwz4q0NM6lMR63IZR8Wm3GDTbz/7i0cH1toJPNV0mjQ1dNeAJh00j0gF
 SGZQ3Muj6
X-Google-Smtp-Source: AGHT+IGf/viag/hQ2afZgDJGKI4X1i0vxIqtafLUK3kvsRHoTk0Vn0aOZm8TFBOeJMXnKOGVaSDxTg==
X-Received: by 2002:a17:907:6e8e:b0:a8d:2624:1a85 with SMTP id
 a640c23a62f3a-a9029641b35mr654104566b.12.1726499541469; 
 Mon, 16 Sep 2024 08:12:21 -0700 (PDT)
Received: from adam-laptop.ipgroup.local (212-57-59-66.xdsl.deanconnect.nl.
 [212.57.59.66]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90610f440bsm330460166b.86.2024.09.16.08.12.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2024 08:12:21 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 17:12:06 +0200
Message-ID: <20240916151206.947484-14-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240916151206.947484-1-adam.duskett@amarulasolutions.com>
References: <20240916151206.947484-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1726499542; x=1727104342;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VWMAkbEFHNfGhLPk2talQ4v13JTmY9zsXtAUeFdsZ6U=;
 b=MM02e6F+TIDEsF+baDN978VzEZGqq3J8McJxfCGqTyOZexHl9/PoGK8UBe7G78XKS+
 EKnpna2xRtUsTcGShLXQvOQDqTCPN9vKLa/eCA77+lW7YMZxngzd9rIrPxZFKSg9kFUT
 L2VFyZICqjtFhWIfJwAOoNeeVL83PChI+Jnww=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=MM02e6F+
Subject: [Buildroot] [PATCH 13/13] package/audit: bump version to 4.0.2
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Antoine Tenart <atenart@kernel.org>,
 Marek Belisko <marek.belisko@open-nandra.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In addition, audit 4.x now provides two service files:
 - audit-rules.service
 - auditd.service, which depends on audit-rules.service

audit-rules.service is a one-shot service that runs augenrules --load.
To keep audit compatible with sysvinit-based systems, create a new file,
S02augenrules, and move S02auditd to S03auditd. This change keeps the basic
format of the systemd provided service files for ease of maintance.

Other changes:
 - The --without-python option is no longer present.
 - There is no longer a --enable/--disable-systemd option.
 - audit.rules are no longer autogenerated on startup. As such, the RedHat
   rpm .spec logic is copied, and $(@D)/rules/10-base-config.rules is copied
   to $(TARGET_DIR)/etc/audit/rules.d/audit.rules as part of the
   POST_INSTALL_TARGET_HOOKS. If /etc/audit/rules.d/audit.rules does not exit
   on the target, auditd fails to run. This change is also a bonus for
   read-only systems and the audit.rules file is guaranteed to be on the system.

Tested with qemu_x86_64_defconfig and running checking if audit is running
properly.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/audit/S02augenrules            | 31 ++++++++++++++++++++++++++
 package/audit/{S02auditd => S03auditd} |  4 +---
 package/audit/audit.hash               |  2 +-
 package/audit/audit.mk                 | 20 +++++++++--------
 4 files changed, 44 insertions(+), 13 deletions(-)
 create mode 100644 package/audit/S02augenrules
 rename package/audit/{S02auditd => S03auditd} (87%)

diff --git a/package/audit/S02augenrules b/package/audit/S02augenrules
new file mode 100644
index 0000000000..70342a231c
--- /dev/null
+++ b/package/audit/S02augenrules
@@ -0,0 +1,31 @@
+#!/bin/sh
+#
+# audi       This starts and stops auditd
+#
+# description: This starts the Linux Auditing System Daemon,
+#              which collects security related events in a dedicated
+#              audit log. If this daemon is turned off, audit events
+#              will be sent to syslog.
+#
+
+DAEMON="augenrules"
+
+start(){
+	printf "Starting %s: " "${DAEMON}"
+	# Run audit daemon executable
+	if /usr/sbin/"${DAEMON}" --load > /dev/null 2>&1; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+}
+
+case "$1" in
+	start)
+		start
+		;;
+	*)
+		echo "Usage: $0 {start}"
+		exit 1
+		;;
+esac
diff --git a/package/audit/S02auditd b/package/audit/S03auditd
similarity index 87%
rename from package/audit/S02auditd
rename to package/audit/S03auditd
index b23c49a125..9b3f633812 100644
--- a/package/audit/S02auditd
+++ b/package/audit/S03auditd
@@ -23,9 +23,7 @@ start(){
 	fi
 
 	# Run audit daemon executable
-	if start-stop-daemon -S -q -p "${PIDFILE}" --exec /usr/sbin/"${DAEMON}"; then
-		# Load the default rules
-		test -f /etc/audit/rules.d/audit.rules && /usr/sbin/auditctl -R /etc/audit/rules.d/audit.rules >/dev/null
+	if start-stop-daemon -S -p "${PIDFILE}" --exec /usr/sbin/"${DAEMON}"; then
 		echo "OK"
 	else
 		echo "FAIL"
diff --git a/package/audit/audit.hash b/package/audit/audit.hash
index 5743b3a13a..6db85f1b33 100644
--- a/package/audit/audit.hash
+++ b/package/audit/audit.hash
@@ -1,4 +1,4 @@
 #Locally computed
-sha256  c0b1792d1f0a88c6f1828710509cbb987059fc68712c97669ca90eae103d287d  audit-3.1.2.tar.gz
+sha256  d5d1b5d50ee4a2d0d17875bc6ae6bd6a7d5b34d9557ea847a39faec531faaa0a  audit-4.0.2.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
 sha256  f18a0811fa0e220ccbc42f661545e77f0388631e209585ed582a1c693029c6aa  COPYING.LIB
diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index c703acc559..161c15e70f 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUDIT_VERSION = 3.1.2
+AUDIT_VERSION = 4.0.2
 AUDIT_SITE = http://people.redhat.com/sgrubb/audit
 AUDIT_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 AUDIT_LICENSE_FILES = COPYING COPYING.LIB
@@ -13,7 +13,7 @@ AUDIT_CPE_ID_PRODUCT = linux_audit
 
 AUDIT_INSTALL_STAGING = YES
 
-AUDIT_CONF_OPTS = --without-python --without-python3 --disable-zos-remote
+AUDIT_CONF_OPTS = --without-python3 --disable-zos-remote
 
 # src/libev has some assembly function that is not present in Thumb mode:
 # Error: selected processor does not support `mcr p15,0,r3,c7,c10,5' in Thumb mode
@@ -40,14 +40,9 @@ ifeq ($(BR2_aarch64),y)
 AUDIT_CONF_OPTS += --with-aarch64
 endif
 
-ifeq ($(BR2_INIT_SYSTEMD),y)
-AUDIT_CONF_OPTS += --enable-systemd
-else
-AUDIT_CONF_OPTS += --disable-systemd
-endif
-
 define AUDIT_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 755 package/audit/S02auditd $(TARGET_DIR)/etc/init.d/S02auditd
+	$(INSTALL) -D -m 755 package/audit/S02augenrules $(TARGET_DIR)/etc/init.d/S02augenrules
+	$(INSTALL) -D -m 755 package/audit/S03auditd $(TARGET_DIR)/etc/init.d/S03auditd
 endef
 
 define AUDIT_INSTALL_INIT_SYSTEMD
@@ -55,6 +50,13 @@ define AUDIT_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/usr/lib/tmpfiles.d/audit.conf
 endef
 
+define AUDIT_INSTALL_RULES
+	mkdir -p $(TARGET_DIR)/etc/audit/rules.d
+	$(INSTALL) -m 0640 $(@D)/rules/10-base-config.rules \
+		$(TARGET_DIR)/etc/audit/rules.d/audit.rules
+endef
+AUDIT_POST_INSTALL_TARGET_HOOKS += AUDIT_INSTALL_RULES
+
 define AUDIT_INSTALL_CLEANUP
 	$(RM) $(TARGET_DIR)/etc/rc.d/init.d/auditd
 	$(RM) $(TARGET_DIR)/etc/sysconfig/auditd
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
