Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD1EC41513
	for <buildroot@archiver.kernel.org>; Thu, 17 Aug 2023 19:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20185607F7;
	Thu, 17 Aug 2023 19:11:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20185607F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KJ7GyTNI3M_P; Thu, 17 Aug 2023 19:11:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B27360A65;
	Thu, 17 Aug 2023 19:11:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B27360A65
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3B13C1BF37F
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 19:11:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1418C403B3
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 19:11:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1418C403B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I8jXp-h7iEQN for <buildroot@lists.busybox.net>;
 Thu, 17 Aug 2023 19:11:34 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B15444037E
 for <buildroot@buildroot.org>; Thu, 17 Aug 2023 19:11:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B15444037E
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3fe1e1142caso2018665e9.0
 for <buildroot@buildroot.org>; Thu, 17 Aug 2023 12:11:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692299492; x=1692904292;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m44ENy3+j4uc99CrvHW5L8SKfsCHALwRlfJL58jYW64=;
 b=MvvpZ8YRcyGzUo/+dlxklZWi33kzoQ4hSrrw5eRjU59BmhcqNxBgv7gH+zKmfw/mOY
 1gOqSk5tW7N/ovBT6IHYM2q7hRAji3i43uBgVvw0ZSoFvA+fU6L0tmUE5cI592YL9/A+
 +J20OeTC+Y5WPm7V3NvP+uDnsXOhe5KVlq3Ehh19chKTIF3HT3/4eekZFFrt2mgZe8NW
 JM5qgRxokOWQ/tIuUC7UbBOx/Zjv/2tjiAsIbzxQjIAcPV43LziZ2uTt+xbuX0dHXe96
 v3IKA3Sh0xNHkUlhbEGnPJfCvLmFiYXyuRTAJJR6/N+rwXagyicUENP5DC1aejr0ZACt
 ryKw==
X-Gm-Message-State: AOJu0Yx4tk30pK0r2Qf3g1/3DO+waOmOgkXr15FSRrd9QpCBnyGzJha8
 PTSYJWUWnw1wpfGKaz4vyXGoC65TgvY=
X-Google-Smtp-Source: AGHT+IEKbCAccSenHqgOGvHr6MiDb0zO6PdZo8wjtXq6CnAgn8u9WTcxXIhs22sq5t8IkovUfSH0DQ==
X-Received: by 2002:a05:600c:b4b:b0:3fe:1871:1826 with SMTP id
 k11-20020a05600c0b4b00b003fe18711826mr480767wmr.27.1692299491616; 
 Thu, 17 Aug 2023 12:11:31 -0700 (PDT)
Received: from localhost.localdomain ([2a01:cb19:8b44:b00:1576:5fbf:4d05:9159])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a5d4b02000000b0031aca6cc69csm156073wrq.2.2023.08.17.12.11.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 12:11:30 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 17 Aug 2023 21:11:30 +0200
Message-Id: <20230817191130.1022405-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692299492; x=1692904292;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=m44ENy3+j4uc99CrvHW5L8SKfsCHALwRlfJL58jYW64=;
 b=Li5xIYz+icX8xqD4TfNzf2ufSottqPNuDjHepKdhesmGyVsrpZa5QuWFBEcta6aFNS
 g8+XV98uq1x7GBTPpOLXjbVxbg7S1gJkRzqNdR+rEJR93GJOknHzct+Zpzo1HuZsj3wg
 SI0ds8/1H54hr6utgaKN32m+OEjJJzAfj0/EYITAYTFMkvmcnCAmxpEg2dYO7kpkDXXj
 o3e9iyOiXZBtBte0XOYYreynGz5DeBjZbNny0vwqwrODPpPVwxSCEU7wA+3qL/xQ1kap
 5dDhQ9AbljDzjJXDPgwWOmFNf7xa7pV7tPYxkOkqBwIFWxS7Pzt7hUCxjaqrNcm+5IYG
 WzHw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Li5xIYz+
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

Note: a git bisect of the issue turns up 72 candidates for the breakage,
all around the time we dropped python2 support in early 2022; the last
known-good commit is 55df30f8b1fb (package/zfs: drop python2 support)
and the first known-bad commit is 697acda00d9f (package/pkg-python: drop
python2 host/setuptools support); everything in-between does not
configure (package/python/Config.in.host still sourced but already
removed), or does not build (host-python still in the dependency chain
but already removed), so had to be skipped during the bisect.

[0] This can happen when another python package using setuptools is
    built before nftables. However, with PPD, this never happens because
    host-python-setuptools is never in the dependency chain of nftables.

Reported-by: Julien Olivain <ju.o@free.fr>
Tested-by: Julien Olivain <ju.o@free.fr>
Suggested-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Adam Duskett <aduskett@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

---
Given the bisection result, it means that all the currently maintained
branches are affected by the issue.
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
