From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 16 Mar 2016 15:28:10 +0100
Subject: [Buildroot] [PATCH v3 1/4] libfslcodec: add install hooks to fix
	libraries path
In-Reply-To: <1458138493-12172-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1458138493-12172-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <1458138493-12172-2-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By default, all the libraries are installed under /usr/lib/imx-mm which
causes problems at runtime.

The hooks are inspired from the mechanism used in the Yocto recipe:
https://github.com/Freescale/meta-fsl-arm/blob/fido/recipes-multimedia/libfslcodec/libfslcodec.inc

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
 package/libfslcodec/libfslcodec.mk | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/package/libfslcodec/libfslcodec.mk b/package/libfslcodec/libfslcodec.mk
index e151c66..89d058c 100644
--- a/package/libfslcodec/libfslcodec.mk
+++ b/package/libfslcodec/libfslcodec.mk
@@ -20,4 +20,19 @@ endef
 # FIXME The Makefile installs both the arm9 and arm11 versions of the
 # libraries, but we only need one of them.
 
+# Use symlinks in staging dir so every application can link against the libs
+# whether they look at imx-mm or not (gst-fsl-plugins vs. gst1-imx).
+define LIBFSLCODEC_FIXUP_STAGING_PATH
+	cd $(STAGING_DIR)/usr/lib; \
+	find imx-mm -mindepth 2 -maxdepth 2 -not -type d -exec ln -fs {} . \;
+endef
+LIBFSLCODEC_POST_INSTALL_STAGING_HOOKS += LIBFSLCODEC_FIXUP_STAGING_PATH
+
+# Use symlinks in install dir as well to match staging setup.
+define LIBFSLCODEC_FIXUP_TARGET_PATH
+	cd $(TARGET_DIR)/usr/lib; \
+	find imx-mm -mindepth 2 -maxdepth 2 -not -type d -exec ln -fs {} . \;
+endef
+LIBFSLCODEC_POST_INSTALL_TARGET_HOOKS += LIBFSLCODEC_FIXUP_TARGET_PATH
+
 $(eval $(autotools-package))
-- 
2.7.0
