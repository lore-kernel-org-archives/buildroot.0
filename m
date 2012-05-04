From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 4 May 2012 06:29:34 +0300
Subject: [Buildroot] [PATCH] package read-edid, corrected patch
In-Reply-To: <CADiAo4KA0+q00pCFAXuebB9WtFkJ8WcfkerB0Sv57rtPTnu2RQ@mail.gmail.com>
References: <CADiAo4KA0+q00pCFAXuebB9WtFkJ8WcfkerB0Sv57rtPTnu2RQ@mail.gmail.com>
Message-ID: <20120504032933.GC2763@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Dimitry,

On Thu, May 03, 2012 at 10:14:53PM -0400, Dimitry Golubovsky wrote:
> Hi,
> Here is the updated patch per comments by Thomas and Baruch.
> 
> Thanks.

The text here should contain the patch changelog information. This goes 
directly to the git log. Other free text goes below...

> Signed-off-by: Dmitry Golubovsky <golubovsky@gmail.com>
> ---

here.

> diff --git a/package/Config.in b/package/Config.in
> index caa618b..e39fccf 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -210,6 +210,7 @@ source "package/openocd/Config.in"
>  source "package/parted/Config.in"
>  source "package/pciutils/Config.in"
>  source "package/picocom/Config.in"
> +source "package/read-edid/Config.in"
>  source "package/rng-tools/Config.in"
>  source "package/sane-backends/Config.in"
>  source "package/sdparm/Config.in"
> diff --git a/package/read-edid/Config.in b/package/read-edid/Config.in
> new file mode 100644
> index 0000000..c66a5e0
> --- /dev/null
> +++ b/package/read-edid/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_READ_EDID
> +	bool "read-edid"
> +	help
> +	  Read-edid is a pair of tools (originally by John Fremlin) for
> reading the EDID
> +	  from a monitor.  It should work with most monitors made since 1996
> (except for
> +	  newer ones with 256-byte EDID's - WiP),  assuming the video card
> supports  the
> +	  standard read commands (most do).  Read-edid is a set of two tools
> - get-edid,
> +	  which gets  the raw edid  information from the monitor,  and
> parse-edid, which
> +	  turns the raw binary information into an XF86Config-compatible
> monitor section.

Your patch is line wrapped. I still suggest you to consider 'git send-email'.

> +
> +	  http://polypux.org/projects/read-edid/
> +
> +depends on (BR2_i386)

This line should be placed just below the 'bool "read-edid"' line, and be tab 
indented. The help text should be indented with tab + 2 spaces.

> +
> +
> diff --git a/package/read-edid/read-edid.mk b/package/read-edid/read-edid.mk
> new file mode 100644
> index 0000000..6328def
> --- /dev/null
> +++ b/package/read-edid/read-edid.mk
> @@ -0,0 +1,20 @@
> +############################################
> +#
> +# read-edid
> +#
> +############################################
> +
> +READ_EDID_VERSION = 1.4.2
> +READ_EDID_SITE = http://www.polypux.org/projects/read-edid/
> +
> +define READ_EDID_BUILD_CMDS
> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
> +endef
> +
> +define READ_EDID_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/get-edid $(TARGET_DIR)/sbin/get-edid
> +	$(INSTALL) -D -m 0755 $(@D)/parse-edid $(TARGET_DIR)/sbin/parse-edid
> +endef
> +
> +$(eval $(call AUTOTARGETS))

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
