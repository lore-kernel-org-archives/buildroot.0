From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2016 22:20:25 +0100
Subject: [Buildroot] [git commit] package/gnuradio: add optional support for
	orc
Message-ID: <20160223212031.7332C8047C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=55163723ea14d4e5da75910e4bbb4af4aa7f1afe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When orc was compiled before, gnuradio will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/gnuradio-config-info | grep NEEDED
[...]
 0x0000000000000001 (NEEDED)             Shared library: [liborc-0.4.so.0]
[...]

Apparently there is no option provided by the build system to
en-/disable support for orc:
https://github.com/gnuradio/volk/blob/41b4df055b2c8d4f2c23ad2bdc60c0b47b4f0dd8/lib/CMakeLists.txt#L449

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: "Gwenhael Goavec-Merou" <gwenhael.goavec-merou@trabucayre.com>
Tested-by: "Gwenhael Goavec-Merou" <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gnuradio/gnuradio.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index fc5cd1f..b7dbcb9 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -17,6 +17,10 @@ GNURADIO_DEPENDENCIES = \
 	host-swig \
 	boost
 
+ifeq ($(BR2_PACKAGE_ORC),y)
+GNURADIO_DEPENDENCIES += orc
+endif
+
 GNURADIO_CONF_OPTS = \
 	-DENABLE_DEFAULT=OFF \
 	-DENABLE_VOLK=ON \
