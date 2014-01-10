From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 11 Jan 2014 00:08:33 +0100
Subject: [Buildroot] [PATCH] coreutils: fix build with uClibc
In-Reply-To: <fb99be0f4d3d7d7e92f0e3948d923c624730f1a4.1388492301.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 31 Dec 2013 14:18:21 +0200")
References: <fb99be0f4d3d7d7e92f0e3948d923c624730f1a4.1388492301.git.baruch@tkos.co.il>
Message-ID: <8761pr77v2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > uClibc needs -lrt for posix_spawn(). As a side effect of the fix, the
 > timer_settime() library test breaks. So force timer_settime() library as well.

 > Fixes
 > http://autobuild.buildroot.net/results/ab1/ab1250c3d402ec3fbaf22eeffd07de218ffafb22/.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>


 > ---

 > Note: something along the same lines should also fix m4 build against uClibc.
 > But since m4 for target is now deprecated I'm not sure it is worth the effort.
 > ---
 >  package/coreutils/coreutils.mk | 11 ++++++++++-
 >  1 file changed, 10 insertions(+), 1 deletion(-)

 > diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
 > index e0e9d80..fcf8905 100644
 > --- a/package/coreutils/coreutils.mk
 > +++ b/package/coreutils/coreutils.mk
 > @@ -20,6 +20,8 @@ COREUTILS_BIN_PROGS = cat chgrp chmod chown cp date dd df dir echo false hostnam
 >  	ln ls mkdir mknod mv pwd rm rmdir vdir sleep stty sync touch true \
 >  	uname join
 
 > +COREUTILS_LDFLAGS = $(TARGET_LDFLAGS)
 > +
 >  COREUTILS_CONF_ENV = ac_cv_c_restrict=no \
 >  		ac_cv_func_chown_works=yes \
 >  		ac_cv_func_euidaccess=no \
 > @@ -54,7 +56,14 @@ COREUTILS_CONF_ENV = ac_cv_c_restrict=no \
 >  		gl_cv_func_working_utimes=yes \
 >  		gl_getline_needs_run_time_check=no \
 >  		utils_cv_localtime_cache=no \
 > -		PERL=missing
 > +		PERL=missing \
 > +		LDFLAGS="$(COREUTILS_LDFLAGS)"
 > +
 > +ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 > +COREUTILS_LDFLAGS += -lrt
 > +COREUTILS_CONF_ENV += ac_cv_func_posix_spawn=yes \
 > +		ac_cv_search_timer_settime=-lrt

Hmm, this is only for uClibc snapshot, right? My 0.9.33 doesn't seem to
have posix_spawn, so this breaks the build.

-- 
Bye, Peter Korsgaard
