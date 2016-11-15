From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Tue, 15 Nov 2016 11:49:01 +0100
Subject: [Buildroot] [PATCH v2] Bump libxmlrpc to version 1.39.10
In-Reply-To: <20161111153850.20bb010f@free-electrons.com>
References: <20161102232646.69bfff3d@free-electrons.com>
 <1478851086-19073-1-git-send-email-alvaro.gamez@hazent.com>
 <20161111153850.20bb010f@free-electrons.com>
Message-ID: <CAM+bi4vAks48DSkjARGDsoMiG7p+X=+frremEZbjaQnG5GQHYw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Thomas

2016-11-11 15:38 GMT+01:00 Thomas Petazzoni <thomas.petazzoni@free-electro
ns.com>:

> On Fri, 11 Nov 2016 08:58:06 +0100, Alvaro G. M wrote:
> > Previous version patches are still needed, but they have been upgraded
> to apply cleanly.
> >
> > Bumped version fixes compilation issue on some architectures (arm,
> microblaze).
> >
> > Fixes:
> > http://autobuild.buildroot.net/results/c45530f34bf2074bd204c
> 485615124df928f246c
>
> This problem has already been fixed more than two month ago, by commit
> aa9fde1c459dbc20b268694eafd7a1d3341dbf76.
>
> In addition, your patch does not work: you have created it on an old
> version of Buildroot, which predates commit
> aa9fde1c459dbc20b268694eafd7a1d3341dbf76. And therefore, the patch
> added in aa9fde1c459dbc20b268694eafd7a1d3341dbf76 no longer applies
> (and probably should be removed).
>

Yes, you're right. I have the bad habit of patching things for myself and
forget
for a while that I should send them, so when I get to it, they're already
too old.
Sorry about that, I'll try my best next time.


> Unfortunately, even after doing this, it still doesn't build with the
> following error:
>
> arm-buildroot-linux-gnueabihf-ar cru libxmlrpc_util.a asprintf.o base64.o
> error.o lock_platform.o lock_pthread.o lock_none.o make_printable.o
> memblock.o select.o sleep.o string_number.o time.o utf8.o
> /bin/bash: arm-buildroot-linux-gnueabihf-ar: command not found
> /home/thomas/projets/buildroot/output/build/libxmlrpc-1.39.10/
> common.mk:112: recipe for target 'libxmlrpc_util.a' failed
>

Ok, so that must be why in the first version of the patch I included the
following:

-LIBXMLRPC_MAKE_OPTS = $(LIBXMLRPC_STATIC_OPTS)
+LIBXMLRPC_MAKE_OPTS = $(LIBXMLRPC_STATIC_OPTS) AR="$(TARGET_AR)"
RANLIB="$(TARGET_RANLIB)"

But since you questioned me about it and couldn't remember the cause and
I got it to compile without any problem I removed it from v2.
Yet another reason to send these patches sooner rather than later!

Could you please rebase your patch on top of the current next branch,
> and test it with the following configuration:
>
> BR2_arm=y
> BR2_cortex_a9=y
> BR2_ARM_ENABLE_VFP=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/t
> oolchains/tarballs/br-arm-cortex-a9-glibc-2016.08-613-ge98b4dd.tar.bz2"
> BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_8=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_INIT_NONE=y
> BR2_SYSTEM_BIN_SH_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> BR2_PACKAGE_LIBXMLRPC=y
> # BR2_TARGET_ROOTFS_TAR is not set
>
>
If I don't add AR=$(TARGET_AR) to LIBXMLRPC_MAKE_OPTS,
compilation fails as you've already shown. If I add patch above defining AR
and
RANLIB, compiles succesfully, but installation to staging fails because of
ranlib:

 arm-buildroot-linux-gnueabihf-ranlib /tmp/buildroot/output/host/
usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libxmlrpc_util.a
/bin/sh: line 3: arm-buildroot-linux-gnueabihf-ranlib: command not found

I don't know how to solve this, though, my expectation was that adding
RANLIB="$(TARGET_RANLIB)" to MAKE_OPTS would solve that :/

I'm sending v3 patch with these changes, though it still won't install...

Best regards

-- 
?lvaro G?mez Machado
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161115/488ab373/attachment.html>
