From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 14 Jan 2020 18:19:20 +0100
Subject: [Buildroot] [PATCH v1 3/3] package/rpi-userland: bump version
 to 42ec119
In-Reply-To: <20200114152755.4123935c@gmx.net>
References: <20200114094256.23174-1-ps.report@gmx.net>
 <20200114094256.23174-3-ps.report@gmx.net>
 <trinity-41871925-7822-4238-98ae-909b71ee05a8-1579005943320@3c-app-mailcom-bs09>
 <20200114152755.4123935c@gmx.net>
Message-ID: <20200114181920.54b8bd3e@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Dagg,

On Tue, 14 Jan 2020 15:27:55 +0100, Peter Seiderer <ps.report@gmx.net> wrote:

> Hello Dagg,
>
> On Tue, 14 Jan 2020 13:45:43 +0100, daggs <daggs@gmx.com> wrote:
>
> >
> > do note that this commit allows rpi-userland compilation on aarch64. might be a good idea to fix rpi-userland.mk and Config.in to support that.
> >
> > Dagg.
>
> Thanks for the hint, will give it a try the next days....

But does not provide the full set of libs for the 64bit build, e.g.
no libegl, libgles, libopenmax, libopenvg (see e.g. [1], [2]), not
sure which libs all the buildroot rpi-userland dependent packages
expect (and if a incomplete rpi-userland is worth the 64-bit build)?

As a starting point the following patch works to enable rpi-userland
for 64-bit:

diff --git a/package/rpi-userland/Config.in b/package/rpi-userland/Config.in
index 342faf26e3..1a3bf46d42 100644
--- a/package/rpi-userland/Config.in
+++ b/package/rpi-userland/Config.in
@@ -1,13 +1,13 @@
 config BR2_PACKAGE_RPI_USERLAND
 	bool "rpi-userland"
-	depends on BR2_arm
+	depends on BR2_arm || BR2_aarch64
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_HAS_LIBEGL
-	select BR2_PACKAGE_HAS_LIBGLES
-	select BR2_PACKAGE_HAS_LIBOPENVG
-	select BR2_PACKAGE_HAS_LIBOPENMAX
+	select BR2_PACKAGE_HAS_LIBEGL if BR2_arm
+	select BR2_PACKAGE_HAS_LIBGLES if BR2_arm
+	select BR2_PACKAGE_HAS_LIBOPENVG if BR2_arm
+	select BR2_PACKAGE_HAS_LIBOPENMAX if BR2_arm
 	help
 	  Raspberry Pi Userland contains the necessary library to use
 	  the VideoCore driver.
@@ -20,6 +20,7 @@ config BR2_PACKAGE_RPI_USERLAND

 if BR2_PACKAGE_RPI_USERLAND

+if BR2_arm
 config BR2_PACKAGE_PROVIDES_LIBEGL
 	default "rpi-userland"

@@ -32,14 +33,16 @@ config BR2_PACKAGE_PROVIDES_LIBOPENVG
 config BR2_PACKAGE_PROVIDES_LIBOPENMAX
 	default "rpi-userland"

+endif # BR2_arm
+
 config BR2_PACKAGE_RPI_USERLAND_HELLO
 	bool "hello_pi examples"
 	help
 	  Install the hello-pi examples to test the HW (GPU, camera...)

-endif
+endif # BR2_PACKAGE_RPI_USERLAND

 comment "rpi-userland needs a toolchain w/ C++, threads, dynamic library"
-	depends on BR2_arm
+	depends on BR2_arm || BR2_aarch64
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_STATIC_LIBS
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 555e84ecab..8a8d2e1471 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -11,7 +11,12 @@ RPI_USERLAND_LICENSE_FILES = LICENCE
 RPI_USERLAND_INSTALL_STAGING = YESdiff --git a/package/rpi-userland/Config.in b/package/rpi-userland/Config.in
index 342faf26e3..1a3bf46d42 100644
--- a/package/rpi-userland/Config.in
+++ b/package/rpi-userland/Config.in
@@ -1,13 +1,13 @@
 config BR2_PACKAGE_RPI_USERLAND
 	bool "rpi-userland"
-	depends on BR2_arm
+	depends on BR2_arm || BR2_aarch64
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_HAS_LIBEGL
-	select BR2_PACKAGE_HAS_LIBGLES
-	select BR2_PACKAGE_HAS_LIBOPENVG
-	select BR2_PACKAGE_HAS_LIBOPENMAX
+	select BR2_PACKAGE_HAS_LIBEGL if BR2_arm
+	select BR2_PACKAGE_HAS_LIBGLES if BR2_arm
+	select BR2_PACKAGE_HAS_LIBOPENVG if BR2_arm
+	select BR2_PACKAGE_HAS_LIBOPENMAX if BR2_arm
 	help
 	  Raspberry Pi Userland contains the necessary library to use
 	  the VideoCore driver.
@@ -20,6 +20,7 @@ config BR2_PACKAGE_RPI_USERLAND

 if BR2_PACKAGE_RPI_USERLAND

+if BR2_arm
 config BR2_PACKAGE_PROVIDES_LIBEGL
 	default "rpi-userland"

@@ -32,14 +33,16 @@ config BR2_PACKAGE_PROVIDES_LIBOPENVG
 config BR2_PACKAGE_PROVIDES_LIBOPENMAX
 	default "rpi-userland"

