From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 11 Dec 2016 19:30:42 +0100
Subject: [Buildroot] [Patch v2 2/9] execline: new package
In-Reply-To: <20161210214901.084d27e8@free-electrons.com>
References: <1481397650-14664-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1481397650-14664-3-git-send-email-eric.le.bihan.dev@free.fr>
 <20161210214901.084d27e8@free-electrons.com>
Message-ID: <20161211183041.GB23661@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On 16-12-10 21:49:01, Thomas Petazzoni wrote:
> Hello,
>
> On Sat, 10 Dec 2016 20:20:43 +0100, Eric Le Bihan wrote:
>
> > diff --git a/package/execline/Config.in.host b/package/execline/Config.in.host
> > new file mode 100644
> > index 0000000..4e188e1
> > --- /dev/null
> > +++ b/package/execline/Config.in.host
> > @@ -0,0 +1,7 @@
> > +config BR2_PACKAGE_HOST_EXECLINE
> > +	bool "host execline"
> > +	help
> > +	  Host version of execline, a (non-interactive) scripting language,
> > +	  like sh.
> > +
> > +	  http://skarnet.org/software/execline/
>
> Do we really a menuconfig-visible option for the host variant?
>
> If so, then please explain why in the commit log. Also mentioning in
> the commit log why a host variant is introduced would be nice.

I will remove the menuconfig entry. It is used by the host variants of s6
and s6-rc, but having host-execline in their respective dependency lists
is enough. It is very unlikely that the user want to write post-build
scripts using execline with having built host-s6 and friends.

> > +EXECLINE_CONF_OPTS = \
> > +	--prefix=/usr \
> > +	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
> > +	--with-include=$(STAGING_DIR)/usr/include \
> > +	--with-dynlib=$(STAGING_DIR)/usr/lib \
> > +	--with-lib=$(STAGING_DIR)/usr/lib/skalibs \
>
> Ah, ok, so that's how it finds the static libraries?

Yep! The skarnet build system may follow the "./configure; make; make
install" convention, but internally, this is another story. So the
libraries are stored in a subdirectory.

> > +HOST_EXECLINE_DEPENDENCIES = host-skalibs
> > +
> > +HOST_EXECLINE_CONF_OPTS = \
> > +	--prefix=/usr \
>
> Should be --prefix=$(HOST_DIR)/usr
>
> > +	--with-sysdeps=$(HOST_DIR)/usr/lib/skalibs/sysdeps \
> > +	--with-include=$(HOST_DIR)/usr/include \
> > +	--with-dynlib=$(HOST_DIR)/usr/lib \
> > +	--disable-static \
> > +	--enable-shared \
> > +	--disable-allstatic
> > +
> > +define HOST_EXECLINE_CONFIGURE_CMDS
> > +	(cd $(@D); $(HOST_CONFIGURE_OPTS) ./configure $(HOST_EXECLINE_CONF_OPTS))
> > +endef
> > +
> > +define HOST_EXECLINE_BUILD_CMDS
> > +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR)
>
> DESTDIR= should not be needed.
>
> > +endef
> > +
> > +define HOST_EXECLINE_INSTALL_CMDS
> > +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR) install
>
> DESTDIR= is no longer needed with --prefix=$(HOST_DIR)/usr.

See the skalibs review for details about this topic.

Thanks for the review.

--
ELB
