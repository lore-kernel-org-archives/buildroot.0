From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 11 Nov 2019 15:07:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/sysrepo: fix host/staging
 install steps
In-Reply-To: <20191111145304.00972312@windsurf.home>
References: <20191103060113.4884-1-heiko.thiery@gmail.com>
 <20191108225833.6d81ea18@windsurf>
 <CAEyMn7Yg83V6bQoCG3-JH0ScRm=3qAxVLM3fKA_k1naKjFQqJw@mail.gmail.com>
 <20191111145304.00972312@windsurf.home>
Message-ID: <CAEyMn7Zm+7k+Mwugu-oxRGUjfsyV3btam3DCdR+8mrenzdCzug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Am Mo., 11. Nov. 2019 um 14:53 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> Hello Heiko,
>
> On Sun, 10 Nov 2019 17:00:14 +0100
> Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> > > Do you have a minimal/simple defconfig that allows to reproduce the problem?
> > >
> > > When I build this simple configuration:
> > >
> > > BR2_arm=y
> > > BR2_TOOLCHAIN_EXTERNAL=y
> > > BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> > > BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> > > BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2019.05.1.tar.bz2"
> > > BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
> > > BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
> > > BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> > > # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
> > > BR2_TOOLCHAIN_EXTERNAL_CXX=y
> > > BR2_INIT_NONE=y
> > > BR2_SYSTEM_BIN_SH_NONE=y
> > > # BR2_PACKAGE_BUSYBOX is not set
> > > BR2_PACKAGE_SYSREPO=y
> > > # BR2_TARGET_ROOTFS_TAR is not set
> > >
> > > It builds just fine, with no problem. What is the thing that triggers
> > > the issue ?
> >
> > Your defconfig shows the problem not while building rather in the install step.
>
> Hu? When I said "build", it of course means a Buildroot build, so it
> does both the build and installation of all packages.
>
> The autobuilder failures happens at Buildroot build time, and I was not
> able to reproduce it, and therefore not able to check that your patch
> solves it.

Hmm, now I'm a little bit confused. Do you mean with autobuilder
failure the results of the buildroot CI?
I think this issues was already solves with the patch provided by
Fabrice Fontaine:

http://lists.busybox.net/pipermail/buildroot/2019-October/265043.html
http://lists.busybox.net/pipermail/buildroot/2019-October/265044.html

And currently there should'nt be any autobuilder failures!?

And this patch fixes some "new" issues with wrongly installed files in
wrong locations.

> > the main problem is that the sysrepo cmake build system has a config
> > option REPOSITORY_LOC. This folder is used to set the target of the
> > sysrepo database. Since we want to create this database during the
> > build in the target we have to set this variable to the target
> > directory (currently still a bug in the last applied package). But
> > when setting this directory to the target the host install step also
> > installs stuff (yang models) in this directory. That means host
> > install touches the target directory. I think this is not correct.
>
> True.
>
> > Is there a way to check that the steps only installs/touchs files in
> > the directories they are responsible? With this the problem above
> > could be shown easier.
>
> Not easily no, and there are some packages that violate this rule.
> While not nice, some packages are quite complicated and cannot be
> fixed. An example is the qt5base package, which mainly builds/installs
> Qt5 libraries for the target, but as a side effect also installs some
> host tools in $(HOST_DIR).
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

--
Heiko
