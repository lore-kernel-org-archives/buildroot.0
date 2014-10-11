From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 11 Oct 2014 15:30:30 +0200
Subject: [Buildroot] [git commit] canfestival: fix build failure
Message-ID: <20141011133202.A3583B1E4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=241476b5b02fdb454dcc5f24f86e820615d3ea80
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some canfestival python build scripts are not python2 compliant.
So, this patch add a patch allowing to set the python interperter and
set it in the make environment. This pulls a host-python dependency on
canfestival.

This patch has been sent upstream: [1].

Fixes:
  http://autobuild.buildroot.net/results/98d/98dce833dfa8255522af672d4f41c2504c00e64e/

[1] http://sourceforge.net/p/canfestival/mailman/message/32919038/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ival-0002-allow-to-set-python-interpreter.patch |  176 ++++++++++++++++++++
 package/canfestival/canfestival.mk                 |   11 +-
 2 files changed, 185 insertions(+), 2 deletions(-)

diff --git a/package/canfestival/canfestival-0002-allow-to-set-python-interpreter.patch b/package/canfestival/canfestival-0002-allow-to-set-python-interpreter.patch
new file mode 100644
index 0000000..bb60316
--- /dev/null
+++ b/package/canfestival/canfestival-0002-allow-to-set-python-interpreter.patch
@@ -0,0 +1,176 @@
+From s.martin49 at gmail.com Fri Oct 10 23:43:32 2014
+Content-Type: text/plain; charset="us-ascii"
+MIME-Version: 1.0
+Content-Transfer-Encoding: 7bit
+Subject: [PATCH] allow to set python interpreter
+X-Mercurial-Node: 4805f636c2317d989a5f704ba691369f41be6595
+X-Mercurial-Series-Index: 1
+X-Mercurial-Series-Total: 1
+Message-Id: <4805f636c2317d989a5f.1412977412@bobook>
+X-Mercurial-Series-Id: <4805f636c2317d989a5f.1412977412@bobook>
+User-Agent: Mercurial-patchbomb/3.1.2
+Date: Fri, 10 Oct 2014 23:43:32 +0200
+From: Samuel Martin <s.martin49@gmail.com>
+To: canfestival-devel at lists.sourceforge.net
+Cc: Samuel Martin <s.martin49@gmail.com>
+
+# HG changeset patch
+# User "Samuel Martin" <s.martin49@gmail.com>
+# Date 1412977082 -7200
+#      Fri Oct 10 23:38:02 2014 +0200
+# Node ID 4805f636c2317d989a5f704ba691369f41be6595
+# Parent  c408fdc77aa18fcda81db4f0d038e8a69ba84bb2
+allow to set python interpreter
+
+Canfestival python modules and scripts are not python3 compliant.
+
+Allow to pass the python interperter to be used to make.
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+
+diff --git a/Makefile.in b/Makefile.in
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -21,6 +21,9 @@
+ # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ # 
+ 
++PYTHON ?= python
++export PYTHON
++
+ all: objdictedit canfestival examples
+ 
+ examples: canfestival driver
+diff --git a/doc/manual/en/manual.tex b/doc/manual/en/manual.tex
+--- a/doc/manual/en/manual.tex
++++ b/doc/manual/en/manual.tex
+@@ -1134,6 +1134,7 @@
+ 	python objdictedit.py [od files...]
+ \end{verbatim}
+ 
++Note that Gnosis modules only run with python2 as interpreter.
+ 
+ \subsubsection{Installation and usage on Windows}
+ 
+diff --git a/examples/CANOpenShell/Makefile.in b/examples/CANOpenShell/Makefile.in
+--- a/examples/CANOpenShell/Makefile.in
++++ b/examples/CANOpenShell/Makefile.in
+@@ -69,11 +69,11 @@
+ 	
+ CANOpenShellMasterOD.c: CANOpenShellMasterOD.od
+ 	$(MAKE) -C ../../objdictgen gnosis
+-	python ../../objdictgen/objdictgen.py CANOpenShellMasterOD.od CANOpenShellMasterOD.c
++	$(PYTHON) ../../objdictgen/objdictgen.py CANOpenShellMasterOD.od CANOpenShellMasterOD.c
+ 
+ CANOpenShellSlaveOD.c: CANOpenShellSlaveOD.od
+ 	$(MAKE) -C ../../objdictgen gnosis
+-	python ../../objdictgen/objdictgen.py CANOpenShellSlaveOD.od CANOpenShellSlaveOD.c
++	$(PYTHON) ../../objdictgen/objdictgen.py CANOpenShellSlaveOD.od CANOpenShellSlaveOD.c
+ 
+ %.o: %.c
+ 	$(CC) $(CFLAGS) $(PROG_CFLAGS) ${PROGDEFINES} $(INCLUDES) -o $@ -c $<
+diff --git a/examples/DS401_Master/Makefile.in b/examples/DS401_Master/Makefile.in
+--- a/examples/DS401_Master/Makefile.in
++++ b/examples/DS401_Master/Makefile.in
+@@ -53,7 +53,7 @@
+ 	
+ TestMaster.c: TestMaster.od
+ 	$(MAKE) -C ../../objdictgen gnosis
+-	python ../../objdictgen/objdictgen.py TestMaster.od TestMaster.c
++	$(PYTHON) ../../objdictgen/objdictgen.py TestMaster.od TestMaster.c
+ 
+ %.o: %.c
+ 	$(CC) $(CFLAGS) $(PROG_CFLAGS) ${PROGDEFINES} $(INCLUDES) -o $@ -c $<
+diff --git a/examples/DS401_Slave_Gui/Makefile.in b/examples/DS401_Slave_Gui/Makefile.in
+--- a/examples/DS401_Slave_Gui/Makefile.in
++++ b/examples/DS401_Slave_Gui/Makefile.in
+@@ -59,7 +59,7 @@
+ 
+ ObjDict.c: ObjDict.od
+ 	$(MAKE) -C ../../objdictgen gnosis
+-	python ../../objdictgen/objdictgen.py ObjDict.od ObjDict.c
++	$(PYTHON) ../../objdictgen/objdictgen.py ObjDict.od ObjDict.c
+ 
+ .cpp.o:
+ 	$(CXX) -c $(CFLAGS) $(PROG_CFLAGS) ${PROGDEFINES} $(INCLUDES) `wx-config --cxxflags` $< -o $@
+diff --git a/examples/SillySlave/Makefile.in b/examples/SillySlave/Makefile.in
+--- a/examples/SillySlave/Makefile.in
++++ b/examples/SillySlave/Makefile.in
+@@ -53,7 +53,7 @@
+ 	
+ SillySlave.c: SillySlave.od
+ 	$(MAKE) -C ../../objdictgen gnosis
+-	python ../../objdictgen/objdictgen.py SillySlave.od SillySlave.c
++	$(PYTHON) ../../objdictgen/objdictgen.py SillySlave.od SillySlave.c
+ 
+ %.o: %.c
+ 	$(CC) $(CFLAGS) $(PROG_CFLAGS) ${PROGDEFINES} $(INCLUDES) -o $@ -c $<
+diff --git a/examples/TestMasterMicroMod/Makefile.in b/examples/TestMasterMicroMod/Makefile.in
+--- a/examples/TestMasterMicroMod/Makefile.in
++++ b/examples/TestMasterMicroMod/Makefile.in
+@@ -61,7 +61,7 @@
+ 	
+ TestMaster.c: TestMaster.od
+ 	$(MAKE) -C ../../objdictgen gnosis
+-	python ../../objdictgen/objdictgen.py TestMaster.od TestMaster.c
++	$(PYTHON) ../../objdictgen/objdictgen.py TestMaster.od TestMaster.c
+ 
+ %.o: %.c
+ 	$(CC) $(CFLAGS) $(PROG_CFLAGS) ${PROGDEFINES} $(INCLUDES) -o $@ -c $<
+diff --git a/examples/TestMasterSlave/Makefile.in b/examples/TestMasterSlave/Makefile.in
+--- a/examples/TestMasterSlave/Makefile.in
++++ b/examples/TestMasterSlave/Makefile.in
+@@ -69,11 +69,11 @@
+ 	
+ TestSlave.c: TestSlave.od
+ 	$(MAKE) -C ../../objdictgen gnosis
+-	python ../../objdictgen/objdictgen.py TestSlave.od TestSlave.c
++	$(PYTHON) ../../objdictgen/objdictgen.py TestSlave.od TestSlave.c
+ 	
+ TestMaster.c: TestMaster.od
+ 	$(MAKE) -C ../../objdictgen gnosis
+-	python ../../objdictgen/objdictgen.py TestMaster.od TestMaster.c
++	$(PYTHON) ../../objdictgen/objdictgen.py TestMaster.od TestMaster.c
+ 
+ %.o: %.c
+ 	$(CC) $(CFLAGS) $(PROG_CFLAGS) ${PROGDEFINES} $(INCLUDES) -o $@ -c $<
+diff --git a/examples/TestMasterSlaveLSS/Makefile.in b/examples/TestMasterSlaveLSS/Makefile.in
+--- a/examples/TestMasterSlaveLSS/Makefile.in
++++ b/examples/TestMasterSlaveLSS/Makefile.in
+@@ -64,15 +64,15 @@
+ 	
+ TestSlaveA.c: TestSlaveA.od
+ 	$(MAKE) -C ../../objdictgen gnosis
+-	python ../../objdictgen/objdictgen.py TestSlaveA.od TestSlaveA.c
++	$(PYTHON) ../../objdictgen/objdictgen.py TestSlaveA.od TestSlaveA.c
+ 
+ TestSlaveB.c: TestSlaveB.od
+ 	$(MAKE) -C ../../objdictgen gnosis
+-	python ../../objdictgen/objdictgen.py TestSlaveB.od TestSlaveB.c
++	$(PYTHON) ../../objdictgen/objdictgen.py TestSlaveB.od TestSlaveB.c
+ 	
+ TestMaster.c: TestMaster.od
+ 	$(MAKE) -C ../../objdictgen gnosis
+-	python ../../objdictgen/objdictgen.py TestMaster.od TestMaster.c
++	$(PYTHON) ../../objdictgen/objdictgen.py TestMaster.od TestMaster.c
+ 
+ %.o: %.c
+ 	$(CC) $(CFLAGS) $(PROG_CFLAGS) ${PROGDEFINES} $(INCLUDES) -o $@ -c $<
+diff --git a/examples/kerneltest/Makefile.in b/examples/kerneltest/Makefile.in
+--- a/examples/kerneltest/Makefile.in
++++ b/examples/kerneltest/Makefile.in
+@@ -79,10 +79,10 @@
+ 
+ TestSlave.c: TestSlave.od
+ 	$(MAKE) -C ../../objdictgen gnosis
+-	python ../../objdictgen/objdictgen.py TestSlave.od TestSlave.c
++	$(PYTHON) ../../objdictgen/objdictgen.py TestSlave.od TestSlave.c
+ 
+ TestMaster.c: TestMaster.od
+ 	$(MAKE) -C ../../objdictgen gnosis
+-	python ../../objdictgen/objdictgen.py TestMaster.od TestMaster.c
++	$(PYTHON) ../../objdictgen/objdictgen.py TestMaster.od TestMaster.c
+ 	
+ #endif
+
+
diff --git a/package/canfestival/canfestival.mk b/package/canfestival/canfestival.mk
index fb1787e..89e8be5 100644
--- a/package/canfestival/canfestival.mk
+++ b/package/canfestival/canfestival.mk
@@ -14,6 +14,10 @@ CANFESTIVAL_INSTALL_STAGING = YES
 CANFESTIVAL_INSTALLED-y = src drivers
 CANFESTIVAL_INSTALLED-$(BR2_PACKAGE_CANFESTIVAL_INSTALL_EXAMPLES) += examples
 
