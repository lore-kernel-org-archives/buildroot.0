From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Oct 2016 15:49:07 +0200
Subject: [Buildroot] [PATCH] mpv: bump to version 0.21.0
In-Reply-To: <1477667042-1274-1-git-send-email-gustavo@zacarias.com.ar>
References: <1477667042-1274-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20161029154907.1a74996a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 28 Oct 2016 12:04:02 -0300, Gustavo Zacarias wrote:
> It now requires gcc 4.9+ with arch atomics for stdatomic support
> (https://gcc.gnu.org/wiki/C11Status) or alternatively
> BR2_TOOLCHAIN_HAS_SYNC_1 for emulation fallback.
> 
> Fixes:
> http://autobuild.buildroot.net/results/0b7/0b7b42a72ac2bef2dd476e23a71f87adad6690f6/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

This one I'd like to have a closer look. Indeed, I started
investigating the build issue at
http://autobuild.buildroot.net/results/0b7/0b7b42a72ac2bef2dd476e23a71f87adad6690f6/,
and the problem was that we couldn't express the atomic dependency
properly with our current Config.in options.

Indeed, the problem of
http://autobuild.buildroot.net/results/0b7/0b7b42a72ac2bef2dd476e23a71f87adad6690f6/
is that it is using 8 bytes atomic operations. On ARM < v7, such atomic
operations require help from the kernel. Unfortunately, the gcc code in
gcc < 6 is bogus and uses the internal _write() glibc symbol, which
fails with uclibc or musl.

We already handle this situation for the 8 bytes sync atomic operation
using the BR2_TOOLCHAIN_ARM_HAS_SYNC_8 option. But we don't handle it
for the 8 bytes atomic operation.

So, maybe things have changed between mpv 0.20 and 0.21 in terms of
atomic handling. But if it hasn't changed, then I'm not sure your patch
is correct.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
