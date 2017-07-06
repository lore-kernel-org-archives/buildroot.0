From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 7 Jul 2017 01:18:33 +0200
Subject: [Buildroot] [PATCH] ccache: make default host-ccache cache dir
 fit for multi-user setups
In-Reply-To: <20170706104841.7711-1-peter@korsgaard.com>
References: <20170706104841.7711-1-peter@korsgaard.com>
Message-ID: <8c3c10e0-7f63-0063-5ec2-5edb24ce978f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-07-17 12:48, Peter Korsgaard wrote:
> While building I noticed:
> 
>>>> host-ccache 3.3.4 Building
> conf.c: In function 'conf_create':
> conf.c:314:2: warning: too many arguments for format [-Wformat-extra-args]
>   conf->cache_dir = format("/home/peko/.buildroot-ccache", get_home_directory());
>   ^
> 
> As host-ccache gets installed into $(HOST_DIR) and is part of the SDK,
> hardcoding the build user homedir isn't really nice for the relocatable
> SDK feature (or simply for a SDK used by multiple users).

 Absolutely true. However, I wonder if hardcoding the ccache path in the ccache
binary is really such a good idea in the context of an SDK. So perhaps we should
just replace the default with our own default, i.e.
sed s,%s/\.ccache,%s/.buildroot-ccache,

 Note also that it may have been intentional to point to a shared ccache
directory that happens to reside in some user's home directory. But of course,
in that case, the BR_CACHE_DIR we use will still take over.

> 
> As the warning shows, CCache replaces "%s" with the current user home
> directory, so rewrite BR_CACHE_DIR to use this feature if it begins with
> $HOME.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/ccache/ccache.mk | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
> index 97d66bb45b..afbec44fac 100644
> --- a/package/ccache/ccache.mk
> +++ b/package/ccache/ccache.mk
> @@ -28,9 +28,13 @@ HOST_CCACHE_CONF_OPTS += --with-bundled-zlib
>  #    BR2_CCACHE_DIR.
>  #  - Change hard-coded last-ditch default to match path in .config, to avoid
>  #    the need to specify BR_CACHE_DIR when invoking ccache directly.
> +#    CCache replaces "%s" with the home directory of the current user,
> +#    So rewrite BR_CACHE_DIR to take that into consideration for SDK purpose
> +HOST_CCACHE_DEFAULT_CCACHE_DIR = $(patsubst $(HOME)/%,\%s/%,$(BR_CACHE_DIR))

 This looked really really weird to me when I first saw it, but in the end it
does make sense.

 Still, since nobody ever complained about this, I'm not so sure we should "fix"
it. It's just as likely to actually break things for some user. So it's a weak
NACK from me.

 Regards,
 Arnout

> +
>  define HOST_CCACHE_PATCH_CONFIGURATION
>  	sed -i 's,getenv("CCACHE_DIR"),getenv("BR_CACHE_DIR"),' $(@D)/ccache.c
> -	sed -i 's,"%s/.ccache","$(BR_CACHE_DIR)",' $(@D)/conf.c
> +	sed -i 's,"%s/.ccache","$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/conf.c
>  endef
>  
>  HOST_CCACHE_POST_PATCH_HOOKS += HOST_CCACHE_PATCH_CONFIGURATION
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
