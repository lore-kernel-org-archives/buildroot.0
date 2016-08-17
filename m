From: Lothar Felten <lothar.felten@gmail.com>
Date: Wed, 17 Aug 2016 14:34:42 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/simh: new package
Message-ID: <1471437282-14799-1-git-send-email-lothar.felten@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package provides the simh multi-system emulator.
The simh makefile is replaced by a cmake project to handle cross compilation
correctly. Only a subset of the available simulators is built.

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
---
 package/Config.in                                  |   1 +
 .../0001-add-cmake-build-for-cross-compile.patch   | 394 +++++++++++++++++++++
 package/simh/Config.in                             |  10 +
 package/simh/simh.hash                             |   2 +
 package/simh/simh.mk                               |  18 +
 5 files changed, 425 insertions(+)
 create mode 100644 package/simh/0001-add-cmake-build-for-cross-compile.patch
 create mode 100644 package/simh/Config.in
 create mode 100644 package/simh/simh.hash
 create mode 100644 package/simh/simh.mk

diff --git a/package/Config.in b/package/Config.in
index 645fa29..993b446 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -219,6 +219,7 @@ menu "Games"
 	source "package/opentyrian-data/Config.in"
 	source "package/prboom/Config.in"
 	source "package/rubix/Config.in"
+	source "package/simh/Config.in"
 	source "package/sl/Config.in"
 	source "package/stella/Config.in"
 	source "package/supertuxkart/Config.in"
