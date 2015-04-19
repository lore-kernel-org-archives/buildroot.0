From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun, 19 Apr 2015 13:17:00 +0200
Subject: [Buildroot] [PATCH 1/1] gtest: update recipe to use autotools
In-Reply-To: <1425300779-18236-1-git-send-email-casantos@datacom.ind.br>
References: <1425300779-18236-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <CAHkwnC-cZpP5m5009NiLZM07+t8CFSYVxqTBmNuXEA-x9mGwLg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Mar 2, 2015 at 1:52 PM, Carlos Santos <casantos@datacom.ind.br> wrote:
> The previous recipe build gtest using cmake, which prevented compiling
> gmock (to be submitted in a following patch).
>
> Gmock requires the gtest-config script, which is installed only if gtest
> is built with autotools.


Because the autotools build script is no longer officially supported
[1] it would be better to use cmake, there is no way to generate the
gtest-config script within cmake?

[1]:
gtest-1.7.0/README:
The Autotools build script (configure + make) is no longer officially
supportted.  You are encouraged to migrate to your own build system or
use CMake.  If you still need to use Autotools, you can find
instructions in the README file from Google Test 1.4.0.



> Signed-off-by: Marcelo Barbosa <marcelo.barbosa@datacom.ind.br>
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---
>  package/gtest/gtest.mk | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
>
> diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
> index 7129c93..e148462 100644
> --- a/package/gtest/gtest.mk
> +++ b/package/gtest/gtest.mk
> @@ -12,24 +12,16 @@ GTEST_INSTALL_TARGET = NO
>  GTEST_LICENSE = BSD-3c
>  GTEST_LICENSE_FILES = LICENSE
>
> -# While it is possible to build gtest as shared library, using this gtest shared
> -# library requires to set some special configure option in the project using
> -# gtest.
> -# So, force to build gtest as a static library.
> -#
> -# For further details, refer to the explaination given in the README file from
> -# the gtest sources.
> -GTEST_CONF_OPTS = -DBUILD_SHARED_LIBS=OFF
> -
>  define GTEST_EXTRACT_CMDS
>         $(UNZIP) $(DL_DIR)/$(GTEST_SOURCE) -d $(BUILD_DIR)
>  endef
>
>  define GTEST_INSTALL_STAGING_CMDS
> -       $(INSTALL) -D -m 0755 $(@D)/libgtest.a $(STAGING_DIR)/usr/lib/libgtest.a
> -       $(INSTALL) -D -m 0755 $(@D)/libgtest_main.a $(STAGING_DIR)/usr/lib/libgtest_main.a
> +       $(INSTALL) -D -m 0755 $(@D)/lib/.libs/libgtest.a $(STAGING_DIR)/usr/lib/libgtest.a
> +       $(INSTALL) -D -m 0755 $(@D)/lib/.libs/libgtest_main.a $(STAGING_DIR)/usr/lib/libgtest_main.a
> +       $(INSTALL) -D -m 0755 $(@D)/scripts/gtest-config $(STAGING_DIR)/usr/lib/scripts/gtest-config
>         $(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/gtest/
>         cp -rp $(@D)/include/gtest/* $(STAGING_DIR)/usr/include/gtest/
>  endef
>
> -$(eval $(cmake-package))
> +$(eval $(autotools-package))
> --
> 1.8.3.1

This patch apply fine, but it fails to install the gtest package:

defconfig:
BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_GTEST=y

>>> gtest 1.7.0 Installing to staging directory
/usr/bin/install -D -m 0755
/home/tetsuya/buildroot/br/output/build/gtest-1.7.0/lib/.libs/libgtest.a
/home/tetsuya/buildroot/br/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libgtest.a
/usr/bin/install: cannot stat
?/home/tetsuya/buildroot/br/output/build/gtest-1.7.0/lib/.libs/libgtest.a?:
No such file or directory
package/pkg-generic.mk:203: recipe for target
'/home/tetsuya/buildroot/br/output/build/gtest-1.7.0/.stamp_staging_installed'
failed
make: *** [/home/tetsuya/buildroot/br/output/build/gtest-1.7.0/.stamp_staging_installed]
Error 1

BR
-- 
Fabio Porcedda
