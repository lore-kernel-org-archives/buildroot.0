From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 15 Mar 2018 20:50:12 +0100
Subject: [Buildroot] [PATCH 1/1] i2pd: new package
Message-ID: <20180315195012.12760-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

i2pd (I2P Daemon) is a full-featured C++ implementation of I2P
client.

I2P (Invisible Internet Protocol) is a universal anonymous
network layer.
All communications over I2P are anonymous and end-to-end
encrypted, participants don't reveal their real IP addresses.

http://i2pd.website

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 ...ix-cmake-error-when-DBUILD_SHARED_LIBS-ON.patch | 28 +++++++++
 package/i2pd/0002-Install-libi2pdclient.patch      | 69 +++++++++++++++++++++
 package/i2pd/Config.in                             | 35 +++++++++++
 package/i2pd/S99i2pd                               | 38 ++++++++++++
 package/i2pd/i2pd.hash                             |  3 +
 package/i2pd/i2pd.mk                               | 71 ++++++++++++++++++++++
 package/i2pd/i2pd.service                          | 29 +++++++++
 9 files changed, 275 insertions(+)
 create mode 100644 package/i2pd/0001-Fix-cmake-error-when-DBUILD_SHARED_LIBS-ON.patch
 create mode 100644 package/i2pd/0002-Install-libi2pdclient.patch
 create mode 100644 package/i2pd/Config.in
 create mode 100644 package/i2pd/S99i2pd
 create mode 100644 package/i2pd/i2pd.hash
 create mode 100644 package/i2pd/i2pd.mk
 create mode 100644 package/i2pd/i2pd.service

diff --git a/DEVELOPERS b/DEVELOPERS
index 3df820e712..364b9f9047 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -652,6 +652,7 @@ F:	package/gupnp/
 F:	package/gupnp-dlna/
 F:	package/gupnp-tools/
 F:	package/hiredis/
+F:	package/i2pd/
 F:	package/igd2-for-linux/
 F:	package/libmpdclient/
 F:	package/libupnp/
diff --git a/package/Config.in b/package/Config.in
index 435f188ec5..d700c11018 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1704,6 +1704,7 @@ menu "Networking applications"
 	source "package/hostapd/Config.in"
 	source "package/hplip/Config.in"
 	source "package/httping/Config.in"
+	source "package/i2pd/Config.in"
 	source "package/ibrdtn-tools/Config.in"
 	source "package/ibrdtnd/Config.in"
 	source "package/ifenslave/Config.in"
