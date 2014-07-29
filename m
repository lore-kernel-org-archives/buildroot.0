From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Wed, 30 Jul 2014 00:49:08 +0200
Subject: [Buildroot] [PATCH v4 1/1] New package: openvmtools
In-Reply-To: <20140729234546.3c466ac6@free-electrons.com>
References: <1406635032-34970-1-git-send-email-kaszak@gmail.com>
 <20140729234546.3c466ac6@free-electrons.com>
Message-ID: <CABbD_XDweGbROt=VU4HUt-i4Z6a17bo-HmTQtmJQRipXVb6dSg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Jul 29, 2014 at 11:45 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Karoly, Yann, All,
>
> On Tue, 29 Jul 2014 13:57:12 +0200, Karoly Kasza wrote:
>
> > +# When libfuse is available, openvmtools can build vmblock-fuse, so
> > +# make sure that libfuse gets built first.
> > +ifeq ($(BR2_PACKAGE_LIBFUSE),y)
> > +OPENVMTOOLS_DEPENDENCIES += libfuse
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_OPENVMTOOLS_PROCPS),y)
> > +OPENVMTOOLS_CONF_ENV += CUSTOM_PROCPS_NAME=procps
> LDFLAGS="-L$(TARGET_DIR)/usr/lib"
> > +OPENVMTOOLS_CONF_OPT += --with-procps
> > +OPENVMTOOLS_DEPENDENCIES += procps-ng
> > +else
> > +OPENVMTOOLS_CONF_OPT += --without-procps
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_OPENVMTOOLS_DNET),y)
> > +OPENVMTOOLS_CONF_ENV +=
> CUSTOM_DNET_CPPFLAGS="-I$(STAGING_DIR)/usr/include"
> > +OPENVMTOOLS_CONF_OPT += --with-dnet
> > +OPENVMTOOLS_DEPENDENCIES += libdnet
> > +else
> > +OPENVMTOOLS_CONF_OPT += --without-dnet
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_OPENVMTOOLS_PAM),y)
> > +OPENVMTOOLS_CONF_OPT += --with-pam
> > +OPENVMTOOLS_MAKE_OPT += CFLAGS+="-Wno-unused-local-typedefs"
> > +OPENVMTOOLS_DEPENDENCIES += linux-pam
> > +else
> > +OPENVMTOOLS_CONF_OPT += --without-pam
> > +endif
>
> Here I have a question not necessarily directly for you Karoly, but for
> other Buildroot developers. We have a good example here of some
> dependencies being automatic (libfuse), some dependencies having their
> own package sub-options (procps, dnet, pam). Do we want to have this
> separation of treatment ? What is the rationale to do one or the other
> in this specific case ?
>

Some explanation:
In this special case, I can not turn off building vmblock-fuse with a
configure parameter. If it finds libfuse, it builds vmblock-fuse. I think
it's a minor defect in the configure script, it doesn't have a
--without-fuse or similar switch.
It's not pretty I know.

BR
Karoly
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140730/fa2ae8de/attachment.html>
