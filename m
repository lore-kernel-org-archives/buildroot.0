From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 04 Apr 2013 13:41:06 +0200
Subject: [Buildroot] [PATCH] pkg-download: take some more care of
 <PKG_>VERSION when METHOD is git
In-Reply-To: <1364566078-29535-2-git-send-email-Patrick.Boettcher@parrot.com>
References: <1364566078-29535-1-git-send-email-Patrick.Boettcher@parrot.com>
 <1364566078-29535-2-git-send-email-Patrick.Boettcher@parrot.com>
Message-ID: <515D66D2.5050204@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/03/13 15:07, Patrick Boettcher wrote:
> If a package's SITE_METHOD is set to git, but the VERSION is not set
> it fails to create a tar-ball, this patch is fixes this by always using
> HEAD as git-archive reference.
>
> HEAD will work in both cases:
> 1) if VERSION is set the clone's HEAD is VERSION,
> 2) if VERSION is not set the clone's HEAD is the default branch.

  This doesn't work if the version is an unnamed sha1. In that case, a 
full clone will be done so HEAD does not point to the requested version.

  A better solution is probably to have <PKG>_VERSION default to HEAD if 
the site-method is one of the revision control systems.


  Regards,
  Arnout

>
> Signed-off-by: Patrick Boettcher <Patrick.Boettcher@parrot.com>
> ---
>   package/pkg-download.mk |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index 1705fcd..d21605a 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -88,7 +88,7 @@ define DOWNLOAD_GIT
>   	  (echo "Doing full clone" && \
>   	   $(GIT) clone --bare $($(PKG)_SITE) $($(PKG)_BASE_NAME))) && \
>   	pushd $($(PKG)_BASE_NAME) > /dev/null && \
> -	$(GIT) archive --format=tar --prefix=$($(PKG)_BASE_NAME)/ $($(PKG)_DL_VERSION) | \
> +	$(GIT) archive --format=tar --prefix=$($(PKG)_BASE_NAME)/ HEAD | \
>   		gzip -c > $(DL_DIR)/$($(PKG)_SOURCE) && \
>   	popd > /dev/null && \
>   	rm -rf $($(PKG)_DL_DIR) && \
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
