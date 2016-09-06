From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Sep 2016 23:37:14 +0200
Subject: [Buildroot] [PATCH] package/socat: fix build issue
In-Reply-To: <1472415533-19764-1-git-send-email-romain.naour@gmail.com>
References: <1472415533-19764-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160906233714.0e9fa04a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 28 Aug 2016 22:18:53 +0200, Romain Naour wrote:

> diff --git a/package/socat/0003-compat-set-NETDB_INTERNAL.patch b/package/socat/0003-compat-set-NETDB_INTERNAL.patch
> new file mode 100644
> index 0000000..da31073
> --- /dev/null
> +++ b/package/socat/0003-compat-set-NETDB_INTERNAL.patch
> @@ -0,0 +1,35 @@
> +From e7804d1750652e39c7a5803d360b29b2637a695f Mon Sep 17 00:00:00 2001
> +From: Romain Naour <romain.naour@gmail.com>
> +Date: Sun, 28 Aug 2016 21:04:01 +0200
> +Subject: [PATCH] compat: set NETDB_INTERNAL
> +
> +Musl doesn't provide NETDB_INTERNAL which is defined in resolv/netdb.h
> +in Glibc [1].
> +
> +Set NETDB_INTERNAL to -1 locally if not already defined.
> +Based on [2].
> +
> +[1] https://sourceware.org/git/?p=glibc.git;a=blob;f=resolv/netdb.h;h=3aba530932c7a62a4f23e3193e9186da677f552b;hb=fdfc9260b61d3d72541f18104d24c7bcb0ce5ca2#l74
> +[2] http://git.alpinelinux.org/cgit/aports/tree/main/socat/netdb-internal.patch?id=5a45173b50892cb634197c30b3506ebff98d3b7d
> +
> +Signed-off-by: Romain Naour <romain.naour@gmail.com>
> +---
> + compat.h | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/compat.h b/compat.h
> +index 19a929f..4f5ee6d 100644
> +--- a/compat.h
> ++++ b/compat.h
> +@@ -666,6 +666,8 @@ typedef int sig_atomic_t;
> + 
> + #if !defined(NETDB_INTERNAL) && defined(h_NETDB_INTERNAL)
> + #  define NETDB_INTERNAL h_NETDB_INTERNAL
> ++#elif !defined(NETDB_INTERNAL)
> ++#  define NETDB_INTERNAL (-1)
> + #endif

I am not a big fan of this solution, as it's really a hack: musl will
never set h_errno to NETDB_INTERNAL, so it's a bit weird to define it
to -1.

But maybe that's the easiest solution. Have you tried talking with
upstream about this?

> ++/* TUNSETIFF flags from if_tun.h kernel header */
> ++#define IFF_TUN		0x0001
> ++#define IFF_TAP		0x0002
> ++#define IFF_NO_PI	0x1000
> ++
> ++#define TUNSETIFF	_IOW('T', 202, int)

I know doing this is what the musl developers recommend, but it is
_really_ silly that we have to duplicate stuff from the kernel headers,
while the kernel headers (and specifically their uapi part) are part of
the toolchain headers... precisely for the purpose of allowing
userspace to use the types/definitions of the kernel to userspace
interface.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
