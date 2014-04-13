From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 13 Apr 2014 19:41:35 +0200
Subject: [Buildroot] [PATCH v4 2/2] canfestival: new package
In-Reply-To: <1397410895-2290-1-git-send-email-s.martin49@gmail.com>
References: <1397410895-2290-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1397410895-2290-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: Eric Jarrige <eric.jarrige@armadeus.org>
Cc: Julien Boibessot <julien.boibessot@armadeus.com>
Cc: Davide Viti <zinosat@tiscali.it>

---
changes v3 -> v4:
- rebase
- pass --prefix=/usr to the configure call (Davide)
- misc. cleanup in canfestival.mk (Yann)
- keep package/Config.in alphabetically ordered

changes v2 -> v3:
- rename package libcanfestival -> canfestival (follow upstream name)
- add option to install examples
- use latest revision
- use tarball instead of hg clone
- cosmetic fixes and typos (Peter and Yegor)
- add note about the standard mainline can interface (Peter)
- set default max bus number to 1 (Peter)

changes v1 -> v2:
- clean/fix *.mk
---
 package/Config.in                                  |   1 +
 package/canfestival/Config.in                      | 101 +++
 .../canfestival-0001-now-honor-DESTDIR.patch       | 787 +++++++++++++++++++++
 package/canfestival/canfestival.mk                 |  54 ++
 4 files changed, 943 insertions(+)
 create mode 100644 package/canfestival/Config.in
 create mode 100644 package/canfestival/canfestival-0001-now-honor-DESTDIR.patch
 create mode 100644 package/canfestival/canfestival.mk

diff --git a/package/Config.in b/package/Config.in
index 8e6e590..201da62 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -705,6 +705,7 @@ endmenu
 menu "Networking"
 source "package/agentpp/Config.in"
 source "package/c-ares/Config.in"
+source "package/canfestival/Config.in"
 source "package/cppzmq/Config.in"
 source "package/czmq/Config.in"
 source "package/filemq/Config.in"
