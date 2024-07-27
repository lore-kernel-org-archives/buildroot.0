Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BCBDC3DA4A
	for <buildroot@archiver.kernel.org>; Sat, 27 Jul 2024 13:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0A6A40CC7;
	Sat, 27 Jul 2024 13:53:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GqMec4RjwN4u; Sat, 27 Jul 2024 13:53:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F285F40C67
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F285F40C67;
	Sat, 27 Jul 2024 13:53:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 861B51BF2A9
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 13:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7FE47400C6
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 13:53:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DRfMpEp-hpAv for <buildroot@lists.busybox.net>;
 Sat, 27 Jul 2024 13:53:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6FCB2400FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FCB2400FB
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6FCB2400FB
 for <buildroot@buildroot.org>; Sat, 27 Jul 2024 13:53:00 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-427ffae0b91so5942975e9.0
 for <buildroot@buildroot.org>; Sat, 27 Jul 2024 06:53:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722088378; x=1722693178;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cb4I+eI6CbaB0WJGSexpQcof/BB5g5QRxVFVe7xMM3A=;
 b=xJsFk7h0tQRToQNiHjmgQ0kDoVKiIOZjpqwdK4fVEf3ejIO/7umZqXGUYD4WzJm1TW
 A9zXB2/2wK+5zV8huxdy/qEPAJ1KiGjQIPKFuTYLDBIL3bjX2bJpUROzXrPQBWR/IRfo
 dJM0YwYR+oBx/4p9t6vD3V42np7ByGUr9Pi4+VH4JY1Z+Cd4bn0cfg3/hjITObVheoFc
 dPYOS80++DSw6mWY9Iku8m9DPfGUSKCNXBpyyuETsTFzlcArbDwU/iTDQCjVOQQQsPnU
 TelXUtvqYWBdXOiWLrnf9SdKjBqgT5GtUxcYO13RzwZK6XUT5qpj4GS/uJtBSpHJLkSk
 wYDw==
X-Gm-Message-State: AOJu0Yyj1iJRFD65It3hEXrePZguxtuHr/B5nBbKpDHv3B5w2vZ0NlE8
 PxT6s81p0lgtvu8s9NPuEKFJKJ9eTBtHpIXu/m0PgUjKmjuBRFAgufqbKg==
X-Google-Smtp-Source: AGHT+IF6mQ+1LJCIMMhrXUpO5Skmkh8A2559DgIFF0SkHSGEDw/NQDEy8bRY2fSD5a5fhIoko8k5zA==
X-Received: by 2002:a05:600c:3541:b0:428:29e:8c42 with SMTP id
 5b1f17b1804b1-42811d8bae3mr23990095e9.9.1722088377355; 
 Sat, 27 Jul 2024 06:52:57 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-428057b7274sm116218735e9.40.2024.07.27.06.52.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Jul 2024 06:52:56 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 27 Jul 2024 15:52:52 +0200
Message-ID: <20240727135252.389739-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722088378; x=1722693178; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cb4I+eI6CbaB0WJGSexpQcof/BB5g5QRxVFVe7xMM3A=;
 b=bf1PzAGUrarFjlzB6/8YN0InkGMHEuarwc+LiwUA2vB5+O6Bc+fUFfD6JS1pS0WF/I
 3VRfctq/ihFTZ/Aq5OsLcCx4b1RkAsymd38xsrPOb9e1ICg6uCCHvhSmqSqKW2rl9a5k
 E05UmDcV2tWxUbbla8PrzCmgwa8lLkM6kDmfon4YsSPrz+VQSOTH3E94dkVKBhgFlFiQ
 2ymZYvvAKUXNWd48+JPG31hZSKS/yq76NDqtenWqA05qAKWzOYjr7frBLf8gdNxSgfh7
 w6ES7KJ0IO9M7k8rk28Y+8BOseo2Y0uwRquNBcNsoIdUp9yGd/ZTq4q329jwUGVCwMdZ
 xL5Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=bf1PzAGU
Subject: [Buildroot] [PATCH 1/1] package/avahi: security bump to version
 0.9-rc1
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

- Drop patch (already in version)
- Fix CVE-2021-3468 and CVE-2023-38469 to CVE-2023-38473
- --{en,dis}able-libsystemd must be passed since
  https://github.com/avahi/avahi/commit/bc116c05b15f1f478a40e47fe9fc68011cef1e50

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                           |   1 -
 ...01-Fix-NULL-pointer-crashes-from-175.patch | 152 ------------------
 package/avahi/avahi.hash                      |   2 +-
 package/avahi/avahi.mk                        |  26 +--
 4 files changed, 17 insertions(+), 164 deletions(-)
 delete mode 100644 package/avahi/0001-Fix-NULL-pointer-crashes-from-175.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index df46ba4ab6..6172b8358d 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -337,7 +337,6 @@ package/aufs-util/0003-no-strip-lib.patch lib_patch.Upstream
 package/aumix/0001-fix-incorrect-makefile-am.patch lib_patch.Upstream
 package/autoconf/0001-dont-add-dirty-to-version.patch lib_patch.Upstream
 package/automake/0001-noman.patch lib_patch.Upstream
