From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 06 Dec 2012 11:56:36 -0300
Subject: [Buildroot] buildroot-2012.11  openssh: Bad trap error
In-Reply-To: <50C06C77.7020509@shf.de>
References: <50C06C77.7020509@shf.de>
Message-ID: <50C0B224.2020007@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/06/2012 06:59 AM, Jan Schunke wrote:

> I am using buildroot-2012.11 on Powerpc 440 (Xilinx Virtex5) without FPU
> 
> when I boot I get:
> 
> ...
> Starting network...
> Generating RSA Key...
> [    5.527467] Bad trap at PC: 48063f20, SR: 2d000, vector=2010
> Trace/breakpoint trap
> Generating RSA Key...
> [    5.572257] Bad trap at PC: 48063f20, SR: 2d000, vector=2010
> Trace/breakpoint trap
> Generating DSA Key...
> THIS CAN TAKE A MINUTE OR TWO DEPENDING ON YOUR PROCESSOR!
> 
> [    5.594576] Bad trap at PC: 48063f20, SR: 2d000, vector=2010
> Trace/breakpoint trap
> Generating ECDSA Key...
> THIS CAN TAKE A MINUTE OR TWO DEPENDING ON YOUR PROCESSOR!
> 
> [    5.615732] Bad trap at PC: 48063f20, SR: 2d000, vector=2010
> Trace/breakpoint trap
> Starting sshd: [    5.940254] Bad trap at PC: 48063f20, SR: 2d000,
> vector=2010
> Trace/breakpoint trap
> OK
> ...
> 
> I can achieve a similar behaviour if I compile a program with -mhard-float.
> 
> So I guess for one of the following packages softfloat is not set correctly.
> 
> Maybe someone more competent can take a look into this.
> 
> When I roll back
> 
> openssh from 6.1p1  to 6.0p1
> openssl from 1.0.1c to 1.0.0j
> zlib    from 1.27   to 1.26
> 
> everything is fine.

Hi.
Ok, i managed to build a similar scenario as yours under qemu
(virtex-ml507 emulation).
With similar toolchain/versions/options i'm unable to hit the issue.
It's most likely that qemu is being too optimistic in the CPU emulation
department (handling the invalid opcodes for a 440 core).
Did you try switching just a single version?
I'm betting on openssl since it's got powerpc-specific optimizations
whereas zlib and openssh don't.
You could also try disabling the powerpc optimizations in
package/openssl/openssl.mk, just remove the block from ifeq
($(ARCH),powerpc) to the first endif (3 lines).
And let us know :)
Regards.
