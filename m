From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 17 Mar 2013 07:12:25 +0200
Subject: [Buildroot] [PATCH] rework patch model
In-Reply-To: <1363466942-21510-1-git-send-email-spdawson@gmail.com>
References: <1363466942-21510-1-git-send-email-spdawson@gmail.com>
Message-ID: <20130317051225.GB5654@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Simon,

On Sat, Mar 16, 2013 at 08:49:02PM +0000, spdawson at gmail.com wrote:
> From: Simon Dawson <spdawson@gmail.com>
> 
> At the Buildroot Developers Meeting (4-5 February 2013, in Brussels) a change
> to the patch logic was discussed. See 
> 
> http://elinux.org/Buildroot:DeveloperDaysFOSDEM2013
> 
> for details. In summary:
> 
> * For patches stored in the package directory, if package/<pkg>/<version>/ 
> does exist, apply package/<pkg>/<version>/*.patch, otherwise, apply 
> package/<pkg>/*.patch
> * For patches stored in the global patches directory, if 
> $(GLOBAL_PATCH_DIR)/<pkg>/<version>/ does exist, apply 
> $(GLOBAL_PATCH_DIR)/<pkg>/<version>/*.patch, otherwise, apply 
> $(GLOBAL_PATCH_DIR)/<pkg>/*.patch
> 
> This patch adds the new BR2_GLOBAL_PATCH_DIR configuration item, and reworks
> the generic package infrastructure to implement the new patch logic.
> 
> Signed-off-by: Simon Dawson <spdawson@gmail.com>
> ---
>  Config.in              |    7 +++++++
>  package/pkg-generic.mk |   16 ++++++++--------
>  2 files changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/Config.in b/Config.in
> index a2c305f..3008374 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -437,6 +437,13 @@ config BR2_PACKAGE_OVERRIDE_FILE
>  	  as the source directory for a particular package. See the
>  	  Buildroot documentation for more details on this feature.
>  
> +config BR2_GLOBAL_PATCH_DIR
> +	string "global patch directory"
> +	help
> +	  You may specify a directory containing global package patches.
> +	  Note that any global patches for a package will be applied AFTER
> +	  the default Buildroot patch set for the package.

The help text should mention the directory layout as detailed in the commit 
log above, IMO.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
