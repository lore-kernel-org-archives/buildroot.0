From: Nigel Kukard <nkukard@lbsd.net>
Date: Mon, 21 Dec 2009 09:51:35 +0000
Subject: [Buildroot] [PATCH 1/1] Update rpm
In-Reply-To: <87ljgwzo25.fsf@macbook.be.48ers.dk>
References: <cover.1261380062.git.nkukard@lbsd.net>	<cover.1261380062.git.nkukard@lbsd.net>	<4e1837c9c17e549a134a69f9bf8829797d879bb4.1261380062.git.nkukard@lbsd.net>
	<87ljgwzo25.fsf@macbook.be.48ers.dk>
Message-ID: <4B2F4527.8000509@lbsd.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/21/09 09:14, Peter Korsgaard wrote:
>>>>>> "Nigel" == Nigel Kukard <nkukard@lbsd.net> writes:
>>>>>>             
>  Nigel> Signed-off-by: Nigel Kukard <nkukard@lbsd.net>
>  Nigel> ---
>  Nigel>  package/rpm/Config.in                             |   26 ++-
>  Nigel>  package/rpm/rpm-5.1.6_exclude-some-tools.patch    |   12 -
>  Nigel>  package/rpm/rpm-5.1.6_magic-file-fix.patch        |   40 ----
>  Nigel>  package/rpm/rpm-5.2.0_depends-fix.patch           |   19 ++
>  Nigel>  package/rpm/rpm-5.2.0_exclude-some-tools.patch    |   30 +++
>  Nigel>  package/rpm/rpm-5.2.0_no-parentdirs.patch         |   14 ++
>  Nigel>  package/rpm/rpm-5.2.0_ordering-fix.patch          |   45 ++++
>  Nigel>  package/rpm/rpm-5.2.0_parentdir-vs-requires.patch |   37 ++++
>  Nigel>  package/rpm/rpm-5.2.0_short-circuit-c99.patch     |  235 +++++++++++++++++++++
>  Nigel>  package/rpm/rpm.mk                                |   21 ++-
>  Nigel>  10 files changed, 416 insertions(+), 63 deletions(-)
>  Nigel>  delete mode 100755 package/rpm/rpm-5.1.6_exclude-some-tools.patch
>  Nigel>  delete mode 100755 package/rpm/rpm-5.1.6_magic-file-fix.patch
>  Nigel>  create mode 100644 package/rpm/rpm-5.2.0_depends-fix.patch
>  Nigel>  create mode 100644 package/rpm/rpm-5.2.0_exclude-some-tools.patch
>  Nigel>  create mode 100644 package/rpm/rpm-5.2.0_no-parentdirs.patch
>  Nigel>  create mode 100644 package/rpm/rpm-5.2.0_ordering-fix.patch
>  Nigel>  create mode 100644 package/rpm/rpm-5.2.0_parentdir-vs-requires.patch
>  Nigel>  create mode 100644 package/rpm/rpm-5.2.0_short-circuit-c99.patch
>
> Where does those patches come from? Are you the author? Have they been
> pushed upstream where possible?
>   

All relevant fixes have been resolved upstream in line for 5.3.x.

These will not be uptream:

exclude-some-tools - simply excludes tools we don't want

short-circuit-c99 - after alot of hair pulling, this just ignores the c99 test and shoves in "gcc -std=c99"



>  Nigel> diff --git a/package/rpm/Config.in b/package/rpm/Config.in
>  Nigel> index f4f7f90..d50a642 100644
>  Nigel> --- a/package/rpm/Config.in
>  Nigel> +++ b/package/rpm/Config.in
>  Nigel> @@ -1,14 +1,32 @@
>  Nigel>  config BR2_PACKAGE_RPM
>  Nigel>  	bool "rpm"
>  Nigel> -	select BR2_PACKAGE_ZLIB
>  Nigel> -	select BR2_PACKAGE_BZIP2
>  Nigel>  	select BR2_PACKAGE_BEECRYPT
>  Nigel>  	select BR2_PACKAGE_POPT
>  Nigel>  	select BR2_PACKAGE_NEON
>  Nigel>  	select BR2_PACKAGE_NEON_ZLIB
>  Nigel> -	select BR2_PACKAGE_NEON_EXPAT 	if BR2_PACKAGE_EXPAT
>  Nigel> -	select BR2_PACKAGE_NEON_LIBXML2	if BR2_PACKAGE_LIBXML2
>  Nigel> +	select BR2_PACKAGE_NEON_EXPAT if BR2_PACKAGE_EXPAT
>  Nigel> +	select BR2_PACKAGE_NEON_LIBXML2 if BR2_PACKAGE_LIBXML2
>  Nigel> +	select BR2_PACKAGE_NEON_SSL
>
> Select doesn't work recursively, so you need to select openssl as well.
>   

ok

>  Nigel>  	help
>  Nigel>  	  The RPM package management system.
>  
>  Nigel>  	  http://rpm5.org
>  Nigel> +
>  Nigel> +config BR2_PACKAGE_RPM_BZIP2_PAYLOADS
>  Nigel> +	bool "support for bzip2 payloads"
>  Nigel> +	depends on BR2_PACKAGE_RPM
>  Nigel> +	select BR2_PACKAGE_BZIP2
>  Nigel> +	help
>  Nigel> +	  Support for bzip2 payloads in RPM.
>  Nigel> +
>  Nigel> +config BR2_PACKAGE_RPM_XZ_PAYLOADS
>  Nigel> +	bool "support for xz payloads"
>  Nigel> +	depends on BR2_PACKAGE_RPM
>  Nigel> +	depends on BR2_GCC_CROSS_CXX
>
> Doesn't this need liblzma?
>   

If it finds xz, it will use it, if it doesn't, it will use internal
copy. So its not required, no.
