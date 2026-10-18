Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D10CCF2D1
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 09:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E952C606BB;
	Sun, 18 Oct 2026 09:51:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1idsthLJbszl; Sun, 18 Oct 2026 09:51:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CBB7F606F8
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792317073;
	b=SUtXQE13+WFi8a/GgcaCfktXa3SOxXtZAmBKnRV9DEL/YG3ZupAWdmttgTgaUrDC8Xfd
	 5QikvxpJcIHuwFntBnKHsGPhYCP58IUnxSG0EQ4ru3wJFsyvZV/OEgKAb69rE9BwTutp0
	 eZzz6rg+jLOpDmWUCDu/0Gx3LYkHhM3tBt6u7rc2aehg2bl8tasddLuKRUiavRP68C+fj
	 adf8R4aO67aQZsdcwqGk3kV/xcaoQDw8BTIKcozBhhZjhvbu0mrW0zOmZCfKV7GQKeYyC
	 aXKBjsZ5vhnHyNx80dqKFOFmtB38oiF7/ZkheT5I+wCS4R4xbN5ZnSNC8IqpUoHPMtQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792317073;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3O9ZCa7R5RXyQkVDcXJVkL5N10GjrOwvjGAdUCU8hDM=;
	b=DKJ9ljcCnfGOsYb+dSjT5v4kvTlngfgirqKDuosS2t8TY8TPOyXjkK7n4gydE1F9rNvW
	 kxuumy31WbUMIWz+Ya8bhQ6PDqpESPKuATq2scjot17jNrpz+VQb2ElilYOlQbgfXBxTb
	 ayH+KfG9KV0z5JoQvR8OmllS6L1X7ULT6wCPKhR6GeV2pm3WVa4oq4R4MwnGsbx8vNAc4
	 mFiYjs6MEgsZgz3qjZqQH1HFGOGb6oZmv8BgSE5orE9ErJrR9NyobscA7um7vzDJLm8+T
	 LdKlErOS94uLTRa0crJcZMDnu0By/K4EaeF0wtucwoqYXefCvASXmf5eWOfyt2BBQ3A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792317073;
	bh=3O9ZCa7R5RXyQkVDcXJVkL5N10GjrOwvjGAdUCU8hDM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IIGEWkZUi3tkEj07zRXl+QCQmxh6EV4yRnVvTbhdR0d1qMZ+4dPo6MHpFfDJASZjm
	 5jucHUTQwn4DDI87aL07i0r7dHbty6FHR6Y7d+XOyEI49DgNqhYNGSkLokG9JiSz3/
	 UzBWTH+isECa0WlTyqHRcFwmbXbwMTLMGktdtn9zVhTkwrfM9RRC6WY2dNxHJwBJWq
	 O4gPZ1zMKH0SyvIWXMtWzO5szZWZ07BsuPW13MLDsDOqoxSUk1anx64bDHb7jy0CvG
	 iT0FcDWNdKtxLNhuWowHYeZCDVKN2zc6T0L0E8Fw5KUr3kUN3QlfIDhkw0moCh7v3c
	 +WgD1tmHCqnpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBB7F606F8;
	Sun, 18 Oct 2026 09:51:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4519F23F
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 09:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36366606AA
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 09:51:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hcFWlfmYN4Yo for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 09:51:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D3380606A7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792317062;
 b=Yb/wBkG0pdd8PUgLefRV4rqqLqh37ln33lth+uhA02l/NOodovCZoEytfG0sFiCgR6jW
 toP1zBu6DGe7rnC5a0AtXbReu/8TwzZI2y4dMU3YTbHVuH2xUX5XQvCVZWTaseTdKzVB0
 aTcLJx/LdiAzCb7qGGqYhzpsRTNgjgs4D5BSDVPM6Zb5IouVJyUjIjrnOErZOnnYN66I4
 zFypubz/9izBDC6Jq7C2yg7geROOA6X2zHUEkL/hqQY9Ppxpn8EfY4eIqM/x3U+/UG6BV
 b1Fu7slWggvZI+bf6Hu9aF4k2Edz2mW13WcQ0OC7Bk2prYb+xNtJq5PbVB0DhzEWq/g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792317062;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=VaVXsHFko2opzvrre5pwc4uCi8b2lIj15PTLajgH0Bs=;
 b=YRhRWDv7hh0/84MqxWHadIzlxg2vlFcOgZP8m/7g7XTI6fwytWnKiLuF1q/zvPWLpTT1
 8pXo58wWDtoV9zT88RNR4rGer+qPpO1QKLJm8182Ib1gbrBGuq9PCCmvt0qEE3ps0iS3g
 bqDXPNlG69af/yNnzhyLvt6OVwWadoBL+7WTvhzkEOISRIX6AJhAaz0puFVMz2BYSXuoo
 iTPa27kO2oxduzoWBWRRAqRsqCW7Rp20r5S9uLGR8msly3hRHc2SYWZVj8tGe0YZnUPMB
 6Oc4ziHu6YWyrfQtdeY0geonjapjbAPJyn51jJTiEXwN7uI3gGWz6IHuM6TK6FTYGGg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D3380606A7
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 09:51:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CBCF296ADA; Sun, 18 Oct 2026 09:49:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 11:18:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f432a9e625cd1dabc7722e894909d7ae23e5e488
X-Git-Newrev: 1923f760bbf8ac7ed43f90d2e7df33faebe9afb8
X-Patchwork-Hint: ignore
Message-Id: <20261018094940.CBCF296ADA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/p11-kit: switch to meson build
 system
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1923f760bbf8ac7ed43f90d2e7df33faebe9afb8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

