From: =?UTF-8?B?5q+b5pmX?= <han_mao@c-sky.com>
Date: Mon, 17 Feb 2020 11:43:36 +0800
Subject: [Buildroot] =?utf-8?b?5Zue5aSN77yaUmU6ICBbUEFUQ0ggMS8yXSBwYWNr?=
 =?utf-8?q?age/toolchain-external=3A_ensure_ARCH=5FLIB=5FDIR_exist?=
In-Reply-To: <20200126153443.GP32369@scaer>
References: <1577937441-18703-1-git-send-email-han_mao@c-sky.com>
 <CAAXf6LUVA4QkSmz8OaSOyqzKaw--eD5r0zAD+zONfyGROv1MZw@mail.gmail.com>
 <20200113033451.GA15150@vmh-VirtualBox>
 <CAAXf6LWZZKCW=g=ReXz00hLJSiBw6sJfsmSxu0=Q_J4FVda32g@mail.gmail.com>
 <20200117023547.GA12999@vmh-VirtualBox>
 <CAAXf6LV-f9o_9oY4+Me4qHRJeQhCWA75H1GOEYMoRPu5j4m-Jg@mail.gmail.com>,
 <20200126153443.GP32369@scaer>
Message-ID: <5156c5fd-b2ef-4763-9769-321fad19341c.han_mao@c-sky.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2020-01-24 16:00 +0100, Thomas De Schampheleire spake thusly: > El vie., 17 ene. 2020 a las 3:35, Mao Han () escribi?: [--SNIP--] > > There is another patch in the same thread: > > [PATCH 2/2] toolchain: Get ld.so name if available > > http://buildroot-busybox.2317881.n4.nabble.com/PATCH-1-2-package-toolchain-external-ensure-ARCH-LIB-DIR-exist-td243604.html#a244193 > > Tried to get the corresponding ld.so name with certain configuration. > Thanks. Using this patch '[PATCH 2/2] toolchain: Get ld.so name if > available' I actually can compile correctly. > So, PATCH 1/2 is not actually needed. >  > Do you agree that only PATCH 2/2 is required? > If so I will perform a more thorough review of that patch.

We have released a T-HEAD extension RISC-V toolchain on our website recently:
https://occ.t-head.cn/community/download_detail?id=616310306771042304
V1.6 riscv64-linux-x86_64-20200205.tar
Download link:
https://cop-image-prod.oss-cn-hangzhou.aliyuncs.com/resource/420257228264570880/1581248271301/riscv64-linux-x86_64-20200205.tar.gz
The PATCH 1/2 is intention to fix an issue cause by this toolchain, buildroot require some 
to modify to support the T-HEAD extension(appliy thead.patch)
and select: BR2_RISCV_ISA_CUSTOM_THEAD=y
The problem can be reproduced with this toolchain and configuration:

>>> toolchain-external-custom  Installing to staging directory
/usr/bin/install -D -m 0755 /home/vmh/workspace/bt/buildroot/output/build/toolchain-external-custom/toolchain-wrapper /home/vmh/workspace/bt/buildroot/output/host/bin/toolchain-wrapper
ln:  failed to create symbolic link'/home/vmh/workspace/bt/buildroot/output/host/riscv64-buildroot-linux-gnu/sysroot/lib64xthead/lp64d':  No such file or directory 
?ln:  failed to create symbolic link'/home/vmh/workspace/bt/buildroot/output/host/riscv64-buildroot-linux-gnu/sysroot/usr/lib64xthead/lp64d':  No such file or directory
package/pkg-generic.mk:297: recipe for target '/home/vmh/workspace/bt/buildroot/output/build/toolchain-external-custom/.stamp_staging_installed' failed
make: *** [/home/vmh/workspace/bt/buildroot/output/build/toolchain-external-custom/.stamp_staging_installed] Error 1

On 2020-01-26 23:32 +0000, Yann E. MORIN spake thusly:
 > However, the fix you provided should be explained a bit more, because
> this is touching the core infrastructure of Buildroot, and the code
> touching the toolchain is always a bit hairy and fragile to manage...
Agree. I can add some explanation like:
This fix first tries to find the corresponding libc under ARCH_LIB_DIR; and
 then extract the interpreter name with readelf and text processing cmd.
Finally, copy the interpreter specified by SPECIFIC_LD_NAME, and ignore
other ld*so under sysroot/lib.

 >  As far as I understand this, you are trying to extract the interpreter.
>  This is overly complex, and can be done with a single sed invocation:
> 
>  $(TOOLCHAIN_EXTERNAL_READELF) -l $${ARCH_SYSROOT_DIR}$${ARCH_LIB_DIR}/libc*.so \
>  |sed -r -e '/Requesting program interpreter/!d; s:^.*/([^[:space:]]+)\]$$:\1:'
> 
OK, the sed invocation looks much simpler. Tested with my enviroment
and seems work fine.

 >  But then, we should probably do that for the internal toolchain, too?
>  This way we can actually cimplify the conditional block, above.
The internal toolchain seems don't use these routines? I did't see
any debug print when I was verifying my patch with internal toolchain configuration.

Thanks,
Mao Han
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200217/bab964dc/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: thead.patch
Type: application/octet-stream
Size: 924 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200217/bab964dc/attachment.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: qemu_riscv64_virt_defconfig
Type: application/octet-stream
Size: 799 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200217/bab964dc/attachment-0001.obj>
