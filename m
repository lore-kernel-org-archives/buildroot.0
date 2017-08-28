From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 28 Aug 2017 22:49:17 +0200
Subject: [Buildroot] [PATCH] pkg-download: remove explicit PKG_VERSION
 from github helper
In-Reply-To: <1503912643-27210-1-git-send-email-marcin.nowakowski@imgtec.com>
References: <1503912643-27210-1-git-send-email-marcin.nowakowski@imgtec.com>
Message-ID: <627f9747-c59d-9b8f-45d9-c5ccdfbd2af6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Marcin,

On 28-08-17 11:30, Marcin Nowakowski wrote:
> Currently it is always required to add package version as an argument to
> the github helper. Since the version is always defined as PKG_VERSION,
> drop this argument and generate it atuomatically inside the helper
                                     automatically
> routine.

 Good idea!

> 
> To make the transition easier the github helper function is extended to
> support both 2 and 3 argument variants (ie. either use the provided
> package version argument or automatically substitute with PKG_VERSION if
> not available).

 It's not just to make the transition easier, it is also needed because you can
use the github helper outside the _SITE variable as well. See for example
ci40_defconfig.

> 
> Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
> ---
>  docs/manual/adding-packages-tips.txt | 2 +-
>  package/pkg-download.mk              | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
> index 19577fa..30ec768 100644
> --- a/docs/manual/adding-packages-tips.txt
> +++ b/docs/manual/adding-packages-tips.txt
> @@ -138,7 +138,7 @@ past, the 'github' helper function should be used as shown below.
>  ------------------------
>  # Use a tag or a full commit ID
>  FOO_VERSION = v1.0
> -FOO_SITE = $(call github,<user>,<package>,$(FOO_VERSION))
> +FOO_SITE = $(call github,<user>,<package>)
>  ------------------------
>  
>  .Notes
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index fbbc2d7..38c8f35 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -52,8 +52,8 @@ notdomain = $(patsubst $(call domain,$(1),$(2))$(call domainseparator,$(2))%,%,$
>  # default domainseparator is /, specify alternative value as first argument
>  domainseparator = $(if $(1),$(1),/)
>  
> -# github(user,package,version): returns site of GitHub repository
> -github = https://github.com/$(1)/$(2)/archive/$(3)
> +# github(user,package[,version]): returns site of GitHub repository
> +github = https://github.com/$(1)/$(2)/archive/$(if $(3),$(3),$($(call UPPERCASE,$(pkgname))_VERSION))

 I think the condition can be simplified to $(or $(3),$($(PKG)_VERSION))
We're trying to use $(PKG) as much as possible. It should expand to the
"current" package in any context where the github helper could be used.

 Regards,
 Arnout


>  
>  # Expressly do not check hashes for those files
>  # Exported variables default to immediately expanded in some versions of
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
