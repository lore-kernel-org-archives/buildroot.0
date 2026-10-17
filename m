Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207B2CCF2C1
	for <buildroot@archiver.kernel.org>; Sat, 17 Oct 2026 14:00:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABE2540986;
	Sat, 17 Oct 2026 14:00:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XYZ-IUL4fXX0; Sat, 17 Oct 2026 14:00:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 91EC940987
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792245646;
	b=A0Ge5LbvjTDcr4OypWHtOaINR/Y+IfPFHoO4n4iyaQdll3uXJdxDvRGfK5+x1g0YWbOS
	 OHQ2u+vv7E9poBseMKUsI00RXxj94/rih44xdx/US62hphirlmJEH0oPqadchumqBHkrF
	 F3UU5xD+yBc6x3v7dUC1zOnGLSdnwDbwjz2eesstVjyzcsVpZlUMR79nOpsvW7YHeKw81
	 wVRq8LEkXsAFfKTM0VhjKoo0yl0Vpj3MrNWTZMLrpJSNzWacsLjOe2DP9XvbRBRS3m23T
	 D8C7jo+sU2/vRnJNoohFhaKRyciEkgb4Y1N8HJrioRl8dMan8gWg66oQg1tGcvGSIXg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792245646;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=aqSQxPIvairYxHYWcOhjPq+26PEisFx+DJ1RpQIXSTM=;
	b=sSsuNgAqFwBAZnYjjNV4wz7qwWOXOFJKTDbF6eNIZxzAp6it0X1KDcoevjahTsSqJelb
	 ZqThn2TudYmwoTb9dIl5b5IO9OSvaxZUL9JycXhC3Z2FL2XxKukaOJaGRld4k7/i/4epb
	 JTCd7TMVw5xsbFtWKvxNXFluY7fb9JVOzWfgJieI7DdfY97PrhmjRBn1pd8plroKn5At7
	 5UqhY6Joj/sM8u11ZTde4Q/q2HIcSRVOM4NZV7V0Giii5A7C6YAMwOEwGlz36HEwl9RV6
	 ke0/NPlTdxepZ7pXtupdYID9VsqW/C0QhMxYncJMSiF9SQqlP7JjxNvGdGiVPxW31oA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792245646;
	bh=aqSQxPIvairYxHYWcOhjPq+26PEisFx+DJ1RpQIXSTM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kyDWI0W/ohZ87fpTVZb8zvHKDb7EMfjnsP4QaS+FKZAOeORKxl3h2XKCLD03X1Vbj
	 mV7djs3uJjc2dit9lpjmZc9ajMKCWtI5bVTemM1lk2YoG1NitZCmJtmzpyr2Hy1KLS
	 RDtceSowN1ZJ8NLCeuViccEgL9OV8U3xso7+bCtdYHXF1Op90aUMhtMPSIBA+ldPRr
	 MlUixaAZwKwBM0BfBY6fyjpXgizXFHuLYQHfBuQcE2VZl17Lrbsw19AfjMcp0YsgKo
	 YuiKZOSHLX5qIJb9pWxH7IidS8yMQhQrKxdeRBGaovOZKL4xjE8mseqi+Z992QT1W7
	 867DZAgka2JoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91EC940987;
	Sat, 17 Oct 2026 14:00:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 72DD21DE
 for <buildroot@buildroot.org>; Sat, 17 Oct 2026 14:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 587294098E
 for <buildroot@buildroot.org>; Sat, 17 Oct 2026 14:00:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4W_IWjeM2XNh for <buildroot@buildroot.org>;
 Sat, 17 Oct 2026 14:00:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B07CC40987
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792245643;
 b=m2rnWqqCc7VUn+yo1K21JcBLiI66+oBLs35xxSJkW+J4/755fQZlLjAMMj7POMKWNAqm
 HBsskRToCNxHNB6YvP/4JvUXdsEENGpfs36RpBfrUH3tHANyVpH6NSc2hZyqBieFFujnF
 U87hztC+eeOLQaSbjA1c7cll6H8bBcCr6KK4JYXxoVUWGe4Xny9qmTGwvaxfEPrS9efMK
 VCFWrzt5qqnlJrsU2BST2uOkS6UWa0q0RsD+4Puckrm8ZIGPa8zMKMnlZ2+jHiAK9wuzQ
 xbMGIPp2GLV5EIUe4tu9RqHyADz2rZliVY2M07srudxAEm9SSHT8yqWAc8zptNkA9YQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792245643;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=UZ6NcJxEDlbKXusEKRAMjR4/NqHTFIU9XS6i2b1CkoA=;
 b=hY9x+gSHDHSY8Rd1ig0aaSvOvue7qeTJW56v9LWgvq1jsu1rpACBSVb/zcEP7tOoADO6
 FjZ7nxBiV/8oaoG9VIiAp+VPSDdrwSc1cuVg31RxtkO7EgkZzMhqp0dp07bTziO/sWDhE
 MHWF4RDl8SeLO+KePvi6IqGCo/Sx98fkKomiJYJecunvtybpz14u1ZBdYiiheF9YLeSSR
 ckVSgcD3p0Hb0Vraoj0/PxPMNVpMq8q2OLY/kDIPml4ZRZw00VImXgLsqH6bA1jDu0Z9K
 hVeVN07ZhwcfCedOKliWeff1m3hBRG9ARhqg0yPKWb+jGary/RNsrBAK3BsASSwIj5g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=rso6j3bP; 
 arc=none smtp.remote-ip=212.227.15.19
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B07CC40987
 for <buildroot@buildroot.org>; Sat, 17 Oct 2026 14:00:41 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MBlxW-1xU8C326Xc-003T9D; Sat, 17
 Oct 2026 16:00:39 +0200
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Fiona Klute <fiona.klute@gmx.de>
Date: Sat, 17 Oct 2026 16:00:27 +0200
Message-ID: <20261017140027.697390-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261017140027.697390-1-fiona.klute@gmx.de>
References: <20261017140027.697390-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:7txtBuERRlBbQMKtn13wrxXqFnBRELYBxb3WJnMSRQt8ICz7enM
 E1PM6YkL+gvD2CeOSub41eZ+2SmVH2c5Ypg8bP38NA8N8X0GN/RF+8VQZMC8MEFTSYqsfLs
 gzjZnsuM7psZ2MdsGDiIHJoCpgoRfV9wzq/jQ+g5fUt/4zALr9n4lYQueNI5taGs/2p8HXW
 U7z8dXVy4AtYnuaSp5lGA==
UI-OutboundReport: notjunk:1;M01:P0:vLdD4GIb620=;lGW1q+U9lJXJTNLe8k3gc0i+hoC
 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
 =
Subject: [Buildroot] [PATCH v2 2/2] package/p11-kit: switch to meson build
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
Changes v1 -> v2:
* new patch

 ...ing-systemduserunitdir-to-break-depe.patch | 61 ++++++++++++++++
 package/p11-kit/p11-kit.mk                    | 70 +++++++++++--------
 2 files changed, 100 insertions(+), 31 deletions(-)
 create mode 100644 package/p11-kit/0001-meson-allow-setting-systemduserunitdir-to-break-depe.patch

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
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