-package/avahi/0001-Fix-NULL-pointer-crashes-from-175.patch lib_patch.Upstream
 package/avahi/S05avahi-setup.sh lib_sysv.Indent lib_sysv.Variables
 package/avahi/S50avahi-daemon lib_sysv.Indent lib_sysv.Variables
 package/babeld/S50babeld Shellcheck lib_sysv.Indent lib_sysv.Variables
diff --git a/package/avahi/0001-Fix-NULL-pointer-crashes-from-175.patch b/package/avahi/0001-Fix-NULL-pointer-crashes-from-175.patch
deleted file mode 100644
index 7e191e8da7..0000000000
--- a/package/avahi/0001-Fix-NULL-pointer-crashes-from-175.patch
+++ /dev/null
@@ -1,152 +0,0 @@
-From 9d31939e55280a733d930b15ac9e4dda4497680c Mon Sep 17 00:00:00 2001
-From: Tommi Rantala <tommi.t.rantala@nokia.com>
-Date: Mon, 8 Feb 2021 11:04:43 +0200
-Subject: [PATCH] Fix NULL pointer crashes from #175
-
-avahi-daemon is crashing when running "ping .local".
-The crash is due to failing assertion from NULL pointer.
-Add missing NULL pointer checks to fix it.
-
-Introduced in #175 - merge commit 8f75a045709a780c8cf92a6a21e9d35b593bdecd
-
-[Retrieved from:
-https://github.com/lathiat/avahi/commit/9d31939e55280a733d930b15ac9e4dda4497680c]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- avahi-core/browse-dns-server.c   | 5 ++++-
- avahi-core/browse-domain.c       | 5 ++++-
- avahi-core/browse-service-type.c | 3 +++
- avahi-core/browse-service.c      | 3 +++
- avahi-core/browse.c              | 3 +++
- avahi-core/resolve-address.c     | 5 ++++-
- avahi-core/resolve-host-name.c   | 5 ++++-
- avahi-core/resolve-service.c     | 5 ++++-
- 8 files changed, 29 insertions(+), 5 deletions(-)
-
-diff --git a/avahi-core/browse-dns-server.c b/avahi-core/browse-dns-server.c
-index 049752e9..c2d914fa 100644
---- a/avahi-core/browse-dns-server.c
-+++ b/avahi-core/browse-dns-server.c
-@@ -343,7 +343,10 @@ AvahiSDNSServerBrowser *avahi_s_dns_server_browser_new(
-         AvahiSDNSServerBrowser* b;
- 
-         b = avahi_s_dns_server_browser_prepare(server, interface, protocol, domain, type, aprotocol, flags, callback, userdata);
-+        if (!b)
-+            return NULL;
-+
-         avahi_s_dns_server_browser_start(b);
- 
-         return b;
--}
-\ No newline at end of file
-+}
-diff --git a/avahi-core/browse-domain.c b/avahi-core/browse-domain.c
-index f145d56a..06fa70c0 100644
---- a/avahi-core/browse-domain.c
-+++ b/avahi-core/browse-domain.c
-@@ -253,7 +253,10 @@ AvahiSDomainBrowser *avahi_s_domain_browser_new(
-         AvahiSDomainBrowser *b;
- 
-         b = avahi_s_domain_browser_prepare(server, interface, protocol, domain, type, flags, callback, userdata);
-+        if (!b)
-+            return NULL;
-+
-         avahi_s_domain_browser_start(b);
- 
-         return b;
--}
-\ No newline at end of file
-+}
-diff --git a/avahi-core/browse-service-type.c b/avahi-core/browse-service-type.c
-index fdd22dcd..b1fc7af8 100644
---- a/avahi-core/browse-service-type.c
-+++ b/avahi-core/browse-service-type.c
-@@ -171,6 +171,9 @@ AvahiSServiceTypeBrowser *avahi_s_service_type_browser_new(
-         AvahiSServiceTypeBrowser *b;
- 
-         b = avahi_s_service_type_browser_prepare(server, interface, protocol, domain, flags, callback, userdata);
-+        if (!b)
-+            return NULL;
-+
-         avahi_s_service_type_browser_start(b);
- 
-         return b;
-diff --git a/avahi-core/browse-service.c b/avahi-core/browse-service.c
-index 5531360c..63e0275a 100644
---- a/avahi-core/browse-service.c
-+++ b/avahi-core/browse-service.c
-@@ -184,6 +184,9 @@ AvahiSServiceBrowser *avahi_s_service_browser_new(
-         AvahiSServiceBrowser *b;
- 
-         b = avahi_s_service_browser_prepare(server, interface, protocol, service_type, domain, flags, callback, userdata);
-+        if (!b)
-+            return NULL;
-+
-         avahi_s_service_browser_start(b);
- 
-         return b;
-diff --git a/avahi-core/browse.c b/avahi-core/browse.c
-index 2941e579..e8a915e9 100644
---- a/avahi-core/browse.c
-+++ b/avahi-core/browse.c
-@@ -634,6 +634,9 @@ AvahiSRecordBrowser *avahi_s_record_browser_new(
-         AvahiSRecordBrowser *b;
- 
-         b = avahi_s_record_browser_prepare(server, interface, protocol, key, flags, callback, userdata);
-+        if (!b)
-+            return NULL;
-+
-         avahi_s_record_browser_start_query(b);
- 
-         return b;
-diff --git a/avahi-core/resolve-address.c b/avahi-core/resolve-address.c
-index ac0b29b1..e61dd242 100644
---- a/avahi-core/resolve-address.c
-+++ b/avahi-core/resolve-address.c
-@@ -286,7 +286,10 @@ AvahiSAddressResolver *avahi_s_address_resolver_new(
-         AvahiSAddressResolver *b;
- 
-         b = avahi_s_address_resolver_prepare(server, interface, protocol, address, flags, callback, userdata);
-+        if (!b)
-+            return NULL;
-+
-         avahi_s_address_resolver_start(b);
- 
-         return b;
--}
-\ No newline at end of file
-+}
-diff --git a/avahi-core/resolve-host-name.c b/avahi-core/resolve-host-name.c
-index 808b0e72..4e8e5973 100644
---- a/avahi-core/resolve-host-name.c
-+++ b/avahi-core/resolve-host-name.c
-@@ -318,7 +318,10 @@ AvahiSHostNameResolver *avahi_s_host_name_resolver_new(
-         AvahiSHostNameResolver *b;
- 
-         b = avahi_s_host_name_resolver_prepare(server, interface, protocol, host_name, aprotocol, flags, callback, userdata);
-+        if (!b)
-+            return NULL;
-+
-         avahi_s_host_name_resolver_start(b);
- 
-         return b;
--}
-\ No newline at end of file
-+}
-diff --git a/avahi-core/resolve-service.c b/avahi-core/resolve-service.c
-index 66bf3cae..43771763 100644
---- a/avahi-core/resolve-service.c
-+++ b/avahi-core/resolve-service.c
-@@ -519,7 +519,10 @@ AvahiSServiceResolver *avahi_s_service_resolver_new(
-         AvahiSServiceResolver *b;
- 
-         b = avahi_s_service_resolver_prepare(server, interface, protocol, name, type, domain, aprotocol, flags, callback, userdata);
-+        if (!b)
-+            return NULL;
-+
-         avahi_s_service_resolver_start(b);
- 
-         return b;
--}
-\ No newline at end of file
-+}
diff --git a/package/avahi/avahi.hash b/package/avahi/avahi.hash
index 3bf22f831d..3961f9fd6d 100644
--- a/package/avahi/avahi.hash
+++ b/package/avahi/avahi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  060309d7a333d38d951bc27598c677af1796934dbd98e1024e7ad8de798fedda  avahi-0.8.tar.gz
+sha256  f6c333a7e54918eaa72add70616fe34ef7f93ccbc5644e4626290e098b7a59c2  avahi-0.9-rc1.tar.gz
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  LICENSE
diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 1992669a92..8283f633f9 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -4,20 +4,22 @@
 #
 ################################################################################
 
