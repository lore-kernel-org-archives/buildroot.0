From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 3 May 2020 13:48:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/gobject-introspection: fix host
 version of .pc file for wrapper
In-Reply-To: <CADvTj4oM52ZaAVbC3pUjTPf5ezKj36SF76Udz1c7uBsryXMdRw@mail.gmail.com>
References: <20200502060435.23004-1-james.hilliard1@gmail.com>
 <20200502143243.4e2b3ef3@windsurf.home>
 <CADvTj4oM52ZaAVbC3pUjTPf5ezKj36SF76Udz1c7uBsryXMdRw@mail.gmail.com>
Message-ID: <20200503134807.4e709fe4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello James,

On Sat, 2 May 2020 13:36:04 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> > > +define HOST_GOBJECT_INTROSPECTION_INSTALL_WRAPPERS
> > > +     # Set prefix to /usr because pkg-config appends the sysroot directory
> > > +     $(SED) "s%^prefix=.*%prefix=\/usr%g" \
> > > +             $(HOST_DIR)/usr/lib/pkgconfig/gobject-introspection-1.0.pc  
> >
> > No, the host variant of pkg-config should not append the sysroot
> > directory. If it does, then it is wrong.  
> Well this was when building the target package that uses the host
> pkgconfig libdir.

And? According to 4e0bc29993376613d200e892d491e31ea5a49622, Meson has
some understanding of when it is using pkg-config to find libraries to
build native code or to build target code.

As you can see in this commit:

-pkgconfig = '@HOST_DIR@/usr/bin/pkg-config'
+pkgconfig = '@HOST_DIR@/bin/pkgconf'

Meson is no longer going through our pkg-config wrapper that passes the
right environment variables to ensure pkg-config returns values valid
for building target code.

Since Meson goes through $(HOST_DIR)/bin/pkgconf directly, we do not
pass any specific sysroot argument to pkg-config. It is up to Meson to
pass the appropriate sysroot value when working with target code, and
to not pass any sysroot value when working on native code.

See the commit log of 4e0bc29993376613d200e892d491e31ea5a49622:

    meson is able to distinguish between host (= native) and target (=
    cross) compilation. It will explicitly pass different options to
    pkg-config to distinguish them. Therefore, we don't need to use the
    pkg-config wrapper when using meson, and can instead pass the pkg-config
    settings through the cross-compilation.conf.
    
    This is important because in some situations (e.g. for the Python
    configuration), meson sets the PKG_CONFIG_LIBDIR variable to a different
    value before calling pkg-config. Relying on our wrapper script doesn't
    work in that case (except if the script would unconditionally set
    PKG_CONFIG_LIBDIR, which it doesn't do at the moment).
    
    Add the sys_root and pkg_config_lib settings to cross-compilation.conf
    and use pkgconf directly instead of the wrapper.
    
    Note that this requires us to substitute STAGING_DIR as well, with an
    absolute path. This is not a big deal since cross-compilation.conf is
    regenerated for every package.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
