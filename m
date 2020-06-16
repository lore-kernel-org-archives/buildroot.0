From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 16 Jun 2020 20:59:49 +0200
Subject: [Buildroot] [PATCH v4 0/2] package/libcamera: bump version to
 96fab38
Message-ID: <20200616185951.30319-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tested on RPi3/RPi4 with linux-5.4.45-v7l kernel and updated
rpi-firmware package, Qt-5.14.2:

First try:

	$ qcam -platform linuxfb -c ov5647
0:00:25.696380706] [241]  INFO IPAManager ipa_manager.cpp:136 libcamera is not installed. Adding '//src/ipa' to the IPA search path
[0:00:25.712675651] [241]  INFO Camera camera_manager.cpp:280 libcamera v0.0.0
[0:00:25.785788355] [243]  INFO IPAProxy ipa_proxy.cpp:190 libcamera is not installed. Loading proxy workers from '//src/libcamera/proxy/worker'
[0:00:25.785931355] [243] ERROR IPAProxy ipa_proxy_linux.cpp:59 Failed to get proxy worker path
[0:00:25.786016077] [243] ERROR IPAManager ipa_manager.cpp:296 Failed to load proxy
[0:00:25.786108077] [243] ERROR RPI raspberrypi.cpp:925 Failed to load a suitable IPA library
Camera ov5647 not found

With the following patch libcamera is forced to believe it is running
in a installed environment:

diff --git a/src/libcamera/utils.cpp b/src/libcamera/utils.cpp
index d55338f..4ff9dac 100644
--- a/src/libcamera/utils.cpp
+++ b/src/libcamera/utils.cpp
@@ -346,15 +346,18 @@ details::StringSplitter split(const std::string &str, const std::string &delim)
  */
 bool isLibcameraInstalled()
 {
+#if 0
 	/*
 	 * DT_RUNPATH (DT_RPATH when the linker uses old dtags) is removed on
 	 * install.
 	 */
 	for (const ElfW(Dyn) *dyn = _DYNAMIC; dyn->d_tag != DT_NULL; ++dyn) {
-		if (dyn->d_tag == DT_RUNPATH || dyn->d_tag == DT_RPATH)
+		if (dyn->d_tag == DT_RUNPATH || dyn->d_tag == DT_RPATH) {
+			printf("XXXXX - dyn->d_un.d_ptr: %s\n", (char*)dyn->d_un.d_ptr);
 			return false;
+		}
 	}
-
+#endif
 	return true;
 }
 

Maybe this is because of the buildroot local meson patch ([1]), leading
to an empty (but not absent) RPATH?

With this patch applied, next try:

	$ qcam -platform linuxfb -c ov5647
[   60.656531] random: crng init done
[0:01:00.797904315] [248]  INFO Camera camera_manager.cpp:280 libcamera v0.0.0
[0:01:01.248904870] [248]  INFO Camera camera.cpp:770 configuring streams: (0) 800x600-0x34325241
[0:01:01.249270722] [249]  INFO RPI raspberrypi.cpp:115 Mode: 2592x1944 fmt BG10 Score: 2284 (best 2284)
[0:01:01.249425945] [249]  INFO RPI raspberrypi.cpp:115 Mode: 1920x1080 fmt BG10 Score: 2066.67 (best 2066.67)
[0:01:01.249534278] [249]  INFO RPI raspberrypi.cpp:115 Mode: 1296x972 fmt BG10 Score: 1717 (best 1717)
[0:01:01.249633315] [249]  INFO RPI raspberrypi.cpp:115 Mode: 640x480 fmt BG10 Score: 2060 (best 1717)
[0:01:01.249731593] [249]  INFO RPI raspberrypi.cpp:115 Mode: 640x480 fmt BA81 Score: 3060 (best 1717)
[0:01:01.249828611] [249]  INFO RPI raspberrypi.cpp:115 Mode: 2592x1944 fmt pBAA Score: 1784 (best 1717)
[0:01:01.249922500] [249]  INFO RPI raspberrypi.cpp:115 Mode: 1920x1080 fmt pBAA Score: 1566.67 (best 1566.67)
[0:01:01.250069815] [249]  INFO RPI raspberrypi.cpp:115 Mode: 1296x972 fmt pBAA Score: 1217 (best 1217)
[0:01:01.250169482] [249]  INFO RPI raspberrypi.cpp:115 Mode: 640x480 fmt pBAA Score: 1560 (best 1217)
[0:01:01.250298593] [249]  INFO RPI raspberrypi.cpp:619 Sensor: ov5647 - Selected mode: 1296x972-pBAA
Zero-copy enabled
[0:01:01.319715019] [249] FATAL default raspberrypi.cpp:791 assertion "data->staggeredCtrl_" failed
Backtrace:
/usr/lib/libcamera.so(_ZN9libcamera18PipelineHandlerRPi5startEPNS_6CameraE+0x164) [0xb6eb432c]
/usr/lib/libcamera.so(_ZN9libcamera15BoundMethodArgsIiJPNS_6CameraEEE10invokePackEPNS_19BoundMethodPackBaseE+0x18) [0xb6e7f670]
/usr/lib/libcamera.so(_ZN9libcamera6Object7messageEPNS_7MessageE+0x1c) [0xb6e9eafc]
/usr/lib/libcamera.so(_ZN9libcamera6Thread16dispatchMessagesEv+0xfc) [0xb6ea3f44]
/usr/lib/libcamera.so(_ZN9libcamera19EventDispatcherPoll13processEventsEv+0x14) [0xb6e92d08]
/usr/lib/libcamera.so(_ZN9libcamera6Thread4execEv+0x54) [0xb6ea3e0c]
/usr/lib/libcamera.so(_ZN9libcamera13CameraManager7Private3runEv+0xa8) [0xb6e80f44]
/usr/lib/libstdc++.so.6(+0x9bddc) [0xb6104ddc]
Aborted


