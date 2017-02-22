From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 22 Feb 2017 07:32:19 +0200
Subject: [Buildroot] Bug in "package: add generic support for lz
	archives" ?
In-Reply-To: <20170221225509.28773ef3@free-electrons.com>
References: <0f0805c9d18137c555b446d6b6e7dd2c68d6e770.1486930542.git.baruch@tkos.co.il>
 <1e78e6f82883e4ba95766459a39cbd2d49934152.1486930542.git.baruch@tkos.co.il>
 <20170221225509.28773ef3@free-electrons.com>
Message-ID: <20170222053219.lwceb3yg7r4ymazr@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Feb 21, 2017 at 10:55:09PM +0100, Thomas Petazzoni wrote:
> On Sun, 12 Feb 2017 22:15:39 +0200, Baruch Siach wrote:
> > This commit teaches the generic package handling code how to extract .tar.lz
> > archives. When lzip is not installed on the host, host-lzip gets built
> > automatically.
> > 
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> 
> This patch causes a regression: it seems to build host-lzip
> unconditionally on systems that lack it, even if host-lzip is not
> needed at all to uncompress some tarballs.
> 
> Take for example:
> 
> BR2_x86_64=y
> BR2_x86_atom=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-x86-64-musl-2017.02-rc1-2-g133c5ac.tar.bz2"
> BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_INIT_NONE=y
> BR2_SYSTEM_BIN_SH_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> BR2_PACKAGE_TCL=y
> BR2_PACKAGE_EXPECT=y
> # BR2_TARGET_ROOTFS_TAR is not set
> 
> Nothing is .lz compressed in there, and still, it builds host-lzip at
> the beginning of the build:
> 
> >>> host-lzip 1.18 Extracting
> >>> host-lzip 1.18 Patching
> >>> host-lzip 1.18 Configuring
> >>> host-lzip 1.18 Building
> >>> host-lzip 1.18 Installing to host directory
> >>> skeleton  Extracting
> >>> skeleton  Patching
> >>> skeleton  Configuring
> >>> skeleton  Building
> >>> skeleton  Installing to staging directory
> >>> skeleton  Fixing libtool files
> >>> skeleton  Installing to target
> 
> Could you have a look ?

The xzcat and tar checks behave the same way. There is no logic to determine 
whether a given dependency is actually needed in this particular build.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
