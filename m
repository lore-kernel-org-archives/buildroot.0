Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF00C04A6A
	for <buildroot@archiver.kernel.org>; Wed, 16 Aug 2023 18:09:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D95FC41704;
	Wed, 16 Aug 2023 18:09:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D95FC41704
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gpeqNAGEBPGm; Wed, 16 Aug 2023 18:09:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9AEB4170A;
	Wed, 16 Aug 2023 18:09:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9AEB4170A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D3A8E1BF38A
 for <buildroot@lists.busybox.net>; Wed, 16 Aug 2023 18:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B55D9613B9
 for <buildroot@lists.busybox.net>; Wed, 16 Aug 2023 18:09:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B55D9613B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IKSRvhKgp7kE for <buildroot@lists.busybox.net>;
 Wed, 16 Aug 2023 18:09:20 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6F0B4613B7
 for <buildroot@buildroot.org>; Wed, 16 Aug 2023 18:09:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F0B4613B7
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3fe490c05c9so849405e9.0
 for <buildroot@buildroot.org>; Wed, 16 Aug 2023 11:09:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692209358; x=1692814158;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C4I/eTgJeHDcxqa/cd63OSelD7IU2Z0wuqA64OBFJD4=;
 b=XA0vPxPQdm06S5djrvYY9E9X/KdfT99h3Lacopwc1P1+bPckmEGSF72i8mOwDrill/
 wsLn2r+3Ev4KNEhF2n8Q7ZIaACY0yiZFBWruO9jOIGzkTXPTc23dLtPSQFQ/NrIf+Cdq
 UQG2BVDT/Xxe3fPkRlfToa0cw2z3YTRTDSS1w5jEvv21lom/+08kQkNjAi28iyTrYmc2
 EdU73m6o22PoRHe11stv5VmfdTq+sce8ixKcGcxxSSQOElLqJP34QisTjcnK6Lj7aw5s
 OXMlL7pqZTcOsNfGqLZYGj0IMv7CIBIuGhfOMWgOtu4XLgEhM2UE53z+4ksaX7/mUrR9
 snqg==
X-Gm-Message-State: AOJu0YzNuFFr/0f/KWHJ72qDWxyWqdLCqd0mMut791XubAZk/UCwDVka
 v/ScHuEV6iAZSO619XookpYjrBfpZTw=
X-Google-Smtp-Source: AGHT+IHSZgdGY40miJewHtVWjdnkEG493AaB3lKXUCmk1m1V7e4/ZzCdF3Y2riFAct18WWcaaG30yw==
X-Received: by 2002:a05:600c:4f45:b0:3fb:e1d0:6417 with SMTP id
 m5-20020a05600c4f4500b003fbe1d06417mr305935wmq.19.1692209358104; 
 Wed, 16 Aug 2023 11:09:18 -0700 (PDT)
Received: from localhost.localdomain ([2a01:cb19:8b44:b00:1e73:3be7:eb1a:9d05])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a05600c044e00b003fe1a092925sm143058wmb.19.2023.08.16.11.09.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 11:09:17 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 16 Aug 2023 20:09:16 +0200
Message-Id: <20230816180916.2608831-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692209358; x=1692814158;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=C4I/eTgJeHDcxqa/cd63OSelD7IU2Z0wuqA64OBFJD4=;
 b=G3ljiLvBnmVcD6mnnVNu1rd8f8+MF7xcxrbQuDDXikFs9bwcVk7I6dJ+HjJplLgZVB
 LMGxyL3C7wS35cHqP6fuNaWG+vLypI8MxZMCIHM4ClPfY9toaM3nFJps+CPNt3hCfo3A
 GjIoa9uE7v8AFBEWoyCUIDqVq8mBLBlhlUqJ6/CylpTM5LoFgDc6YLaBnW+9SU3B238V
 KLkFkwKrtr686aF7HH9F31DYnBJU9Xs+nZeUM4FBasyx6v2TObKgEPQMOx9SiK4SoyoI
 5XvUtBFUiC6HYnSjbE3S5Mhg6bnMnOnCLj49Xsr4MoRntIiveSL8kqCIVlnCDNWNT8ZP
 PV0A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=G3ljiLvB
Subject: [Buildroot] [PATCH] package/nftables: fix the build of the pyhon
 bindings
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

nftables provides python bindings; it uses setuptools to install them.
We currently install those bindings by telling nftables buildsystem,
autotools, to install the python bindings.

However, we do not pass any of the environment variables that are needed
for setuptools packages. When host-python-setuptools is installed before
nftables is built [0], this breaks the system at runtime, as the
bindings are not installed; only the egg is, resulting in runtime errors
like:

    # python -c 'import nftables'
    Traceback (most recent call last):
      File "<string>", line 1, in <module>
    ModuleNotFoundError: No module named 'nftables'