P11-kit has been offering a meson build since 0.23.17 (see upstream
NEWS [1]), and it is the build system described in the upstream
README.

Changes in the switch to meson:

* Explicitly enable/disable NLS.
* Explicitly enable/disable bash-completion.
* The meson build has no explicit option for libtasn1, it is required
  if trust_module is enabled.
* Add patch for meson configuration to avoid depending on systemd to
  discover install location for units, which would create a dependency
  loop.
* Check for BR2_INIT_SYSTEMD instead of BR2_PACKAGE_SYSTEMD to decide
  whether to install systemd units.

[1] https://github.com/p11-glue/p11-kit/blob/0.26.5/NEWS#L164

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...-setting-systemduserunitdir-to-break-depe.patch | 61 +++++++++++++++++++
 package/p11-kit/p11-kit.mk                         | 70 ++++++++++++----------
 2 files changed, 100 insertions(+), 31 deletions(-)

diff --git a/package/p11-kit/0001-meson-allow-setting-systemduserunitdir-to-break-depe.patch b/package/p11-kit/0001-meson-allow-setting-systemduserunitdir-to-break-depe.patch
new file mode 100644
index 0000000000..050bc3533b
--- /dev/null
+++ b/package/p11-kit/0001-meson-allow-setting-systemduserunitdir-to-break-depe.patch
@@ -0,0 +1,61 @@
+From 709e37f781e50ef981d337249c574a9255691665 Mon Sep 17 00:00:00 2001
+From: Fiona Klute <fiona.klute@gmx.de>
+Date: Sat, 17 Oct 2026 14:33:02 +0200
+Subject: [PATCH] meson: allow setting systemduserunitdir to break dependency
+ loop
+
+The dependency on systemd is only used to retrieve systemduserunitdir,
+not otherwise needed during build. However, p11-kit is also an
+(optional) dependency of systemd, creating a dependency loop.
+
+This patch allows setting systemduserunitdir directly to break the
+dependency loop. If set, the given value is used unconditionally
+without checking for systemd, otherwise systemd is detected as before.
+
+Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
+Upstream: https://github.com/p11-glue/p11-kit/pull/788
+---
+ meson.build       | 11 ++++++++---
+ meson_options.txt |  4 ++++
+ 2 files changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 38cf81b..9e76d62 100644
+--- a/meson.build
++++ b/meson.build
+@@ -456,9 +456,14 @@ conf.set_quoted('TRUST_PATHS', trust_paths)
+ # systemd
+ 
+ with_systemd = false
+-systemd = dependency('systemd', required: get_option('systemd'))
+-if systemd.found()
+-  systemduserunitdir = systemd.get_variable(pkgconfig : 'systemduserunitdir')
++systemduserunitdir = get_option('systemduserunitdir')
++if systemduserunitdir == ''
++  systemd = dependency('systemd', required: get_option('systemd'))
++  if systemd.found()
++    systemduserunitdir = systemd.get_variable(pkgconfig : 'systemduserunitdir')
++    with_systemd = true
++  endif
++else
+   with_systemd = true
+ endif
+ 
+diff --git a/meson_options.txt b/meson_options.txt
+index c1f2362..a7c0553 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -46,6 +46,10 @@ option('systemd', type : 'feature',
+        value : 'auto',
+        description : 'Use systemd socket activation')
+ 
++option('systemduserunitdir', type : 'string',
++       value : '',
++       description : 'Override default location for systemd user units')
++
+ option('bashcompdir', type : 'string',
+        value : '',
+        description : 'Override default location for bash completion files')
+-- 
+2.55.0
+
diff --git a/package/p11-kit/p11-kit.mk b/package/p11-kit/p11-kit.mk
index b3bb3e1263..17efff7b16 100644
--- a/package/p11-kit/p11-kit.mk
+++ b/package/p11-kit/p11-kit.mk
@@ -7,57 +7,65 @@
 P11_KIT_VERSION = 0.26.5
 P11_KIT_SOURCE = p11-kit-$(P11_KIT_VERSION).tar.xz
 P11_KIT_SITE = https://github.com/p11-glue/p11-kit/releases/download/$(P11_KIT_VERSION)
