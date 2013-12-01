From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 01 Dec 2013 01:29:37 +0100
Subject: [Buildroot] [PATCHv4 2/5] core: allow external
 Config.in/makefile code to be integrated
In-Reply-To: <1385751626-28967-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1385751626-28967-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1385751626-28967-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <529A82F1.6030007@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/11/13 20:00, Thomas Petazzoni wrote:
> This commit allows the BR2_EXTERNAL directory to contain Config.in and
> Makefile code, which gets integrated into the Buildroot build logic:
>
>   - Buildroot automatically includes the $BR2_EXTERNAL/Config.in in the
>     top-level configuration menu.
>
>   - Buildroot automatically includes the BR2_EXTERNAL/external.mk in
>     the build logic, so it can for example be used to include other .mk
>     files that define package recipes.

  The advantage of enforcing the package dir would have been that we 
could directly include $(BR2_EXTERNAL)/package/*/*.mk, instead of forcing 
the user to create an external.mk that contains either

include $(BR2_EXTERNAL)/package/*/*.mk

or

include $(BR2_EXTERNAL)/*/*.mk

depending on how he structures things.


  Maybe a compromise is that we source $BR2_EXTERNAL/package/Config.in 
but include it at the end of the top-level Config.in instead of at the 
beginning of the package/Config.in. I guess that's what Samuel meant 
before...

>
> This is typically intended to be used to create target packages in the
> BR2_EXTERNAL directory, but can also be used for bootloaders, host
> packages, or other custom make logic.
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
> index 98726ab..9b10693 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -486,3 +486,5 @@ source "boot/Config.in"
>   source "package/Config.in.host"
>
>   source "Config.in.legacy"
> +
> +source "$BR2_EXTERNAL/Config.in"
> diff --git a/Makefile b/Makefile
> index 5878d44..b5a9828 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -375,6 +375,10 @@ include boot/common.mk
>   include linux/linux.mk
>   include system/system.mk
>
> +ifeq ($(BR2_EXTERNAL_USED),y)
> +include $(BR2_EXTERNAL)/external.mk
> +endif

  Wouldn't it be simpler to put a dummy external.mk file in
dummy-external as well? Then BR2_EXTERNAL_USED can be removed (the
following patch doesn't need it: the pattern rule will just never match
because support/dummy-external/configs doesn't exist).


  Regards,
  Arnout

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
