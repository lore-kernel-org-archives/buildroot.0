From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sun, 10 Nov 2019 17:00:14 +0100
Subject: [Buildroot] [PATCH 1/1] package/sysrepo: fix host/staging
 install steps
In-Reply-To: <20191108225833.6d81ea18@windsurf>
References: <20191103060113.4884-1-heiko.thiery@gmail.com>
 <20191108225833.6d81ea18@windsurf>
Message-ID: <CAEyMn7Yg83V6bQoCG3-JH0ScRm=3qAxVLM3fKA_k1naKjFQqJw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Fr., 8. Nov. 2019 um 22:58 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> Hello Heiko,
>
> On Sun,  3 Nov 2019 07:01:14 +0100
> Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> > From: Heiko Thiery <heiko.thiery@kontron.com>
> >
> > The sysrepoctl and sysrepocfg executables are used in install steps
> > of the package. Since there are hard-coded install pathes,
> > this leeds to wrong installation directories in host and staging
> > install steps.
> >
> > Only sysrepoctl and sysrepocfg executables are needed from host build.
> > So build and install only the executables in this step.
> >
> > The staging step only needs to install the library with the
> > corresponding files like the headers and the pkg-config.
> >
> > Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>
> > ---
> >  package/sysrepo/sysrepo.mk | 36 ++++++++++++++++++++++++++----------
> >  1 file changed, 26 insertions(+), 10 deletions(-)
>
> Do you have a minimal/simple defconfig that allows to reproduce the problem?
>
> When I build this simple configuration:
>
> BR2_arm=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2019.05.1.tar.bz2"
> BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
> BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_INIT_NONE=y
> BR2_SYSTEM_BIN_SH_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> BR2_PACKAGE_SYSREPO=y
> # BR2_TARGET_ROOTFS_TAR is not set
>
> It builds just fine, with no problem. What is the thing that triggers
> the issue ?

Your defconfig shows the problem not while building rather in the install step.

the main problem is that the sysrepo cmake build system has a config
option REPOSITORY_LOC. This folder is used to set the target of the
sysrepo database. Since we want to create this database during the
build in the target we have to set this variable to the target
directory (currently still a bug in the last applied package). But
when setting this directory to the target the host install step also
installs stuff (yang models) in this directory. That means host
install touches the target directory. I think this is not correct.

Is there a way to check that the steps only installs/touchs files in
the directories they are responsible? With this the problem above
could be shown easier.

--
Heiko
