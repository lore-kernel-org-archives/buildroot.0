From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 27 Jun 2012 22:19:09 +0200
Subject: [Buildroot] [PATCH] libusb: needs thread support
In-Reply-To: <1340728321-24139-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 26 Jun 2012 13:32:01 -0300")
References: <1340728321-24139-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87k3ys5wzm.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> libusb needs thread support, hence libusb-compat too and a whole other
 Gustavo> bunch of packages or optionals too.

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/bluez_utils/Config.in    |    1 +
 Gustavo>  package/efl/libedbus/Config.in   |    1 +
 Gustavo>  package/libfreefare/Config.in    |    4 ++++
 Gustavo>  package/libftdi/Config.in        |    4 ++++
 Gustavo>  package/libhid/Config.in         |    4 ++++
 Gustavo>  package/libiqrf/Config.in        |    4 ++++
 Gustavo>  package/libnfc/Config.in         |    4 ++++
 Gustavo>  package/libusb-compat/Config.in  |    4 ++++
 Gustavo>  package/libusb/Config.in         |    4 ++++
 Gustavo>  package/openocd/Config.in        |    4 ++++
 Gustavo>  package/usb_modeswitch/Config.in |    4 ++++
 Gustavo>  package/usbutils/Config.in       |    4 ++++
 Gustavo>  12 files changed, 42 insertions(+), 0 deletions(-)

 Gustavo> diff --git a/package/bluez_utils/Config.in b/package/bluez_utils/Config.in
 Gustavo> index 3517407..15ffd37 100644
 Gustavo> --- a/package/bluez_utils/Config.in
 Gustavo> +++ b/package/bluez_utils/Config.in
 Gustavo> @@ -24,6 +24,7 @@ config BR2_PACKAGE_BLUEZ_UTILS_AUDIO
 
 Gustavo>  config BR2_PACKAGE_BLUEZ_UTILS_USB
 Gustavo>  	bool "USB support"
 Gustavo> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 Gustavo>  	select BR2_PACKAGE_LIBUSB
 Gustavo>  	help
 Gustavo>  	  USB support
 Gustavo> diff --git a/package/efl/libedbus/Config.in b/package/efl/libedbus/Config.in
 Gustavo> index 0914b37..e695589 100644
 Gustavo> --- a/package/efl/libedbus/Config.in
 Gustavo> +++ b/package/efl/libedbus/Config.in
 Gustavo> @@ -14,6 +14,7 @@ if BR2_PACKAGE_LIBEDBUS
 
 Gustavo>  config BR2_PACKAGE_LIBEDBUS_BLUEZ
 Gustavo>  	bool "bluez support"
 Gustavo> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 Gustavo>  	select BR2_PACKAGE_BLUEZ_UTILS

Why? It's only the BLUEZ_UTILS_USB option that depends on threads,
right?


 Gustavo> index f6f49ca..f44aa93 100644
 Gustavo> --- a/package/libusb-compat/Config.in
 Gustavo> +++ b/package/libusb-compat/Config.in
 Gustavo> @@ -1,7 +1,11 @@
 Gustavo>  config BR2_PACKAGE_LIBUSB_COMPAT
 Gustavo>  	bool "libusb-compat"
 Gustavo>  	depends on BR2_PACKAGE_LIBUSB
 Gustavo> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 Gustavo>  	help
 Gustavo>  	  libusb-0.1 compatibility layer for libusb-1.0.
 
 Gustavo>  	  http://libusb.sourceforge.net/
 Gustavo> +
 Gustavo> +comment "libusb-compat needs a toolchain with thread support"
 Gustavo> +	depends on !BR2_TOOLCHAIN_HAS_THREADS


This hunk is not strictly needed as it depends on libusb.

-- 
Bye, Peter Korsgaard
