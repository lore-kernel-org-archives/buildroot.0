From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 3 Apr 2020 23:06:15 +0200
Subject: [Buildroot] [PATCH v2] package/libnss: fix build failure on
 arm32 arch not armv7
In-Reply-To: <20200403201021.44350-1-giulio.benetti@benettiengineering.com>
References: <03ce40bf-188e-80d9-e313-d33cd677f029@benettiengineering.com>
 <20200403201021.44350-1-giulio.benetti@benettiengineering.com>
Message-ID: <20200403230615.4cb686fc@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Giulio,

On Fri,  3 Apr 2020 22:10:21 +0200, Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> NSS assumes that every neon arm32 build is an armv7, but this is
> not always true(i.e. build arm32 for armv8), so let's add a patch to
> remove -march=armv7 flag when building gcm-arm32-neon.c
>
> Fixes:
> http://autobuild.buildroot.net/results/464/464044fda2850123339de6c8071374e380636ee0/
>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> V1->V2:
> * update with upstreamed patch:
> https://bugzilla.mozilla.org/show_bug.cgi?id=1624864

This two lines are worth mentioning in the commit message...

> * improve commit log
> ---
>  ...t-force-ARMv7-for-gcm-arm32-neon-r-j.patch | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 package/libnss/0002-Bug-1624864-Don-t-force-ARMv7-for-gcm-arm32-neon-r-j.patch
>
> diff --git a/package/libnss/0002-Bug-1624864-Don-t-force-ARMv7-for-gcm-arm32-neon-r-j.patch b/package/libnss/0002-Bug-1624864-Don-t-force-ARMv7-for-gcm-arm32-neon-r-j.patch
> new file mode 100644
> index 0000000000..eae1ed974c
> --- /dev/null
> +++ b/package/libnss/0002-Bug-1624864-Don-t-force-ARMv7-for-gcm-arm32-neon-r-j.patch
> @@ -0,0 +1,29 @@
> +From ab8d2425728f37b1f21dbff712daf4a767c82149 Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +Date: Wed, 1 Apr 2020 09:41:08 -0700
> +Subject: [PATCH] Bug 1624864 - Don't force ARMv7 for gcm-arm32-neon r=jcj
> +
> +--HG--
> +extra : rebase_source : e046bbe45276b8cdf686c4f61006aff08865f1c0
> +

Please add the upstream source link here, e.g. (or and/or the bug report link):

[Upstream: https://hg.mozilla.org/projects/nss/rev/8582092359720d052288cad2dc13f37aad783dc3]

With the two changes you can add my

Reviewed-by: Peter Seiderer <ps.report@gmx.net>

Regards,
Peter


> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + nss/lib/freebl/Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/nss/lib/freebl/Makefile b/nss/lib/freebl/Makefile
> +index a03c0d108..898a0b9e0 100644
> +--- a/nss/lib/freebl/Makefile
> ++++ b/nss/lib/freebl/Makefile
> +@@ -781,7 +781,7 @@ ifeq ($(CPU_ARCH),arm)
> + USES_SOFTFLOAT_ABI := $(shell $(CC) -o - -E -dM - $(CFLAGS) < /dev/null | grep __SOFTFP__ > /dev/null && echo 1)
> + $(OBJDIR)/$(PROG_PREFIX)aes-armv8$(OBJ_SUFFIX): CFLAGS += -march=armv8-a -mfpu=crypto-neon-fp-armv8$(if $(USES_SOFTFLOAT_ABI), -mfloat-abi=softfp)
> + ifndef NSS_DISABLE_ARM32_NEON
> +-$(OBJDIR)/$(PROG_PREFIX)gcm-arm32-neon$(OBJ_SUFFIX): CFLAGS += -march=armv7 -mfpu=neon$(if $(USES_SOFTFLOAT_ABI), -mfloat-abi=softfp)
> ++$(OBJDIR)/$(PROG_PREFIX)gcm-arm32-neon$(OBJ_SUFFIX): CFLAGS += -mfpu=neon$(if $(USES_SOFTFLOAT_ABI), -mfloat-abi=softfp)
> + endif
> + endif
> + ifeq ($(CPU_ARCH),aarch64)
> +--
> +2.20.1
> +
