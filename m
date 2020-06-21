From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Jun 2020 10:56:51 +0200
Subject: [Buildroot] [RFC v9 03/10] cpe-info: only report target pkgs
In-Reply-To: <20200616170341.45098-3-matthew.weber@rockwellcollins.com>
References: <20200616170341.45098-1-matthew.weber@rockwellcollins.com>
 <20200616170341.45098-3-matthew.weber@rockwellcollins.com>
Message-ID: <20200621085651.GB2351@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matt, All,

On 2020-06-16 12:03 -0500, Matt Weber spake thusly:
> The reporting of host packages causes some duplication and complicates
> what is really in the targets configuration. For the purpose of the
> first version of this patchset, its assumed that host packages aren't
> relevant for the configuration and we only report the target's
> contents.

Ah, I see this patch now, which addresses my concerns about hos
packages in the first patch.

So, I think we should keep the $(1)-cpe-info rule as -is, but filter-out
host packages as I suggested in the review of the first patch.

Regards,
Yann E. MORIN.

> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
> Changes
> 
> v4 -> v8
>  - None
> 
> v3
>  - Fixed host build error because cpe-info wasn't defined
> 
> v1 -> v2
> [Thomas P
>  - select if target vs selecting not host
> ---
>  package/pkg-generic.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 7d892ca1d6..efdde0ad94 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -984,10 +984,12 @@ endif
>  
>  $(1)-cpe-info: PKG=$(2)
>  $(1)-cpe-info:
> +ifeq ($$($(2)_TYPE),target)
>  ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
>  	@$$(call MESSAGE,"Collecting cpe info")
>  	$(Q)$$(call cpe-manifest,$$($(2)_CPE_PREFIX):$$($(2)_CPE_ID):$(CPE_SUFFIX),$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_ACTUAL_SOURCE_SITE))
>  endif # ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
> +endif # ifeq ($$($(2)_TYPE),target)
>  
>  # legal-info: declare dependencies and set values used later for the manifest
>  ifneq ($$($(2)_LICENSE_FILES),)
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
