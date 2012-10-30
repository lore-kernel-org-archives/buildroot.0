From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Oct 2012 13:45:12 +0100
Subject: [Buildroot] [PATCH] package: add bcusdk
In-Reply-To: <1351599843-24291-2-git-send-email-gregory.hermant@calao-systems.com>
References: <1351599843-24291-1-git-send-email-gregory.hermant@calao-systems.com>
 <1351599843-24291-2-git-send-email-gregory.hermant@calao-systems.com>
Message-ID: <20121030134512.0d8f3ec6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gregory Hermant,

On Tue, 30 Oct 2012 13:24:01 +0100, Gregory Hermant wrote:
> +comment "bcusdk requires a toolchain with C++ "
> +	depends on !(BR2_INSTALL_LIBSTDCPP)

Parenthesis not needed.

> diff --git a/package/bcusdk/bcusdk-0.0.5-fix-pthsem-config-issue.patch b/package/bcusdk/bcusdk-0.0.5-fix-pthsem-config-issue.patch
> new file mode 100644
> index 0000000..82649f0
> --- /dev/null
> +++ b/package/bcusdk/bcusdk-0.0.5-fix-pthsem-config-issue.patch
> @@ -0,0 +1,33 @@
> +From 8129fd135b0674017854fd722105eb0558cd3987 Mon Sep 17 00:00:00 2001
> +From: Gregory Hermant <gregory.hermant@calao-systems.com>
> +Date: Mon, 22 Oct 2012 15:29:43 +0200
> +Subject: [PATCH] Prevent pthsem-config script to return bad include path.
> +
> +During the bcusdk configuration step, the script pthsem-config
> +is used to return some parameters about the pthsem library location.
> +Unfortunately this script returns host include path and prevents
> +the bcusdk build.
> +
> +Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
> +---
> + configure |    4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/configure b/configure
> +index 843e017..f77d5a9 100755
> +--- a/configure
> ++++ b/configure
> +@@ -15958,8 +15958,8 @@ if test ".$with_pth" != .no; then
> +                                         if test ".$_pth_version" != .; then
> +                         _pth_location=`$_dir/pthsem-config --prefix`
> +                         _pth_type="installed"
> +-                        _pth_cppflags=`$_dir/pthsem-config --cflags`
> +-                        _pth_cflags=`$_dir/pthsem-config --cflags`
> ++#                       _pth_cppflags=`$_dir/pthsem-config --cflags`
> ++#                       _pth_cflags=`$_dir/pthsem-config --cflags`
> +                         _pth_ldflags=`$_dir/pthsem-config --ldflags`
> +                         _pth_libs=`$_dir/pthsem-config --libs --all`
> +                         _pth_found=yes

No, that's not the way we handle this problem in Buildroot. In the
pthsem package, you should mungle the pthsem-config script after
installation, in order to adjust the paths. See
package/libpng/libpng.mk for an example.

> +BCUSDK_VERSION = 0.0.5
> +BCUSDK_SOURCE = bcusdk_$(BCUSDK_VERSION).tar.gz
> +BCUSDK_SITE = http://www.auto.tuwien.ac.at/~mkoegler/eib/
> +BCUSDK_LICENSE = GPLv2+
> +BCUSDK_LICENSE_FILES = COPYING
> +BCUSDK_INSTALL_STAGING = YES
> +BCUSDK_INSTALL_TARGET = YES

_INSTALL_TARGET=YES not needed, it's the default.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
