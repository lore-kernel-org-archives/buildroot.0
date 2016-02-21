From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 21:27:23 +0100
Subject: [Buildroot] [git commit] package/mediastreamer: add optional
	support for opus
Message-ID: <20160221202727.6F06F7FDBD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=63311a52c8e8353596bc5525b6f5122271e96435
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When opus was compiled before, mediastreamer will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/lib/libmediastreamer_voip.so.3.0.0 | grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libmediastreamer_base.so.3]
 0x0000000000000001 (NEEDED)             Shared library: [libopus.so.0]
[...]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mediastreamer/mediastreamer.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/mediastreamer/mediastreamer.mk b/package/mediastreamer/mediastreamer.mk
index 047509e..cf25196 100644
--- a/package/mediastreamer/mediastreamer.mk
+++ b/package/mediastreamer/mediastreamer.mk
@@ -27,6 +27,13 @@ else
 MEDIASTREAMER_CONF_OPTS += --disable-upnp
 endif
 
+ifeq ($(BR2_PACKAGE_OPUS),y)
+MEDIASTREAMER_CONF_OPTS += --enable-opus
+MEDIASTREAMER_DEPENDENCIES += opus
+else
+MEDIASTREAMER_CONF_OPTS += --disable-opus
+endif
+
 # portaudio backend needs speex as well
 ifeq ($(BR2_PACKAGE_PORTAUDIO)$(BR2_PACKAGE_SPEEX),yy)
 MEDIASTREAMER_CONF_OPTS += --enable-portaudio
