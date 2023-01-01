Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30ECEC4332F
	for <buildroot@archiver.kernel.org>; Sun,  1 Jan 2023 23:45:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4CD260B2C;
	Sun,  1 Jan 2023 23:45:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4CD260B2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TYHlU6J6u6ka; Sun,  1 Jan 2023 23:45:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 948EB60C16;
	Sun,  1 Jan 2023 23:45:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 948EB60C16
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7BEDD1BF38D
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E0CC81438
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:40:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E0CC81438
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oGoi6vqONHHf for <buildroot@lists.busybox.net>;
 Sun,  1 Jan 2023 23:40:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B52418149A
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B52418149A
 for <buildroot@buildroot.org>; Sun,  1 Jan 2023 23:40:21 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id u204so23341442oib.7
 for <buildroot@buildroot.org>; Sun, 01 Jan 2023 15:40:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NSbd3QomuDHlDFK7iTaN34iI2SpPOS7sRX5Ll7ncaQs=;
 b=70lOjRxitm8g9B37dUP7PUEKg7C50KbbExBK5OqLD713UisPKSGTu5xzfMgqMZuiYj
 YPd99WMkRzI1Sp7Zc9MY2SsmyG/JMeiWPfLFYRdJA/g6GCA1Bgc9mTzYQ1nxUyvSP3U4
 lF4Sez05s5y3DG3C5LsRKYhgjnCGT6nlCeKBtCj3nbF6CdoQYNlEvJOKJPI46fcWZOR0
 IEtDA3QVK4dS4SVgtllG8Af/o7Dnh1i7zx3v+CwvzSLBxLtnhaUhQnDxYN4x1rbcrvYi
 KjWlR4hIhL8b345lfkdSRi9QsUQzeKecs8cqkIWSzSnWRJolBitcVyOZ2MhhMB7Z+lkQ
 B83w==
X-Gm-Message-State: AFqh2krTjQlTdsMNCj0Jj4lsafdcrB7kY/XI5QZDQ/uT4ZGV5Zj5GYYk
 53FcU2YRl+DWyT1QVqGUZe2S6mYuxrs=
X-Google-Smtp-Source: AMrXdXtevDpKo6fXCDDOsTrFr1bFvaKQ6Raq7DKIDVt8P2EBfT0Hm2Uo27lJrkt4VRMTiMV6JzloTQ==
X-Received: by 2002:a05:6808:2002:b0:363:b9af:ec89 with SMTP id
 q2-20020a056808200200b00363b9afec89mr1660065oiw.1.1672616420607; 
 Sun, 01 Jan 2023 15:40:20 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:6ae4:c2b1:7ea6:a195])
 by smtp.gmail.com with ESMTPSA id
 o189-20020aca41c6000000b00360e46a1edasm11372611oia.22.2023.01.01.15.40.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jan 2023 15:40:19 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Jan 2023 20:36:53 -0300
Message-Id: <20230101233653.487175-30-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
References: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NSbd3QomuDHlDFK7iTaN34iI2SpPOS7sRX5Ll7ncaQs=;
 b=cv4VM7369cM6XhR+eF3FnGcTEFnTQxLY251DL9v2x8NdWQSZvBjLZaY0uojlu/dHU9
 VyvOSLC/+iXDZmszrMxO+84VyG2sOrFszXqiiFt+jiKnOtVKW1dS40SAlLeLOAJD6fpy
 1ZucXN3TDNH1M1pPKd0eZs07m8RmNi/GDjkdWNRM6IplBSnPL4IH2C7Koui3y6hQHN3c
 FQkfZom6x+BUTnBz1qc+0glufO6bx0gocovfcKZas1gaSyK/EVrDLH+rPrkkRonQzq4e
 3Wi8FOkKwLZs662m7nLV+24poXbOqkUzcKphzH525+ipfJFEJGUYCn7c5ouexxrafObV
 spCQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cv4VM736
Subject: [Buildroot] [PATCH 29/29] docs/manual: standardize references to
 the generic infra
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently the text for each package infra that mentions the usage of
variables already provided by the generic infra diverge from each other:
- some (golang, kconfig, python) add a cross-referece to the generic
  infra chapter;
- kconfig does not list any example;
- some mention _LICENSE as an example, others don't;
- some (cargo, golang, python) add an 'etc.' at the end of the examples,
  giving the idea that can be more symbols provided by the generic
  infra than the ones listed;
