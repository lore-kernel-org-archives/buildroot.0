From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 25 Apr 2014 21:32:49 +0200
Subject: [Buildroot] [PATCH] evemu: bump version to 1.2.0
Message-ID: <trinity-1fce5222-5e5e-419c-baab-a89af52a2d58-1398454369404@3capp-gmx-bs30>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Fri, Apr 25, 2014 at 04:46:36PM +0200, Thomas Petazzoni wrote:
> Dear Peter Seiderer,
> 
> On Tue, 22 Apr 2014 23:47:17 +0200, Peter Seiderer wrote:
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >  package/evemu/evemu.mk | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/package/evemu/evemu.mk b/package/evemu/evemu.mk
> > index 38b792d..df9aea1 100644
> > --- a/package/evemu/evemu.mk
> > +++ b/package/evemu/evemu.mk
> > @@ -4,7 +4,7 @@
> >  #
> >  ################################################################################
> >  
> > -EVEMU_VERSION = 1.0.10
> > +EVEMU_VERSION = 1.2.0
> >  EVEMU_SITE = http://cgit.freedesktop.org/evemu/snapshot
> >  EVEMU_LICENSE = LGPLv3 (library), GPLv3 (tools)
> >  EVEMU_LICENSE_FILES = COPYING COPYING.GPL3
> 
> This is causing some build failures in the autobuilders:
> 
>   http://autobuild.buildroot.org/results/24b/24b0e8214e528f455b630c47f93b50a83f308ab5/build-end.log
> 

From build-end.log:
make[3]: Entering directory `/home/test/test/1/output/build/evemu-1.2.0/src'
./make-event-names.py --output=c > event-names.h
./make-event-names.py --output=python > event_names.py
/usr/bin/make  all-am
make[4]: Entering directory `/home/test/test/1/output/build/evemu-1.2.0/src'
  CC       libevemu_la-evemu.lo
evemu.c: In function 'write_desc':
evemu.c:386:50: error: 'input_prop_map' undeclared (first use in this function)
evemu.c:386:50: note: each undeclared identifier is reported only once for each function it appears in

On succesfull builds input_prop_map is defined in the generated event-names.h
file ('./make-event-names.py --output=c > event-names.h'), but in make-event-names.py
the variable SOURCE_FILE = "/usr/include/linux/input.h" is used as paser input without
any cross-compile prefix, this means that always input.h from the host system is used.

SOURCE_FILE should be something like "${SYSROOT}/usr/include/linux/input.h", whats the best
way to achieve this (and which buildroot set variable should be uesed)?
- patch make-event-names.py directly with given sysroot path
- patch make-event-names.py to use given environment variable with sysroot path
- ...

Regards,
Peter

> Could you have a look?
> 
> Thanks,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
