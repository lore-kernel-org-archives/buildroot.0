From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 6 Aug 2013 21:33:34 +0200
Subject: [Buildroot] AVR32 toolchain build failure
In-Reply-To: <20130806195402.2f3f94e7@skate>
References: <CAAXf6LUhgOkHgj=cRWnkR8tPhAAjT6BhXFvXTBvC5pHfTZ=vww@mail.gmail.com>
 <20130806195402.2f3f94e7@skate>
Message-ID: <CAAXf6LU0oihr6qLh4KA=+fKYWEbk-iOpwvsmo7AWPSjyC7_=KA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Aug 6, 2013 at 7:54 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Mon, 5 Aug 2013 14:01:51 +0200, Thomas De Schampheleire wrote:
>
>> I was looking at an autobuild failure on AVR32 and tried reproducing
>> it locally. Unfortunately, the AVR32 toolchain that was configured was
>> pre-built on a 64-bit machine, which I don't have. Hence, the
>> configured toolchain was not usable.
>>
>> Then I tried building my own AVR32 toolchain with the internal
>> backend, see config attached. Unfortunately, this failed as well:
>
> I just tested here on my Ubuntu 13.04 64 bits machine, with the latest
> Buildroot Git, and the atngw100_defconfig (AVR32) could build a
> toolchain properly. This toolchain however seems to have a problem as
> it is not able to link the kernel. This specific regression was, I
> think, introduced by my patches converting the internal backend to
> proper packages. I'll try to investigate this one.

I verified the atngw100_defconfig, and the toolchain also builds fine here.
Comparing the configuration with my failing setup, I see that I had
enabled C++ support, wchar, largefile and ipv6. Presumably, it's the
C++ support that is the problem.

I'll verify by enabling just that without wchar, largefile and ipv6.

FYI: I also see a linking problem on the kernel:
lib/lib.a(vsprintf.o): In function `pointer':
vsprintf.c:(.text+0x17e0): relocation truncated to fit:
R_AVR32_16N_PCREL against symbol `_ctype' defined in .text section in
lib/lib.a(ctype.o)
make[1]: *** [vmlinux] Error 1

Best regards,
Thomas