- most have the text 'works by defining a number of variables before
  calling the +<macro-name>+ macro', except golang and kconfig;
- some actually list 'A few additional variables' but keep using some
  old reference as 'An additional variable';
- some say 'First, all the package metadata' and other only 'All the
  package metadata';
- most mention _SUBDIR as an example of variable supported by the
  generic infra, even the generic infra manual not mentioning it.

The _SUBDIR variable is a tricky one. It *is* declared for the generic
infra package (and all package infras that inherit from the generic
one), but it is really used in certain conditions.
package/pkg-generic.mk uses <pkg>_SUBDIR only to define:
(2)_SRCDIR                     = $$($(2)_DIR)/$$($(2)_SUBDIR)
and it also uses <pkg>_SRCDIR only to define:
$(2)_BUILDDIR                   ?= $$($(2)_SRCDIR)
so the generic package infra does not really uses _SUBDIR by itself in
the common scenario.
So the manual entry for the generic infra seems correct in not
mentioning _SUBDIR.
Also any package infra that inherits from the generic one (by calling
inner-generic-package) needs to use one of the three variables in order
to support _SUBDIR: _BUILDDIR, _SRCDIR or _SUBDIR.
That is the case for: autotools (_SRCDIR), cargo (_SRCDIR, _SUBDIR),
cmake (_BUILDDIR, _SRCDIR), luarocks (_SRCDIR, _SUBDIR),
meson (_SRCDIR), perl (_SRCDIR), python (_BUILDDIR), qmake (_BUILDDIR)
and waf (_SRCDIR).
Of course the .mk file for a package using the generic infra can define
this symbol and use it, directly or indirectly, for example, in its
_INSTALL_TARGET_CMDS.
Also any package infra, even the ones that do not use directly any of
the three variables above, can use _SUBDIR when the package uses the
macros KCONFIG_ENABLE_OPT, KCONFIG_SET_OPT or KCONFIG_DISABLE_OPT
declared in package/pkg-utils.mk.

Improve the correctness for the manual by standardizing the text among
the package infras:
- use the same text "All the package metadata information variables that
  exist in the generic package infrastructure also exist in the
  <name> infrastructure:" for all of them;
- add the cross-reference for all of them;
- do not mention _SUBDIR as a variable that exist on generic infra;
- use the same set of examples for all infras: "_VERSION, _SOURCE,
  _PATCH, _SITE, _DEPENDENCIES, _LICENSE, _LICENSE_FILES, etc.";
- wrap the modified text at 72 columns;
- add "macro" to golang and luarocks infra;
- use "A few additional variables" for qmake and waf.

At same time, add a missing format on golang manual for
BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS.

Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 docs/manual/adding-packages-autotools.txt | 11 +++++------
 docs/manual/adding-packages-cargo.txt     |  9 +++++----
 docs/manual/adding-packages-cmake.txt     | 10 +++++-----
 docs/manual/adding-packages-golang.txt    |  9 +++++----
 docs/manual/adding-packages-kconfig.txt   | 18 ++++++++++++++----
 docs/manual/adding-packages-luarocks.txt  | 12 +++++++-----
 docs/manual/adding-packages-meson.txt     |  9 +++++----
 docs/manual/adding-packages-perl.txt      | 12 ++++++------
 docs/manual/adding-packages-python.txt    |  4 ++--
 docs/manual/adding-packages-qmake.txt     | 12 ++++++------
 docs/manual/adding-packages-rebar.txt     | 13 ++++++-------
 docs/manual/adding-packages-waf.txt       | 12 ++++++------
 12 files changed, 72 insertions(+), 59 deletions(-)

diff --git a/docs/manual/adding-packages-autotools.txt b/docs/manual/adding-packages-autotools.txt
index a041d91eb6..0cec82d95f 100644
--- a/docs/manual/adding-packages-autotools.txt
+++ b/docs/manual/adding-packages-autotools.txt
@@ -76,12 +76,11 @@ Just like the generic infrastructure, the autotools infrastructure
 works by defining a number of variables before calling the
 +autotools-package+ macro.
 
