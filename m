From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 12 Feb 2021 22:07:25 +0100
Subject: [Buildroot] [PATCH-NEXT 2/4] package/linux-firmware.mk: get rid
 of temporary tarball for file installation
In-Reply-To: <20210212203939.GK1679218@scaer>
References: <20210212184049.13202-1-peter@korsgaard.com>
 <20210212184049.13202-3-peter@korsgaard.com>
 <20210212203939.GK1679218@scaer>
Message-ID: <20210212210725.GL1679218@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2021-02-12 21:39 +0100, Yann E. MORIN spake thusly:
> On 2021-02-12 19:40 +0100, Peter Korsgaard spake thusly:
> > There is no specific reason to use a temporary file, we can just as well
> > pipe the two tar invocations together, so do that instead.
> Actually, there *is* a reason why an intermediate tarball is used, see
> commit 21a283ffb0d (linux-firmware: fail build for missing file).

Of course, I missed providing a suggestion, so here it is, see below...

[--SNIP--]
> > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> > ---
> >  package/linux-firmware/linux-firmware.mk | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
> > index 3420266335..b6549ad371 100644
> > --- a/package/linux-firmware/linux-firmware.mk
> > +++ b/package/linux-firmware/linux-firmware.mk
> > @@ -641,8 +641,8 @@ endif
> >  ifneq ($(LINUX_FIRMWARE_FILES),)
> >  define LINUX_FIRMWARE_INSTALL_FILES
> >  	cd $(@D) && \
> > -		$(TAR) cf install.tar $(sort $(LINUX_FIRMWARE_FILES)) && \
> > -		$(TAR) xf install.tar -C $(1)
> > +		$(TAR) c $(sort $(LINUX_FIRMWARE_FILES)) | \
> > +		$(TAR) x -C $(1)

First, I think we should merge INSTALL_FILES and INSTALL_DIRS together
in a single command; there is no reason why we could not put directories
in a tarball...

Seconf, we should =create the archive once in _BUILD_CMDS. Then we can
extract it in _INSTALL_TARGET_CMDS and _INSTALL_IMAGES_CMDS.

    define LINUX_FIRMWARE_BUILD_CMDS
        cd $(@D) && \
        $(TAR) cf br-firmware.tar $(sort $(LINUX_FIRMWARE_FILES) $(LINUX_FIRMWARE_DIRS))
    endef

    define LINUX_FIRMWARE_INSTALL
        mkdir -p $(1)
        $(TAR) xf $(@D)/br-firmware.tar -C $(1)
        sed -r -e '/^Link: (.+) -> (.+)$$/!d; s//\1 \2/' $(@D)/WHENCE |
            blabla actual code to create symlinks
    endef

    define LINUX_FIRMWARE_INSTALL_TARGET_CMDS
        $(call LINUX_FIRMWARE_INSTALL, $(TARGET_DIR)/lib/firmware)
    endef

    define LINUX_FIRMWARE_INSTALL_IMAGES_CMDS
        $(call LINUX_FIRMWARE_INSTALL, $(IMAGES_DIR)/linux-firmware)
    endef

Totally untested, written directly in the mail...

Regards,
Yann E. MORIN.

> >  endef
> >  endif
> >  
> > -- 
> > 2.20.1
> > 
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
