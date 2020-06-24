From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 24 Jun 2020 22:10:23 +0200
Subject: [Buildroot] [PATCH] package/libnss: fix build failure on
 microblaze
In-Reply-To: <20200624160640.1892981-1-giulio.benetti@benettiengineering.com>
References: <20200624160640.1892981-1-giulio.benetti@benettiengineering.com>
Message-ID: <20200624201023.GI20645@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Giulio, All,

On 2020-06-24 18:06 +0200, Giulio Benetti spake thusly:
> By mistake seed.o has been added to public library too, but this way its
> dependencies are not taken into account(stubs.o), this way build fails
> complaining on missing functions from stubs.o file. Let's fix it by
> adding upstream patch:
> https://hg.mozilla.org/projects/nss/rev/f46fca8ced7fca6aa6de60e3170b2a3b6b2df565
> 
> Fixes:
> http://autobuild.buildroot.net/results/4cb/4cbf4c35549a3bfba06222ba509d0263f23a3a2e/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...-seed.o-back-into-freeblpriv3.-r-bbe.patch | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 package/libnss/0003-Bug-1642146-Move-seed.o-back-into-freeblpriv3.-r-bbe.patch
> 
> diff --git a/package/libnss/0003-Bug-1642146-Move-seed.o-back-into-freeblpriv3.-r-bbe.patch b/package/libnss/0003-Bug-1642146-Move-seed.o-back-into-freeblpriv3.-r-bbe.patch
> new file mode 100644
> index 0000000000..c9321658fd
> --- /dev/null
> +++ b/package/libnss/0003-Bug-1642146-Move-seed.o-back-into-freeblpriv3.-r-bbe.patch
> @@ -0,0 +1,50 @@
> +From 0841ebe3c85bfb12ecf080efb2e28ac18f55ed41 Mon Sep 17 00:00:00 2001
> +From: Mike Hommey <mh@glandium.org>
> +Date: Mon, 15 Jun 2020 18:12:09 +0000
> +Subject: [PATCH] Bug 1642146 - Move seed.o back into freeblpriv3.
> + r=bbeurdouche
> +
> +Differential Revision: https://phabricator.services.mozilla.com/D77595
> +
> +--HG--
> +extra : moz-landing-system : lando
> +
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + nss/lib/freebl/Makefile    | 4 ----
> + nss/lib/freebl/manifest.mn | 4 ++++
> + 2 files changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/nss/lib/freebl/Makefile b/nss/lib/freebl/Makefile
> +index 29dc940a3..52d827c6a 100644
> +--- a/nss/lib/freebl/Makefile
> ++++ b/nss/lib/freebl/Makefile
> +@@ -545,10 +545,6 @@ ifndef HAVE_INT128_SUPPORT
> +     DEFINES += -DKRML_VERIFIED_UINT128
> + endif
> + 
> +-ifndef NSS_DISABLE_DEPRECATED_SEED
> +-	CSRCS += deprecated/seed.c
> +-endif
> +-
> + ifndef NSS_DISABLE_CHACHAPOLY
> +     ifeq ($(CPU_ARCH),x86_64)
> +         ifndef NSS_DISABLE_AVX2
> +diff --git a/nss/lib/freebl/manifest.mn b/nss/lib/freebl/manifest.mn
> +index 5efb48520..8dd8ddb53 100644
> +--- a/nss/lib/freebl/manifest.mn
> ++++ b/nss/lib/freebl/manifest.mn
> +@@ -160,6 +160,10 @@ CSRCS = \
> + 	$(EXTRA_SRCS) \
> + 	$(NULL)
> + 
> ++ifndef NSS_DISABLE_DEPRECATED_SEED
> ++	CSRCS += deprecated/seed.c
> ++endif
> ++
> + ALL_CSRCS := $(CSRCS)
> + 
> + ALL_HDRS =  \
> +-- 
> +2.25.1
> +
> -- 
> 2.25.1
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