-First, all the package metadata information variables that exist in the
-generic infrastructure also exist in the autotools infrastructure:
-+LIBFOO_VERSION+, +LIBFOO_SOURCE+,
-+LIBFOO_PATCH+, +LIBFOO_SITE+,
-+LIBFOO_SUBDIR+, +LIBFOO_DEPENDENCIES+,
-+LIBFOO_INSTALL_STAGING+, +LIBFOO_INSTALL_TARGET+.
+All the package metadata information variables that exist in the
+xref:generic-package-reference[generic package infrastructure] also
+exist in the autotools infrastructure: +LIBFOO_VERSION+,
++LIBFOO_SOURCE+, +LIBFOO_PATCH+, +LIBFOO_SITE+, +LIBFOO_DEPENDENCIES+,
++LIBFOO_LICENSE+, +LIBFOO_LICENSE_FILES+, etc.
 
 A few additional variables, specific to the autotools infrastructure,
 can also be defined. Many of them are only useful in very specific
diff --git a/docs/manual/adding-packages-cargo.txt b/docs/manual/adding-packages-cargo.txt
index e18fd9ce23..4eedda8dc6 100644
--- a/docs/manual/adding-packages-cargo.txt
+++ b/docs/manual/adding-packages-cargo.txt
@@ -64,10 +64,11 @@ Just like the generic infrastructure, the Cargo infrastructure works
 by defining a number of variables before calling the +cargo-package+
 or +host-cargo-package+ macros.
 
-First, all the package metadata information variables that exist in
-the generic infrastructure also exist in the Cargo infrastructure:
-+FOO_VERSION+, +FOO_SOURCE+, +FOO_PATCH+, +FOO_SITE+,
-+FOO_DEPENDENCIES+, +FOO_LICENSE+, +FOO_LICENSE_FILES+, etc.
+All the package metadata information variables that exist in the
+xref:generic-package-reference[generic package infrastructure] also
+exist in the Cargo infrastructure: +FOO_VERSION+, +FOO_SOURCE+,
++FOO_PATCH+, +FOO_SITE+, +FOO_DEPENDENCIES+, +FOO_LICENSE+,
++FOO_LICENSE_FILES+, etc.
 
 A few additional variables, specific to the Cargo infrastructure, can
 also be defined. Many of them are only useful in very specific cases,
diff --git a/docs/manual/adding-packages-cmake.txt b/docs/manual/adding-packages-cmake.txt
index 541d7422cf..e69f072bb5 100644
--- a/docs/manual/adding-packages-cmake.txt
+++ b/docs/manual/adding-packages-cmake.txt
@@ -75,11 +75,11 @@ Just like the generic infrastructure, the CMake infrastructure works
 by defining a number of variables before calling the +cmake-package+
 macro.
 
-First, all the package metadata information variables that exist in
-the generic infrastructure also exist in the CMake infrastructure:
-+LIBFOO_VERSION+, +LIBFOO_SOURCE+, +LIBFOO_PATCH+, +LIBFOO_SITE+,
-+LIBFOO_SUBDIR+, +LIBFOO_DEPENDENCIES+, +LIBFOO_INSTALL_STAGING+,
-+LIBFOO_INSTALL_TARGET+.
+All the package metadata information variables that exist in the
+xref:generic-package-reference[generic package infrastructure] also
+exist in the Cmake infrastructure: +LIBFOO_VERSION+, +LIBFOO_SOURCE+,
++LIBFOO_PATCH+, +LIBFOO_SITE+, +LIBFOO_DEPENDENCIES+, +LIBFOO_LICENSE+,
++LIBFOO_LICENSE_FILES+, etc.
 
 A few additional variables, specific to the CMake infrastructure, can
 also be defined. Many of them are only useful in very specific cases,
diff --git a/docs/manual/adding-packages-golang.txt b/docs/manual/adding-packages-golang.txt
index c952cde577..95fa083f69 100644
--- a/docs/manual/adding-packages-golang.txt
+++ b/docs/manual/adding-packages-golang.txt
@@ -56,16 +56,17 @@ The main macro of the Go package infrastructure is
 ability to build host packages is also available, with the
 +host-golang-package+ macro.
 Host packages built by +host-golang-package+ macro should depend on
-BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS.
++BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS+.
 
 Just like the generic infrastructure, the Go infrastructure works
