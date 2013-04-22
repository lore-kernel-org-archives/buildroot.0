From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 22 Apr 2013 20:35:07 +0200
Subject: [Buildroot] [PATCH 3/7] arc: Add support for ARC-specific
	binutils
In-Reply-To: <1366630651-6857-4-git-send-email-mjonker@synopsys.com>
References: <1366630651-6857-1-git-send-email-mjonker@synopsys.com>
 <1366630651-6857-4-git-send-email-mjonker@synopsys.com>
Message-ID: <517582DB.8050409@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/04/13 13:37, Mischa Jonker wrote:
> ARC support is not upstream yet...
>
> Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
> ---
>   package/binutils/Config.in.host                    |   17 ++++++---
>   .../300-001_ld_makefile_patch.patch                |   24 +++++++++++++
>   .../300-012_check_ldrunpath_length.patch           |   21 +++++++++++
>   .../binutils/binutils-2.19-arc/500-sysroot.patch   |   36 ++++++++++++++++++++
>   package/binutils/binutils.mk                       |    3 ++
>   5 files changed, 95 insertions(+), 6 deletions(-)
>   create mode 100644 package/binutils/binutils-2.19-arc/300-001_ld_makefile_patch.patch
>   create mode 100644 package/binutils/binutils-2.19-arc/300-012_check_ldrunpath_length.patch
>   create mode 100644 package/binutils/binutils-2.19-arc/500-sysroot.patch
>
> diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
> index a61a503..b634796 100644
> --- a/package/binutils/Config.in.host
> +++ b/package/binutils/Config.in.host
> @@ -12,28 +12,32 @@ choice
>   	       depends on BR2_avr32
>   	       bool "binutils 2.18-avr32-1.0.1"
>
> +	config BR2_BINUTILS_VERSION_2_19_ARC
> +		depends on BR2_arc || BR2_arceb
> +		bool "binutils 2.19-arc"
> +

  Do you expect that there actually will be several binutils versions for 
ARC (until it's accepted upstream, obviously)? If not, then I'd prefer to 
make the whole choice depend on !BR2_arc and define this config outside 
of the choice (and without prompt). If later on there turns out to be 
another binutils version with ARC support, it can easily be moved inside 
the choice.

>   	config BR2_BINUTILS_VERSION_2_20_1
> -		depends on !BR2_avr32
> +		depends on !(BR2_arc || BR2_arceb || BR2_avr32)
>   		bool "binutils 2.20.1"
>
>   	config BR2_BINUTILS_VERSION_2_21
> -		depends on !BR2_avr32
> +		depends on !(BR2_arc || BR2_arceb || BR2_avr32)
>   		bool "binutils 2.21"
>
>   	config BR2_BINUTILS_VERSION_2_21_1
> -		depends on !(BR2_avr32 || BR2_UCLIBC_VERSION_0_9_31)
> +		depends on !(BR2_arc || BR2_arceb || BR2_avr32 || BR2_UCLIBC_VERSION_0_9_31)
>   		bool "binutils 2.21.1"
>
>   	config BR2_BINUTILS_VERSION_2_22
> -		depends on !(BR2_avr32 || BR2_UCLIBC_VERSION_0_9_31)
> +		depends on !(BR2_arc || BR2_arceb || BR2_avr32 || BR2_UCLIBC_VERSION_0_9_31)
>   		bool "binutils 2.22"
>
>   	config BR2_BINUTILS_VERSION_2_23_1
> -		depends on !(BR2_avr32 || BR2_UCLIBC_VERSION_0_9_31)
> +		depends on !(BR2_arc || BR2_arceb || BR2_avr32 || BR2_UCLIBC_VERSION_0_9_31)
>   		bool "binutils 2.23.1"
>
>   	config BR2_BINUTILS_VERSION_2_23_2
> -		depends on !(BR2_avr32 || BR2_UCLIBC_VERSION_0_9_31)
> +		depends on !(BR2_arc || BR2_arceb || BR2_avr32 || BR2_UCLIBC_VERSION_0_9_31)
>   		bool "binutils 2.23.2"
>
>   endchoice
> @@ -41,6 +45,7 @@ endchoice
>   config BR2_BINUTILS_VERSION
>   	string
>   	default "2.18-avr32-1.0.1" if BR2_BINUTILS_VERSION_2_18_AVR32_1_0_1
> +	default "2.19-arc"	if BR2_BINUTILS_VERSION_2_19_ARC
>   	default "2.20.1"	if BR2_BINUTILS_VERSION_2_20_1
>   	default "2.21"		if BR2_BINUTILS_VERSION_2_21
>   	default "2.21.1"	if BR2_BINUTILS_VERSION_2_21_1
> diff --git a/package/binutils/binutils-2.19-arc/300-001_ld_makefile_patch.patch b/package/binutils/binutils-2.19-arc/300-001_ld_makefile_patch.patch
> new file mode 100644
> index 0000000..5cb0f61
> --- /dev/null
> +++ b/package/binutils/binutils-2.19-arc/300-001_ld_makefile_patch.patch

  Please add the equivalent of a commit message to the patches: single 
line short description, blank line, extended explanation, blank line, 
Signed-off-by line. See docs/manual/patch-policy.txt

> @@ -0,0 +1,24 @@
> +diff -u binutils-2.17.50.0.17.oorig/ld/Makefile.am binutils-2.17.50.0.17/ld/Makefile.am
> +--- binutils-2.17.50.0.17.oorig/ld/Makefile.am	2007-06-18 19:29:29.000000000 +0200
> ++++ binutils-2.17.50.0.17/ld/Makefile.am	2007-06-25 10:00:36.000000000 +0200
                   ^^ This doesn't seem right...

> +@@ -18,7 +18,7 @@
> + # We put the scripts in the directory $(scriptdir)/ldscripts.
> + # We can't put the scripts in $(datadir) because the SEARCH_DIR
> + # directives need to be different for native and cross linkers.
> +-scriptdir = $(tooldir)/lib
> ++scriptdir = $(libdir)
> +
> + EMUL = @EMUL@
> + EMULATION_OFILES = @EMULATION_OFILES@

  Otherwise, looks good.


  Regards,
  Arnout

[snip]



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
