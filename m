From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 24 Nov 2019 19:42:18 +0100
Subject: [Buildroot] [PATCH] pkgconf: Always keep system libs
In-Reply-To: <20191121183659.1804967-1-thomas.preston@codethink.co.uk>
References: <20191121183659.1804967-1-thomas.preston@codethink.co.uk>
Message-ID: <20191124194218.024c82cf@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Thu, 21 Nov 2019 18:36:59 +0000, Thomas Preston <thomas.preston@codethink.co.uk> wrote:

> Normally pkgconf ignores the system include and system lib directories,
> which is useful because it allows the correct ordering of -I, -isystem
> and compiler default search paths. However, many packages use libtool,
> which relies on pkgconf to print the system libs dirs in order to locate
> the Libtool Archive (.la) files.
>
> Instead of adding PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 to each of these
> packages, just allow system libs globally in the pkg-config wrapper.
> This allows libtool to find the .la files, and retains the correct
> include ordering.
>
> Fixes (at least):
> - http://autobuild.buildroot.org/results/a79e0487135ad90530595d5c6ecc32f9c8cea7c4/
> - http://autobuild.buildroot.net/results/089/08952dbf89bf3c49da7697943441cee411940420/
>
> Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>

In favour of a general pgkconf solution (instead fixing individual packages) and
tested for the libv4l and gmpc cases, you can add my

Tested-by: Peter Seiderer <ps.report@gmx.net>

Only nitpick for the subject line s/Always/always/...

Regards,
Peter

> ---
>  package/pkgconf/pkg-config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/pkgconf/pkg-config.in b/package/pkgconf/pkg-config.in
> index f411eb0926..e5a23a10f7 100644
> --- a/package/pkgconf/pkg-config.in
> +++ b/package/pkgconf/pkg-config.in
> @@ -9,4 +9,4 @@ PKG_CONFIG_LIBDIR=${PKG_CONFIG_LIBDIR:-${DEFAULT_PKG_CONFIG_LIBDIR}} \
>  	PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR:-${DEFAULT_PKG_CONFIG_SYSROOT_DIR}} \
>  	PKG_CONFIG_SYSTEM_INCLUDE_PATH=${PKG_CONFIG_SYSTEM_INCLUDE_PATH:-${DEFAULT_PKG_CONFIG_SYSTEM_INCLUDE_PATH}} \
>  	PKG_CONFIG_SYSTEM_LIBRARY_PATH=${PKG_CONFIG_SYSTEM_LIBRARY_PATH:-${DEFAULT_PKG_CONFIG_SYSTEM_LIBRARY_PATH}} \
> -	exec ${PKGCONFDIR}/pkgconf @STATIC@ "$@"
> +	exec ${PKGCONFDIR}/pkgconf --keep-system-libs @STATIC@ "$@"