-by defining a number of variables before calling the +golang-package+.
+by defining a number of variables before calling the +golang-package+
+macro.
 
 All the package metadata information variables that exist in the
 xref:generic-package-reference[generic package infrastructure] also
 exist in the Go infrastructure: +FOO_VERSION+, +FOO_SOURCE+,
-+FOO_PATCH+, +FOO_SITE+, +FOO_SUBDIR+, +FOO_DEPENDENCIES+,
-+FOO_LICENSE+, +FOO_LICENSE_FILES+, +FOO_INSTALL_STAGING+, etc.
++FOO_PATCH+, +FOO_SITE+, +FOO_DEPENDENCIES+, +FOO_LICENSE+,
++FOO_LICENSE_FILES+, etc.
 
 Note that it is not necessary to add +host-go+ in the
 +FOO_DEPENDENCIES+ variable of a package, since this basic dependency
diff --git a/docs/manual/adding-packages-kconfig.txt b/docs/manual/adding-packages-kconfig.txt
index a35681775f..10901cf339 100644
--- a/docs/manual/adding-packages-kconfig.txt
+++ b/docs/manual/adding-packages-kconfig.txt
@@ -15,10 +15,20 @@ expose the package's +menuconfig+ target as +foo-menuconfig+ in
 Buildroot, and to handle the copying back and forth of the configuration
 file in a correct way.
 
-The +kconfig-package+ infrastructure is based on the +generic-package+
-infrastructure. All variables supported by +generic-package+ are
-available in +kconfig-package+ as well. See
-xref:generic-package-reference[] for more details.
+The main macro of the kconfig package infrastructure is
++kconfig-package+: like +generic-package+ it works by defining a number
+of variables providing metadata information about the package, and then
+calling +kconfig-package+ macro.
+
+Just like the generic infrastructure, the kconfig infrastructure works
+by defining a number of variables before calling the +kconfig-package+
+macro.
+
+All the package metadata information variables that exist in the
+xref:generic-package-reference[generic package infrastructure] also
+exist in the kconfig infrastructure: +FOO_VERSION+, +FOO_SOURCE+,
++FOO_PATCH+, +FOO_SITE+, +FOO_DEPENDENCIES+, +FOO_LICENSE+,
++FOO_LICENSE_FILES+, etc.
 
 In order to use the +kconfig-package+ infrastructure for a Buildroot
 package, the minimally required lines in the +.mk+ file, in addition to
diff --git a/docs/manual/adding-packages-luarocks.txt b/docs/manual/adding-packages-luarocks.txt
index 70f48fc02c..f76dcb33ad 100644
--- a/docs/manual/adding-packages-luarocks.txt
+++ b/docs/manual/adding-packages-luarocks.txt
@@ -73,16 +73,18 @@ infrastructures in Buildroot, respectively.
 
 The main macro of the LuaRocks package infrastructure is +luarocks-package+:
 like +generic-package+ it works by defining a number of variables providing
-metadata information about the package, and then calling +luarocks-package+.
+metadata information about the package, and then calling +luarocks-package+
+macro.
 
 Just like the generic infrastructure, the LuaRocks infrastructure works
 by defining a number of variables before calling the +luarocks-package+
 macro.
 
-First, all the package metadata information variables that exist in
-the generic infrastructure also exist in the LuaRocks infrastructure:
-+LUA_FOO_VERSION+, +LUA_FOO_SOURCE+, +LUA_FOO_SITE+,
-+LUA_FOO_DEPENDENCIES+, +LUA_FOO_LICENSE+, +LUA_FOO_LICENSE_FILES+.
+All the package metadata information variables that exist in the
+xref:generic-package-reference[generic package infrastructure] also
+exist in the LuaRocks infrastructure: +LUA_FOO_VERSION+,
++LUA_FOO_SOURCE+, +LUA_FOO_PATCH+, +LUA_FOO_SITE+,
++LUA_FOO_DEPENDENCIES+, +LUA_FOO_LICENSE+, +LUA_FOO_LICENSE_FILES+, etc.
 
 Two of them are populated by the LuaRocks infrastructure (for the
 +download+ step). If your package is not hosted on the LuaRocks mirror
diff --git a/docs/manual/adding-packages-meson.txt b/docs/manual/adding-packages-meson.txt
index 029c8c2488..13407d814d 100644
--- a/docs/manual/adding-packages-meson.txt
+++ b/docs/manual/adding-packages-meson.txt
@@ -76,10 +76,11 @@ packages is also available, with the +host-meson-package+ macro.
 Just like the generic infrastructure, the Meson infrastructure works by defining
 a number of variables before calling the +meson-package+ macro.
 
