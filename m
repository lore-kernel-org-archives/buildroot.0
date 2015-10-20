From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 20 Oct 2015 20:57:28 +0200
Subject: [Buildroot] [PATCH] syslog-ng: Specify location of libesmtp
In-Reply-To: <1445328991-29416-1-git-send-email-judge.packham@gmail.com>
References: <1445328991-29416-1-git-send-email-judge.packham@gmail.com>
Message-ID: <20151020205728.6f2d2332@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Chris,

On Tue, 20 Oct 2015 21:16:31 +1300, Chris Packham <judge.packham@gmail.com> wrote:

> If --with-libesmtp is omitted a host tool is invoked to detect the
> location of the library and headers, which is obviously the wrong thing
> for a cross-compile environment. Explicitly add --with-libesmtp to
> resolve this.
> 
> Fixes:
> http://git.buildroot.net/buildroot/commit/?id=539acb7500588d0a277357cf831c9f25f770578d
> http://git.buildroot.net/buildroot/commit/?id=01f41585a78406f6e830d5eaf4413a983812a299
> 
> Signed-off-by: Chris Packham <judge.packham@gmail.com>
> ---
>  package/syslog-ng/syslog-ng.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
> index 7371060..2bbace8 100644
> --- a/package/syslog-ng/syslog-ng.mk
> +++ b/package/syslog-ng/syslog-ng.mk
> @@ -37,6 +37,7 @@ endif
>  ifeq ($(BR2_PACKAGE_LIBESMTP),y)
>  SYSLOG_NG_DEPENDENCIES += libesmtp
>  SYSLOG_NG_CONF_OPTS += --enable-smtp
> +SYSLOG_NG_CONF_OPTS += --with-libesmtp="$(STAGING_DIR)/usr"
>  else
>  SYSLOG_NG_CONF_OPTS += --disable-smtp
>  endif

The buildroot package libestmp provides a libesmtp-config script, but
it is installed into

	host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/bin/libesmtp-config

where it is not found by the syslog-ng configure script... 

Would a more portable solution be to add this search path (or fix the install
location of libestmp-config) for the syslog-ng configure call (libesmtp-config
--libs gives '-pthread -L[...]/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib
-lesmtp -lssl -lcrypto -ldl')?

Regards,
Peter
