From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 23 Oct 2017 22:17:48 +0200
Subject: [Buildroot] [PATCH 12/13] download: add flock call before
 dl-wrapper
In-Reply-To: <20170704162211.13238-13-maxime.hadjinlian@gmail.com>
References: <20170704162211.13238-1-maxime.hadjinlian@gmail.com>
 <20170704162211.13238-13-maxime.hadjinlian@gmail.com>
Message-ID: <90fd1736-8465-94ff-ad56-7911a12f628d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-07-17 18:22, Maxime Hadjinlian wrote:
> In order to introduce the cache mechanisms, we need to have a lock on
> the $(LIBFOO_DL_DIR), otherwise it would be impossible to do parallel
> download (a shared DL_DIR for two buildroot instances).

 Note that this is also needed for top-level parallel build.

> 
> To make sure the directory exists, the mkdir call has been removed from
> the dl-wrapper and put in the infrastructure.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com> ---
>  package/pkg-download.mk     | 4 +++-
>  support/download/dl-wrapper | 1 -
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index 47671e21a7..c67f1ba4e1 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -19,6 +19,7 @@ SSH := $(call qstrip,$(BR2_SSH))
>  export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
>  
>  DL_WRAPPER = support/download/dl-wrapper
> +FLOCK = flock $($(PKG)_DL_DIR)/

 IMO adding a variable for this makes things less clear.

 Also, I believe it is possible that DOWNLOAD gets called outside of package
context. Therefore, it should be $(if $(PKG),$($(PKG)_DL_DIR),$(DL_DIR))

 Regards,
 Arnout

>  
>  # DL_DIR may have been set already from the environment
>  ifeq ($(origin DL_DIR),undefined)
> @@ -91,7 +92,8 @@ endif
>  
>  define DOWNLOAD
>  	$(Q)$(if $(filter bzr cvs hg svn,$($(PKG)_SITE_METHOD)),export BR_NO_CHECK_HASH_FOR=$(notdir $(1));) \
> -	$(EXTRA_ENV) $(DL_WRAPPER) \
> +	$(Q)mkdir -p $($(PKG)_DL_DIR)/
> +	$(EXTRA_ENV) $(FLOCK) $(DL_WRAPPER) \
>  		-c $($(PKG)_DL_VERSION) \
>  		-f $(notdir $(1)) \
>  		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
> diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
> index f14a60c173..50c14a2e16 100755
> --- a/support/download/dl-wrapper
> +++ b/support/download/dl-wrapper
> @@ -50,7 +50,6 @@ main() {
>      if [ -z "${output}" ]; then
>          error "no output specified, use -o\n"
>      fi
> -    mkdir -p "$(dirname "${output}")"
>  
>      # If the output file already exists and:
>      # - there's no .hash file: do not download it again and exit promptly
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
