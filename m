From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 5 Apr 2016 00:04:23 +0200
Subject: [Buildroot] [PATCH] ipmitool: fix musl build
In-Reply-To: <1459620764-7241-1-git-send-email-joerg.krause@embedded.rocks>
References: <1459620764-7241-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <5702E4E7.1060705@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/02/16 20:12, J?rg Krause wrote:
> Add two patches to fix musl build.
>
> The first patch avoids the redefinition aof wchar_t. The second patch adds a
> missing header include of <linux/params.h>.
>
> Both patches send upstream:
> https://sourceforge.net/p/ipmitool/mailman/message/34987103/
> https://sourceforge.net/p/ipmitool/mailman/message/34987104/
>
> Fixes:
> http://autobuild.buildroot.net/results/75f/75fd6f1be0271bb15078c62f3effdbb67ac07427/
> http://autobuild.buildroot.net/results/cac/cacf8179a9c8142eef69562462d3c3b0b20c2879/
> http://autobuild.buildroot.net/results/c10/c1045882947ff7150c750088ae1981bd99134c54/
> http://autobuild.buildroot.net/results/6a7/6a770f8a3dddb15ba4d95555e74b198799278dcf/
> .. and more.
>
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>   .../ipmitool/0001-Avoid-wchar_t-redefinition.patch | 35 +++++++++++++++++++
>   ...-Add-missing-linux-param.h-header-include.patch | 39 ++++++++++++++++++++++
>   2 files changed, 74 insertions(+)
>   create mode 100644 package/ipmitool/0001-Avoid-wchar_t-redefinition.patch
>   create mode 100644 package/ipmitool/0002-Add-missing-linux-param.h-header-include.patch
>
> diff --git a/package/ipmitool/0001-Avoid-wchar_t-redefinition.patch b/package/ipmitool/0001-Avoid-wchar_t-redefinition.patch
> new file mode 100644
> index 0000000..f404245
> --- /dev/null
> +++ b/package/ipmitool/0001-Avoid-wchar_t-redefinition.patch
> @@ -0,0 +1,35 @@
> +From ea30d9b4290009116f11bb7110d1ac13589d76a4 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
> +Date: Sat, 2 Apr 2016 19:45:14 +0200
> +Subject: [PATCH 1/2] Avoid wchar_t redefinition
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +The musl C library does not define _WCHAR_T. Check also for compiler defined
> +__WCHAR_TYPE__.
> +
> +Upstream status: Pending
> +https://sourceforge.net/p/ipmitool/mailman/message/34987103/
> +
> +Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> +---
> + src/plugins/imb/imbapi.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/plugins/imb/imbapi.h b/src/plugins/imb/imbapi.h
> +index 74975c6..fa1e9c6 100644
> +--- a/src/plugins/imb/imbapi.h
> ++++ b/src/plugins/imb/imbapi.h
> +@@ -46,7 +46,7 @@ SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> + #endif
> + #ifndef WIN32
> + /* WIN32 defines this in stdio.h */
> +-#ifndef _WCHAR_T
> ++#if !defined(_WCHAR_T) && !defined(__WCHAR_TYPE__)

  __WCHAR_TYPE_ is also not a standardized macro. For example, does clang define 
it? The proper solution is to add an autoconf test for wchar and use that 
define. Take for example m4/wchar_t.m4 from bison.

> + #define _WCHAR_T
> + typedef long    wchar_t;
> + #endif
> +--
> +2.8.0
> +
> diff --git a/package/ipmitool/0002-Add-missing-linux-param.h-header-include.patch b/package/ipmitool/0002-Add-missing-linux-param.h-header-include.patch
> new file mode 100644
> index 0000000..7528c7c
> --- /dev/null
> +++ b/package/ipmitool/0002-Add-missing-linux-param.h-header-include.patch
> @@ -0,0 +1,39 @@
> +From c4ff9cb50e5b7a64104ab264ec656186f78cb327 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
> +Date: Sat, 2 Apr 2016 19:47:21 +0200
> +Subject: [PATCH 2/2] Add missing linux/param.h header include
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Fixes the following build failure under musl:
> +
> +imbapi.c: In function 'MapPhysicalMemory':
> +imbapi.c:109:19: error: 'EXEC_PAGESIZE' undeclared (first use in this function)
> + # define PAGESIZE EXEC_PAGESIZE
> +
> +Upstream status: Pending
> +https://sourceforge.net/p/ipmitool/mailman/message/34987104/
> +
> +Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

  This one looks good.

  Regards,
  Arnout

> +---
> + src/plugins/imb/imbapi.c | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/src/plugins/imb/imbapi.c b/src/plugins/imb/imbapi.c
> +index 899c47a..8a6421d 100644
> +--- a/src/plugins/imb/imbapi.c
> ++++ b/src/plugins/imb/imbapi.c
> +@@ -95,6 +95,9 @@ SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> + #include <stdlib.h>
> + #include <fcntl.h>
> + #include <string.h>
> ++#ifdef __linux__
> ++#include <linux/param.h>
> ++#endif
> + #endif
> + #include "imbapi.h"
> + #include <asm/socket.h>
> +--
> +2.8.0
> +
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
