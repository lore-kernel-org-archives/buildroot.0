From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Mar 2020 08:42:09 +0100
Subject: [Buildroot] [PATCH 1/1] package/shellinabox: fix CVE-2018-16789
In-Reply-To: <20200229225511.4079011-1-fontaine.fabrice@gmail.com>
References: <20200229225511.4079011-1-fontaine.fabrice@gmail.com>
Message-ID: <20200301074209.GA8743@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-02-29 23:55 +0100, Fabrice Fontaine spake thusly:
> libhttp/url.c in shellinabox through 2.20 has an implementation flaw in
> the HTTP request parsing logic. By sending a crafted multipart/form-data
> HTTP request, an attacker could exploit this to force shellinaboxd into
> an infinite loop, exhausting available CPU resources and taking the
> service down.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...9-fix-for-broken-multipart-form-data.patch | 26 +++++++++++++++++++
>  package/shellinabox/shellinabox.mk            |  3 +++
>  2 files changed, 29 insertions(+)
>  create mode 100644 package/shellinabox/0002-CVE-2018-16789-fix-for-broken-multipart-form-data.patch
> 
> diff --git a/package/shellinabox/0002-CVE-2018-16789-fix-for-broken-multipart-form-data.patch b/package/shellinabox/0002-CVE-2018-16789-fix-for-broken-multipart-form-data.patch
> new file mode 100644
> index 0000000000..4b15f419e3
> --- /dev/null
> +++ b/package/shellinabox/0002-CVE-2018-16789-fix-for-broken-multipart-form-data.patch
> @@ -0,0 +1,26 @@
> +From 7f47efe1717c381f86566fabe0b1ced8cb98fe8f Mon Sep 17 00:00:00 2001
> +From: irsl <irsl@users.noreply.github.com>
> +Date: Fri, 26 Oct 2018 11:51:15 +0200
> +Subject: [PATCH] fix for broken multipart/form-data
> +
> +Malformed multipart/form-data payload results in infinite loop and thus denial of service
> +[Upstream status: https://github.com/shellinabox/shellinabox/pull/446]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + libhttp/url.c | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/libhttp/url.c b/libhttp/url.c
> +index ed29475..4177871 100644
> +--- a/libhttp/url.c
> ++++ b/libhttp/url.c
> +@@ -312,6 +312,9 @@ static void urlParsePostBody(struct URL *url,
> +               }
> +             }
> +           }
> ++        } else {
> ++           warn("[http] broken multipart/form-data!");
> ++           break;
> +         }
> +       }
> +       if (lastPart) {
> diff --git a/package/shellinabox/shellinabox.mk b/package/shellinabox/shellinabox.mk
> index be36804cb7..4c93fdccef 100644
> --- a/package/shellinabox/shellinabox.mk
> +++ b/package/shellinabox/shellinabox.mk
> @@ -9,6 +9,9 @@ SHELLINABOX_SITE = $(call github,shellinabox,shellinabox,v$(SHELLINABOX_VERSION)
>  SHELLINABOX_LICENSE = GPL-2.0 with OpenSSL exception
>  SHELLINABOX_LICENSE_FILES = COPYING GPL-2
>  
> +# 0002-CVE-2018-16789-fix-for-broken-multipart-form-data.patch
> +SHELLINABOX_IGNORE_CVES += CVE-2018-16789
> +
>  # Fetching from Github, and patching Makefile.am, so we need to autoreconf
>  SHELLINABOX_AUTORECONF = YES
>  
> -- 
> 2.25.0
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
