From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Mon, 5 Sep 2016 16:15:47 -0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2016-09-04
In-Reply-To: <20160905063032.D7B78102B17@stock.ovh.net>
References: <20160905063032.D7B78102B17@stock.ovh.net>
Message-ID: <CAAEAJfCmiL6T=P=s_2UwVAk4BxxjJCaxqqdDsjnN3UD_809MGQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On 5 September 2016 at 03:30, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
[..]
>          arm |                   fio-fio-2.13 | NOK | http://autobuild.buildroot.net/results/6b318983a1a318d30acb9c25f17065fbc4a0302a

Tried to tackle this one, but it seems the problem is with the
external toolchain. Let me post the error here to make the
discussion easier:

In file included from
/home/test/autobuild/run/instance-0/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/endian.h:60:0,
                 from
/home/test/autobuild/run/instance-0/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/bits/waitstatus.h:64,
                 from
/home/test/autobuild/run/instance-0/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/stdlib.h:42,
                 from t/../flist.h:4,
                 from t/btrace2fio.c:9:
/home/test/autobuild/run/instance-0/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/bits/byteswap.h:
In function 'main':
/home/test/autobuild/run/instance-0/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/bits/byteswap.h:46:10:
fatal error: You must enable NEON instructions (e.g.
-mfloat-abi=softfp -mfpu=neon) to use these intrinsics.
   return __builtin_bswap32 (__bsx);
          ^~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [t/btrace2fio.o] Error 1

AFAICS, the code doesn't directly use NEON intrinsics,
so it's not fio's fault. After some digging, I found
a gcc upstream report [1]. Quoting:

""
Note that `NEON` isn't enabled and there's no direct use
of NEON instructions/intrinsics in the code so the NEON
instructions must have been added by the optimizer.
Seemingly subtle change can make the error disappear.
""

Which is exaclty what I'm seeing here. The issue is fixed in gcc v6.2.

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=71056
-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar
