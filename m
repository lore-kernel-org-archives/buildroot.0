From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 11 Nov 2019 15:10:50 +0100
Subject: [Buildroot] [PATCH] package/linux-serial-test: fix high speed
 baudrate handling
In-Reply-To: <20191111081954.22968-1-yegorslists@googlemail.com>
References: <20191111081954.22968-1-yegorslists@googlemail.com>
Message-ID: <CAGm1_ku+d-fJVqn=JbA6KggXbdi_wJvbjhDkvdt4xXbSYOuGyA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Nov 11, 2019 at 9:20 AM <yegorslists@googlemail.com> wrote:
>
> From: Yegor Yefremov <yegorslists@googlemail.com>
>
> Not all platforms define high speed baudrates hence wrap them around
> defines.
>
> Fixes:
> http://autobuild.buildroot.net/results/ef77cbe220619050eb9d46c78ae79a94eea8aa8b
>
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  ...-Rework-high-speed-baudrate-handling.patch | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 package/linux-serial-test/0002-Rework-high-speed-baudrate-handling.patch
>
> diff --git a/package/linux-serial-test/0002-Rework-high-speed-baudrate-handling.patch b/package/linux-serial-test/0002-Rework-high-speed-baudrate-handling.patch
> new file mode 100644
> index 0000000000..40f631fe9e
> --- /dev/null
> +++ b/package/linux-serial-test/0002-Rework-high-speed-baudrate-handling.patch
> @@ -0,0 +1,59 @@
> +From a08f8e7395d77d842f04a32c57cc757e5c11d939 Mon Sep 17 00:00:00 2001
> +From: Yegor Yefremov <yegorslists@googlemail.com>
> +Date: Mon, 11 Nov 2019 09:10:26 +0100
> +Subject: [PATCH] Rework high speed baudrate handling
> +
> +Not all platforms define high speed baudrates hence wrap them around
> +defines.
> +
> +Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> +---
> + linux-serial-test.c | 16 ++++++++++++++++
> + 1 file changed, 16 insertions(+)
> +
> +diff --git a/linux-serial-test.c b/linux-serial-test.c
> +index 5e7504e..501caa3 100644
> +--- a/linux-serial-test.c
> ++++ b/linux-serial-test.c
> +@@ -126,22 +126,38 @@ static int get_baud(int baud)
> +               return B576000;
> +       case 921600:
> +               return B921600;
> ++#ifdef B1000000
> +       case 1000000:
> +               return B1000000;
> ++#endif
> ++#ifdef B1152000
> +       case 1152000:
> +               return B1152000;
> ++#endif
> ++#ifdef B1500000
> +       case 1500000:
> +               return B1500000;
> ++#endif
> ++#ifdef B2000000
> +       case 2000000:
> +               return B2000000;
> ++#endif
> ++#ifdef B2500000
> +       case 2500000:
> +               return B2500000;
> ++#endif
> ++#ifdef B3000000
> +       case 3000000:
> +               return B3000000;
> ++#endif
> ++#ifdef B3500000
> +       case 3500000:
> +               return B3500000;
> ++#endif
> ++#ifdef B4000000
> +       case 4000000:
> +               return B4000000;
> ++#endif
> +       default:
> +               return -1;
> +       }
> +--
> +2.17.0
> +
> --
> 2.17.0

The patch was merged upstream:
https://github.com/cbrake/linux-serial-test/commit/13bea838f2a7573d2a68a6d95fc9d1f153b580be

Yegor
