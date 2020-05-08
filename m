From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 8 May 2020 14:41:47 +0200
Subject: [Buildroot] [PATCH] package/checkpolicy: fix -fno-common build
 failure
In-Reply-To: <20200506122101.48925-1-matthew.weber@rockwellcollins.com>
References: <20200506122101.48925-1-matthew.weber@rockwellcollins.com>
Message-ID: <20200508124147.GN12536@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matthew, All,

On 2020-05-06 07:21 -0500, Matt Weber spake thusly:
> Added upstream patch for removal of unused te_assertions which was
> found when using GCC10 as a host complier (-fno-common is now default)
> 
> Fixes:
> http://autobuild.buildroot.net/results/63f2d1897a8f581ec107374bf2cbb68d3add4109/
> 
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Romain Naour <romain.naour@gmail.com>
> Cc: Adam Duskett <aduskett@gmail.com>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> 
> Romain, would you mind testing this one on your GCC10 builder?
> 
> Peter I'm tested that this can be cherry-picked back to 2020.02.x without any issue.
> I haven't see a build failure yet on that branch but we should.
> 
> ---
>  ...ckpolicy-remove-unused-te_assertions.patch | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 package/checkpolicy/0001-checkpolicy-remove-unused-te_assertions.patch
> 
> diff --git a/package/checkpolicy/0001-checkpolicy-remove-unused-te_assertions.patch b/package/checkpolicy/0001-checkpolicy-remove-unused-te_assertions.patch
> new file mode 100644
> index 0000000000..0c4ffcbf87
> --- /dev/null
> +++ b/package/checkpolicy/0001-checkpolicy-remove-unused-te_assertions.patch
> @@ -0,0 +1,45 @@
> +From 4d330d0d3155211f119b3082f728ae42dcc01e96 Mon Sep 17 00:00:00 2001
> +From: Ondrej Mosnacek <omosnace@redhat.com>
> +Date: Thu, 23 Jan 2020 13:57:15 +0100
> +Subject: [PATCH] checkpolicy: remove unused te_assertions
> +
> +This variable is declared in a header file, but never defined or used.
> +The te_assert structure definition is only used in this declaration, so
> +remove both.
> +
> +Upstream: https://github.com/SELinuxProject/selinux/commit/4d330d0d3155211f119b3082f728ae42dcc01e96#diff-daf264ea505347df0d59a3a97a07742e
> +
> +Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
> +Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> +---
> + checkpolicy.h | 14 --------------
> + 1 file changed, 14 deletions(-)
> +
> +diff --git a/checkpolicy.h b/checkpolicy.h
> +index 3868f1fa..f127687e 100644
> +--- a/checkpolicy.h
> ++++ b/checkpolicy.h
> +@@ -1,20 +1,6 @@
> + #ifndef _CHECKPOLICY_H_
> + #define _CHECKPOLICY_H_
> + 
> +-#include <sepol/policydb/ebitmap.h>
> +-
> +-typedef struct te_assert {
> +-	ebitmap_t stypes;
> +-	ebitmap_t ttypes;
> +-	ebitmap_t tclasses;
> +-	int self;
> +-	sepol_access_vector_t *avp;
> +-	unsigned long line;
> +-	struct te_assert *next;
> +-} te_assert_t;
> +-
> +-te_assert_t *te_assertions;
> +-
> + extern unsigned int policyvers;
> + 
> + #endif
> +-- 
> +2.17.1
> +
> -- 
> 2.17.1
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
