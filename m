From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 2 Feb 2016 15:41:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/sysklogd: fix musl build
In-Reply-To: <1454265678-11022-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454265678-11022-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <56B0C032.20305@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 31-01-16 19:41, Bernd Kuhls wrote:
> The build error was not yet found by the autobuilders:
> 
> In file included from klogd.c:266:0:
> /home/bernd/buildroot/br3/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/linux/time.h:9:8: error: redefinition of ?struct timespec?
>  struct timespec {
>         ^
> and many others
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/sysklogd/sysklogd.hash | 1 +
>  package/sysklogd/sysklogd.mk   | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/package/sysklogd/sysklogd.hash b/package/sysklogd/sysklogd.hash
> index dd5b89a..aa3bc24 100644
> --- a/package/sysklogd/sysklogd.hash
> +++ b/package/sysklogd/sysklogd.hash
> @@ -1,2 +1,3 @@
>  # Locally calculated from download (no sig, hash)
>  sha256	5166c185ae23c92e8b9feee66a6e3d0bc944bf673112f53e3ecf62e08ce7c201	sysklogd-1.5.1.tar.gz
> +sha256	fd235a445a2fb0100cd84e201b7a0a14e515517b74106cf4dcfd8d820af7bc21	fix-includes.patch
> diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
> index de2edf4..a4730b7 100644
> --- a/package/sysklogd/sysklogd.mk
> +++ b/package/sysklogd/sysklogd.mk
> @@ -6,6 +6,8 @@
>  
>  SYSKLOGD_VERSION = 1.5.1
>  SYSKLOGD_SITE = http://www.infodrom.org/projects/sysklogd/download
> +SYSKLOGD_PATCH = \
> +	http://git.alpinelinux.org/cgit/aports/plain/main/sysklogd/fix-includes.patch

 I wonder if it was ever supposed to support non-Linux use cases. Patch should
be part of buildroot after all, and the commit message can be:

Use standard includes instead of glibc-specific version

This fixes the musl build. Some of the non-glibc support is just plain wrong,
it's unclear what it was supposed to work on anyway.



 With that:
 Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

>  SYSKLOGD_LICENSE = GPLv2+
>  SYSKLOGD_LICENSE_FILES = COPYING
>  
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
