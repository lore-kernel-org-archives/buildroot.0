From: Daniel Mack <zonque@gmail.com>
Date: Wed, 30 Nov 2011 16:05:59 +0100
Subject: [Buildroot] [PATCH 1/2] iw: fix build with new libnl-3
In-Reply-To: <CAGm1_kt-QPDOyfnnjQJ=R_8=S_++h0GcDY4wid7J69v2QawExw@mail.gmail.com>
References: <CAGm1_kt-QPDOyfnnjQJ=R_8=S_++h0GcDY4wid7J69v2QawExw@mail.gmail.com>
Message-ID: <1322665560-29888-1-git-send-email-zonque@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The CFLAGS have to be augmented for the include dir and the patch
needs to be tweaked to make the binary link to libnl-3 instead of
libnl-gen.

Signed-off-by: Daniel Mack <zonque@gmail.com>
---
 package/iw/iw-libnl-30-support.patch |    2 +-
 package/iw/iw.mk                     |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iw/iw-libnl-30-support.patch b/package/iw/iw-libnl-30-support.patch
index 48a179f..02e818c 100644
--- a/package/iw/iw-libnl-30-support.patch
+++ b/package/iw/iw-libnl-30-support.patch
@@ -20,7 +20,7 @@ Index: b/Makefile
 
 +ifeq ($(NL3FOUND),Y)
 +CFLAGS += -DCONFIG_LIBNL20
-+LIBS += -lnl-genl
++LIBS += -lnl-genl-3
 +NLLIBNAME = libnl-3.0
 +endif
 +
diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index 9f1d65f..65326b7 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -15,7 +15,7 @@ IW_MAKE_ENV = PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
 
 define IW_CONFIGURE_CMDS
 	echo "CC = $(TARGET_CC)" >$(IW_CONFIG)
-	echo "CFLAGS = $(TARGET_CFLAGS)" >>$(IW_CONFIG)
+	echo "CFLAGS = $(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/libnl3/" >>$(IW_CONFIG)
 	echo "LDFLAGS = $(TARGET_LDFLAGS)" >>$(IW_CONFIG)
 endef
 
-- 
1.7.7.3
