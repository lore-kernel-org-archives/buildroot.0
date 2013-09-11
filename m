From: Axel Lin <axel.lin@ingics.com>
Date: Wed, 11 Sep 2013 08:48:34 +0800
Subject: [Buildroot] [PATCH 07/11] ulogd: needs mmu and shared objects
In-Reply-To: <1378841180-23467-7-git-send-email-gustavo@zacarias.com.ar>
References: <1378841180-23467-1-git-send-email-gustavo@zacarias.com.ar>
 <1378841180-23467-7-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <CAFRkauD7kWP2dNfTpWGjwZFDFtQZ7LXLCLHYHdG7xBy5EohhJw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/9/11 Gustavo Zacarias <gustavo@zacarias.com.ar>:
> The plugin infrastructure is based on shared objects so it won't build
> for static-only scenarios.
> And the daemon uses fork() so MMU is required.
>
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/ulogd/Config.in | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/package/ulogd/Config.in b/package/ulogd/Config.in
> index 7dc4f11..a524056 100644
> --- a/package/ulogd/Config.in
> +++ b/package/ulogd/Config.in
> @@ -2,6 +2,8 @@ config BR2_PACKAGE_ULOGD
>         bool "ulogd"
>         depends on BR2_INET_IPV6
>         depends on BR2_LARGEFILE
> +       depends on !BR2_PREFER_STATIC_LIB
> +       depends on BR2_USE_MMU
>         select BR2_PACKAGE_LIBMNL
>         select BR2_PACKAGE_LIBNETFILTER_ACCT
>         select BR2_PACKAGE_LIBNETFILTER_CONNTRACK
> @@ -12,5 +14,6 @@ config BR2_PACKAGE_ULOGD
>
>           http://www.netfilter.org/projects/ulogd/
>
> -comment "ulogd requires a toolchain with IPV6 and LARGEFILE support"
> -       depends on !BR2_INET_IPV6 || !BR2_LARGEFILE
> +comment "ulogd requires a toolchain with IPV6, LARGEFILE and dynamic library support"
> +       depends on !BR2_INET_IPV6 || !BR2_LARGEFILE || BR2_PREFER_STATIC_LIB
> +       depends on BR2_USE_MMU
I guess what you want is "depends on !BR2_USE_MMU" here?
