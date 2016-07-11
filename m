From: daggs <daggs@gmx.com>
Date: Mon, 11 Jul 2016 23:00:32 +0200
Subject: [Buildroot] prefix question for kodi.
In-Reply-To: <CAHXCMM+xuaawC=rJiDrX8VwLQbhTVcDoekS86ZTsfRzK5mODdQ@mail.gmail.com>
References: <trinity-f49f8e10-13bc-491a-a4be-f1a55d2f391d-1468088008466@3capp-mailcom-bs09>,
 <CAHXCMM+xuaawC=rJiDrX8VwLQbhTVcDoekS86ZTsfRzK5mODdQ@mail.gmail.com>
Message-ID: <trinity-cc016c92-f8fd-4e35-8ecb-627f04899e3c-1468270832325@3capp-mailcom-bs13>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,

> This is not Kodi-specific, this is done like things for many packages
> (i.e. for all packages using a decent build-system, e.g. autotools
> [1], cmake [2], etc).. So, almost all packages.
> 
> For building a target package, the prefix must point to /usr, and not
> to the staging dir. because:
> 1. The --prefix option sets the prefix location in the target
> directory, i.e. as its should be at runtime (at runtime in the target
> system).
> So, in the case of Buildroot, this is not (and must not be) the
> absolute location where stuff will be installed.
> Note that if you set prefix to STAGING_DIR, I bet your final rootfs
> won't look like what you'd expect, and may not work as expected... or
> not work at all!
> 2. To install stuff in a location different from the runtime one, we
> use the standard variable DESTDIR (see [3,4])
> So, basically when a package using a decent build-system execute an
> install rule, it computes the install location like this:
>   stuff_install_path = ${DESTDIR}${prefix}/${stuf_dir}
> 3. We don't (want to) build target packages twice, with only the
> --prefix option changed between these 2 builds (i.e. once with
> --prefix=$(STAGING_DIR)... and a second time with
> --prefix=$(TARGET_DIR)...).
> So, from the aforementioned reasons we build each target package once
> with the right prefix for the target rootfs, and install twice (if
> needed), once with DESTDIR=$(TARGET_DIR) and a second time with
> DESTDIR=$(STAGING_DIR), see [3,4].
> 
> Note that for the build, things are correctly routed to the staging
> dir. thanks to:
> - the --sysroot option, optionally with -I.. or -L.. pointing to the
> staging tree;
> - the Buildroot compiler wrapper that enforce these options to be
> correctly set, and also check for poisoning paths (i.e. paths pointing
> to standard host system locations, e.g. /usr/lib or /usr/local/lib,
> etc).
> 
> So, unless you are not lucky packaging a projet that use a
> non-standard build-system, or does nasty things at configure-time, you
> should not  paid much attention to this prefix option, Buildroot
> handles it for you ;-)
> 
> Regards,
> 
> [1] https://github.com/buildroot/buildroot/blob/master/package/pkg-autotools.mk#L181
> [2] https://github.com/buildroot/buildroot/blob/master/package/pkg-cmake.mk#L91
> [3] https://github.com/buildroot/buildroot/blob/master/package/pkg-autotools.mk#L159
> [4] https://github.com/buildroot/buildroot/blob/master/package/pkg-cmake.mk#L60
> 
> -- 
> Samuel
> 

thanks for the detailed explenation, I'm not trying to do anyting fancy, only compile kodi with the --enable-codec=amcodec.
as seen in my previous mail, there is no --sysroot passed to kodi, also unless I'm misunderstood something, using the DESTDIR doesn't help at it is blank.
my issue is that when amcodec is enabled, one of kodi's makefiles define adds new incldue path as follows: ${prefix}/usr/include/<something>.
as prefix is empty, instead of searching the code at staging's sysroot, it searches it on the local machine's path, generating a WARNING: unsafe header/library path used in cross-compilation error.

how can I use DESTDIR properly?

Dagg.