-First, all the package metadata information variables that exist in the generic
-infrastructure also exist in the Meson infrastructure: +FOO_VERSION+,
-+FOO_SOURCE+, +FOO_PATCH+, +FOO_SITE+, +FOO_SUBDIR+, +FOO_DEPENDENCIES+,
-+FOO_INSTALL_STAGING+, +FOO_INSTALL_TARGET+.
+All the package metadata information variables that exist in the
+xref:generic-package-reference[generic package infrastructure] also
+exist in the Meson infrastructure: +FOO_VERSION+, +FOO_SOURCE+,
++FOO_PATCH+, +FOO_SITE+, +FOO_DEPENDENCIES+, +FOO_LICENSE+,
++FOO_LICENSE_FILES+, etc.
 
 A few additional variables, specific to the Meson infrastructure, can also be
 defined. Many of them are only useful in very specific cases, typical packages
diff --git a/docs/manual/adding-packages-perl.txt b/docs/manual/adding-packages-perl.txt
index 6ce693fd6e..73cfd50d09 100644
--- a/docs/manual/adding-packages-perl.txt
+++ b/docs/manual/adding-packages-perl.txt
@@ -85,12 +85,12 @@ Just like the generic infrastructure, the Perl/CPAN infrastructure
 works by defining a number of variables before calling the
 +perl-package+ macro.
 
-First, all the package metadata information variables that exist in the
-generic infrastructure also exist in the Perl/CPAN infrastructure:
-+PERL_FOO_VERSION+, +PERL_FOO_SOURCE+,
-+PERL_FOO_PATCH+, +PERL_FOO_SITE+,
-+PERL_FOO_SUBDIR+, +PERL_FOO_DEPENDENCIES+,
-+PERL_FOO_INSTALL_TARGET+.
+All the package metadata information variables that exist in the
+xref:generic-package-reference[generic package infrastructure] also
+exist in the Perl/CPAN infrastructure: +PERL_FOO_VERSION+,
++PERL_FOO_SOURCE+, +PERL_FOO_PATCH+, +PERL_FOO_SITE+,
++PERL_FOO_DEPENDENCIES+, +PERL_FOO_LICENSE+, +PERL_FOO_LICENSE_FILES+,
+etc.
 
 Note that setting +PERL_FOO_INSTALL_STAGING+ to +YES+ has no effect
 unless a +PERL_FOO_INSTALL_STAGING_CMDS+ variable is defined. The perl
diff --git a/docs/manual/adding-packages-python.txt b/docs/manual/adding-packages-python.txt
index 500967f235..0b0f644a79 100644
--- a/docs/manual/adding-packages-python.txt
+++ b/docs/manual/adding-packages-python.txt
@@ -81,8 +81,8 @@ All the package metadata information variables that exist in the
 xref:generic-package-reference[generic package infrastructure] also
 exist in the Python infrastructure: +PYTHON_FOO_VERSION+,
 +PYTHON_FOO_SOURCE+, +PYTHON_FOO_PATCH+, +PYTHON_FOO_SITE+,
-+PYTHON_FOO_SUBDIR+, +PYTHON_FOO_DEPENDENCIES+, +PYTHON_FOO_LICENSE+,
-+PYTHON_FOO_LICENSE_FILES+, +PYTHON_FOO_INSTALL_STAGING+, etc.
++PYTHON_FOO_DEPENDENCIES+, +PYTHON_FOO_LICENSE+,
++PYTHON_FOO_LICENSE_FILES+, etc.
 
 Note that:
 
diff --git a/docs/manual/adding-packages-qmake.txt b/docs/manual/adding-packages-qmake.txt
index 699d082aa1..ac34b37264 100644
--- a/docs/manual/adding-packages-qmake.txt
+++ b/docs/manual/adding-packages-qmake.txt
@@ -51,13 +51,13 @@ Just like the generic infrastructure, the QMake infrastructure works
 by defining a number of variables before calling the +qmake-package+
 macro.
 
