From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 11 Apr 2012 12:05:30 +0200
Subject: [Buildroot] [PATCH] package: set PKG_CONFIG_SYSROOT_DIR in
	HOST_MAKE_ENV
In-Reply-To: <1333543819-27718-1-git-send-email-s.neumann@raumfeld.com>
References: <1333543819-27718-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <1334138730.3070.2.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, 2012-04-04 at 14:50 +0200, Sven Neumann wrote:
> A host package that uses AUTORECONF (such as host-libglib2)
> may end up running './config.status --recheck'. This will
> call the configure script with the environment variables
> set in HOST_MAKE_ENV. If PKG_CONFIG_SYSROOT_DIR is missing
> this will cause the hardcoded sysroot dir take effect leading
> to wrong paths.
> 
> See commit 22acade2ec311 which works around this problem by
> fiddling with the generated .pc file. This commit becomes
> obsolete with this fix.22acade2ec311
> 
> Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
> Cc: Daniel Mack <zonque@gmail.com>
> ---
>  package/Makefile.in |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index dc8d038..c344c6b 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -222,6 +222,7 @@ HOST_CONFIGURE_OPTS=PATH=$(HOST_PATH) \
>  HOST_MAKE_ENV=PATH=$(HOST_PATH) \
>  		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)" \
>  		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
> +		PKG_CONFIG_SYSROOT_DIR="/" \
>  		PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig" \
>  		PERLLIB="$(HOST_DIR)/usr/lib/perl"
>  

Any feedback on this? This small change fixes an important problem and
makes the workaround from 22acade2ec311 obsolete. Please consider it for
inclusion.


Regards,
Sven
