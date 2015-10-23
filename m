From: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
Date: Fri, 23 Oct 2015 22:17:47 +0900
Subject: [Buildroot] [PATCH v1 1/1] gauche: new package
In-Reply-To: Your message of Thu, 22 Oct 2015 14:00:58 +0100.
 <5628DE0A.1040000@imgtec.com>
Message-ID: <201510231317.t9NDHlIm005040@ms-omx01.plus.so-net.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear, Vincente.

Thank you for your detailed comment and test.

My reply inlined.

I will send v2 PATCH with reflecting your feedback.

> On 10/21/2015 02:35 PM, Hiroshi Kawashima wrote:
> > Gauche is a Scheme scripting engine aiming at being a handy tool
> > that helps programmers and system administrators to write small
> > to large scripts quickly.
> 
> Please wrap your commit log at 72 characters length. The word "that" of
> the second line fits in the first one. Then, "to large" will fit in the
> second one.
Ok.

> > diff --git a/package/gauche/0001-fix-so-suffix.patch b/package/gauche/0001-
> fix-so-suffix.patch
> > new file mode 100644
> > index 0000000..18d0bd5
> > --- /dev/null
> > +++ b/package/gauche/0001-fix-so-suffix.patch
> > @@ -0,0 +1,12 @@
> 
> The patch should contain a brief description about what it does or why
> is needed, and also contain your SoB.
Sorry, I forgot.

> > +diff -ur a/configure b/configure
> > +--- a/configure	2014-07-20 15:15:05.000000000 +0900
> > ++++ b/configure	2015-10-20 21:52:32.791442291 +0900
> > +@@ -6843,7 +6843,7 @@
> > +     SHLIB_MAIN_LDFLAGS=""
> > +     SHLIB_OK=ok
> > +     ;;
> > +-  *-linux-gnu*|*-*-gnu*|*freebsd*|*dragonfly*)
> > ++  *-linux-*|*-*-gnu*|*freebsd*|*dragonfly*)
> > +     SHLIB_SO_CFLAGS="-fPIC"
> > +     SHLIB_SO_LDFLAGS="$rpath -shared -o"
> > +     SHLIB_SO_SUFFIX="so"
> 
> I have built gauche with this patch, and without it, and I don't see any
> difference. Are you sure this is necessary? If so, why?
Ok, as I wrote, it is for uclibc configuration.
I will describe this comment in patch.

> > diff --git a/package/gauche/Config.in b/package/gauche/Config.in
> > new file mode 100644
> > index 0000000..ad61c3f
> > --- /dev/null
> > +++ b/package/gauche/Config.in
> > @@ -0,0 +1,14 @@
> > +config BR2_PACKAGE_GAUCHE
> > +	bool "gauche"
> > +	depends on BR2_TOOLCHAIN_HAS_THREADS
> 
> This is what the configure's help says:
> 
> --enable-threads=TYPE   Choose thread type. Possible values are: 'none'
> for not using threads, 'pthreads' to use pthreads, and 'default' to
> choose system's suitable one (if any).
> 
> So it seems that having threads is optional. However, I have checked it,
> and it fails if you don't have them:
> 
> In file included from ./../gc/libatomic_ops/src/atomic_ops.h:218:0,
>                  from lazy.c:78:
> ./../gc/libatomic_ops/src/atomic_ops/sysdeps/generic_pthread.h:30:21:
> fatal error: pthread.h: No such file or directory
>  #include <pthread.h>
> 
> In fact, according to that output, maybe this package should also depend
> on BR2_ARCH_HAS_ATOMICS. I haven't tested it. Could you? It doesn't fail
> to build, but maybe it fails at runtime, I don't know.
Thank you.
Boechm gc (included in gauche tree needs atomic transaction, so I added this.

> Moreover, BR2_TOOLCHAIN_HAS_THREADS is not enough. It needs to make sure
> that you have native posix threads, otherwise it will fail like this:
> 
> TARGETLIB=`pwd` /bin/sh ./makeverslink libgauche-0.9.so
> TARGETLIB=`pwd`
> /home/ldap/vriera/git-clones/buildroot-1/output/host/usr/bin/arm-buildroot-li
> nux-uclibcgnueabi-gcc
> -std=gnu99 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64   -Os  -fPIC -Wl,--rpath -Wl,`pwd` -L.  -rdynamic
> -o gosh main.o -lgauche-0.9 -ldl -lcrypt -lutil -lrt -lm  -lpthread
> ./libgauche-0.9.so: undefined reference to `pthread_spin_destroy'
> ./libgauche-0.9.so: undefined reference to `pthread_attr_getstack'
> ./libgauche-0.9.so: undefined reference to `pthread_spin_init'
> ./libgauche-0.9.so: undefined reference to `pthread_spin_unlock'
> ./libgauche-0.9.so: undefined reference to `pthread_getattr_np'
> ./libgauche-0.9.so: undefined reference to `pthread_spin_lock'
> 
> So you need:
> 
> depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
Thank you!
Changed.

> > +	depends on BR2_USE_MMU
> 
> You need that because gauche uses fork(), so add " # fork()" at the end
> of that line:
> 
> 	depends on BR2_USE_MMU # fork()
Ok.

> > +	help
> > +	  Gauche is a Scheme scripting engine aiming at being a handy tool
> > +	  that helps programmers and system administrators to write small
> 
> These two lines exceed the 72 characters limit. You have to count every
> tab as 8 characters, so your first line has 74 characters length, and
> the second one has 73. The word "tool" should be in the second line, and
> then, then word "small" should be in the third line.
> 
> However, why not using the description in Gauche's homepage as is?
Ok, I use it and keep 72 rule.

> > +	  to large scripts quickly.
> > +
> > +	  http://practical-scheme.net/gauche/
> > +
> > +comment "gauche needs a toolchain w/ threads"
> > +	depends on BR2_USE_MMU
> > +	depends on !BR2_TOOLCHAIN_HAS_THREADS
> 
> Adjust this accordingly:
> 
> comment "gauche needs a toolchain w/ NPTL"
> 	depends on BR2_USE_MMU
> 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
Ok.

> > diff --git a/package/gauche/gauche.hash b/package/gauche/gauche.hash
> > new file mode 100644
> > index 0000000..9d19671
> > --- /dev/null
> > +++ b/package/gauche/gauche.hash
> > @@ -0,0 +1,3 @@
> > +# Locally calculated
> > +#
> 
> This empty comment line is not need it. Please remove it.
Ok.

> > +GAUCHE_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
> 
> Normally you wouldn't need this. The configure script checks for c99
> support in the compiler and adds that flag. However, this check fails
> when you don't have support for wchar:
> 
>  904 configure:3987:
> /br/output/host/usr/bin/arm-buildroot-uclinux-uclibcgnueabi-g cc
> -D_STDC_C99= -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64 -Os -Wl,-elf2flt -static - std=gnu99
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
> conftest.c >&5
> 905 conftest.c:59:9: error: unknown type name 'wchar_t'
> 
> I don't know if WCHAR is needed at runtime. It isn't at buildtime. So,
> maybe depending on it just to make that configure check work would be
> overkilling. If WCHAR is not needed at runtime, I'm fine with that
> little hack. Perhaps a comment about that line explaining why is needed
> would be a good idea.
> 
> If at the end we decide to go with the CONF_ENV hack instead of making
> this package depending on WCHAR, I would suggest you to put that line
> after the GAUCHE_DEPENDENCIES one, with an empty line separating them.
> This is just for aesthetic.
Ok, at runtime, gauche do not need wchar.
I added comment for describing this.
============================================================
    Hiroshi Kawashima