-First, all the package metadata information variables that exist in
-the generic infrastructure also exist in the QMake infrastructure:
-+LIBFOO_VERSION+, +LIBFOO_SOURCE+, +LIBFOO_PATCH+, +LIBFOO_SITE+,
-+LIBFOO_SUBDIR+, +LIBFOO_DEPENDENCIES+, +LIBFOO_INSTALL_STAGING+,
-+LIBFOO_INSTALL_TARGET+.
+All the package metadata information variables that exist in the
+xref:generic-package-reference[generic package infrastructure] also
+exist in the QMake infrastructure: +LIBFOO_VERSION+, +LIBFOO_SOURCE+,
++LIBFOO_PATCH+, +LIBFOO_SITE+, +LIBFOO_DEPENDENCIES+, +LIBFOO_LICENSE+,
++LIBFOO_LICENSE_FILES+, etc.
 
-An additional variable, specific to the QMake infrastructure, can
+A few additional variables, specific to the QMake infrastructure, can
 also be defined.
 
 * +LIBFOO_CONF_ENV+, to specify additional environment variables to
diff --git a/docs/manual/adding-packages-rebar.txt b/docs/manual/adding-packages-rebar.txt
index d78b3171d8..bc3d890707 100644
--- a/docs/manual/adding-packages-rebar.txt
+++ b/docs/manual/adding-packages-rebar.txt
@@ -51,13 +51,12 @@ Just like the generic infrastructure, the +rebar+ infrastructure works
 by defining a number of variables before calling the +rebar-package+
 macro.
 
-First, all the package metadata information variables that exist in
-the generic infrastructure also exist in the +rebar+ infrastructure:
-+ERLANG_FOOBAR_VERSION+, +ERLANG_FOOBAR_SOURCE+,
-+ERLANG_FOOBAR_PATCH+, +ERLANG_FOOBAR_SITE+,
-+ERLANG_FOOBAR_SUBDIR+, +ERLANG_FOOBAR_DEPENDENCIES+,
-+ERLANG_FOOBAR_INSTALL_STAGING+, +ERLANG_FOOBAR_INSTALL_TARGET+,
-+ERLANG_FOOBAR_LICENSE+ and +ERLANG_FOOBAR_LICENSE_FILES+.
+All the package metadata information variables that exist in the
+xref:generic-package-reference[generic package infrastructure] also
+exist in the +rebar+ infrastructure: +ERLANG_FOOBAR_VERSION+,
++ERLANG_FOOBAR_SOURCE+, +ERLANG_FOOBAR_PATCH+, +ERLANG_FOOBAR_SITE+,
++ERLANG_FOOBAR_DEPENDENCIES+, +ERLANG_FOOBAR_LICENSE+,
++ERLANG_FOOBAR_LICENSE_FILES+, etc.
 
 A few additional variables, specific to the +rebar+ infrastructure,
 can also be defined. Many of them are only useful in very specific
diff --git a/docs/manual/adding-packages-waf.txt b/docs/manual/adding-packages-waf.txt
index 101cddf1f1..6f08053237 100644
--- a/docs/manual/adding-packages-waf.txt
+++ b/docs/manual/adding-packages-waf.txt
@@ -51,13 +51,13 @@ Just like the generic infrastructure, the Waf infrastructure works
 by defining a number of variables before calling the +waf-package+
 macro.
 
-First, all the package metadata information variables that exist in
-the generic infrastructure also exist in the Waf infrastructure:
-+LIBFOO_VERSION+, +LIBFOO_SOURCE+, +LIBFOO_PATCH+, +LIBFOO_SITE+,
-+LIBFOO_SUBDIR+, +LIBFOO_DEPENDENCIES+, +LIBFOO_INSTALL_STAGING+,
-+LIBFOO_INSTALL_TARGET+.
+All the package metadata information variables that exist in the
+xref:generic-package-reference[generic package infrastructure] also
+exist in the Waf infrastructure: +LIBFOO_VERSION+, +LIBFOO_SOURCE+,
++LIBFOO_PATCH+, +LIBFOO_SITE+, +LIBFOO_DEPENDENCIES+, +LIBFOO_LICENSE+,
++LIBFOO_LICENSE_FILES+, etc.
 
-An additional variable, specific to the Waf infrastructure, can
+A few additional variables, specific to the Waf infrastructure, can
 also be defined.
 
 * +LIBFOO_SUBDIR+ may contain the name of a subdirectory inside the
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