diff --git a/package/canfestival/Config.in b/package/canfestival/Config.in
new file mode 100644
index 0000000..6deed5d
--- /dev/null
+++ b/package/canfestival/Config.in
@@ -0,0 +1,101 @@
+config BR2_PACKAGE_CANFESTIVAL
+	bool "CanFestival"
+	depends on BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_arm
+	help
+	  CanFestival is an OpenSource CANOpen framework, licensed with GPLv2
+	  and LGPLv2.
+
+	  http://www.canfestival.org
+
+if BR2_PACKAGE_CANFESTIVAL
+
+choice
+	prompt "driver to use"
+	default BR2_PACKAGE_CANFESTIVAL_SOCKET
+
+config BR2_PACKAGE_CANFESTIVAL_ANAGATE_LINUX
+	bool "anagate_linux"
+	help
+	  AnaGate CAN(duo) driver for linux
+
+	  http://www.anagate.de/en/index.html
+
+config BR2_PACKAGE_CANFESTIVAL_PEAK_LINUX
+	bool "peak_linux"
+	help
+	  Linux build host installed Peak driver and library
+
+	  http://www.peak-system.com/linux/
+
+config BR2_PACKAGE_CANFESTIVAL_VIRTUAL
+	bool "virtual"
+	help
+	  Unix pipe based virtual can driver
+
+config BR2_PACKAGE_CANFESTIVAL_VIRTUAL_KERNEL
+	bool "virtual_kernel"
+	help
+	  Kernel module virtual can driver
+
+config BR2_PACKAGE_CANFESTIVAL_SOCKET
+	bool "socket"
+	help
+	  SocketCAN (the standard mainline CAN bus interface).
+
+	  http://developer.berlios.de/projects/socketcan/
+
+config BR2_PACKAGE_CANFESTIVAL_LINCAN
+	bool "lincan"
+	help
+	  Lincan driver
+
+	  http://www.ocera.org/download/components/WP7/lincan-0.3.3.html
+
+config BR2_PACKAGE_CANFESTIVAL_CAN4LINUX
+	bool "can4linux"
+	help
+	  Can4linux driver
+
+	  http://www.port.de/engl/canprod/hw_can4linux.html
+
+config BR2_PACKAGE_CANFESTIVAL_COPCICAN_LINUX
+	bool "copcican_linux"
+	help
+	  User space driver interface for CO-PCICAN card
+
+	  http://www.cosateq.com/
+
+config BR2_PACKAGE_CANFESTIVAL_COPCICAN_COMEDI
+	bool "copcican_comedi"
+	help
+	  COMEDI driver interface for CO-PCICAN card
+
+	  http://www.cosateq.com/
+
+endchoice
+
+config BR2_PACKAGE_CANFESTIVAL_DRIVER
+	string
+	default "anagate_linux"	  if BR2_PACKAGE_CANFESTIVAL_ANAGATE_LINUX
+	default "peak_linux"	  if BR2_PACKAGE_CANFESTIVAL_PEAK_LINUX
+	default "virtual"	  if BR2_PACKAGE_CANFESTIVAL_VIRTUAL
+	default "virtual_kernel"  if BR2_PACKAGE_CANFESTIVAL_VIRTUAL_KERNEL
+	default "socket"	  if BR2_PACKAGE_CANFESTIVAL_SOCKET
+	default "lincan"	  if BR2_PACKAGE_CANFESTIVAL_LINCAN
+	default "can4linux"	  if BR2_PACKAGE_CANFESTIVAL_CAN4LINUX
+	default "copcican_linux"  if BR2_PACKAGE_CANFESTIVAL_COCPICAN_LINUX
+	default "copcican_comedi" if BR2_PACKAGE_CANFESTIVAL_COPCICAN_COMEDI
+
+config BR2_PACKAGE_CANFESTIVAL_ADDITIONAL_OPTIONS
+	string "additional configure options"
+	help
+	  Additional options can be passed directly to the configure script
+	  (e.g.: --MAX_CAN_BUS_ID=..., --SDO_MAX_LENGTH_TRANSFER=...,
+	  --SDO_BLOCK_SIZE=...)
+
+config BR2_PACKAGE_CANFESTIVAL_INSTALL_EXAMPLES
+	bool "install examples"
+	help
+	  Install binary application examples.
+
+endif
diff --git a/package/canfestival/canfestival-0001-now-honor-DESTDIR.patch b/package/canfestival/canfestival-0001-now-honor-DESTDIR.patch
new file mode 100644
index 0000000..7448bd6
--- /dev/null
+++ b/package/canfestival/canfestival-0001-now-honor-DESTDIR.patch
@@ -0,0 +1,787 @@
+From 9b76c8c97344472bc58e38cc28f734687d1a2aab Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Fri, 27 Dec 2013 19:01:02 +0100
+Subject: [PATCH] now honor DESTDIR
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ drivers/can_anagate_linux/Makefile       |  6 +++---
+ drivers/can_anagate_linux/Makefile.in    |  6 +++---
+ drivers/can_anagate_win32/Makefile.in    |  6 +++---
+ drivers/can_can4linux/Makefile.in        |  6 +++---
+ drivers/can_copcican_linux/Makefile.in   |  6 +++---
+ drivers/can_kvaser/Makefile.in           |  6 +++---
+ drivers/can_lincan/Makefile.in           |  6 +++---
+ drivers/can_peak_linux/Makefile.in       |  6 +++---
+ drivers/can_peak_win32/Makefile.in       |  6 +++---
+ drivers/can_serial/Makefile.in           | 12 ++++++------
+ drivers/can_socket/Makefile.in           |  6 +++---
+ drivers/can_tcp_win32/Makefile.in        |  6 +++---
+ drivers/can_virtual/Makefile.in          |  6 +++---
+ drivers/can_vscom/Makefile.in            |  6 +++---
+ drivers/timers_rtai/Makefile.in          |  6 +++---
+ drivers/timers_unix/Makefile.in          |  6 +++---
+ drivers/timers_win32/Makefile.in         |  6 +++---
+ drivers/timers_xeno/Makefile.in          |  6 +++---
+ drivers/unix/Makefile.in                 | 12 ++++++------
+ drivers/win32/Makefile.in                | 12 ++++++------
+ examples/CANOpenShell/Makefile.in        |  6 +++---
+ examples/DS401_Master/Makefile.in        |  6 +++---
+ examples/DS401_Slave_Gui/Makefile.in     |  6 +++---
+ examples/SillySlave/Makefile.in          |  6 +++---
+ examples/TestMasterMicroMod/Makefile.in  |  6 +++---
+ examples/TestMasterSlave/Makefile.in     |  6 +++---
+ examples/TestMasterSlaveLSS/Makefile.in  |  6 +++---
+ examples/kerneltest/Makefile.in          |  6 +++---
+ examples/test_copcican_linux/Makefile.in |  6 +++---
+ objdictgen/Makefile.in                   | 22 +++++++++++-----------
+ src/Makefile.in                          | 18 +++++++++---------
+ 31 files changed, 116 insertions(+), 116 deletions(-)
+
+diff --git a/drivers/can_anagate_linux/Makefile b/drivers/can_anagate_linux/Makefile
+index 13dcdb2..f6c9c3d 100644
+--- a/drivers/can_anagate_linux/Makefile
++++ b/drivers/can_anagate_linux/Makefile
+@@ -43,7 +43,7 @@ else
+ DRIVER = $(OBJS)
+ endif
+ 
+-TARGET_SOFILES = $(PREFIX)/lib/$(DRIVER)
++TARGET_SOFILES = $(DESTDIR)$(PREFIX)/lib/$(DRIVER)
+ 
+ all: driver
+ 
+@@ -56,8 +56,8 @@ libcanfestival_$(CAN_DRIVER).so: $(OBJS)
+ 	$(CC) -shared -Wl,-soname,libcanfestival_$(CAN_DRIVER).so $(CAN_DLL_CFLAGS) -o $@ $<
+ 
+ install: libcanfestival_$(CAN_DRIVER).so
+-	mkdir -p $(PREFIX)/lib/
+-	cp $< $(PREFIX)/lib/
++	mkdir -p $(DESTDIR)$(PREFIX)/lib/
++	cp $< $(DESTDIR)$(PREFIX)/lib/
+ 		
+ uninstall:
+ 	rm -f $(TARGET_SOFILES)
+diff --git a/drivers/can_anagate_linux/Makefile.in b/drivers/can_anagate_linux/Makefile.in
+index 5c96ed1..f665ba4 100644
+--- a/drivers/can_anagate_linux/Makefile.in
++++ b/drivers/can_anagate_linux/Makefile.in
+@@ -43,7 +43,7 @@ else
+ DRIVER = $(OBJS)
+ endif
+ 
+-TARGET_SOFILES = $(PREFIX)/lib/$(DRIVER)
++TARGET_SOFILES = $(DESTDIR)$(PREFIX)/lib/$(DRIVER)
+ 
+ all: driver
+ 
+@@ -56,8 +56,8 @@ libcanfestival_$(CAN_DRIVER).so: $(OBJS)
+ 	$(CC) -shared -Wl,-soname,libcanfestival_$(CAN_DRIVER).so $(CAN_DLL_CFLAGS) -o $@ $<
+ 
+ install: libcanfestival_$(CAN_DRIVER).so
+-	mkdir -p $(PREFIX)/lib/
+-	cp $< $(PREFIX)/lib/
++	mkdir -p $(DESTDIR)$(PREFIX)/lib/
++	cp $< $(DESTDIR)$(PREFIX)/lib/
+ 		
+ uninstall:
+ 	rm -f $(TARGET_SOFILES)
+diff --git a/drivers/can_anagate_win32/Makefile.in b/drivers/can_anagate_win32/Makefile.in
+index dd91125..4081b3a 100644
+--- a/drivers/can_anagate_win32/Makefile.in
++++ b/drivers/can_anagate_win32/Makefile.in
+@@ -46,7 +46,7 @@ DRIVER = $(OBJS)
+ endif
+ 
+ 
+-TARGET_SOFILES = $(PREFIX)/lib/$(DRIVER)
++TARGET_SOFILES = $(DESTDIR)$(PREFIX)/lib/$(DRIVER)
+ 
+ all: driver
+ 
+@@ -69,8 +69,8 @@ $(DRIVER): $(OBJS)
+ 	-Wl,--exclude-libs,ALL -lws2_32
+ 		
+ install: libcanfestival_$(CAN_DRIVER).so
+-	mkdir -p $(PREFIX)/lib/
+-	cp $< $(PREFIX)/lib/
++	mkdir -p $(DESTDIR)$(PREFIX)/lib/
++	cp $< $(DESTDIR)$(PREFIX)/lib/
+ 		
+ uninstall:
+ 	rm -f $(TARGET_SOFILES)
+diff --git a/drivers/can_can4linux/Makefile.in b/drivers/can_can4linux/Makefile.in
+index 32c5cb6..1c2297b 100644
+--- a/drivers/can_can4linux/Makefile.in
++++ b/drivers/can_can4linux/Makefile.in
+@@ -42,7 +42,7 @@ else
+ DRIVER = $(OBJS)
+ endif
+ 
+-TARGET_SOFILES = $(PREFIX)/lib/$(DRIVER)
++TARGET_SOFILES = $(DESTDIR)$(PREFIX)/lib/$(DRIVER)
+ 
+ all: driver
+ 
+@@ -55,8 +55,8 @@ libcanfestival_$(CAN_DRIVER).so: $(OBJS)
+ 	$(CC) -shared -Wl,-soname,libcanfestival_$(CAN_DRIVER).so $(CAN_DLL_CFLAGS) -o $@ $<
+ 
+ install: libcanfestival_$(CAN_DRIVER).so
+-	mkdir -p $(PREFIX)/lib/
+-	cp $< $(PREFIX)/lib/
++	mkdir -p $(DESTDIR)$(PREFIX)/lib/
++	cp $< $(DESTDIR)$(PREFIX)/lib/
+ 	
+ uninstall:
+ 	rm -f $(TARGET_HFILES)
+diff --git a/drivers/can_copcican_linux/Makefile.in b/drivers/can_copcican_linux/Makefile.in
+index 8800b2e..4d917f6 100644
+--- a/drivers/can_copcican_linux/Makefile.in
++++ b/drivers/can_copcican_linux/Makefile.in
+@@ -45,7 +45,7 @@ else
+ DRIVER = $(OBJS)
+ endif
+ 
+-TARGET_SOFILES = $(PREFIX)/lib/$(DRIVER)
++TARGET_SOFILES = $(DESTDIR)$(PREFIX)/lib/$(DRIVER)
+ 
+ all: driver
+ 
+@@ -58,8 +58,8 @@ libcanfestival_$(CAN_DRIVER).so: $(OBJS)
+ 	$(CC) -shared -Wl,-soname,libcanfestival_$(CAN_DRIVER).so $(CAN_DLL_CFLAGS) -o $@ $<
+ 
+ install: libcanfestival_$(CAN_DRIVER).so
+-	mkdir -p $(PREFIX)/lib/
+-	cp $< $(PREFIX)/lib/
++	mkdir -p $(DESTDIR)$(PREFIX)/lib/
++	cp $< $(DESTDIR)$(PREFIX)/lib/
+ 
+ uninstall:
+ 	rm -f $(TARGET_SOFILES)
+diff --git a/drivers/can_kvaser/Makefile.in b/drivers/can_kvaser/Makefile.in
+index b8e177c..93f8bc4 100644
+--- a/drivers/can_kvaser/Makefile.in
++++ b/drivers/can_kvaser/Makefile.in
+@@ -52,7 +52,7 @@ else
+ DRIVER = $(OBJS)
+ endif
+ 
+-TARGET_SOFILES = $(PREFIX)/lib/$(DRIVER)
++TARGET_SOFILES = $(DESTDIR)$(PREFIX)/lib/$(DRIVER)
+ 
+ all: driver
+ 
+@@ -65,8 +65,8 @@ $(DRIVER): $(OBJS)
+ 	$(CC) -shared -Wl,-soname,$(DRIVER) $(CAN_DLL_CFLAGS) -o $@ $< 
+ 
+ install: $(DRIVER)
+-	mkdir -p $(PREFIX)/lib/
+-	cp $< $(PREFIX)/lib/
++	mkdir -p $(DESTDIR)$(PREFIX)/lib/
++	cp $< $(DESTDIR)$(PREFIX)/lib/
+ 		
+ uninstall:
+ 	rm -f $(TARGET_SOFILES)
+diff --git a/drivers/can_lincan/Makefile.in b/drivers/can_lincan/Makefile.in
+index 32c5cb6..1c2297b 100644
+--- a/drivers/can_lincan/Makefile.in
++++ b/drivers/can_lincan/Makefile.in
+@@ -42,7 +42,7 @@ else
+ DRIVER = $(OBJS)
+ endif
+ 
+-TARGET_SOFILES = $(PREFIX)/lib/$(DRIVER)
++TARGET_SOFILES = $(DESTDIR)$(PREFIX)/lib/$(DRIVER)
+ 
+ all: driver
+ 
+@@ -55,8 +55,8 @@ libcanfestival_$(CAN_DRIVER).so: $(OBJS)
+ 	$(CC) -shared -Wl,-soname,libcanfestival_$(CAN_DRIVER).so $(CAN_DLL_CFLAGS) -o $@ $<
+ 
+ install: libcanfestival_$(CAN_DRIVER).so
+-	mkdir -p $(PREFIX)/lib/
+-	cp $< $(PREFIX)/lib/
++	mkdir -p $(DESTDIR)$(PREFIX)/lib/
++	cp $< $(DESTDIR)$(PREFIX)/lib/
+ 	
+ uninstall:
+ 	rm -f $(TARGET_HFILES)
+diff --git a/drivers/can_peak_linux/Makefile.in b/drivers/can_peak_linux/Makefile.in
+index 20713ca..936586d 100644
+--- a/drivers/can_peak_linux/Makefile.in
++++ b/drivers/can_peak_linux/Makefile.in
+@@ -43,7 +43,7 @@ else
+ DRIVER = $(OBJS)
+ endif
+ 
+-TARGET_SOFILES = $(PREFIX)/lib/$(DRIVER)
++TARGET_SOFILES = $(DESTDIR)$(PREFIX)/lib/$(DRIVER)
+ 
+ all: driver
+ 
+@@ -56,8 +56,8 @@ libcanfestival_$(CAN_DRIVER).so: $(OBJS)
+ 	$(CC) -shared -Wl,-soname,libcanfestival_$(CAN_DRIVER).so -o $@ $< $(CAN_DLL_CFLAGS)
+ 
+ install: libcanfestival_$(CAN_DRIVER).so
+-	mkdir -p $(PREFIX)/lib/
+-	cp $< $(PREFIX)/lib/
++	mkdir -p $(DESTDIR)$(PREFIX)/lib/
++	cp $< $(DESTDIR)$(PREFIX)/lib/
+ 		
+ uninstall:
+ 	rm -f $(TARGET_SOFILES)
+diff --git a/drivers/can_peak_win32/Makefile.in b/drivers/can_peak_win32/Makefile.in
+index f29df6c..8e388b1 100644
+--- a/drivers/can_peak_win32/Makefile.in
++++ b/drivers/can_peak_win32/Makefile.in
+@@ -45,7 +45,7 @@ else
+ DRIVER = $(OBJS)
+ endif
+ 
+-TARGET_SOFILES = $(PREFIX)/lib/$(DRIVER)
++TARGET_SOFILES = $(DESTDIR)$(PREFIX)/lib/$(DRIVER)
+ 
+ all: driver
+ 
+@@ -63,8 +63,8 @@ cyg$(CAN_DRIVER).dll: $(OBJS)
+ 	-Wl,--exclude-libs,ALL
+ 		
+ install: libcanfestival_$(CAN_DRIVER).so
+-	mkdir -p $(PREFIX)/lib/
+-	cp $< $(PREFIX)/lib/
++	mkdir -p $(DESTDIR)$(PREFIX)/lib/
++	cp $< $(DESTDIR)$(PREFIX)/lib/
+ 		
+ uninstall:
+ 	rm -f $(TARGET_SOFILES)
+diff --git a/drivers/can_serial/Makefile.in b/drivers/can_serial/Makefile.in
+index 5f79bbe..0a53850 100644
+--- a/drivers/can_serial/Makefile.in
++++ b/drivers/can_serial/Makefile.in
+@@ -46,8 +46,8 @@ endif
+ 
+ HUB=can_serial_hub
+ 
+-TARGET_SOFILES = $(PREFIX)/lib/$(DRIVER)
+-TARGET_BINFILES = $(PREFIX)/bin/$(HUB)
++TARGET_SOFILES = $(DESTDIR)$(PREFIX)/lib/$(DRIVER)
++TARGET_BINFILES = $(DESTDIR)$(PREFIX)/bin/$(HUB)
+ 
+ all: driver $(HUB)
+ 
+@@ -63,10 +63,10 @@ libcanfestival_$(CAN_DRIVER).so: $(OBJS)
+ 	$(CC) -shared -Wl,-soname,libcanfestival_$(CAN_DRIVER).so $(CAN_DLL_CFLAGS) -o $@ $<
+ 
+ install: libcanfestival_$(CAN_DRIVER).so $(HUB)
+-	mkdir -p $(PREFIX)/lib/
+-	cp libcanfestival_$(CAN_DRIVER).so $(PREFIX)/lib/
+-	mkdir -p $(PREFIX)/bin/
+-	cp $(HUB) $(PREFIX)/bin/
++	mkdir -p $(DESTDIR)$(PREFIX)/lib/
++	cp libcanfestival_$(CAN_DRIVER).so $(DESTDIR)$(PREFIX)/lib/
++	mkdir -p $(DESTDIR)$(PREFIX)/bin/
++	cp $(HUB) $(DESTDIR)$(PREFIX)/bin/
+ 	
+ uninstall:
+ 	rm -f $(TARGET_SOFILES)
+diff --git a/drivers/can_socket/Makefile.in b/drivers/can_socket/Makefile.in
+index c46e3a0..fd8e251 100644
+--- a/drivers/can_socket/Makefile.in
++++ b/drivers/can_socket/Makefile.in
+@@ -43,7 +43,7 @@ else
+ DRIVER = $(OBJS)
+ endif
+ 
+-TARGET_SOFILES = $(PREFIX)/lib/$(DRIVER)
++TARGET_SOFILES = $(DESTDIR)$(PREFIX)/lib/$(DRIVER)
+ 
+ all: driver
+ 
+@@ -56,8 +56,8 @@ libcanfestival_$(CAN_DRIVER).so: $(OBJS)
+ 	$(CC) -shared -Wl,-soname,libcanfestival_$(CAN_DRIVER).so $(CAN_DLL_CFLAGS) -o $@ $<
+ 
+ install: libcanfestival_$(CAN_DRIVER).so
+-	mkdir -p $(PREFIX)/lib/
+-	cp $< $(PREFIX)/lib/
++	mkdir -p $(DESTDIR)$(PREFIX)/lib/
++	cp $< $(DESTDIR)$(PREFIX)/lib/
+ 	
+ uninstall:
+ 	rm -f $(TARGET_SOFILES)
+diff --git a/drivers/can_tcp_win32/Makefile.in b/drivers/can_tcp_win32/Makefile.in
+index 45fe849..24a3c9b 100755
+--- a/drivers/can_tcp_win32/Makefile.in
++++ b/drivers/can_tcp_win32/Makefile.in
+@@ -47,7 +47,7 @@ endif
+ 
+ SERVER = $(CAN_DRIVER)_server
+ 
+-TARGET_SOFILES = $(PREFIX)/lib/$(DRIVER)
++TARGET_SOFILES = $(DESTDIR)$(PREFIX)/lib/$(DRIVER)
+ 
+ all: driver
+ 
+@@ -74,8 +74,8 @@ $(DRIVER): $(OBJS)
+ 	-Wl,--exclude-libs,ALL -lws2_32
+ 		
+ install: libcanfestival_$(CAN_DRIVER).so
+-	mkdir -p $(PREFIX)/lib/
+-	cp $< $(PREFIX)/lib/
++	mkdir -p $(DESTDIR)$(PREFIX)/lib/
++	cp $< $(DESTDIR)$(PREFIX)/lib/
+ 		
+ uninstall:
+ 	rm -f $(TARGET_SOFILES)
+diff --git a/drivers/can_virtual/Makefile.in b/drivers/can_virtual/Makefile.in
+index e543a95..3de5d47 100644
+--- a/drivers/can_virtual/Makefile.in
++++ b/drivers/can_virtual/Makefile.in
+@@ -43,7 +43,7 @@ else
+ DRIVER = $(OBJS)
+ endif
+ 
+-TARGET_SOFILES = $(PREFIX)/lib/$(DRIVER)
++TARGET_SOFILES = $(DESTDIR)$(PREFIX)/lib/$(DRIVER)
+ 
+ all: driver
+ 
+@@ -56,8 +56,8 @@ libcanfestival_$(CAN_DRIVER).so: $(OBJS)
+ 	$(CC) -shared -Wl,-soname,libcanfestival_$(CAN_DRIVER).so $(CAN_DLL_CFLAGS) -o $@ $<
+ 
+ install: libcanfestival_$(CAN_DRIVER).so
+-	mkdir -p $(PREFIX)/lib/
+-	cp $< $(PREFIX)/lib/
++	mkdir -p $(DESTDIR)$(PREFIX)/lib/
++	cp $< $(DESTDIR)$(PREFIX)/lib/
+ 	
+ uninstall:
+ 	rm -f $(TARGET_SOFILES)
+diff --git a/drivers/can_vscom/Makefile.in b/drivers/can_vscom/Makefile.in
+index 53b3985..b527793 100755
+--- a/drivers/can_vscom/Makefile.in
++++ b/drivers/can_vscom/Makefile.in
+@@ -61,7 +61,7 @@ else
+ DRIVER = $(OBJS)
+ endif
+ 
+-TARGET_SOFILES = $(PREFIX)/lib/$(DRIVER)
++TARGET_SOFILES = $(DESTDIR)$(PREFIX)/lib/$(DRIVER)
+ 
+ all: driver
+ 
+@@ -83,8 +83,8 @@ libcanfestival_$(CAN_DRIVER).$(DLL_TYPE): $(OBJS)
+ 	$(CC) $(PROG_CFLAGS) -shared $(CAN_VSCOM_DLL_FLAGS) -o $@ $< $(CAN_DLL_CFLAGS)
+ 
+ install: libcanfestival_$(CAN_DRIVER).so
+-	mkdir -p $(PREFIX)/lib/
+-	cp $< $(PREFIX)/lib/
++	mkdir -p $(DESTDIR)$(PREFIX)/lib/
++	cp $< $(DESTDIR)$(PREFIX)/lib/
+ 
+ uninstall:
+ 	rm -f $(TARGET_SOFILES)
+diff --git a/drivers/timers_rtai/Makefile.in b/drivers/timers_rtai/Makefile.in
+index 4efd4c7..b2d56e4 100755
+--- a/drivers/timers_rtai/Makefile.in
++++ b/drivers/timers_rtai/Makefile.in
+@@ -38,7 +38,7 @@ OBJS = $(TIMERS_DRIVER).o
+ 
+ SRC_HFILES = ../../include/$(TIMERS_DRIVER)/timerscfg.h
+ 
+-TARGET_HFILES = $(PREFIX)/include/canfestival/timerscfg.h
++TARGET_HFILES = $(DESTDIR)$(PREFIX)/include/canfestival/timerscfg.h
+ 
+ all: driver
+ 
+@@ -48,8 +48,8 @@ driver: $(OBJS)
+ 	$(CC) $(CFLAGS) $(PROG_CFLAGS) ${PROGDEFINES} $(INCLUDES) -o $@ -c $<
+ 
+ install:
+-	mkdir -p $(PREFIX)/include/canfestival
+-	cp $(SRC_HFILES) $(PREFIX)/include/canfestival
++	mkdir -p $(DESTDIR)$(PREFIX)/include/canfestival
++	cp $(SRC_HFILES) $(DESTDIR)$(PREFIX)/include/canfestival
+ 
+ uninstall:
+ 	rm -f $(TARGET_HFILES)
+diff --git a/drivers/timers_unix/Makefile.in b/drivers/timers_unix/Makefile.in
+index 856ddcb..1761466 100644
+--- a/drivers/timers_unix/Makefile.in
++++ b/drivers/timers_unix/Makefile.in
+@@ -38,7 +38,7 @@ OBJS = $(TIMERS_DRIVER).o
+ 
+ SRC_HFILES = ../../include/$(TIMERS_DRIVER)/timerscfg.h
+ 
+-TARGET_HFILES = $(PREFIX)/include/canfestival/timerscfg.h
++TARGET_HFILES = $(DESTDIR)$(PREFIX)/include/canfestival/timerscfg.h
+ 
+ all: driver
+ 
+@@ -48,8 +48,8 @@ driver: $(OBJS)
+ 	$(CC) $(CFLAGS) $(PROG_CFLAGS) ${PROGDEFINES} $(INCLUDES) -o $@ -c $<
+ 
+ install:
+-	mkdir -p $(PREFIX)/include/canfestival
+-	cp $(SRC_HFILES) $(PREFIX)/include/canfestival
++	mkdir -p $(DESTDIR)$(PREFIX)/include/canfestival
++	cp $(SRC_HFILES) $(DESTDIR)$(PREFIX)/include/canfestival
+ 
+ uninstall:
+ 	rm -f $(TARGET_HFILES)
+diff --git a/drivers/timers_win32/Makefile.in b/drivers/timers_win32/Makefile.in
+index 31bcdd5..bb08a04 100755
+--- a/drivers/timers_win32/Makefile.in
++++ b/drivers/timers_win32/Makefile.in
+@@ -40,7 +40,7 @@ OBJS = $(TIMERS_DRIVER).o
+ 
+ SRC_HFILES = ../../include/$(TIMERS_DRIVER)/timerscfg.h
+ 
+-TARGET_HFILES = $(PREFIX)/include/canfestival/timerscfg.h
++TARGET_HFILES = $(DESTDIR)$(PREFIX)/include/canfestival/timerscfg.h
+ 
+ all: driver
+ 
+@@ -50,8 +50,8 @@ driver: $(OBJS)
+ 	$(CXX) $(CFLAGS) $(PROG_CFLAGS) ${PROGDEFINES} $(INCLUDES) -o $@ -c $<
+ 
+ install:
+-	mkdir -p $(PREFIX)/include/canfestival
+-	cp $(SRC_HFILES) $(PREFIX)/include/canfestival
++	mkdir -p $(DESTDIR)$(PREFIX)/include/canfestival
++	cp $(SRC_HFILES) $(DESTDIR)$(PREFIX)/include/canfestival
+ 
+ uninstall:
+ 	rm -f $(TARGET_HFILES)
+diff --git a/drivers/timers_xeno/Makefile.in b/drivers/timers_xeno/Makefile.in
+index 4efd4c7..b2d56e4 100644
+--- a/drivers/timers_xeno/Makefile.in
++++ b/drivers/timers_xeno/Makefile.in
+@@ -38,7 +38,7 @@ OBJS = $(TIMERS_DRIVER).o
+ 
+ SRC_HFILES = ../../include/$(TIMERS_DRIVER)/timerscfg.h
+ 
+-TARGET_HFILES = $(PREFIX)/include/canfestival/timerscfg.h
++TARGET_HFILES = $(DESTDIR)$(PREFIX)/include/canfestival/timerscfg.h
+ 
+ all: driver
+ 
+@@ -48,8 +48,8 @@ driver: $(OBJS)
+ 	$(CC) $(CFLAGS) $(PROG_CFLAGS) ${PROGDEFINES} $(INCLUDES) -o $@ -c $<
+ 
+ install:
+-	mkdir -p $(PREFIX)/include/canfestival
+-	cp $(SRC_HFILES) $(PREFIX)/include/canfestival
++	mkdir -p $(DESTDIR)$(PREFIX)/include/canfestival
++	cp $(SRC_HFILES) $(DESTDIR)$(PREFIX)/include/canfestival
+ 
+ uninstall:
+ 	rm -f $(TARGET_HFILES)
+diff --git a/drivers/unix/Makefile.in b/drivers/unix/Makefile.in
+index 4f41105..2e582e1 100644
+--- a/drivers/unix/Makefile.in
++++ b/drivers/unix/Makefile.in
+@@ -51,7 +51,7 @@ endif
+ 
+ SRC_HFILES = ../../include/$(TARGET)/applicfg.h ../../include/$(TARGET)/canfestival.h
+ 
+-TARGET_HFILES = $(PREFIX)/include/$(TARGET)/applicfg.h $(PREFIX)/include/$(TARGET)/canfestival.h
++TARGET_HFILES = $(DESTDIR)$(PREFIX)/include/$(TARGET)/applicfg.h $(DESTDIR)$(PREFIX)/include/$(TARGET)/canfestival.h
+ 
+ all: driver
+ 
+@@ -104,13 +104,13 @@ libcanfestival_$(TARGET).a: $(OBJS)
+ 	$(BINUTILS_PREFIX)ranlib $@
+ 
+ install: libcanfestival_$(TARGET).a
+-	mkdir -p $(PREFIX)/lib/
+-	mkdir -p $(PREFIX)/include/canfestival
+-	cp libcanfestival_$(TARGET).a $(PREFIX)/lib/
+-	cp $(SRC_HFILES) $(PREFIX)/include/canfestival
++	mkdir -p $(DESTDIR)$(PREFIX)/lib/
++	mkdir -p $(DESTDIR)$(PREFIX)/include/canfestival
++	cp libcanfestival_$(TARGET).a $(DESTDIR)$(PREFIX)/lib/
++	cp $(SRC_HFILES) $(DESTDIR)$(PREFIX)/include/canfestival
+ 
+ uninstall:
+-	rm -f $(PREFIX)/lib/libcanfestival_$(TARGET).a
++	rm -f $(DESTDIR)$(PREFIX)/lib/libcanfestival_$(TARGET).a
+ 	rm -f $(TARGET_HFILES)
+ 
+ clean:
+diff --git a/drivers/win32/Makefile.in b/drivers/win32/Makefile.in
+index c791dc0..560d797 100755
+--- a/drivers/win32/Makefile.in
++++ b/drivers/win32/Makefile.in
+@@ -47,7 +47,7 @@ endif
+ 
+ SRC_HFILES = ../../include/$(TARGET)/applicfg.h ../../include/$(TARGET)/canfestival.h
+ 
+-TARGET_HFILES = $(PREFIX)/include/$(TARGET)/applicfg.h $(PREFIX)/include/$(TARGET)/canfestival.h
++TARGET_HFILES = $(DESTDIR)$(PREFIX)/include/$(TARGET)/applicfg.h $(DESTDIR)$(PREFIX)/include/$(TARGET)/canfestival.h
+ 
+ all: driver
+ 
+@@ -71,13 +71,13 @@ libcanfestival_$(TARGET).a: $(OBJS)
+ 	$(BINUTILS_PREFIX)ranlib $@
+ 
+ install: libcanfestival_$(TARGET).a
+-	mkdir -p $(PREFIX)/lib/
+-	mkdir -p $(PREFIX)/include/canfestival
+-	cp libcanfestival_$(TARGET).a $(PREFIX)/lib/
+-	cp $(SRC_HFILES) $(PREFIX)/include/canfestival
++	mkdir -p $(DESTDIR)$(PREFIX)/lib/
++	mkdir -p $(DESTDIR)$(PREFIX)/include/canfestival
++	cp libcanfestival_$(TARGET).a $(DESTDIR)$(PREFIX)/lib/
++	cp $(SRC_HFILES) $(DESTDIR)$(PREFIX)/include/canfestival
+ 
+ uninstall:
+-	rm -f $(PREFIX)/lib/libcanfestival_$(TARGET).a
++	rm -f $(DESTDIR)$(PREFIX)/lib/libcanfestival_$(TARGET).a
+ 	rm -f $(TARGET_HFILES)
+ 
+ clean:
+diff --git a/examples/CANOpenShell/Makefile.in b/examples/CANOpenShell/Makefile.in
+index 3524bce..fd4ef98 100755
+--- a/examples/CANOpenShell/Makefile.in
++++ b/examples/CANOpenShell/Makefile.in
+@@ -87,8 +87,8 @@ mrproper: clean
+ 	rm -f CANOpenShellSlaveOD.c
+ 
+ install: $(CANOPENSHELL)
+-	mkdir -p $(PREFIX)/bin/
+-	cp $< $(PREFIX)/bin/
++	mkdir -p $(DESTDIR)$(PREFIX)/bin/
++	cp $< $(DESTDIR)$(PREFIX)/bin/
+ 	
+ uninstall:
+-	rm -f $(PREFIX)/bin/$(CANOPENSHELL)
+\ No newline at end of file
++	rm -f $(DESTDIR)$(PREFIX)/bin/$(CANOPENSHELL)
+\ No newline@end of file
+diff --git a/examples/DS401_Master/Makefile.in b/examples/DS401_Master/Makefile.in
+index 441750b..131ef57 100644
+--- a/examples/DS401_Master/Makefile.in
++++ b/examples/DS401_Master/Makefile.in
+@@ -66,10 +66,10 @@ mrproper: clean
+ 	rm -f TestMaster.c
+ 	
+ install: DS401_Master
+-	mkdir -p $(PREFIX)/bin/
+-	cp $< $(PREFIX)/bin/
++	mkdir -p $(DESTDIR)$(PREFIX)/bin/
++	cp $< $(DESTDIR)$(PREFIX)/bin/
+ 	
+ uninstall:
+-	rm -f $(PREFIX)/bin/DS401_Master
++	rm -f $(DESTDIR)$(PREFIX)/bin/DS401_Master
+ 
+ 
+diff --git a/examples/DS401_Slave_Gui/Makefile.in b/examples/DS401_Slave_Gui/Makefile.in
+index f600eb7..6b93151 100644
+--- a/examples/DS401_Slave_Gui/Makefile.in
++++ b/examples/DS401_Slave_Gui/Makefile.in
+@@ -75,11 +75,11 @@ mrproper: clean
+ 	$(RM) $(EXEC) $(DEPEND_FILE)
+ 	
+ install: DS401_Slave_Gui
+-	mkdir -p $(PREFIX)/bin/
+-	cp $< $(PREFIX)/bin/
++	mkdir -p $(DESTDIR)$(PREFIX)/bin/
++	cp $< $(DESTDIR)$(PREFIX)/bin/
+ 	
+ uninstall:
+-	rm -f $(PREFIX)/bin/DS401_Slave_Gui
++	rm -f $(DESTDIR)$(PREFIX)/bin/DS401_Slave_Gui
+ 
+ $(EXEC): $(OBJS)
+ 	$(LD) $(OBJS) `wx-config --libs` -o $(EXEC)
+diff --git a/examples/SillySlave/Makefile.in b/examples/SillySlave/Makefile.in
+index 4ec1d59..6580d80 100644
+--- a/examples/SillySlave/Makefile.in
++++ b/examples/SillySlave/Makefile.in
+@@ -66,10 +66,10 @@ mrproper: clean
+ 	rm -f SillySlave.c
+ 	
+ install: SillySlave
+-	mkdir -p $(PREFIX)/bin/
+-	cp $< $(PREFIX)/bin/
++	mkdir -p $(DESTDIR)$(PREFIX)/bin/
++	cp $< $(DESTDIR)$(PREFIX)/bin/
+ 	
+ uninstall:
+-	rm -f $(PREFIX)/bin/SillySlave
++	rm -f $(DESTDIR)$(PREFIX)/bin/SillySlave
+ 
+ 
+diff --git a/examples/TestMasterMicroMod/Makefile.in b/examples/TestMasterMicroMod/Makefile.in
+index c75cec0..54fe7ff 100644
+--- a/examples/TestMasterMicroMod/Makefile.in
++++ b/examples/TestMasterMicroMod/Makefile.in
+@@ -74,10 +74,10 @@ mrproper: clean
+ 	rm -f TestMaster.c
+ 	
+ install: TestMasterMicroMod
+-	mkdir -p $(PREFIX)/bin/
+-	cp $< $(PREFIX)/bin/
++	mkdir -p $(DESTDIR)$(PREFIX)/bin/
++	cp $< $(DESTDIR)$(PREFIX)/bin/
+ 	
+ uninstall:
+-	rm -f $(PREFIX)/bin/TestMasterMicroMod
++	rm -f $(DESTDIR)$(PREFIX)/bin/TestMasterMicroMod
+ 
+ 
+diff --git a/examples/TestMasterSlave/Makefile.in b/examples/TestMasterSlave/Makefile.in
+index 579d11d..132ce20 100644
+--- a/examples/TestMasterSlave/Makefile.in
++++ b/examples/TestMasterSlave/Makefile.in
+@@ -87,11 +87,11 @@ mrproper: clean
+ 	rm -f TestMaster.c
+ 	
+ install: TestMasterSlave
+-	mkdir -p $(PREFIX)/bin/
+-	cp $< $(PREFIX)/bin/
++	mkdir -p $(DESTDIR)$(PREFIX)/bin/
++	cp $< $(DESTDIR)$(PREFIX)/bin/
+ 	
+ uninstall:
+-	rm -f $(PREFIX)/bin/TestMasterSlave
++	rm -f $(DESTDIR)$(PREFIX)/bin/TestMasterSlave
+ 
+ 
+ 
+diff --git a/examples/TestMasterSlaveLSS/Makefile.in b/examples/TestMasterSlaveLSS/Makefile.in
+index ccdf7f1..17d2a34 100644
+--- a/examples/TestMasterSlaveLSS/Makefile.in
++++ b/examples/TestMasterSlaveLSS/Makefile.in
+@@ -87,11 +87,11 @@ mrproper: clean
+ 	rm -f TestMaster.c
+ 	
+ install: TestMasterSlaveLSS
+-	mkdir -p $(PREFIX)/bin/
+-	cp $< $(PREFIX)/bin/
++	mkdir -p $(DESTDIR)$(PREFIX)/bin/
++	cp $< $(DESTDIR)$(PREFIX)/bin/
+ 	
+ uninstall:
+-	rm -f $(PREFIX)/bin/TestMasterSlaveLSS
++	rm -f $(DESTDIR)$(PREFIX)/bin/TestMasterSlaveLSS
+ 
+ 
+ 
+diff --git a/examples/kerneltest/Makefile.in b/examples/kerneltest/Makefile.in
+index b469822..f3cf884 100644
+--- a/examples/kerneltest/Makefile.in
++++ b/examples/kerneltest/Makefile.in
+@@ -67,12 +67,12 @@ mrproper: clean
+ 
+ install:
+ 	$(MAKE) -C $(KERNELDIR) M=$(shell pwd) modules_install
+-	mkdir -p $(PREFIX)/bin/
+-	cp console/canf_ktest_console $(PREFIX)/bin/
++	mkdir -p $(DESTDIR)$(PREFIX)/bin/
++	cp console/canf_ktest_console $(DESTDIR)$(PREFIX)/bin/
+ 	/bin/sh insert.sh
+ 
+ uninstall:
+-	rm -f $(PREFIX)/bin/canf_ktest_console
++	rm -f $(DESTDIR)$(PREFIX)/bin/canf_ktest_console
+ 
+ canf_ktest_console: console/console.c console/console.h
+ 	$(CC) console/console.c -o console/canf_ktest_console
+diff --git a/examples/test_copcican_linux/Makefile.in b/examples/test_copcican_linux/Makefile.in
+index c018a39..583816e 100644
+--- a/examples/test_copcican_linux/Makefile.in
++++ b/examples/test_copcican_linux/Makefile.in
+@@ -67,10 +67,10 @@ mrproper: clean
+ 	rm -f test_copcican_linux.c
+ 
+ install: test_copcican_linux
+-	mkdir -p $(PREFIX)/bin/
+-	cp $< $(PREFIX)/bin/
++	mkdir -p $(DESTDIR)$(PREFIX)/bin/
++	cp $< $(DESTDIR)$(PREFIX)/bin/
+ 
+ uninstall:
+-	rm -f $(PREFIX)/bin/test_copcican_linux
++	rm -f $(DESTDIR)$(PREFIX)/bin/test_copcican_linux
+ 
+ 
+diff --git a/objdictgen/Makefile.in b/objdictgen/Makefile.in
+index 81855a9..f104660 100644
+--- a/objdictgen/Makefile.in
++++ b/objdictgen/Makefile.in
+@@ -35,19 +35,19 @@ gnosis/version.py:
+ 	rm -rf gnosis_extract
+ 
+ install: gnosis
+-	mkdir -p $(PREFIX)/objdictgen
+-	cp -r *.py* config doc doc_index locale examples gnosis *.ico $(PREFIX)/objdictgen
+-	chmod -R a+r $(PREFIX)/objdictgen
+-	mkdir -p $(PREFIX)/bin
+-	ln -sf $(PREFIX)/objdictgen/objdictedit.py $(PREFIX)/bin/objdictedit
+-	chmod 755 $(PREFIX)/objdictgen/objdictedit.py
+-	ln -sf $(PREFIX)/objdictgen/objdictgen.py $(PREFIX)/bin/objdictgen
+-	chmod 755 $(PREFIX)/objdictgen/objdictgen.py
++	mkdir -p $(DESTDIR)$(PREFIX)/objdictgen
++	cp -r *.py* config doc doc_index locale examples gnosis *.ico $(DESTDIR)$(PREFIX)/objdictgen
++	chmod -R a+r $(DESTDIR)$(PREFIX)/objdictgen
++	mkdir -p $(DESTDIR)$(PREFIX)/bin
++	ln -sf $(DESTDIR)$(PREFIX)/objdictgen/objdictedit.py $(DESTDIR)$(PREFIX)/bin/objdictedit
++	chmod 755 $(DESTDIR)$(PREFIX)/objdictgen/objdictedit.py
++	ln -sf $(DESTDIR)$(PREFIX)/objdictgen/objdictgen.py $(DESTDIR)$(PREFIX)/bin/objdictgen
++	chmod 755 $(DESTDIR)$(PREFIX)/objdictgen/objdictgen.py
+ 
+ uninstall:
+-	rm -rf $(PREFIX)/objdictgen
+-	rm -f $(PREFIX)/bin/objdictedit
+-	rm -f $(PREFIX)/bin/objdictgen
++	rm -rf $(DESTDIR)$(PREFIX)/objdictgen
++	rm -f $(DESTDIR)$(PREFIX)/bin/objdictedit
++	rm -f $(DESTDIR)$(PREFIX)/bin/objdictgen
+ 
+ clean:
+ 
+diff --git a/src/Makefile.in b/src/Makefile.in
+index 2790deb..e709f4f 100644
+--- a/src/Makefile.in
++++ b/src/Makefile.in
+@@ -94,11 +94,11 @@ clean:
+ 
+ install:
+ 	$(MAKE) -C $(KERNELDIR) M=$(shell pwd) modules_install
+-	mkdir -p $(PREFIX)/include/canfestival
+-	cp ../include/*.h $(PREFIX)/include/canfestival
++	mkdir -p $(DESTDIR)$(PREFIX)/include/canfestival
++	cp ../include/*.h $(DESTDIR)$(PREFIX)/include/canfestival
+ 
+ uninstall:
+-	rm -rf $(PREFIX)/include/canfestival
++	rm -rf $(DESTDIR)$(PREFIX)/include/canfestival
+ 
+ else
+ CFLAGS = SUB_OPT_CFLAGS
+@@ -132,14 +132,14 @@ $(TARGET)_%.o: %.c
+ 	$(CC) $(CFLAGS) $(PROG_CFLAGS) ${PROGDEFINES} $(INCLUDES) -o $@ -c $<
+ 
+ install: libcanfestival.a
+-	mkdir -p $(PREFIX)/lib/
+-	mkdir -p $(PREFIX)/include/canfestival
+-	cp libcanfestival.a $(PREFIX)/lib/
+-	cp ../include/*.h $(PREFIX)/include/canfestival
++	mkdir -p $(DESTDIR)$(PREFIX)/lib/
++	mkdir -p $(DESTDIR)$(PREFIX)/include/canfestival
++	cp libcanfestival.a $(DESTDIR)$(PREFIX)/lib/
++	cp ../include/*.h $(DESTDIR)$(PREFIX)/include/canfestival
+ 
+ uninstall:
+-	rm -f $(PREFIX)/lib/libcanfestival.a
+-	rm -rf $(PREFIX)/include/canfestival
++	rm -f $(DESTDIR)$(PREFIX)/lib/libcanfestival.a
++	rm -rf $(DESTDIR)$(PREFIX)/include/canfestival
+ 
+ clean:
+ 	rm -f $(OBJS) libcanfestival.a libcanfestival.o
+-- 
+1.8.5.2
+
diff --git a/package/canfestival/canfestival.mk b/package/canfestival/canfestival.mk
new file mode 100644
index 0000000..a9576ae
--- /dev/null
+++ b/package/canfestival/canfestival.mk
@@ -0,0 +1,54 @@
+################################################################################
+#
+# canfestival
+#
+################################################################################
+
+# Revision 789:
+CANFESTIVAL_VERSION = a82d867e7850
+CANFESTIVAL_SOURCE = $(CANFESTIVAL_VERSION).tar.bz2
+CANFESTIVAL_SITE = http://dev.automforge.net/CanFestival-3/archive
+CANFESTIVAL_DEPENDENCIES = linux
+# Runtime code is licensed LGPLv2, whereas accompanying developer tools and few
+# drivers (virtual_kernel, lincan and copcican_linux) are licensed GPLv2.
+CANFESTIVAL_LICENSE = LGPLv2.1, GPLv2
+CANFESTIVAL_LICENSE_FILES = COPYING, LICENCE
+CANFESTIVAL_INSTALL_STAGING = YES
+CANFESTIVAL_INSTALLED-y = src drivers
+CANFESTIVAL_INSTALLED-$(BR2_PACKAGE_CANFESTIVAL_INSTALL_EXAMPLES) += examples
+
+define CANFESTIVAL_CONFIGURE_CMDS
+	cd $(@D) && \
+		$(TARGET_CONFIGURE_OPTS) ./configure \
+		--target=unix \
+		--arch=$(BR2_ARCH) \
+		--kerneldir=$(LINUX_DIR) \
+		--timers=unix \
+		--binutils=$(TARGET_CROSS) \
+		--cc="$(TARGET_CC)" \
+		--cxx="$(TARGET_CC)" \
+		--ld="$(TARGET_CC)" \
+		--prefix=/usr \
+		--can=$(BR2_PACKAGE_CANFESTIVAL_DRIVER) \
+		$(call qstrip,$(BR2_PACKAGE_CANFESTIVAL_ADDITIONAL_OPTIONS))
+endef
+
+define CANFESTIVAL_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) all
+endef
+
+define CANFESTIVAL_INSTALL_TARGET_CMDS
+	for d in $(CANFESTIVAL_INSTALLED-y) ; do \
+		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/$$d install \
+			DESTDIR=$(TARGET_DIR) ; \
+	done
+endef
+
+define CANFESTIVAL_INSTALL_STAGING_CMDS
+	for d in $(CANFESTIVAL_INSTALLED-y) ; do \
+		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/$$d install \
+			DESTDIR=$(STAGING_DIR) ; \
+	done
+endef
+
+$(eval $(generic-package))
-- 
1.9.2
