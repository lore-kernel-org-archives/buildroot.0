From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 4 May 2018 00:42:25 +0200
Subject: [Buildroot] [RFC PATCH 2/2] core: Verify that hardening flags
 are used
In-Reply-To: <20180503143147.5301-3-stefan.sorensen@spectralink.com>
References: <20180503143147.5301-1-stefan.sorensen@spectralink.com>
 <20180503143147.5301-3-stefan.sorensen@spectralink.com>
Message-ID: <fb09acc7-9da3-7a9d-f10b-7fe8044eac2c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03-05-18 16:31, Stefan S?rensen wrote:
> This patch add a new package post install check that verifies that
> configured hardening options are used.
> 
> Using the ELF notes added by the GCC annobin plugin, it verifies that
> the following build options are used:
>   * Stack protector
>   * RELRO
>   * FORTIFY_SOURCE
>   * Optimization
>   * Possition Independent Code/Executeable (-fPIC/-fPIE)
> 
> Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
> ---
>  Config.in                      | 15 +++++++
>  package/pkg-generic.mk         | 36 +++++++++++++++++
>  support/scripts/check-hardened | 74 ++++++++++++++++++++++++++++++++++
>  3 files changed, 125 insertions(+)
>  create mode 100755 support/scripts/check-hardened
> 
> diff --git a/Config.in b/Config.in
> index 6b5b2b043c..43fd15f3a2 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -826,6 +826,21 @@ endchoice
>  
>  comment "Fortify Source needs a glibc toolchain and optimization"
>  	depends on (!BR2_TOOLCHAIN_USES_GLIBC || BR2_OPTIMIZE_0)
> +
> +
> +config BR2_CHECK_HARDENING
> +       bool "Verify hardened build"
> +       depends on BR2_TOOLCHAIN_ANNOBIN_GCC_PLUGIN

 select instead of depends (and then of course propagate the dependency from
host-annobin).

> +       depends on !BR2_SSP_REGULAR
> +       depends on !BR2_FORTIFY_SOURCE_1

 Well, it still works for the other options if SSP_REGULAR or FORTIFY_1 is
chosen, right? I don't think we need to specify these dependencies. At worst,
nothing is checked at all, but that's fine as well I'd say.

> +       help
> +         This option enables a packet post install step that verifies
                                  package

> +         that the selected hardning options was actually used during
                              hardening        were

> +         the build.
> +
> +comment "Verifying hardened build needs the annobin GCC plugin and it not compatible with the regular stack protector and the conservative buffer overflow protector"
> +	 depends on !BR2_TOOLCHAIN_ANNOBIN_GCC_PLUGIN || BR2_SSP_REGULAR || BR2_FORTIFY_SOURCE_1

 Only a comment on the gcc version is needed.

> +
>  endmenu
>  
>  source "toolchain/Config.in"
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index a303dc2e07..9567d260bd 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -94,6 +94,42 @@ endef
>  
>  GLOBAL_INSTRUMENTATION_HOOKS += check_bin_arch
>  
> +ifeq ($(BR2_CHECK_HARDENING),y)
> +# For now, no support for operator[] range check, control flow
> +# enforcement, stack clash protection and control flow protection
> +# hardening

 Why not? [Because we don't build with those options, but mention that in the
comment.]

> +HARDENED_OPTS = -s operator -s cet -s clash -s cf
> +
> +ifneq ($(BR2_SSP_STRONG)$(BR2_SSP_ALL),y)

 Nit: I think we'd prefer positive options here, so
ifeq ($(BR2_SSP_NONE)$(BR2_SSP_REGULAR),y)

 That's more consistent with the fact that we're skipping.

> +HARDENED_OPTS += -s opt

 stack, I guess?

