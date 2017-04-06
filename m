From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 6 Apr 2017 19:51:30 +0200
Subject: [Buildroot] [PATCHv3 00/12] toolchain: improvements to
 copy_toolchain_sysroot and copy_toolchain_lib_root
In-Reply-To: <20170406190921.004196b2@free-electrons.com>
References: <20170207215649.364-1-patrickdepinguin@gmail.com>
 <20170405215445.2b734880@free-electrons.com>
 <CAAXf6LWeKRpa8ngWCxiAKckCrBV27RW8fZdN5BTkdOE1iQYk9g@mail.gmail.com>
 <20170406190921.004196b2@free-electrons.com>
Message-ID: <CAAXf6LVuTTQQJfhapxgu3keGTZatHA4hxnkEb4CJe2R=XOATPQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Apr 6, 2017 7:09 PM, "Thomas Petazzoni" <
thomas.petazzoni@free-electrons.com> wrote:

Hello,

On Wed, 5 Apr 2017 22:15:40 +0200, Thomas De Schampheleire wrote:

> > Thomas De Schampheleire (12):
> >   toolchain-external: reduce nesting in copy_toolchain_sysroot
> >   toolchain-external: fix broken handling of 'usr/lib/locale'
> >   toolchain-external: clarify rsync excludes in copy_toolchain_sysroot
> >   toolchain-external: handle ld.so fixups centrally
> >   toolchain helpers: introduce function relpath_prefix
> >   toolchain-external: cover multilib toolchains with lib/<variant>
> >     layout
> >   toolchain helpers: introduce simplify_symlink
> >   toolchain-external: simplify previously-broken symbolic links
> >   toolchain: copy_toolchain_lib_root: remove unused variable LIBDIR
> >   toolchain: copy_toolchain_lib_root: clarify logic
> >   toolchain: copy_toolchain_lib_root: clarify input parameter
> >   toolchain: copy_toolchain_lib_root: copy symlinks instead of
> >     recreating them
>
> I've now applied the remainder of the series, patches 3 to 12. I still
> find this quite complicated overall, but I couldn't find any other
> solution and nobody else did, and the problem scope is complicated
> anyway.
>
> Let's see the feedback we get from users :)

Unfortunately, this breaks the build with at least one toolchain: the
CodeSourcery MIPS toolchain. Try the following defconfig:

BR2_mips64el=y
BR2_mips_64r2=y
BR2_MIPS_NABI64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_ALLJOYN_TCL=y
# BR2_TARGET_ROOTFS_TAR is not set

At commit a4c4cecd87851bdb3cbd4803a94df7602b102c42 (right before your
patch series), it builds fine.

At commit 38b51739da7fa7b950bbc46c059fbbab465ba4cb (right after your
patch series), it no longer builds, with the following error:

/home/thomas/projets/buildroot/output/host/usr/mips64el-buildroot-linux-gnu/
sysroot/soft-float/el/lib64/ld.so.1: error adding symbols: File in wrong
format
collect2: error: ld returned 1 exit status

So it smells like the copying of libraries to staging no longer works
as it used to work for this toolchain.

This causes some build failures in the autobuilders:

  http://autobuild.buildroot.net/results/8bf/8bffe54032aad9cc710a22411ef3bf
f4a2c93e55/build-end.log

Could you have a look ?


I noticed a problem today with the first patch in the series, related to
ld.so copying and have a fix ready, will test your use case to see if it's
the same.

Thanks,
Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170406/113cdfb5/attachment.html>
