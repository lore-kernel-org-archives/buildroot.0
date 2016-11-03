From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 3 Nov 2016 17:58:18 +0100
Subject: [Buildroot] [PATCH 1/2] libidn2: new package
In-Reply-To: <20161103110512.13676-2-jer@airfi.aero>
References: <20161103110512.13676-1-jer@airfi.aero>
 <20161103110512.13676-2-jer@airfi.aero>
Message-ID: <c2abc739-8522-b42b-f102-3f8c38e23f56@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03-11-16 12:05, Jeroen Roovers wrote:
> An implementation of the IDNA2008 specifications (RFC 5890, RFC 5891,
> RFC 5892, RFC 5893)
> 
> Signed-off-by: Jeroen Roovers <jer@airfi.aero>
> ---
>  package/Config.in            |  1 +
>  package/libidn2/Config.in    |  5 +++++
>  package/libidn2/libidn2.hash |  2 ++
>  package/libidn2/libidn2.mk   | 12 ++++++++++++
>  4 files changed, 20 insertions(+)
>  create mode 100644 package/libidn2/Config.in
>  create mode 100644 package/libidn2/libidn2.hash
>  create mode 100644 package/libidn2/libidn2.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 9ed296f..7ffb756 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1198,6 +1198,7 @@ menu "Networking"
>  	source "package/libgsasl/Config.in"
>  	source "package/libhttpparser/Config.in"
>  	source "package/libidn/Config.in"
> +	source "package/libidn2/Config.in"
>  	source "package/libiscsi/Config.in"
>  	source "package/libldns/Config.in"
>  	source "package/libmbus/Config.in"
> diff --git a/package/libidn2/Config.in b/package/libidn2/Config.in
> new file mode 100644
> index 0000000..ce0a841
> --- /dev/null
> +++ b/package/libidn2/Config.in
> @@ -0,0 +1,5 @@
> +config BR2_PACKAGE_LIBIDN2
> +	bool "libidn2"
> +
> +	help
> +	  An implementation of the IDNA2008 specifications (RFCs 5890, 5891, 5892, 5893)

 The line is too long (wrap at 72 characters).

 Upstream URL is missing. Just use http://www.gnu.org/software/libidn/

 Shouldn't there be a BR2_PACKAGE_LIBIDN2_BINARY option like for libidn?
Although it looks like the binary is pretty small so not worth it.


> diff --git a/package/libidn2/libidn2.hash b/package/libidn2/libidn2.hash
> new file mode 100644
> index 0000000..5aedde0
> --- /dev/null
> +++ b/package/libidn2/libidn2.hash
> @@ -0,0 +1,2 @@
> +# Calculated locally after checking signature

 You should add the URL of the signature you checked.

> +sha256  3d301890bdbb137424f5ea495f82730a4b85b6a2549e47de3a34afebeac3e0e3  libidn2-0.10.tar.gz
> diff --git a/package/libidn2/libidn2.mk b/package/libidn2/libidn2.mk
> new file mode 100644
> index 0000000..7adc1d8
> --- /dev/null
> +++ b/package/libidn2/libidn2.mk
> @@ -0,0 +1,12 @@
> +################################################################################
> +#
> +# libidn2
> +#
> +################################################################################
> +
> +LIBIDN2_VERSION = 0.10
> +LIBIDN2_SITE = ftp://alpha.gnu.org/gnu/libidn

 My first reaction was: shouldn't we instead upgrade libidn? But it looks like
the API is completely different. It's weird to use an alpha version for security
reasons, but that's what upstream curl does so OK.

> +LIBIDN2_SOURCE = libidn2-$(LIBIDN2_VERSION).tar.gz
> +LIBIDN2_INSTALL_STAGING = YES

 I haven't tried, but it looks like documentation can't be disabled and the
examples are always installed. Doesn't it need to be patched to allow building
in a minimal environment (i.e. without texinfo)?

 Regards,
 Arnout

> +
> +$(eval $(autotools-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
