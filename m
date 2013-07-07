From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Sun, 7 Jul 2013 16:57:40 -0300
Subject: [Buildroot] [PATCH] icecast: new package
In-Reply-To: <20130707214249.2677a569@skate>
References: <1373222441-2848-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20130707214249.2677a569@skate>
Message-ID: <20130707195738.GA5413@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas.

On Sun, Jul 07, 2013 at 09:42:49PM +0200, Thomas Petazzoni wrote:
> Dear Ezequiel Garcia,
> 
> On Sun,  7 Jul 2013 15:40:41 -0300, Ezequiel Garcia wrote:
> > Icecast is a streaming media server which currently supports Ogg
> > Vorbis and MP3 audio streams. It can be used to create an Internet
> > radio station or a privately running jukebox and many things in
> > between. It is very versatile in that new formats can be added
> > relatively easily and supports open standards for commuincation and
> > interaction.
> > 
> > Icecast is distributed under the GNU GPL, version 2. A copy of this
> > license is included with this software in the COPYING file.
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> > ---
> > I'm no longer working on this stuff because the box I was interested
> > in hadn't hardware FP support making it impossible to achieve what
> > I originally planned.
> 
> Are you still willing to do a few iterations to get it merged?
> 

Sure. I was just about to wipe this from my branch, but thought I could
submit in case someone finds it interesting.

> A couple of comments below.
> 
> > diff --git a/package/multimedia/icecast/Config.in b/package/multimedia/icecast/Config.in
> > new file mode 100644
> > index 0000000..0d2c343
> > --- /dev/null
> > +++ b/package/multimedia/icecast/Config.in
> > @@ -0,0 +1,13 @@
> > +config BR2_PACKAGE_ICECAST
> > +	bool "icecast"
> > +	select BR2_PACKAGE_LIBOGG
> > +	select BR2_PACKAGE_LIBVORBIS
> > +	select BR2_PACKAGE_LIBXML2
> > +	select BR2_PACKAGE_LIBXSLT
> > +	help
> > +	  Icecast is a streaming media server which currently supports Ogg
> > +	  Vorbis and MP3 audio streams. It can be used to create an Internet
> > +	  radio station or a privately running jukebox and many things in
> > +	  between. It is very versatile in that new formats can be added
> > +	  relatively easily and supports open standards for commuincation and
> > +	  interaction.
> 
> We normally add a empty line here, and then one line with the upstream
> project URL.
> 

Right.

> > diff --git a/package/multimedia/icecast/icecast-curl-config.patch b/package/multimedia/icecast/icecast-curl-config.patch
> > new file mode 100644
> > index 0000000..c193aa9
> > --- /dev/null
> > +++ b/package/multimedia/icecast/icecast-curl-config.patch
> > @@ -0,0 +1,12 @@
> 
> We always want a description + Signed-off-by line. We also generally
> prefer patches on the configure.in or configure.ac file, rather than on
> configure directly. For efficiency reasons (avoid the need of
> autoreconfiguring the package), we may accept a patch on configure, but
> I would say that configure.in or configure.ac should also be patched
> appropriately.
> 

Right. I'll try that.

Also, please note that I tried to patch this on 2.3.3 but failed
(don't remember why). I found this fix in OpenWRT, if I remember
correctly.

And this the reason why I had to stick to 2.3.2. I remember someone
complained about being *very* old, but unless we can get over this
silly configure bug, we'll have to stick to 2.3.2.

> > diff --git a/package/multimedia/icecast/icecast.mk b/package/multimedia/icecast/icecast.mk
> > new file mode 100644
> > index 0000000..f840be1
> > --- /dev/null
> > +++ b/package/multimedia/icecast/icecast.mk
> > @@ -0,0 +1,25 @@
> > +############################################################
> 
> 80 # are needed now.
> 

Ok.

> > +#
> > +# Icecast (Shoutcast compatible streaming server)
> 
> Just the package name, not more.
> 

Ok.

> > +#
> > +############################################################
> > +
> > +ICECAST_SITE = http://downloads.xiph.org/releases/icecast
> > +ICECAST_VERSION = 2.3.2
> > +ICECAST_LICENSE = GPLv2
> 
> Have you checked whether is GPLv2 only, or GPLv2 or later? If the
> latter, then it should be GPLv2+.
> 

I'll check.

> > +ICECAST_LICENSE_FILES = COPYING
> > +
> > +ICECAST_DEPENDENCIES = host-pkgconf libxslt libxml2 libogg libvorbis libcurl
> 
> Why do you have libcurl here? From the rest of your package, it seems
> like an optional dependency.
> 

Right.

> > +ICECAST_CONF_OPT += --with-xslt-config=$(STAGING_DIR)/usr/bin/xslt-config
> > +ICECAST_CONF_OPT += --with-ogg=$(STAGING_DIR)/usr
> > +ICECAST_CONF_OPT += --with-vorbis=$(STAGING_DIR)/usr
> 
> We normally write this like:
> 
> ICECAST_CONF_OPT = \
> 	--with-xslt-config=$(STAGING_DIR)/usr/bin/xslt-config \
> 	--with-ogg=$(STAGING_DIR)/usr \
> 	--with-vorbis=$(STAGING_DIR)/usr
> 

Of course.

> > +
> > +ifeq ($(BR2_PACKAGE_LIBCURL),y)
> > +ICECAST_DEPENDENCIES += libcurl
> > +ICECAST_CONF_OPT += --with-curl-config=$(STAGING_DIR)/usr/bin/curl-config
> > +else
> > +ICECAST_CONF_OPT += --without-curl
> > +endif
> > +
> > +$(eval $(autotools-package))
> 
> Otherwise, looks good to me.
> 

Thanks for the feedback!
-- 
Ezequiel Garc?a, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
