From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Mar 2018 16:52:25 +0100
Subject: [Buildroot] [PATCH 1/1] libaio: add mips64 to the supported
 architecture for libaio
In-Reply-To: <20180228173651.65873-1-charles.hardin@storagecraft.com>
References: <20180228173651.65873-1-charles.hardin@storagecraft.com>
Message-ID: <20180303165225.778c78da@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Charles,

On Wed, 28 Feb 2018 09:36:51 -0800, charles.hardin at storagecraft.com
wrote:
> From: Charles Hardin <charles.hardin@storagecraft.com>
> 
> The required support is available for libaio on mips64
> architectures - or at least the Cavium Octeon at least and
> the linux kernel running on it.
> 
> Signed-off-by: Charles Hardin <charles.hardin@storagecraft.com>

Thanks for this patch. A few comments below, though.

> diff --git a/package/libaio/0004-fix-mips64-padding.patch b/package/libaio/0004-fix-mips64-padding.patch
> new file mode 100644
> index 0000000000..d88d6e6ab2
> --- /dev/null
> +++ b/package/libaio/0004-fix-mips64-padding.patch

This patch needs a description and Signed-off-by.

> @@ -0,0 +1,43 @@
> +diff -Naur libaio-0.3.110.orig/src/libaio.h libaio-0.3.110/src/libaio.h
> +--- libaio-0.3.110.orig/src/libaio.h	2014-01-24 08:01:02.000000000 -0800
> ++++ libaio-0.3.110/src/libaio.h	2018-02-27 20:06:36.000000000 -0800
> +@@ -51,7 +51,8 @@
> + 
> + /* little endian, 32 bits */
> + #if defined(__i386__) || (defined(__arm__) && !defined(__ARMEB__)) || \
> +-    defined(__sh__) || defined(__bfin__) || defined(__MIPSEL__) || \
> ++    defined(__sh__) || defined(__bfin__) || \
> ++    (defined(__mips__) && defined(__MIPSEL__)) || \
> +     defined(__cris__)

All those architecture conditions are really annoying. What about
replacing this with:

#if (__BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__) && (__LONG_WIDTH__ == 32)
...
#elif (__BYTE_ORDER__ == __ORDER_BIG_ENDIAN__) && (__LONG_WIDTH__ == 32)
...
#elif (__BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__) && (__LONG_WIDTH__ == 64)
...
#elif (__BYTE_ORDER__ == __ORDER_BIG_ENDIAN__) && (__LONG_WIDTH__ == 64)
...
#endif

But well, upstream libaio seems to be dead, so perhaps your small patch
is good enough. Just need a description + Signed-off-by.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