diff --git a/package/i2pd/0001-Fix-cmake-error-when-DBUILD_SHARED_LIBS-ON.patch b/package/i2pd/0001-Fix-cmake-error-when-DBUILD_SHARED_LIBS-ON.patch
new file mode 100644
index 0000000000..d30e62f4f3
--- /dev/null
+++ b/package/i2pd/0001-Fix-cmake-error-when-DBUILD_SHARED_LIBS-ON.patch
@@ -0,0 +1,28 @@
+From 6d15be9a32989b0d00312a5b2589e36ba0ea7836 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 4 Mar 2018 18:29:13 +0100
+Subject: [PATCH] Fix cmake error when -DBUILD_SHARED_LIBS=ON
+
+Fixes "CMake Error: TARGETS given no LIBRARY DESTINATION for shared
+library target" by adding LIBRARY parameter to INSTALL call
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ build/CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/build/CMakeLists.txt b/build/CMakeLists.txt
+index 4f875b33..a1c8957b 100644
+--- a/build/CMakeLists.txt
++++ b/build/CMakeLists.txt
+@@ -97,6 +97,7 @@ set_target_properties(libi2pd PROPERTIES PREFIX "")
+ install(TARGETS libi2pd
+   EXPORT libi2pd
+   ARCHIVE DESTINATION lib
++  LIBRARY DESTINATION lib
+   COMPONENT Libraries)
+ # TODO Make libi2pd available to 3rd party projects via CMake as imported target
+ # FIXME This pulls stdafx
+-- 
+2.14.1
+
diff --git a/package/i2pd/0002-Install-libi2pdclient.patch b/package/i2pd/0002-Install-libi2pdclient.patch
new file mode 100644
index 0000000000..1774977965
--- /dev/null
+++ b/package/i2pd/0002-Install-libi2pdclient.patch
@@ -0,0 +1,69 @@
+From 1d934bd543360bfdd40e1501d16d8beb2016ccd8 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 5 Mar 2018 14:55:54 +0100
+Subject: [PATCH] Install libi2pdclient
+
+When building with -DBUILD_SHARED_LIBS=ON, libi2pdclient is not
+installed on target so install it by calling install. Moreover, rename
+i2pdclient to libi2pdclient so library is installed with correct name.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ build/CMakeLists.txt | 16 +++++++++++-----
+ 1 file changed, 11 insertions(+), 5 deletions(-)
+
+diff --git a/build/CMakeLists.txt b/build/CMakeLists.txt
+index a1c8957b..364c3304 100644
+--- a/build/CMakeLists.txt
++++ b/build/CMakeLists.txt
+@@ -120,7 +120,13 @@ set (CLIENT_SRC
+ if(WITH_WEBSOCKETS)
+   list (APPEND CLIENT_SRC "${LIBI2PD_CLIENT_SRC_DIR}/Websocket.cpp")
+ endif ()
+-add_library(i2pdclient ${CLIENT_SRC})
++add_library(libi2pdclient ${CLIENT_SRC})
++set_target_properties(libi2pdclient PROPERTIES PREFIX "")
++install(TARGETS libi2pdclient
++  EXPORT libi2pdclient
++  ARCHIVE DESTINATION lib
++  LIBRARY DESTINATION lib
++  COMPONENT Libraries)
+ 
+ set(DAEMON_SRC_DIR ../daemon)
+ 
+@@ -304,7 +310,7 @@ if (WITH_PCH)
+       WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
+       )
+     target_compile_options(libi2pd PRIVATE /FIstdafx.h /Yustdafx.h /Zm155 "/Fp${CMAKE_BINARY_DIR}/stdafx.dir/$<CONFIG>/stdafx.pch")
+-    target_compile_options(i2pdclient PRIVATE /FIstdafx.h /Yustdafx.h /Zm155 "/Fp${CMAKE_BINARY_DIR}/stdafx.dir/$<CONFIG>/stdafx.pch")
++    target_compile_options(libi2pdclient PRIVATE /FIstdafx.h /Yustdafx.h /Zm155 "/Fp${CMAKE_BINARY_DIR}/stdafx.dir/$<CONFIG>/stdafx.pch")
+   else()
+     string(TOUPPER ${CMAKE_BUILD_TYPE} BTU)
+     get_directory_property(DEFS DEFINITIONS)
+@@ -313,12 +319,12 @@ if (WITH_PCH)
+       COMMAND ${CMAKE_CXX_COMPILER} ${FLAGS} -c ${CMAKE_CURRENT_SOURCE_DIR}/../libi2pd/stdafx.h -o ${CMAKE_BINARY_DIR}/stdafx.h.gch
+     )
+     target_compile_options(libi2pd PRIVATE -include libi2pd/stdafx.h)
+-    target_compile_options(i2pdclient PRIVATE -include libi2pd/stdafx.h)
++    target_compile_options(libi2pdclient PRIVATE -include libi2pd/stdafx.h)
+   endif()
+   target_link_libraries(libi2pd stdafx)
+ endif()
+ 
+-target_link_libraries(i2pdclient libi2pd)
++target_link_libraries(libi2pdclient libi2pd)
+ 
+ find_package ( Boost COMPONENTS system filesystem program_options date_time REQUIRED )
+ if(NOT DEFINED Boost_INCLUDE_DIRS)
+@@ -451,7 +457,7 @@ if (WITH_BINARY)
+   if (WITH_STATIC)
+     set(DL_LIB ${CMAKE_DL_LIBS})
+   endif()
+-  target_link_libraries( "${PROJECT_NAME}" libi2pd i2pdclient ${DL_LIB} ${Boost_LIBRARIES} ${OPENSSL_LIBRARIES} ${ZLIB_LIBRARY} ${CMAKE_THREAD_LIBS_INIT} ${MINGW_EXTRA} ${DL_LIB} ${CMAKE_REQUIRED_LIBRARIES})
++  target_link_libraries( "${PROJECT_NAME}" libi2pd libi2pdclient ${DL_LIB} ${Boost_LIBRARIES} ${OPENSSL_LIBRARIES} ${ZLIB_LIBRARY} ${CMAKE_THREAD_LIBS_INIT} ${MINGW_EXTRA} ${DL_LIB} ${CMAKE_REQUIRED_LIBRARIES})
+ 
+   install(TARGETS "${PROJECT_NAME}" RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR} COMPONENT Runtime)
+   set (APPS "\${CMAKE_INSTALL_PREFIX}/bin/${PROJECT_NAME}${CMAKE_EXECUTABLE_SUFFIX}")
+-- 
+2.14.1
+
diff --git a/package/i2pd/Config.in b/package/i2pd/Config.in
new file mode 100644
index 0000000000..b1a412e75a
--- /dev/null
+++ b/package/i2pd/Config.in
@@ -0,0 +1,35 @@
+config BR2_PACKAGE_I2PD
+	bool "i2pd"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
+	# pthread_condattr_setclock
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR # boost
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_DATE_TIME
+	select BR2_PACKAGE_BOOST_FILESYSTEM
+	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
+	select BR2_PACKAGE_BOOST_SYSTEM
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_ZLIB
+	help
+	  i2pd (I2P Daemon) is a full-featured C++ implementation of I2P
+	  client.
+
+	  I2P (Invisible Internet Protocol) is a universal anonymous
+	  network layer.
+	  All communications over I2P are anonymous and end-to-end
+	  encrypted, participants don't reveal their real IP addresses.
+
+	  http://i2pd.website
+
+comment "i2pd needs a toolchain w/ C++, NPTL, wchar"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_USE_WCHAR
+
+comment "i2pd needs exception_ptr"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/i2pd/S99i2pd b/package/i2pd/S99i2pd
new file mode 100644
index 0000000000..68ba792dd2
--- /dev/null
+++ b/package/i2pd/S99i2pd
@@ -0,0 +1,38 @@
+#!/bin/sh
+
+NAME=i2pd
+PIDFILE=/var/run/$NAME.pid
+DAEMON=/usr/bin/$NAME
+DAEMON_ARGS="--conf=/etc/i2pd/i2pd.conf --tunconf=/etc/i2pd/tunnels.conf --pidfile=/var/run/i2pd.pid --logfile=/var/log/i2pd.log --daemon --service"
+
+start() {
+	printf "Starting $NAME: "
+	$DAEMON $DAEMON_ARGS
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+stop() {
+	printf "Stopping $NAME: "
+	kill $PIDFILE
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+restart() {
+	stop
+	start
+}
+
+case "$1" in
+  start)
+	start
+	;;
+  stop)
+	stop
+	;;
+  restart|reload)
+	restart
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $?
diff --git a/package/i2pd/i2pd.hash b/package/i2pd/i2pd.hash
new file mode 100644
index 0000000000..b7a60c9164
--- /dev/null
+++ b/package/i2pd/i2pd.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256	8834190418de0c4e56c46eb8b9dc4422ef14f1ad7d6591e9daae99493bf7170e	i2pd-2.18.0.tar.gz
+sha256	d147a6acdaf8ec9f6513802ef6cad4a4afcdb5ab6b98d9f6bb26d2b7f4cf454c	LICENSE
diff --git a/package/i2pd/i2pd.mk b/package/i2pd/i2pd.mk
new file mode 100644
index 0000000000..11e7231551
--- /dev/null
+++ b/package/i2pd/i2pd.mk
@@ -0,0 +1,71 @@
+################################################################################
+#
+# i2pd
+#
+################################################################################
+
+I2PD_VERSION = 2.18.0
+I2PD_SITE = $(call github,PurpleI2P,i2pd,$(I2PD_VERSION))
+I2PD_LICENSE = BSD-3-Clause
+I2PD_LICENSE_FILES = LICENSE
+I2PD_SUBDIR = build
+I2PD_DEPENDENCIES = \
+	boost \
+	openssl \
+	zlib
+
+I2PD_CONF_OPTS += -DWITH_GUI=OFF
+
+# The following CMake variable disables a TRY_RUN call in the -pthread
+# test which is not allowed when cross-compiling.
+I2PD_CONF_OPTS += -DTHREADS_PTHREAD_ARG=OFF
+
+ifeq ($(BR2_STATIC_LIBS),y)
+I2PD_CONF_OPTS += -DWITH_STATIC=ON
+else
+I2PD_CONF_OPTS += -DWITH_STATIC=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBMINIUPNPC),y)
+I2PD_DEPENDENCIES += libminiupnpc
+I2PD_CONF_OPTS += -DWITH_UPNP=ON
+else
+I2PD_CONF_OPTS += -DWITH_UPNP=OFF
+endif
+
+define I2PD_INSTALL_CONFIGURATION_FILES
+	$(INSTALL) -D -m 644 $(@D)/contrib/i2pd.conf \
+		$(TARGET_DIR)/etc/i2pd/i2pd.conf
+	$(INSTALL) -D -m 644 $(@D)/contrib/tunnels.conf \
+		$(TARGET_DIR)/etc/i2pd/tunnels.conf
+	mkdir -p $(TARGET_DIR)/var/lib/i2pd
+	cp -a $(@D)/contrib/certificates $(TARGET_DIR)/var/lib/i2pd
+endef
+
+define I2PD_REMOVE_SOURCE_FILES
+	rm -f $(TARGET_DIR)/usr/LICENSE
+	rm -rf $(TARGET_DIR)/usr/src
+endef
+
+I2PD_POST_INSTALL_TARGET_HOOKS += \
+	I2PD_INSTALL_CONFIGURATION_FILES \
+	I2PD_REMOVE_SOURCE_FILES
+
+define I2PD_USERS
+	i2pd -1 i2pd -1 * /var/lib/i2pd - - I2P Daemon
+endef
+
+define I2PD_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/i2pd/S99i2pd \
+		$(TARGET_DIR)/etc/init.d/S99i2pd
+endef
+
+define I2PD_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/i2pd/i2pd.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/i2pd.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../usr/lib/systemd/system/i2pd.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/i2pd.service
+endef
+
+$(eval $(cmake-package))
diff --git a/package/i2pd/i2pd.service b/package/i2pd/i2pd.service
new file mode 100644
index 0000000000..0fdee59532
--- /dev/null
+++ b/package/i2pd/i2pd.service
@@ -0,0 +1,29 @@
+[Unit]
+Description=I2P Router written in C++
+After=network.target
+
+[Service]
+User=i2pd
+Group=i2pd
+RuntimeDirectory=i2pd
+RuntimeDirectoryMode=0700
+LogsDirectory=i2pd
+LogsDirectoryMode=0700
+Type=simple
+ExecStart=/usr/bin/i2pd --conf=/etc/i2pd/i2pd.conf --tunconf=/etc/i2pd/tunnels.conf --pidfile=/run/i2pd/i2pd.pid --logfile=/var/log/i2pd/i2pd.log --daemon --service
+ExecReload=/bin/kill -HUP $MAINPID
+PIDFile=/run/i2pd/i2pd.pid
+### Uncomment, if auto restart needed
+#Restart=on-failure
+
+### Use SIGINT for graceful stop daemon.
+# i2pd stops accepting new tunnels and waits ~10 min while old ones do not die.
+KillSignal=SIGINT
+TimeoutStopSec=10m
+
+# If you have problems with hanging i2pd, you can try enable this
+#LimitNOFILE=4096
+PrivateDevices=yes
+
+[Install]
+WantedBy=multi-user.target
-- 
2.14.1
