From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 06 Oct 2013 20:47:16 +0200
Subject: [Buildroot] [PATCH] pakage/rpi-userland: add and install our
	bcm_host.pc
In-Reply-To: <1381011437-7113-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 6 Oct 2013 00:17:17 +0200")
References: <1381011437-7113-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87wqlqdyob.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Yann> This allows pkg-config-aware packages to include headers from, and
 Yann> link against Broadcom VideoCore host API library.

 Yann> bcm_host.pc copied almost as-is from:
 Yann>     http://cgit.collabora.com/git/user/pq/android-pc-files.git/tree/pkgconfig?h=raspberrypi
 Yann> with only a fix to the prefix (we're using /usr).

 Yann> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Yann> ---
 Yann>  package/rpi-userland/bcm_host.pc     | 11 +++++++++++
 Yann>  package/rpi-userland/rpi-userland.mk |  7 ++++++-
 Yann>  2 files changed, 17 insertions(+), 1 deletion(-)
 Yann>  create mode 100644 package/rpi-userland/bcm_host.pc

 Yann> diff --git a/package/rpi-userland/bcm_host.pc b/package/rpi-userland/bcm_host.pc
 Yann> new file mode 100644
 Yann> index 0000000..28bbe96
 Yann> --- /dev/null
 Yann> +++ b/package/rpi-userland/bcm_host.pc
 Yann> @@ -0,0 +1,11 @@
 Yann> +prefix=/usr
 Yann> +exec_prefix=${prefix}
 Yann> +libdir=${exec_prefix}/lib
 Yann> +includedir=${prefix}/include
 Yann> +
 Yann> +Name: bcm_host
 Yann> +Description: Broadcom VideoCore host API library
 Yann> +Version: 1
 Yann> +Libs: -L${libdir} -lbcm_host -lvcos -lvchiq_arm
 Yann> +Cflags: -I${includedir} -I${includedir}/interface/vmcs_host/linux -I${includedir}/interface/vcos/pthreads -DUSE_VCHIQ_ARM
 Yann> +
 Yann> diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
 Yann> index c3ea43a..575b0c9 100644
 Yann> --- a/package/rpi-userland/rpi-userland.mk
 Yann> +++ b/package/rpi-userland/rpi-userland.mk
 Yann> @@ -14,7 +14,12 @@ RPI_USERLAND_CONF_OPT = -DVMCS_INSTALL_PREFIX=/usr
 Yann>  define RPI_USERLAND_POST_TARGET_CLEANUP
 Yann>      rm -Rf $(TARGET_DIR)/usr/src
 Yann>  endef
 Yann> -
 Yann>  RPI_USERLAND_POST_INSTALL_TARGET_HOOKS += RPI_USERLAND_POST_TARGET_CLEANUP
 
 Yann> +define RPI_USERLAND_POST_TARGET_PC_FILE
 Yann> +	install -D -m 0644 package/rpi-userland/bcm_host.pc \
 Yann> +		$(STAGING_DIR)/usr/lib/pkgconfig/bcm_host.pc
 Yann> +endef
 Yann> +RPI_USERLAND_POST_INSTALL_TARGET_HOOKS += RPI_USERLAND_POST_TARGET_PC_FILE

It installs into staging so it should be
RPI_USERLAND_POST_INSTALL_STAGING_HOOKS.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
