From: Martin Bark <martin@barkynet.com>
Date: Thu, 24 Apr 2014 22:19:43 +0100
Subject: [Buildroot] [PATCH 2/3] caps: new package
In-Reply-To: <1398374384-8814-1-git-send-email-martin@barkynet.com>
References: <1398374384-8814-1-git-send-email-martin@barkynet.com>
Message-ID: <1398374384-8814-2-git-send-email-martin@barkynet.com>
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
---
 package/Config.in                            |    1 +
 package/caps/Config.in                       |   12 ++++++
 package/caps/caps-01-cross-compile-fix.patch |   54 ++++++++++++++++++++++++++
 package/caps/caps.mk                         |   21 ++++++++++
 4 files changed, 88 insertions(+)
 create mode 100644 package/caps/Config.in
 create mode 100644 package/caps/caps-01-cross-compile-fix.patch
 create mode 100644 package/caps/caps.mk

diff --git a/package/Config.in b/package/Config.in
index 5956154..33d16ac 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -491,6 +491,7 @@ menu "Libraries"
 menu "Audio/Sound"
 source "package/alsa-lib/Config.in"
 source "package/audiofile/Config.in"
+source "package/caps/Config.in"
 source "package/celt051/Config.in"
 source "package/fdk-aac/Config.in"
 source "package/ladspa-sdk/Config.in"
diff --git a/package/caps/Config.in b/package/caps/Config.in
new file mode 100644
index 0000000..28ff332
--- /dev/null
+++ b/package/caps/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_CAPS
+	bool "caps"
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
diff --git a/package/caps/caps-01-cross-compile-fix.patch b/package/caps/caps-01-cross-compile-fix.patch
new file mode 100644
index 0000000..4667191
--- /dev/null
+++ b/package/caps/caps-01-cross-compile-fix.patch
@@ -0,0 +1,54 @@
+--- caps-0.9.23.original/Makefile	2014-03-13 08:06:40.000000000 +0000
++++ caps-0.9.23/Makefile	2014-04-24 15:29:40.008145963 +0100
+@@ -3,18 +3,18 @@
+ PREFIX = /usr
+ DESTDIR = 
+ 
+-CC = g++
++CXX ?= g++
+ 
+ OPTS = -O3 -ffast-math -funroll-loops -Wall -fPIC -DPIC
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
++CXXFLAGS += $(OPTS) $(_CXXFLAGS)
++LDFLAGS += $(_LDFLAGS) $(CXXFLAGS)
+ 
+ PLUG = caps
+ 
+@@ -48,13 +48,13 @@
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
+@@ -87,9 +87,9 @@
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
diff --git a/package/caps/caps.mk b/package/caps/caps.mk
new file mode 100644
index 0000000..d642bc8
--- /dev/null
+++ b/package/caps/caps.mk
@@ -0,0 +1,21 @@
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
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) all
+endef
+
+define CAPS_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) install DESTDIR=$(TARGET_DIR)
+endef
+
+$(eval $(generic-package))
-- 
1.7.9.5
