From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 20 Dec 2016 14:50:26 +0100
Subject: [Buildroot] [PATCH] can-utils: fix build with glibc versions
	before 2.17
In-Reply-To: <1482241325-29293-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1482241325-29293-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <CAGm1_kvOKHSakr1coVB+jXDfmEpwrCh3LqmCDmb3Zju30CfSCw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Rahul,



On Tue, Dec 20, 2016 at 2:42 PM, Rahul Bedarkar
<rahul.bedarkar@imgtec.com> wrote:
> glibc versions before 2.17 needs to link with librt for
> clock_nanosleep(). This commmit adds patch to detect if linking
> with librt is required.
>
> Fixes:
>   http://autobuild.buildroot.net/results/0e5/0e5242376ff6aa82e89ed1172350e05009d48156
>
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>

good catch. Can you submit this patch upstream? Usually it will be
quickly accepted, so that one can just bump the version instead of
including a patch.

Yegor

>  ...-check-to-detect-clock_nanosleep-in-librt.patch | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 package/can-utils/0001-Add-check-to-detect-clock_nanosleep-in-librt.patch
>
> diff --git a/package/can-utils/0001-Add-check-to-detect-clock_nanosleep-in-librt.patch b/package/can-utils/0001-Add-check-to-detect-clock_nanosleep-in-librt.patch
> new file mode 100644
> index 0000000..78b4edf
> --- /dev/null
> +++ b/package/can-utils/0001-Add-check-to-detect-clock_nanosleep-in-librt.patch
> @@ -0,0 +1,41 @@
> +From 9ebbf337b033f924a3be7406774758ba29c8bd5b Mon Sep 17 00:00:00 2001
> +From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> +Date: Tue, 20 Dec 2016 18:29:11 +0530
> +Subject: [PATCH] Add check to detect clock_nanosleep() in librt
> +
> +With glibc versions before 2.17, we get following build error:
> +
> +  canfdtest.o: In function `millisleep':
> +  canfdtest.c:(.text+0x212): undefined reference to `clock_nanosleep'
> +  collect2: error: ld returned 1 exit status
> +  make[1]: *** [canfdtest] Error 1
> +  make[1]: *** Waiting for unfinished jobs....
> +
> +glibc versions before 2.17 needs to link with -lrt for
> +clock_nanosleep(). This patch adds support to detect if linking with
> +librt is required.
> +
> +This build issue is detected by Buildroot autobuilder:
> +http://autobuild.buildroot.net/results/0e5/0e5242376ff6aa82e89ed1172350e05009d48156/build-end.log
> +
> +Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> +---
> + configure.ac | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 8b50fb7..df9a193 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -73,6 +73,8 @@ AC_CHECK_FUNCS([ \
> +       strtoul \
> + ])
> +
> ++# glibc versions before 2.17 needs to link with -lrt for clock_nanosleep
> ++AC_SEARCH_LIBS([clock_nanosleep], [rt])
> +
> + AC_CHECK_DECL(SO_RXQ_OVFL,,
> +     [AC_DEFINE([SO_RXQ_OVFL], [40], [SO_RXQ_OVFL])]
> +--
> +2.6.2
> +
> --
> 2.6.2
>
