From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 21 Feb 2019 00:25:25 +0100
Subject: [Buildroot] [PATCH 1/1] package/netsnmp: fix static build with
 openssl
In-Reply-To: <20190219110334.18185-1-fontaine.fabrice@gmail.com>
References: <20190219110334.18185-1-fontaine.fabrice@gmail.com>
Message-ID: <532c258c-655e-d0d5-c959-46605a9b9585@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19/02/2019 12:03, Fabrice Fontaine wrote:
> Fixes:
>  - http://autobuild.buildroot.org/results/8f6fdbf8a21967363b737bc771252bcded4278a9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ..._IFELSE-BIO_dgram_get_peer-when-static-li.patch | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/netsnmp/0005-fix-AC_LINK_IFELSE-BIO_dgram_get_peer-when-static-li.patch
> 
> diff --git a/package/netsnmp/0005-fix-AC_LINK_IFELSE-BIO_dgram_get_peer-when-static-li.patch b/package/netsnmp/0005-fix-AC_LINK_IFELSE-BIO_dgram_get_peer-when-static-li.patch
> new file mode 100644
> index 0000000000..5ec4de3f9e
> --- /dev/null
> +++ b/package/netsnmp/0005-fix-AC_LINK_IFELSE-BIO_dgram_get_peer-when-static-li.patch
> @@ -0,0 +1,30 @@
> +From 9df00594114f3bd9ca8eab4e6d715ceaa7110dc5 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Tue, 19 Feb 2019 11:54:29 +0100
> +Subject: [PATCH] fix AC_LINK_IFELSE(BIO_dgram_get_peer) when static linking
> +
> +When building as a static library, AC_LINK_IFELSE(BIO_dgram_get_peer)
> +fails because $LIBS (that contains -lz) is added before -lcrypto so
> +invert both variables.
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + configure.d/config_os_functions | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.d/config_os_functions b/configure.d/config_os_functions
> +index ba39069fe..813fda644 100644
> +--- a/configure.d/config_os_functions
> ++++ b/configure.d/config_os_functions
> +@@ -337,7 +337,7 @@ if echo " $transport_result_list " | $GREP "DTLS" > /dev/null; then
> +        AC_MSG_CHECKING([[for BIO_dgram_get_peer]])
> +        [
> +         oldLIBS="$LIBS"
> +-        LIBS="$LIBS -lcrypto"
> ++        LIBS="-lcrypto $LIBS"

 Instead of keeping on trying to fix this stuff, wouldn't it be better to use
pkg-config to get the openssl libs?

 Also, upstream seems to be active, so please send patches upstream.

 Regards,
 Arnout

> +         AC_LINK_IFELSE(
> +           [AC_LANG_PROGRAM(
> +             [[#include <openssl/bio.h>]],
> +-- 
> +2.14.1
> +
> 
