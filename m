From: Brandon Maier <brandon.maier@rockwellcollins.com>
Date: Fri, 26 Jun 2020 10:37:49 -0500
Subject: [Buildroot] [PATCH 1/1] uboot: zynqmp: Support loading a PMU
 config
In-Reply-To: <6bcc3630-562d-f9b0-f8c4-34cc4b29e31b@lucaceresoli.net>
References: <20200625192925.182477-1-brandon.maier@rockwellcollins.com>
 <6bcc3630-562d-f9b0-f8c4-34cc4b29e31b@lucaceresoli.net>
Message-ID: <CA+fik53QJscy8oJJ4UkKiOvYz+Jua7YUD73BLjuiO_SikJQPYg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jun 25, 2020 at 3:57 PM Luca Ceresoli <luca@lucaceresoli.net> wrote:
> > +     $(if $(UBOOT_ZYNQMP_PM_CFG_PATH),
> > +             $(UBOOT_DIR)/tools/zynqmp_pm_cfg_obj_convert.py \
> > +                     "$(UBOOT_ZYNQMP_PM_CFG_PATH)" \
> > +                     "$(UBOOT_ZYNQMP_PM_CFG_BIN)"
> > +     )
>
> Even though this works, I find it a bit weird that you read the
> UBOOT_ZYNQMP_PM_CFG_PATH variable here but you assign it below. I think
> you could move the invocation of zynqmp_pm_cfg_obj_convert.py to a
> pre-build hook (or a post-configure hook? hum), which in turn would
> allow you to move the code inside the 'ifeq
> ($(BR2_TARGET_UBOOT_ZYNQMP),y)' stanza, keeping all the zynqmp-specific
> code together.

I did it this way because the "dts" command was here too, but I can
move it to a pre-build hook.

>
> >       $(TARGET_CONFIGURE_OPTS) \
> >               $(BR2_MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) \
> >               $(UBOOT_MAKE_TARGET)
> > @@ -360,6 +365,17 @@ define UBOOT_ZYNQMP_KCONFIG_PMUFW
> >       $(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,"$(UBOOT_ZYNQMP_PMUFW_PATH)")
> >  endef
> >
> > +UBOOT_ZYNQMP_PM_CFG = $(call qstrip,$(BR2_TARGET_UBOOT_ZYNQMP_PM_CFG))
> > +UBOOT_ZYNQMP_PM_CFG_PATH = $(shell readlink -f $(UBOOT_ZYNQMP_PM_CFG))
>
> I find the _PATH suffix kind of vague: all these variables contain
> paths. I'd rather call it UBOOT_ZYNQMP_PM_CFG_C or
> UBOOT_ZYNQMP_PM_CFG_SRC. But it's a matter of taste, not a big issue.
>

I agree it's vague, I was trying to remain consistent with
UBOOT_ZYNQMP_PSU_INIT which does it this way.

> > +
> > +ifneq ($(UBOOT_ZYNQMP_PM_CFG_PATH),)
> > +UBOOT_ZYNQMP_PM_CFG_BIN = $(UBOOT_DIR)/pm_cfg_obj.bin
> > +define UBOOT_ZYNQMP_KCONFIG_PM_CFG
> > +     $(call KCONFIG_SET_OPT,CONFIG_ZYNQMP_SPL_PM_CFG_OBJ_FILE,"$(UBOOT_ZYNQMP_PM_CFG_BIN)", \
> > +             $(@D)/.config)
> > +endef
> > +endif
> > +
> >  UBOOT_ZYNQMP_PSU_INIT = $(call qstrip,$(BR2_TARGET_UBOOT_ZYNQMP_PSU_INIT_FILE))
> >  UBOOT_ZYNQMP_PSU_INIT_PATH = $(shell readlink -f $(UBOOT_ZYNQMP_PSU_INIT))
> >
> > @@ -422,6 +438,7 @@ endif
> >
> >  define UBOOT_KCONFIG_FIXUP_CMDS
> >       $(UBOOT_ZYNQMP_KCONFIG_PMUFW)
> > +     $(UBOOT_ZYNQMP_KCONFIG_PM_CFG)
> >       $(UBOOT_ZYNQMP_KCONFIG_PSU_INIT)
> >  endef
> >
> >
> --
> Luca
