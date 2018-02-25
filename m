From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Feb 2018 22:58:29 +0100
Subject: [Buildroot] [PATCH next v2] waf: bump to 2.0.6
In-Reply-To: <20180219134838.6073-1-aduskett@gmail.com>
References: <20180219134838.6073-1-aduskett@gmail.com>
Message-ID: <20180225225829.2534814d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 19 Feb 2018 08:48:38 -0500, Adam Duskett wrote:
> In addition:
> - Download the tar.bz2 package instead of just the file. The tar
>   includes waf-light which is needed to parse the license.
> 
> - Remove HOST_WAF_EXTRACT_CMDS as the make system can handle extracting
>   the tar.bz2 automatically.
> 
> - Add license and license_files to waf.mk
> 
> - Add sha256sum hash for the license.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
> Changes v1 -> v2:
>   - Changed License to BSD-3-Clause (Baruch)
>   - Use waf-light instead of waf for license file. (Baruch)

Thanks, but this bump breaks the build of mpv (which uses waf). During
the mpv installation step, the build fails with:

Waf: Leaving directory `/home/thomas/projets/buildroot/output/build/mpv-0.27.0/build'
'install' finished successfully (0.366s)
mpv: installs files in /home/thomas/projets/buildroot/output/target//home/thomas/projets/buildroot/output
make[1]: *** [package/pkg-generic.mk:336: /home/thomas/projets/buildroot/output/build/mpv-0.27.0/.stamp_target_installed] Error 1

Reverting the waf bump fixes the problem. Here is the defconfig used to
reproduce the problem:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2017.11-rc1.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_MPV=y
# BR2_TARGET_ROOTFS_TAR is not set

Could you have a look at this ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
