From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 25 May 2021 22:10:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/pifmrds: always link with -lm
In-Reply-To: <e4e76247-cd73-a6a5-72f1-6c7a6c4f8d86@mind.be>
References: <20210525054427.455433-1-fontaine.fabrice@gmail.com>
 <e4e76247-cd73-a6a5-72f1-6c7a6c4f8d86@mind.be>
Message-ID: <20210525201012.GO3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2021-05-25 21:59 +0200, Arnout Vandecappelle spake thusly:
> On 25/05/2021 07:44, Fabrice Fontaine wrote:
> > Commit 888546e5273d77d49bec564a515e85d7acee6bdd wrongly removed linking
> > with -lm resulting in the following build failure:
> > 
> > /home/buildroot/autobuild/run/instance-3/output-1/host/bin/arm-linux-gnueabihf-gcc  -o pi_fm_rds rds.o waveforms.o pi_fm_rds.o fm_mpx.o control_pipe.o -L/home/buildroot/autobuild/run/instance-3/output-1/host/bin/../arm-buildroot-linux-gnueabihf/sysroot/usr/lib -lsndfile
> > /home/buildroot/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/7.3.1/../../../../arm-linux-gnueabihf/bin/ld: fm_mpx.o: undefined reference to symbol 'cos@@GLIBC_2.4'
> > /home/buildroot/autobuild/run/instance-3/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/lib/libm.so.6: error adding symbols: DSO missing from command line
> 
>  Although the only undefined reference here was for a symbol referenced from
> pifmrds itself, the original patch was actually for libsndfile (it uses pow and
> frexp, possibly others as well). So I would actually expect libsndfile to add it
> to its libs in the pc file.

That's what I assumed...

>  That said, since pifmrds uses math functions directly, this fix is still
> correct, so applied to master, thanks.

But then, we should change the commit log of that patch, to state that
-lm is need for pifmrds itself, otherwise this is going to stay
confusing when we update to a libsndfile that properly add -lm to its
.pc file, no?

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> > 
> > Fixes:
> >  - http://autobuild.buildroot.org/results/b2a6e6fd77bf9071ce9f75fed1811be9ffe5366d
> > 
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/pifmrds/0003-Makefile-fix-static-link.patch | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/package/pifmrds/0003-Makefile-fix-static-link.patch b/package/pifmrds/0003-Makefile-fix-static-link.patch
> > index 3bd91c981f..3832b77d59 100644
> > --- a/package/pifmrds/0003-Makefile-fix-static-link.patch
> > +++ b/package/pifmrds/0003-Makefile-fix-static-link.patch
> > @@ -15,11 +15,11 @@ diff -purN pifmrds-0bf57f9ce0d954365a38d8af8e7be6f28521c3f2.orig/src/Makefile pi
> >   
> >   app: rds.o waveforms.o pi_fm_rds.o fm_mpx.o control_pipe.o
> >  -	$(CC) $(LDFLAGS) -o pi_fm_rds rds.o waveforms.o pi_fm_rds.o fm_mpx.o control_pipe.o -lm -lsndfile
> > -+	$(CC) $(LDFLAGS) -o pi_fm_rds rds.o waveforms.o pi_fm_rds.o fm_mpx.o control_pipe.o $(SNDFILE_LIBS)
> > ++	$(CC) $(LDFLAGS) -o pi_fm_rds rds.o waveforms.o pi_fm_rds.o fm_mpx.o control_pipe.o $(SNDFILE_LIBS) -lm
> >   
> >   rds_wav: rds.o waveforms.o rds_wav.o fm_mpx.o
> >  -	$(CC) $(LDFLAGS) -o rds_wav rds_wav.o rds.o waveforms.o fm_mpx.o -lm -lsndfile
> > -+	$(CC) $(LDFLAGS) -o rds_wav rds_wav.o rds.o waveforms.o fm_mpx.o $(SNDFILE_LIBS)
> > ++	$(CC) $(LDFLAGS) -o rds_wav rds_wav.o rds.o waveforms.o fm_mpx.o $(SNDFILE_LIBS) -lm
> >   
> >   rds.o: rds.c waveforms.h
> >   	$(CC) $(CFLAGS) rds.c
> > 
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
