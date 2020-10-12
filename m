From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 12 Oct 2020 18:19:58 +0200
Subject: [Buildroot] [PATCH v2,1/3] package/daq: fix parallel build
Message-ID: <20201012162000.2750557-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/daq/0002-parallel-grammar.patch | 29 +++++++++++++++++++++++++
 package/daq/daq.mk                      |  6 ++---
 2 files changed, 31 insertions(+), 4 deletions(-)
 create mode 100644 package/daq/0002-parallel-grammar.patch

diff --git a/package/daq/0002-parallel-grammar.patch b/package/daq/0002-parallel-grammar.patch
new file mode 100644
index 0000000000..ba0e256f53
--- /dev/null
+++ b/package/daq/0002-parallel-grammar.patch
@@ -0,0 +1,29 @@
+Fix parallel build
+
+https://bugs.gentoo.org/673390
+
+Downloaded from
+https://gitweb.gentoo.org/repo/gentoo.git/tree/net-libs/daq/files/daq-2.0.6-parallel-grammar.patch
+
+Patch was sent upstream: https://seclists.org/snort/2014/q3/1016
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+--- a/sfbpf/Makefile.am
++++ b/sfbpf/Makefile.am
+@@ -43,13 +43,14 @@
+ libsfbpf_la_LDFLAGS = -version-info 0:1:0 @XCCFLAGS@
+ 
+ # use of $@ and $< here is a GNU idiom that borks BSD
+-sf_scanner.c: $(srcdir)/scanner.l
++sf_scanner.c: $(srcdir)/scanner.l tokdefs.h
+ 	@rm -f $(srcdir)/sf_scanner.c
+ 	$(srcdir)/runlex.sh $(V_LEX) -osf_scanner.c $(srcdir)/scanner.l
+ 
+ sf_scanner.o: sf_scanner.c tokdefs.h
+ 
+ tokdefs.h: sf_grammar.c
++
+ sf_grammar.c: $(srcdir)/grammar.y
+ 	@rm -f sf_grammar.c tokdefs.h
+ 	$(V_YACC) -d $(srcdir)/grammar.y
diff --git a/package/daq/daq.mk b/package/daq/daq.mk
index f0f996ba2c..06983c0b6d 100644
--- a/package/daq/daq.mk
+++ b/package/daq/daq.mk
@@ -10,10 +10,8 @@ DAQ_LICENSE = GPL-2.0
 DAQ_LICENSE_FILES = COPYING
 DAQ_INSTALL_STAGING = YES
 DAQ_DEPENDENCIES = host-bison host-flex
-
-# package does not build in parallel due to improper make rules
-# related to the generation of the tokdefs.h header file
-DAQ_MAKE = $(MAKE1)
+# 0002-parallel-grammar.patch
+DAQ_AUTORECONF = YES
 
 # disable ipq module as libipq is deprecated
 DAQ_CONF_OPTS += --disable-ipq-module
-- 
2.28.0
