From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 27 Feb 2019 20:57:20 +0100
Subject: [Buildroot] [PATCH-for-master 1/2] package/meson: don't install
 cross-compilation.conf during target-finalize
In-Reply-To: <20190227181841.30b543f9@windsurf>
References: <20190225211147.14947-1-patrickdepinguin@gmail.com>
 <20190225211147.14947-2-patrickdepinguin@gmail.com>
 <877edmcrgf.fsf@dell.be.48ers.dk>
 <CAAXf6LVFtKBiv0RL0MJB+uMOKbcdr5nX3fV300Drcf_dVvMu+A@mail.gmail.com>
 <20190227181841.30b543f9@windsurf>
Message-ID: <CAAXf6LU6Aj=CfKGgOAnkrwJzBf7G8p+wknqb5wx4qGW63t9QTg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El mi?., 27 feb. 2019 a las 18:18, Thomas Petazzoni
(<thomas.petazzoni@bootlin.com>) escribi?:
>
> Hello,
>
> On Tue, 26 Feb 2019 20:48:49 +0100
> Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:
>
> > I haven't played with / investigated the per-package feature yet, so I
> > may miss some specifics.
> > Below is the content of the hook:
> >
> > define HOST_MESON_INSTALL_CROSS_CONF
> >     mkdir -p $(HOST_DIR)/etc/meson
> >     sed -e "s%@TARGET_CROSS@%$(TARGET_CROSS)%g" \
> >         -e "s%@TARGET_ARCH@%$(HOST_MESON_TARGET_CPU_FAMILY)%g" \
> >         -e "s%@TARGET_CPU@%$(HOST_MESON_TARGET_CPU)%g" \
> >         -e "s%@TARGET_ENDIAN@%$(HOST_MESON_TARGET_ENDIAN)%g" \
> >         -e "s%@TARGET_CFLAGS@%$(HOST_MESON_SED_CFLAGS)%g" \
> >         -e "s%@TARGET_LDFLAGS@%$(HOST_MESON_SED_LDFLAGS)%g" \
> >         -e "s%@TARGET_CXXFLAGS@%$(HOST_MESON_SED_CXXFLAGS)%g" \
> >         -e "s%@HOST_DIR@%$(HOST_DIR)%g" \
>
> With per-package enabled, this $(HOST_DIR) here will point to the
> per-package host directory of host-meson instead of pointing to the
> global host directory.
>
> >         $(HOST_MESON_PKGDIR)/cross-compilation.conf.in \
> >         > $(HOST_DIR)/etc/meson/cross-compilation.conf
>
> Here as well, but this one is not an issue: the per-package host
> directory of host-meson will be rsync'ed into the global host directory
> at the end of the build.
>
> > Are there any variables in there that would change value?
>
> With per-package enabled, HOST_DIR, STAGING_DIR and TARGET_DIR have a
> different value when building each package (they point to the current
> package per-package directories) or when building stuff outside of a
> package (they point to the global directories).
>
> > In sequential build, the file before and after this change is identical.
>
> It's not so much sequential vs. parallel, but per-package directories
> or not. Per-package directory can be used while doing a sequential
> build.
>

Thanks for explaining everything.

If I understand it correctly, since the patch is hooking into
TOOLCHAIN_POST_INSTALL_STAGING_HOOKS, HOST_DIR will be the per-package
directory of 'toolchain', not of 'host-meson', right?

To solve it, we could change:
-        -e "s%@HOST_DIR@%$(HOST_DIR)%g" \
+        -e "s%@HOST_DIR@%$(call qstrip,$(BR2_HOST_DIR))%g" \

Is that correct?
And do you consider this acceptable?

Thanks,
Thomas
