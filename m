From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 03 Aug 2016 21:57:04 +0200
Subject: [Buildroot] [PATCH 1/5] imx-codec: add install hooks to fix
	libraries path
In-Reply-To: <1469627614-29709-2-git-send-email-gary.bisson@boundarydevices.com>
 (Gary Bisson's message of "Wed, 27 Jul 2016 15:53:30 +0200")
References: <1469627614-29709-1-git-send-email-gary.bisson@boundarydevices.com>
 <1469627614-29709-2-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <87invhiq27.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gary" == Gary Bisson <gary.bisson@boundarydevices.com> writes:

 > By default, all the libraries are installed under /usr/lib/imx-mm
 > which causes problems at runtime.

 > The hooks are inspired from the mechanism used in the Yocto recipe:
 > https://github.com/Freescale/meta-fsl-arm/blob/krogoth/recipes-multimedia/imx-codec/imx-codec.inc

 > Tested with the following commands:
 >  # gst-launch-0.10 audiotestsrc ! mfw_mp3encoder ! fakesink
 >  # gst-launch-1.0 audiotestsrc ! imxmp3audioenc ! fakesink

 > Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
 > ---

 > Here is the list of plugins that couldn't find the codecs at runtime:
 > $ for i in `find target/usr/lib/gstreamer*/*.so`; do readelf -d $i \
 >   | grep NEEDED | grep lib_ && echo "($i)"; done
 >  0x00000001 (NEEDED) Shared library: [lib_nb_amr_dec_arm9_elinux.so.2]
 >  0x00000001 (NEEDED) Shared library: [lib_wb_amr_dec_arm9_elinux.so.2]
 > (target/usr/lib/gstreamer-0.10/libmfw_gst_amrdec.so)
 >  0x00000001 (NEEDED) Shared library: [lib_peq_arm11_elinux.so.1.fhw]
 > (target/usr/lib/gstreamer-0.10/libmfw_gst_audio_pp.so)
 >  0x00000001 (NEEDED) Shared library: [lib_mp3_enc_arm12_elinux.so.2]
 > (target/usr/lib/gstreamer-0.10/libmfw_gst_mp3enc.so)
 >  0x00000001 (NEEDED) Shared library: [lib_mp3_enc_arm12_elinux.so.2]
 > (target/usr/lib/gstreamer-1.0/libgstimxaudio.so)

 > Regards,
 > Gary

 > ---
 >  package/freescale-imx/imx-codec/imx-codec.mk | 7 +++++++
 >  1 file changed, 7 insertions(+)

 > diff --git a/package/freescale-imx/imx-codec/imx-codec.mk b/package/freescale-imx/imx-codec/imx-codec.mk
 > index 67d3390..266f47f 100644
 > --- a/package/freescale-imx/imx-codec/imx-codec.mk
 > +++ b/package/freescale-imx/imx-codec/imx-codec.mk
 > @@ -20,4 +20,11 @@ endef
 >  # FIXME The Makefile installs both the arm9 and arm11 versions of the
 >  # libraries, but we only need one of them.

A comment explaining why would have been nice.

 > +define IMX_CODEC_FIXUP_TARGET_PATH
 > +	find $(TARGET_DIR)/usr/lib/imx-mm -mindepth 2 -maxdepth 3 -not -type d \
 > +		-exec mv {} $(TARGET_DIR)/usr/lib \;

I don't quite get why you need mindepth / maxdepth here, we just want to
move all files to usr/lib.

usr/lib/imx-mm contains the following subdirs:

tree -d target/usr/lib/imx-mm
target/usr/lib/imx-mm
??? audio-codec
??? ??? wrap
??? video-codec

So I dropped those flags and committed, thanks.

-- 
Bye, Peter Korsgaard
