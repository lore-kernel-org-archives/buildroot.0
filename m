From: Martin Bark <martin@barkynet.com>
Date: Wed,  6 Aug 2014 01:02:06 +0100
Subject: [Buildroot] [v2 1/2] caps: new package
Message-ID: <1407283327-5150-1-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CAPS is a collection of audio plugins comprising virtual guitar
amplification and a small range of basic classic effects, signal
processors and generators of often elementary and occasionally
exotic nature.

The plugins aim to satisfy the highest demands in sound quality
with maximal computational efficiency and zero latency.

Signed-off-by: Martin Bark <martin@barkynet.com>
CC: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---

Changes v1 -> v2:
  - Added dependency to BR2_INSTALL_LIBSTDCPP (Thomas Petazzoni)
  - Add description and Signed-off-by to patch (Thomas Petazzoni)
  - Fixed use of $(TARGET_CONFIGURE_OPTS) and $(TARGET_MAKE_ENV) (Thomas Petazzoni)

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/Config.in                                |  1 +
 package/caps/Config.in                           | 16 +++++
 package/caps/caps-01-fix-cross-compilation.patch | 79 ++++++++++++++++++++++++
 package/caps/caps.mk                             | 23 +++++++
 4 files changed, 119 insertions(+)
 create mode 100644 package/caps/Config.in
 create mode 100644 package/caps/caps-01-fix-cross-compilation.patch
 create mode 100644 package/caps/caps.mk

diff --git a/package/Config.in b/package/Config.in
index 4520ba6..1a20bee 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -525,6 +525,7 @@ menu "Libraries"
 menu "Audio/Sound"
 	source "package/alsa-lib/Config.in"
 	source "package/audiofile/Config.in"
+	source "package/caps/Config.in"
 	source "package/celt051/Config.in"
 	source "package/fdk-aac/Config.in"
 	source "package/libao/Config.in"
diff --git a/package/caps/Config.in b/package/caps/Config.in
new file mode 100644
index 0000000..5a74c38
--- /dev/null
+++ b/package/caps/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_CAPS
+	bool "caps"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  CAPS is a collection of audio plugins comprising virtual guitar
+	  amplification and a small range of basic classic effects, signal
+	  processors and generators of often elementary and occasionally
+	  exotic nature.
+
+	  The plugins aim to satisfy the highest demands in sound quality
+	  with maximal computational efficiency and zero latency.
+
+	  http://quitte.de/dsp/caps.html
+
+comment "caps needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/caps/caps-01-fix-cross-compilation.patch b/package/caps/caps-01-fix-cross-compilation.patch
new file mode 100644
index 0000000..350eb98
--- /dev/null
+++ b/package/caps/caps-01-fix-cross-compilation.patch
@@ -0,0 +1,79 @@
+From 8b34232d89e81346c6087d94146f35cd2813a638 Mon Sep 17 00:00:00 2001
+From: Martin Bark <martin@barkynet.com>
+Date: Tue, 5 Aug 2014 21:59:23 +0100
+Subject: [PATCH 1/1] Fix cross compilation
+
+Corrections to Makefile to correctly use CXX and CXXFLAGS when compiling
+c++ code.
+
+Signed-off-by: Martin Bark <martin@barkynet.com>
+---
+ Makefile | 21 ++++++++++-----------
+ 1 file changed, 10 insertions(+), 11 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index a519e96..2883ccf 100644
+--- a/Makefile
++++ b/Makefile
+@@ -3,18 +3,18 @@ VERSION = 0.9.23
+ PREFIX = /usr
+ DESTDIR = 
+ 
+-CC = g++
++CXX ?= g++
+ 
+-OPTS = -O3 -ffast-math -funroll-loops -Wall -fPIC -DPIC
++OPTS = -fPIC -DPIC
+ #OPTS = -g -DDEBUG 
+ 
+ _LDFLAGS = -shared 
+-STRIP = strip
++STRIP ?= strip
+ 
+ -include defines.make
+ 
+-CFLAGS += $(OPTS) $(_CFLAGS)
+-LDFLAGS += $(_LDFLAGS) $(CFLAGS)
++override CXXFLAGS += $(OPTS) $(_CXXFLAGS)
++override LDFLAGS += $(_LDFLAGS) $(CXXFLAGS)
+ 
+ PLUG = caps
+ 
+@@ -48,19 +48,18 @@ $(PLUG).rdf: all tools/make-rdf.py
+ 	python tools/make-rdf.py > $(PLUG).rdf
+ 
+ $(PLUG).so: $(OBJECTS)
+-	$(CC) $(ARCH) $(LDFLAGS) -o $@ $(OBJECTS)
++	$(CXX) $(ARCH) $(LDFLAGS) -o $@ $(OBJECTS)
+ 
+ .cc.s: 
+-	$(CC) $(ARCH) $(CFLAGS) -S $<
++	$(CXX) $(ARCH) $(CXXFLAGS) -S $<
+ 
+ .cc.o: depend 
+-	$(CC) $(ARCH) $(CFLAGS) -o $@ -c $<
++	$(CXX) $(ARCH) $(CXXFLAGS) -o $@ -c $<
+ 
+ tags: $(SOURCES) $(HEADERS)
+ 	@-if [ -x /usr/bin/ctags ]; then ctags $(SOURCES) $(HEADERS) >/dev/null 2>&1 ; fi
+ 
+ install: all
+-	@$(STRIP) $(PLUG).so > /dev/null
+ 	install -d $(DESTDIR)$(DEST)
+ 	install -m 644 $(PLUG).so $(DESTDIR)$(DEST)
+ 	install -d $(DESTDIR)$(RDFDEST)
+@@ -87,9 +86,9 @@ version.h:
+ 	@VERSION=$(VERSION) python tools/make-version.h.py
+ 
+ dist: all $(PLUG).rdf version.h
+-	tools/make-dist.py caps $(VERSION) $(CFLAGS)
++	tools/make-dist.py caps $(VERSION) $(CXXFLAGS)
+ 
+ depend: $(SOURCES) $(HEADERS)
+-	$(CC) -MM $(CFLAGS) $(DEFINES) $(SOURCES) > depend
++	$(CXX) -MM $(CXXFLAGS) $(DEFINES) $(SOURCES) > depend
+ 
+ -include depend
+-- 
+1.9.1
+
diff --git a/package/caps/caps.mk b/package/caps/caps.mk
new file mode 100644
index 0000000..8e8c06c
--- /dev/null
+++ b/package/caps/caps.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# caps
+#
+################################################################################
+
+CAPS_VERSION = 0.9.23
+CAPS_SOURCE = caps_$(CAPS_VERSION).tar.bz2
+CAPS_SITE = http://quitte.de/dsp/
+CAPS_LICENSE = GPLv3
+CAPS_LICENSE_FILES = COPYING
+
+define CAPS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		all	-C $(@D)
+endef
+
+define CAPS_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		DESTDIR=$(TARGET_DIR) install -C $(@D)
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
