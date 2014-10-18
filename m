From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 18 Oct 2014 16:13:24 +0200
Subject: [Buildroot] [PATCH] modplugtools: Added package
In-Reply-To: <1413565811-7196-1-git-send-email-maarten@treewalker.org>
References: <1413565811-7196-1-git-send-email-maarten@treewalker.org>
Message-ID: <54427584.5060903@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/10/14 19:10, Maarten ter Huurne wrote:
> This installs the 'modplug123' command line tool to play music files
> using libmodplug.
> 
> http://modplug-xmms.sourceforge.net/
> 
> Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
> ---
> The command line tool is about 10 kB in size and is useful to test
> libmodplug and/or audio playback in general.
> 
>  package/Config.in                    |  1 +
>  package/modplugtools/Config.in       |  9 +++++++++
>  package/modplugtools/modplugtools.mk | 21 +++++++++++++++++++++
>  3 files changed, 31 insertions(+)
>  create mode 100644 package/modplugtools/Config.in
>  create mode 100644 package/modplugtools/modplugtools.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 76fd1a0..03c7074 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -18,6 +18,7 @@ menu "Audio and video applications"
>  	source "package/lame/Config.in"
>  	source "package/libvpx/Config.in"
>  	source "package/madplay/Config.in"
> +	source "package/modplugtools/Config.in"
>  	source "package/mpd/Config.in"
>  	source "package/mpg123/Config.in"
>  	source "package/mplayer/Config.in"
> diff --git a/package/modplugtools/Config.in b/package/modplugtools/Config.in
> new file mode 100644
> index 0000000..53e9672
> --- /dev/null
> +++ b/package/modplugtools/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_MODPLUGTOOLS
> +	bool "modplugtools"
> +	select BR2_PACKAGE_LIBAO
> +	select BR2_PACKAGE_LIBMODPLUG
> +	help
> +	  This installs the 'modplug123' command line tool to play music files
> +	  using libmodplug.

 Small nit: I'd say "MOD files" rather than "music files". Or does it play other
formats as well?

> +
> +	  http://modplug-xmms.sourceforge.net/
> diff --git a/package/modplugtools/modplugtools.mk b/package/modplugtools/modplugtools.mk
> new file mode 100644
> index 0000000..392f0f2
> --- /dev/null
> +++ b/package/modplugtools/modplugtools.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# modplugtools
> +#
> +################################################################################
> +
> +MODPLUGTOOLS_VERSION = 0.5.3
> +MODPLUGTOOLS_SITE = http://downloads.sourceforge.net/project/modplug-xmms/modplug-tools
> +MODPLUGTOOLS_LICENSE = GPLv3
> +MODPLUGTOOLS_LICENSE_FILES = COPYING

 It's indeed v3 only (cfr. AUTHORS).

> +
> +MODPLUGTOOLS_DEPENDENCIES = libao libmodplug
> +
> +# Only play through libao: some platforms don't have OSS support and for those
> +# that do, playing through libao is still going to be sufficient.
> +define MODPLUGTOOLS_REMOVE_MODPLUGPLAY
> +	rm $(TARGET_DIR)/usr/bin/modplugplay

 I don't understand this. The executable is really small, and it builds
correctly (otherwise you wouldn't even get this far), so why bother with
removing it? Someone who cares that much about their rootfs size will have to
remove a bunch of other stuff from the installed system anyway.


 Regards,
 Arnout

> +endef
> +MODPLUGTOOLS_POST_INSTALL_TARGET_HOOKS += MODPLUGTOOLS_REMOVE_MODPLUGPLAY
> +
> +$(eval $(autotools-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
