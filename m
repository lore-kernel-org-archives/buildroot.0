From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Jun 2021 23:06:27 +0200
Subject: [Buildroot] [PATCH 1/1] Allow users to specifiy a hash file to
 verify custom linux kernels and custom kernel headers
In-Reply-To: <BN8PR11MB3666996FFEB3B0DCA11CDD6CFF349@BN8PR11MB3666.namprd11.prod.outlook.com>
References: <BN8PR11MB3666996FFEB3B0DCA11CDD6CFF349@BN8PR11MB3666.namprd11.prod.outlook.com>
Message-ID: <20210612210627.GZ168928@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ian, All,

On 2021-06-11 17:20 +0000, Ian Merin via buildroot spake thusly:
> From 9873437ad7b4f4e95f970e843a7ed908603c25d7 Mon Sep 17 00:00:00 2001
> From: Ian Merin <Ian.Merin@nCipher.com>
> Date: Fri, 11 Jun 2021 13:02:18 -0400
> Subject: [PATCH 1/1] Allow users to specifiy a hash file to verify custom
>  linux kernels and custom kernel headers

I think going with the extra-hashes file is a good idea overall.

> linux/Config.in: add linux_kernel_custom_hash options
> linux/linux.mk: add ability to override hash file
> package/linux-headers/Config.in.host: add kernel_headers_custom_hash options
> package/linux-headers/linux-headers.mk: add ability to override hash file
> package/pkg-generic.mk: don't use default hash file if it is already set

A commit log should not describe what is done; it should explain it:
what the problem is, and how it is solved. If there are tricky things in
the code, the commit log can explain this too.

However, I think this patch makes the feature really too-specific to
just the kernel (and its headers). Instead, I think we will want
something that can be used to check hashes for other packages where the
version can be specified:

  * uboot:
    - BR2_TARGET_UBOOT_CUSTOM_VERSION
    - BR2_TARGET_UBOOT_CUSTOM_TARBALL
    - BR2_TARGET_UBOOT_CUSTOM_GIT
    - BR2_TARGET_UBOOT_CUSTOM_HG
    - BR2_TARGET_UBOOT_CUSTOM_SVN

  * arm-trusted-firmware:
    - BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION
    - BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL
    - BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT

  * aufs-util:
    - BR2_PACKAGE_AUFS_UTIL_VERSION

  * refpolicy:
    - BR2_PACKAGE_REFPOLICY_CUSTOM_GIT

  * xenomai;
    - BR2_PACKAGE_XENOMAI_CUSTOM_VERSION
    - BR2_PACKAGE_XENOMAI_CUSTOM_TARBALL
    - BR2_PACKAGE_XENOMAI_CUSTOM_GIT

and so on...

Also, we don't need a boolean to drive this feature: if the path is set,
just use it as extra hash file; otherwise there is no extra hash file to
check against.

Also note that, BR_NO_CHECK_HASH_FOR is just a hint to ignore a no-hash
condition. If there in fact are hashes, they *are* checked, *and* they
*must* match. So, by adding an extra-hash file, you do not need to
conditionalise the setting of BR_NO_CHECK_HASH_FOR in packages.

