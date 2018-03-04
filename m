From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 4 Mar 2018 10:44:42 +0200
Subject: [Buildroot] [PATCH v1] libv4l: fix libdvbv5 musl compile
In-Reply-To: <20180304083653.15340-1-ps.report@gmx.net>
References: <20180304083653.15340-1-ps.report@gmx.net>
Message-ID: <20180304084442.abwwydkj76wkuhqx@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Sun, Mar 04, 2018 at 09:36:53AM +0100, Peter Seiderer wrote:
> Add optional copy of TEMP_FAILURE_RETRY macro.
> 
> Fixes [1]:
> 
>   ../../lib/libdvbv5/.libs/libdvbv5.so: undefined reference to `TEMP_FAILURE_RETRY'
> 
> [1] http://autobuild.buildroot.net/results/7aea0cbb9e7fe7d9919c9be04ba4567ddcf4e15e
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...d-optional-copy-of-TEMP_FAILURE_RETRY-mac.patch | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/libv4l/0003-libdvbv5-add-optional-copy-of-TEMP_FAILURE_RETRY-mac.patch
> 
> diff --git a/package/libv4l/0003-libdvbv5-add-optional-copy-of-TEMP_FAILURE_RETRY-mac.patch b/package/libv4l/0003-libdvbv5-add-optional-copy-of-TEMP_FAILURE_RETRY-mac.patch
> new file mode 100644
> index 0000000000..48a7872330
> --- /dev/null
> +++ b/package/libv4l/0003-libdvbv5-add-optional-copy-of-TEMP_FAILURE_RETRY-mac.patch
> @@ -0,0 +1,38 @@
> +From abfe3e7b2b4af1de9b891f3a7a996b70533b0a27 Mon Sep 17 00:00:00 2001
> +From: Peter Seiderer <ps.report@gmx.net>
> +Date: Sun, 4 Mar 2018 09:07:51 +0100
> +Subject: [PATCH] libdvbv5: add optional copy of TEMP_FAILURE_RETRY macro (fix
> + musl compile)
> +
> +Fixes:
> +
> +  ../../lib/libdvbv5/.libs/libdvbv5.so: undefined reference to `TEMP_FAILURE_RETRY'
> +
> +Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Link to your upstream submission:

  https://www.mail-archive.com/linux-media at vger.kernel.org/msg127134.html

baruch

> +---
> + lib/libdvbv5/dvb-dev-local.c | 9 +++++++++
> + 1 file changed, 9 insertions(+)
> +
> +diff --git a/lib/libdvbv5/dvb-dev-local.c b/lib/libdvbv5/dvb-dev-local.c
> +index 8bc99d1..7a76d65 100644
> +--- a/lib/libdvbv5/dvb-dev-local.c
> ++++ b/lib/libdvbv5/dvb-dev-local.c
> +@@ -44,6 +44,15 @@
> + # define _(string) string
> + #endif
> + 
> ++/* taken from glibc unistd.h */
> ++#ifndef TEMP_FAILURE_RETRY
> ++#define TEMP_FAILURE_RETRY(expression) \
> ++    ({ long int __result;                                                     \
> ++       do __result = (long int) (expression);                                 \
> ++       while (__result == -1L && errno == EINTR);                             \
> ++       __result; })
> ++#endif
> ++
> + struct dvb_dev_local_priv {
> + 	dvb_dev_change_t notify_dev_change;

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
