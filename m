From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Mar 2021 18:23:24 +0100
Subject: [Buildroot] [PATCH v1] package/siproxd: new package
In-Reply-To: <20210310073844.26494-1-post@lespocky.de>
References: <20210310073844.26494-1-post@lespocky.de>
Message-ID: <20210314172324.GL2737665@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexander, All,

On 2021-03-10 08:38 +0100, Alexander Dahl spake thusly:
> Siproxd is a masquerading SIP Proxy Server.  We had a buildroot package
> for that in the fli4l Linux router distribution for years with different
> authors contributing.
> 
> Co-authored-by: Christoph Schulz <fli4l@kristov.de>
> Co-authored-by: Claas Hilbrecht <babel@fli4l.de>
> Signed-off-by: Alexander Dahl <post@lespocky.de>
> ---
> 
> Notes:
>     Actually what we had in fli4l was a package for 0.8.2.  I revised it and
>     covered all things check-packaged complained about.  Tested on x86_64
>     with uclibc toolchain.  Builds fine on all fli4l targets (x86, x86_64,
>     rpi, sunxi).  This is basically just upstreaming effort.  I marked it as
>     v1, because I expect some remarks and little things to be changed.

I've made use of an external libtool unconditional, and applied to
master, thanks.

Regards,
Yann E. MORIN.

>  DEVELOPERS                   |  1 +
>  package/Config.in            |  1 +
>  package/siproxd/Config.in    | 16 ++++++++++++++++
>  package/siproxd/siproxd.hash | 11 +++++++++++
>  package/siproxd/siproxd.mk   | 24 ++++++++++++++++++++++++
>  5 files changed, 53 insertions(+)
>  create mode 100644 package/siproxd/Config.in
>  create mode 100644 package/siproxd/siproxd.hash
>  create mode 100644 package/siproxd/siproxd.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index f6d6e4aa06..a7a0c30bd6 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -70,6 +70,7 @@ F:	package/odhcp6c/
>  N:	Alexander Dahl <post@lespocky.de>
>  F:	package/fastd/
>  F:	package/libuecc/
> +F:	package/siproxd/
>  F:	package/putty/
>  
>  N:	Alexander Egorenkov <egorenar-dev@posteo.net>
> diff --git a/package/Config.in b/package/Config.in
> index 992e46a319..d919e71cb3 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1828,6 +1828,7 @@ menu "Networking"
>  	source "package/resiprocate/Config.in"
>  	source "package/restclient-cpp/Config.in"
>  	source "package/rtmpdump/Config.in"
> +	source "package/siproxd/Config.in"
>  	source "package/slirp/Config.in"
>  	source "package/snmppp/Config.in"
>  	source "package/sofia-sip/Config.in"
> diff --git a/package/siproxd/Config.in b/package/siproxd/Config.in
> new file mode 100644
> index 0000000000..6939033025
> --- /dev/null
> +++ b/package/siproxd/Config.in
> @@ -0,0 +1,16 @@
> +config BR2_PACKAGE_SIPROXD
> +	bool "siproxd"
> +	select BR2_PACKAGE_LIBOSIP2
> +	select BR2_PACKAGE_SQLITE
> +	help
> +	  Siproxd is a proxy/masquerading daemon for SIP (Session
> +	  Initiation Protocol), which is used in IP telephony. It
> +	  handles registrations of SIP clients on a private IP network
> +	  and performs rewriting of the SIP message bodies to make SIP
> +	  connections work via a masquerading firewall (NAT). It allows
> +	  SIP software clients (like kphone, linphone) or SIP hardware
> +	  clients (Voice over IP phones which are SIP-compatible, such
> +	  as those from Cisco, Grandstream or Snom) to work behind an IP
> +	  masquerading firewall or NAT router.
> +
> +	  http://siproxd.sourceforge.net/
> diff --git a/package/siproxd/siproxd.hash b/package/siproxd/siproxd.hash
> new file mode 100644
> index 0000000000..be6815725a
> --- /dev/null
> +++ b/package/siproxd/siproxd.hash
> @@ -0,0 +1,11 @@
> +# Locally calculated after checking pgp signature from:
> +# https://downloads.sourceforge.net/project/siproxd/siproxd/0.8.3/siproxd-0.8.3.tar.gz.asc
> +sha256  9a6d7a6bb6fff162775b1e1fb7018de9c69642cbf8626185dc6ffceeeba07736  siproxd-0.8.3.tar.gz
> +
> +# https://sourceforge.net/projects/siproxd/files/siproxd/0.8.3/
> +sha1  d13d4a05b8a16dbe20d04b99b535610e49050d9d  siproxd-0.8.3.tar.gz
> +md5  9a9d2c89e5f0c59fdde9444a66d8372c  siproxd-0.8.3.tar.gz
> +
> +# Hash for license files:
> +sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
> +sha256  f18a0811fa0e220ccbc42f661545e77f0388631e209585ed582a1c693029c6aa  libltdl/COPYING.LIB
> diff --git a/package/siproxd/siproxd.mk b/package/siproxd/siproxd.mk
> new file mode 100644
> index 0000000000..624b948699
> --- /dev/null
> +++ b/package/siproxd/siproxd.mk
> @@ -0,0 +1,24 @@
> +################################################################################
> +#
> +# siproxd
> +#
> +################################################################################
> +
> +SIPROXD_VERSION = 0.8.3
> +SIPROXD_SITE = https://downloads.sourceforge.net/project/siproxd/siproxd/$(SIPROXD_VERSION)
> +
> +SIPROXD_LICENSE = GPL-2.0+
> +SIPROXD_LICENSE_FILES = COPYING
> +
> +SIPROXD_DEPENDENCIES = libosip2 sqlite
> +
> +ifeq ($(BR2_PACKAGE_LIBTOOL),y)
> +SIPROXD_CONF_OPTS += --without-included-ltdl
> +SIPROXD_DEPENDENCIES += libtool
> +else
> +SIPROXD_CONF_OPTS += --with-included-ltdl
> +SIPROXD_LICENSE += , LGPL-2.1+
> +SIPROXD_LICENSE_FILES += libltdl/COPYING.LIB
> +endif
> +
> +$(eval $(autotools-package))
> 
> base-commit: da6cca38da1584fed17ffb40316cd7c2fdd5e754
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
