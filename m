Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF1BCD1299
	for <buildroot@archiver.kernel.org>; Thu,  4 Apr 2024 16:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78D1D40146;
	Thu,  4 Apr 2024 16:29:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y-1TnxYGEKGG; Thu,  4 Apr 2024 16:29:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 570FF40223
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 570FF40223;
	Thu,  4 Apr 2024 16:29:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6E7711BF366
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 16:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5AFFD82D62
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 16:29:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U60xu8YJpGxC for <buildroot@lists.busybox.net>;
 Thu,  4 Apr 2024 16:29:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C12C182CFD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C12C182CFD
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C12C182CFD
 for <buildroot@busybox.net>; Thu,  4 Apr 2024 16:29:53 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-343cd12630aso400655f8f.1
 for <buildroot@busybox.net>; Thu, 04 Apr 2024 09:29:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712248192; x=1712852992;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t9MiCFC78d5Q+eYsjK6f1WqHI3vpkHMBR0PWfgb7pos=;
 b=uoGfYYpwk6IG5C4l/6TjB//MJO/DfnJdi/S4eCZFPAedsAGL7MZC2Pui18tPXviqSt
 N7fuSQAZU4aSDo6/TYYpHln+Kl0DFeWaNNbY1DE8T75HK2EByeHLYzQyaS+folYc/sls
 TSgQ4IHh1dNEq/OJvL1wo9HDsM4+KYz4OKbdFwI0Zyjbn3LVfximPzZIBflKgleH/gpz
 /tfsil0MR7pmd+oPnvpUScKcsqNcU0LTRtN7Fa+JzqPcodFwTl8B+kJBkTscswBPhnM7
 jFYRKfNzGxCAZedMuaeQNbuHIv7Zt0f15QOdejjjpJ7qJxMJb5EUmj1Q7VBddqmYJMmB
 inhQ==
X-Gm-Message-State: AOJu0YymFCPm86JA4zqCTKLdUuLonTEGxf22i5xx+wZqm2ppR8i348qd
 aIGCGoaHWjpJGclBlkGWM3Wg6pkJabUmkQ4YmofhkbKdDd2mqB8xwQ02yhHjWwWwEP912ZG9bM4
 =
X-Google-Smtp-Source: AGHT+IGwJJFSiad5b9cKPWuipBP+PgVg20lpEZRpiZXzj3qyxeq6qY5u8sKUqh2+ZkK4W77apnCibA==
X-Received: by 2002:a05:6000:1bc2:b0:341:b9dc:eb03 with SMTP id
 j2-20020a0560001bc200b00341b9dceb03mr83417wrv.3.1712248191498; 
 Thu, 04 Apr 2024 09:29:51 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.74]) by smtp.gmail.com with ESMTPSA id
 bo15-20020a056000068f00b00341e2146b53sm5395900wrb.106.2024.04.04.09.29.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 09:29:51 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Thu,  4 Apr 2024 18:29:37 +0200
Message-Id: <20240404162938.33317-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1712248192; x=1712852992; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=t9MiCFC78d5Q+eYsjK6f1WqHI3vpkHMBR0PWfgb7pos=;
 b=SBUekLCrfM0y1EonejPnGc1QH59UBwfp4W/CwNh5ucpXBJj6YEq8ev2K5eq1TExttc
 ECzVDCrOMleEyFy3nydub1AKqvCj2oSkhMgfrohSgoXgx0FNpVe7kkIPlfGy4nbotlrB
 ZzQ1U6LehvE0iJSZ7NwEEo+oCje2TBnqmIB0onK9ikmM030ZgfHdj/X/tkQkVw3a7c/H
 TfxfJ8cMr/ixcGOXbvxYWYkryxZ8E8p/ueSEXjXd3+MgZDLxyQm6v/V0Sqo8SXTkfUOH
 b81zBOSkz8T8ErZlo9LF0du71/YZDXzeLy7WEfKgg54DQpWwHhkOcuTvwZoLL2tHE4ZT
 ab8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=SBUekLCr
Subject: [Buildroot] [PATCH v2 1/2] package/lmdb: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/lmdb/Config.in | 13 +++++++++++++
 package/lmdb/lmdb.hash |  3 +++
 package/lmdb/lmdb.mk   | 32 ++++++++++++++++++++++++++++++++
 5 files changed, 50 insertions(+)
 create mode 100644 package/lmdb/Config.in
 create mode 100644 package/lmdb/lmdb.hash
 create mode 100644 package/lmdb/lmdb.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f6fc30137..cae94eef8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1127,6 +1127,7 @@ F:	package/libwpe/
 F:	package/linenoise/
 F:	package/ljlinenoise/
 F:	package/lua-inotify/
+F:	package/lmdb/
 F:	package/lpeg/
 F:	package/lpty/
 F:	package/lrandom/
diff --git a/package/Config.in b/package/Config.in
index 33039331f..d8862c4cc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1587,6 +1587,7 @@ menu "Database"
 	source "package/libodb-mysql/Config.in"
 	source "package/libodb-pgsql/Config.in"
 	source "package/libpqxx/Config.in"
+	source "package/lmdb/Config.in"
 	source "package/mariadb/Config.in"
 	source "package/mongodb/Config.in"
 	source "package/postgresql/Config.in"
diff --git a/package/lmdb/Config.in b/package/lmdb/Config.in
new file mode 100644
index 000000000..f4ae9f310
--- /dev/null
+++ b/package/lmdb/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LMDB
+	bool "lmdb"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  OpenLDAP Lightning Memory-Mapped Database
+
+	  LMDB is compact, fast, powerful, and robust and implements
+	  a simplified variant of the BerkeleyDB (BDB) API.
+
+	  https://symas.com/lmdb/
+
+comment "lmdb needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/lmdb/lmdb.hash b/package/lmdb/lmdb.hash
new file mode 100644
index 000000000..d72c66aac
--- /dev/null
+++ b/package/lmdb/lmdb.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  dd70a8c67807b3b8532b3e987b0a4e998962ecc28643e1af5ec77696b081c9b0  lmdb-0.9.31.tar.gz
+sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  libraries/liblmdb/LICENSE
diff --git a/package/lmdb/lmdb.mk b/package/lmdb/lmdb.mk
new file mode 100644
index 000000000..dafe7332c
--- /dev/null
+++ b/package/lmdb/lmdb.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# lmdb
+#
+################################################################################
+
+LMDB_VERSION = 0.9.31
+LMDB_SITE = $(call github,LMDB,lmdb,LMDB_$(LMDB_VERSION))
+LMDB_LICENSE = OLDAP-2.8
+LMDB_LICENSE_FILES = libraries/liblmdb/LICENSE
+LMDB_INSTALL_STAGING = YES
+
+define LMDB_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/libraries/liblmdb \
+		XCFLAGS="$(TARGET_CFLAGS)"
+endef
+
+define LMDB_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libraries/liblmdb \
+		DESTDIR="$(STAGING_DIR)" \
+		prefix=/usr \
+		install
+endef
+
+define LMDB_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libraries/liblmdb \
+		DESTDIR="$(TARGET_DIR)" \
+		prefix=/usr \
+		install
+endef
+
+$(eval $(generic-package))
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
