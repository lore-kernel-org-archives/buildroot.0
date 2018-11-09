From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 9 Nov 2018 22:07:03 +0100
Subject: [Buildroot] [PATCH v2] iwd: new package
In-Reply-To: <20181108224100.9462-1-ps.report@gmx.net>
References: <20181108224100.9462-1-ps.report@gmx.net>
Message-ID: <ee834fdd-4841-0cf4-6e3a-436b7c203b78@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 He Peter,

On 08/11/2018 23:41, Peter Seiderer wrote:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>   - update patch 0003-Fix-__iwd_backtrace_init-availability-detection.patch
>   - fix iwd needs comment (missing depends on BR2_TOOLCHAIN_HAS_SYNC_4)
>   - moved GPL-3.0+ (client) to enable client section
>   - add DEVELOPERS entry
> ---
>  DEVELOPERS                                    |  1 +
>  package/Config.in                             |  1 +
>  ...til.c-add-missing-ell-utf8.h-include.patch | 46 ++++++++++++++
>  ...cap.c-add-missing-sys-stat.h-include.patch | 46 ++++++++++++++
>  ...acktrace_init-availability-detection.patch | 62 +++++++++++++++++++
>  package/iwd/Config.in                         | 14 +++++
>  package/iwd/iwd.hash                          |  5 ++
>  package/iwd/iwd.mk                            | 47 ++++++++++++++
>  8 files changed, 222 insertions(+)
>  create mode 100644 package/iwd/0001-src-util.c-add-missing-ell-utf8.h-include.patch
>  create mode 100644 package/iwd/0002-monitor-pcap.c-add-missing-sys-stat.h-include.patch
>  create mode 100644 package/iwd/0003-Fix-__iwd_backtrace_init-availability-detection.patch

 Have you sent these patches upstream?

>  create mode 100644 package/iwd/Config.in
>  create mode 100644 package/iwd/iwd.hash
>  create mode 100644 package/iwd/iwd.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 53467da489..d2c553a2ca 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1660,6 +1660,7 @@ F:	package/ghostscript-fonts/
>  F:	package/gstreamer1/gst1-interpipe/
>  F:	package/gstreamer1/gst1-validate/
>  F:	package/gstreamer1/gstreamer1-editing-services/
> +F:	package/iwd/
>  F:	package/libevdev/
>  F:	package/log4cplus/
>  F:	package/postgresql/
> diff --git a/package/Config.in b/package/Config.in
> index b60e7700ad..2f2c0dc4e3 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1866,6 +1866,7 @@ menu "Networking applications"
>  	source "package/iputils/Config.in"
>  	source "package/irssi/Config.in"
>  	source "package/iw/Config.in"
> +	source "package/iwd/Config.in"
>  	source "package/janus-gateway/Config.in"
>  	source "package/keepalived/Config.in"
>  	source "package/kismet/Config.in"
> diff --git a/package/iwd/0001-src-util.c-add-missing-ell-utf8.h-include.patch b/package/iwd/0001-src-util.c-add-missing-ell-utf8.h-include.patch
> new file mode 100644
> index 0000000000..549cd6fdd1
> --- /dev/null
> +++ b/package/iwd/0001-src-util.c-add-missing-ell-utf8.h-include.patch
> @@ -0,0 +1,46 @@
> +From 174eb3088e78b75b4e488c023808c6f3bf7aae06 Mon Sep 17 00:00:00 2001
> +From: Peter Seiderer <ps.report@gmx.net>
> +Date: Fri, 2 Nov 2018 14:19:12 +0100
> +Subject: [PATCH] src/util.c: add missing ell/utf8.h include

 Anything wrong with upstream patch be5bf7ee155677afd2fc900ddf1bb6f91e65afe3?


 Regards,
 Arnout


> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Fixes:
> +
> +  src/util.c: In function ?util_ssid_to_utf8?:
> +  src/util.c:57:16: warning: implicit declaration of function ?l_utf8_validate? [-Wimplicit-function-declaration]
> +    while (i && (!l_utf8_validate((const char *)start, i,
> +                  ^~~~~~~~~~~~~~~
> +  src/util.c: In function ?util_string_to_address?:
> +  src/util.c:128:8: warning: implicit declaration of function ?l_ascii_isxdigit? [-Wimplicit-function-declaration]
> +     if (!l_ascii_isxdigit(str[i]))
> +          ^~~~~~~~~~~~~~~~
> +[...]
> +  src/util.o: In function `util_string_to_address':
> +  util.c:(.text+0x21c): undefined reference to `l_ascii_isxdigit'
> +  util.c:(.text+0x228): undefined reference to `l_ascii_isxdigit'
> +  util.c:(.text+0x24c): undefined reference to `l_ascii_isxdigit'
> +  util.c:(.text+0x258): undefined reference to `l_ascii_isxdigit'
> +  collect2: error: ld returned 1 exit status
> +
> +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> +---
> + src/util.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/util.c b/src/util.c
> +index 7a08940..e12b622 100644
> +--- a/src/util.c
> ++++ b/src/util.c
> +@@ -29,6 +29,7 @@
> + #include <sys/uio.h>
> + 
> + #include <ell/string.h>
> ++#include <ell/utf8.h>
> + #include <ell/genl.h>
> + #include <ell/util.h>
> + #include <ell/log.h>
> +-- 
> +2.19.1
[snip]
