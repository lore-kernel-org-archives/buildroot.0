Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E6BC433F5
	for <buildroot@archiver.kernel.org>; Fri, 11 Mar 2022 06:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02089418A0;
	Fri, 11 Mar 2022 06:50:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CRTq-oSzq_Hx; Fri, 11 Mar 2022 06:50:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04B8A41889;
	Fri, 11 Mar 2022 06:50:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DA7D21BF3ED
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 06:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C94AB41889
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 06:50:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ybht__X1Ox7S for <buildroot@lists.busybox.net>;
 Fri, 11 Mar 2022 06:50:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1567741888
 for <buildroot@buildroot.org>; Fri, 11 Mar 2022 06:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1646981443;
 bh=mh1KI62/wXX+AF83lFf50D/bs9wJWrYweziLCOJPlY4=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=W3hORL9tsLWPBlUtEGhEJAgAgytM5UJDJgDHUQFWaqdlXxNmMk6Re38dkYJ6RX1Wp
 X0iDgytigHaxw5Zc/Gi+wUddhh/p1TLgbtPX94+QRhYOFIxaGHrqGPdLXRF27SExDf
 RmPRi50AKlWNr+ly6BwijBPoGpiJYYgMG/U7GdoU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.204]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MuDc7-1oILJm0YPt-00uZIN for <buildroot@buildroot.org>; Fri, 11 Mar 2022
 07:50:43 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri, 11 Mar 2022 07:50:42 +0100
Message-Id: <20220311065042.8687-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:Sg0Q82J84pNs+nLpShfe81dJaXSKzjVQVDZtlXOaXXfirUO5/+2
 4jlvT+kaSOEpgoWZMyaz5jaU/BdZ+hCOYVaXUCWpb0IGFupMhP9tM2eE2VXIy2slygs4F1u
 7xfmwQXQ8NFIBFIZyxfB6XwJNAZbb+XJTlsTHCtlLJTCSsW6H4mDxO46F3/uPJdsWn7D4CG
 orVSKoa0DO8EAqfomtOyQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JKQI8WxLOYw=:uvdRAwz8o3hRPmfhH0tmAn
 PRsYmmZofoUVoxIdHUnzTANwuUW8AbrQDRRmtNrf1c0DjIhy8ywKbS2b/FigygYovNKQeoxLM
 C+IrL2bKldCe59luO1lr0a3XqN8yeTW+1cxiUop8jlFOooJ0g5+S1BLi84zHjahkggbWU2n1G
 Xz6je6VnBlwYzpZDHIvQlYmlQYSBACuBn9pg+rZFLdOjskt6p07kHi3UClL05RnxpvaIvBXH/
 UEc0isw3/A0zMAKVMX8724qE2DK+yeixZzUE1bdA8jv4JPJ+AEjvGz4YIgrQNnFUiqGJh7Hdd
 1aFclig+4yd21YQ8vaNYSTCz40Ja2rf2lDRnzeuoqOLkPkmp8kMJ0ZrRS9W1rgtWD2x3QbfUC
 MXuYAz1BBUl/o5X30NjVuT4z6Kh3XznoZcEwnvyzgYTL5z1WPJ8yAYaNzYr4pERv5ZTqbclLG
 jwt02UC+Kqya2D7NRVpoFuteI5/UCZY790+vBZnAmmyLMDt2GJT0BgwPgpca83q3Ri2D7GTZD
 R4vY2N/tZQRK0rfuU+gAqnGhbAF9quZQ2Ji9lekTUAuZM5/DAUc1LRJXAE68q+GyEgbU0Himq
 hSE23117AphC8mAOIj/W9lmXP19rt5JmvwObrgoBqzfux9nozZWuEM1hPlULxY50+Hsl6iMNJ
 TceMhS33Cc/77TJtm6eqFzSUAv++20+o6iRT/VEe/WHUAmabCuur4IXeSR0lCtxIDXoB9TpQA
 Au1trtlSYJilrfV9kb7BYgvxWfmeBL1HXWsfEZI4qbljcZTAQUev5W9km6buLqIvDtjfu5Y5g
 0Ibqzhw5ExotqRSp3c9Ds23va94fCSTzLvfrC8EcHmEHTkoxqkcrLaP2eh4gut2PiDpEc6/Ib
 L8SmAssybkcmaBAsGSoQJHe623vdyHZmUWooBp1xEKp79zsBT9HfB8GH03ibnqqC0LdcF+sDf
 0sr1dvJwtE6sN70Lqq7QZxNEPm1G6SolBwPKdeOp9Sjl/d1YYQureTNgnDDPN19Nj+tndsv45
 CEnjVs7ZRJH+OQ0N2h2zG54PmqTrp+F8XaIrcVyembXE70dJZZC1eJG8M27RaB+pNDOvUOOX1
 XRlbHItYOtdESo=
