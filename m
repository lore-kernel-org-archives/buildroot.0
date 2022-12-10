Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A63C10F1B
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 22:06:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 097AA81468;
	Sat, 10 Dec 2022 22:06:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 097AA81468
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fxL0emakGnNn; Sat, 10 Dec 2022 22:06:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17ED981489;
	Sat, 10 Dec 2022 22:05:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17ED981489
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C04341BF575
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 22:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6E6B40915
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 22:05:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6E6B40915
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0PbE3iUKxHoG for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 22:05:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1478840914
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1478840914
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 22:05:56 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 h8-20020a1c2108000000b003d1efd60b65so2296891wmh.0
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 14:05:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rPTlYac43SLHYcRcqH28b0iWf0aDRQI7v76jWtUK2og=;
 b=BrrK19Wr511Fl085i2lja32yl1XzBxthT7a1lSjJu0BV5eZn4ogczacqVMj4TA6G8b
 WnmG3oSjIOdAgEW2E5JKZ6klcHBeNxA/C5Lyuy0HLaGafmYjgjOnWHx/ckR9lNeTHj9s
 FNGWY9W7RWd2Y7wb9g032ojACP6DoErt7NM1wzLGWAbPNejN6/fXUxEauUmAezL/Mq0O
 4bEvDPAHqvEI+TfHVgLFtKXXsY/dLeCLnMw5fkxajv/qBSvVz4g8z6S08StKRlcAg3Kj
 a4InNskmk+oG5EtYn9l2m4wNDxEbecpAz56zirY3L6uJ52z+gOMQZmIXMimeHRs4Vh5Z
 bZ5Q==
X-Gm-Message-State: ANoB5pn8ffXd9RXjcArQCcThE7PFnZ2weUHE5Y3Hjnz453LLLrT4fs02
 ShvJblsrJFL0eIxZErqYi/zd+M7TEOw=
X-Google-Smtp-Source: AA0mqf6wkVK1k184W6aJ2nYDSYnImkncNeffjLHu2rIjf3qpJDxocCJPg63Ts0aydwBS0wKKwC/s9Q==
X-Received: by 2002:a1c:7c18:0:b0:3cf:a6d9:7b3c with SMTP id
 x24-20020a1c7c18000000b003cfa6d97b3cmr8200472wmc.21.1670709953719; 
 Sat, 10 Dec 2022 14:05:53 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 n184-20020a1ca4c1000000b003cfa622a18asm4052539wme.3.2022.12.10.14.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 14:05:53 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 23:05:50 +0100
Message-Id: <20221210220550.84041-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rPTlYac43SLHYcRcqH28b0iWf0aDRQI7v76jWtUK2og=;
 b=TkW7PvQAjuLfdEuiBUAuEcEnxU+WgOaCJE5n4vnkhd/NNQNPkkWbcq1E2wENSz5V5a
 d3i1pEj+5GoFLHDLuUMWLL9Jd+AqAlu7XxncZLqjUfCS3WNZlwb+tqkLumRVYphsQRcV
 hvj34zyOZ8JgnYvNfJ4tQSOeLLELdtD7NAGM1odMlTqQCDH3TUnswYKILlixJvZfD/C3
 kBH7AK3XTeIhUlzvU5/04rpDA5T6jJZzbFHQh7qQzwr97tXUEH+s42pSMBkF7qDNmR58
 rx5EpLA3tDrftG/mbrtH2YLjaFvxTJ19hPUbaHefFTY7MCQ5tuObIJFnjQRvQJfz/Pqb
 ogcA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=TkW7PvQA
Subject: [Buildroot] [PATCH 1/1] package/ulogd: bump to version 2.0.8
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
- Update configure options due to
  https://git.netfilter.org/ulogd2/commit/?id=794f0385ab60fd8c52ff3ce498c8aac78b58ac20

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-ulogd-fix-build-with-musl-libc.patch | 32 -------------------
 package/ulogd/ulogd.hash                      |  6 ++--
 package/ulogd/ulogd.mk                        | 26 +++++++--------
 3 files changed, 15 insertions(+), 49 deletions(-)
 delete mode 100644 package/ulogd/0001-ulogd-fix-build-with-musl-libc.patch

