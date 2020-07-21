From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Jul 2020 21:27:29 +0200
Subject: [Buildroot] [PATCH 2/4] package/localedef: use upstream glibc
 version
In-Reply-To: <20200720164723.359198-2-romain.naour@gmail.com>
References: <20200720164723.359198-1-romain.naour@gmail.com>
 <20200720164723.359198-2-romain.naour@gmail.com>
Message-ID: <20200721212729.41a9374e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Jul 2020 18:47:21 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Since the upstream version and site are always defined in Kconfig now,
> they are always available, so we can use them to define the localedef
> version and site. We also change the localedef hash file to be a
> symlink to the glibc one.
> 
> Now, there is no manual action to do to keep localedef and glibc in
> sync for the internal toolchain.
> 
> External toolchains will use the upstream glibc version (as is currently
> the case already); with some luck, it is good enough if the external
> toolchain is not too old (2.26 or older may have issues, but there's
> nothing we can do as we can't know what version is used).
> 
> Additionally, for some architectures, the internall toolchain uses a
> forked glibc tree. In theory, we would also want to use the localedef
> from those trees, but that would mean we would have to carry a patch for
> each, to be able to build only localedef. This is highly inpractical.
> 
> However, those architectures are close enought to upstream that upstream
> localedef is compatible. Besides, the current behaviour is already to
> use an upstream localedef for those architectures anyway, so we keep
> doing that.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

Unfortunately, this breaks building host-localedef for external
toolchains. Indeed, package/glibc/Config.in is only included in the
Config.in machinery when the internal toolchain backend is used. I'm
not sure what is the best way to solve this.

Another concern is that this change doesn't make it as "transparent" as
it seems to update the glibc version: the idea was that changing
BR2_GLIBC_VERSION_UPSTREAM would be sufficient, and localedef would
automatically use that new version. Unfortunately, this doesn't work
due to the hash file of localedef:

package/localedef/2.30-67-g4748829f86a458b76642f3e98b1d80f7b868e427/localedef.hash -> ../../glibc/2.30-67-g4748829f86a458b76642f3e98b1d80f7b868e427/glibc.hash

This symlink anyway needs to be updated in localedef whenever
BR2_GLIBC_VERSION_UPSTREAM is changed.

With PATCH 3/4 in this series, it becomes worse as another symlink is
needed for the other glibc version that we would support.

Another concern with localedef, though not related to this series, is
that with external toolchains, you don't know which glibc version is
used in the toolchain. We may need a post-2.27 localedef, or a pre-2.27
localedef. I'm not sure how to solve that though. Random thought: for
the internal toolchains, have a host-glibc package that builds
localedef for the host, so that its version is naturally in sync with
the target glibc. For external toolchains, have the host-localedef
package with a version choice between different upstream glibc
versions, and it's up to the user to select the right thing ?

Overall, this is quite complicated, and it's annoying to keep glibc
2.31 unsupported because of this. To me, it feels like glibc 2.31 has
been around for quite a while now. Why not just make the jump, keep a
single glibc version that we bump to 2.31 ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
