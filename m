From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 1 Oct 2014 14:42:41 +0100
Subject: [Buildroot] [PATCHv2] rsyslog: security bump to version 7.6.6
In-Reply-To: <1412169833-20581-1-git-send-email-gustavo@zacarias.com.ar>
References: <1412169833-20581-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <542C04D1.9080801@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On 10/01/2014 02:23 PM, Gustavo Zacarias wrote:
> Fixes CVE-2014-3634 - potential abort when a message with PRI > 191 was
> processed if the "pri-text" property was used in active templates, this
> could be abused to a remote denial of service from permitted senders.
>
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>   package/rsyslog/rsyslog-0001-revert-strdup.patch | 27 ++++++++++++++++++++++++
>   package/rsyslog/rsyslog.hash                     |  4 ++--
>   package/rsyslog/rsyslog.mk                       |  5 +++--
>   3 files changed, 32 insertions(+), 4 deletions(-)
>   create mode 100644 package/rsyslog/rsyslog-0001-revert-strdup.patch
>
> diff --git a/package/rsyslog/rsyslog-0001-revert-strdup.patch b/package/rsyslog/rsyslog-0001-revert-strdup.patch
> new file mode 100644
> index 0000000..5e82018
> --- /dev/null
> +++ b/package/rsyslog/rsyslog-0001-revert-strdup.patch
> @@ -0,0 +1,27 @@
> +Revert upstream 0403361ac57082dc47840d1f31832f1a0e319078
> +It breaks the build when it's defined.
> +
> +Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> +
> +diff -Nura rsyslog-7.6.6.orig/grammar/lexer.c rsyslog-7.6.6/grammar/lexer.c
> +--- rsyslog-7.6.6.orig/grammar/lexer.c	2014-10-01 10:12:34.960082719 -0300
> ++++ rsyslog-7.6.6/grammar/lexer.c	2014-10-01 10:13:24.512769964 -0300
> +@@ -1459,7 +1459,6 @@
> + #line 32 "lexer.l"
> + #include "config.h"
> + #include "parserif.h"
> +-extern char *strdup(char*); /* somehow we do not get this from string.h... */
> + /*%option noyywrap nodefault case-insensitive */
> + /* avoid compiler warning: `yyunput' defined but not used */
> + #define YY_NO_INPUT 1
> +diff -Nura rsyslog-7.6.6.orig/grammar/lexer.l rsyslog-7.6.6/grammar/lexer.l
> +--- rsyslog-7.6.6.orig/grammar/lexer.l	2014-10-01 10:12:34.960082719 -0300
> ++++ rsyslog-7.6.6/grammar/lexer.l	2014-10-01 10:13:41.935363172 -0300
> +@@ -31,7 +31,6 @@
> + %{
> + #include "config.h"
> + #include "parserif.h"
> +-extern char *strdup(char*); /* somehow we do not get this from string.h... */
> + %}
> +
> + %option noyywrap nodefault case-insensitive yylineno
> diff --git a/package/rsyslog/rsyslog.hash b/package/rsyslog/rsyslog.hash
> index b47932a..afc75cc 100644
> --- a/package/rsyslog/rsyslog.hash
> +++ b/package/rsyslog/rsyslog.hash
> @@ -1,2 +1,2 @@
> -# From http://www.rsyslog.com/downloads/download-other/
> -sha256	45bca1c1ffca6b8260363617897c09baeaf350e8b92c51361d2770375cdf4b34	rsyslog-7.6.5.tar.gz
> +# From http://www.rsyslog.com/downloads/download-v7-stable/
> +sha256	c77ae0db6204c5bd670fa96c354ee5fe1c62c876bd84ec06ed429138c78885bb	rsyslog-7.6.6.tar.gz
> diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
> index 2ba4a9a..17fd13b 100644
> --- a/package/rsyslog/rsyslog.mk
> +++ b/package/rsyslog/rsyslog.mk
> @@ -4,14 +4,15 @@
>   #
>   ################################################################################
>
> -RSYSLOG_VERSION = 7.6.5
> +RSYSLOG_VERSION = 7.6.6
>   RSYSLOG_SITE = http://rsyslog.com/files/download/rsyslog
>   RSYSLOG_LICENSE = GPLv3 LGPLv3 Apache-2.0
>   RSYSLOG_LICENSE_FILES = COPYING COPYING.LESSER COPYING.ASL20
>   RSYSLOG_DEPENDENCIES = zlib libestr liblogging json-c host-pkgconf
>
>   RSYSLOG_CONF_OPT = --disable-testbench \
> -		   --enable-cached-man-pages
> +		   --enable-cached-man-pages \
> +		   --disable-generate-man-pages
>
>   # Build after BusyBox
>   ifeq ($(BR2_PACKAGE_BUSYBOX),y)
>

Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

-- 
Vincent