diff --git a/package/ulogd/0001-ulogd-fix-build-with-musl-libc.patch b/package/ulogd/0001-ulogd-fix-build-with-musl-libc.patch
deleted file mode 100644
index af6e13648c..0000000000
--- a/package/ulogd/0001-ulogd-fix-build-with-musl-libc.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 675e762091380590f78ff07a94a25caa459b786b Mon Sep 17 00:00:00 2001
-From: Cameron Norman <camerontnorman@gmail.com>
-Date: Sat, 27 Oct 2018 13:05:45 -0700
-Subject: ulogd: fix build with musl libc
-
-The attached patch fixes building ulogd2 with musl libc. It is being
-used on Void Linux right now.
-
-Closes: https://bugzilla.netfilter.org/show_bug.cgi?id=1278
-Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrrieved from:
-https://git.netfilter.org/ulogd2/commit/?id=675e762091380590f78ff07a94a25caa459b786b]
----
- src/ulogd.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/ulogd.c b/src/ulogd.c
-index b8bc57c..9cd64e8 100644
---- a/src/ulogd.c
-+++ b/src/ulogd.c
-@@ -65,6 +65,7 @@
- #include <sys/time.h>
- #include <sys/stat.h>
- #include <sched.h>
-+#include <limits.h>
- #include <ulogd/conffile.h>
- #include <ulogd/ulogd.h>
- #ifdef DEBUG
--- 
-cgit v1.2.1
-
diff --git a/package/ulogd/ulogd.hash b/package/ulogd/ulogd.hash
index 0e07a714ee..35b518b9ce 100644
--- a/package/ulogd/ulogd.hash
+++ b/package/ulogd/ulogd.hash
@@ -1,7 +1,5 @@
-# From ftp://ftp.netfilter.org/pub/ulogd/ulogd-2.0.7.tar.bz2.{md5sum,sha1sum}
-md5  2bb2868cf51acbb90c35763c9f995f31  ulogd-2.0.7.tar.bz2
-sha1  f2d90469e2842e2bfbe19c55cf6d56ac107aa4b9  ulogd-2.0.7.tar.bz2
+# From ftp://ftp.netfilter.org/pub/ulogd/ulogd-2.0.8.tar.bz2.sha256sum
+sha256  4ead6c3970c3f57fa1e89fe2d7cc483ba6fe2bd1b08701521e0b3afd667df291  ulogd-2.0.8.tar.bz2
 
 # Locally calculated
-sha256  990a05494d9c16029ba0a83f3b7294fc05c756546b8d60d1c1572dc25249a92b  ulogd-2.0.7.tar.bz2
 sha256  b8a2f73f743dc1a51aff23f1aacbca4b868564db52496fa3c0caba755bfd1eaf  COPYING
diff --git a/package/ulogd/ulogd.mk b/package/ulogd/ulogd.mk
index c00a53f3d5..65280a2ba6 100644
--- a/package/ulogd/ulogd.mk
+++ b/package/ulogd/ulogd.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-ULOGD_VERSION = 2.0.7
+ULOGD_VERSION = 2.0.8
 ULOGD_SOURCE = ulogd-$(ULOGD_VERSION).tar.bz2
 ULOGD_SITE = http://www.netfilter.org/projects/ulogd/files
-ULOGD_CONF_OPTS = --without-dbi
+ULOGD_CONF_OPTS = --disable-dbi
 ULOGD_DEPENDENCIES = host-pkgconf \
 	libmnl libnetfilter_acct libnetfilter_conntrack libnetfilter_log \
 	libnfnetlink
@@ -18,39 +18,39 @@ ULOGD_SELINUX_MODULES = ulogd
 # DB backends need threads
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 ifeq ($(BR2_PACKAGE_MYSQL),y)
-ULOGD_CONF_OPTS += --with-mysql=$(STAGING_DIR)/usr
+ULOGD_CONF_OPTS += --enable-mysql
 ULOGD_DEPENDENCIES += mysql
 else
-ULOGD_CONF_OPTS += --without-mysql
+ULOGD_CONF_OPTS += --disable-mysql
 endif
 ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
-ULOGD_CONF_OPTS += --with-pgsql
+ULOGD_CONF_OPTS += --enable-pgsql
 ULOGD_DEPENDENCIES += postgresql
 else
-ULOGD_CONF_OPTS += --without-pgsql
+ULOGD_CONF_OPTS += --disable-pgsql
 endif
 ifeq ($(BR2_PACKAGE_SQLITE),y)
-ULOGD_CONF_OPTS += --with-sqlite
+ULOGD_CONF_OPTS += --enable-sqlite3
 ULOGD_DEPENDENCIES += sqlite
 else
-ULOGD_CONF_OPTS += --without-sqlite
+ULOGD_CONF_OPTS += --disable-sqlite3
 endif
 else
-ULOGD_CONF_OPTS += --without-mysql --without-pgsql --without-sqlite
+ULOGD_CONF_OPTS += --disable-mysql --disable-pgsql --disable-sqlite3
 endif
 
 ifeq ($(BR2_PACKAGE_LIBPCAP),y)
-ULOGD_CONF_OPTS += --with-pcap
+ULOGD_CONF_OPTS += --enable-pcap
 ULOGD_DEPENDENCIES += libpcap
 else
-ULOGD_CONF_OPTS += --without-pcap
+ULOGD_CONF_OPTS += --disable-pcap
 endif
 
 ifeq ($(BR2_PACKAGE_JANSSON),y)
-ULOGD_CONF_OPTS += --with-jansson
+ULOGD_CONF_OPTS += --enable-json
 ULOGD_DEPENDENCIES += jansson
 else
-ULOGD_CONF_OPTS += --without-jansson
+ULOGD_CONF_OPTS += --disable-json
 endif
 
 $(eval $(autotools-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
