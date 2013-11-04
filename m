From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 4 Nov 2013 12:26:18 +0100
Subject: [Buildroot] [PATCH] sconeserver: Can't be built with uClibc.
In-Reply-To: <1383561492-4646-1-git-send-email-sonic.adi@gmail.com>
References: <1383561492-4646-1-git-send-email-sonic.adi@gmail.com>
Message-ID: <CAAXf6LWXWvKyxYCo8eSDOzSDTGExOdtO0iRTKFmmOs0yL=o6jQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sonic,

On Mon, Nov 4, 2013 at 11:38 AM, Sonic Zhang <sonic.adi@gmail.com> wrote:
> From: Sonic Zhang <sonic.zhang@analog.com>
>
> General shadow password file API such as getspnam is not supported in uClibc.
>
> Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
> ---
>  package/sconeserver/Config.in |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/sconeserver/Config.in b/package/sconeserver/Config.in
> index 58c1e03..d4a2b6d 100644
> --- a/package/sconeserver/Config.in
> +++ b/package/sconeserver/Config.in
> @@ -2,6 +2,7 @@ menuconfig BR2_PACKAGE_SCONESERVER
>         bool "sconeserver"
>         depends on BR2_INSTALL_LIBSTDCPP
>         depends on BR2_TOOLCHAIN_HAS_THREADS
> +       depends on !BR2_TOOLCHAIN_USES_UCLIBC
>         select BR2_PACKAGE_PCRE
>         help
>           Sconeserver is a modular, object-orientated and extremely versatile

You should also update the comment at the bottom of that file, it
currently says:

comment "sconeserver needs a toolchain w/ C++, threads"
        depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)

According to the manual, this could become:

comment "sconeserver needs an (e)glibc toolchain w/ C++, threads"
        depends on !(BR2_INSTALL_LIBSTDCPP &&
BR2_TOOLCHAIN_HAS_THREADS && !BR2_TOOLCHAIN_USES_UCLIBC)

but we recently added musl support which does seem to have getspnam().
Therefore, I think the following comment would be more appropriate:
sconeserver needs a non-uClibc toolchain w/ C++, threads

Best regards,
Thomas
