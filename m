From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 17 Nov 2012 22:17:35 +0100
Subject: [Buildroot] [PATCH v2] libusb: disable on avr32
In-Reply-To: <1353186466-2269-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Sat, 17 Nov 2012 21:07:46 +0000")
References: <1353186466-2269-1-git-send-email-spdawson@gmail.com>
Message-ID: <87ehjsrksw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 spdawson> From: Simon Dawson <spdawson@gmail.com>
 spdawson> For target architecture avr32, the gpsd package fails to build when
 spdawson> libusb is selected. The following autobuild failure illustrates the problem.

 spdawson>   http://autobuild.buildroot.net/results/aa3d4763a0e90c995bc8431cf345730ee22e65a1/build-end.log

 spdawson> The issue is that libusb requires timerfd_settime and timerfd_create, but
 spdawson> the underlying syscalls are not implemented on avr32.

 spdawson> This patch disables the libusb package for the avr32 target architecture.

 spdawson> This will also fix autobuild failures such as the following

 spdawson>   http://autobuild.buildroot.net/results/1a17810c2183e389244143dea55b0241c62c0bee/build-end.log

 spdawson> In this case, the pcsc-lite package fails to build on the avr32 architecture,
 spdawson> due to the dependency on libusb.

 spdawson> Signed-off-by: Simon Dawson <spdawson@gmail.com>
 spdawson> ---
 spdawson>  v2: Handle reverse dependencies of libusb, as suggested by Peter Korsgaard

 spdawson>  package/ccid/Config.in                |    4 ++--
 spdawson>  package/efl/libedbus/Config.in        |    1 +
 spdawson>  package/libfreefare/Config.in         |    4 ++--
 spdawson>  package/libftdi/Config.in             |    4 ++--
 spdawson>  package/libhid/Config.in              |    3 +--
 spdawson>  package/libiqrf/Config.in             |    4 ++--
 spdawson>  package/libnfc-llcp/Config.in         |    5 ++++-
 spdawson>  package/libnfc/Config.in              |    4 ++--
 spdawson>  package/libusb/Config.in              |    3 ++-
 spdawson>  package/openocd/Config.in             |    4 ++--
 spdawson>  package/pcsc-lite/Config.in           |    1 +
 spdawson>  package/python-nfc/Config.in          |    4 ++++
 spdawson>  package/sconeserver/Config.in         |    2 ++
 spdawson>  package/usb_modeswitch/Config.in      |    4 ++--
 spdawson>  package/usb_modeswitch_data/Config.in |    4 ++++
 spdawson>  package/usbutils/Config.in            |    4 ++--
 spdawson>  16 files changed, 35 insertions(+), 20 deletions(-)

 spdawson> diff --git a/package/ccid/Config.in b/package/ccid/Config.in
 spdawson> index c9b77d1..7e4bd70 100644
 spdawson> --- a/package/ccid/Config.in
 spdawson> +++ b/package/ccid/Config.in
 spdawson> @@ -2,11 +2,11 @@ config BR2_PACKAGE_CCID
 spdawson>  	bool "ccid"
 spdawson>  	select BR2_PACKAGE_PCSC_LITE
 spdawson>  	select BR2_PACKAGE_LIBUSB
 spdawson> -	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 spdawson> +	depends on !BR2_avr32 && BR2_TOOLCHAIN_HAS_THREADS # libusb
 spdawson>  	help
 spdawson>  	  PC/SC driver for USB CCID smart card readers
 
 spdawson>  	  http://pcsclite.alioth.debian.org/ccid.html
 
 spdawson>  comment "ccid needs a toolchain with thread support"
 spdawson> -	depends on !BR2_TOOLCHAIN_HAS_THREADS
 spdawson> +	depends on !BR2_TOOLCHAIN_HAS_THREADS && !BR2_avr32
 spdawson> diff --git a/package/efl/libedbus/Config.in b/package/efl/libedbus/Config.in
 spdawson> index 985939e..a8a9e14 100644
 spdawson> --- a/package/efl/libedbus/Config.in
 spdawson> +++ b/package/efl/libedbus/Config.in
 spdawson> @@ -15,6 +15,7 @@ if BR2_PACKAGE_LIBEDBUS
 
 spdawson>  config BR2_PACKAGE_LIBEDBUS_BLUEZ
 spdawson>  	bool "bluez support"
 spdawson> +	depends on !BR2_avr32 # libusb
 spdawson>  	select BR2_PACKAGE_BLUEZ_UTILS

But bluez doesn't depend on libusb, only the BR2_PACKAGE_BLUEZ_UTILS_USB
suboption (which should depend on !BR2_avr32).
 
 spdawson>  config BR2_PACKAGE_SCONESERVER_BLUETOOTH
 spdawson>  	bool "bluetooth"
 spdawson> +	depends on !BR2_avr32 && BR2_USE_WCHAR && \
 spdawson> +		BR2_TOOLCHAIN_HAS_THREADS # bluez-utils
 spdawson>  	select BR2_PACKAGE_BLUEZ_UTILS

Same here.



-- 
Bye, Peter Korsgaard
