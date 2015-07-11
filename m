From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 11 Jul 2015 09:43:44 +0200
Subject: [Buildroot] [PATCH v3] dieharder: new package
In-Reply-To: <55A050E6.6020505@openwide.fr>
References: <1431848603-30142-1-git-send-email-julien.viarddegalbert@openwide.fr>
 <55A050E6.6020505@openwide.fr>
Message-ID: <20150711074344.GA7573@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien, Romain, All,

On 2015-07-11 01:10 +0200, Romain Naour spake thusly:
> Le 17/05/2015 09:43, julien.viarddegalbert at openwide.fr a ?crit :
> > From: Julien Viard de Galbert <julien@vdg.name>
> > 
> > Signed-off-by: Julien Viard de Galbert <julien@vdg.name>
[--SNIP--]
> > diff --git a/package/dieharder/dieharder.mk b/package/dieharder/dieharder.mk
> > new file mode 100644
> > index 0000000..2a3d46b
> > --- /dev/null
> > +++ b/package/dieharder/dieharder.mk
> > @@ -0,0 +1,26 @@
> > +################################################################################
> > +#
> > +# dieharder
> > +#
> > +################################################################################
> > +
> > +DIEHARDER_VERSION = 3.31.1
> > +DIEHARDER_SITE = http://www.phy.duke.edu/~rgb/General/dieharder/
> > +DIEHARDER_SOURCE = dieharder-$(DIEHARDER_VERSION).tgz
> > +DIEHARDER_SUBDIR = dieharder-$(DIEHARDER_VERSION)
> > +DIEHARDER_LICENSE = GPLv2b
> > +DIEHARDER_LICENSE_FILES = $(DIEHARDER_SUBDIR)/COPYING
> > +DIEHARDER_DEPENDENCIES = gsl
> > +
> > +DIEHARDER_CONF_OPTS = --includedir=$(STAGING_DIR)/usr/include
> > +# fix endiannes detection
> > +ifeq ($(BR2_ENDIAN),"BIG")
> > +DIEHARDER_CONF_OPTS += ac_cv_c_endian=big
> > +else
> > +DIEHARDER_CONF_OPTS += ac_cv_c_endian=little
> > +endif
> 
> There is a build issue with musl libc due to missing M_PI when _GNU_SOURCE is
> not defined.
> 
> I suggest you add it in CFLAGS by using DIEHARDER_MAKE_OPTS:
> 
> DIEHARDER_MAKE_OPTS = CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"

Better yet: patch dieharder to define it in the source, and submit that
patch upstream.

Regards,
Yann E. MORIN.

> Don't forget to take into account Thomas's comment for the next version ;-)
> 
> Best regards,
> Romain
> 
> > +
> > +# parallel build fail, disable it
> > +DIEHARDER_MAKE=$(MAKE1)
> > +
> > +$(eval $(autotools-package))
> > 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
