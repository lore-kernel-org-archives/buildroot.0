From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Mar 2012 10:11:00 +0100
Subject: [Buildroot] ofono package
In-Reply-To: <CAGm1_ks7QkKyFS7wWPMi3ytu4d2QU=k=gVEcnq6ENoA-CM3sKQ@mail.gmail.com>
References: <CAAfyv35Rq_ad_obvHC2QZdhBvebLqpsRO7G0B4qpkGZuEYamuA@mail.gmail.com>
 <CAGm1_ks7QkKyFS7wWPMi3ytu4d2QU=k=gVEcnq6ENoA-CM3sKQ@mail.gmail.com>
Message-ID: <20120323101100.5fa94c86@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 23 Mar 2012 09:36:02 +0100,
Yegor Yefremov <yegorslists@googlemail.com> a ?crit :

> > +define OFONO_CONFIGURE_CMDS
> > + ? ? ? (cd $(@D) && ./bootstrap-configure $(OFONO_CONF_OPT))
> > +endef

This is not correct, and will fail to set the right path and pkg-config
environment variables. Why is such a special bootstrap-configure script
needed?

If this bootstrap stuff is used to regenerate the configure script and
Makefile.am, then use OFONO_AUTORECONF=YES.

Otherwise, if you really need to do this special configure command,
then do something like:

	(cd $(@D) && \
		$(TARGET_CONFIGURE_OPTS) \
		$(TARGET_CONFIGURE_ARGS) \
		$(OFONO_CONF_ENV) \
		./bootstrap-configure \
		$(OFONO_CONF_OPT))

But since you're not passing --host=something, I am quite skeptical
on how it can guess which cross-compiler should be used.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
