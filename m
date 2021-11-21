Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1491C433F5
	for <buildroot@archiver.kernel.org>; Sun, 21 Nov 2021 09:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D8D460710;
	Sun, 21 Nov 2021 09:38:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5PgsM--dmZdV; Sun, 21 Nov 2021 09:38:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4812460785;
	Sun, 21 Nov 2021 09:38:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8090D1BF2EB
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 09:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D00E402A1
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 09:38:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PHmQXj4mwnw0 for <buildroot@lists.busybox.net>;
 Sun, 21 Nov 2021 09:38:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 353C84024A
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 09:38:13 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id d24so26809769wra.0
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 01:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sJRO1YwpHsRQOSmZgM5AAv7zxKWu8UBPixXDoqyBT9s=;
 b=kbb3ykbKMB0Sdt/jIbYkZcHNP4XAPJL9LutwRMSviebL5IzqQ9lwUeDNfyexDhg8Su
 CBrknI2O0ZV+yHHOUMqGX8oehtIt3lTpeFg77+00xXu4VwWngeHnmoUfpBV1tZuL6NQk
 Iiey9jFSwjPsku+mdDXjKNwFcZZ/W7yhDjmxXtbhASilDV/FPzJOEBIX6HESXL9P3KwD
 xG1NWzIPoeADg8UqMVqn9xO1QiUMljU2Hhm1bOsCgsyGbU++AecbobpJGBXpKYUIJcL0
 ITFVgy4lopU8+cZIY5ONINsjWLa7bVVxLKfdD/3rGuQwbv1i9AurhuE/yD++Ff5Xgp5r
 i4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sJRO1YwpHsRQOSmZgM5AAv7zxKWu8UBPixXDoqyBT9s=;
 b=W6Kn9dghCda3J5R1c3Zc99t/2HTn9n0SML+Cmf34AHKl7pHdbp3hzjIigQ67Fs8HRl
 4jbXnkp6J1kGtEtD0QL0T6X8yOC5EgmrjewqdHIrQb0ZxYhSesqDTX4qxmmU6GwiUAzv
 y5bfNq5raNOHQXoMpImLvE+zKr2Q42ZfxP5B04TgqsfMT7slLgEo+4RcK3qlAi29GRrz
 dlbl+ltkAJ0PF1hlfGOQVdqnyagDvJWAKq2/rassnyiM9tEXtODStT1zAx+mxmGp30oO
 zcFsiYjsQHexUZeJNRzhRdqbTVWNPS9hnAM2/HxzHjOsckLkktVkBXXSPCjE9azm1U8h
 GRIw==
X-Gm-Message-State: AOAM531OqQEU3bZZrbX8taAaIwwStaYg5K1zh2qwP+fZsrbJs6RQ/snx
 z+z0j6gQ3SJyD/prcKSS756Og2I0vp0=
X-Google-Smtp-Source: ABdhPJzB63bGGYAwpfpyE9QuqZsTHkfNgUIBHmHxAAGy28yNOFsSpVFU/ZOBV8JDkZeF/MvCuDKTew==
X-Received: by 2002:a5d:6351:: with SMTP id b17mr25386054wrw.151.1637487491097; 
 Sun, 21 Nov 2021 01:38:11 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id f7sm22294518wmg.6.2021.11.21.01.38.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Nov 2021 01:38:10 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 21 Nov 2021 10:35:48 +0100
Message-Id: <20211121093548.3425517-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libgee: fix introspection build
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

Fix the following build failure raised since the addition of
introspection in commit 3915e17e7734ee3abe088d4ce1893eecd7cc4663:

/home/giuliobenetti/autobuild/run/instance-1/output-1/host/bin/../riscv32-buildroot-linux-gnu/sysroot/usr/bin/g-ir-compiler -l `/usr/bin/sed -nE "s/^dlname='([A-Za-z0-9.+-]+)'/\1/p" libgee-0.8.la` -o Gee-0.8.typelib Gee-0.8.gir libgee-0.8.la
Could not find GIR file 'GObject-2.0.gir'; check XDG_DATA_DIRS or use --includedir
error parsing file Gee-0.8.gir: Failed to parse included gir GObject-2.0

Fixes:
 - http://autobuild.buildroot.org/results/884faa0f84c8dc43ed1ca6cde9caf21c731a4b35

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...le.am-include-Makefile.introspection.patch | 40 +++++++++++++++++++
 package/libgee/libgee.mk                      |  2 +
 2 files changed, 42 insertions(+)
 create mode 100644 package/libgee/0001-gee-Makefile.am-include-Makefile.introspection.patch

diff --git a/package/libgee/0001-gee-Makefile.am-include-Makefile.introspection.patch b/package/libgee/0001-gee-Makefile.am-include-Makefile.introspection.patch
new file mode 100644
index 0000000000..0906275ae3
--- /dev/null
+++ b/package/libgee/0001-gee-Makefile.am-include-Makefile.introspection.patch
@@ -0,0 +1,40 @@
+From d771e8ddb5e40f234459966e46880d10f34aaa1a Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 20 Nov 2021 23:57:33 +0100
+Subject: [PATCH] gee/Makefile.am: include Makefile.introspection
+
+Include Makefile.introspection instead of using a custom rule which will
+result in the following build failure when cross-compiling on buildroot
+because of missing --includedir:
+
+/home/giuliobenetti/autobuild/run/instance-1/output-1/host/bin/../riscv32-buildroot-linux-gnu/sysroot/usr/bin/g-ir-compiler -l `/usr/bin/sed -nE "s/^dlname='([A-Za-z0-9.+-]+)'/\1/p" libgee-0.8.la` -o Gee-0.8.typelib Gee-0.8.gir libgee-0.8.la
+Could not find GIR file 'GObject-2.0.gir'; check XDG_DATA_DIRS or use --includedir
+error parsing file Gee-0.8.gir: Failed to parse included gir GObject-2.0
+
+Fixes:
+ - http://autobuild.buildroot.org/results/884faa0f84c8dc43ed1ca6cde9caf21c731a4b35
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.gnome.org/GNOME/libgee/-/merge_requests/8]
+---
+ gee/Makefile.am | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/gee/Makefile.am b/gee/Makefile.am
+index 5634bcb..e0d950e 100644
+--- a/gee/Makefile.am
++++ b/gee/Makefile.am
+@@ -167,7 +167,8 @@ INTROSPECTION_COMPILER_ARGS= \
+ 	-l $(libgee_dlname)
+ Gee-0.8.gir: libgee_0_8_la_vala.stamp
+ Gee-0.8.typelib: Gee-0.8.gir libgee-0.8.la
+-	@INTROSPECTION_COMPILER@ $(INTROSPECTION_COMPILER_ARGS) -o $@ $^
++
++-include $(INTROSPECTION_MAKEFILE)
+ endif
+ 
+ MOSTLYCLEANFILES = \
+-- 
+2.33.0
+
diff --git a/package/libgee/libgee.mk b/package/libgee/libgee.mk
index 48bc9c9e41..0a05a63635 100644
--- a/package/libgee/libgee.mk
+++ b/package/libgee/libgee.mk
@@ -12,6 +12,8 @@ LIBGEE_DEPENDENCIES = host-pkgconf host-vala libglib2
 LIBGEE_INSTALL_STAGING = YES
 LIBGEE_LICENSE = LGPL-2.1+
 LIBGEE_LICENSE_FILES = COPYING
+# We're patching gee/Makefile.am
+LIBGEE_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 LIBGEE_CONF_OPTS += --enable-introspection
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
