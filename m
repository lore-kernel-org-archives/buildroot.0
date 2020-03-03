From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 3 Mar 2020 22:15:52 +0100
Subject: [Buildroot] [PATCH] package/linux-firmware: fix symlink support
In-Reply-To: <20200303184755.GG3179@kwain>
References: <20200303133356.859800-1-antoine.tenart@bootlin.com>
 <20200303164302.GB12449@scaer> <20200303184755.GG3179@kwain>
Message-ID: <20200303211552.GC12449@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Antoine, All,

On 2020-03-03 19:47 +0100, Antoine Tenart spake thusly:
> On Tue, Mar 03, 2020 at 05:43:02PM +0100, Yann E. MORIN wrote:
> > On 2020-03-03 14:33 +0100, Antoine Tenart spake thusly:
> > 
> > The problem is that we have bunch of LINUX_FIRMWARE_FILES that are
> > globs, for example:
> > 
> >     37 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QCOM_ADRENO),y)
> >     38 LINUX_FIRMWARE_FILES += qcom/a*
> >     39 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.qcom qcom/NOTICE.txt
> >     40 endif
> > 
> > So, because we have a glob here, the following symlinks will not be
> > created:
> > 
> >     Link: a300_pfp.fw -> qcom/a300_pfp.fw
> >     Link: a300_pm4.fw -> qcom/a300_pm4.fw
> 
> I don't get why they wouldn't be created. The symlink creation is done
> after the files have been installed to the target directory, and is done
> based on what has been installed. So the definition used to get those
> firmware installed (being full names or not) shouldn't matter.
> 
> With this patch, and BR2_PACKAGE_LINUX_FIRMWARE_QCOM_ADRENO enabled, I
> get the following files in $(TARGET_DIR)/lib/firmware:
> 
> ./output/target/lib/firmware/
> ??? a300_pfp.fw -> qcom/a300_pfp.fw
> ??? a300_pm4.fw -> qcom/a300_pm4.fw
> ??? qcom
>     ??? a300_pfp.fw
>     ??? a300_pm4.fw
>     ??? a530_pfp.fw
>     ??? a530_pm4.fw
>     ??? a530v3_gpmu.fw2
>     ??? a530_zap.b00
>     ??? a530_zap.b01
>     ??? a530_zap.b02
>     ??? a530_zap.mdt
>     ??? a630_gmu.bin
>     ??? a630_sqe.fw

Indeed, and so do I. I just got confused between the 'Link:' tags and
the usual order of arguments to ln: they are reversed, and I looke at
file and links in the wrong location...

> > > +# Some firmware are distributed as a symlink, for drivers to load them using a
> > > +# defined name other than the real one. Since 9cfefbd7fbda ("Remove duplicate
> > > +# symlinks") those symlink aren't distributed in linux-firmware but are created
> > > +# automatically by its copy-firmware.sh script during the installation, which
> > > +# parses the WHENCE file where symlinks are described. We follow the same logic
> > > +# here, adding symlink only for firmwares installed in the target directory.
> > > +# The grep/sed parsing is taken from the script mentioned before.
> > > +define LINUX_FIRMWARE_CREATE_SYMLINKS
> > > +	grep -E '^Link:' $(@D)/WHENCE | sed -e's/^Link: *//g' -e's/-> //g' | while read f d; do \
> > 
> > You can combine the grep and sed into a single sed call:
> > 
> >     sed -r -e '/^Link: (.+) -> (.+)$$/!d; s//\1 \2/' $(@D)/WHENCE
> 
> The reasoning here was to reuse with as little change as possible the
> code used in Linux-firmware's copy-firmware.sh script, to be easily
> maintainable should they decide to update the link definition format.

I see, and that's a good reason. Yet, I've looked at the copy-firmware
script, and I am not impressed... I find the above to be more readable.

If the upstream script was callable with a list of firmware files to
install, then that would wonderfull, as we could re-use it instead of
reimplementing the logic ourselves (hint, hint ;-) ).

> I'm not pushing for either solution, I can change this for v2 if you
> believe the two command should still be combined.

no need for a v2: the major road-block (the globs above) is not. I can
fix the sed and hook stuff locally (I already did it).

Thanks! :-)

Regards,
Yann E. MORIN.

> > > +		if test -f $(TARGET_DIR)/lib/firmware/$$d; then \
> > > +			ln -sf $$d $(TARGET_DIR)/lib/firmware/$$f ; \
> > > +		fi ; \
> > > +	done
> > > +endef
> > > +
> > > +LINUX_FIRMWARE_POST_INSTALL_TARGET_HOOKS += LINUX_FIRMWARE_CREATE_SYMLINKS
> > 
> > Use of a hook is not really useful here: we are using the generic infra,
> > so we can write whatever we want in the _INSTALL_TARGET_CMDS anyway, so
> > just define the macro before _INSTALL_TARGET_CMDS and call it from
> > there, like the other parts (notice the rename of the macro to match):
> > 
> >     621  define LINUX_FIRMWARE_INSTALL_TARGET_CMDS
> >     622          mkdir -p $(TARGET_DIR)/lib/firmware
> >     623          $(LINUX_FIRMWARE_INSTALL_FILES)
> >     624          $(LINUX_FIRMWARE_INSTALL_DIRS)
> >     625          $(LINUX_FIRMWARE_INSTALL_SYMLINKS)
> >     626  endef
> 
> OK, will do!
> 
> Thanks!
> Antoine
> 
> -- 
> Antoine T?nart, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
