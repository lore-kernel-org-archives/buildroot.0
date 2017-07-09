From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 9 Jul 2017 21:44:08 +0200
Subject: [Buildroot] Issue with the HOST_DIR/usr -> HOST_DIR move
In-Reply-To: <b1e780c2-dc90-cb52-ccff-fe04fbf2f4ee@mind.be>
References: <20170709182532.40ff2614@windsurf>
 <b1e780c2-dc90-cb52-ccff-fe04fbf2f4ee@mind.be>
Message-ID: <20170709194408.GF3196@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-07-09 21:30 +0200, Arnout Vandecappelle spake thusly:
> On 09-07-17 18:25, Thomas Petazzoni wrote:
> > Hello Arnout,
> > 
> > I've started rebuilding the pre-built Buildroot external toolchains
> > after the HOST_DIR/usr -> HOST_DIR move. I've dropped my hack on the
> > toolchain wrapper to support the fact that I was moving the toolchain
> > out of the usr/ folder... because obviously this is no longer needed.
> > So basically, I'm building on top of master + a patch that builds
> > host-flex, host-gmp, host-mpc, etc. as static libraries instead of
> > shared ones.
> > 
> > Using this defconfig:
> > 
> > BR2_arm=y
> > BR2_HOST_DIR="/opt/br-arm-full-2017.05-1071-gef605f5"
> > BR2_JLEVEL=16
> > BR2_KERNEL_HEADERS_3_10=y
> > BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
> > BR2_GCC_VERSION_4_9_X=y
> > BR2_TOOLCHAIN_BUILDROOT_CXX=y
> > BR2_INIT_NONE=y
> > BR2_SYSTEM_BIN_SH_NONE=y
> > # BR2_PACKAGE_BUSYBOX is not set
> > # BR2_TARGET_ROOTFS_TAR is not set
> > 
> > I'm seeing this build failure:
> > 
> > ESC[7m>>> uclibc 1.0.25 BuildingESC[27m
> > /usr/bin/make -j16 -C /opt/toolchain-build/build/uclibc-1.0.25 ARCH="arm" CROSS_COMPILE="/opt/br-arm-full-2017.05-1071-gef605f5/bin/arm-buildroot-linux-uclibcgnueabi-" UCLIBC_EXTRA_CFLAGS=" " HOSTCC="/usr/bin/gcc" headers
> > /opt/br-arm-full-2017.05-1071-gef605f5/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc.br_real: No such file or directory
> > /opt/br-arm-full-2017.05-1071-gef605f5/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc.br_real: No such file or directory
> > /opt/br-arm-full-2017.05-1071-gef605f5/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc.br_real: No such file or directory
> > /opt/br-arm-full-2017.05-1071-gef605f5/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc.br_real: No such file or directory
> > make[1]: Entering directory `/opt/toolchain-build/build/uclibc-1.0.25'
> >   MKDIR include/bits
> >   GEN include/bits/uClibc_config.h
> > /opt/br-arm-full-2017.05-1071-gef605f5/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc.br_real: No such file or directory
> > /opt/br-arm-full-2017.05-1071-gef605f5/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc.br_real: No such file or directory
> > /opt/br-arm-full-2017.05-1071-gef605f5/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc.br_real: No such file or directory
> > /opt/br-arm-full-2017.05-1071-gef605f5/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc.br_real: No such file or directory
> >   LN include/semaphore.h
> >   LN include/pthread.h
> >   LN include/bits/libc-lock.h
> >   LN include/bits/stdio-lock.h
> >   LN include/bits/pthreadtypes.h
> >   LN include/bits/semaphore.h
> >   GEN include/bits/sysnum.h
> > /opt/br-arm-full-2017.05-1071-gef605f5/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc.br_real: No such file or directory
> > /opt/br-arm-full-2017.05-1071-gef605f5/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc.br_real: No such file or directory
> > 
> > There are two problems here:
> > 
> >  * First, the problem that $(HOST_DIR)/usr didn't exist. The reason is
> >    that you rule that creates $(HOST_DIR)/usr is only triggered if the
> >    Buildroot Makefile creates $(HOST_DIR). But when you're building a
> >    SDK inside /opt/foo/, therefore setting BR2_HOST_DIR=/opt/foo/, it's
> >    pretty likely that /opt/foo/ might exist before Buildroot gets
> >    triggered. In such a situation, your $(HOST_DIR) rule in the main
> >    Makefile doesn't get triggered, and $(HOST_DIR)/usr is not created.
> 
>  I never thought of that - I assumed that the HOST_DIR would always be created
> by Buildroot. But indeed it does make sense to install a toolchain in a
> pre-existing directory.
> 
>  There is one problem with that, though: in such a situation, it is also
> possible that the usr/ directory already exists, so we can't create the
> compatibility symlink. I guess we'll just have to live with that.
> 
>  I'll make an explicit rule for $(HOST_DIR)/usr to solve this.

I can totally understand the need to install in an existing directory,
but I don;t think we should accept that there is a usr/ directory in
there.

As far as I understand, we keep the compatibility usr/ as a symlink for
two reasons:

  - that a host-package accidentally wants to install stuff in usr/ and
    we missed that (e.g. for out-of-tree host-packages), but still want
    the build to succeed,

  - that existing users' post-build/fakeroot/image scripts still work
    without modification.

However, we do not add $(HOST_DIR)/usr/{s,}bin in the PATH, so an
existing usr/ directory would have the potential to break when a package
unexpectedly installs stuff therein, especially out-of-tree packages.
And in this case, the build is broken.

So I would argue that we should only accept to use an existing directory
if it is empty.

Regards,
Yann E. MORIN.

> >  * Even if the symlink doesn't exist, the build should still work.
> >    Indeed, the symlink was kept for backward compatibility reasons, but
> >    here I'm doing a full build from scratch, which I would expect to
> >    work even without the usr/ compatibility symlink.
> 
>  D'oh, this is really, really weird, I'm sure I looked at that piece of code
> when I made my initial version of the series, but apparently I didn't look at it
> again last week. There are still *three* references to $(HOST_DIR)/usr in
> toolchain-wrapper.c...
> 
> 
>  Regards,
>  Arnout
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
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
