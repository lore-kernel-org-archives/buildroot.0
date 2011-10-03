From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 3 Oct 2011 09:21:59 +0200
Subject: [Buildroot] [PATCH 2/9] toolchain-external: allow specifying
 extra external libraries
In-Reply-To: <201110022345.08800.yann.morin.1998@anciens.enib.fr>
References: <cover.1317583191.git.thomas.petazzoni@free-electrons.com>
 <59099791edd7c503508d17a882d0b97ead12fcf7.1317583191.git.thomas.petazzoni@free-electrons.com>
 <201110022345.08800.yann.morin.1998@anciens.enib.fr>
Message-ID: <CAAXf6LXA6zU1Y7vXEwh1_h=x_jRz1q0f_nA+21u6H9JcVWhJoQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

(now properly to the list)
Hi Yann,

On Sun, Oct 2, 2011 at 11:45 PM, Yann E. MORIN
<yann.morin.1998@anciens.enib.fr> wrote:
> Thomas?, All,
>
> On Sunday 02 October 2011 21:20:10 Thomas Petazzoni wrote:
>> From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
>>
>> Custom toolchains may provide extra libraries that need to be copied to the
>> target. This patch adds a configuration option for this.
>
> What kind of libraries are we talking about here? Things such as libz.so,
> or like libnss_*.so ?
>
> There are a few cases I can think of:
>
> ?- the library/ies are available as standard buildroot package/s
> ? (eg. libz.so)
> ? --> then that's a no-no, or there would be conflicts with buildroot's
> ? ? ? own builds
>
> ?- the library/ies is/are not part of buildroot, and but is/are used by
> ? a buildroot package (eg. libwhatever.so)
> ? --> then we should also copy the headers
>
> ?- the library/ies is/are system libs from the toolchain (eg. libnss_*.so)
> ? --> the library/ies should be copied by a generic toolchain hook, which
> ? ? ? works for all kind of toolchain backends (internal, external, or
> ? ? ? ct-ng)
>
> So, I'm not really sure we should allow that without further explanations.
> (and there was no more in Thomas' original post on the suject...)

I should have been more verbose.

uClibc supports the 'backtrace' functionality. I'm not sure whether it
already is in 0.9.32, but it certainly is in the repository. When you
enable the functionality in the uClibc configuration, a library
libubacktrace.so is generated. Application code that uses the
backtrace() or backtrace_symbols() functions, need to link with this
library and thus it needs to be copied from the toolchain.

The appropriate header is located next to the other toolchain headers,
which are already copied by default:
usr/powerpc-linux/sysroot/usr/include/execinfo.h

Depending on the uClibc configuration, less or more libraries may need
to be copied. I can imagine that a similar thing is needed for other C
libraries. Hence this generic option I added.

Given this background information, how do you feel about this patch?

Thanks,
Thomas
