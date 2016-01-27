From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Wed, 27 Jan 2016 15:38:58 +1100
Subject: [Buildroot] PowerPC64 toolchain not building
In-Reply-To: <20160124213607.6e3b1257@free-electrons.com>
References: <20160123150731.1c1db4b0@free-electrons.com>
 <20160124191236.GQ17143@waldemar-brodkorb.de>
 <20160124213607.6e3b1257@free-electrons.com>
Message-ID: <20160127043858.GB6719@tungsten.ozlabs.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jan 24, 2016 at 09:36:07PM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, 24 Jan 2016 20:12:37 +0100, Waldemar Brodkorb wrote:
> 
> > Could you provide a config and full log? I couldn't reproduce it here.
> 
> Sure.
> 
> Here is an example:
> 
> BR2_powerpc64=y
> BR2_powerpc_power8=y
> BR2_BINUTILS_VERSION_2_25_X=y
> BR2_GCC_VERSION_5_X=y
> 
> (but it also failed with binutils 2.24 and gcc 4.9). Maybe the
> BR2_powerpc_power8=y part is the important part, I don't know.
> 
> The log looks like this:
> 
> libtool: compile:  /home/test/outputs/ppc64/build/host-gcc-final-5.3.0/build/./gcc/xgcc -B/home/test/outputs/ppc64/build/host-gcc-final-5.3.0/build/./gcc/ -B/home/test/outputs/ppc64/host
> /usr/powerpc64-buildroot-linux-gnu/bin/ -B/home/test/outputs/ppc64/host/usr/powerpc64-buildroot-linux-gnu/lib/ -isystem /home/test/outputs/ppc64/host/usr/powerpc64-buildroot-linux-gnu/in
> clude -isystem /home/test/outputs/ppc64/host/usr/powerpc64-buildroot-linux-gnu/sys-include -DHAVE_CONFIG_H -I../../../libatomic/config/powerpc -I../../../libatomic/config/posix -I../../.
> ./libatomic -I. -Wall -Werror -pthread -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -MT exch_16_.lo -MD -MP -MF .deps/exch_16_.lo.Ppo -DN=16 -c ../../../libatomic
> /exch_n.c  -fPIC -DPIC -o .libs/exch_16_.o
> [...]
> /tmp/ccQDkG0a.s: Assembler messages:
> /tmp/ccQDkG0a.s:19: Error: operand out of domain (7 is not a multiple of 2)
> make[6]: *** [exch_16_.lo] Error 1
> make[6]: *** Waiting for unfinished jobs....
> [...]
> make[5]: *** [all-recursive] Error 1
> make[4]: *** [all] Error 2
> make[3]: *** [all-target-libatomic] Error 2
> make[2]: *** [all] Error 2
> make[1]: *** [/home/test/outputs/ppc64/build/host-gcc-final-5.3.0/.stamp_built] Error 2
> make: *** [_all] Error 2
> 
> Thomas

Hi Thomas,

I have a bit of experience with buildroot on PowerPC64 so I also attempted to
replicate this, but I could not. I don't know the rest of your config but I
did match the values you posted above. An operand error like that could be
related to the specific architecture version the assembler is expecting, so
changing the "target architecture variant" is probably worth trying (try
"generic").

If your buildroot is up to date, and you've done a completely clean build
(either without ccache or after clearing ccache's cache), and this still happens
then I'd be happy to try replicating your build more closely.

If you can get at the content of the temporary file it's failing on I'd be
happy to take a look at the assembly causing the error. Maybe it will provide a
clue :-)

Cheers,
Sam.