Running with LIBCAMERA_LOG_LEVELS=DEBUG gives:

[...]
[0:02:18.061949510] [251] DEBUG IPAModule ipa_module.cpp:330 ipa_rpi.so: IPA module /usr/lib/libcamera/ipa_rpi.so is signed
[...]
[0:02:18.125804232] [252] DEBUG IPAManager ipa_manager.cpp:316 IPA module /usr/lib/libcamera/ipa_rpi.so signature is not valid
[0:02:18.126069417] [252] DEBUG IPAProxy ipa_proxy_linux.cpp:50 initializing dummy proxy: loading IPA from /usr/lib/libcamera/ipa_rpi.so
[...]

This can be avoided with the following patch/hack (disable signature check):

diff --git a/src/libcamera/ipa_manager.cpp b/src/libcamera/ipa_manager.cpp
index 505cf61..3d64898 100644
--- a/src/libcamera/ipa_manager.cpp
+++ b/src/libcamera/ipa_manager.cpp
@@ -301,6 +301,9 @@ std::unique_ptr<IPAProxy> IPAManager::createIPA(PipelineHandler *pipe,
 
 bool IPAManager::isSignatureValid(IPAModule *ipa) const
 {
+#if 1
+	return true;
+#else
 #if HAVE_IPA_PUBKEY
 	File file{ ipa->path() };
 	if (!file.open(File::ReadOnly))
@@ -320,6 +323,7 @@ bool IPAManager::isSignatureValid(IPAModule *ipa) const
 #else
 	return false;
 #endif
+#endif
 }
 
 } /* namespace libcamera */


Maybe related to the buildroot finalize and/or sanitizing RPATH in target tree
step (and/or strip after install with BR2_ENABLE_DEBUG=y/BR2_STRIP_strip=y
enabled)?

Final run (success):

	$ qcam -platform linuxfb -c ov5647
