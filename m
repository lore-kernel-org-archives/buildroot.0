From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 29 Oct 2015 21:06:49 +0100
Subject: [Buildroot] [PATCH 1/4] libfslcodec: add install hooks to fix
	libraries path
In-Reply-To: <1446149212-12048-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1446149212-12048-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <1446149212-12048-2-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By default, all the libraries are installed under /usr/lib/imx-mm which
causes problems at runtime.

The hooks are inspired from the mechanism used in the Yocto recipe:
https://github.com/Freescale/meta-fsl-arm/blob/fido/recipes-
multimedia/libfslcodec/libfslcodec.inc

This has been tested implicitely by running Gstreamer without any special
setup (no ld.so.conf nor LD_LIBRARY_PATH modification):
 # gst-launch-0.10 playbin uri=file:///root/tears_of_steel_1080p.webm
 # gst-launch-0.10 audiotestsrc ! mfw_mp3encoder ! fakesink
 # gst-launch-1.0 playbin uri=file:///root/tears_of_steel_1080p.webm

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---

Here are the dependencies the pipelines above are testing:
$ for i in `find target/usr/lib/gstreamer*/*`; do readelf -d $i | grep NEEDED | grep lib_ && echo "($i)"; done
 0x00000001 (NEEDED)                     Shared library: [lib_nb_amr_dec_arm9_elinux.so.2]
 0x00000001 (NEEDED)                     Shared library: [lib_wb_amr_dec_arm9_elinux.so.2]
(target/usr/lib/gstreamer-0.10/libmfw_gst_amrdec.so)
 0x00000001 (NEEDED)                     Shared library: [lib_peq_arm11_elinux.so.1.fhw]
(target/usr/lib/gstreamer-0.10/libmfw_gst_audio_pp.so)
 0x00000001 (NEEDED)                     Shared library: [lib_mp3_enc_arm12_elinux.so.2]
(target/usr/lib/gstreamer-0.10/libmfw_gst_mp3enc.so)
 0x00000001 (NEEDED)                     Shared library: [lib_mp3_enc_arm12_elinux.so.2]
(target/usr/lib/gstreamer-1.0/libgstimxaudio.so)

Note that I added a staging install hook as well because otherwise the
gst1-imx plugin doesn't find lib_mp3_enc_arm12_elinux.so at build time.

Not to copy the same library twice I decided to go with a symlink. Let
me know if that's acceptable.

Regards,
Gary

---
 package/libfslcodec/libfslcodec.mk | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/package/libfslcodec/libfslcodec.mk b/package/libfslcodec/libfslcodec.mk
index 473d662..4d8fd18 100644
--- a/package/libfslcodec/libfslcodec.mk
+++ b/package/libfslcodec/libfslcodec.mk
@@ -20,4 +20,20 @@ endef
 # FIXME The Makefile installs both the arm9 and arm11 versions of the
 # libraries, but we only need one of them.
 
+# do the symlink in staging area as some packages like gst-fsl-plugins is
+# looking for libraries in imx-mm whereas gst1-imx doesn't
+define LIBFSLCODEC_FIXUP_STAGING_PATH
+	find $(STAGING_DIR)/usr/lib/imx-mm -mindepth 2 -maxdepth 2 -not -type d \
+		-exec ln -fs {} $(STAGING_DIR)/usr/lib \;
+endef
+LIBFSLCODEC_POST_INSTALL_STAGING_HOOKS += LIBFSLCODEC_FIXUP_STAGING_PATH
+
+# no need to symlink in target image, just move libraries around
+define LIBFSLCODEC_FIXUP_TARGET_PATH
+	find $(TARGET_DIR)/usr/lib/imx-mm -mindepth 2 -maxdepth 2 -not -type d \
+		-exec mv {} $(TARGET_DIR)/usr/lib \;
+	rm -fr $(TARGET_DIR)/usr/lib/imx-mm
+endef
+LIBFSLCODEC_POST_INSTALL_TARGET_HOOKS += LIBFSLCODEC_FIXUP_TARGET_PATH
+
 $(eval $(autotools-package))
-- 
2.6.1
