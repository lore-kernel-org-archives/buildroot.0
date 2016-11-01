From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 1 Nov 2016 20:24:42 -0300
Subject: [Buildroot] [PATCH] mpv: bump to version 0.21.0
In-Reply-To: <20161029154907.1a74996a@free-electrons.com>
References: <1477667042-1274-1-git-send-email-gustavo@zacarias.com.ar>
 <20161029154907.1a74996a@free-electrons.com>
Message-ID: <daaf5ff1-56de-ea98-cfc4-941e5f574ded@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/10/16 10:49, Thomas Petazzoni wrote:

> Hello,
>
> On Fri, 28 Oct 2016 12:04:02 -0300, Gustavo Zacarias wrote:
>> It now requires gcc 4.9+ with arch atomics for stdatomic support
>> (https://gcc.gnu.org/wiki/C11Status) or alternatively
>> BR2_TOOLCHAIN_HAS_SYNC_1 for emulation fallback.
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/0b7/0b7b42a72ac2bef2dd476e23a71f87adad6690f6/
>>
>> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
>
> This one I'd like to have a closer look. Indeed, I started
> investigating the build issue at
> http://autobuild.buildroot.net/results/0b7/0b7b42a72ac2bef2dd476e23a71f87adad6690f6/,
> and the problem was that we couldn't express the atomic dependency
> properly with our current Config.in options.

Hi. Exactly.

> Indeed, the problem of
> http://autobuild.buildroot.net/results/0b7/0b7b42a72ac2bef2dd476e23a71f87adad6690f6/
> is that it is using 8 bytes atomic operations. On ARM < v7, such atomic
> operations require help from the kernel. Unfortunately, the gcc code in
> gcc < 6 is bogus and uses the internal _write() glibc symbol, which
> fails with uclibc or musl.

I've tested with several combinations, mostly "retro" m68k with/without 
atomics (real m68k vs coldfire) and ARM of course with default versions.

> We already handle this situation for the 8 bytes sync atomic operation
> using the BR2_TOOLCHAIN_ARM_HAS_SYNC_8 option. But we don't handle it
> for the 8 bytes atomic operation.
>
> So, maybe things have changed between mpv 0.20 and 0.21 in terms of
> atomic handling. But if it hasn't changed, then I'm not sure your patch
> is correct.

The situation changed with 0.21, that's the reason it's all in a single 
patch.
0.20 couldn't deal with the fallback 8-bit atomics and failed as you 
said with 64-bit, but 0.21 does deal with it.
I've not expressed the 64-bit requirement/possibility since 8-bit will 
general be present for 64-bit as well, hence i don't have a way to test it.
I've started the condition tests separately from the bump when i hit the 
same issue you mention, but bumping it made the fallback implementation 
without stdatomic buildable.
Regards.
