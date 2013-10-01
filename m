From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Oct 2013 16:11:11 +0200
Subject: [Buildroot] [PATCH v2 1/1] psplash: new package
In-Reply-To: <1380633020-27233-1-git-send-email-phil@zankapfel.net>
References: <1380633020-27233-1-git-send-email-phil@zankapfel.net>
Message-ID: <20131001161111.3e65a53a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Phil Eichinger,

On Tue,  1 Oct 2013 15:10:20 +0200, Phil Eichinger wrote:
> 
> Signed-off-by: Phil Eichinger <phil@zankapfel.net>
> ---
> Changes v1 -> v2:
>  - psplash needs BR2_USE_WCHAR
> 
>  package/Config.in          |    1 +
>  package/psplash/Config.in  |   16 ++++++++++++++++
>  package/psplash/README     |   16 ++++++++++++++++
>  package/psplash/psplash.mk |   11 +++++++++++
>  4 files changed, 44 insertions(+)
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

Alphabetic ordering?

>  source "package/imagemagick/Config.in"
>  source "package/linux-fusion/Config.in"
>  source "package/lite/Config.in"
> diff --git a/package/psplash/Config.in b/package/psplash/Config.in
> new file mode 100644
> index 0000000..b87e29e
> --- /dev/null
> +++ b/package/psplash/Config.in
> @@ -0,0 +1,16 @@
> +config BR2_PACKAGE_PSPLASH
> +	bool "psplash"
> +	depends on BR2_USE_WCHAR
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

There should be a comment that says this package is not available, when
wchar is not enabled. See many other Buildroot packages.

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

Haven't seen my comment indicating that this should probably be in the
Config.in help text?

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

and my comment about the license file?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
