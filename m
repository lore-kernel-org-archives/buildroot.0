From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 27 Aug 2013 08:17:33 +0200
Subject: [Buildroot] [PATCH 1/3] neon: replace 'choice' for XML library
 with two options
In-Reply-To: <1377342463-17543-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1377342463-17543-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1377342463-17543-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <521C447D.4020207@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/24/13 13:07, Thomas Petazzoni wrote:
> The NEON library can either be compiled without XML support, with XML
> support provided by Expat, or with XML support provided by
> libxml2. Until now, to represent this, a Kconfig 'choice..endchoice'
> was used. Unfortunately, another package cannot 'select' one of the
> possible choices. So for example, a package such as 'rpm', or the
> to-be-added 'subversion' package could not select their dependencies,
> they had to do a 'depends on !BR2_PACKAGE_NEON_NOXML', which is not
> how Buildroot handles library dependencies in general.
>
> So, this commit replaces the 'choice...endchoice' block with simply
> two configuration options that are mutually exclusive. The option
> names are not changed, so no Config.in.legacy addition is needed.
>
> The rpm package is updated accordingly.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>   package/neon/Config.in | 27 +++++++--------------------
>   package/rpm/Config.in  |  7 ++-----
>   2 files changed, 9 insertions(+), 25 deletions(-)
>
> diff --git a/package/neon/Config.in b/package/neon/Config.in
> index f972dbb..3f18665 100644
> --- a/package/neon/Config.in
> +++ b/package/neon/Config.in
> @@ -19,30 +19,17 @@ config BR2_PACKAGE_NEON_SSL
>   	help
>   	  build with SSL support
>
> -choice
> -	prompt "XML Support"
> -	depends on BR2_PACKAGE_NEON
> -	help
> -	  Select which XML library to use...
> -	  none       do not build with XML support
> -	  expat      use expat
> -	  libxml2    use libxml2
> -
> -config BR2_PACKAGE_NEON_NOXML
> -	bool "none"
> -	help
> -	  none       do not build with XML support
> -
>   config BR2_PACKAGE_NEON_EXPAT
> -	bool "expat"
> +	bool "XML support with expat"
>   	select BR2_PACKAGE_EXPAT
> +	depends on BR2_PACKAGE_NEON

  Can you use "if ... endif" instead of depends on?

> +	depends on !BR2_PACKAGE_NEON_LIBXML2
>   	help
> -	  expat      use expat, a library for parsing XML.
> +	  Enable XML support in neon, using the Expat XML library.
>
>   config BR2_PACKAGE_NEON_LIBXML2
> -	bool "libxml2"
> +	bool "XML support with libxml2"
>   	select BR2_PACKAGE_LIBXML2
> +	depends on BR2_PACKAGE_NEON
>   	help
> -	  libxml2    use libxml2, a library to read, modify and
> -	             write XML and HTML files.
> -endchoice
> +	  Enable XML support in neon, using the libxml2 XML library.
> diff --git a/package/rpm/Config.in b/package/rpm/Config.in
> index 14072c9..8faca95 100644
> --- a/package/rpm/Config.in
> +++ b/package/rpm/Config.in
> @@ -1,17 +1,14 @@
>   comment "rpm requires a toolchain with thread support"
>   	depends on !BR2_TOOLCHAIN_HAS_THREADS
>
> -comment "rpm requires libneon with SSL, XML and ZLIB support"
> -	depends on !BR2_PACKAGE_NEON || BR2_PACKAGE_NEON_NOXML && BR2_TOOLCHAIN_HAS_THREADS
> -
>   config BR2_PACKAGE_RPM
>   	bool "rpm"
>   	depends on BR2_TOOLCHAIN_HAS_THREADS # beecrypt
>   	select BR2_PACKAGE_BEECRYPT
>   	select BR2_PACKAGE_POPT
>   	select BR2_PACKAGE_OPENSSL
> -	depends on BR2_PACKAGE_NEON
> -	depends on !BR2_PACKAGE_NEON_NOXML
> +	select BR2_PACKAGE_NEON
> +	select BR2_PACKAGE_NEON_EXPAT if !BR2_PACKAGE_NEON_LIBXML2

  Maybe it's cleaner to add a hidden symbol to neon:

config BR2_PACKAGE_NEON_XML
	bool
	select BR2_PACKAGE_NEON_EXPAT if !BR2_PACKAGE_NEON_LIBXML2

  Then in rpm, you only need to select BR2_PACKAGE_NEON_XML

  (Since we're going to reuse this pattern in other places as well, I 
think it's important to do it right).


  Regards,
  Arnout

>   	select BR2_PACKAGE_NEON_ZLIB
>   	select BR2_PACKAGE_NEON_SSL
>   	help
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
