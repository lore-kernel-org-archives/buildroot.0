From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 13 Feb 2014 07:58:46 +0100
Subject: [Buildroot] [PATCH v12 3/7] package: add support for top-level
	parallel make
In-Reply-To: <1392196751-23485-4-git-send-email-fabio.porcedda@gmail.com>
References: <1392196751-23485-1-git-send-email-fabio.porcedda@gmail.com>
 <1392196751-23485-4-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <52FC6D26.6030309@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/02/14 10:19, Fabio Porcedda wrote:
> To be able to use top-level parallel make we must not depend in a rule
> on the order of evaluation of the prerequisites, so instead of relying
> on the left to right ordering of evaluation of the prerequisites add
> an explicit rule to describe the dependencies.
> 
> We cannot use the pattern rules because they must have the same
> dependency for every package, but we need to change the dependencies
> depending on $(2)_OVERRIDE_SRCDIR variable value, so we must use a
> more flexible way like $(2)_TARGET_% variables.
> 
> So add explicit dependencies for the following stamp files:
>   $(2)_TARGET_EXTRACT
>   $(2)_TARGET_PATCH
>   $(2)_TARGET_CONFIGURE
>   $(2)_TARGET_BUILD
>   $(2)_TARGET_INSTALL_STAGING
>   $(2)_TARGET_INSTALL_TARGET
>   $(2)_TARGET_INSTALL_IMAGES
>   $(2)_TARGET_INSTALL_HOST
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> ---
[snip]
> -$(1)-build:		$(1)-configure \
> -			$$($(2)_TARGET_BUILD)
> +$$($(2)_TARGET_INSTALL_TARGET) $$($(2)_TARGET_INSTALL_STAGING) \
> +$$($(2)_TARGET_INSTALL_IMAGES) $$($(2)_TARGET_INSTALL_HOST): \
> +	$$($(2)_TARGET_BUILD)

 I'd prefer to see these on separate lines:

$$($(2)_TARGET_INSTALL_TARGET): $$($(2)_TARGET_BUILD)
$$($(2)_TARGET_INSTALL_STAGING): $$($(2)_TARGET_BUILD)
...

 And also I'd prefer them close to the corresponding $(1)-install target.

 By the way, for these it would actually be possible to put them in the
pattern rule, because they don't depend on OVERRIDE_SRCDIR, right? But I
guess we said a long time ago that it would be better to do it
symmetrical for all targets.


> +
> +$(1)-build:		$$($(2)_TARGET_BUILD)
> +$$($(2)_TARGET_BUILD):	$$($(2)_TARGET_CONFIGURE)
> +
> +# The symbol "|" specify a order-only-prerequisite, this is needed for
> +# phony requisites to avoid rebuilding every time the target.

 Possible improvement of the explanation:

Since $(2)_DEPENDENCIES are phony targets, they are always "newer" than
$(2)_TARGET_CONFIGURE. This would force the configure step (and therefore
the other steps as well) to be re-executed with every invocation of make.
Therefore, make $(2)_DEPENDENCIES an order-only dependency by using |.

> +
> +$(1)-configure:			$$($(2)_TARGET_CONFIGURE)
> +$$($(2)_TARGET_CONFIGURE):	| $$($(2)_DEPENDENCIES)
>  
>  $$($(2)_TARGET_SOURCE) $$($(2)_TARGET_RSYNC): | dirs prepare
>  ifeq ($(filter $(1),$(DEPENDENCIES_HOST_PREREQ)),)
> @@ -449,13 +458,13 @@ ifeq ($$($(2)_OVERRIDE_SRCDIR),)
>  #  extract
>  #  patch
>  #  configure
> -$(1)-configure:		$(1)-patch $(1)-depends \
> -			$$($(2)_TARGET_CONFIGURE)
> +$$($(2)_TARGET_CONFIGURE):	$$($(2)_TARGET_PATCH)
>  
> -$(1)-patch:		$(1)-extract $$($(2)_TARGET_PATCH)
> +$(1)-patch:		$$($(2)_TARGET_PATCH)
> +$$($(2)_TARGET_PATCH):	$$($(2)_TARGET_EXTRACT)
>  
> -$(1)-extract:		$(1)-source \
> -			$$($(2)_TARGET_EXTRACT)
> +$(1)-extract:			$$($(2)_TARGET_EXTRACT)
> +$$($(2)_TARGET_EXTRACT):	$$($(2)_TARGET_SOURCE)
>  
>  $(1)-depends:		$$($(2)_DEPENDENCIES)

 Since _CONFIGURE now explicitly depends on _DEPENDENCIES, the -depends
target has become redundant, so you can remove it.

>  
> @@ -465,10 +474,9 @@ else
>  #  source, by rsyncing
>  #  depends
>  #  configure
> -$(1)-configure:		$(1)-depends \
> -			$$($(2)_TARGET_CONFIGURE)
> +$$($(2)_TARGET_CONFIGURE):	$$($(2)_TARGET_RSYNC)
>  
> -$(1)-depends:		$(1)-rsync $$($(2)_DEPENDENCIES)
> +$(1)-depends:		$$($(2)_DEPENDENCIES)

 Here as well.


 Regards,
 Arnout

>  
>  $(1)-patch:		$(1)-rsync
>  $(1)-extract:		$(1)-rsync
> diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
> index ea1c694..4860c58 100644
> --- a/package/uclibc/uclibc.mk
> +++ b/package/uclibc/uclibc.mk
> @@ -29,9 +29,6 @@ UCLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
>  # cross-compiler and the kernel headers
>  UCLIBC_DEPENDENCIES = host-gcc-initial linux-headers
>  
> -# Before uClibc is built, we must have the second stage cross-compiler
> -uclibc-build: host-gcc-intermediate
> -
>  # specifying UCLIBC_CONFIG_FILE on the command-line overrides the .config
>  # setting.
>  ifndef UCLIBC_CONFIG_FILE
> @@ -556,3 +553,6 @@ uclibc-menuconfig: dirs uclibc-patch
>  	rm -f $(UCLIBC_DIR)/.stamp_{configured,built,target_installed,staging_installed}
>  
>  $(eval $(generic-package))
> +
> +# Before uClibc is built, we must have the second stage cross-compiler
> +$(UCLIBC_TARGET_BUILD): | host-gcc-intermediate
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
