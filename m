From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 7 Mar 2019 23:19:21 +0100
Subject: [Buildroot] [PATCH next] package/uboot-tools: fix build with
 gcc 4.7
In-Reply-To: <20190213220038.21908-1-thomas.petazzoni@bootlin.com>
References: <20190213220038.21908-1-thomas.petazzoni@bootlin.com>
Message-ID: <a7ac8a42-5744-33df-c2f9-d340eb6722d1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Thomas,

On 13/02/2019 23:00, Thomas Petazzoni wrote:
> The last bump of uboot-tools to 2019.01 broke the build on old build
> machines that still use gcc 4.7 due to some C99 code that was added in
> lib/crc16.c.
> 
> This commit solves that by adding a small patch (submitted upstream)
> that avoids the C99 code.

 Upstream asked [1] to instead add -std=c99, so I've marked this as changes
requested as well.

 Regards,
 Arnout

[1] http://patchwork.ozlabs.org/patch/1041621/

> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/c88e4d94c21e247f6d190842dfa05ab797e8704d/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  ...004-lib-crc16-use-non-C99-loop-style.patch | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 package/uboot-tools/0004-lib-crc16-use-non-C99-loop-style.patch
> 
> diff --git a/package/uboot-tools/0004-lib-crc16-use-non-C99-loop-style.patch b/package/uboot-tools/0004-lib-crc16-use-non-C99-loop-style.patch
> new file mode 100644
> index 0000000000..1f86f8c099
> --- /dev/null
> +++ b/package/uboot-tools/0004-lib-crc16-use-non-C99-loop-style.patch
> @@ -0,0 +1,41 @@
> +From 17d603f2f3d8dcace5281b7bf5de0c6be61d0cc7 Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +Date: Wed, 13 Feb 2019 22:54:45 +0100
> +Subject: [PATCH] lib/crc16: use non-C99 loop style
> +
> +Commit 51c2345bd24837f9f67f16268da6dc71573f1325 ("Roll CRC16-CCITT
> +into the hash infrastructure") has modified the crc16 code by adding a
> +C99-style loop where the loop iterator is declared inside the for()
> +statement. This breaks the build with old compiler such as gcc 4.7,
> +that do not default to C99:
> +
> +./tools/../lib/crc16.c: In function 'crc16_ccitt':
> +./tools/../lib/crc16.c:70:2: error: 'for' loop initial declarations are only allowed in C99 mode
> +./tools/../lib/crc16.c:70:2: note: use option -std=c99 or -std=gnu99 to compile your code
> +
> +Switching to the regular coding style used in the rest of U-Boot
> +allows to fix this build issue.
> +
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + lib/crc16.c | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/lib/crc16.c b/lib/crc16.c
> +index f46ba727c9..89d2cff131 100644
> +--- a/lib/crc16.c
> ++++ b/lib/crc16.c
> +@@ -67,7 +67,9 @@ static const uint16_t crc16_tab[] = {
> + 
> + uint16_t crc16_ccitt(uint16_t cksum, const unsigned char *buf, int len)
> + {
> +-	for (int i = 0;  i < len;  i++)
> ++	int i;
> ++
> ++	for (i = 0;  i < len;  i++)
> + 		cksum = crc16_tab[((cksum>>8) ^ *buf++) & 0xff] ^ (cksum << 8);
> + 
> + 	return cksum;
> +-- 
> +2.20.1
> +
> 
