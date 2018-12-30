From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Dec 2018 22:52:12 +0100
Subject: [Buildroot] [PATCH v7 3/8] core: implement per-package SDK and
 target
In-Reply-To: <20181228104335.22379-4-thomas.petazzoni@bootlin.com>
References: <20181228104335.22379-1-thomas.petazzoni@bootlin.com>
 <20181228104335.22379-4-thomas.petazzoni@bootlin.com>
Message-ID: <20181230215212.GA24224@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

I don;t have much to propose asa review, except very-minor issues.

On 2018-12-28 11:43 +0100, Thomas Petazzoni spake thusly:
> This commit implements the core of the move to per-package SDK and
> target directories. The main idea is that instead of having a global
> output/host and output/target in which all packages install files, we
> switch to per-package host and target directories, that only contain
> their explicit dependencies.
> 
> There are two main benefits:
> 
>  - Packages will no longer discover dependencies that they do not
>    explicitly indicate in their <pkg>_DEPENDENCIES variable.

Note that non-expressed dependencies may still be gathered, if they are
transitive dependencies.

[--SNIP--]
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[--SNIP--]
> diff --git a/Makefile b/Makefile
> index 9de8e0c725..e01ec4c963 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -205,6 +205,7 @@ BR_GRAPH_OUT := $(or $(BR2_GRAPH_OUT),pdf)
>  BUILD_DIR := $(BASE_DIR)/build
>  BINARIES_DIR := $(BASE_DIR)/images
>  BASE_TARGET_DIR := $(BASE_DIR)/target
> +PER_PACKAGE_DIR := $(BASE_DIR)/per-package

Why don't you simply export this variable, like HOST_DIR and TARGET_DIR?
This would simplify calls to fix-rpath:

[--SNIP--]
> @@ -585,8 +587,8 @@ world: target-post-image
>  .PHONY: prepare-sdk
>  prepare-sdk: world
>  	@$(call MESSAGE,"Rendering the SDK relocatable")
> -	$(TOPDIR)/support/scripts/fix-rpath host
> -	$(TOPDIR)/support/scripts/fix-rpath staging
> +	PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) $(TOPDIR)/support/scripts/fix-rpath host
> +	PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) $(TOPDIR)/support/scripts/fix-rpath staging

... here.

[--SNIP--]
> @@ -973,7 +979,8 @@ savedefconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
>  
>  # staging and target directories do NOT list these as
>  # dependencies anywhere else
> -$(BUILD_DIR) $(BASE_TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST):
> +$(BUILD_DIR) $(BASE_TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) \
> +	$(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST) $(PER_PACKAGE_DIR):

Don't ident this continuation line, it is misleading: the target of
the rule appear to be part of the commands.

[--SNIP--]
> diff --git a/support/scripts/check-host-rpath b/support/scripts/check-host-rpath
> index c8939569e2..d903a82958 100755
> --- a/support/scripts/check-host-rpath
> +++ b/support/scripts/check-host-rpath

As I was saying on IRC: when we are not using per-package directories,
then I was a bit surprised to see that this script (and fix_rpath,
below) still worked, when the support for PPD is not optional in it.

What confused me, was that PER_PACKAGE_DIR is always used, even when
BR2_PER_PACKAGE_DIRECTORIES is unset.

But as you pointed to on IRC, PER_PACKAGE_DIR is also always defined to
an non-empty string, that either points to a valid location when
BR2_PER_PACKAGE_DIRECTORIES=y, or points to a non-existent location
otherwise.

> @@ -77,6 +93,7 @@ check_elf_has_rpath() {
>              dir="$( sed -r -e 's:/+:/:g; s:/$::;' <<<"${dir}" )"
>              [ "${dir}" = "${hostdir}/lib" ] && return 0
>              [ "${dir}" = "\$ORIGIN/../lib" ] && return 0
> +            [[ ${dir} =~ ${perpackagedir}/[^/]*/host/lib ]] && return 0
                                            ^^^^^^^
That would also match the string '//' so maybe we want:

    ${perpackagedir}/([^/]+/)?host/lib

[--SNIP--]
> diff --git a/support/scripts/fix-rpath b/support/scripts/fix-rpath
> index fa138ca15a..926767a54f 100755
> --- a/support/scripts/fix-rpath
> +++ b/support/scripts/fix-rpath
> @@ -127,14 +127,29 @@ main() {
>  
>      while read file ; do
>          # check if it's an ELF file
> -        if ${PATCHELF} --print-rpath "${file}" > /dev/null 2>&1; then
> -            # make files writable if necessary
> -            changed=$(chmod -c u+w "${file}")
> -            # call patchelf to sanitize the rpath
> -            ${PATCHELF} --make-rpath-relative "${rootdir}" ${sanitize_extra_args[@]} "${file}"
> -            # restore the original permission
> -            test "${changed}" != "" && chmod u-w "${file}"
> +        rpath=$(${PATCHELF} --print-rpath "${file}" 2>&1)
> +        if test $? -ne 0 ; then
> +            continue
>          fi
> +
> +        # make files writable if necessary
> +        changed=$(chmod -c u+w "${file}")
> +
> +        # With per-package directory support, most RPATH of host
> +        # binaries will point to per-package directories. This won't
> +        # work with the --make-rpath-relative ${rootdir} invocation as
> +        # the per-package host directory is not within ${rootdir}. So,
> +        # we rewrite all RPATHs pointing to per-package directories so
> +        # that they point to the global host directry.
> +        changed_rpath=$(echo ${rpath} | sed "s@${PER_PACKAGE_DIR}/[^/]*/host@${HOST_DIR}@")

Ditto?

> +        if test "${rpath}" != "${changed_rpath}" ; then
> +            ${PATCHELF} --set-rpath ${changed_rpath} "${file}"

Can't you do that unconditioanlly? If it's changed, we need to set it;
if it's not changed, that set it to the initial value anyway...

> +
> +        # call patchelf to sanitize the rpath
> +        ${PATCHELF} --make-rpath-relative "${rootdir}" ${sanitize_extra_args[@]} "${file}"
> +        # restore the original permission
> +        test "${changed}" != "" && chmod u-w "${file}"
>      done < <(find "${rootdir}" ${find_args[@]})
>  
>      # Restore patched patchelf utility
> -- 
> 2.20.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