> +endif
> +ifneq ($(BR2_OPTIMIZE_2)$(BR2_OPTIMIZE_3)$(BR2_OPTIMIZE_S),y)
> +HARDENED_OPTS += -s opt
> +endif
> +ifneq ($(BR2_FORTIFY_SOURCE_2),y)
> +HARDENED_OPTS += -s fort
> +endif
> +ifneq ($(BR2_RELRO_PARTIAL)$(BR2_RELRO_FULL),y)
> +HARDENED_OPTS += -s relro
> +endif
> +ifneq ($(BR2_RELRO_FULL),y)
> +HARDENED_OPTS += -s now -s pic
> +endif
> +
> +define check_hardened
> +	$(if $(filter end-install-target,$(1)-$(2)),\
> +		support/scripts/check-hardened \
> +			-p $(3) \
> +			-l $(BUILD_DIR)/packages-file-list.txt \
> +			$(foreach i,$($(PKG)_HARDENED_EXCLUDE),-i "$(i)") \

 So, we have a space-separated list, which is then converted into individual -i
options, which the script then collects in an array, which it finally iterates
over in a for loop.

 Wouldn't it be simpler to just pass -i '$($(PKG)_HARDENED_EXCLUDE)', and in the
script:

	for ignore in $ignores; do

> +			$(HARDENED_OPTS) \
> +			-r $(TARGET_READELF) \
> +			-h $(HARDENED_SH))

 Since HOST_DIR is already exported, the script could also just hardcode
$(HOST_DIR)/bin/hardened.sh.

> +endef
> +
> +GLOBAL_INSTRUMENTATION_HOOKS += check_hardened
> +endif
> +
>  # This hook checks that host packages that need libraries that we build
>  # have a proper DT_RPATH or DT_RUNPATH tag
>  define check_host_rpath
> diff --git a/support/scripts/check-hardened b/support/scripts/check-hardened
> new file mode 100755
> index 0000000000..8f4d6628cf
> --- /dev/null
> +++ b/support/scripts/check-hardened
> @@ -0,0 +1,74 @@
> +#!/usr/bin/env bash
> +
> +# Heavily based on check-bin-arch

 Hm, refactoring opportunity :-) But that can be done later.

> +
> +# List of hardcoded paths that should be ignored, as they are
> +# contain binaries for an architecture different from the
> +# architecture of the target.
> +declare -a IGNORES=(
> +	# Skip firmware files, they could be ELF files for other
> +	# architectures without hardening
> +	"/lib/firmware"
> +	"/usr/lib/firmware"
> +
> +	# Skip kernel modules
> +	"/lib/modules"
> +	"/usr/lib/modules"
> +
> +	# Skip files in /usr/share, several packages (qemu,
> +	# pru-software-support) legitimately install ELF binaries that
> +	# are not for the target architecture and are not hardened
> +	"/usr/share"
> +)
> +
> +declare -a skip
> +
> +while getopts p:l:h:r:i:s: OPT ; do
> +	case "${OPT}" in
> +	p) package="${OPTARG}";;
> +	l) pkg_list="${OPTARG}";;
> +	h) hardened="${OPTARG}";;
> +	i)
> +		# Ensure we do have single '/' as separators,
> +		# and that we have a leading one.
> +		pattern="$(sed -r -e 's:/+:/:g; s:^/*:/:;' <<<"${OPTARG}")"

 This could move into the loop (needed in case you follow my suggestion of a
single -i option).

> +		IGNORES+=("${pattern}")
> +		;;
> +	r) readelf="${OPTARG}";;
> +	s) skip+=("--skip=${OPTARG}");;

 The short form of --skip in the hardened.sh script is -k, so it would be
logical to use the same letter for this script.

> +	:) error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
> +	\?) error "unknown option '%s'\n" "${OPTARG}";;
> +	esac
> +done
> +
> +if test -z "${package}" -o -z "${pkg_list}" -o -z "${hardened}" ; then
> +	echo "Usage: $0 -p <pkg> -l <pkg-file-list> -h <hardened> -r <readelf> [-i PATH ...]"
> +	exit 1
> +fi
> +
> +if [ ! -e ${hardened} ]; then
> +	exit 0

 Do we want that? We should fail hard if it doesn't exist, no?

 Regards,
 Arnout

> +fi
> +
> +exitcode=0
> +
> +# Only split on new lines, for filenames-with-spaces
> +IFS="
> +"
> +
> +while read f; do
> +	for ignore in "${IGNORES[@]}"; do
> +		if [[ "${f}" =~ ^"${ignore}" ]]; then
> +			continue 2
> +		fi
> +	done
> +
> +	# Only check regular files
> +	if [[ ! -f "${TARGET_DIR}/${f}" ]]; then
> +		continue
> +	fi
> +
> +	${hardened} --readelf=${readelf} --ignore-unknown ${skip[*]} ${TARGET_DIR}${f} || exitcode=1
> +done < <( sed -r -e "/^${package},\.(.+)$/!d; s//\1/;" ${pkg_list} )
> +
> +exit ${exitcode}
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
