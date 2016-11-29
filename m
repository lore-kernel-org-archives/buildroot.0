From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Tue, 29 Nov 2016 09:35:55 -0500
Subject: [Buildroot] [PATCH 1/1] sane-backends: disable static configuration
Message-ID: <1480430155-25182-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While sane-backends can be compiled statically, it requires
selection of a subset of scanner backends. Without this, all backends
are compiled and link errors such as the following are generated:

../backend/.libs/libsane.a(libepsonds_la-epsonds.o):(.bss+0xc): multiple definition of `source_list'
../backend/.libs/libsane.a(libepson2_la-epson2.o):(.data+0x40): first defined here
../backend/.libs/libsane.a(libepsonds_la-epsonds.o):(.data+0x10): multiple definition of `mode_params'
../backend/.libs/libsane.a(libepson2_la-epson2.o):(.data+0x0): first defined here
collect2: error: ld returned 1 exit status

Buildroot currently doesn't allow fine grained selection of backends, so
this disables static builds.

Fixes:

http://autobuild.buildroot.net/results/89c/89c6e4ec1596def74e72eb071ef4bf0f1a7cc9f8/
http://autobuild.buildroot.net/results/92a/92a54c99a9ba918ece4c56d7beb985729bee700b/
http://autobuild.buildroot.net/results/1b9/1b9eac5303dfed638063f3b18dfff5571a2c4231/
http://autobuild.buildroot.net/results/366/366979d0bd21dc2bf7f0336b9653ef3fd4e11123/

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---

N.B. Admittedly, this is a weak fix since one could add fine grained
configuration of scanner backends to the Config.in and have some logic
to be smart about which backends are chosen to allow a static build.
Since I've only used the dynamic case in production and it has been
a while, this seemed like the safer fix until someone wants to put
in the time to add static support.

 package/sane-backends/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/sane-backends/Config.in b/package/sane-backends/Config.in
index 8156e85..b1771e7 100644
--- a/package/sane-backends/Config.in
+++ b/package/sane-backends/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SANE_BACKENDS
 	bool "sane-backends"
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS
 	help
 	  SANE - Scanner Access Now Easy
 
@@ -9,3 +10,6 @@ config BR2_PACKAGE_SANE_BACKENDS
 	  Backends are included automatically based on the libraries that have
 	  been selected: libusb, jpeg, tiff, avahi (with dbus and libglib2),
 	  and netsnmp.
+
+comment "sane-backends needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
-- 
2.7.4
