From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 4 Oct 2017 18:35:07 +0200
Subject: [Buildroot] [PATCH] pkg-download: make package name optional in
 github helper
In-Reply-To: <20171004085745.15457-1-ismael@iodev.co.uk>
References: <20171004085745.15457-1-ismael@iodev.co.uk>
Message-ID: <26d3dc60-5a3a-0fce-f3cf-b75ee2670644@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Ismael,


On 04-10-17 10:57, Ismael Luceno wrote:
> Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>
> ---
>  package/pkg-download.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index dc4ff1c8c755..78307eee8a33 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -52,8 +52,8 @@ notdomain = $(patsubst $(call domain,$(1),$(2))$(call domainseparator,$(2))%,%,$
>  # default domainseparator is /, specify alternative value as first argument
>  domainseparator = $(if $(1),$(1),/)
>  
> -# github(user,package[,version]): returns site of GitHub repository
> -github = https://github.com/$(1)/$(2)/archive/$(or $(3),$($(call UPPERCASE,$(pkgname))_VERSION))

 As noticed by Peter, this was already wrong in the original patch: it only
works if the github helper is used in a := assignment, otherwise $(pkgname)
evaluates to empty by the time the variable is evaluated.

 The solution (probably) is to use $(PKG) instead of $(pkgname).

> +# github(user[,package[,version]]): returns site of GitHub repository
> +github = https://github.com/$(1)/$(or $(2),$(pkgname))/archive/$(or $(3),$($(call UPPERCASE,$(pkgname))_VERSION))

 Could you estimate how many packages could be simplified with this?

 I'm not actually sure this is a good idea anyway. The _VERSION is OK because it
works for *all* packages, the third argument is only needed when you use the
github helper outside a package (e.g. for a custom kernel URL). But this change
will apply only to a limited number of packages on the one hand, and on the
other hand it makes it even more difficult for people to understand what is
meant with this $(call github,foo) construct.

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
