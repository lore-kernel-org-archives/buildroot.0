From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 16 Sep 2013 23:39:34 +0200
Subject: [Buildroot] [PATCHv2 2/4] core: allow external
 Config.in/makefile code to be integrated
In-Reply-To: <1379185433-8770-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1379185433-8770-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1379185433-8770-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <52377A96.8080402@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/09/13 21:03, Thomas Petazzoni wrote:
> This commit allows the BR2_EXTERNAL directory to contain Config.in and
> Makefile code, which gets integrated into the Buildroot build logic:
>
>   - Buildroot automatically includes the $BR2_EXTERNAL/Config.in in the
>     top-level configuration menu.
>
>   - Buildroot automatically includes the BR2_EXTERNAL/external.mk in
>     the build logic, so it can for example be used to include other .mk
>     files that define package recipes.
>
> We also add a dummy Config.in file in support/dummy-external/ to
> ensure that the source "$BR2_EXTERNAL/Config.in" line will point to an
> existing file even when BR2_EXTERNAL is not used by the user.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>   Config.in                        | 2 ++
>   Makefile                         | 4 ++++
>   support/dummy-external/Config.in | 0
>   3 files changed, 6 insertions(+)
>   create mode 100644 support/dummy-external/Config.in
>
> diff --git a/Config.in b/Config.in
> index 522eaf8..9ef5466 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -465,3 +465,5 @@ source "boot/Config.in"
>   source "package/Config.in.host"
>
>   source "Config.in.legacy"
> +
> +source "$BR2_EXTERNAL/Config.in"

  I would prefer this to be in package/Config.in, and source 
$BR2_EXTERNAL/package/Config.in. I think 95% of the use cases will be for 
packages, and the other 5% are bootloaders which are the same as packages 
anyway. And even if it is not a proper generic package (e.g. it's a 
filesystem), putting it in the packages menu doesn't hurt that much. If 
you don't put it in the package subdirectory, then you either force users 
to create a oneline Config.in, or you end up with a messy looking 
directory mixing packages with the configs/ and board/ directories.


  Also it is perhaps better to add to the Makefile:

ifeq ($(wildcard $(BR2_EXTERNAL)/package/Config.in,)
EXTERNAL_PACKAGE_CONFIG_IN = support/dummy-external/Config.in
else
EXTERNAL_PACKAGE_CONFIG_IN = $(BR2_EXTERNAL)/package/Config.in
endif

(and pass that to the config env as well).

  That way, you're not obliged to have a Config.in in your external tree, 
and it is still possible to use it for nothing more than the defconfigs etc.

> diff --git a/Makefile b/Makefile
> index 13ad342..bea5ad5 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -348,6 +348,10 @@ include boot/common.mk
>   include linux/linux.mk
>   include system/system.mk
>
> +ifeq ($(BR2_EXTERNAL_USED),y)
> +include $(BR2_EXTERNAL)/external.mk

  Here I'd

-include $(sort $(wildcard $(BR2_EXTERNAL)/package/*/*.mk))


  Regards,
  Arnout

> +endif
> +
>   TARGETS+=target-finalize
>
>   ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
> diff --git a/support/dummy-external/Config.in b/support/dummy-external/Config.in
> new file mode 100644
> index 0000000..e69de29
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
