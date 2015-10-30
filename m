From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Fri, 30 Oct 2015 11:36:21 +0100
Subject: [Buildroot] [PATCH 3/4] libfslparser: add install hooks to fix
	libraries path
In-Reply-To: <2787793.hk6j5KppJf@sagittea>
References: <1446149212-12048-1-git-send-email-gary.bisson@boundarydevices.com>
 <1446149212-12048-4-git-send-email-gary.bisson@boundarydevices.com>
 <2787793.hk6j5KppJf@sagittea>
Message-ID: <CAAMH-yt31Y9Ez8Stjv8G_j63GvwC6Csc3NX8SK=1OSPaZLSGpA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jerome,

On Fri, Oct 30, 2015 at 11:27 AM, J?r?me Pouiller <jezz@sysmic.org> wrote:
>
> Hello Garry,
>
> On Thursday 29 October 2015 21:06:51 Gary Bisson wrote:
> [...]
> > b/package/libfslparser/libfslparser.mk index 2b53d62..aa02f19 100644
> > --- a/package/libfslparser/libfslparser.mk
> > +++ b/package/libfslparser/libfslparser.mk
> > @@ -20,4 +20,12 @@ endef
> > # The Makefile installs several versions of the libraries, but we only
> > # need one of them, depending on the platform.
> >
> > +# no need to symlink in target image, just move libraries around
> > +define LIBFSLPARSER_FIXUP_TARGET_PATH
> > +     find $(TARGET_DIR)/usr/lib/imx-mm -mindepth 2 -maxdepth 2 -not -type d \
> > +             -exec mv {} $(TARGET_DIR)/usr/lib \;
> > +     rm -fr $(TARGET_DIR)/usr/lib/imx-mm
> > +endef
> > +LIBFSLPARSER_POST_INSTALL_TARGET_HOOKS += LIBFSLPARSER_FIXUP_TARGET_PATH
> A POST_INSTALL_STAGING_HOOKS is not necessary for libfslparser?

No, libfslparser is only needed by gst-fsl-plugins which looks for the
libs at the right location at build time (usr/lib/imx-mm).

The staging hook is needed for libfslcodec since it is used by both
gst-fsl-plugins and gst1-imx (not looking at the imx-mm path at build
time).

Although it might have been more consistent to have the staging hook
in both, I chose to reduce the patch as much as possible. Plus I'm not
sure people will like my symlink approach in the staging directory.

Regards,
Gary
