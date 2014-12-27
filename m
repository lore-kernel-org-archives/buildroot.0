From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 27 Dec 2014 16:10:33 +0100
Subject: [Buildroot] [PATCH 5/5] guile: fix libltdl and libgmp detection
In-Reply-To: <1419688038-15640-6-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1419688038-15640-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1419688038-15640-6-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAHXCMMKxFtNsz-SWkH-sy_vRL1=MkqA06r5d4YbCTj62h9kgQA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Dec 27, 2014 at 2:47 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Explicitly pass the path to libtldl and libgmp, so that guile does not
> try to use host versions when available.
>
> Fixes:
>
>   http://autobuild.buildroot.org/results/056/056b7fcbf3b73a8d15ca635b000771cdc2d7fbf9/
>
> And another similar problem with libgmp.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

[for those 2 mis-detections, however I'm still hitting libunistring
error at configuration]
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Tested-by: Samuel Martin <s.martin49@gmail.com>

Libunistring mis-detection:
config.log:
---
[...]
configure:15821:
/home/system/src/tmp/br/abo/guile-d07/host/usr/bin/arm-none-linux-gnueabi-gcc
-o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64   -Os  -DHAVE_GC_SET_FINALIZER_NOTIFIER
-DHAVE_GC_GET_HEAP_USAGE_SAFE -DHAVE_GC_GET_FREE_SPACE_DIVISOR
-DHAVE_GC_SET_FINALIZE_ON_DEMAND -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c
/usr/lib/libunistring.so  >&5
/usr/lib/libunistring.so: file not recognized: File format not recognized
collect2: error: ld returned 1 exit status
configure:15821: $? = 1
[...]
---
and the --with-libunistring-prefix=$(STAGING_DIR)/usr/lib trick fixes the error.


> ---
>  package/guile/guile.mk | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/package/guile/guile.mk b/package/guile/guile.mk
> index 30af11d..194eca2 100644
> --- a/package/guile/guile.mk
> +++ b/package/guile/guile.mk
> @@ -29,5 +29,9 @@ GUILE_CFLAGS = \
>  GUILE_CONF_ENV += GUILE_FOR_BUILD=$(HOST_DIR)/usr/bin/guile \
>         CFLAGS="$(TARGET_CFLAGS) $(GUILE_CFLAGS)"
>
> +GUILE_CONF_OPTS += \
> +       --with-libltdl-prefix=$(STAGING_DIR)/usr/lib \
> +       --with-libgmp-prefix=$(STAGING_DIR)/usr/lib
> +
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
> --
> 2.1.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


Regards,

-- 
Samuel
