From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Sep 2016 17:42:56 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-09-04
In-Reply-To: <CAAEAJfCmiL6T=P=s_2UwVAk4BxxjJCaxqqdDsjnN3UD_809MGQ@mail.gmail.com>
References: <20160905063032.D7B78102B17@stock.ovh.net>
 <CAAEAJfCmiL6T=P=s_2UwVAk4BxxjJCaxqqdDsjnN3UD_809MGQ@mail.gmail.com>
Message-ID: <20160913174256.3c9eb965@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 5 Sep 2016 16:15:47 -0300, Ezequiel Garcia wrote:

> Tried to tackle this one, but it seems the problem is with the
> external toolchain. Let me post the error here to make the
> discussion easier:
> 
> In file included from
> /home/test/autobuild/run/instance-0/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/endian.h:60:0,
>                  from
> /home/test/autobuild/run/instance-0/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/bits/waitstatus.h:64,
>                  from
> /home/test/autobuild/run/instance-0/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/stdlib.h:42,
>                  from t/../flist.h:4,
>                  from t/btrace2fio.c:9:
> /home/test/autobuild/run/instance-0/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/bits/byteswap.h:
> In function 'main':
> /home/test/autobuild/run/instance-0/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/bits/byteswap.h:46:10:
> fatal error: You must enable NEON instructions (e.g.
> -mfloat-abi=softfp -mfpu=neon) to use these intrinsics.
>    return __builtin_bswap32 (__bsx);
>           ^~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[1]: *** [t/btrace2fio.o] Error 1
> 
> AFAICS, the code doesn't directly use NEON intrinsics,
> so it's not fio's fault. After some digging, I found
> a gcc upstream report [1]. Quoting:
> 
> ""
> Note that `NEON` isn't enabled and there's no direct use
> of NEON instructions/intrinsics in the code so the NEON
> instructions must have been added by the optimizer.
> Seemingly subtle change can make the error disappear.
> ""
> 
> Which is exaclty what I'm seeing here. The issue is fixed in gcc v6.2.
> 
> [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=71056

Thanks for the investigation! The problematic toolchain is indeed based
on gcc 6.1, affected by the issue. We've updated to gcc 6.2 recently,
so I'll try to re-build all the toolchains in the near future, which
should help getting rid of this problem.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