Upstream has been doing some changes on their python handling, but it is
not in a released version, and we can't backport those changes either,
due to other big changes.

Instead, we split the pyhon bindings to their own package.

For legacy hadnling, we make that package default to y, so that existing
(def)config still work. The only novelty is that it can be disabled now.

Many thanks to Julien for testing and finding the offending dependency,
to James for suggesting the package split, and to Adam for, well,
trigerring the issue in the first place! ;-p

[0] This can happen when another python package using setuptools is
    built before nftables. However, with PPD, this never happens because
    host-python-setuptools is never in the dependency chain of nftables.

Reported-by: Julien Olivain <ju.o@free.fr>
Suggested-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Adam Duskett <aduskett@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nftables/Config.in                    |  5 +++++
 package/nftables/nftables-python/Config.in    |  4 ++++
 .../nftables-python/nftables-python.hash      |  1 +
 .../nftables-python/nftables-python.mk        | 22 +++++++++++++++++++
 package/nftables/nftables.mk                  | 10 +++------
 5 files changed, 35 insertions(+), 7 deletions(-)
 create mode 100644 package/nftables/nftables-python/Config.in
 create mode 120000 package/nftables/nftables-python/nftables-python.hash
 create mode 100644 package/nftables/nftables-python/nftables-python.mk

diff --git a/package/nftables/Config.in b/package/nftables/Config.in
index 8d172b7256..833a3a38a2 100644
--- a/package/nftables/Config.in
+++ b/package/nftables/Config.in
@@ -13,5 +13,10 @@ config BR2_PACKAGE_NFTABLES
 
 	  http://www.netfilter.org/projects/nftables/index.html
 
+# Legacy: this used to be handled in nftables.mk
+if BR2_PACKAGE_NFTABLES
+source "package/nftables/nftables-python/Config.in"
+endif
+
 comment "nftables needs a toolchain w/ wchar, headers >= 3.12"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
diff --git a/package/nftables/nftables-python/Config.in b/package/nftables/nftables-python/Config.in
new file mode 100644
index 0000000000..b16e2d0ad1
--- /dev/null
+++ b/package/nftables/nftables-python/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_NFTABLES_PYTHON
+	bool "python bindings"
+	default y # legacy
+	depends on BR2_PACKAGE_PYTHON3
diff --git a/package/nftables/nftables-python/nftables-python.hash b/package/nftables/nftables-python/nftables-python.hash
new file mode 120000
index 0000000000..9ac74580e7
--- /dev/null
+++ b/package/nftables/nftables-python/nftables-python.hash
@@ -0,0 +1 @@
+../nftables.hash
\ No newline at end of file
diff --git a/package/nftables/nftables-python/nftables-python.mk b/package/nftables/nftables-python/nftables-python.mk
new file mode 100644
index 0000000000..908bacd99a
--- /dev/null
+++ b/package/nftables/nftables-python/nftables-python.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# nftables-python
+#
+################################################################################
+
+# The following assignments work only because nftables.mk is included before
+# this file is.
+NFTABLES_PYTHON_VERSION = $(NFTABLES_VERSION)
+NFTABLES_PYTHON_SOURCE = $(NFTABLES_SOURCE)
+NFTABLES_PYTHON_SITE = $(NFTABLES_SITE)
+NFTABLES_PYTHON_LICENSE = $(NFTABLES_LICENSE)
+NFTABLES_PYTHON_LICENSE_FILES = $(NFTABLES_LICENSE_FILES)
+
+# We share the same source code as nftables
+NFTABLES_PYTHON_DL_SUBDIR = nftables
+
+NFTABLES_PYTHON_SUBDIR = py
+
+NFTABLES_PYTHON_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index b0a14bd429..aa88203ab5 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -42,13 +42,6 @@ else
 NFTABLES_CONF_OPTS += --without-json
 endif
 
-ifeq ($(BR2_PACKAGE_PYTHON3),y)
-NFTABLES_CONF_OPTS += --enable-python
-NFTABLES_DEPENDENCIES += python3
-else
-NFTABLES_CONF_OPTS += --disable-python
-endif
-
 NFTABLES_CONF_ENV = LIBS="$(NFTABLES_LIBS)"
 
 define NFTABLES_LINUX_CONFIG_FIXUPS
@@ -58,3 +51,6 @@ define NFTABLES_LINUX_CONFIG_FIXUPS
 endef
 
 $(eval $(autotools-package))
+
+# Legacy: we used to handle it in this .mk
+include package/nftables/nftables-python/nftables-python.mk
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
