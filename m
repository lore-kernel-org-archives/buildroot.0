From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 6 Nov 2013 15:26:20 +0100
Subject: [Buildroot] [PATCH v2] connman: disable on avr32
In-Reply-To: <1383743283-13069-1-git-send-email-spdawson@gmail.com>
References: <1383743283-13069-1-git-send-email-spdawson@gmail.com>
Message-ID: <CAAXf6LUdSVF8SMyZ5J=udYB_XSrWgZqOu97zWZ1X2z42Cc3H2A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Simon,

On Wed, Nov 6, 2013 at 2:08 PM,  <spdawson@gmail.com> wrote:
> From: Simon Dawson <spdawson@gmail.com>
>
> The inotify_init1 syscall is not available on avr32. Fixes build failures
> such as the following.
>
>   http://autobuild.buildroot.net/results/0d8/0d8e7bd8bd3f227fabfb0d5feb59a5d316026d3f
>
> Signed-off-by: Simon Dawson <spdawson@gmail.com>
> ---
>  v2: Disable comment on avr32, as suggested by Thomas De Schampheleire
>
>  package/connman/Config.in | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/package/connman/Config.in b/package/connman/Config.in
> index c74618a..e0a6782 100644
> --- a/package/connman/Config.in
> +++ b/package/connman/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_CONNMAN
>         select BR2_PACKAGE_LIBGLIB2
>         select BR2_PACKAGE_IPTABLES
>         select BR2_PACKAGE_GNUTLS
> +       depends on !BR2_avr32 # no inotify_init1
>         depends on !BR2_UCLIBC_VERSION_0_9_32
>         depends on BR2_USE_WCHAR # libglib2 and gnutls
>         depends on BR2_INET_IPV6
> @@ -50,5 +51,6 @@ config BR2_PACKAGE_CONNMAN_CLIENT
>  endif # BR2_PACKAGE_CONNMAN
>
>  comment "connman needs a toolchain w/ IPv6, wchar, threads, resolver"
> -       depends on BR2_UCLIBC_VERSION_0_9_32 || \
> +       depends on !BR2_avr32 && \
> +               BR2_UCLIBC_VERSION_0_9_32 || \
>                 !BR2_USE_WCHAR || !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS

In my patches
http://patchwork.ozlabs.org/patch/288125/
http://patchwork.ozlabs.org/patch/288250/

I have used two separate depends on statements, to separate the base
dependencies (that are common for the comment and its corresponding
config) from the toolchain options (that are the inverse on the
comment compared to the config option).

So in case of connman this would be:
comment "connman needs a toolchain w/ IPv6, wchar, threads, resolver"
       depends on !BR2_avr32
       depends on BR2_UCLIBC_VERSION_0_9_32 || \
               !BR2_USE_WCHAR || !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS

Best regards,
Thomas
