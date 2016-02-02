From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 2 Feb 2016 15:51:43 +0100
Subject: [Buildroot] [PATCH 1/1] package/rsyslog: fix musl buil
In-Reply-To: <1454254080-11795-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454254080-11795-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <56B0C27F.3060701@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 31-01-16 16:28, Bernd Kuhls wrote:
> The build error was not yet being found by the autobuilders:
> 
> omfile.c: In function ?prepareFile?:
> omfile.c:580:3: error: implicit declaration of function ?open? [-Werror=implicit-function-declaration]
>    fd = open((char*) newFileName, O_WRONLY|O_APPEND|O_CREAT|O_NOCTTY|O_CLOEXEC,
>    ^
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/rsyslog/rsyslog.hash | 2 ++
>  package/rsyslog/rsyslog.mk   | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/package/rsyslog/rsyslog.hash b/package/rsyslog/rsyslog.hash
> index 5f9e0ed..9d96edf 100644
> --- a/package/rsyslog/rsyslog.hash
> +++ b/package/rsyslog/rsyslog.hash
> @@ -1,2 +1,4 @@
>  # From http://www.rsyslog.com/downloads/download-v8-stable/
>  sha256	eab00e8e758cd9dd33b3e2cf6af80297d1951dc7db37bd723a6488a35d577adc	rsyslog-8.9.0.tar.gz
> +# Locally computed
> +sha256	feda2d9ca6c788e375116b6c43b6c4ac5debe83dab0efcfc9a47216c9af36599	musl-fix.patch
> diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
> index 5dde924..68b75a5 100644
> --- a/package/rsyslog/rsyslog.mk
> +++ b/package/rsyslog/rsyslog.mk
> @@ -6,6 +6,8 @@
>  
>  RSYSLOG_VERSION = 8.9.0
>  RSYSLOG_SITE = http://rsyslog.com/files/download/rsyslog
> +RSYSLOG_PATCH = \
> +	http://git.alpinelinux.org/cgit/aports/plain/main/rsyslog/musl-fix.patch

 Patch is not good, the #ifdef OS_SOLARIS should be removed. Like is done in
upstream commit 835571774dc519dd2cff7ab1020cf298cc953a8f. Please use that one
instead.


 Regards,
 Arnout

>  RSYSLOG_LICENSE = GPLv3, LGPLv3, Apache-2.0
>  RSYSLOG_LICENSE_FILES = COPYING COPYING.LESSER COPYING.ASL20
>  RSYSLOG_DEPENDENCIES = zlib libestr liblogging json-c host-pkgconf
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