-AVAHI_VERSION = 0.8
-AVAHI_SITE = https://github.com/lathiat/avahi/releases/download/v$(AVAHI_VERSION)
+AVAHI_VERSION = 0.9-rc1
+AVAHI_SITE = $(call github,avahi,avahi,v$(AVAHI_VERSION))
 AVAHI_LICENSE = LGPL-2.1+
 AVAHI_LICENSE_FILES = LICENSE
 AVAHI_CPE_ID_VENDOR = avahi
 AVAHI_SELINUX_MODULES = avahi
 AVAHI_INSTALL_STAGING = YES
+# From git
+AVAHI_AUTORECONF = YES
+AVAHI_AUTOPOINT = YES
 
-# CVE-2021-26720 is an issue in avahi-daemon-check-dns.sh, which is
-# part of the Debian packaging and not part of upstream avahi
-AVAHI_IGNORE_CVES += CVE-2021-26720
-
-# 0001-Fix-NULL-pointer-crashes-from-175.patch
-AVAHI_IGNORE_CVES += CVE-2021-36217
+# fix missing config.rpath (needed for autoreconf) in the codebase
+define AVAHI_TOUCH_CONFIG_RPATH
+	touch $(@D)/config.rpath
+endef
+AVAHI_PRE_CONFIGURE_HOOKS += AVAHI_TOUCH_CONFIG_RPATH
 
 AVAHI_CONF_ENV = \
 	avahi_cv_sys_cxx_works=yes \
@@ -57,9 +59,13 @@ AVAHI_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 AVAHI_CFLAGS = $(TARGET_CFLAGS)
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
-AVAHI_CONF_OPTS += --with-systemdsystemunitdir=/usr/lib/systemd/system
+AVAHI_CONF_OPTS += \
+	--enable-libsystemd \
+	--with-systemdsystemunitdir=/usr/lib/systemd/system
 else
-AVAHI_CONF_OPTS += --with-systemdsystemunitdir=no
+AVAHI_CONF_OPTS += \
+	--disable-libsystemd \
+	--with-systemdsystemunitdir=no
 AVAHI_CFLAGS += -DDISABLE_SYSTEMD
 endif
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
