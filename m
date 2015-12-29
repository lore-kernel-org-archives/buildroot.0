From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Dec 2015 13:51:04 +0100
Subject: [Buildroot] [PATCH 1/1 v1] yp-tools: new package
In-Reply-To: <alpine.DEB.2.11.1512291332270.647@tanhuma.tkos.co.il>
References: <1450893584-2926-1-git-send-email-yba@tkos.co.il>
 <20151228225821.5112f7df@free-electrons.com>
 <alpine.DEB.2.11.1512291332270.647@tanhuma.tkos.co.il>
Message-ID: <20151229135104.3544d057@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jonathan,

On Tue, 29 Dec 2015 13:37:34 +0200 (IST), Jonathan Ben Avraham wrote:

> Do you mean a git-generated change log from the previous version of the 
> patch to the current version of the patch?

Git cannot generate such a changelog, only a human can describe the
changes between two iterations of a patch (or patch series).

See
https://buildroot.org/downloads/manual/manual.html#submitting-patches
for details, and especially the section "21.5.2. Patch revision
changelog".


> > and it fails to build with:
> >
> > yp_get_default_domain.c:23:24: fatal error: rpcsvc/nis.h: No such file
> > or directory
> 
> What would be a good set of configs to test before submitting patches?

Depends on what you want to test. From my point of view, testing with
at least
http://autobuild.buildroot.org/toolchains/configs/br-arm-full.config is
a strict minimum. It's a uClibc configuration for ARM, with all
toolchain features enabled. If your package doesn't build with this
one, it's really a no-go (and your package currently doesn't build with
this one).

Then, if you don't have any toolchain feature dependency, you may want
to try with
http://autobuild.buildroot.org/toolchains/configs/br-arm-basic.config,
which is the same as above, except that things like RPC, wchar, locales
and al. are disabled.

If you want to verify that your package builds for noMMU platforms, you
can use
http://autobuild.buildroot.org/toolchains/configs/bfin-linux-uclibc.config.

If you want to verify that your package builds without shared library
support, you can use:
http://autobuild.buildroot.org/toolchains/configs/br-arm-full-static.config.

If you want to verify that your package builds without thread support,
you can use:
http://autobuild.buildroot.org/toolchains/configs/br-arm-full-nothread.config.

If you want to verify that your package builds with the musl C library,
you can use:
http://autobuild.buildroot.org/toolchains/configs/br-arm-cortex-a9-musl.config.

If you want to verify that your package builds with gcc 5.x, you can
use:
http://autobuild.buildroot.org/toolchains/configs/br-arm-cortex-a9-glibc.config.

However, it is pointless to test *all* those combinations every time
you submit a package: the autobuilder infrastructure will do it for
you. However, building with the first one (ARM/uClibc/all features) is
definitely something that should be tested before submitting a patch.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
