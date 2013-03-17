From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 17 Mar 2013 23:05:45 +0100
Subject: [Buildroot] [PATCH 5/5] libcanfestival: new package
In-Reply-To: <2e13931db1a39313732a16c48f923eb4445dc3d3.1363063832.git.s.martin49@gmail.com>
 (Samuel Martin's message of "Tue, 12 Mar 2013 05:58:43 +0100")
References: <cover.1363063832.git.s.martin49@gmail.com>
 <cover.1363063832.git.s.martin49@gmail.com>
 <2e13931db1a39313732a16c48f923eb4445dc3d3.1363063832.git.s.martin49@gmail.com>
Message-ID: <87r4jd3cna.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 Samuel> Cc: Eric Jarrige <eric.jarrige@armadeus.org>
 Samuel> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

 Samuel> ---
 Samuel> Changes since v1:
 Samuel> - clean/fix *.mk
 Samuel> ---
 Samuel>  package/Config.in                                  |   1 +
 Samuel>  package/libcanfestival/Config.in                   |  90 +++
 Samuel>  .../libcanfestival-allow-to-set-DESTDIR.patch      | 717 +++++++++++++++++++++
 Samuel>  package/libcanfestival/libcanfestival.mk           |  43 ++
 Samuel>  4 files changed, 851 insertions(+)
 Samuel>  create mode 100644 package/libcanfestival/Config.in
 Samuel>  create mode 100644 package/libcanfestival/libcanfestival-allow-to-set-DESTDIR.patch
 Samuel>  create mode 100644 package/libcanfestival/libcanfestival.mk

 Samuel> diff --git a/package/Config.in b/package/Config.in
 Samuel> index 7d66b75..edfd4c4 100644
 Samuel> --- a/package/Config.in
 Samuel> +++ b/package/Config.in
 Samuel> @@ -495,6 +495,7 @@ endmenu
 
 Samuel>  menu "Networking"
 Samuel>  source "package/glib-networking/Config.in"
 Samuel> +source "package/libcanfestival/Config.in"
 Samuel>  source "package/libcgi/Config.in"
 Samuel>  source "package/libcgicc/Config.in"
 Samuel>  source "package/libcurl/Config.in"
 Samuel> diff --git a/package/libcanfestival/Config.in b/package/libcanfestival/Config.in
 Samuel> new file mode 100644
 Samuel> index 0000000..0be45cf
 Samuel> --- /dev/null
 Samuel> +++ b/package/libcanfestival/Config.in
 Samuel> @@ -0,0 +1,90 @@
 Samuel> +config BR2_PACKAGE_LIBCANFESTIVAL
 Samuel> +	bool "CanFestival"
 Samuel> +	help
 Samuel> +	  CanFestival is an OpenSource CANOpen framework, licensed with GPLv2
 Samuel> +	  and LGPLv2.

Licensed under.

 Samuel> +
 Samuel> +	  http://www.canfestival.org
 Samuel> +
 Samuel> +if BR2_PACKAGE_LIBCANFESTIVAL
 Samuel> +
 Samuel> +config BR2_PACKAGE_LIBCANFESTIVAL_NBMMAXCAN
 Samuel> +	string "Number of can bus to use"
 Samuel> +	default "4"

Number of can busses to use.

Any specific reason why you set this to 4? Upstream seems to set it to
1, and as far as I can see it isn't used anywhere in the code.

 Samuel> +
 Samuel> +choice
 Samuel> +	prompt "Driver to use"
 Samuel> +	default BR2_PACKAGE_LIBCANFESTIVAL_SOCKET
 Samuel> +
 Samuel> +config	BR2_PACKAGE_LIBCANFESTIVAL_ANAGATE_LINUX
 Samuel> +	bool "anagate_linux"
 Samuel> +	help
 Samuel> +	  AnaGate CAN(duo) driver for linux
 Samuel> +
 Samuel> +config	BR2_PACKAGE_LIBCANFESTIVAL_PEAK_LINUX

It's supposed to be 'config<space>BLAH', not 'config<tab>BLAH'.

 Samuel> +	bool "peak_linux"
 Samuel> +	help
 Samuel> +	  Linux build host installed Peak driver and library
 Samuel> +
 Samuel> +	  http://www.peak-system.com/linux/
 Samuel> +
 Samuel> +config	BR2_PACKAGE_LIBCANFESTIVAL_VIRTUAL
 Samuel> +	bool "virtual"
 Samuel> +	help
 Samuel> +	  Unix pipe based virtual can driver
 Samuel> +
 Samuel> +config	BR2_PACKAGE_LIBCANFESTIVAL_VIRTUAL_KERNEL
 Samuel> +	bool "virtual_kernel"
 Samuel> +	help
 Samuel> +	  Kernel module virtual can driver
 Samuel> +
 Samuel> +config	BR2_PACKAGE_LIBCANFESTIVAL_SOCKET
 Samuel> +	bool "socket"
 Samuel> +	help
 Samuel> +	  Socket-can
 Samuel> +
 Samuel> +	  http://developer.berlios.de/projects/socketcan/
 Samuel> +

Might be good to mention that this is the "normal" mainline CAN bus
interface.

-- 
Bye, Peter Korsgaard
