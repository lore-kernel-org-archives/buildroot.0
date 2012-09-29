From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Sat, 29 Sep 2012 11:31:13 +0200
Subject: [Buildroot] [PATCH] intel-microcode: new package
In-Reply-To: <1348834817-3360-1-git-send-email-rbraun@sceen.net>
References: <20120928121758.GA2362@mail.sceen.net>
 <1348834817-3360-1-git-send-email-rbraun@sceen.net>
Message-ID: <CAAXf6LXO1GN0QXmYqyUZLP88YQ-TKG_yX5+ZrtMz7LodNQYyHA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, Sep 28, 2012 at 2:20 PM, Richard Braun <rbraun@sceen.net> wrote:
>
> Signed-off-by: Richard Braun <rbraun@sceen.net>
> ---
>  package/Config.in                          |    1 +
>  package/intel-microcode/Config.in          |    7 +++++++
>  package/intel-microcode/intel-microcode.mk |   24 ++++++++++++++++++++++++
>  3 files changed, 32 insertions(+), 0 deletions(-)
>  create mode 100644 package/intel-microcode/Config.in
>  create mode 100644 package/intel-microcode/intel-microcode.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 58dd5e8..e8a3f50 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -212,6 +212,7 @@ source "package/hwdata/Config.in"
>  source "package/i2c-tools/Config.in"
>  source "package/input-event-daemon/Config.in"
>  source "package/input-tools/Config.in"
> +source "package/intel-microcode/Config.in"
>  source "package/iostat/Config.in"
>  source "package/irda-utils/Config.in"
>  source "package/kbd/Config.in"
> diff --git a/package/intel-microcode/Config.in b/package/intel-microcode/Config.in
> new file mode 100644
> index 0000000..495ebd7
> --- /dev/null
> +++ b/package/intel-microcode/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_INTEL_MICROCODE
> +       bool "intel-microcode"
> +       depends on BR2_x86_64 || BR2_i386
> +       help
> +         This package provides an Intel microcode data file that can be
> +         used to correct processor errors. The iucode-tool package and
> +         proper kernel support are required to upload the microcode.
> diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
> new file mode 100644
> index 0000000..16323e2
> --- /dev/null
> +++ b/package/intel-microcode/intel-microcode.mk
> @@ -0,0 +1,24 @@
> +#############################################################
> +#
> +# intel-microcode
> +#
> +#############################################################
> +
> +INTEL_MICROCODE_VERSION = 20120606
> +INTEL_MICROCODE_SOURCE = microcode-$(INTEL_MICROCODE_VERSION).tgz
> +INTEL_MICROCODE_SITE = http://downloadmirror.intel.com/21385/eng
> +INTEL_MICROCODE_LICENSE = PROPRIETARY

See the parallel discussion about this. I think we need to clear this
out before accepting this patch.

> +INTEL_MICROCODE_LICENSE_FILES = license.txt
> +
> +# N.B. Don't strip any path components during extraction.
> +define INTEL_MICROCODE_EXTRACT_CMDS
> +       gzip -d -c $(DL_DIR)/$(INTEL_MICROCODE_SOURCE) | tar --strip-components=0 -C $(@D) -xf -

I think this should be $(TAR) instead of plain tar. On some systems,
$(TAR) may be a host-tar.

> +       head -n 33 $(@D)/microcode.dat > $(@D)/license.txt
> +endef
> +
> +define INTEL_MICROCODE_INSTALL_TARGET_CMDS
> +       $(INSTALL) -D -m 0644 $(@D)/microcode.dat \
> +               $(TARGET_DIR)/usr/share/misc/intel-microcode.dat
> +endef
> +
> +$(eval $(generic-package))
> --
> 1.7.2.5

Best regards,
Thomas
