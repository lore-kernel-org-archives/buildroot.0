From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 12:22:24 +0200
Subject: [Buildroot] [PATCH] sdl_mixer: Enable support for libmodplug
In-Reply-To: <1413602358-7476-1-git-send-email-maarten@treewalker.org>
References: <1413602358-7476-1-git-send-email-maarten@treewalker.org>
Message-ID: <20141019122224.723a9157@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maarten ter Huurne,

On Sat, 18 Oct 2014 05:19:18 +0200, Maarten ter Huurne wrote:
> Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
> ---
>  .../sdl_mixer/sdl_mixer-0001-modplug-include.patch | 33 ++++++++++++++++++++++
>  package/sdl_mixer/sdl_mixer.mk                     |  7 +++++
>  2 files changed, 40 insertions(+)
>  create mode 100644 package/sdl_mixer/sdl_mixer-0001-modplug-include.patch

Unfortunately, this doesn't build here:

checking for MODPLUG... configure: error: The pkg-config script could not be found or is too old.  Make sure it
is in your PATH or set the PKG_CONFIG environment variable to the full
path to pkg-config.

Alternatively, you may set the environment variables MODPLUG_CFLAGS
and MODPLUG_LIBS to avoid the need to call pkg-config.
See the pkg-config man page for more details.

To get pkg-config, see <http://pkg-config.freedesktop.org/>.
See `config.log' for more details.
make: *** [/home/thomas/projets/buildroot/output/build/sdl_mixer-1.2.12/.stamp_configured] Erreur 1

Seems like there is a missing dependency on host-pkgconf. The failing
defconfig was:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2014.08.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_16=y
BR2_TOOLCHAIN_EXTERNAL_LARGEFILE=y
BR2_TOOLCHAIN_EXTERNAL_INET_IPV6=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_SDL=y
BR2_PACKAGE_SDL_MIXER=y
BR2_PACKAGE_LIBMODPLUG=y
# BR2_TARGET_ROOTFS_TAR is not set

However, since you're patching configure.in, the sdl-mixer package
should have SDL_MIXER_AUTORECONF = YES. But when I add this, I get:

configure.in:569: warning: macro 'AM_PATH_SMPEG' not found in library
configure.in:570: error: possibly undefined macro: AM_PATH_SMPEG
      If this token and others are legitimate, please use m4_pattern_allow.
      See the Autoconf documentation.

Can you look into these issues and resend? In the mean time, I've
marked your patch as "Changes Requested".

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
