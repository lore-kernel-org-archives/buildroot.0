From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed,  9 Nov 2011 15:57:52 +0100
Subject: [Buildroot] [PATCH 1/2] iw: bump to 3.2
In-Reply-To: <1320850673-24222-1-git-send-email-yegorslists@googlemail.com>
References: <1320850673-24222-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1320850673-24222-2-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

version 3.2 provides support for libnl 3.x, so remove the relevant patch

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/iw/iw-libnl-30-support.patch |   47 ----------------------------------
 package/iw/iw.mk                     |    2 +-
 2 files changed, 1 insertions(+), 48 deletions(-)
 delete mode 100644 package/iw/iw-libnl-30-support.patch

diff --git a/package/iw/iw-libnl-30-support.patch b/package/iw/iw-libnl-30-support.patch
deleted file mode 100644
index 48a179f..0000000
--- a/package/iw/iw-libnl-30-support.patch
+++ /dev/null
@@ -1,47 +0,0 @@
----
- Makefile |   10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-Index: b/Makefile
-===================================================================
---- a/Makefile
-+++ b/Makefile
-@@ -24,6 +24,7 @@
-
- NL1FOUND := $(shell $(PKG_CONFIG) --atleast-version=1 libnl-1 && echo Y)
- NL2FOUND := $(shell $(PKG_CONFIG) --atleast-version=2 libnl-2.0 && echo Y)
-+NL3FOUND := $(shell $(PKG_CONFIG) --atleast-version=3 libnl-3.0 && echo Y)
-
- ifeq ($(NL1FOUND),Y)
- NLLIBNAME = libnl-1
-@@ -35,6 +36,12 @@
- NLLIBNAME = libnl-2.0
- endif
-
-+ifeq ($(NL3FOUND),Y)
-+CFLAGS += -DCONFIG_LIBNL20
-+LIBS += -lnl-genl
-+NLLIBNAME = libnl-3.0
-+endif
-+
- ifeq ($(NLLIBNAME),)
- $(error Cannot find development files for any supported version of libnl)
- endif
-@@ -53,6 +60,8 @@
- all: version_check $(ALL)
-
- version_check:
-+ifeq ($(NL3FOUND),Y)
-+else
- ifeq ($(NL2FOUND),Y)
- else
- ifeq ($(NL1FOUND),Y)
-@@ -60,6 +69,7 @@
- 	$(error No libnl found)
- endif
- endif
-+endif
-
-
- VERSION_OBJS := $(filter-out version.o, $(OBJS))
-
diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index 9f1d65f..ab6c676 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-IW_VERSION = 3.1
+IW_VERSION = 3.2
 IW_SOURCE = iw-$(IW_VERSION).tar.bz2
 IW_SITE = http://wireless.kernel.org/download/iw
 IW_DEPENDENCIES = host-pkg-config libnl
-- 
1.7.1.1
