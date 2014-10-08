From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Oct 2014 23:10:40 +0200
Subject: [Buildroot] [PATCH 1/1] openocd bump to 0.8.0
In-Reply-To: <1412801633-3394-1-git-send-email-claudio.laurita@integrazionetotale.it>
References: <1412801633-3394-1-git-send-email-claudio.laurita@integrazionetotale.it>
Message-ID: <20141008231040.57406af4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Claudio Laurita,

Thanks for this contribution! See some comments below.

On Wed,  8 Oct 2014 22:53:53 +0200, Claudio Laurita wrote:
> Signed-off-by: Claudio Laurita <claudio.laurita@integrazionetotale.it>
> ---
>  .../openocd/001-fix-gcc-warning-in-mini51.patch    |  13 ++
>  package/openocd/Config.in                          | 191 +++++++++++++++++++--
>  ...s-compilation-host-libsub-was-used-before.patch |  33 ----
>  ...002-fix-xscale-uninitialise-breakpoint_pc.patch |  20 ---
>  package/openocd/openocd-0003-force-gnu99.patch     |  19 --
>  .../openocd/openocd-0004-force_jimtcl_static.patch |  25 ---
>  .../openocd/openocd-0005-dont-force-ldflags.patch  |  37 ----
>  package/openocd/openocd-0006-automake-compat.patch |  40 -----
>  package/openocd/openocd.mk                         | 150 ++++++++++++++--
>  9 files changed, 330 insertions(+), 198 deletions(-)
>  create mode 100644 package/openocd/001-fix-gcc-warning-in-mini51.patch
>  delete mode 100644 package/openocd/openocd-0001-fix-cross-compilation-host-libsub-was-used-before.patch
>  delete mode 100644 package/openocd/openocd-0002-fix-xscale-uninitialise-breakpoint_pc.patch
>  delete mode 100644 package/openocd/openocd-0003-force-gnu99.patch
>  delete mode 100644 package/openocd/openocd-0004-force_jimtcl_static.patch
>  delete mode 100644 package/openocd/openocd-0005-dont-force-ldflags.patch
>  delete mode 100644 package/openocd/openocd-0006-automake-compat.patch

The patch is doing a lot more than just bumping the version, so it
would be good to have some details about the changes that are made.

> 
> diff --git a/package/openocd/001-fix-gcc-warning-in-mini51.patch b/package/openocd/001-fix-gcc-warning-in-mini51.patch
> new file mode 100644!
> index 0000000..514d166
> --- /dev/null
> +++ b/package/openocd/001-fix-gcc-warning-in-mini51.patch

Patches should have a description + Signed-off-by. See
http://buildroot.org/downloads/manual/manual.html#_format_and_licensing_of_the_package_patches.

> -HOST_OPENOCD_DEPENDENCIES = host-libusb-compat host-libftdi
> +HOST_OPENOCD_CONF_OPTS = $(OPENOCD_CONF_OPTS)

Target options should normally not affect the build of host tools:
remember that someone can enable the host OpenOCD without building the
target OpenOCD.

> +# force disabling shared libraries to let jimtcl build its static version
> +SHARED_STATIC_LIBS_OPTS=

This is clearly not a solution: the namespace of variables in Buildroot
is global, so you are not allowed to modify such a global variable. You
can always force --enable-static --disable-shared in OPENOCD_CONF_OPTS
if needed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
