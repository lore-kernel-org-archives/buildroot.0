From: Cyril Bur <cyrilbur@gmail.com>
Date: Fri, 13 Nov 2015 12:08:00 +1100
Subject: [Buildroot] [PATCH 2/2] package/systemd: Respect
 BR2_TARGET_GENERIC_GETTY_BAUDRATE
In-Reply-To: <CAGduivzujEuVZeNZ2mzwLE89-bsw3Eq6=TO3dz1ahEDBouABOw@mail.gmail.com>
References: <1446099102-5205-1-git-send-email-cyrilbur@gmail.com>
 <1446099102-5205-2-git-send-email-cyrilbur@gmail.com>
 <20151029171702.0fa0b81c@camb691>
 <CAFGQKxfgm1KvBR95ksPgha3XKaix_NPorSWfCcDmYYYOmhYdSw@mail.gmail.com>
 <CAGduivzujEuVZeNZ2mzwLE89-bsw3Eq6=TO3dz1ahEDBouABOw@mail.gmail.com>
Message-ID: <20151113120800.24ae9c86@camb691>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 4 Nov 2015 10:22:51 +0100
Maxime Hadjinlian <maxime.hadjinlian@gmail.com> wrote:

> Hi Cyril, Martin, all
> 
> On Thu, Oct 29, 2015 at 11:41 AM, Martin Bark <martin@barkynet.com> wrote:
> 
> > Cyril, All,
> >
> > Some comment inline below
> >
> > On 29 October 2015 at 06:17, Cyril Bur <cyrilbur@gmail.com> wrote:  
> > > On Thu, 29 Oct 2015 17:11:42 +1100
> > > Cyril Bur <cyrilbur@gmail.com> wrote:
> > >  
> > >> Currently systemd getty services ignore baudrates set in buildroot in
> > >> favour of a hardcoded 115200. This patch SEDs out that hardcoded value  
> > with  
> > >> what is selected.  
> > >
> > > Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> > >  
> > >> ---
> > >>  package/systemd/systemd.mk | 9 +++++++--
> > >>  1 file changed, 7 insertions(+), 2 deletions(-)
> > >>
> > >> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> > >> index b62fc08..d8a25ed 100644
> > >> --- a/package/systemd/systemd.mk
> > >> +++ b/package/systemd/systemd.mk
> > >> @@ -183,6 +183,7 @@ endef
> > >>
> > >>  ifneq ($(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)),)
> > >>  # systemd needs getty.service for VTs and serial-getty.service for  
> > serial ttys  
> > >> +# also patch the file to use the correct baud-rate, the default  
> > baudrate is 115200 so look for that  
> > >>  define SYSTEMD_INSTALL_SERVICE_TTY
> > >>       if echo $(BR2_TARGET_GENERIC_GETTY_PORT) | egrep -q  
> > 'tty[0-9]*$$'; \  
> > >>       then \
> > >> @@ -190,8 +191,12 @@ define SYSTEMD_INSTALL_SERVICE_TTY
> > >>       else \
> > >>               SERVICE="serial-getty"; \
> > >>       fi; \
> > >> -     ln -fs ../../../../lib/systemd/system/$${SERVICE}@.service \
> > >> -  
> >  $(TARGET_DIR)/etc/systemd/system/getty.target.wants/$${SERVICE}@
> > $(BR2_TARGET_GENERIC_GETTY_PORT).service  
> > >> +     ln -fs $(TARGET_DIR)/lib/systemd/system/$${SERVICE}@.service \
> > >> +  
> >  $(TARGET_DIR)/etc/systemd/system/getty.target.wants/$${SERVICE}@$(BR2_TARGET_GENERIC_GETTY_PORT).service;
> > \
> >
> > Changing the symlink above is not necessary for this patch.  Also i
> > think the the change is wrong and will cause the service to symlink an
> > invalid file when run on the target.
> >  
> Indeed, it's wrong, but not because it'll be wrong on the target itself,
> but in the target directory. The relative path allow you to use the symlink
> even in your target directory (otherwise you my stumble upon the files on
> your hosts and that would start misunderstanding and errors.).
> 

Ah yes, I'm not sure why I did this anymore, I do agree, I'll resend without
this hunk.

> >  
> > >> +     if [ $(BR2_TARGET_GENERIC_GETTY_BAUDRATE) -gt 0 ] ; \
> > >> +     then \
> > >> +             $(SED) 's,115200,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE),'  
> > $(TARGET_DIR)/lib/systemd/system/$${SERVICE}@.service; \  
> > >> +     fi  
> >
> > $(BR2_TARGET_GENERIC_GETTY_BAUDRATE) will have double quotes around it
> > which will need to be removed so i don't think the -gt test will ever
> > work.  Have a look in package/skeleton/skeleton.mk where it uses
> > $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE)) to strip the
> > double quotes before it uses the value, you'll need to do something
> > similar.
> >

I believe it will work, Nicolas Cavallari provided a good explanation as to
why:

This test will work just fine, it will be expanded to e.g.

if [ "38400" -gt 0 ];

Which is a perfectly valid shell condition.  However, the sed will
introduce the double quotes in the systemd unit file.  Which,
according to the systemd documentation, is also fine in an ExecStart
statement, which somewhat mimic the behavior of the shell.

 
> > Thanks
> >
> > Martin
> >  
> > >>  endef
> > >>  endif
> > >>  
> > >
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot at busybox.net
> > > http://lists.busybox.net/mailman/listinfo/buildroot  
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> >  
