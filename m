From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Mon, 16 Feb 2015 11:41:25 -0500 (EST)
Subject: [Buildroot] [RFC 1/2] Makefile: add target-genimage
In-Reply-To: <CANxTyt4ojT7Y+mG9+Je_gY0dD2Ub3nxfcuoXtD1F-sPcbcmY6g@mail.gmail.com>
References: <1423780427-7493-1-git-send-email-vivien.didelot@savoirfairelinux.com>
 <1423780427-7493-2-git-send-email-vivien.didelot@savoirfairelinux.com>
 <CANxTyt4ojT7Y+mG9+Je_gY0dD2Ub3nxfcuoXtD1F-sPcbcmY6g@mail.gmail.com>
Message-ID: <2004056362.2924318.1424104885214.JavaMail.root@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Danomi,

> A couple nitpicks ...

[...]

> > The rational behind adding this to Buildroot is that genimage
> > requires
> 
> spelling: "rationale".

Thanks.

[...]

> > --- a/Makefile
> > +++ b/Makefile
> > @@ -434,7 +434,7 @@ world: target-post-image
> >
> >  .PHONY: all world toolchain dirs clean distclean source
> >  outputmakefile \
> >         legal-info legal-info-prepare legal-info-clean printvars \
> > -       target-finalize target-post-image \
> > +       target-finalize target-genimage target-post-image \
> >         $(TARGETS) $(TARGETS_ROOTFS) \
> >         $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) $(TARGETS_LEGAL_INFO)
> >         \
> >         $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
> > @@ -621,7 +621,20 @@ endif
> >                 $(call MESSAGE,"Executing post-build script $(s)");
> >                 \
> >                 $(EXTRA_ENV) $(s) $(TARGET_DIR) $(call
> >                 qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
> >
> > -target-post-image: $(TARGETS_ROOTFS) target-finalize
> > +target-genimage: $(TARGETS_ROOTFS) target-finalize
> > +       @$(foreach cfg, $(call qstrip,$(BR2_ROOTFS_GENIMAGE_CFG)),
> > \
> > +       $(call MESSAGE,"Executing genimage with config $(cfg)"); \
> > +         T=$$(mktemp -d $(BUILD_DIR)/.genimage.XXXXXXXXXX); \
> > +         mkdir -p $$T/{root,tmp}; \
> > +         $(EXTRA_ENV) output/host/usr/bin/genimage \
> > +         --rootpath $$T/root \
> > +         --tmppath $$T/tmp \
> > +         --inputpath output/images/ \
> > +         --outputpath output/images/ \
> > +         --config $(cfg); \
> > +         rm -rf $$T$(sep))
> 
> I don't think the final $(sep) is needed, since this the last line of
> a makefile target, as opposed to, say. a template.

Are you sure? I'm not sure either but I tried to follow the other foreach 
statements.

Thanks for the nitpicks. Other than that, an feedback on the overall RFC?

Regards,
Vivien
