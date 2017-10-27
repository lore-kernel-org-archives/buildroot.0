From: Wolfgang Grandegger <wg@grandegger.com>
Date: Fri, 27 Oct 2017 21:13:32 +0200
Subject: [Buildroot] [PATCH v1] qt5base: fix keyboard input in case of
 libinput usage
In-Reply-To: <20171027160919.3054-1-ps.report@gmx.net>
References: <20171027160919.3054-1-ps.report@gmx.net>
Message-ID: <f86081f3-eae6-3e04-3ae0-d1d2f390932c@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Am 27.10.2017 um 18:09 schrieb Peter Seiderer:
> The libinput keyboard support needs libxbcommon to gain
> a functional keyboard input. Avoids the following runtime
> warning:
> 
>    qt.qpa.input: X-less xkbcommon not available, not performing key mapping
> 

I already tried to enable xkbcommon manually to fix that issue... but 
then I get:

# cd /usr/lib/qt/examples/touch/fingerpaint/
# ./fingerpaint
xkbcommon: ERROR: failed to add default include path /usr/share/X11/xkb
Failed to create xkb context

I guess that the files in that directory are normally provided by X11.

My workaroud is to disable libinput using QT_QPA_EGLFS_NO_LIBINPUT for 
keypad input.

Wolfgang.


> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>   package/qt5/qt5base/Config.in  | 1 +
>   package/qt5/qt5base/qt5base.mk | 4 ++--
>   2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
> index dc56474bbb..14c3bf4a84 100644
> --- a/package/qt5/qt5base/Config.in
> +++ b/package/qt5/qt5base/Config.in
> @@ -119,6 +119,7 @@ config BR2_PACKAGE_QT5BASE_XML
>   config BR2_PACKAGE_QT5BASE_GUI
>   	bool "gui module"
>   	select BR2_PACKAGE_FREETYPE
> +	select BR2_PACKAGE_LIBXKBCOMMON if BR2_PACKAGE_LIBINPUT
>   	# At least one graphic backend must be enabled, so enable
>   	# linuxfb if nothing is enabled.
>   	select BR2_PACKAGE_QT5BASE_LINUXFB if \
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index 1683eda838..ea6653de15 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -200,8 +200,8 @@ endif
>   endif
>   
>   ifeq ($(BR2_PACKAGE_LIBINPUT),y)
> -QT5BASE_CONFIGURE_OPTS += -libinput
> -QT5BASE_DEPENDENCIES += libinput
> +QT5BASE_CONFIGURE_OPTS += -libinput -xkbcommon-evdev
> +QT5BASE_DEPENDENCIES += libinput libxkbcommon
>   else
>   QT5BASE_CONFIGURE_OPTS += -no-libinput
>   endif
> 
