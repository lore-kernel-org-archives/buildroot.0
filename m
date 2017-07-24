From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 24 Jul 2017 06:59:53 +0300
Subject: [Buildroot] [PATCH 2/3] grep: standardise pcre optional dependency
In-Reply-To: <b8bec6b0782f9808f59be046aea03648733417fa.1500868794.git.baruch@tkos.co.il>
References: <b8bec6b0782f9808f59be046aea03648733417fa.1500868794.git.baruch@tkos.co.il>
Message-ID: <12b9226a3f84e63fc6f91409bebec0a2bca766d7.1500868794.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the 'disable' config option in the 'else' clause of the optional
dependency as is the common pattern.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/grep/grep.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index cfbf2ec7b537..06d84ed5b96f 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -9,8 +9,7 @@ GREP_SITE = $(BR2_GNU_MIRROR)/grep
 GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
 GREP_LICENSE = GPL-3.0+
 GREP_LICENSE_FILES = COPYING
-GREP_CONF_OPTS = --disable-perl-regexp \
-	$(if $(BR2_TOOLCHAIN_USES_MUSL),--with-included-regex)
+GREP_CONF_OPTS = $(if $(BR2_TOOLCHAIN_USES_MUSL),--with-included-regex)
 GREP_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 
 # link with iconv if enabled
@@ -23,6 +22,8 @@ endif
 ifeq ($(BR2_PACKAGE_PCRE),y)
 GREP_CONF_OPTS += --enable-perl-regexp
 GREP_DEPENDENCIES += pcre
+else
+GREP_CONF_OPTS += --disable-perl-regexp
 endif
 
 # Full grep preferred over busybox grep
-- 
2.13.2
