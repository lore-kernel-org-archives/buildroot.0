From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Mar 2016 13:41:41 +0100
Subject: [Buildroot] [PATCH 1/1] package/kodi: disable on mips
In-Reply-To: <1457255845-20770-1-git-send-email-bernd.kuhls@t-online.de>
References: <1457255845-20770-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160306134141.7fedbb85@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

On Sun,  6 Mar 2016 10:17:25 +0100, Bernd Kuhls wrote:
> Due to the addition of the BR2_TOOLCHAIN_HAS_SYNC_8 dependency, then
> there is no longer a need to have (BR2_mipsel &&
> BR2_TOOLCHAIN_USES_GLIBC), since MIPS doesn't provide the 8 byte
> __sync_*() intrinsics, and therefore BR2_TOOLCHAIN_HAS_SYNC_8 is false
> on MIPS.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/kodi/Config.in b/package/kodi/Config.in
> index bd40ac3..950d5f9 100644
> --- a/package/kodi/Config.in
> +++ b/package/kodi/Config.in
> @@ -1,6 +1,6 @@
>  config BR2_PACKAGE_KODI_ARCH_SUPPORTS
>  	bool
> -	default y if (BR2_arm || (BR2_mipsel && BR2_TOOLCHAIN_USES_GLIBC) || BR2_i386 || BR2_x86_64) \
> +	default y if (BR2_arm || BR2_i386 || BR2_x86_64) \
>  		&& BR2_PACKAGE_BOOST_ARCH_SUPPORTS \
>  		&& BR2_TOOLCHAIN_HAS_SYNC_8

In fact, I think this is still not good. Why would Kodi have explicit
support for MIPS, if in practice you couldn't build it for MIPS ?

I think the answer lies in the fact that Kodi does not always use the
__sync*() atomic intrinsics. If you look at xbmc/threads/Atomics.cpp,
there are some hand-written atomic operations for various architectures.

So in fact, for some architectures/variants, Kodi is using the compiler
__sync and/or __atomic intrinsics, but for some other
architectures/variants, it does not use them and use its own
implementation instead. This is probably what allows to build on MIPS,
for example. And maybe what allows to build on i586.

Bottom line: this BR2_TOOLCHAIN_HAS_SYNC_8 dependency is wrong, and
some more investigation is needed to understand the combinations of
architectures for which Kodi has its own atomic operations vs. the
combinations for which it relies on __sync/__atomic built-ins.

Could you look into this? This will probably require building Kodi on a
number of architecture variants, and also an investigation of the
atomic code to understand what's going on.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
