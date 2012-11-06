From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 06 Nov 2012 01:01:48 +0100
Subject: [Buildroot] [PATCH] add new package fxload
In-Reply-To: <30360444.162.1352137687822.JavaMail.rosen@pcrosen>
References: <30360444.162.1352137687822.JavaMail.rosen@pcrosen>
Message-ID: <5098536C.5060903@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/05/12 18:48, Jeremy Rosen wrote:
> Hello everybody
>
> I recently had to add a small utility called fxload to buildroot
>
> fxload is provided by the linux-hotplug project and is used to upload firmware into usb device
> it is generally used as a helper function by udev.
>
> This is my first patch to buildroot, so feel free to tell me if I didn't follow the proper protocol, I will gladly correct and resubmit

  Here goes...

  First of all, we prefer the patches to be sent in-line rather than as
attachment.  That makes it easier to review by just replying to the mail.
git send-email is the easiest way to contribute.

  Also I'll warn you: it may take a while (months) before your patch is
accepted even if you make all necessary correction, and we may even forget
to include it in the end.  That's not because we're evil :-) but because
our contribution process is still sub-optimal.  Buildroot has grown
significantly in number of contributions over the last two years, and
our maintainer (Peter Korsgaard) is just saturated.  We're still experimenting
with ways to improve the process.

>
> Regards
> J?r?my Rosen
>
>
>
> fight key loggers : write some perl using vim
>
>
>
> 0001-add-new-package-fxload.patch
>
>
>  From a1d3bdcf48851dedeca9597816135f4c1589e37a Mon Sep 17 00:00:00 2001
> From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?=<jeremy.rosen@openwide.fr>
> Date: Fri, 2 Nov 2012 11:43:42 +0100
> Subject: [PATCH] add new package fxload

  Add a Signed-off-by line for yourself.  This is a short way for you to
assert that you are entitled to contribute the patch under buildroot's
GPL license.  See  http://kerneltrap.org/files/Jeremy/DCO.txt for more
details.

  BTW, if you want to add additional comments that aren't supposed to
go in the git log message (e.g. "this is my first patch, please give
feedback", add it below the Signed-off-by line, separated by ---.
Then git-am will remove that part automatically.  If you send an
updated patch, it's nice if you can write in this comment section what
changed compared to the first one.  So typically you'll see:

Signed-off-by: ...
---
v2: Incorporated comments from Arnout, except for the foo because blah.


>
> ---
>   package/Config.in        |    1 +
>   package/fxload/Config.in |    9 +++++++++
>   package/fxload/fxload.mk |   20 ++++++++++++++++++++
>   3 files changed, 30 insertions(+)
>   create mode 100644 package/fxload/Config.in
>   create mode 100644 package/fxload/fxload.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 1df099b..f72a34b 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -211,6 +211,7 @@ source "package/flashrom/Config.in"
>   source "package/fconfig/Config.in"
>   source "package/fis/Config.in"
>   source "package/fmtools/Config.in"
> +source "package/fxload/Config.in"
>   source "package/gadgetfs-test/Config.in"
>   source "package/gdisk/Config.in"
>   source "package/gpsd/Config.in"
> diff --git a/package/fxload/Config.in b/package/fxload/Config.in
> new file mode 100644
> index 0000000..6fc28a7
> --- /dev/null
> +++ b/package/fxload/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_FXLOAD
> +        bool "fxload"
> +        help

  This should be indented with a single tab.

> +	  This program is conveniently able to download firmware into FX, FX2,
> +	  and FX2LP EZ-USB devices, as well as the original AnchorChips EZ-USB.
> +	  It is intended to be invoked by hotplug scripts when the unprogrammed
> +	  device appears on the bus.
> +
> +http://sourceforge.net/projects/linux-hotplug/

  The URL should be indented like the rest of the help text: 1 tab + 2 spaces.

> diff --git a/package/fxload/fxload.mk b/package/fxload/fxload.mk
> new file mode 100644
> index 0000000..a9c0249
> --- /dev/null
> +++ b/package/fxload/fxload.mk
> @@ -0,0 +1,20 @@
> +

  That empty line shouldn't be there.
> +#############################################################
> +#
> +# fxload
> +#
> +#############################################################
> +FXLOAD_VERSION = 2008_10_13
> +FXLOAD_SOURCE = fxload-$(FXLOAD_VERSION).tar.gz

  Since that is the default, we don't write that line.

> +FXLOAD_SITE =http://sourceforge.net/projects/linux-hotplug/files/fxload/$(FXLOAD_VERSION)

  sf.net URLs are normally
http://downloads.sourceforge.net/project/linux-hotplug/fxload/$(FXLOAD_VERSION)

  Maybe yours works as well, but it's nice to have the same pattern everywhere.

> +FXLOAD_LICENSE = GPLV2+

  It's GPLv2+ (small v).

  Also set FXLOAD_LICENSE_FILE = COPYING

> +
> +define FXLOAD_BUILD_CMDS
> +    $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all

  For new packages, we try to consistently use

$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all

but that doesn't always work...  If it doesn't, your pattern
is OK.

> +endef
> +
> +define FXLOAD_INSTALL_TARGET_CMDS
> +    $(MAKE) prefix=$(TARGET_DIR)  -C $(@D) install

  We try to call make in exactly the same way in the install commands,
so that if for whatever reason something is still compiled there, it
will be compiled correctly.


  Overall, it looks very good, though.  Congratulations!

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
