From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 15 Jun 2013 23:14:47 +0200
Subject: [Buildroot] [PATCHv3 2/3] Add proprietary libraries for Hantro
	x170 HW decoding
In-Reply-To: <1370945921-23444-2-git-send-email-alexandre.belloni@free-electrons.com>
 (Alexandre Belloni's message of "Tue, 11 Jun 2013 12:18:40 +0200")
References: <1370945921-23444-1-git-send-email-alexandre.belloni@free-electrons.com>
 <1370945921-23444-2-git-send-email-alexandre.belloni@free-electrons.com>
Message-ID: <87k3lvxeig.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexandre" == Alexandre Belloni <alexandre.belloni@free-electrons.com> writes:

 Alexandre> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
 Alexandre> ---
 Alexandre>  package/multimedia/Config.in                      |  1 +
 Alexandre>  package/multimedia/on2-8170-libs/Config.in        | 12 ++++++++++++
 Alexandre>  package/multimedia/on2-8170-libs/on2-8170-libs.mk | 24 +++++++++++++++++++++++
 Alexandre>  3 files changed, 37 insertions(+)
 Alexandre>  create mode 100644 package/multimedia/on2-8170-libs/Config.in
 Alexandre>  create mode 100644 package/multimedia/on2-8170-libs/on2-8170-libs.mk

 Alexandre> diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
 Alexandre> index dd74863..4cb81bf 100644
 Alexandre> --- a/package/multimedia/Config.in
 Alexandre> +++ b/package/multimedia/Config.in
 Alexandre> @@ -21,6 +21,7 @@ source "package/multimedia/mpd/Config.in"
 Alexandre>  source "package/multimedia/mpg123/Config.in"
 Alexandre>  source "package/multimedia/mplayer/Config.in"
 Alexandre>  source "package/multimedia/musepack/Config.in"
 Alexandre> +source "package/multimedia/on2-8170-libs/Config.in"
 Alexandre>  source "package/opus-tools/Config.in"
 Alexandre>  source "package/multimedia/pulseaudio/Config.in"
 Alexandre>  source "package/multimedia/tidsp-binaries/Config.in"
 Alexandre> diff --git a/package/multimedia/on2-8170-libs/Config.in b/package/multimedia/on2-8170-libs/Config.in
 Alexandre> new file mode 100644
 Alexandre> index 0000000..09ed808
 Alexandre> --- /dev/null
 Alexandre> +++ b/package/multimedia/on2-8170-libs/Config.in
 Alexandre> @@ -0,0 +1,12 @@
 Alexandre> +config BR2_PACKAGE_ON2_8170_LIBS
 Alexandre> +	#This is a binary only package which has been compiled for glibc
 Alexandre> +	depends on BR2_arm926t
 Alexandre> +	depends on (BR2_TOOLCHAIN_EXTERNAL_GLIBC || \
 Alexandre> +		BR2_TOOLCHAIN_CTNG_eglibc || \
 Alexandre> +		BR2_TOOLCHAIN_CTNG_glibc)
 Alexandre> +	bool "on2-8170-libs"

Presumably this doesn't do much without the kernel modules, so I changed
this to select on2-8170-modules.

 Alexandre> +	help
 Alexandre> +	  Libraries for Hantro X170 video decoder
 Alexandre> +
 Alexandre> +	  http://www.at91.com/linux4sam/bin/view/Linux4SAM/SAM9M10Gstreamer
 Alexandre> +
 Alexandre> diff --git a/package/multimedia/on2-8170-libs/on2-8170-libs.mk b/package/multimedia/on2-8170-libs/on2-8170-libs.mk
 Alexandre> new file mode 100644
 Alexandre> index 0000000..e04551d
 Alexandre> --- /dev/null
 Alexandre> +++ b/package/multimedia/on2-8170-libs/on2-8170-libs.mk
 Alexandre> @@ -0,0 +1,24 @@
 Alexandre> +################################################################################
 Alexandre> +#
 Alexandre> +# on2-8170-libs
 Alexandre> +#
 Alexandre> +################################################################################
 Alexandre> +
 Alexandre> +ON2_8170_LIBS_VERSION = 1.0
 Alexandre> +ON2_8170_LIBS_SITE = ftp://ftp.linux4sam.org/pub/demo/linux4sam_1.9/codec/
 Alexandre> +
 Alexandre> +ON2_8170_LICENSE = PROPRIETARY
 Alexandre> +# No license file is included in the archive
 Alexandre> +
 Alexandre> +ON2_8170_LIBS_INSTALL_STAGING = YES
 Alexandre> +
 Alexandre> +define ON2_8170_LIBS_INSTALL_STAGING_CMDS

To ensure the destination directories exists I've added mkdir -p's for
those.

Committed with that fixed.

-- 
Bye, Peter Korsgaard
