From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:48:04 +0200
Subject: [Buildroot] [PATCH 024/100] dropwatch: use new gettext logic
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-25-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit switches to use the new gettext logic, which involves:

 - using TARGET_NLS_DEPENDENCIES instead of relying on binutils
   depending on gettext/host-gettext

 - using TARGET_NLS_LIBS to force linking against libintl

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dropwatch/dropwatch.mk | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/dropwatch/dropwatch.mk b/package/dropwatch/dropwatch.mk
index e08a0c1..692a6e8 100644
--- a/package/dropwatch/dropwatch.mk
+++ b/package/dropwatch/dropwatch.mk
@@ -6,18 +6,16 @@
 
 DROPWATCH_VERSION = 7c33d8a8ed105b07a46b55d71d93b36ed34c16db
 DROPWATCH_SITE = git://git.infradead.org/users/nhorman/dropwatch.git
-DROPWATCH_DEPENDENCIES = binutils libnl readline host-pkgconf
+DROPWATCH_DEPENDENCIES = binutils libnl readline host-pkgconf \
+	$(TARGET_NLS_DEPENDENCIES)
 DROPWATCH_LICENSE = GPL-2.0
 DROPWATCH_LICENSE_FILES = COPYING
 
 # libbfd may be linked to libintl
 # Ugly... but LDLIBS are hardcoded anyway
 DROPWATCH_LDLIBS = \
-	-lbfd -lreadline -lnl-3 -lnl-genl-3 -lpthread -lncurses -lm
-
-ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
-DROPWATCH_LDLIBS += -lintl
-endif
+	-lbfd -lreadline -lnl-3 -lnl-genl-3 -lpthread -lncurses -lm \
+	$(TARGET_NLS_LIBS)
 
 define DROPWATCH_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
-- 
2.9.4
