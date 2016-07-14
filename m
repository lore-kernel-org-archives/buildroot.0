From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 14 Jul 2016 16:01:58 +0200
Subject: [Buildroot] [PATCH] package/libgpg-error: fix no-thread build
In-Reply-To: <1468061534-26225-1-git-send-email-yann.morin.1998@free.fr>
References: <1468061534-26225-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160714140158.GB3737@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2016-07-09 12:52 +0200, Yann E. MORIN spake thusly:
> Including the pthreads header was not properly guarded; fix that.
> 
> Disable building tests, as they are too not properly guarding against
> missing pthreads.

Upstream has accepted my two patches, so I'll be sending an updated
commit to replace this one.

Regards,
Yann E. MORIN.

> Note that autoreconfiguring is very noisy and spits out a lot of git
> errors as their configure.ac expects, and even *requires* to be run from
> a git clone. Although reported as fatal errors, it's just git whining.
> We can ignore them.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/049/0495d60556139de8f3f6df420d9a226ee8a432a0/
>     http://autobuild.buildroot.org/results/0d1/0d12423877b4aac2a18fac651063de98774b5108/
>     [...]
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Romain Naour <romain.naour@openwide.fr>
> Cc: J?rg Krause <joerg.krause@embedded.rocks>
> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> 
> ---
> First patch will be sent upstream shortly; second patch will be reworked
> in an upstreamable solution.
> ---
>  ...-posix-lock-obj-fix-build-without-threads.patch | 34 ++++++++++++++++++++++
>  package/libgpg-error/0002-tests-do-not-build.patch | 29 ++++++++++++++++++
>  package/libgpg-error/libgpg-error.mk               |  3 ++
>  3 files changed, 66 insertions(+)
>  create mode 100644 package/libgpg-error/0001-gen-posix-lock-obj-fix-build-without-threads.patch
>  create mode 100644 package/libgpg-error/0002-tests-do-not-build.patch
> 
> diff --git a/package/libgpg-error/0001-gen-posix-lock-obj-fix-build-without-threads.patch b/package/libgpg-error/0001-gen-posix-lock-obj-fix-build-without-threads.patch
> new file mode 100644
> index 0000000..0f3504e
> --- /dev/null
> +++ b/package/libgpg-error/0001-gen-posix-lock-obj-fix-build-without-threads.patch
> @@ -0,0 +1,34 @@
> +From 05ccf08a84e4ab671dae1c04c383c660a78d91d9 Mon Sep 17 00:00:00 2001
> +From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +Date: Sat, 9 Jul 2016 12:28:43 +0200
> +Subject: [PATCH 1/2] gen-posix-lock-obj: fix build without threads
> +
> +Although ./configure checks for thread support, gen-posix-lock-obj still
> +includes pthreads.h unconditionally.
> +
> +Guard that inclusion using the same condition as all other uses of
> +pthreads-related code.
> +
> +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +---
> + src/gen-posix-lock-obj.c | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/gen-posix-lock-obj.c b/src/gen-posix-lock-obj.c
> +index e32a3cd..e6f33ae 100644
> +--- a/src/gen-posix-lock-obj.c
> ++++ b/src/gen-posix-lock-obj.c
> +@@ -29,7 +29,9 @@
> + #include <string.h>
> + #include <stdio.h>
> + #include <errno.h>
> +-#include <pthread.h>
> ++#ifdef USE_POSIX_THREADS
> ++# include <pthread.h>
> ++#endif
> + 
> + #include "posix-lock-obj.h"
> + 
> +-- 
> +2.7.4
> +
> diff --git a/package/libgpg-error/0002-tests-do-not-build.patch b/package/libgpg-error/0002-tests-do-not-build.patch
> new file mode 100644
> index 0000000..5eded5f
> --- /dev/null
> +++ b/package/libgpg-error/0002-tests-do-not-build.patch
> @@ -0,0 +1,29 @@
> +From 9694693d4d35a433509a4da61341e1cb5b0143d0 Mon Sep 17 00:00:00 2001
> +From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +Date: Sat, 9 Jul 2016 12:30:40 +0200
> +Subject: [PATCH 2/2] tests: do not build
> +
> +Building tests fails without thread support. Forcefulyl disable tests,
> +which we don't care much about for Buildroot.
> +
> +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +---
> + Makefile.am | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index baeba14..dc959e4 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -39,7 +39,7 @@ else
> + doc =
> + endif
> + 
> +-SUBDIRS = m4 src $(doc) tests po $(lang_subdirs)
> ++SUBDIRS = m4 src $(doc) po $(lang_subdirs)
> + 
> + 
> + dist-hook: gen-ChangeLog
> +-- 
> +2.7.4
> +
> diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
> index b074ff6..92754e5 100644
> --- a/package/libgpg-error/libgpg-error.mk
> +++ b/package/libgpg-error/libgpg-error.mk
> @@ -11,6 +11,9 @@ LIBGPG_ERROR_LICENSE_FILES = COPYING COPYING.LIB
>  LIBGPG_ERROR_INSTALL_STAGING = YES
>  LIBGPG_ERROR_CONFIG_SCRIPTS = gpg-error-config
>  
> +# 0002-tests-do-not-build.patch touches Makefile.am
> +LIBGPG_ERROR_AUTORECONF = YES
> +
>  define LIBGPG_ERROR_FIX_CROSS_COMPILATION
>  	cd $(@D)/src/syscfg && \
>  	ln -s lock-obj-pub.$(call qstrip, $(BR2_PACKAGE_LIBGPG_ERROR_SYSCFG)).h \
> -- 
> 2.7.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
