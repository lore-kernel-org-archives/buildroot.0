From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 May 2019 21:24:10 +0200
Subject: [Buildroot] [PATCH v3] package/dosfstools: introduce custom
 install routine
In-Reply-To: <CAGt4E5ugVZfpy_pcrQ0ZSPm1y5xupb1NCmU+uzm7LzWsej92sQ@mail.gmail.com>
References: <20190530234226.28013-1-mmayer@broadcom.com>
 <20190531163457.7b5a978c@windsurf>
 <CAGt4E5ugVZfpy_pcrQ0ZSPm1y5xupb1NCmU+uzm7LzWsej92sQ@mail.gmail.com>
Message-ID: <20190531212410.28aca8d7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Markus,

On Fri, 31 May 2019 08:32:54 -0700
Markus Mayer <mmayer@broadcom.com> wrote:

> Right. Won't I have to define the install macros as empty if they are
> supposed to be noops?
> 
> Like this:
> 
> ifeq ($(BR2_PACKAGE_DOSFSTOOLS_FATLABEL),y)
> define DOSFSTOOLS_REMOVE_FATLABEL
> ... install code here ...
> endef
> else
> # empty declaration
> define DOSFSTOOLS_REMOVE_FATLABEL
> endef
> endif

No: undefined variables in make are automatically empty, so there's no
need for this else condition. We use this principle all over Buildroot.


> > define DOSFSTOOLS_INSTALL_TARGET_CMDS
> >         $(foreach f,$(DOSFSTOOLS_INSTALL_FILES_y), \
> >                 $(INSTALL) -D -m 0744 $(@D)/src/$(f) $(TARGET_DIR)/sbin/$(f)  
> 
> 0755 I imagine? :-)

Yes, indeed, sorry.

> >         $(foreach l,$(DOSFSTOOLS_INSTALL_SYMLINKS_y), \
> >                 ln -s $(word 2,$(subst :, ,$(l))) $(TARGET_DIR)/sbin/$(word 1,$(subst :, ,$(l)))
> >         )
> > endef
> >
> > But admittedly, it becomes a bit hackish, and we don't do that anywhere
> > in Buildroot today. So probably sticking to three
> > DOSFSTOOLS_INSTALL_<foo> defines is better for now.  
> 
> This is an interesting approach. But I'll likely stick with the other one.

Yes, as I said, I think it makes more sense to stick to the simpler
approach for now.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