Probably something like the following would be relatively easy to push
toward completion (the hardest part is in support/download/check-hash):

    diff --git a/Config.in b/Config.in
    index c05485173b..2101d1cafd 100644
    --- a/Config.in
    +++ b/Config.in
    @@ -294,6 +294,12 @@ endif
     
     endmenu
     
    +config BR2_EXTRA_HASH_FILES
    +	string "Paths to files containing extra packages hashes"
    +	help
    +	  Set to a space-separated list of file paths to use to check
    +	  packages hashes against.
    +
     config BR2_JLEVEL
     	int "Number of jobs to run simultaneously (0 for auto)"
     	default "0"
    diff --git a/package/pkg-download.mk b/package/pkg-download.mk
    index 2527ba5c60..b024cdb499 100644
    --- a/package/pkg-download.mk
    +++ b/package/pkg-download.mk
    @@ -114,6 +114,7 @@ define DOWNLOAD
     		-D '$(DL_DIR)' \
     		-f '$(notdir $(1))' \
     		-H '$($(2)_HASH_FILE)' \
    +		$(foreach f,$(BR2_EXTRA_HASH_FILES),-H $(f))\
     		-n '$($(2)_BASENAME_RAW)' \
     		-N '$($(2)_RAWNAME)' \
     		-o '$($(2)_DL_DIR)/$(notdir $(1))' \
    diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
    index 3315bd410e..d86b0d9747 100755
    --- a/support/download/dl-wrapper
    +++ b/support/download/dl-wrapper
    @@ -21,8 +21,9 @@ export BR_BACKEND_DL_GETOPTS=":hc:d:o:n:N:H:ru:qf:e"
     
     main() {
         local OPT OPTARG
    -    local backend output hfile recurse quiet rc
    +    local backend output recurse quiet rc
         local -a uris
    +    local -a hash_files
     
         # Parse our options; anything after '--' is for the backend
         while getopts ":c:d:D:o:n:N:H:rf:u:q" OPT; do
    @@ -33,7 +34,7 @@ main() {
             o)  output="${OPTARG}";;
             n)  raw_base_name="${OPTARG}";;
             N)  base_name="${OPTARG}";;
    -        H)  hfile="${OPTARG}";;
    +        H)  hash_files+=("${OPTARG}");;
             r)  recurse="-r";;
             f)  filename="${OPTARG}";;
             u)  uris+=( "${OPTARG}" );;
    @@ -68,7 +69,7 @@ main() {
         # - fails at least one of its hashes: force a re-download
         # - there's no hash (but a .hash file): consider it a hard error
         if [ -e "${output}" ]; then
    -        if support/download/check-hash ${quiet} "${hfile}" "${output}" "${output##*/}"; then
    +        if support/download/check-hash ${quiet} "${output}" "${output##*/}" "${hash_files[@]}"; then
                 exit 0
             elif [ ${?} -ne 2 ]; then
                 # Do not remove the file, otherwise it might get re-downloaded
    @@ -140,7 +141,7 @@ main() {
     
             # Check if the downloaded file is sane, and matches the stored hashes
             # for that file
    -        if support/download/check-hash ${quiet} "${hfile}" "${tmpf}" "${output##*/}"; then
    +        if support/download/check-hash ${quiet} "${tmpf}" "${output##*/}" "${hash_files[@]}"; then
                 rc=0
             else
                 if [ ${?} -ne 3 ]; then
    diff --git a/support/download/check-hash b/support/download/check-hash
    index fe9c10570e..227924819e 100755
    --- a/support/download/check-hash
    +++ b/support/download/check-hash
    @@ -3,12 +3,12 @@ set -e
     
     # Helper to check a file matches its known hash
     # Call it with:
    -#   $1: the path of the file containing all the expected hashes
    -#   $2: the full path to the temporary file that was downloaded, and
    +#   $1: the full path to the temporary file that was downloaded, and
     #       that is to be checked
    -#   $3: the final basename of the file, to which it will be ultimately
    +#   $2: the final basename of the file, to which it will be ultimately
     #       saved as, to be able to match it to the corresponding hashes
     #       in the .hash file
    +#   $3+: the path of the files containing all the expected hashes
     #
     # Exit codes:
     #   0:  the hash file exists and the file to check matches all its hashes,
    @@ -27,10 +27,12 @@ while getopts :q OPT; do
     done
     shift $((OPTIND-1))
     
    -h_file="${1}"
    -file="${2}"
    -base="${3}"
    +file="${1}"
    +base="${2}"
    +shift 2
    +declare -a hash_files=("${@}")
     
    +## The following will have to be heavily lifted...
     # Bail early if no hash to check
     if [ -z "${h_file}" ]; then
         exit 0

Finally, this would probably have to be done in separate patches,
probably a series like this;

  1. change support/download/check-hash to move the hash file at the end
  2. change it to be able to use more than one hash file
  3. extend support/download/dl-wrapper to accept more than one hash file
  4. add my proposed BR2_EXTRA_HASH_FILES option and pass the list to
    dl-wrapper

And this should be about it. Of course, the devil is in the details, but
overall, I believe this is a better solution than having changes
specific to linux and linux-headers.

Regards,
Yann E. MORIN.

> Signed-off-by: Ian Merin <Ian.Merin@nCipher.com>
> Signed-off-by: Ian Merin <Ian.Merin@entrust.com>
> ---
>  linux/Config.in                        | 12 ++++++++++++
>  linux/linux.mk                         |  4 ++++
>  package/linux-headers/Config.in.host   | 12 ++++++++++++
>  package/linux-headers/linux-headers.mk | 18 ++++++++++++++++++
>  package/pkg-generic.mk                 | 17 +++++++++++------
>  5 files changed, 57 insertions(+), 6 deletions(-)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index c893c8dc82..8955c1994b 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -123,6 +123,18 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION
>  
>  endif
>  
> +config BR2_LINUX_KERNEL_CUSTOM_HASH
> +	bool "Enable checking of custom hash file for linux kernel"
> +	default n
> +	depends on !BR2_LINUX_KERNEL_LATEST_VERSION && \
> +		   !BR2_LINUX_KERNEL_LATEST_CIP_VERSION && !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
> +	help
> +	  This option allows to specify a file containing hashes for your kernel version if using a non default kernel version
> +
> +config BR2_LINUX_KERNEL_CUSTOM_HASH_FILE
> +	string "path of custom linux.hash file"
> +	depends on BR2_LINUX_KERNEL_CUSTOM_HASH
> +
>  config BR2_LINUX_KERNEL_VERSION
>  	string
>  	default "5.12.4" if BR2_LINUX_KERNEL_LATEST_VERSION
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 1457228eb9..203d46a93b 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -54,8 +54,12 @@ endif
>  endif
>  
>  ifeq ($(BR2_LINUX_KERNEL)$(BR2_LINUX_KERNEL_LATEST_VERSION),y)
> +ifeq ($(BR2_LINUX_KERNEL_CUSTOM_HASH),y)
> +LINUX_HASH_FILE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_HASH_FILE))
> +else
>  BR_NO_CHECK_HASH_FOR += $(LINUX_SOURCE)
>  endif
> +endif
>  
>  LINUX_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
>  
> diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
> index b68567deeb..991bdc957a 100644
> --- a/package/linux-headers/Config.in.host
> +++ b/package/linux-headers/Config.in.host
> @@ -97,6 +97,18 @@ config BR2_KERNEL_HEADERS_CUSTOM_GIT
>  
>  endchoice
>  
> +config BR2_KERNEL_HEADERS_CUSTOM_HASH
> +	bool "Custom hash"
> +	default n
> +	depends on BR2_KERNEL_HEADERS_AS_KERNEL || BR2_KERNEL_HEADERS_VERSION || \
> +		   BR2_KERNEL_HEADERS_CUSTOM_TARBALL || BR2_KERNEL_HEADERS_CUSTOM_GIT
> +		help
> +		  This option allows to specify a file containing hashes for your kernel version
> +
> +config BR2_KERNEL_HEADERS_CUSTOM_HASH_FILE
> +	string "path of custom linux.hash file"
> +	depends on BR2_KERNEL_HEADERS_CUSTOM_HASH
> +
>  # Select this for the latest kernel headers version (for license hashes)
>  config BR2_KERNEL_HEADERS_LATEST
>  	bool
> diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
> index a8d1c2ccaf..9d216922c3 100644
> --- a/package/linux-headers/linux-headers.mk
> +++ b/package/linux-headers/linux-headers.mk
> @@ -10,6 +10,15 @@
>  # Set variables depending on whether we are using headers from a kernel
>  # build or a standalone header package.
>  ifeq ($(BR2_KERNEL_HEADERS_AS_KERNEL),y)
> +LINUX_HEADERS_CUSTOM_HASH = $(BR2_LINUX_KERNEL_CUSTOM_HASH)
> +LINUX_HEADERS_CUSTOM_HASH_FILE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_HASH_FILE))
> +# Are we using a custom kernel version?
> +ifeq ($(BR2_LINUX_KERNEL)$(BR2_LINUX_KERNEL_LATEST_VERSION),y)
> +# Use the custom hash file, if provided
> +ifeq ($(BR2_LINUX_KERNEL_CUSTOM_HASH),y)
> +LINUX_HEADERS_HASH_FILE = $(LINUX_HEADERS_CUSTOM_HASH_FILE)
> +endif # BR2_LINUX_KERNEL_CUSTOM_HASH
> +endif # BR2_LINUX_KERNEL, BR2_LINUX_KERNEL_LATEST_VERSION
>  LINUX_HEADERS_CUSTOM_TARBALL = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL))
>  LINUX_HEADERS_CUSTOM_GIT = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_GIT))
>  LINUX_HEADERS_CUSTOM_HG = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_HG))
> @@ -23,6 +32,8 @@ $(error LINUX_HEADERS_OVERRIDE_SRCDIR must not be set when BR2_KERNEL_HEADERS_AS
>  endif
>  LINUX_HEADERS_OVERRIDE_SRCDIR = $(LINUX_OVERRIDE_SRCDIR)
>  else # ! BR2_KERNEL_HEADERS_AS_KERNEL
> +LINUX_HEADERS_CUSTOM_HASH = $(BR2_KERNEL_HEADERS_CUSTOM_HASH)
> +LINUX_HEADERS_CUSTOM_HASH_FILE = $(call qstrip,$(BR2_KERNEL_HEADERS_CUSTOM_HASH_FILE))
>  LINUX_HEADERS_CUSTOM_TARBALL = $(call qstrip,$(BR2_KERNEL_HEADERS_CUSTOM_TARBALL))
>  LINUX_HEADERS_CUSTOM_GIT = $(call qstrip,$(BR2_KERNEL_HEADERS_CUSTOM_GIT))
>  LINUX_HEADERS_CUSTOM_HG =
> @@ -91,10 +102,17 @@ endef
>  LINUX_HEADERS_POST_PATCH_HOOKS += LINUX_HEADERS_APPLY_LOCAL_PATCHES
>  endif # BR2_KERNEL_HEADERS_AS_KERNEL
>  
> +
> +
>  # Skip hash checking for custom kernel headers.
>  ifeq ($(BR2_KERNEL_HEADERS_VERSION)$(BR2_KERNEL_HEADERS_CUSTOM_TARBALL)$(BR2_KERNEL_HEADERS_CUSTOM_GIT),y)
> +# Unless the user has specified an external hash file
> +ifeq ($(LINUX_HEADERS_CUSTOM_HASH),y)
> +LINUX_HEADERS_HASH_FILE = LINUX_HEADERS_CUSTOM_HASH_FILE
> +else
>  BR_NO_CHECK_HASH_FOR += $(LINUX_HEADERS_SOURCE)
>  endif
> +endif
>  
>  # linux-headers really is the same as the linux package
>  LINUX_HEADERS_DL_SUBDIR = linux
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 9fbc63d19e..5d5b479fcf 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -474,12 +474,17 @@ else
>   $(2)_DL_VERSION := $$(strip $$($(2)_VERSION))
>  endif
>  $(2)_VERSION := $$(call sanitize,$$($(2)_DL_VERSION))
> -
> -$(2)_HASH_FILE = \
> -	$$(strip \
> -		$$(if $$(wildcard $$($(2)_PKGDIR)/$$($(2)_VERSION)/$$($(2)_RAWNAME).hash),\
> -			$$($(2)_PKGDIR)/$$($(2)_VERSION)/$$($(2)_RAWNAME).hash,\
> -			$$($(2)_PKGDIR)/$$($(2)_RAWNAME).hash))
> +ifndef $(2)_HASH_FILE
> +	ifdef $(3)_HASH_FILE
> +		$(2)_HASH_FILE = $$($(3)_HASH_FILE)
> +	else
> +		$(2)_HASH_FILE = \
> +			$$(strip \
> +				$$(if $$(wildcard $$($(2)_PKGDIR)/$$($(2)_VERSION)/$$($(2)_RAWNAME).hash),\
> +					$$($(2)_PKGDIR)/$$($(2)_VERSION)/$$($(2)_RAWNAME).hash,\
> +					$$($(2)_PKGDIR)/$$($(2)_RAWNAME).hash))
> +	endif
> +endif
>  
>  ifdef $(3)_OVERRIDE_SRCDIR
>    $(2)_OVERRIDE_SRCDIR ?= $$($(3)_OVERRIDE_SRCDIR)
> -- 
> 2.17.1
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
