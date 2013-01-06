From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 6 Jan 2013 23:13:48 +0100
Subject: [Buildroot] [PATCH 2/3] rpi-userland: new package
In-Reply-To: <87ehhyc6al.fsf@dell.be.48ers.dk>
References: <cover.1357505417.git.maxime.hadjinlian@gmail.com>
 <175bbe60c696b921f074714aac68427ae0561b22.1357505417.git.maxime.hadjinlian@gmail.com>
 <87ehhyc6al.fsf@dell.be.48ers.dk>
Message-ID: <CAGduivxwksjePX5pyFrSDggHC+u2pNydA6nDqZJ1x5MNsFEdzA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jan 6, 2013 at 11:09 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:
>
>  Maxime> Introducing a package to build the userland part of the Raspberry,
>  Maxime> needed by anyone who would want to build a rootfs for a RaspberryPi.
>
> Presumably it isn't REALLY needed, right? Only if you want to use the
> GPU?
I actually don't know if you could do without it since the rpi only
video output is the HDMI.
I'll have to check about that.
>
>  Maxime> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
>  Maxime> ---
>  Maxime>  package/Config.in                                  |    1 +
>  Maxime>  package/rpi-userland/Config.in                     |   18 +++++
>  Maxime>  ...0002-Test-for-the-existence-of-execinfo-h.patch |   69 ++++++++++++++++++++
>  Maxime>  ...make-vmcs.cmake-allow-to-override-VMCS_IN.patch |   26 ++++++++
>  Maxime>  package/rpi-userland/rpi-userland.mk               |   20 ++++++
>  Maxime>  5 files changed, 134 insertions(+)
>  Maxime>  create mode 100644 package/rpi-userland/Config.in
>  Maxime>  create mode 100644 package/rpi-userland/rpi-userland-0002-Test-for-the-existence-of-execinfo-h.patch
>  Maxime>  create mode 100644 package/rpi-userland/rpi-userland-makefiles-0001-cmake-vmcs.cmake-allow-to-override-VMCS_IN.patch
>  Maxime>  create mode 100644 package/rpi-userland/rpi-userland.mk
>
>  Maxime> diff --git a/package/Config.in b/package/Config.in
>  Maxime> index 9b50f4b..17205fe 100644
>  Maxime> --- a/package/Config.in
>  Maxime> +++ b/package/Config.in
>  Maxime> @@ -580,6 +580,7 @@ source "package/collectd/Config.in"
>  Maxime>  source "package/empty/Config.in"
>  Maxime>  source "package/googlefontdirectory/Config.in"
>  Maxime>  source "package/mobile-broadband-provider-info/Config.in"
>  Maxime> +source "package/rpi-userland/Config.in"
>
> I think 'hardware handling' makes more sense, so I've moved it there
> instead.
>
>  Maxime>  source "package/shared-mime-info/Config.in"
>  Maxime>  source "package/snowball-init/Config.in"
>  Maxime>  source "package/sound-theme-borealis/Config.in"
>  Maxime> diff --git a/package/rpi-userland/Config.in b/package/rpi-userland/Config.in
>  Maxime> new file mode 100644
>  Maxime> index 0000000..646d74e
>  Maxime> --- /dev/null
>  Maxime> +++ b/package/rpi-userland/Config.in
>  Maxime> @@ -0,0 +1,18 @@
>  Maxime> +config BR2_PACKAGE_RPI_USERLAND
>  Maxime> +      bool "RaspberryPi userland"
>
> We normally keep the name short and lower case, so I've renamed to
> 'rpi-userland'.
>
>  Maxime> +      depends on BR2_INSTALL_LIBSTDCPP
>  Maxime> +      depends on BR2_LARGEFILE
>  Maxime> +      help
>  Maxime> +        Raspberry Pi Userland contains the necessary library to use the
>  Maxime> +        VideoCore driver.
>  Maxime> +
>  Maxime> +        Includes source for the ARM side code to interface to:
>
> Trailing spaces.
>
>  Maxime> +        EGL, mmal, GLESv2, vcos, openmaxil, vchiq_arm, bcm_host, WFC, OpenVG.
>  Maxime> +
>  Maxime> +        https://github.com/raspberrypi/userland/
>  Maxime> +
>  Maxime> +comment "RaspberryPi userland requires a toolchain with C++ support enabled"
>  Maxime> +      depends on !BR2_INSTALL_LIBSTDCPP
>  Maxime> +
>  Maxime> +comment "RaspberryPi userland requires a toolchain with LARGEFILE support"
>  Maxime> +      depends on !BR2_LARGEFILE
>
> I've merged these two comments.
>
> Committed with those changes, thanks.
>
> --
> Bye, Peter Korsgaard
