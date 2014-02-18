From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Feb 2014 21:37:38 +0100
Subject: [Buildroot] [PATCH 1/1] manual/faq: add section about why no
 binary packages
In-Reply-To: <430595ea81c22aef392d3aec25cc93ef9af7bd47.1392659250.git.yann.morin.1998@free.fr>
References: <cover.1392659250.git.yann.morin.1998@free.fr>
 <430595ea81c22aef392d3aec25cc93ef9af7bd47.1392659250.git.yann.morin.1998@free.fr>
Message-ID: <20140218213738.08f54542@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 17 Feb 2014 18:52:12 +0100, Yann E. MORIN wrote:

> +In general, most people think it is easy to do: just track which package
> +installed what and remove it when the package is unselected. However, it
> +is much more complicated than that:
> +
> + * It is not only about the +target/+ directory, but also the sysroot in

"It is not only" is a bit vague. Proposal:

 * The problem is not limited to files installed in the +target/+
   directory: the toolchain sysroot in +host/usr/<tuple>/sysroot+ as
   well as host tools installed in +host/+ should also be tracked.

> +   +host/usr/<tuple>/sysroot+ and the +host/+ directory itself. All files
> +   installed in those directories by various packages must be tracked.
> +
> + * When a package is removed, it is not sufficient to remove just the
> +   files it installed.

When a package is unselected from the configuration, it is not
sufficient to...

> One must also remove all its reverse
> +   dependencies (i.e packages relying on it) and rebuild all those
> +   packages. For example, package A depends optionally on the OpenSSL
> +   library. Both are selected, and Buildroot is built. Package A is
> +   built with crypto support using OpenSSL. Later on, OpenSSL gets
> +   unselected from the configuration, but package A remains (since
> +   OpenSSL is an optional dependency, this is possible). If you just
> +   remove the OpenSSL files, then the files installed by package A are
> +   broken: they use a library that is no longer present on the
> +   target. Technically, it is possible to do this (the prototype that
> +   Lionel Landwerlin and Thomas Petazzoni have worked on started to do
> +   this), but it is difficult and adds a fair bit of complexity.

As Samuel suggested, I don't think mentioning a prototype or even the
names of people who did the prototype belong to an official
documentation.

> + * In addition to the previous problem, there is the case where the
> +   optional dependency is not even known to Buildroot. For example,
> +   package A in version 1.0 never used OpenSSL, but in version 2.0 it
> +   automatically uses OpenSSL if available. If the Buildroot .mk file
> +   hasn't been updated to take this into account, then package A will
> +   not be part of the reverse dependencies of OpenSSL and will not be
> +   removed and rebuilt when OpenSSL is removed. For sure, the .mk file
> +   of package A should be fixed to mention this optional dependency,
> +   but in the mean time, you can have non-reproducible behaviors.
> +
> + * The whole idea is also to allow changes in the menuconfig to be
> +   applied on the output directory without having to rebuild
> +   everything from scratch. However, this is very difficult to achieve
> +   in a reliable way: what happens when the suboptions of a package
> +   are changed (we would have to detect this, and rebuild the package
> +   from scratch and potentially all its reverse dependencies), what
> +   happens if toolchain options are changed, etc. At the moment, what
> +   Buildroot does is clear and simple so its behaviour is very
> +   reliable and it is easy to support users. If we start telling users
> +   that the configuration changes done in menuconfig are applied after
> +   the next make, then it has to work correctly and properly in all
> +   situations, and not have some bizarre corner cases. We fear bug
> +   reports like "I have enabled package A, B and C, then ran make,
> +   then disabled package C and enabled package D and ran make, then
> +   re-enabled package C and enabled package E and then there is a
> +   build failure". Or worse "I did some configuration, then built,
> +   then did some changes, built, some more changes, built, some more
> +   changes, built, and now it fails, but I don't remember all the
> +   changes I did and in which order". This will be impossible to
> +   support.
> +
> +For all these reasons, the conclusion is that adding tracking of
> +installed files to remove them when the package is unselected, or to
> +generate a repository of binary packages, is something that is very
> +hard to achieve reliably and will add a lot of complexity.
> +
> +On this matter, the Buildroot developpers make these position statements:
> +
> + * Buildroot strives at making it easy to generate a root filesystem
> +   (hence the name, by the way). That is what we want to make Buildroot
> +   good at: building root filesystems.
> +
> + * Buildroot is not meant to be a distribution (or rather, a distribution
> +   generator). It is the opinion of most Buildroot developers that this
> +   is not a goal we should pursue. We believe that there are other tools
> +   better suited to generate a distro than Buildroot is. For example,
> +   http://openembedded.org/[Open Embedded], or https://openwrt.org/[openWRT],
> +   are such tools.
> +
> + * We prefer to push Buildroot in a direction that makes it easy (or even
> +   easier) to generate complete root filesystems. This is what makes
> +   Buildroot stands out in the crowd (among other things, of course!).

Additional item (probably the most important one) :

 * We believe that for most embedded Linux systems, binary packages are
   not necessary, and potentially harmful. When binary packages are
   used, it means that the system can be partially upgraded, which
   creates an enormous number of possible combinations of package
   versions that should be tested before doing the upgrade on the
   embedded device. On the other hand, by doing complete system
   upgrades by upgrading the entire root filesystem image at once, you
   guarantee that the image you deploy to you embedded system is really
   the one you have tested and validated.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
