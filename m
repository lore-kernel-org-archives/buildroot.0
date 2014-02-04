From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 04 Feb 2014 18:46:33 +0100
Subject: [Buildroot] [PATCH 2 of 4 v2] infra: remove usage of 4th
 parameter to inner-generic-package
In-Reply-To: <7a542b87fe6e904a88f6.1391530914@argentina>
References: <patchbomb.1391530912@argentina>
 <7a542b87fe6e904a88f6.1391530914@argentina>
Message-ID: <52F12779.7000008@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/02/14 17:21, Thomas De Schampheleire wrote:
> In preparation of the removal of the 4th parameter to inner-generic-package
> and the pkgparentdir helper function, this patch removes the direct usage of
> this 4th parameter. The remaining usage
> ifeq ($(4),boot/)
> can become
> $(filter boot/%,$(call pkgdir))
> instead (and similar for toolchain).
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> ---
>  package/pkg-generic.mk |  4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -516,9 +516,9 @@ endif
>  # kernel case, the bootloaders case, and the normal packages case.
>  ifeq ($(1),linux)
>  $(2)_KCONFIG_VAR = BR2_LINUX_KERNEL
> -else ifeq ($(4),boot/)
> +else ifneq ($(filter boot/%,$(call pkgdir)),)

 AFAICS the call is redundant here.

 Yes, I know it's there in the pkgname definition, but there's no need to
repeate past mistakes :-)

 (The call construct is only needed for macros that take arguments. It's
another example of make insanity...)

 Regards,
 Arnout

>  $(2)_KCONFIG_VAR = BR2_TARGET_$(2)
> -else ifeq ($(4),toolchain/)
> +else ifneq ($(filter toolchain/%,$(call pkgdir)),)
>  $(2)_KCONFIG_VAR = BR2_$(2)
>  else
>  $(2)_KCONFIG_VAR = BR2_PACKAGE_$(2)
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
