From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 10 Feb 2016 00:08:58 +0100
Subject: [Buildroot] [PATCH v2] linux: add conditional patch for
 timeconst.pl
In-Reply-To: <1454852508-27544-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1454852508-27544-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <56BA718A.5060500@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07-02-16 14:41, gustavo.zacarias at free-electrons.com wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> Kernels older than 3.9 (not counting stable releases) used the
> timeconst.pl perl script for their build process.
> The problem with this script is that it used deprecated perl features,
> namely defined(@array) which was removed for the perl 5.22 release,
> causing build failure of older kernels on newer distributions.
> 
> To fix this instead of going the hard way (moving to the new
> timeconst.bc script) use the easy way by patching timeconst.pl with an
> upstream patch used for stable releases.
> 
> First try a dry-run on the patch to see if it applies, if it does then
> call a proper APPLY_PATCHES to it.
> 
> Tested against an arbitrary 2.6.30 kernel (applies and builds), against
> 4.4.1 for a missing timeconst.pl (does not apply since it's missing) and
> 3.8.13 (does not apply since it's fixed already).
> 
> Known broken distributions: fedora 23.

 and debian testing (stretch) and unstable (sid).

 As Thomas said, it's dirty, but we really need this.

> 
> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> ---
> v2: rebase on top of master
> 
>  ...nst.pl-Eliminate-Perl-warning.patch.conditional | 45 ++++++++++++++++++++++
>  linux/linux.mk                                     | 10 +++++
>  2 files changed, 55 insertions(+)
>  create mode 100644 linux/0001-timeconst.pl-Eliminate-Perl-warning.patch.conditional
> 

[snip]

> diff --git a/linux/linux.mk b/linux/linux.mk
> index 578fea1..7e20255 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -184,6 +184,16 @@ endef
>  
>  LINUX_POST_PATCH_HOOKS += LINUX_APPLY_LOCAL_PATCHES
>  
> +# Older linux kernels use deprecated perl constructs in timeconst.pl
> +# that were removed for perl 5.22+ so it breaks on newer distributions
> +# Try a dry-run patch to see if this applies, if it does go ahead
> +define LINUX_TRY_PATCH_TIMECONST
> +	@if patch -p1 --dry-run -f -s -d $(@D) <$(LINUX_PKGDIR)/0001-timeconst.pl-Eliminate-Perl-warning.patch.conditional >/dev/null ; then \
> +		$(APPLY_PATCHES) $(@D) $(LINUX_PKGDIR) 0001-timeconst.pl-Eliminate-Perl-warning.patch.conditional ; \

 The only reason to use APPLY_PATCHES is that it updates .applied_patches_list,
right? In that case, perhaps it's better to do that directly here. So instead of
a dry-run, just apply the patch right away, and if it succeeds add it to
.applied_patches_list.

> +	fi
> +endef
> +LINUX_POST_PATCH_HOOKS += LINUX_TRY_PATCH_TIMECONST

 This is a patch that we probably _do_ want to apply even in case of
OVERRIDE_SRCDIR. So maybe add it to LINUX_PRE_CONFIGURE_HOOKS instead. Even
though that's even more of a hack (and conflicts with the out-of-tree build
support).


 Regards,
 Arnout

> +
>  ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
>  LINUX_KCONFIG_DEFCONFIG = $(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
>  else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
