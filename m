From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Dec 2019 10:02:09 +0100
Subject: [Buildroot] [PATCH 1/2] package/libsemanage: add option to
 manually define policy version
In-Reply-To: <CAFSsvmpeWRW+3KShMpB_hq=cn0ETgdabR__Gh7vSGeTZuKt45g@mail.gmail.com>
References: <20191215011517.1977342-1-aduskett@gmail.com>
 <20191215011517.1977342-2-aduskett@gmail.com>
 <20191215125026.1c484b08@windsurf.home>
 <CAFSsvmpeWRW+3KShMpB_hq=cn0ETgdabR__Gh7vSGeTZuKt45g@mail.gmail.com>
Message-ID: <20191216100209.38e41ead@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 15 Dec 2019 09:36:49 -0800
Adam Duskett <aduskett@gmail.com> wrote:

> > I think on top of PATCH 1/2, another patch could be added to make
> > things a little bit smarter in terms of defaults:
> >
> >         default 31 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13
> >         default 30 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
> >         default 29 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
> >         default 28 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
> >         default 26 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_2_6
> >         default 25
> >  
> I'm not sure I like this, as toolchain header versions can be
> misleading, but it's up to you.

I don't see how they can be misleading. These options really state
which kernel headers version is used, and it's a rather good hint of
the minimal kernel version that runs on the target HW.

> > Here, what you're basically doing is assuming that if
> > BR2_PACKAGE_LIBSEMANAGE_POLICY_MANUAL_VERSION is not enabled, we
> > default to "31". But "31" may be wrong. That's why I suggest to drop BR2_PACKAGE_LIBSEMANAGE_POLICY_MANUAL_VERSION and always have a BR2_PACKAGE_LIBSEMANAGE_POLICY_MAX_VERSION option.
> >  
> I made it like this as a fallback. If you want to use the max, then
> you don't have to select anything. Although that could be misleading.

I'm not sure using the latest and greatest as the fallback is really
the safe option.

> > > +ifeq ($(BR2_PACKAGE_LIBSEMANAGE_POLICY_MANUAL_VERSION),y)
> > > +LIBSEMANAGE_MAX_POLICY_VERSION = $(BR2_PACKAGE_LIBSEMANAGE_POLICY_MAX_VERSION)
> > > +endif
> > > +
> > > +define LIBSEMANAGE_SET_SEMANAGE_MAX_POLICY
> > > +     $(SED) "/policy-version = /c\policy-version = $(LIBSEMANAGE_MAX_POLICY_VERSION)" \
> > > +             $(TARGET_DIR)/etc/selinux/semanage.conf
> > > +endef
> > > +LIBSEMANAGE_POST_INSTALL_TARGET_HOOKS += LIBSEMANAGE_SET_SEMANAGE_MAX_POLICY
> > > +HOST_LIBSEMANAGE_POST_INSTALL_HOOKS += LIBSEMANAGE_SET_SEMANAGE_MAX_POLICY  
> >
> > The host hook is not appropriate: it tweaks a file in $(TARGET_DIR),
> > which is not good.

I saw your new iteration, which adds a separate hook for the host
variant. So we need to set this for both the host and target variants
of libsemanage ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
