From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 Jan 2021 23:07:25 +0100
Subject: [Buildroot] [PATCH 1/2] core: add
 BR2_PRIMARY_SITE_ONLY_EXTENDED_DOMAINS
In-Reply-To: <20201204123313.14455-1-patrickdepinguin@gmail.com>
References: <20201204123313.14455-1-patrickdepinguin@gmail.com>
Message-ID: <20210102220725.GI2997@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-12-04 13:33 +0100, Thomas De Schampheleire spake thusly:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> If configured, the primary site typically points to a mirror on the intranet
> of an organization. The purpose of BR2_PRIMARY_SITE_ONLY is then to only
> download from this mirror.
> 
> However, the organization may also have some local Buildroot packages
> that download from a version control repository (git, hg, ...). In this case,
> the mirror will normally not contain the sources, instead they should be
> cloned via the version control tool. So in this case, BR2_PRIMARY_SITE_ONLY
> cannot be used.
> 
> This means that the organization must resort to other means to make sure no
> external downloads are performed.
> 
> This patch attempts to solve this situation by adding
> BR2_PRIMARY_SITE_ONLY_EXTENDED_DOMAINS. This string option can contain
> additional domains from which download is allowed when BR2_PRIMARY_SITE_ONLY
> is set.
> 
> The organization can thus set:
> BR2_PRIMARY_SITE_ONLY=y
> BR2_PRIMARY_SITE_ONLY_EXTENDED_DOMAINS="git.example.com hg.example.com"

BR2_PRIMRAY_SITE_ONLY_ALLOWED_DOMAINS would be more meaningful, I
think...

> to disallow any external downloads other than the primary site and the
> mentioned version control domains.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Although I do understand the issue, and I do agree that this is a sane
policy to not rely on external resources in such a situation, I still
think this is pushing the boundaries a bit on Buildroot...

First, there would be nothing that would prevent a local user to enter
menuconfig and set this to whatever they want, or to simply disable
primary-only. So, an option such as BR2_PRIMRAY_SITE_ONLY_ALLOWED_DOMAINS
would not cater to local users on their development machines.

So, we're left with automated builds, running in a CI. In this case, the
environment is much more controlled, and I think this is where such a
limitation should take place. The CI system should not be able to reach
out to the wider internet, and should be constrained to access local the
network(s).

For example, in the CI at $work, there are two steps:
 1. make source, which has access only to the local network;
 2. make, which does not have access to the network at all.

Also, when considering the upcoming "package managers" (go, cargo,
etc...), the filtering is way too early, and can't be applied to them.
I.e. there is no way to tell (e.g.) cargo that a set of domains are
allowed while others are not. So an option like you propose would only
have a limited use, with un-pluggable holes hidden from sight, ready to
trip users hard-time. A properly set-up CI system would however prevent
those package managers from indeed reaching outside the company's
network(s).

So, no, I am very much not in favour of this new option...

Regards,
Yann E. MORIN.

> ---
>  Config.in               | 12 ++++++++++++
>  package/pkg-download.mk |  8 +++++++-
>  2 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/Config.in b/Config.in
> index e35a78fb71..c9206876ff 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -231,6 +231,18 @@ config BR2_PRIMARY_SITE_ONLY
>  	  the project can be built even if the upstream tarball
>  	  locations disappear.
>  
> +config BR2_PRIMARY_SITE_ONLY_EXTENDED_DOMAINS
> +	string "Additional domains to allow downloads from"
> +	depends on BR2_PRIMARY_SITE_ONLY
> +	help
> +	  If BR2_PRIMARY_SITE_ONLY is enabled, version control downloads
> +	  (git, hg, ...) on the 'internal' domain would also be
> +	  disallowed.
> +	  With this option, you can specify additional domains from
> +	  which downloads will be allowed in BR2_PRIMARY_SITE_ONLY-mode.
> +	  Domains should not include a protocol prefix, and multiple
> +	  domains can be separated by spaces.
> +
>  if !BR2_PRIMARY_SITE_ONLY
>  
>  config BR2_BACKUP_SITE
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index 951d2fb554..d23838a329 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -78,7 +78,13 @@ DOWNLOAD_URIS += \
>  	$(call getschemeplusuri,$(call qstrip,$(BR2_PRIMARY_SITE)),urlencode)
>  endif
>  
> -ifeq ($(BR2_PRIMARY_SITE_ONLY),)
> +ifeq ($(BR2_PRIMARY_SITE_ONLY),y)
> +# Conditionally add site download if it matches the configured extended domains
> +DOWNLOAD_URIS += \
> +	$(if $(filter $(call qstrip,$(BR2_PRIMARY_SITE_ONLY_EXTENDED_DOMAINS)),$(call domain,$(1))), \
> +		$(patsubst %/,%,$(dir $(call qstrip,$(1)))))
> +else
> +# Unconditionally add site download
>  DOWNLOAD_URIS += \
>  	$(patsubst %/,%,$(dir $(call qstrip,$(1))))
>  ifneq ($(call qstrip,$(BR2_BACKUP_SITE)),)
> -- 
> 2.26.2
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
