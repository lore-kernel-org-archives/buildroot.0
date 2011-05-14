From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 15 May 2011 00:09:52 +0200
Subject: [Buildroot] [git commit] iw: add support for libnl-3.0
Message-ID: <20110515075737.63BAB83521@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=644d8808d274018a2cc67b35b781dff64d66d3a6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/iw/iw-libnl-30-support.patch |   47 ++++++++++++++++++++++++++++++++++
 1 files changed, 47 insertions(+), 0 deletions(-)
 create mode 100644 package/iw/iw-libnl-30-support.patch

diff --git a/package/iw/iw-libnl-30-support.patch b/package/iw/iw-libnl-30-support.patch
new file mode 100644
index 0000000..48a179f
--- /dev/null
+++ b/package/iw/iw-libnl-30-support.patch
@@ -0,0 +1,47 @@
+---
+ Makefile |   10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+Index: b/Makefile
+===================================================================
+--- a/Makefile
++++ b/Makefile
+@@ -24,6 +24,7 @@
+
+ NL1FOUND := $(shell $(PKG_CONFIG) --atleast-version=1 libnl-1 && echo Y)
+ NL2FOUND := $(shell $(PKG_CONFIG) --atleast-version=2 libnl-2.0 && echo Y)
++NL3FOUND := $(shell $(PKG_CONFIG) --atleast-version=3 libnl-3.0 && echo Y)
+
+ ifeq ($(NL1FOUND),Y)
+ NLLIBNAME = libnl-1
+@@ -35,6 +36,12 @@
+ NLLIBNAME = libnl-2.0
+ endif
+
++ifeq ($(NL3FOUND),Y)
++CFLAGS += -DCONFIG_LIBNL20
++LIBS += -lnl-genl
++NLLIBNAME = libnl-3.0
++endif
++
+ ifeq ($(NLLIBNAME),)
+ $(error Cannot find development files for any supported version of libnl)
+ endif
+@@ -53,6 +60,8 @@
+ all: version_check $(ALL)
+
+ version_check:
++ifeq ($(NL3FOUND),Y)
++else
+ ifeq ($(NL2FOUND),Y)
+ else
+ ifeq ($(NL1FOUND),Y)
+@@ -60,6 +69,7 @@
+ 	$(error No libnl found)
+ endif
+ endif
++endif
+
+
+ VERSION_OBJS := $(filter-out version.o, $(OBJS))
+
-- 
1.7.3.4
