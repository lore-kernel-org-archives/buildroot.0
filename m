From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 1 Dec 2020 22:19:29 +0100
Subject: [Buildroot] [PATCH v2,
 2/2] package/abootimg: use util-linux-libs
In-Reply-To: <20201103205745.123950-2-fontaine.fabrice@gmail.com>
References: <20201103205745.123950-1-fontaine.fabrice@gmail.com>
 <20201103205745.123950-2-fontaine.fabrice@gmail.com>
Message-ID: <9099dcc4-f41e-b8d4-52a9-8485e51c8d5e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03/11/2020 21:57, Fabrice Fontaine wrote:
> abootimg only needs libblkid from util-linux-libs
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Select util-linux-libs instead of util-linux
> 
>  package/abootimg/Config.in   | 2 +-
>  package/abootimg/abootimg.mk | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/abootimg/Config.in b/package/abootimg/Config.in
> index 30e5bd1fb0..8aa4cb414c 100644
> --- a/package/abootimg/Config.in
> +++ b/package/abootimg/Config.in
> @@ -1,7 +1,7 @@
>  config BR2_PACKAGE_ABOOTIMG
>  	bool "abootimg"
>  	depends on BR2_USE_MMU	# libblkid
> -	select BR2_PACKAGE_UTIL_LINUX
> +	select BR2_PACKAGE_UTIL_LINUX_LIBS
>  	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
>  	help
>  	  Tool to manipulate Android Boot Images, either on files
> diff --git a/package/abootimg/abootimg.mk b/package/abootimg/abootimg.mk
> index e906546948..d139d58ceb 100644
> --- a/package/abootimg/abootimg.mk
> +++ b/package/abootimg/abootimg.mk
> @@ -9,8 +9,8 @@ ABOOTIMG_SITE = $(call github,ggrandou,abootimg,$(ABOOTIMG_VERSION))
>  ABOOTIMG_LICENSE = GPL-2.0+
>  ABOOTIMG_LICENSE_FILES = LICENSE
>  
> -# depends on libblkid from util-linux
> -ABOOTIMG_DEPENDENCIES = util-linux
> +# depends on libblkid from util-linux-libs
> +ABOOTIMG_DEPENDENCIES = util-linux-libs

 This we definitely want to avoid in general. The problem is that some libraries
*may* be built in a different way in the second pass than in the first pass. The
whole reason we have this mess is because parts of util-linux depend on packages
that depend on util-linux libraries - and some of these parts may be in
libraries as well! So we *only* want to use util-linux-libs in specific cases
where we can check very carefully if the dependency chain is OK. For libmount/,
it is.

 I remember that I made this analysis when I applied the util-linux-libs split,
but unfortunately it doesn't seem to have made it to the commit message...


 Regards,
 Arnout


>  
>  define ABOOTIMG_BUILD_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
> 
