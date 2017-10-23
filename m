From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 23 Oct 2017 21:49:39 +0200
Subject: [Buildroot] [PATCH 09/13] pkg-download: support new subdir for
 mirrors
In-Reply-To: <20170704162211.13238-10-maxime.hadjinlian@gmail.com>
References: <20170704162211.13238-1-maxime.hadjinlian@gmail.com>
 <20170704162211.13238-10-maxime.hadjinlian@gmail.com>
Message-ID: <5dd5ec31-1c3c-3c6b-d422-e0714399534d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-07-17 18:22, Maxime Hadjinlian wrote:
> Since we introduced subdirectory to the DL_DIR, we need to support them
                      subdirectories

> in the PRIMARY and BACKUP mirror as they evolve to the new tree
> structure.
> 
> We check first the new URI (with the subdir), and in case of failure, we
> go check without.
> By checking both URIs, we ensure that old mirror are usable.
                                            mirrors

> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.co> ---
>  package/pkg-download.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index 9a455dc79b..47671e21a7 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -75,6 +75,7 @@ export BR_NO_CHECK_HASH_FOR =
>  
>  ifneq ($(call qstrip,$(BR2_PRIMARY_SITE)),)
>  DOWNLOAD_URIS += \
> +	-u $(call getschemeplusuri,$(BR2_PRIMARY_SITE))/$(notdir $($(PKG)_DL_DIR)) \

 I was thinking, it is a bit silly to first calculate that path and then
applying notdir to it, but I guess this is more robust to a change of PKG_DL_DIR.

 There is just one thing to check: I think that this DOWNLOAD_URIS may also be
used outside the context of a package, in which case $(PKG) is not defined. It's
not terrible because then we just go to PRIMARY_SITE without subdir, but it's a
pity to do things twice. So maybe better

	$(if $(PKG),$(call getschemeplusuri,$(BR2_PRIMARY_SITE))/$(notdir
$($(PKG)_DL_DIR))) \

 Oh yeah, completely easy to read :-)

 Regards,
 Arnout

>  	-u $(call getschemeplusuri,$(BR2_PRIMARY_SITE))
>  endif
>  
> @@ -83,6 +84,7 @@ DOWNLOAD_URIS += \
>  	-u $($(PKG)_SITE_METHOD)+$(dir $(1))
>  ifneq ($(call qstrip,$(BR2_BACKUP_SITE)),)
>  DOWNLOAD_URIS += \
> +	-u $(call getschemeplusuri,$(BR2_BACKUP_SITE))/$(notdir $($(PKG)_DL_DIR)) \
>  	-u $(call getschemeplusuri,$(BR2_BACKUP_SITE))
>  endif
>  endif
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