+# Canfestival provides and used some python modules and scripts only compliant
+# with python2.
+CANFESTIVAL_DEPENDENCIES = host-python
+
 # canfestival uses its own hand-written build-system. Though there is
 # a configure script, it does not use the autotools, so, we use the
 # generic-package infrastructure.
@@ -33,19 +37,22 @@ define CANFESTIVAL_CONFIGURE_CMDS
 endef
 
 define CANFESTIVAL_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) all
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) all \
+		PYTHON=$(HOST_DIR)/usr/bin/python2
 endef
 
 define CANFESTIVAL_INSTALL_TARGET_CMDS
 	for d in $(CANFESTIVAL_INSTALLED-y) ; do \
 		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/$$d install \
-			 DESTDIR=$(TARGET_DIR) || exit 1 ; \
+			PYTHON=$(HOST_DIR)/usr/bin/python2 \
+			DESTDIR=$(TARGET_DIR) || exit 1 ; \
 	done
 endef
 
 define CANFESTIVAL_INSTALL_STAGING_CMDS
 	for d in $(CANFESTIVAL_INSTALLED-y) ; do \
 		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/$$d install \
+			PYTHON=$(HOST_DIR)/usr/bin/python2 \
 			DESTDIR=$(STAGING_DIR) || exit 1 ; \
 	done
 endef
