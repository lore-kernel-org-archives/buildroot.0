From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Date: Mon, 18 Nov 2019 12:01:56 +0000
Subject: [Buildroot] [PATCH] toolchain-external: Introduce gdb_copy
 option
In-Reply-To: <20191118091144.1407b93b@windsurf.home>
References: <20191118080047.22036-1-Evgeniy.Didin@synopsys.com>,
 <20191118091144.1407b93b@windsurf.home>
Message-ID: <DM6PR12MB2876311450E0AA31BC3CA84CD94D0@DM6PR12MB2876.namprd12.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Using prebuilt toolchain besides the speedup of build has another advantage - in most cases that toolchain was well tested
and guaranteed to work stable. And without copything the prebuilt GDB debugger to target we need to build it from sources,
which version is defined in package/gdb and most likely is different to prebuilt toolchain version. gdbserver ver. XXX may not be
able to work with GDB ver. YYY.

In our case we have dynamically linked minimalistic GDB with only Libc components dependencies:
--------------------------------8<--------------------------------
 $ arc-linux-objdump  -hx gdb | grep  NEEDED
  NEEDED               libdl.so.2
  NEEDED               libstdc++.so.6
  NEEDED               libm.so.6
  NEEDED               libgcc_s.so.1
  NEEDED               libc.so.6
-------------------------------->8--------------------------------

In linaro/arm/mips toolchains there is no prebuilt GDB debugger,
so I guess we should add additional  conditional "depends on BR2_arc".
Will it be acceptable?


Best regards,
Evgeniy Didin

________________________________
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Sent: Monday, November 18, 2019 11:11 AM
To: Evgeniy Didin <didin@synopsys.com>
Cc: buildroot at busybox.net <buildroot@busybox.net>; arc-buildroot at synopsys.com <arc-buildroot@synopsys.com>
Subject: Re: [PATCH] toolchain-external: Introduce gdb_copy option

Hello,

On Mon, 18 Nov 2019 11:00:47 +0300
Evgeniy Didin <Evgeniy.Didin@synopsys.com> wrote:

> Some prebuilt toolchains provide full gdb debugger for a target as
> well as gdbserver. Lets add separate option for gdb the same way as
> it was done for gdbserver. With this change there will be no need
> to build gdb package, this will reduce build time.
>
> Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: arc-buildroot at synopsys.com

Thanks for your contribution and proposal. However, I'm wondering if
this really works properly in the general case. Indeed, gdb is often
linked against additional libraries: ncurses, expat, python, zlib,
lzma, etc.

Here you are only copying the gdb binary itself, but not the libraries
it might depend on. But even if you were copying those libraries, they
would potentially conflict with the ones built by Buildroot.

So I'm not sure if there's really a good way to re-use a gdb built by
an external toolchain.

In your specific case, is the gdb binary statically linked ? Or at
least statically linked against all libraries except the C library ?

Best regards,

Thomas
--
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://urldefense.proofpoint.com/v2/url?u=https-3A__bootlin.com&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=vQk-RIbjwN0zvlwiMSpq3LYUTNf7Gqc4ujhosYITtAw&m=SXU3CLEFC_hZpwD_KK6WpxW8OHqUqDky3Xlk5lP1YnE&s=mzhhB4FhsPlQsOUtfTztvQS-aUwyPOSc36awKfu1hpU&e=
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191118/ca398614/attachment.html>
