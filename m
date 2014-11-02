From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 2 Nov 2014 16:35:46 +0100
Subject: [Buildroot] [PATCH] libcap: add upstream xattr patch
In-Reply-To: <1414932640-23210-1-git-send-email-gustavo@zacarias.com.ar>
References: <1414932640-23210-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141102153546.GB11634@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-11-02 09:50 -0300, Gustavo Zacarias spake thusly:
> Add upstream patch for xattr include fix.
> Also rename patches to git naming convention.
> Fixes:
> http://autobuild.buildroot.net/results/2ef/2efb25356bc87ba0e1be08214eaa28ac064ad6c3/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  ...-build-system.patch => 0001-build-system.patch} |  0
>  ...atch => 0002-split-static-shared-install.patch} |  0
>  ...nge-the-location-we-include-linux-xattr.h.patch | 46 ++++++++++++++++++++++
>  3 files changed, 46 insertions(+)
>  rename package/libcap/{libcap-01-build-system.patch => 0001-build-system.patch} (100%)
>  rename package/libcap/{libcap-02-split-static-shared-install.patch => 0002-split-static-shared-install.patch} (100%)
>  create mode 100644 package/libcap/0003-Change-the-location-we-include-linux-xattr.h.patch
> 
> diff --git a/package/libcap/libcap-01-build-system.patch b/package/libcap/0001-build-system.patch
> similarity index 100%
> rename from package/libcap/libcap-01-build-system.patch
> rename to package/libcap/0001-build-system.patch
> diff --git a/package/libcap/libcap-02-split-static-shared-install.patch b/package/libcap/0002-split-static-shared-install.patch
> similarity index 100%
> rename from package/libcap/libcap-02-split-static-shared-install.patch
> rename to package/libcap/0002-split-static-shared-install.patch
> diff --git a/package/libcap/0003-Change-the-location-we-include-linux-xattr.h.patch b/package/libcap/0003-Change-the-location-we-include-linux-xattr.h.patch
> new file mode 100644
> index 0000000..7858780
> --- /dev/null
> +++ b/package/libcap/0003-Change-the-location-we-include-linux-xattr.h.patch
> @@ -0,0 +1,46 @@
> +From 84fb6007dcc7f6b6da9f6dab77a487c22b6c7beb Mon Sep 17 00:00:00 2001
> +From: Andrew G Morgan <morgan@kernel.org>
> +Date: Sun, 9 Mar 2014 16:33:15 -0700
> +Subject: [PATCH] Change the location we include linux/xattr.h
> +
> +This header stuff seems a bit fragile, but Serge reports including
> +it in sys/capability.h was causing a lot of trouble building dependent
> +app packages.
> +
> +From the perspective of libcap, this API is only needed internally in
> +cap_file.c so we put an include there.
> +
> +Status: upstream.
> +
> +Signed-off-by: Andrew G Morgan <morgan@kernel.org>
> +Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> +---
> +
> +diff --git a/libcap/cap_file.c b/libcap/cap_file.c
> +index d3dc1d0..553c2d2 100644
> +--- a/libcap/cap_file.c
> ++++ b/libcap/cap_file.c
> +@@ -10,6 +10,8 @@
> + #include <sys/stat.h>
> + #include <unistd.h>
> + 
> ++#include <linux/xattr.h>
> ++
> + #define XATTR_SECURITY_PREFIX "security."
> + 
> + #include "libcap.h"
> +diff --git a/libcap/include/sys/capability.h b/libcap/include/sys/capability.h
> +index 64ac50e..dddc75b 100644
> +--- a/libcap/include/sys/capability.h
> ++++ b/libcap/include/sys/capability.h
> +@@ -27,7 +27,6 @@ extern "C" {
> + #define __user
> + #endif
> + #include <linux/capability.h>
> +-#include <linux/xattr.h>
> + 
> + /*
> +  * POSIX capability types
> +-- 
> +2.0.4
> +
> -- 
> 2.0.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
