From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 7 Apr 2021 21:28:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/iwd: bump to version 1.13
In-Reply-To: <20210406164052.1245212-1-fontaine.fabrice@gmail.com>
References: <20210406164052.1245212-1-fontaine.fabrice@gmail.com>
Message-ID: <32075a88-dcc0-2b75-8b66-dd02f71fdcba@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06/04/2021 18:40, Fabrice Fontaine wrote:
> iwd fails to build since bump of ell to version 0.39 in commit
> 9988ca9eadb90cbf10d150b420f4d1f5eb38482c:
> 
> /home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc64-buildroot-linux-gnu/9.3.0/../../../../powerpc64-buildroot-linux-gnu/bin/ld: src/ie.o: in function `ie_parse_data_rates':
> ie.c:(.text+0x23ac): undefined reference to `minsize'
> 
> This is fixed by
> https://git.kernel.org/pub/scm/network/wireless/iwd.git/commit/?id=17cf4da72613e80d08d51401399d02683ba8664b
> 
> Use official iwd tarball which will contain ell/useful.h header

 ... and which we anyway prefer. I guess Peter hadn't found the release tarball
when he contributed iwd.

> 
> https://git.kernel.org/pub/scm/network/wireless/iwd.git/tree/ChangeLog?h=1.13
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/44e243530cbcec1c88511bb22f5e8e4655c43824
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout


> ---
>  package/iwd/iwd.hash |  4 ++--
>  package/iwd/iwd.mk   | 14 +++-----------
>  2 files changed, 5 insertions(+), 13 deletions(-)
> 
> diff --git a/package/iwd/iwd.hash b/package/iwd/iwd.hash
> index b043af745d..7975b0b3ce 100644
> --- a/package/iwd/iwd.hash
> +++ b/package/iwd/iwd.hash
> @@ -1,5 +1,5 @@
> -# Locally computed
> -sha256  c0d827f446012cd14e63d174d52b69b0806ae23f0708933d50c57fea64af9c8a  iwd-1.12-br1.tar.gz
> +# From https://mirrors.edge.kernel.org/pub/linux/network/wireless/sha256sums.asc
> +sha256  b005f7ed0f0a96a2c6181c44560fc868533a18e7034bd4cb43ea0d40c21b4e7a  iwd-1.13.tar.xz
>  
>  # License files
>  sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
> diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
> index f38552de99..aaa07a25ba 100644
> --- a/package/iwd/iwd.mk
> +++ b/package/iwd/iwd.mk
> @@ -4,15 +4,13 @@
>  #
>  ################################################################################
>  
> -IWD_VERSION = 1.12
> -IWD_SITE = https://git.kernel.org/pub/scm/network/wireless/iwd.git
> -IWD_SITE_METHOD = git
> +IWD_VERSION = 1.13
> +IWD_SOURCE = iwd-$(IWD_VERSION).tar.xz
> +IWD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/wireless
>  IWD_LICENSE = LGPL-2.1+
>  IWD_LICENSE_FILES = COPYING
>  IWD_CPE_ID_VENDOR = intel
>  IWD_CPE_ID_PRODUCT = inet_wireless_daemon
> -# sources from git, no configure script provided
> -IWD_AUTORECONF = YES
>  IWD_SELINUX_MODULES = networkmanager
>  
>  IWD_CONF_OPTS = \
> @@ -20,12 +18,6 @@ IWD_CONF_OPTS = \
>  	--enable-external-ell
>  IWD_DEPENDENCIES = ell
>  
> -# autoreconf requires an existing build-aux directory
> -define IWD_MKDIR_BUILD_AUX
> -	mkdir -p $(@D)/build-aux
> -endef
> -IWD_POST_PATCH_HOOKS += IWD_MKDIR_BUILD_AUX
> -
>  ifeq ($(BR2_PACKAGE_DBUS),y)
>  IWD_CONF_OPTS += --enable-dbus-policy --with-dbus-datadir=/usr/share
>  IWD_DEPENDENCIES += dbus
> 