Subject: [Buildroot] [PATCH v1] package/wget: bump version to 1.21.3
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

- explicit set some default options (--without-metalink, --enable-opie,
  --enable-digest, --enable-ntlm, --disable-debug, --disable-valgrind-tests,
  --disable-assert)

- add optional libpsl dependency

- remove legacy --with-libidn option (see [1]), replace with
  new --enable-iri option in case libiconv and libidn2 are available

- use explicit --with-libuuid option

- add optional c-ares dependency

For details see [2].

[1] https://git.savannah.gnu.org/cgit/wget.git/commit/configure.ac?id=a24e67e239ef949cc77a4c4e5a0beb703026a296
[2] https://lists.gnu.org/archive/html/info-gnu/2022-02/msg00017.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/wget/wget.hash |  4 ++--
 package/wget/wget.mk   | 40 +++++++++++++++++++++++++++++++---------
 2 files changed, 33 insertions(+), 11 deletions(-)

diff --git a/package/wget/wget.hash b/package/wget/wget.hash
index 7f89bedb88..22674650a2 100644
--- a/package/wget/wget.hash
+++ b/package/wget/wget.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/wget/wget-1.21.2.tar.lz.sig
+# https://ftp.gnu.org/gnu/wget/wget-1.21.3.tar.lz.sig
 # with key 6B98F637D879C5236E277C5C64FF90AAE8C70AF9
-sha256  1727a330a86acacb3e57615ce268f5f29978bf7adec4abe6a30d370207bc91b3  wget-1.21.2.tar.lz
+sha256  dbd2fb5e47149d4752d0eaa0dac68cc49cf20d46df4f8e326ffc8f18b2af4ea5  wget-1.21.3.tar.lz
 # Locally calculated
 sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  COPYING
diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index f30fa39917..026c6c375d 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WGET_VERSION = 1.21.2
+WGET_VERSION = 1.21.3
 WGET_SOURCE = wget-$(WGET_VERSION).tar.lz
 WGET_SITE = $(BR2_GNU_MIRROR)/wget
 WGET_DEPENDENCIES = host-pkgconf
@@ -12,6 +12,22 @@ WGET_LICENSE = GPL-3.0+
 WGET_LICENSE_FILES = COPYING
 WGET_CPE_ID_VENDOR = gnu
 
+WGET_CONF_OPTS = \
+	--without-metalink \
+	--enable-opie \
+	--enable-digest \
+	--enable-ntlm \
+	--disable-debug \
+	--disable-valgrind-tests \
+	--disable-assert
+
+ifeq ($(BR2_PACKAGE_LIBPSL),y)
+WGET_CONF_OPTS += --with-libpsl
+WGET_DEPENDENCIES += libpsl
+else
+WGET_CONF_OPTS += --without-libpsl
+endif
+
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 WGET_CONF_OPTS += --with-ssl=gnutls
 WGET_DEPENDENCIES += gnutls
@@ -22,19 +38,18 @@ else
 WGET_CONF_OPTS += --without-ssl
 endif
 
-ifeq ($(BR2_PACKAGE_LIBICONV),y)
-WGET_DEPENDENCIES += libiconv
-endif
-
-ifeq ($(BR2_PACKAGE_LIBIDN2),y)
-WGET_CONF_OPTS += --with-libidn
-WGET_DEPENDENCIES += libidn2
+ifeq ($(BR2_PACKAGE_LIBICONV)$(BR2_PACKAGE_LIBIDN2),yy)
+WGET_CONF_OPTS += --enable-iri
+WGET_DEPENDENCIES += libiconv libidn2
 else
-WGET_CONF_OPTS += --without-libidn
+WGET_CONF_OPTS += --disable-iri
 endif
 
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
+WGET_CONF_OPTS += --with-libuuid
 WGET_DEPENDENCIES += util-linux
+else
+WGET_CONF_OPTS += --without-libuuid
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
@@ -44,6 +59,13 @@ else
 WGET_CONF_OPTS += --without-zlib
 endif
 
+ifeq ($(BR2_PACKAGE_C_ARES),y)
+WGET_CONF_OPTS += --with-cares
+WGET_DEPENDENCIES += c-ares
+else
+WGET_CONF_OPTS += --without-cares
+endif
+
 ifeq ($(BR2_PACKAGE_PCRE2),y)
 WGET_CONF_OPTS += --disable-pcre --enable-pcre2
 WGET_DEPENDENCIES += pcre2
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
