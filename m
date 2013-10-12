From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Sat, 12 Oct 2013 08:58:48 +0200
Subject: [Buildroot] [PATCH] Compile static versions of gcc libraries
In-Reply-To: <20131011232307.7301b5d6@skate>
References: <1381398042-6925-1-git-send-email-jezz@sysmic.org>
 <20131011232307.7301b5d6@skate>
Message-ID: <35442021.nHn7vxX1UA@sagittae>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 11 October 2013 23:23:07 Thomas Petazzoni wrote:
> Dear J?r?me Pouiller,
> 
> On Thu, 10 Oct 2013 11:40:42 +0200, J?r?me Pouiller wrote:
> > +define  HOST_GCC_FINAL_CONFIGURE_CMDS
> > +        (cd $(HOST_GCC_FINAL_SRCDIR) && rm -rf config.cache; \
> > +                $(HOST_CONFIGURE_OPTS) \
> > +                CFLAGS="$(HOST_CFLAGS)" \
> > +                LDFLAGS="$(HOST_LDFLAGS)" \
> > +                $(HOST_GCC_FINAL_CONF_ENV) \
> > +                ./configure \
> > +                --prefix="$(HOST_DIR)/usr" \
> > +                --sysconfdir="$(HOST_DIR)/etc" \
> > +                --enable-shared --enable-static \
> > +                $(QUIET) $(HOST_GCC_FINAL_CONF_OPT) \
> > +        )
> 
> Why aren't you simply doing:
> 
> HOST_GCC_FINAL_CONF_OPT += \
> 	--enable-shared --enable-static
It was the first thing I tried. In this case, ./configure is called with 
--enable-shared --disable-static --enable-static.

We can think --enable-static will overload --disable-static.

config.status correctly contains enable_static=yes, but libstdc++.la 
does not contains any reference to libstdc++.a and libstdc++.a is not 
installed. I surely missed something.

Whatever the case, if ./configure is called without --disable-static, it 
works.

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
