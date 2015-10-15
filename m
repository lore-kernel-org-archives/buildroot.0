From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 15 Oct 2015 21:12:16 +0200
Subject: [Buildroot] [PATCH v2] gst1-plugins-base: update configure
 options
In-Reply-To: <20151014224011.2aac931b@free-electrons.com>
References: <1444773987-19382-1-git-send-email-ps.report@gmx.net>
 <20151014224011.2aac931b@free-electrons.com>
Message-ID: <20151015211216.00df672a@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Wed, 14 Oct 2015 22:40:11 +0200, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Dear Peter Seiderer,
> 
> On Wed, 14 Oct 2015 00:06:27 +0200, Peter Seiderer wrote:
> 
> > +config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_GIO_UNIX_2_0
> > +	bool "gio-unix-2.0"
> > +	help
> > +	  glib GIO unix plugin
> > +
> >  endif
> > diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
> > index 08ebe03..f391530 100644
> > --- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
> > +++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
> > @@ -202,4 +202,10 @@ else
> >  GST1_PLUGINS_BASE_CONF_OPTS += --disable-vorbis
> >  endif
> >  
> > +ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_GIO_UNIX_2_0),y)
> > +GST1_PLUGINS_BASE_CONF_OPTS += --enable-gio_unix_2_0
> > +else
> > +GST1_PLUGINS_BASE_CONF_OPTS += --disable-gio_unix_2_0
> > +endif
> 
> This is still not good I believe. You're confusing --disable-gio and
> --disable-gio_unix_2_0. According ./configure --help:
> 
>   --disable-gio           disable dependency-less gio plugin
>   --disable-gio_unix_2_0       disable glib GIO unix: gio-unix-2.0
> 
> So the option that enables/disables the gio plugin (as indicated by
> your Config.in option help text) is --disable-gio.
> 
> On the other hand, --disable-gio_unix_2_0 is only used for this (from
> configure.ac):
> 
> dnl *** gio-unix-2.0 for tests/check/pipelines/tcp.c ***
> translit(dnm, m, l) AM_CONDITIONAL(USE_GIO_UNIX_2_0, true)
> AG_GST_CHECK_FEATURE(GIO_UNIX_2_0, [glib GIO unix], gio-unix-2.0, [
>   AG_GST_PKG_CHECK_MODULES(GIO_UNIX_2_0, gio-unix-2.0 >= 2.24)
> ])
> 
> So I believe we don't really care about gio_unix_2_0, it's only used
> for tests. We could just as well pass --disable-gio_unix_2_0
> unconditionally, and have an option
> BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_GIO to enable/disable the gio
> plugin.
>

...did mostly concentrate on the 'configure --help' diff between 1.4.5 and
1.6.0 version..., but will fix it in the next patch version...

Regards,
Peter

 
> Thanks,
> 
> Thomas
