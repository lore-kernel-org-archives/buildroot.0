From: Maxim Grigoriev <maxim@tensilica.com>
Date: Wed, 04 Feb 2009 19:59:38 -0800
Subject: [Buildroot] Bug with gmp and mpfr
In-Reply-To: <498A4C33.8000302@tsinghua.edu.cn>
References: <498A4C33.8000302@tsinghua.edu.cn>
Message-ID: <498A642A.3060003@hq.tensilica.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Vania,

The best solution for this problem I was able to find is
switching to static linkage of GMP/MPFR for GCC 4.3.x compilers.

If you don't like the idea of static linkage, please, simply ignore this 
email.

Here is the patch :

diff -u package/gmp/gmp.mk.orig package/gmp/gmp.mk
--- package/gmp/gmp.mk.orig 2009-01-21 15:43:41.788558000 -0800
+++ package/gmp/gmp.mk 2009-02-03 18:07:44.643402000 -0800
@@ -83,7 +83,7 @@
--prefix="$(GMP_HOST_DIR)" \
--build=$(GNU_HOST_NAME) \
--host=$(GNU_HOST_NAME) \
- --enable-shared \
+ --disable-shared \
--enable-static \
$(DISABLE_NLS) \
)
diff -u package/mpfr/mpfr.mk.orig package/mpfr/mpfr.mk
--- package/mpfr/mpfr.mk.orig 2009-01-21 15:43:42.259089000 -0800
+++ package/mpfr/mpfr.mk 2009-02-03 17:58:09.369092000 -0800
@@ -97,7 +97,7 @@
--prefix="$(MPFR_HOST_DIR)" \
--build=$(GNU_HOST_NAME) \
--host=$(GNU_HOST_NAME) \
- --enable-shared \
+ --disable-shared \
--enable-static \
--with-gmp=$(GMP_HOST_DIR) \
$(DISABLE_NLS) \

-- Maxim


Vania Joloboff wrote:
> Hi,
>
> We have some experience in cross compiling but we are new users of 
> buildroot.
> Please pardon our ignorance.
>
> We have built the GCC toolchain with the latest version of buildroot 
> 2009-02-rc3
> for three targets arm, ppc and mips, all three on two different hosts 
> Ubuntu 7.10 and 8.10
> We have installed the three toolchains in respectively 
> /usr/local/cross/{arm|ppc|mips}
>
> The gcc cross-compilers works (almost) fine except that the gmp and mpfr
> library are dynamically loaded by gcc (by cc1 more exactly) from the 
> wrong place...
> They are loaded from the system directory (/usr/lib) instead of the 
> directory
> that should correspond to the gcc build.
>
> Because Ubuntu version 8 is using libgmp and libmpfr in a more
> recent version it creates a mismatch that you can notice if you 
> compile with gcc -v,
> but it seems to work fine however. We did not have time to thoroughly 
> test generated code
>
> Ubuntu version 7 is older and does not use libmpfr.
> If you don't have libmpfr installed in the dynamic loading system 
> directories
> you get an error like :
>
> /usr/local/cross/ppc/usr/bin/../libexec/gcc/powerpc-linux-uclibc/4.3.2/cc1plus: 
> error while loading shared libraries: libmpfr.so.1: cannot open shared 
> object file: No such file or directory
>
> It seems there is a bug in buildroot: the generated gcc does not take 
> the libgmp
> and libmpfr from the right place.
> libgmp and libmpfr are not target dependent, they are host dependent.
> However the cross compiler gcc should not take these libraries
> from the same place as the host gcc.
> It should be from the staging directory.
> Moreover in our case we built the three targets (arm, ppc, mips)
> with the same release of buildroot.
> But it could be possible we would have the three targets built with 
> different
> releases of buildroot, hence different releases of mpfr. These libraries
> should be loaded from the staging directory.
>
> Perhaps it is because we missed an option somewhere in the 
> configuration...
>
> Anyone has an opinion on this ?
>
> VJ
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
