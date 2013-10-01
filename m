From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Oct 2013 12:00:15 +0200
Subject: [Buildroot] [PATCH 1/2] psplash: new package
In-Reply-To: <1380615296-26194-1-git-send-email-phil@zankapfel.net>
References: <1380615296-26194-1-git-send-email-phil@zankapfel.net>
Message-ID: <20131001120015.55f3d4c6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Phil Eichinger,

On Tue,  1 Oct 2013 10:14:55 +0200, Phil Eichinger wrote:
> 
> Signed-off-by: Phil Eichinger <phil@zankapfel.net>
> ---
>  package/Config.in          |    1 +
>  package/psplash/Config.in  |   15 +++++++++++++++
>  package/psplash/README     |   16 ++++++++++++++++
>  package/psplash/psplash.mk |   11 +++++++++++
>  4 files changed, 43 insertions(+)
>  create mode 100644 package/psplash/Config.in
>  create mode 100644 package/psplash/README
>  create mode 100644 package/psplash/psplash.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index c6ea66b..86fbce2 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -156,6 +156,7 @@ endif
>  source "package/fbterm/Config.in"
>  source "package/fbv/Config.in"
>  source "package/fb-test-app/Config.in"
> +source "package/psplash/Config.in"
>  source "package/imagemagick/Config.in"
>  source "package/linux-fusion/Config.in"
>  source "package/lite/Config.in"
> diff --git a/package/psplash/Config.in b/package/psplash/Config.in
> new file mode 100644
> index 0000000..186fe8a
> --- /dev/null
> +++ b/package/psplash/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_PSPLASH
> +	bool "psplash"
> +	help
> +	  PSplash is a userspace graphical boot splash screen for mainly
> +	  embedded Linux devices supporting a 16bpp or 32bpp framebuffer.
> +	  It has few dependencies (just libc), supports basic images and
> +	  text and handles rotation. Its visual look is configurable by
> +	  basic source changes.
> +
> +	  Also included is a 'client' command utility for sending
> +	  information to psplash such as boot progress information.
> +
> +	  For usage see README in package directory.
> +
> +	  http://git.yoctoproject.org/cgit/cgit.cgi/psplash/
> diff --git a/package/psplash/README b/package/psplash/README
> new file mode 100644
> index 0000000..89376ad
> --- /dev/null
> +++ b/package/psplash/README
> @@ -0,0 +1,16 @@
> +psplash utility is started, draws its image and progress bar and waits for communication. 
> +psplash-write utility can be used to emit text messages and progress indication to a running psplash.
> +
> +Start the drawing process with 'psplash -n&' as early as possible.
> +
> +Note: psplash creates a FIFO in /tmp for communication with psplash-write.
> +
> +Usage: 
> +* Set progress bar to 50 percent:
> +  psplash-write "PROGRESS 50"
> +
> +* Display message "foobar" above progress bar:
> +  psplash-write "MSG foobar"
> +
> +* Terminate psplash:
> +  psplash-write "QUIT"

I believe we generally put this content directly within the Config.in
help text, though it's true in this case it's a bit long.

> diff --git a/package/psplash/psplash.mk b/package/psplash/psplash.mk
> new file mode 100644
> index 0000000..d3b912d
> --- /dev/null
> +++ b/package/psplash/psplash.mk
> @@ -0,0 +1,11 @@
> +################################################################################
> +#
> +# psplash
> +#
> +################################################################################
> +
> +PSPLASH_VERSION = 0.1
> +PSPLASH_SITE = http://downloads.yoctoproject.org/releases/psplash
> +PSPLASH_LICENSE = GPLv2+

PSLASH_LICENSE_FILES = COPYING

> +
> +$(eval $(autotools-package))

Does it build with a minimal uClibc toolchain? I.e, does the following
configuration builds:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-basic-2013.05-1.tar.bz2"
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_PACKAGE_PSPLASH=y

Other than that, it looks good!

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
