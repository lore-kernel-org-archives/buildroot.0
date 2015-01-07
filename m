From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 7 Jan 2015 22:46:19 +0100
Subject: [Buildroot] [PATCH] dmalloc: bump version to 5.5.2
In-Reply-To: <20150107130309.GA13648@vostro>
References: <20150107130309.GA13648@vostro>
Message-ID: <20150107214619.GG4249@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alex, All,

On 2015-01-07 15:03 +0200, Alex Suykov spake thusly:
> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Indeed, without patch 0004, dmalloc does not even build.

And the static versions of the libraries are assembled already contain
the object files listed on the shared versions' link commands.

Regards,
Yann E. MORIN.

> ---
>  package/dmalloc/0001-add-fpic.patch           | 16 ++++------
>  package/dmalloc/0002-mips.patch               | 10 +++---
>  package/dmalloc/0003-fix-parallel-build.patch | 12 +++----
>  package/dmalloc/0004-fix-shlibs.patch         | 46 +++++++++++++++++++++++++++
>  package/dmalloc/dmalloc.mk                    |  2 +-
>  5 files changed, 65 insertions(+), 21 deletions(-)
>  create mode 100644 package/dmalloc/0004-fix-shlibs.patch
> 
> --- a/package/dmalloc/0001-add-fpic.patch
> +++ b/package/dmalloc/0001-add-fpic.patch
> @@ -15,11 +15,9 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>   Makefile.in |   10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>  
> -Index: dmalloc-5.4.3/Makefile.in
> -===================================================================
> ---- dmalloc-5.4.3.orig/Makefile.in
> -+++ dmalloc-5.4.3/Makefile.in
> -@@ -319,17 +319,17 @@
> +--- a/Makefile.in
> ++++ b/Makefile.in
> +@@ -318,17 +318,17 @@
>   # special _th versions of objects with the LOCK_THREADS variable defined to 1
>   chunk_th.o : $(srcdir)/chunk.c
>   	rm -f $@
> @@ -39,8 +37,8 @@ Index: dmalloc-5.4.3/Makefile.in
>  +	$(CC) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -DLOCK_THREADS=1 \
>   		-c $(srcdir)/malloc.c -o ./$@
>   
> - tests : $(TEST)
> -@@ -355,7 +355,7 @@
> + tests : $(TEST) $(TEST_FC)
> +@@ -360,7 +360,7 @@
>   
>   .c.o :
>   	rm -f $@
> @@ -49,7 +47,7 @@ Index: dmalloc-5.4.3/Makefile.in
>   
>   #
>   # .cc.o auto-target doesn't work on some systems. 
> -@@ -363,7 +363,7 @@
> +@@ -368,7 +368,7 @@
>   #
>   dmallocc.o : $(srcdir)/dmallocc.cc
>   	rm -f $@
> @@ -57,4 +55,4 @@ Index: dmalloc-5.4.3/Makefile.in
>  +	$(CXX) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -c $(srcdir)/dmallocc.cc \
>   		-o ./$@
>   
> - .texi.info :
> + #
> --- a/package/dmalloc/0002-mips.patch
> +++ b/package/dmalloc/0002-mips.patch
> @@ -1,6 +1,6 @@
> ---- dmalloc/configure	2006-09-01 18:28:51.000000000 -0700
> -+++ dmalloc-mips/configure	2006-09-01 18:49:07.000000000 -0700
> -@@ -6114,7 +6114,7 @@
> +--- a/configure
> ++++ b/configure
> +@@ -7107,7 +7107,7 @@
>   echo $ECHO_N "checking return.h macros work... $ECHO_C" >&6
>   if test "$cross_compiling" = yes; then
>      cat >>confdefs.h <<\_ACEOF
> @@ -9,8 +9,8 @@
>   _ACEOF
>    echo "$as_me:$LINENO: result: no" >&5
>   echo "${ECHO_T}no" >&6
> ---- dmalloc/return.h	2004-10-19 07:51:21.000000000 -0700
> -+++ dmalloc-mips/return.h	2006-09-08 21:52:43.000000000 -0700
> +--- a/return.h
> ++++ b/return.h
>  @@ -106,26 +106,16 @@
>   /*************************************/
>   
> --- a/package/dmalloc/0003-fix-parallel-build.patch
> +++ b/package/dmalloc/0003-fix-parallel-build.patch
> @@ -8,11 +8,11 @@ Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
>  
>  --- a/Makefile.in
>  +++ b/Makefile.in
> -@@ -399,6 +399,7 @@
> - compat.o: compat.c dmalloc.h conf.h settings.h compat.h dmalloc_loc.h
> - dmalloc.o: dmalloc.c dmalloc_argv.h conf.h settings.h dmalloc.h \
> -  compat.h debug_tok.h dmalloc_loc.h env.h error_val.h version.h
> +@@ -401,6 +401,7 @@
> + compat.o: compat.c conf.h settings.h dmalloc.h compat.h dmalloc_loc.h
> + dmalloc.o: dmalloc.c conf.h settings.h dmalloc_argv.h dmalloc.h compat.h \
> +   debug_tok.h dmalloc_loc.h env.h error_val.h version.h
>  +dmallocc.o: dmallocc.cc dmalloc.h return.h conf.h settings.h
>   dmalloc_argv.o: dmalloc_argv.c conf.h settings.h dmalloc_argv.h \
> -  dmalloc_argv_loc.h compat.h
> - dmalloc_rand.o: dmalloc_rand.c conf.h settings.h dmalloc_rand.h
> +   dmalloc_argv_loc.h compat.h
> + dmalloc_fc_t.o: dmalloc_fc_t.c conf.h settings.h dmalloc.h dmalloc_argv.h \
> --- /dev/null
> +++ b/package/dmalloc/0004-fix-shlibs.patch
> @@ -0,0 +1,46 @@
> +Fix shared library rules
> +
> +dmalloc uses ld -shared --whole-archive -o lib.so lib.a,
> +but for some reason lists regular objects in addition
> +to the archive, ending up with two copies of each symbol.
> +
> +Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
> +
> +--- a/Makefile.in
> ++++ b/Makefile.in
> +@@ -257,7 +257,7 @@ shlib : $(BUILD_SL)
> + # via: http://256.com/gray/email.html
> + $(LIB_SL) : $(LIBRARY)
> + 	rm -f $@ $@.t
> +-	@shlinkargs@ $(LIBRARY) $(OBJS) $(NORMAL_OBJS)
> ++	@shlinkargs@ $(LIBRARY)
> + 	mv $@.t $@
> + 
> + $(LIBRARY) : $(OBJS) $(NORMAL_OBJS)
> +@@ -270,7 +270,7 @@ $(LIB_TH) : $(OBJS) $(THREAD_OBJS)
> + 
> + $(LIB_TH_SL) : $(LIB_TH)
> + 	rm -f $@ $@.t
> +-	@shlinkargs@ $(LIB_TH) $(OBJS) $(THREAD_OBJS)
> ++	@shlinkargs@ $(LIB_TH)
> + 	mv $@.t $@
> + 
> + $(LIB_CXX) : $(OBJS) $(NORMAL_OBJS) $(CXX_OBJS)
> +@@ -279,7 +279,7 @@ $(LIB_CXX) : $(OBJS) $(NORMAL_OBJS) $(CXX_OBJS)
> + 
> + $(LIB_CXX_SL) : $(LIB_CXX)
> + 	rm -f $@ $@.t
> +-	@shlinkargs@ $(LIB_CXX) $(OBJS) $(NORMAL_OBJS) $(CXX_OBJS)
> ++	@shlinkargs@ $(LIB_CXX)
> + 	mv $@.t $@
> + 
> + $(LIB_TH_CXX) : $(OBJS) $(THREAD_OBJS) $(CXX_OBJS)
> +@@ -288,7 +288,7 @@ $(LIB_TH_CXX) : $(OBJS) $(THREAD_OBJS) $(CXX_OBJS)
> + 
> + $(LIB_TH_CXX_SL) : $(LIB_TH_CXX)
> + 	rm -f $@ $@.t
> +-	@shlinkargs@ $(LIB_TH_CXX) $(OBJS) $(THREAD_OBJS) $(CXX_OBJS)
> ++	@shlinkargs@ $(LIB_TH_CXX)
> + 	mv $@.t $@
> + 
> + threadssl : $(LIB_TH_SL)
> --- a/package/dmalloc/dmalloc.mk
> +++ b/package/dmalloc/dmalloc.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -DMALLOC_VERSION = 5.4.3
> +DMALLOC_VERSION = 5.5.2
>  DMALLOC_SOURCE = dmalloc-$(DMALLOC_VERSION).tgz
>  DMALLOC_SITE = http://dmalloc.com/releases
>  
> -- 
> 2.0.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
