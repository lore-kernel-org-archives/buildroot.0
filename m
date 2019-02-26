From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 26 Feb 2019 20:48:49 +0100
Subject: [Buildroot] [PATCH-for-master 1/2] package/meson: don't install
 cross-compilation.conf during target-finalize
In-Reply-To: <877edmcrgf.fsf@dell.be.48ers.dk>
References: <20190225211147.14947-1-patrickdepinguin@gmail.com>
 <20190225211147.14947-2-patrickdepinguin@gmail.com>
 <877edmcrgf.fsf@dell.be.48ers.dk>
Message-ID: <CAAXf6LVFtKBiv0RL0MJB+uMOKbcdr5nX3fV300Drcf_dVvMu+A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El mar., 26 feb. 2019 a las 19:52, Peter Korsgaard
(<peter@korsgaard.com>) escribi?:
>
> >>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:
>
>  > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>  > package/meson installs a cross-compilation.conf file in
>  > $(HOST_DIR)/etc/meson, via TARGET_FINALIZE_HOOKS.
>
>  > package/pkg-cmake.mk installs a toolchainfile.cmake in
>  > $(HOST_DIR)/share/buildroot, via TOOLCHAIN_POST_INSTALL_STAGING_HOOKS.
>
>  > Both files have a similar concept, they describe some flags/paths needed for
>  > compilation using respective build systems. One difference is that the meson
>  > file is added for external compilation, from the SDK, while the cmake file
>  > is used internally in Buildroot.
>
>  > The 'problem' of using TARGET_FINALIZE_HOOKS for the meson file, is that it
>  > installs a 'host' file from target-finalize, which is conceptually incorrect
>  > and breaks the invariant that only TARGET_DIR is changed on a subsequent
>  > 'make' when everything was already built (i.e. only target-finalize is run).
>
>  > This can easily be fixed, by using the same hook as cmake uses, i.e.
>  > TOOLCHAIN_POST_INSTALL_STAGING_HOOKS.
>
>  > Note that actually even for cmake, TOOLCHAIN_POST_INSTALL_STAGING_HOOKS is
>  > not the best hook to install a host file. A better hook would have been
>  > TOOLCHAIN_POST_INSTALL_HOOKS, but this triggers only for 'host' packages,
>  > and 'toolchain' is treated as a 'target' package.
>
>  > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>  > ---
>  >  package/meson/meson.mk | 3 ++-
>  >  1 file changed, 2 insertions(+), 1 deletion(-)
>
>  > diff --git a/package/meson/meson.mk b/package/meson/meson.mk
>  > index d76541cc93..aba7382cc9 100644
>  > --- a/package/meson/meson.mk
>  > +++ b/package/meson/meson.mk
>  > @@ -65,6 +65,7 @@ define HOST_MESON_INSTALL_CROSS_CONF
>  >> $(HOST_DIR)/etc/meson/cross-compilation.conf
>  >  endef
>
>  > -TARGET_FINALIZE_HOOKS += HOST_MESON_INSTALL_CROSS_CONF
>  > +TOOLCHAIN_POST_INSTALL_STAGING_HOOKS += HOST_MESON_INSTALL_CROSS_CONF
>
> Is this then going to use the correct (final) paths for per-package
> build directories?
>

I haven't played with / investigated the per-package feature yet, so I
may miss some specifics.
Below is the content of the hook:

define HOST_MESON_INSTALL_CROSS_CONF
    mkdir -p $(HOST_DIR)/etc/meson
    sed -e "s%@TARGET_CROSS@%$(TARGET_CROSS)%g" \
        -e "s%@TARGET_ARCH@%$(HOST_MESON_TARGET_CPU_FAMILY)%g" \
        -e "s%@TARGET_CPU@%$(HOST_MESON_TARGET_CPU)%g" \
        -e "s%@TARGET_ENDIAN@%$(HOST_MESON_TARGET_ENDIAN)%g" \
        -e "s%@TARGET_CFLAGS@%$(HOST_MESON_SED_CFLAGS)%g" \
        -e "s%@TARGET_LDFLAGS@%$(HOST_MESON_SED_LDFLAGS)%g" \
        -e "s%@TARGET_CXXFLAGS@%$(HOST_MESON_SED_CXXFLAGS)%g" \
        -e "s%@HOST_DIR@%$(HOST_DIR)%g" \
        $(HOST_MESON_PKGDIR)/cross-compilation.conf.in \
        > $(HOST_DIR)/etc/meson/cross-compilation.conf
endef

Are there any variables in there that would change value?

In sequential build, the file before and after this change is identical.

Best regards,
Thomas
