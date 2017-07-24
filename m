From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 24 Jul 2017 23:07:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/libressl: needs MMU
In-Reply-To: <20170724180723.4786fad5@windsurf.lan>
References: <20170723200844.13004-1-bernd.kuhls@t-online.de>
 <20170724180723.4786fad5@windsurf.lan>
Message-ID: <20170724210702.GM12791@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Thomas Petazzoni wrote,

> Hello,
> 
> On Sun, 23 Jul 2017 22:08:44 +0200, Bernd Kuhls wrote:
> > Fixes
> > http://autobuild.buildroot.net/results/074/07429d3016c900894fa0ca19b7dad0a928e32e3f/
> > http://autobuild.buildroot.net/results/1c1/1c1325d1a7a7aa98172d2d93d30322165af62348/
> > 
> > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> > ---
> >  package/libressl/Config.in | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/package/libressl/Config.in b/package/libressl/Config.in
> > index 0a1c9e273..d13b2068c 100644
> > --- a/package/libressl/Config.in
> > +++ b/package/libressl/Config.in
> > @@ -1,6 +1,7 @@
> >  config BR2_PACKAGE_LIBRESSL
> >  	bool "libressl"
> >  	depends on !BR2_PACKAGE_OPENSSL
> > +	depends on BR2_USE_MMU # fork()
> >  	help
> >  	  LibreSSL is a version of the TLS/crypto stack forked from
> >  	  OpenSSL in 2014, with goals of modernizing the codebase,
> 
> On this one, I'd like to have the feedback from Waldemar. Indeed,
> libressl is not using fork(), but __register_atfork(), which uClibc
> does not implement, and I've not found why it doesn't exist for noMMU
> platforms.

From the comment in the header:
"Register handlers to execute before and after `fork'"

As this is a feature only available when fork() is there, this isn't
available for noMMU platforms. So pthread_fork() is available as described
in POSIX here:
http://pubs.opengroup.org/onlinepubs/9699919799/functions/pthread_atfork.html

I think we no longer define pthread_atfork for noMMU architectures
since Romain reported an issue with Xenomai and Blackfin some time
ago. It was then fixed on both sides:
https://git.xenomai.org/xenomai-2.6.git/commit/?id=917dcebb26ec492f276cdc3b55867aa90e01fa12
https://cgit.openadk.org/cgi/cgit/uclibc-ng.git/commit/libpthread/linuxthreads?id=79c4017f3518cd30afb59a170717c1e754eedadf

Xenomai uses a dummy for pthread_fork:
https://git.xenomai.org/xenomai-2.6.git/tree/include/asm-blackfin/syscall.h#n137

__register_atfork() seems a LSB extension to allow to unregister
functions when a shared object is unloaded.
See:
http://refspecs.linuxbase.org/LSB_3.1.0/LSB-Core-generic/LSB-Core-generic/baselib--register-atfork.html

As uClibc inherits NPTL from glibc, it is available for all
architectures supporting NPTL. Checked with ARM cross-compilation.
 
> In addition, libressl interestingly has a special case for __GLIBC__
> (which gets used for uclibc, because uclibc defines __GLIBC__):
> 
> #ifdef __GLIBC__
> extern void *__dso_handle;
> extern int __register_atfork(void (*)(void), void(*)(void), void (*)(void), void *);
> #define _ARC4_ATFORK(f) __register_atfork(NULL, NULL, (f), __dso_handle)
> #else
> #define _ARC4_ATFORK(f) pthread_atfork(NULL, NULL, (f))
> #endif
> 
> Waldemar, what do you think ?

It was added in this commit:
https://github.com/libressl-portable/portable/commit/32d9eeeecf4e951e1566d5f4a42b36ea37b60f35

But I think the commit log isn't correct, as pthread_atfork can be
used for glibc, musl and uClibc-ng. (for glibc -lpthread must be
added)

One possible solution might be, to check for __register_atfork, if
it does not exist, fallback to pthread_atfork, if it does not exist
provide a pthread_atfork dummy (noMMU case).

Another solution would be to enhance uClibc-ng included arc4random.c
and sync with OpenBSD code and use that instead of the compat code
included in libressl.

best regards
 Waldemar
