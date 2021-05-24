From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 May 2021 14:24:36 +0200
Subject: [Buildroot] [PATCH 3/3] package/pifmrds: use pkg-config
In-Reply-To: <20210524120225.GQ3208066@scaer>
References: <20210523101121.1517749-1-fontaine.fabrice@gmail.com>
 <20210523101121.1517749-3-fontaine.fabrice@gmail.com>
 <20210524120225.GQ3208066@scaer>
Message-ID: <20210524122436.GT3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-24 14:02 +0200, Yann E. MORIN spake thusly:
> Fabrice, All,
> 
> On 2021-05-23 12:11 +0200, Fabrice Fontaine spake thusly:
> > Use pkg-config to retrieve libsndfile dependencies
> 
> This patch should have been the first in the series. Indeed, if only the
> first two patches are applied, then pifmrds build is broken...
> 
> Anyway, this is by itself a build-fix too, so: applied to master, thanks.

I've also Applied to next, so as to be able to apply the libsndfile
update, thanks.

> Regards,
> Yann E. MORIN.
> 
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/pifmrds/0003-Makefile-fix-static-link.patch | 6 ++++--
> >  package/pifmrds/pifmrds.mk                          | 3 ++-
> >  2 files changed, 6 insertions(+), 3 deletions(-)
> > 
> > diff --git a/package/pifmrds/0003-Makefile-fix-static-link.patch b/package/pifmrds/0003-Makefile-fix-static-link.patch
> > index ecd7c4fc4c..3bd91c981f 100644
> > --- a/package/pifmrds/0003-Makefile-fix-static-link.patch
> > +++ b/package/pifmrds/0003-Makefile-fix-static-link.patch
> > @@ -4,6 +4,8 @@ Since libsndfile uses funtions from libm, the -lm should be specified
> >  after libsndfile for static linking.
> >  
> >  Signed-off-by: "Eric Limpens" <Limpens@gmail.com>
> > +[Fabrice: add $(SNDFILE_LIBS) to pass all dependencies from pkg-config]
> > +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> >  
> >  diff -purN pifmrds-0bf57f9ce0d954365a38d8af8e7be6f28521c3f2.orig/src/Makefile pifmrds-0bf57f9ce0d954365a38d8af8e7be6f28521c3f2/src/Makefile
> >  --- pifmrds-0bf57f9ce0d954365a38d8af8e7be6f28521c3f2.orig/src/Makefile	2016-02-26 08:06:43.102962592 +0100
> > @@ -13,11 +15,11 @@ diff -purN pifmrds-0bf57f9ce0d954365a38d8af8e7be6f28521c3f2.orig/src/Makefile pi
> >   
> >   app: rds.o waveforms.o pi_fm_rds.o fm_mpx.o control_pipe.o
> >  -	$(CC) $(LDFLAGS) -o pi_fm_rds rds.o waveforms.o pi_fm_rds.o fm_mpx.o control_pipe.o -lm -lsndfile
> > -+	$(CC) $(LDFLAGS) -o pi_fm_rds rds.o waveforms.o pi_fm_rds.o fm_mpx.o control_pipe.o -lsndfile -lm
> > ++	$(CC) $(LDFLAGS) -o pi_fm_rds rds.o waveforms.o pi_fm_rds.o fm_mpx.o control_pipe.o $(SNDFILE_LIBS)
> >   
> >   rds_wav: rds.o waveforms.o rds_wav.o fm_mpx.o
> >  -	$(CC) $(LDFLAGS) -o rds_wav rds_wav.o rds.o waveforms.o fm_mpx.o -lm -lsndfile
> > -+	$(CC) $(LDFLAGS) -o rds_wav rds_wav.o rds.o waveforms.o fm_mpx.o -lsndfile -lm
> > ++	$(CC) $(LDFLAGS) -o rds_wav rds_wav.o rds.o waveforms.o fm_mpx.o $(SNDFILE_LIBS)
> >   
> >   rds.o: rds.c waveforms.h
> >   	$(CC) $(CFLAGS) rds.c
> > diff --git a/package/pifmrds/pifmrds.mk b/package/pifmrds/pifmrds.mk
> > index 509ec80876..33c13bae33 100644
> > --- a/package/pifmrds/pifmrds.mk
> > +++ b/package/pifmrds/pifmrds.mk
> > @@ -6,13 +6,14 @@
> >  
> >  PIFMRDS_VERSION = 0bf57f9ce0d954365a38d8af8e7be6f28521c3f2
> >  PIFMRDS_SITE = $(call github,ChristopheJacquet,PiFmRds,$(PIFMRDS_VERSION))
> > -PIFMRDS_DEPENDENCIES = libsndfile
> > +PIFMRDS_DEPENDENCIES = host-pkgconf libsndfile
> >  PIFMRDS_LICENSE = GPL-3.0+
> >  PIFMRDS_LICENSE_FILES = LICENSE
> >  
> >  define PIFMRDS_BUILD_CMDS
> >  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src CC="$(TARGET_CC)" LDFLAGS="$(TARGET_LDFLAGS)" \
> >  		CFLAGS="$(TARGET_CFLAGS) -std=gnu99 -ffast-math -c" \
> > +		SNDFILE_LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs sndfile`" \
> >  		app rds_wav
> >  endef
> >  
> > -- 
> > 2.30.2
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
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