[0:06:20.379361328] [265]  INFO Camera camera_manager.cpp:280 libcamera v0.0.0
[0:06:20.490928995] [265]  INFO Camera camera.cpp:770 configuring streams: (0) 800x600-0x34325241
[0:06:20.491250069] [266]  INFO RPI raspberrypi.cpp:115 Mode: 2592x1944 fmt BG10 Score: 2284 (best 2284)
[0:06:20.491406162] [266]  INFO RPI raspberrypi.cpp:115 Mode: 1920x1080 fmt BG10 Score: 2066.67 (best 2066.67)
[0:06:20.491511180] [266]  INFO RPI raspberrypi.cpp:115 Mode: 1296x972 fmt BG10 Score: 1717 (best 1717)
[0:06:20.491607439] [266]  INFO RPI raspberrypi.cpp:115 Mode: 640x480 fmt BG10 Score: 2060 (best 1717)
[0:06:20.491704680] [266]  INFO RPI raspberrypi.cpp:115 Mode: 640x480 fmt BA81 Score: 3060 (best 1717)
[0:06:20.491800495] [266]  INFO RPI raspberrypi.cpp:115 Mode: 2592x1944 fmt pBAA Score: 1784 (best 1717)
[0:06:20.491893162] [266]  INFO RPI raspberrypi.cpp:115 Mode: 1920x1080 fmt pBAA Score: 1566.67 (best 1566.67)
[0:06:20.491988439] [266]  INFO RPI raspberrypi.cpp:115 Mode: 1296x972 fmt pBAA Score: 1217 (best 1217)
[0:06:20.492080773] [266]  INFO RPI raspberrypi.cpp:115 Mode: 640x480 fmt pBAA Score: 1560 (best 1217)
[0:06:20.492207291] [266]  INFO RPI raspberrypi.cpp:619 Sensor: ov5647 - Selected mode: 1296x972-pBAA
[0:06:20.494765217] [266]  INFO RPI_S_W staggered_ctrl.cpp:36 Init ctrl 0x00980911 with delay 2
[0:06:20.494887717] [266]  INFO RPI_S_W staggered_ctrl.cpp:36 Init ctrl 0x009e0903 with delay 2
[0:06:20.494973365] [266] ERROR V4L2 v4l2_device.cpp:287 /dev/video0[cap]: Control 0x00980915 not found
Zero-copy enabled
[  380.670935] vc_sm_cma_import_dmabuf_internal: Expecting an uncached alias for dma_addr 0x0000000020700000
[  380.680776] vc_sm_cma_import_dmabuf_internal: Expecting an uncached alias for dma_addr 0x0000000020800000
[  380.690605] vc_sm_cma_import_dmabuf_internal: Expecting an uncached alias for dma_addr 0x0000000020900000
[  380.700408] vc_sm_cma_import_dmabuf_internal: Expecting an uncached alias for dma_addr 0x0000000020a00000
[  380.712664] vc_sm_cma_import_dmabuf_internal: Expecting an uncached alias for dma_addr 0x000000001ed50000
[  380.722464] vc_sm_cma_import_dmabuf_internal: Expecting an uncached alias for dma_addr 0x000000001ed54000
[  380.732327] vc_sm_cma_import_dmabuf_internal: Expecting an uncached alias for dma_addr 0x000000001ed58000
[  380.742145] vc_sm_cma_import_dmabuf_internal: Expecting an uncached alias for dma_addr 0x000000001ed5c000
[  380.754943] vc_sm_cma_import_dmabuf_internal: Expecting an uncached alias for dma_addr 0x000000001f700000
[  380.767326] vc_sm_cma_import_dmabuf_internal: Expecting an uncached alias for dma_addr 0x000000001ff00000
[0:06:20.782425402] [266]  INFO RPI raspb[  380.790404] vc_sm_cma_import_dmabuf_internal: Expecting an uncached alias for dma_addr 0x0000000020100000
errypi.cpp:1461 Dropping frame at the request of the IPA
[0:06:20.807450587] [266]  INFO R[  380.815266] vc_sm_cma_import_dmabuf_internal: Expecting an uncached alias for dma_addr 0x0000000020300000
PI raspberrypi.cpp:1461 Dropping frame at the request of the IPA
[0:06:20.833070754] [266]  INFO RPI raspb[  380.841383] vc_sm_cma_import_dmabuf_internal: Expecting an uncached alias for dma_addr 0x0000000020500000
errypi.cpp:1461 Dropping frame at the request of the IPA
[0:06:20.858214865] [266]  INFO RPI raspberrypi.cpp:1461 Dropping frame at the request of the IPA
[0:06:20.871768532] [266]  INFO RPI raspberrypi.cpp:1461 Dropping frame at the request of the IPA
[0:06:20.884721476] [266]  INFO RPI raspberrypi.cpp:1461 Dropping frame at the request of the IPA
seq: 000006 bytesused: 1920000 timestamp: 380874300000 fps: 0.00
[  380.939540] vc_sm_cma_import_dmabuf_internal: Expecting an uncached alias for dma_addr 0x000000001f900000
[  380.974173] vc_sm_cma_import_dmabuf_internal: Expecting an uncached alias for dma_addr 0x000000001fb00000
[  381.008864] vc_sm_cma_import_dmabuf_internal: Expecting an uncached alias for dma_addr 0x000000001fd00000
seq: 000007 bytesused: 1920000 timestamp: 380908989000 fps: 28.83
seq: 000008 bytesused: 1920000 timestamp: 380943681000 fps: 28.83
seq: 000009 bytesused: 1920000 timestamp: 380978370000 fps: 28.83
seq: 000010 bytesused: 1920000 timestamp: 381013062000 fps: 28.83
seq: 000011 bytesused: 1920000 timestamp: 381047752000 fps: 28.83
seq: 000012 bytesused: 1920000 timestamp: 381082441000 fps: 28.83
seq: 000013 bytesused: 1920000 timestamp: 381117130000 fps: 28.83
seq: 000014 bytesused: 1920000 timestamp: 381151822000 fps: 28.83
seq: 000015 bytesused: 1920000 timestamp: 381186512000 fps: 28.83
seq: 000016 bytesused: 1920000 timestamp: 381221200000 fps: 28.83
seq: 000017 bytesused: 1920000 timestamp: 381255891000 fps: 28.83

Regards,
Peter


[1] https://git.buildroot.net/buildroot/tree/package/meson/0001-Only-fix-RPATH-if-install_rpath-is-not-empty.patch

Notes:
 - customized config.txt (RPi4):

   gpu_mem=128
   dtoverlay=miniuart-bt
   dtoverlay=ov5647
   core_freq_min=250
   dtoverlay=vc4-fkms-v3d

Peter Seiderer (2):
  package/libcamera: bump version to 96fab38
  package/libcamera: add v4l2 compatibility layer option

 package/libcamera/Config.in      | 63 +++++++++++++++++++++++++---
 package/libcamera/libcamera.hash | 15 +++++--
 package/libcamera/libcamera.mk   | 72 +++++++++++++++++++++++++++++---
 3 files changed, 135 insertions(+), 15 deletions(-)

-- 
2.27.0
