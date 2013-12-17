From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 17 Dec 2013 10:58:04 +0100
Subject: [Buildroot] [PATCH] Packages: use https to clone gitorious
	repositories
In-Reply-To: <1387273243-7509-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1387273243-7509-1-git-send-email-alexandre.belloni@free-electrons.com>
Message-ID: <CAAXf6LU7jRk0--NgCUtrFys-NdB0sZFu5QsO8PwRwGA=bV-JpA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexandre,

On Tue, Dec 17, 2013 at 10:40 AM, Alexandre Belloni
<alexandre.belloni@free-electrons.com> wrote:
> It often happen that company networks have the git port blocked. Use
> https to clone the gitorious repositories to work around that.
>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> ---
>  boot/xloader/xloader.mk                | 2 +-
>  package/can-utils/can-utils.mk         | 2 +-
>  package/lpc3250loader/lpc3250loader.mk | 2 +-
>  package/ti-uim/ti-uim.mk               | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/boot/xloader/xloader.mk b/boot/xloader/xloader.mk
> index 00c63b1efb91..c52b213308f4 100644
> --- a/boot/xloader/xloader.mk
> +++ b/boot/xloader/xloader.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>
>  XLOADER_VERSION    = 6f3a26101303051e0f91b6213735b68ce804e94e
> -XLOADER_SITE       = git://gitorious.org/x-loader/x-loader.git
> +XLOADER_SITE       = https://gitorious.org/x-loader/x-loader.git
>  XLOADER_BOARD_NAME = $(call qstrip,$(BR2_TARGET_XLOADER_BOARDNAME))
>
>  XLOADER_LICENSE = GPLv2+
> diff --git a/package/can-utils/can-utils.mk b/package/can-utils/can-utils.mk
> index 743fe7ce0b2b..ddf75d0db6e5 100644
> --- a/package/can-utils/can-utils.mk
> +++ b/package/can-utils/can-utils.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>
>  CAN_UTILS_VERSION = 16c970d40e6c19dde705bad4751bab1a3a4f3a0d
> -CAN_UTILS_SITE = git://gitorious.org/linux-can/can-utils.git
> +CAN_UTILS_SITE = https://gitorious.org/linux-can/can-utils.git
>  CAN_UTILS_AUTORECONF = YES
>
>  $(eval $(autotools-package))
> diff --git a/package/lpc3250loader/lpc3250loader.mk b/package/lpc3250loader/lpc3250loader.mk
> index 42beb7bc84b4..bcb7c7070e32 100644
> --- a/package/lpc3250loader/lpc3250loader.mk
> +++ b/package/lpc3250loader/lpc3250loader.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -HOST_LPC3250LOADER_SITE = git://gitorious.org/lpc3250loader/lpc3250loader.git
> +HOST_LPC3250LOADER_SITE = https://gitorious.org/lpc3250loader/lpc3250loader.git
>  HOST_LPC3250LOADER_VERSION = 1.0
>
>  define HOST_LPC3250LOADER_INSTALL_CMDS
> diff --git a/package/ti-uim/ti-uim.mk b/package/ti-uim/ti-uim.mk
> index b49818004989..fd92497609b5 100644
> --- a/package/ti-uim/ti-uim.mk
> +++ b/package/ti-uim/ti-uim.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>
>  TI_UIM_VERSION = c73894456df5def97111cb33d2106b684b8b7959
> -TI_UIM_SITE = git://gitorious.org/uim/uim.git
> +TI_UIM_SITE = https://gitorious.org/uim/uim.git
>  TI_UIM_LICENSE = GPLv2+
>
>  define TI_UIM_BUILD_CMDS

This does not work as you expect it to.
A URL starting with git:// is automatically detected to use the
FOO_SITE_METHOD=git, but by changing it to https:// that does no
longer work. The .git at the end is not detected.

It seems to work because gitorious thinks that you want to download
something as a tarball (not a git clone) and provides you with the
right file anyway.

I think we should follow the same approach is for github here: create
a gitorious helper, that does actual https download instead of git
clones, using following URL:

https://gitorious.org/<projectname>/<repositoryname>/archive-tarball/<version>

See: http://data.agaric.com/downloading-zipped-tarballs-code-from-gitorious

Best regards,
Thomas
