From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 14 Aug 2015 17:12:04 +0300
Subject: [Buildroot] [PATCH] [autobuild] package/setools: fix buid
 without wchar
In-Reply-To: <1439495681-7220-1-git-send-email-yann.morin.1998@free.fr>
References: <1439495681-7220-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150814141204.GB25261@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Thu, Aug 13, 2015 at 09:54:41PM +0200, Yann E. MORIN wrote:
> Fixes:
>     http://autobuild.buildroot.org/results/051/051a7f72ebadd56407700c22b57e942f08eb1c09/
>     http://autobuild.buildroot.org/results/a4b/a4b2a6f1920430af43c23239de17200e70951b3b/
>     ...
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Matt Weber <matthew.weber@rockwellcollins.com>
> Cc: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> ---
>  package/setools/0003-no-wchar-needed.patch | 45 ++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 package/setools/0003-no-wchar-needed.patch
> 
> diff --git a/package/setools/0003-no-wchar-needed.patch b/package/setools/0003-no-wchar-needed.patch
> new file mode 100644
> index 0000000..8b9ea9f
> --- /dev/null
> +++ b/package/setools/0003-no-wchar-needed.patch
> @@ -0,0 +1,45 @@
> +configure: do not use wchar_t in tests
> +
> +setools does not use widechars for itself, so should build on toolchains
> +missing widechars (uClibc).
> +
> +Unfortunately, one of the m4 macros does use wchar_t to check C99,
> +completely unrelated to widechar support, thus making it believe C99 is
> +not available in the compiler:
> +
> +    http://autobuild.buildroot.org/results/051/051a7f72ebadd56407700c22b57e942f08eb1c09/build-end.log
> +
> +    configure:4899: checking for /home/peko/autobuild/instance-1/output/host/usr/bin/powerpc-linux-gcc option to accept ISO C99
> +    [--skip test without flags--]
> +    configure:5048: /home/peko/autobuild/instance-1/output/host/usr/bin/powerpc-linux-gcc -std=gnu99 -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 conftest.c >&5
> +    conftest.c:69:9: error: unknown type name 'wchar_t'
> +       const wchar_t *name;
> +             ^
> +    conftest.c: In function 'main':
> +    conftest.c:146:5: warning: initialization from incompatible pointer type
> +         .name = L"Test wide string",
> +         ^
> +
> +Thus, just remove any widechar from the test.
> +
> +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +
> +diff -durN setools-3.3.8.orig/m4/c.m4 setools-3.3.8/m4/c.m4
> +--- setools-3.3.8.orig/m4/c.m4	2013-01-16 17:36:22.000000000 +0100
> ++++ setools-3.3.8/m4/c.m4	2015-08-13 21:37:35.795071941 +0200

The _AUTORECONF comment needs an update.

> +@@ -157,7 +157,6 @@
> + 
> + struct named_init {
> +   int number;
> +-  const wchar_t *name;
> +   double average;
> + };
> + 
> +@@ -231,7 +230,6 @@
> +   // Check named initializers.
> +   struct named_init ni = {
> +     .number = 34,
> +-    .name = L"Test wide string",
> +     .average = 543.34343,
> +   };

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