diff --git a/package/simh/0001-add-cmake-build-for-cross-compile.patch b/package/simh/0001-add-cmake-build-for-cross-compile.patch
new file mode 100644
index 0000000..577d5e5
--- /dev/null
+++ b/package/simh/0001-add-cmake-build-for-cross-compile.patch
@@ -0,0 +1,394 @@
+From 29a841225a5e931e26a309f612333a4d98aca720 Mon Sep 17 00:00:00 2001
+From: Lothar Felten <lothar.felten@gmail.com>
+Date: Wed, 17 Aug 2016 11:18:37 +0200
+Subject: [PATCH] add cmake build for cross compile
+
+The default simh makefile has some issues when cross compiling for a different
+architecture. This patch adds CMakeLists.txt so the simh project can be built
+with cmake.
+Only a reduced set of simulators will be built.
+
+Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
+---
+ CMakeLists.txt | 369 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 369 insertions(+)
+ create mode 100644 CMakeLists.txt
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+new file mode 100644
+index 0000000..d6bb0bb
+--- /dev/null
++++ b/CMakeLists.txt
+@@ -0,0 +1,369 @@
++#
++# CMakeLists for simh project
++#
++# The default simh makefile is not suited for cross compile
++# This cmake project for Linux supports only some of the simulators
++#
++# USAGE (out of source build):
++#	- make directory next to simh sources
++#	- cmake <path to simh/CMakeLists.txt>
++#	- run make
++#
++#	example:
++#		git clone https://github.com/simh/simh
++#		mkdir build
++#		cd build
++#		cmake ../simh/
++#		make
++#
++# TODO: 
++#	- add support for Windos/MacOS/...
++#	- build the simulator core as independent library (requires
++#	  code changes because the net/video option is handled at
++#	  compile time)
++#	- add BuildROMs routine
++#	- add all available simulators
++#	- more testing
++#
++# 2016 Lothar Felten <lothar.felten@gmail.com>
++#
++cmake_minimum_required (VERSION 2.8)
++project (simh)
++
++#
++# OPTIONS
++#
++option(BUILD_IBM1130  "build ibm1130 simulator" ON)
++option(BUILD_NOVA     "build nova    simulator" ON)
++option(BUILD_PDP1     "build pdp1    simulator" ON)
++option(BUILD_PDP4     "build pdp4    simulator" ON)
++option(BUILD_PDP7     "build pdp7    simulator" ON)
++option(BUILD_PDP8     "build pdp8    simulator" ON)
++option(BUILD_PDP9     "build pdp9    simulator" ON)
++option(BUILD_PDP10    "build pdp10   simulator" ON)
++option(BUILD_PDP11    "build pdp11   simulator" ON)
++option(BUILD_PDP15    "build pdp15   simulator" ON)
++option(VIDEO          "video option (requires libSDL2)" ON)
++option(NETWORK        "network option (requires libpcap, pthreads)" ON)
++
++#
++# DEBUG
++#
++#set(CMAKE_VERBOSE_MAKEFILE ON)
++
++#
++# EXTERNAL LIBRARIES
++#
++if(UNIX)
++	#add_definitions(-Wall) # very noisy
++	add_definitions(-Wp,-w) # suppress preprocessor warnings
++	set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D_LARGEFILE64_SOURCE")
++	find_library(MATH_LIBRARY m)
++endif(UNIX)
++
++#
++# NETWORK?
++#
++find_library(PCAP_LIBRARY pcap)
++find_library(PTHREAD_LIBRARY pthread)
++if(NETWORK AND PCAP_LIBRARY AND PTHREAD_LIBRARY)
++	set(NETWORK_FLAGS "-DUSE_NETWORK -DHAVE_PCAP_NETWORK")
++	message("network support available (libpcap & pthreads found)")
++	set(ADD_NETWORK)
++elseif(NOT (PCAP_LIBRARY AND PTHREAD_LIBRARY))
++	message("no network support (libpcap & pthreads required)")
++else()
++	message("no network support (disabled)")
++endif()
++
++#
++# VIDEO?
++#
++find_library(SDL2_LIBRARY SDL2)
++if(VIDEO AND SDL2_LIBRARY)
++	find_path(SDL2_INCLUDE_DIR NAMES SDL.h
++		HINTS ${PC_SDL2_INCLUDEDIR} ${PC_SDL2_INCLUDE_DIRS}
++		PATH_SUFFIXES SDL2)
++	set(VIDEO_FLAGS "-I${SDL2_INCLUDE_DIR} -DHAVE_LIBSDL -DUSE_SIM_VIDEO -DUSE_DISPLAY")
++	set(display_source_files
++		display/display.c
++		display/sim_ws.c
++	)
++	set(vt_source_files
++		display/vt11.c
++	)
++	set(ADD_VIDEO)
++	message("video support available (libSDL2 found)")
++elseif(NOT SDL2_LIBRARY)
++	message("no video support (libSDL2 required)")
++else()
++	message("no video support (disabled)")
++endif()
++
++#
++# SIMULATOR FILES
++#
++set(simulator_source_files
++	scp.c
++	sim_console.c
++	sim_fio.c
++	sim_timer.c
++	sim_sock.c
++	sim_tmxr.c
++	sim_ether.c
++	sim_tape.c
++	sim_disk.c
++	sim_serial.c
++	sim_imd.c
++	sim_card.c
++	sim_video.c
++)
++#
++# MACHINE FILES
++#
++set(ibm1130_source_files
++	Ibm1130/ibm1130_cpu.c
++	Ibm1130/ibm1130_cr.c
++	Ibm1130/ibm1130_disk.c
++	Ibm1130/ibm1130_fmt.c
++	Ibm1130/ibm1130_gdu.c
++	Ibm1130/ibm1130_gui.c
++	Ibm1130/ibm1130_plot.c
++	Ibm1130/ibm1130_prt.c
++	Ibm1130/ibm1130_ptrp.c
++	Ibm1130/ibm1130_sca.c
++	Ibm1130/ibm1130_stddev.c
++	Ibm1130/ibm1130_sys.c
++	Ibm1130/ibm1130_t2741.c
++)
++set(nova_source_files
++	NOVA/nova_clk.c
++	NOVA/nova_cpu.c
++	NOVA/nova_dkp.c
++	NOVA/nova_dsk.c
++	NOVA/nova_lp.c
++	NOVA/nova_mta.c
++	NOVA/nova_plt.c
++	NOVA/nova_pt.c
++	NOVA/nova_qty.c
++	NOVA/nova_sys.c
++	NOVA/nova_tt1.c
++	NOVA/nova_tt.c
++)
++set(pdp1_source_files
++	PDP1/pdp1_clk.c
++	PDP1/pdp1_cpu.c
++	PDP1/pdp1_dcs.c
++	PDP1/pdp1_defs.h
++	PDP1/pdp1_diag.txt
++	PDP1/pdp1_dpy.c
++	PDP1/pdp1_drm.c
++	PDP1/pdp1_dt.c
++	PDP1/pdp1_lp.c
++	PDP1/pdp1_stddev.c
++	PDP1/pdp1_sys.c
++)
++set(pdp8_source_files
++	PDP8/pdp8_clk.c
++	PDP8/pdp8_cpu.c
++	PDP8/pdp8_ct.c
++	PDP8/pdp8_df.c
++	PDP8/pdp8_dt.c
++	PDP8/pdp8_fpp.c
++	PDP8/pdp8_lp.c
++	PDP8/pdp8_mt.c
++	PDP8/pdp8_pt.c
++	PDP8/pdp8_rf.c
++	PDP8/pdp8_rk.c
++	PDP8/pdp8_rl.c
++	PDP8/pdp8_rx.c
++	PDP8/pdp8_sys.c
++	PDP8/pdp8_td.c
++	PDP8/pdp8_tsc.c
++	PDP8/pdp8_tt.c
++	PDP8/pdp8_ttx.c
++)
++set(pdp10_source_files
++	PDP10/pdp10_fe.c
++	PDP10/pdp10_cpu.c
++	PDP10/pdp10_ksio.c
++	PDP10/pdp10_lp20.c
++	PDP10/pdp10_mdfp.c
++	PDP10/pdp10_pag.c
++	PDP10/pdp10_rp.c
++	PDP10/pdp10_sys.c
++	PDP10/pdp10_tim.c
++	PDP10/pdp10_tu.c
++	PDP10/pdp10_xtnd.c
++	PDP11/pdp11_pt.c
++	PDP11/pdp11_ry.c
++	PDP11/pdp11_cr.c
++	PDP11/pdp11_dup.c
++	PDP11/pdp11_dmc.c
++	PDP11/pdp11_kmc.c
++	PDP11/pdp11_xu.c
++	PDP11/pdp11_dz.c
++)
++set(pdp11_source_files
++	PDP11/pdp11_cis.c
++	PDP11/pdp11_cpu.c
++	PDP11/pdp11_cpumod.c
++	PDP11/pdp11_cr.c
++	PDP11/pdp11_dc.c
++	PDP11/pdp11_dl.c
++	PDP11/pdp11_dmc.c
++	PDP11/pdp11_dup.c
++	PDP11/pdp11_dz.c
++	PDP11/pdp11_fp.c
++	PDP11/pdp11_hk.c
++	PDP11/pdp11_io.c
++	PDP11/pdp11_io_lib.c
++	PDP11/pdp11_ke.c
++	PDP11/pdp11_kg.c
++	PDP11/pdp11_kmc.c
++	PDP11/pdp11_lp.c
++	PDP11/pdp11_pclk.c
++	PDP11/pdp11_pt.c
++	PDP11/pdp11_rc.c
++	PDP11/pdp11_rf.c
++	PDP11/pdp11_rh.c
++	PDP11/pdp11_rk.c
++	PDP11/pdp11_rl.c
++	PDP11/pdp11_rp.c
++	PDP11/pdp11_rq.c
++	PDP11/pdp11_rs.c
++	PDP11/pdp11_rx.c
++	PDP11/pdp11_ry.c
++	PDP11/pdp11_stddev.c
++	PDP11/pdp11_sys.c
++	PDP11/pdp11_ta.c
++	PDP11/pdp11_tc.c
++	PDP11/pdp11_td.c
++	PDP11/pdp11_tm.c
++	PDP11/pdp11_tq.c
++	PDP11/pdp11_ts.c
++	PDP11/pdp11_tu.c
++	PDP11/pdp11_vh.c
++	PDP11/pdp11_vt.c
++	PDP11/pdp11_xq.c
++	PDP11/pdp11_xu.c
++)
++set(pdp18b_source_files
++	PDP18B/pdp18b_cpu.c
++	PDP18B/pdp18b_drm.c
++	PDP18B/pdp18b_dt.c
++	PDP18B/pdp18b_fpp.c
++	PDP18B/pdp18b_g2tty.c
++	PDP18B/pdp18b_lp.c
++	PDP18B/pdp18b_mt.c
++	PDP18B/pdp18b_rb.c
++	PDP18B/pdp18b_rf.c
++	PDP18B/pdp18b_rp.c
++	PDP18B/pdp18b_stddev.c
++	PDP18B/pdp18b_sys.c
++	PDP18B/pdp18b_tt1.c
++)
++
++#
++# BUILD TARGETS
++#
++if(BUILD_IBM1130)
++	include_directories(.)
++	add_executable(ibm1130 ${ibm1130_source_files} ${simulator_source_files})
++	#set_target_properties(ibm1130 PROPERTIES COMPILE_FLAGS " -DGUI_SUPPORT -lgdi32")#TODO
++	target_link_libraries(ibm1130 m)
++	install (TARGETS ibm1130 DESTINATION bin)
++endif(BUILD_IBM1130)
++
++if(BUILD_NOVA)
++	include_directories(.)
++	add_executable(nova ${nova_source_files} ${simulator_source_files})
++	target_link_libraries(nova m)
++	install (TARGETS nova DESTINATION bin)
++endif(BUILD_NOVA)
++
++if(BUILD_PDP1)
++	include_directories(.)
++	add_executable(pdp1 ${pdp1_source_files} ${simulator_source_files} ${display_source_files})
++	if(ADD_VIDEO)
++		set_target_properties(pdp1 PROPERTIES COMPILE_FLAGS "${CMAKE_C_FLAGS} -DDISPLAY_TYPE=DIS_TYPE30")
++		set_target_properties(pdp1 PROPERTIES COMPILE_FLAGS "${CMAKE_C_FLAGS} -DPIX_SCALE=RES_HALF")
++		set_target_properties(pdp1 PROPERTIES COMPILE_FLAGS "${CMAKE_C_FLAGS} ${VIDEO_FLAGS}")
++		target_link_libraries(pdp1 SDL2)
++	endif(ADD_VIDEO)
++	target_link_libraries(pdp1 m)
++	install (TARGETS pdp1 DESTINATION bin)
++endif(BUILD_PDP1)
++
++if(BUILD_PDP4)
++	include_directories(.)
++	add_executable(pdp4 ${pdp18b_source_files} ${simulator_source_files})
++	set_target_properties(pdp4 PROPERTIES COMPILE_FLAGS "-DPDP4")
++	target_link_libraries(pdp4 m)
++	install (TARGETS pdp4 DESTINATION bin)
++endif(BUILD_PDP4)
++
++if(BUILD_PDP7)
++	include_directories(.)
++	add_executable(pdp7 ${pdp18b_source_files} ${simulator_source_files})
++	set_target_properties(pdp7 PROPERTIES COMPILE_FLAGS "-DPDP7")
++	target_link_libraries(pdp7 m)
++	install (TARGETS pdp7 DESTINATION bin)
++endif(BUILD_PDP7)
++
++if(BUILD_PDP8)
++	include_directories(.)
++	add_executable(pdp8 ${pdp8_source_files} ${simulator_source_files})
++	target_link_libraries(pdp8 m)
++	install (TARGETS pdp8 DESTINATION bin)
++endif(BUILD_PDP8)
++
++if(BUILD_PDP9)
++	include_directories(.)
++	add_executable(pdp9 ${pdp18b_source_files} ${simulator_source_files})
++	set_target_properties(pdp9 PROPERTIES COMPILE_FLAGS "-DPDP9")
++	target_link_libraries(pdp9 m)
++	install (TARGETS pdp9 DESTINATION bin)
++endif(BUILD_PDP9)
++
++if(BUILD_PDP10)
++	include_directories(.)
++	include_directories(PDP10)
++	add_executable(pdp10 ${pdp10_source_files} ${simulator_source_files})
++	set_target_properties(pdp10 PROPERTIES COMPILE_FLAGS "${CMAKE_C_FLAGS} -DVM_PDP10 -DUSE_INT64")
++	target_link_libraries(pdp10 m)
++	if(ADD_NETWORK)
++		message("PDP10 NETWORK!!!!")
++		set_target_properties(pdp10 PROPERTIES COMPILE_FLAGS "${CMAKE_C_FLAGS} ${NETWORK_FLAGS}")
++		target_link_libraries(pdp10 pcap)
++		target_link_libraries(pdp10 pthread)
++	endif(ADD_NETWORK)
++	install (TARGETS pdp10 DESTINATION bin)
++endif(BUILD_PDP10)
++
++if(BUILD_PDP11)
++	include_directories(.)
++	add_executable(pdp11 ${pdp11_source_files} ${simulator_source_files} ${display_source_files}
++		${vt_source_files})
++	set_target_properties(pdp11 PROPERTIES COMPILE_FLAGS "${CMAKE_C_FLAGS} -DVM_PDP11")
++	target_link_libraries(pdp11 m)
++	if(ADD_NETWORK)
++		set_target_properties(pdp11 PROPERTIES COMPILE_FLAGS "${CMAKE_C_FLAGS} ${NETWORK_FLAGS}")
++		target_link_libraries(pdp11 pcap)
++		target_link_libraries(pdp11 pthread)
++	endif(ADD_NETWORK)
++	if(ADD_VIDEO)
++		set_target_properties(pdp11 PROPERTIES COMPILE_FLAGS "${CMAKE_C_FLAGS} ${VIDEO_FLAGS}")
++		target_link_libraries(pdp11 SDL2)
++	endif(ADD_VIDEO)
++	install (TARGETS pdp11 DESTINATION bin)
++endif(BUILD_PDP11)
++
++if(BUILD_PDP15)
++	include_directories(.)
++	add_executable(pdp15 ${pdp18b_source_files} ${simulator_source_files})
++	set_target_properties(pdp15 PROPERTIES COMPILE_FLAGS "-DPDP15")
++	target_link_libraries(pdp15 m)
++	install (TARGETS pdp15 DESTINATION bin)
++endif(BUILD_PDP15)
++
+-- 
+1.9.1
+
diff --git a/package/simh/Config.in b/package/simh/Config.in
new file mode 100644
index 0000000..e38044a
--- /dev/null
+++ b/package/simh/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_SIMH
+	bool "simh"
+	depends on BR2_USE_MMU # fork()
+	help
+	  SIMH is a highly portable, multi-system simulator.
+	  Optional network support requires libpcap and pthreads, video
+	  support requires libSDL2.
+	  Only a subset of the available simulators is built.
+
+	  http://simh.trailing-edge.com
diff --git a/package/simh/simh.hash b/package/simh/simh.hash
new file mode 100644
index 0000000..cb6aeac
--- /dev/null
+++ b/package/simh/simh.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 508667d212c572d3a5bdbd78a6d5d9fc0923784d5a7f06e01f3bf9c27f514bbd simh-946bfd329f9f6624364b266dc66005151c3fc018.tar.gz
diff --git a/package/simh/simh.mk b/package/simh/simh.mk
new file mode 100644
index 0000000..1b576f7
--- /dev/null
+++ b/package/simh/simh.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# simh
+#
+################################################################################
+
+SIMH_VERSION = 946bfd329f9f6624364b266dc66005151c3fc018
+SIMH_SITE = $(call github,simh,simh,$(SIMH_VERSION))
+SIMH_LICENSE = MIT, GPLv2, zlib license
+SIMH_LICENSE_FILES = doc/simh.doc Intel-Systems/common/i8088.c sim_video.c
+
+define SIMH_MOVE_MAKEFILE
+	mv $(@D)/makefile $(@D)/_simh_makefile
+endef
+
+SIMH_PRE_BUILD_HOOKS += SIMH_MOVE_MAKEFILE
+
+$(eval $(cmake-package))
-- 
1.9.1
