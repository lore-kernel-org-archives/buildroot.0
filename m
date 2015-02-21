From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Feb 2015 16:46:26 +0100
Subject: [Buildroot] [PATCH 1/6 v4] package/freerdp: do not forcibly
 depend on X.Org
In-Reply-To: <30fc930ab51895bd3a7e94baba5d7f6a3735ea5c.1422225347.git.yann.morin.1998@free.fr>
References: <cover.1422225347.git.yann.morin.1998@free.fr>
 <30fc930ab51895bd3a7e94baba5d7f6a3735ea5c.1422225347.git.yann.morin.1998@free.fr>
Message-ID: <20150221164626.6a2cc450@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 25 Jan 2015 23:37:05 +0100, Yann E. MORIN wrote:
> It is possible to build the libfreerdp standalone, without X.Org.
> Having a libfreerdp will be usefull for the weston RDP compositor.
> 
> So, only select the strictly required X.Org library if X.Org is enabled,
> and only build with Xcursor if it is enabled. Drop dependency on other
> X.Org libraries, as they are not strictly required (or get pulled as
> dependencies of the mandatory libXext).
> 
> Re-order the menuconfig, as freerdp is no longer an X-only application.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Reviewed-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  package/Config.in          |  2 +-
>  package/freerdp/Config.in  |  6 +-----
>  package/freerdp/freerdp.mk | 17 +++++++++++++++--
>  3 files changed, 17 insertions(+), 8 deletions(-)

Unfortunately, it doesn't build here :-/

Here is the defconfig I'm using:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2014.11.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_17=y
BR2_TOOLCHAIN_EXTERNAL_LARGEFILE=y
BR2_TOOLCHAIN_EXTERNAL_INET_IPV6=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_FREERDP=y
# BR2_TARGET_ROOTFS_TAR is not set

The error I'm getting are:

-- checking for module 'gstreamer-plugins-base-0.10'
--   package 'gstreamer-plugins-base-0.10' not found
-- Could NOT find GSTREAMER (missing:  GSTREAMER_LIBRARIES GSTREAMER_INCLUDE_DIRS) 
CMake Warning at cmake/FindFeature.cmake:46 (message):
      feature Gstreamer was requested but could not be found! ON / FALSE
Call Stack (most recent call first):
  CMakeLists.txt:377 (find_feature)

The GStreamer part of it I've fixed by adding:

+ifeq ($(BR2_PACKAGE_GSTREAMER),y)
+FREERDP_CONF_OPTS += -DWITH_GSTREAMER=ON
+FREERDP_DEPENDENCIES += gstreamer
+else
+FREERDP_CONF_OPTS += -DWITH_GSTREAMER=OFF
+endif

(untested with GStreamer enabled). Once this is added, the remaining
error is:

CMake Error at channels/client/CMakeLists.txt:33 (list):
  list sub-command REMOVE_DUPLICATES requires list to be present.

My understanding is that the CHANNEL_STATIC_CLIENT_ENTRIES list is
empty.

Can you have a look into this?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
