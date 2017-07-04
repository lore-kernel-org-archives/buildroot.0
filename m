From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:47:44 +0200
Subject: [Buildroot] [PATCH 004/100] ushare: do not use the DISABLE_NLS
	variable
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-5-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ushare is not an autoconf/automake based package, so it does not have
the standard behavior of autoconf that every enable/disable option
supports both --enable-foo and --disable-foo.

For example, it supports --disable-nls, but not
--enable-nls. Currently, DISABLE_NLS is either empty or --disable-nls,
but this will be changed in a follow-up commit. As a preparation, this
commit modifies ushare to no longer use DISABLE_NLS, but instead
calculate itself whether --disable-nls should be passed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/ushare/ushare.mk | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/package/ushare/ushare.mk b/package/ushare/ushare.mk
index 3a5f178..32aa445 100644
--- a/package/ushare/ushare.mk
+++ b/package/ushare/ushare.mk
@@ -11,17 +11,27 @@ USHARE_DEPENDENCIES = host-pkgconf libupnp
 USHARE_LICENSE = GPL-2.0+
 USHARE_LICENSE_FILES = COPYING
 
+USHARE_CONF_OPTS = \
+	--prefix=/usr \
+	--cross-compile \
+	--cross-prefix="$(TARGET_CROSS)" \
+	--sysconfdir=/etc \
+	--disable-strip
+
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 USHARE_DEPENDENCIES += gettext
 USHARE_LDFLAGS += -lintl
 endif
 
+ifeq ($(BR2_ENABLE_LOCALE),)
+USHARE_CONF_OPTS += --disable-nls
+endif
+
 define USHARE_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(TARGET_CONFIGURE_OPTS) \
-		./configure --prefix=/usr $(DISABLE_NLS) --cross-compile \
-		--cross-prefix="$(TARGET_CROSS)" --sysconfdir=/etc \
-		--disable-strip \
+		./configure \
+			$(USHARE_CONF_OPTS) \
 	)
 endef
 
-- 
2.9.4