+P11_KIT_DEPENDENCIES = host-pkgconf
 P11_KIT_INSTALL_STAGING = YES
-P11_KIT_CONF_OPTS = --disable-static
-P11_KIT_CONF_ENV = ac_cv_have_decl_program_invocation_short_name=yes \
-	ac_cv_have_decl___progname=no
 P11_KIT_LICENSE = BSD-3-Clause
 P11_KIT_LICENSE_FILES = COPYING
 P11_KIT_CPE_ID_VALID = YES
-# Needed because the pre-generated ./configure script has an old
-# broken expansion of AC_HEADER_STDBOOL, which incorrectly detects
-# that <stdbool.h> cannot be used, causing breakage down the road.
-P11_KIT_AUTORECONF = YES
-# Needed for autoreconf
-P11_KIT_DEPENDENCIES = host-pkgconf
+
+P11_KIT_CONF_OPTS = -Dtest=false
+
+ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
+P11_KIT_CONF_OPTS += -Dnls=true
+P11_KIT_DEPENDENCIES += $(TARGET_NLS_DEPENDENCIES)
+else
+P11_KIT_CONF_OPTS += -Dnls=false
+endif
 
 ifeq ($(BR2_PACKAGE_LIBFFI),y)
 P11_KIT_DEPENDENCIES += host-pkgconf libffi
-P11_KIT_CONF_OPTS += --with-libffi
+P11_KIT_CONF_OPTS += -Dlibffi=enabled
 else
-P11_KIT_CONF_OPTS += --without-libffi
+P11_KIT_CONF_OPTS += -Dlibffi=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBTASN1),y)
-P11_KIT_DEPENDENCIES += host-pkgconf libtasn1
-P11_KIT_CONF_OPTS += \
-	--enable-trust-module \
-	--with-libtasn1
+# host-libtasn1 is needed to provide asn1Parser
+P11_KIT_DEPENDENCIES += host-pkgconf host-libtasn1 libtasn1
+P11_KIT_CONF_OPTS += -Dtrust_module=enabled
 ifeq ($(BR2_PACKAGE_CA_CERTIFICATES),y)
-P11_KIT_CONF_OPTS += --with-trust-paths=/etc/ssl/certs/ca-certificates.crt
+P11_KIT_CONF_OPTS += -Dtrust_paths=/etc/ssl/certs/ca-certificates.crt
 else
-P11_KIT_CONF_OPTS += --without-trust-paths
+P11_KIT_CONF_OPTS += -Dtrust_paths=
 endif
 else
+P11_KIT_CONF_OPTS += -Dtrust_module=disabled
+endif
+
+ifeq ($(BR2_INIT_SYSTEMD),y)
 P11_KIT_CONF_OPTS += \
-	--disable-trust-module \
-	--without-libtasn1
+	-Dsystemd=enabled \
+	-Dsystemduserunitdir=/usr/lib/systemd/user
+else
+P11_KIT_CONF_OPTS += -Dsystemd=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_SYSTEMD),y)
-P11_KIT_CONF_OPTS += --with-systemd
+ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
+P11_KIT_DEPENDENCIES += bash-completion
+P11_KIT_CONF_OPTS += -Dbash_completion=enabled
 else
-P11_KIT_CONF_OPTS += --without-systemd
+P11_KIT_CONF_OPTS += -Dbash_completion=disabled
 endif
 
 HOST_P11_KIT_DEPENDENCIES = host-pkgconf
-
 HOST_P11_KIT_CONF_OPTS = \
-	--without-libffi \
-	--without-trust-paths \
-	--disable-trust-module \
-	--without-libtasn1 \
-	--without-systemd
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
+	-Dtest=false \
+	-Dnls=false \
+	-Dlibffi=disabled \
+	-Dtrust_paths= \
+	-Dtrust_module=disabled \
+	-Dsystemd=disabled \
+	-Dbash_completion=disabled
+
+$(eval $(meson-package))
+$(eval $(host-meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
