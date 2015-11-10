From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 11 Nov 2015 00:17:56 +0100
Subject: [Buildroot] [PATCH 1/2] libnet:new package
In-Reply-To: <1447059812-26424-1-git-send-email-joris.lijssens@gmail.com>
References: <1447059812-26424-1-git-send-email-joris.lijssens@gmail.com>
Message-ID: <56427B24.7030602@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Joris,

On 09-11-15 10:03, Joris Lijssens wrote:
> Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
> ---
>  package/Config.in        |  1 +
>  package/libnet/Config.in |  7 +++++++
>  package/libnet/libnet.mk | 13 +++++++++++++

 We now require .hash files for github packages as well, since github nowadays
provides stable tarballs.

>  3 files changed, 21 insertions(+)
>  create mode 100644 package/libnet/Config.in
>  create mode 100644 package/libnet/libnet.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index bdc3063..e0b42c0 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1019,6 +1019,7 @@ menu "Networking"
>  	source "package/libmnl/Config.in"
>  	source "package/libmodbus/Config.in"
>  	source "package/libndp/Config.in"
> +	source "package/libnet/Config.in"
>  	source "package/libnetfilter_acct/Config.in"
>  	source "package/libnetfilter_conntrack/Config.in"
>  	source "package/libnetfilter_cthelper/Config.in"
> diff --git a/package/libnet/Config.in b/package/libnet/Config.in
> new file mode 100644
> index 0000000..76ed9dd
> --- /dev/null
> +++ b/package/libnet/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_LIBNET
> +	bool "libnet"
> +	help
> +	  libnet provides a portable framework for low-level network packet
> +	  construction.
> +
> +	  http://sourceforge.net/projects/libnet-dev
> diff --git a/package/libnet/libnet.mk b/package/libnet/libnet.mk
> new file mode 100644
> index 0000000..d021f76
> --- /dev/null
> +++ b/package/libnet/libnet.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# libnet
> +#
> +################################################################################
> +
> +LIBNET_VERSION = 1.1.6
> +LIBNET_SITE = http://sourceforge.net/projects/libnet-dev/files
> +LIBNET_INSTALL_STAGING = YES
> +LIBNET_LICENSE = BSD-2c

 There are also a few BSD-3c files, so I think this should be BSD-2c, BSD-3c.

> +LIBNET_LICENSE_FILES = doc/COPYING
> +
> +$(eval $(autotools-package))
> 

 The configure script tries to build and run a program to test for ETH_P_ALL
availability in the AC_LIBNET_CHECK_PF_PACKET function. This will obviously fail
when cross-compiling, maybe worse when hostarch == targetarch. So I think it's
best to explicitly pass libnet_cv_have_packet_socket=yes

 Also it would be nice if there was a way to enable the bpf support, but that
can come later.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
