From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Dec 2019 10:12:37 +0100
Subject: [Buildroot] [PATCH] package/elf2flt: add patch to support
 SOURCE_DATE_EPOCH
In-Reply-To: <20191227172233.1328097-1-thomas.petazzoni@bootlin.com>
References: <20191227172233.1328097-1-thomas.petazzoni@bootlin.com>
Message-ID: <20191229091237.GT26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-12-27 18:22 +0100, Thomas Petazzoni spake thusly:
> The bFLT binaries embed a build_date field in their header, which
> doesn't work well with reproducible builds. This commit modifies
> elf2flt to support the SOURCE_DATE_EPOCH environment variable.

I was about to apply this, but upstream has some comments, and I even
added my own.

Consequently, I've marked it as changes requested, and I shall also send
a fix to our toolchain wrapper. ;-)

Regards,
Yann E. MORIN.

> With this commit in place:
> 
> $ hexdump -C output/target/usr/bin/4th | head
> 00000000  62 46 4c 54 00 00 00 04  00 00 00 45 00 00 ca 40  |bFLT.......E...@|
> 00000010  00 01 56 28 00 01 9c 10  00 00 10 00 00 01 56 28  |..V(..........V(|
> 00000020  00 00 05 14 00 00 00 01  5e 06 32 e5 00 00 00 00  |........^.2.....|
> 
> $ hexdump -C output/target/sbin/hdparm | head
> 00000000  62 46 4c 54 00 00 00 04  00 00 00 45 00 01 37 54  |bFLT.......E..7T|
> 00000010  00 02 0b b0 00 02 79 30  00 00 10 00 00 02 0b b0  |......y0........|
> 00000020  00 00 07 4c 00 00 00 01  5e 06 32 e5 00 00 00 00  |...L....^.2.....|
> 
> So the time encoded is 5e0632e5 for both binaries, which looks
> good. And indeed, it matches the time indicated by SOURCE_DATE_EPOCH:
> 
> $ make VARS=SOURCE_DATE_EPOCH printvars
> SOURCE_DATE_EPOCH=1577464549
> 
> $ python -c "print hex(1577464549)"
> 0x5e0632e5
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/194/194d52402a3de58fc5a502b35b42faa965b40153/diffoscope-results.txt
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  ....c-add-support-for-SOURCE_DATE_EPOCH.patch | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 package/elf2flt/0003-elf2flt.c-add-support-for-SOURCE_DATE_EPOCH.patch
> 
> diff --git a/package/elf2flt/0003-elf2flt.c-add-support-for-SOURCE_DATE_EPOCH.patch b/package/elf2flt/0003-elf2flt.c-add-support-for-SOURCE_DATE_EPOCH.patch
> new file mode 100644
> index 0000000000..d25f584879
> --- /dev/null
> +++ b/package/elf2flt/0003-elf2flt.c-add-support-for-SOURCE_DATE_EPOCH.patch
> @@ -0,0 +1,67 @@
> +From 0adc7d305055eb88cfb46a203ae39d4d1c82d47e Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +Date: Fri, 27 Dec 2019 16:40:42 +0100
> +Subject: [PATCH] elf2flt.c: add support for SOURCE_DATE_EPOCH
> +
> +The bFLT header has a "build_date" field which contains the date/time
> +at which the bFLT file was created. Unfortunately, this breaks
> +reproducible builds as two identical builds done at different times
> +will produce different results.
> +
> +For example, on a bFLT binary, diffoscope reports the following
> +change:
> +
> +  00000000: 6246 4c54 0000 0004 0000 0045 0001 48d4  bFLT.......E..H.
> +  00000010: 0002 85a0 0002 fe50 0000 1000 0002 85a0  .......P........
> + -00000020: 0000 0757 0000 0001 5e05 742e 0000 0000  ...W....^.t.....
> + +00000020: 0000 0757 0000 0001 5e05 a5c2 0000 0000  ...W....^.......
> +
> +In order to address this, this commit adds support for the
> +SOURCE_DATE_EPOCH environment variable, which is standardized by the
> +reproducible-builds.org group at
> +https://reproducible-builds.org/specs/source-date-epoch/.
> +
> +We simply use the time from the SOURCE_DATE_EPOCH variable (which
> +contains the number of seconds since Epoch) when SOURCE_DATE_EPOCH is
> +available in the environment, and otherwise fallback to the existing
> +logic that takes the current time using time().
> +
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +Upstream: https://github.com/uclinux-dev/elf2flt/pull/13
> +---
> + elf2flt.c | 12 +++++++++++-
> + 1 file changed, 11 insertions(+), 1 deletion(-)
> +
> +diff --git a/elf2flt.c b/elf2flt.c
> +index 8973cef..cc8a1e0 100644
> +--- a/elf2flt.c
> ++++ b/elf2flt.c
> +@@ -1721,6 +1721,9 @@ int main(int argc, char *argv[])
> + 
> +   struct flat_hdr hdr;
> + 
> ++  char *sde;
> ++  time_t t;
> ++
> +   elf2flt_progname = argv[0];
> +   xmalloc_set_program_name(elf2flt_progname);
> + 
> +@@ -1948,7 +1951,14 @@ int main(int argc, char *argv[])
> + 	  | (pic_with_got ? FLAT_FLAG_GOTPIC : 0)
> + 	  | (docompress ? (docompress == 2 ? FLAT_FLAG_GZDATA : FLAT_FLAG_GZIP) : 0)
> + 	  );
> +-  hdr.build_date = htonl((uint32_t)time(NULL));
> ++
> ++  sde = getenv("SOURCE_DATE_EPOCH");
> ++  if (sde)
> ++      t = (time_t) strtoul(sde, NULL, 10);
> ++  else
> ++      t = time(NULL);
> ++  hdr.build_date = htonl((uint32_t)t);
> ++
> +   memset(hdr.filler, 0x00, sizeof(hdr.filler));
> + 
> +   for (i=0; i<reloc_len; i++) reloc[i] = htonl(reloc[i]);
> +-- 
> +2.24.1
> +
> -- 
> 2.24.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
