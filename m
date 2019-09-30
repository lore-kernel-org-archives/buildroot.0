From: Steve Calfee <stevecalfee@gmail.com>
Date: Mon, 30 Sep 2019 10:03:41 -0700
Subject: [Buildroot] Failure upgrading 8/2017 to 8/2019
In-Reply-To: <CAJ4jsad2g9dzwkCKszgAxJk1rBUjhUyn_RQJ8CK07VUacPXrbA@mail.gmail.com>
References: <CAJJ6jxvMGKJoO=L6TSP9dc2Wyvg62GyKobn6nwemvUK-tC5RGw@mail.gmail.com>
 <CAJ4jsacuzsLFcgMJQcLPut-GvT9HA8yepQq8V-sLPv=PhSbPNA@mail.gmail.com>
 <CAJJ6jxu=Vm7U7v8MJgcQ_bJk-U6P1p_37Fc0Aq4pKXtb-OXCDw@mail.gmail.com>
 <CAJ4jsad2g9dzwkCKszgAxJk1rBUjhUyn_RQJ8CK07VUacPXrbA@mail.gmail.com>
Message-ID: <CAJJ6jxu=pG47695woTKYnK5s1TsGXDQAF=DDe3H7pwNZa4ddVQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> > Do you think it is a tool chain issue? It looks like I rebuilt 2/2017.
> > I always build in another tree so "make clean" doesn't delete it. I
> > point my working buildroot to this built toolchain as an external
> > toolchain. My build system is a ubuntu 16.04 laptop.
> >
> > Here is my defconfig for just the toolchain.
> >
> > BR2_arm=y
> > BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
> > BR2_GCC_VERSION_4_8_X=y
>
> Support for gcc version 4.8.x has been removed in Buildroot 2017.08
Hi Carlos,

Thanks for trying to help. I am not seeing any cross compiling issues.
When I get the current stuff to work I will upgrade my toolchain.


>
> > BR2_TOOLCHAIN_BUILDROOT_CXX=y
> > BR2_ENABLE_LOCALE_PURGE=y
> > BR2_GENERATE_LOCALE="en_US.UTF-8"
> > BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY=y
> > BR2_TARGET_OPTIMIZATION="-Os -pipe"
> > # BR2_TARGET_GENERIC_GETTY is not set
> > # BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
> > BR2_PACKAGE_LIBPTHREAD_STUBS=y
>
> You should not need BR2_PACKAGE_LIBPTHREAD_STUBS with glibc.
>

OK, will check later. It is not related to these failures.

> > # BR2_TARGET_ROOTFS_TAR is not set
> > BR2_TARGET_SHEEVAPLUG=y
>
> What is BR2_TARGET_SHEEVAPLUG?

It is some remnant in my external config. I used to use it as an
arch/platform selection. This has been replaced by the kernel device
tree and manufacturer reorg.


Now the real issue is buildroot 2019.8 has two broken things that work
correctly in 2019.5.

package python-tornado was bumped and that broke that build. I don't
know why the autobuilders have not found it.

locale handling has broken. Again, I don't know why the autobuilders
have not found this error. locale is not a normal package, it is
something done by the target finalization scripts. Here is a 2019.5
snip showing a successful local build. I do not know what it is doing
or how to debug this.

t/etc/shells
Generating locale en_US.UTF-8
rm -f /home/calfee/nobu/br/dockstar/ds_9_2019/output/build/locales.nopurge
for i in C en_US.utf8 C.UTF-8 locale-archive; do echo $i >>
/home/calfee/nobu/br/dockstar/ds_9_2019/output/build/locales.nopurge;
done
for dir in /home/calfee/nobu/br/dockstar/ds_9_2019/output/target/usr/share/locale;
do for langdir in $dir/*; do if [ -e "${langdir}" ]; then grep -qx
"${langdir##*/}"
/home/calfee/nobu/br/dockstar/ds_9_2019/output/build/locales.nopurge
|| rm -rf $langdir; fi done; done
if [ -d /home/calfee/nobu/br/dockstar/ds_9_2019/output/target/usr/share/X11/locale
]; then for lang in C en_US.utf8 C.UTF-8; do if [ -f
/home/calfee/nobu/br/dockstar/ds_9_2019/output/target/usr/share/X11/locale/$lang/XLC_LOCALE
]; then echo "$lang/XLC_LOCALE: $lang"; fi done >
/home/calfee/nobu/br/dockstar/ds_9_2019/output/target/usr/share/X11/locale/locale.dir;
fi
rm -rf /home/calfee/nobu/br/dockstar/ds_9_2019/output/target/usr/include
/home/calfee/nobu/br/dockstar/ds_9_2019/output/target/usr/share/aclocal
\
    /home/calfee/nobu/br/dockstar/ds_9_2019/output/target/usr/lib/pkgconfig
/home/calfee/nobu/br/dockstar/ds_9_2019/output/target/usr/share/pkgconfig
\
    /home/calfee/nobu/br/dockstar/ds_9_2019/output/target/usr/lib/cmake
/home/calfee/nobu/br/dockstar/ds_9_2019/output/target/usr/share/cmake
find /home/calfee/nobu/br/dockstar/ds_9_2019/output/target/usr/{lib,share}/
-name '*.cmake' -print0 | xargs -0 rm -f

I guess I will stick with 2019.5 and go on to testing if it will boot.

Steve