+endif # BR2_arm
+
 config BR2_PACKAGE_RPI_USERLAND_HELLO
 	bool "hello_pi examples"
 	help
 	  Install the hello-pi examples to test the HW (GPU, camera...)

-endif
+endif # BR2_PACKAGE_RPI_USERLAND

 comment "rpi-userland needs a toolchain w/ C++, threads, dynamic library"
-	depends on BR2_arm
+	depends on BR2_arm || BR2_aarch64
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_STATIC_LIBS
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 555e84ecab..8a8d2e1471 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -11,7 +11,12 @@ RPI_USERLAND_LICENSE_FILES = LICENCE
 RPI_USERLAND_INSTALL_STAGING = YES
 RPI_USERLAND_CONF_OPTS = -DVMCS_INSTALL_PREFIX=/usr

-RPI_USERLAND_PROVIDES = libegl libgles libopenmax libopenvg
+ifeq ($(BR2_aarch64),y)
+	RPI_USERLAND_CONF_OPTS += -DARM64=ON
+else
+	RPI_USERLAND_PROVIDES = libegl libgles libopenmax libopenvg
+	RPI_USERLAND_CONF_OPTS += -DARM64=OFF
+endif

 ifeq ($(BR2_PACKAGE_RPI_USERLAND_HELLO),y)


 RPI_USERLAND_CONF_OPTS = -DVMCS_INSTALL_PREFIX=/usr

-RPI_USERLAND_PROVIDES = libegl libgles libopenmax libopenvg
+ifeq ($(BR2_aarch64),y)
+	RPI_USERLAND_CONF_OPTS += -DARM64=ON
+else
+	RPI_USERLAND_PROVIDES = libegl libgles libopenmax libopenvg
+	RPI_USERLAND_CONF_OPTS += -DARM64=OFF
+endif

 ifeq ($(BR2_PACKAGE_RPI_USERLAND_HELLO),y)


Regards,
Peter


[1] https://github.com/raspberrypi/userland/blob/master/CMakeLists.txt#L65
[2] https://github.com/raspberrypi/userland/blob/master/CMakeLists.txt#L83


Detailed list BR2_arm vs. BR2_aarch64:

- BR2_arm:

build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libbcm_host.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libbrcmEGL.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libbrcmGLESv2.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libbrcmjpeg.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libbrcmOpenVG.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libbrcmWFC.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libcontainers.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libdebug_sym.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libdebug_sym_static.a
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libdtovl.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libEGL.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libEGL_static.a
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libfdt.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libGLESv2.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libGLESv2_static.a
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libkhrn_client.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libkhrn_static.a
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libmmal_components.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libmmal_core.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libmmal_omx.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libmmal_omxutil.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libmmal.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libmmal_util.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libmmal_vc_client.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libopenmaxil.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libOpenVG.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libvchiq_arm.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libvchostif.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libvcilcs.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libvcos.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libvcsm.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libWFC.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_asf.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_avi.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_binary.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_flv.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_metadata_id3.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_mkv.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_mp4.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_mpga.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_ps.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_qsynth.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_raw_video.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_rcv.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_rtp.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_rtsp.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_rv9.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_simple.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_wav.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/writer_asf.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/writer_avi.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/writer_binary.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/writer_dummy.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/writer_mp4.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/writer_raw_video.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/writer_simple.so


- BR2_aarch64:

build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libbcm_host.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libcontainers.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libdebug_sym.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libdebug_sym_static.a
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libdtovl.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libfdt.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libmmal_components.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libmmal_core.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libmmal.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libmmal_util.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libmmal_vc_client.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libvchiq_arm.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libvchostif.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libvcos.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libvcsm.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_asf.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_avi.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_binary.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_flv.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_metadata_id3.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_mkv.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_mp4.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_mpga.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_ps.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_qsynth.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_raw_video.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_rcv.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_rtp.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_rtsp.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_rv9.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_simple.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_wav.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/writer_asf.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/writer_avi.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/writer_binary.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/writer_dummy.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/writer_mp4.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/writer_raw_video.so
build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/writer_simple.so


- Diff BR_arm vs. BR_aarch64

 build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libbcm_host.so
-build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libbrcmEGL.so
-build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libbrcmGLESv2.so
-build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libbrcmjpeg.so
-build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libbrcmOpenVG.so
-build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libbrcmWFC.so
 build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libcontainers.so
 build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libdebug_sym.so
 build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libdebug_sym_static.a
 build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libdtovl.so
-build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libEGL.so
-build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libEGL_static.a
 build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libfdt.so
-build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libGLESv2.so
-build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libGLESv2_static.a
-build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libkhrn_client.so
-build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libkhrn_static.a
 build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libmmal_components.so
 build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libmmal_core.so
-build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libmmal_omx.so
-build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libmmal_omxutil.so
 build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libmmal.so
 build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libmmal_util.so
 build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libmmal_vc_client.so
-build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libopenmaxil.so
-build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libOpenVG.so
 build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libvchiq_arm.so
 build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libvchostif.so
-build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libvcilcs.so
 build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libvcos.so
 build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libvcsm.so
-build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libWFC.so
 build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_asf.so
 build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_avi.so
 build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_binary.so
