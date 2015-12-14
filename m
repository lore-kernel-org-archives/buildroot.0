From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 14 Dec 2015 22:25:14 +0100
Subject: [Buildroot] [PATCH v2 1/4] libfslcodec: add install hooks to
 fix libraries path
In-Reply-To: <20151213203642.GD27769@free.fr>
References: <1449755560-2911-1-git-send-email-gary.bisson@boundarydevices.com>
 <1449755560-2911-2-git-send-email-gary.bisson@boundarydevices.com>
 <20151213203642.GD27769@free.fr>
Message-ID: <20151214212514.GA10029@t450s.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, All,

On Sun, Dec 13, 2015 at 09:36:42PM +0100, Yann E. MORIN wrote:
> Gary, All,
> 
> On 2015-12-10 14:52 +0100, Gary Bisson spake thusly:
> > By default, all the libraries are installed under /usr/lib/imx-mm which
> > causes problems at runtime.
> > 
> > The hooks are inspired from the mechanism used in the Yocto recipe:
> > https://github.com/Freescale/meta-fsl-arm/blob/fido/recipes-
> > multimedia/libfslcodec/libfslcodec.inc
> > 
> > Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> > ---
> > 
> > Here are the dependencies the pipelines above are testing:
> > $ for i in `find target/usr/lib/gstreamer*/*`; do readelf -d $i | grep NEEDED | grep lib_ && echo "($i)"; done
> >  0x00000001 (NEEDED)                     Shared library: [lib_nb_amr_dec_arm9_elinux.so.2]
> >  0x00000001 (NEEDED)                     Shared library: [lib_wb_amr_dec_arm9_elinux.so.2]
> > (target/usr/lib/gstreamer-0.10/libmfw_gst_amrdec.so)
> >  0x00000001 (NEEDED)                     Shared library: [lib_peq_arm11_elinux.so.1.fhw]
> > (target/usr/lib/gstreamer-0.10/libmfw_gst_audio_pp.so)
> >  0x00000001 (NEEDED)                     Shared library: [lib_mp3_enc_arm12_elinux.so.2]
> > (target/usr/lib/gstreamer-0.10/libmfw_gst_mp3enc.so)
> >  0x00000001 (NEEDED)                     Shared library: [lib_mp3_enc_arm12_elinux.so.2]
> > (target/usr/lib/gstreamer-1.0/libgstimxaudio.so)
> > 
> > Note that I added a staging install hook as well because otherwise the
> > gst1-imx plugin doesn't find lib_mp3_enc_arm12_elinux.so at build time.
> > 
> > Not to copy the same library twice I decided to go with a symlink. Let
> > me know if that's acceptable.
> > 
> > Regards,
> > Gary
> > 
> > ---
> >  package/libfslcodec/libfslcodec.mk | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/package/libfslcodec/libfslcodec.mk b/package/libfslcodec/libfslcodec.mk
> > index 473d662..f8c6aa8 100644
> > --- a/package/libfslcodec/libfslcodec.mk
> > +++ b/package/libfslcodec/libfslcodec.mk
> > @@ -20,4 +20,19 @@ endef
> >  # FIXME The Makefile installs both the arm9 and arm11 versions of the
> >  # libraries, but we only need one of them.
> >  
> > +# Use symlinks in staging dir so every application can link against the libs
> > +# whether they look at imx-mm or not (gst-fsl-plugins vs. gst1-imx).
> 
> Hmmm.. I may have overlooked that part.
> 
> So, gst-fsl-plugins looks for the libraries in /usr/lib/imx-mm/ , while
> gst1-imx looks for them in /usr/lib , right?

That is correct indeed.

> Is it possible to make gst-fsl-plugins look in /usr/lib, too?

Never really looked into it but yep maybe it is just a matter of
modifying a few lines of Makefile.am. It just sounds like more troubles
doing so, maybe having to update the patch every release and so on.

> (or the other way around if the lookup is the other way around, of
> course...)

Gstreamer1-imx is way cleaner that gst-fsl-plugins, I'd like to keep it
that way. What about removing gst-fsl-plugins and gstreamer0.10? ;)

> > +define LIBFSLCODEC_FIXUP_STAGING_PATH
> > +	find $(STAGING_DIR)/usr/lib/imx-mm -mindepth 2 -maxdepth 2 -not -type d \
> > +		-exec ln -fs {} $(STAGING_DIR)/usr/lib \;
> > +endef
> > +LIBFSLCODEC_POST_INSTALL_STAGING_HOOKS += LIBFSLCODEC_FIXUP_STAGING_PATH
> > +
> > +# Use symlinks in install dir as well to match staging setup.
> 
> In complement to my previous reply, with insight from what you said
> above: even if gst-fsl-plugins looks for in /usr/lib/imx-mm at build
> time, does it still look there at runtime? If not, then just do a move.

No, that is what people have been complaining about for quite some time
now:
http://patchwork.ozlabs.org/patch/409684/

Regards,
Gary
