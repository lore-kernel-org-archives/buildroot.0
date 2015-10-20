From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 20 Oct 2015 22:33:26 +0200
Subject: [Buildroot] [PATCH 1/1] Add more options to eudev package.
In-Reply-To: <CAOcYpt2ah7+P2ZJyzN+i0DjxE+x9LiDZPWwg6zqMxzi-x7BhKQ@mail.gmail.com>
References: <CAOcYpt2ah7+P2ZJyzN+i0DjxE+x9LiDZPWwg6zqMxzi-x7BhKQ@mail.gmail.com>
Message-ID: <20151020203326.GA31310@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

David, All,

On 2015-10-20 20:44 +0200, David Kosir spake thusly:
> From de239fceb033d278ef70924bcea5c0a18b1f930d Mon Sep 17 00:00:00 2001
> From: David Kosir <david.kosir@bylapis.com>
> Date: Tue, 20 Oct 2015 19:45:28 +0200
> Subject: [PATCH 1/1] Add more options to eudev package.
> 
> Making possible to install only in /, avoiding /usr.
> Also, make opinional to use kmod.

Thanks for your patch.

However, I have a few comments.

First, your patch does two changes:
  - make kmod optional
  - change prefix to / or /usr

Therefore, it should have been split in two patches, each doing exactly
one separate semantic change.

> Signed-off-by: David Kosir <david.kosir@bylapis.com>
> ---
>  package/eudev/Config.in | 12 +++++++++++-
>  package/eudev/eudev.mk  | 16 +++++++++++++---
>  2 files changed, 24 insertions(+), 4 deletions(-)
> 
> diff --git a/package/eudev/Config.in b/package/eudev/Config.in
> index 76df409..2474444 100644
> --- a/package/eudev/Config.in
> +++ b/package/eudev/Config.in
> @@ -7,7 +7,6 @@ config BR2_PACKAGE_EUDEV
>      select BR2_PACKAGE_HAS_UDEV
>      select BR2_PACKAGE_UTIL_LINUX
>      select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
> -    select BR2_PACKAGE_KMOD

Indeed, kmod seems to now be optional.

>      help
>        Userspace device daemon. This is a standalone version,
>        independent of systemd. It is a fork maintained by Gentoo.
> @@ -22,6 +21,12 @@ if BR2_PACKAGE_EUDEV
>  config BR2_PACKAGE_PROVIDES_UDEV
>      default "eudev"
> 
> +config BR2_PACKAGE_EUDEV_AVOID_USR
> +    bool "don't install to /usr"
> +    help
> +      Avoid installing to /usr, use (e)prefix=/
> +      Useful when having separate /usr partition.

We recently committed an option to merge / and /usr. How does your
change compare with that option?

See:
    http://git.buildroot.org/buildroot/commit/?id=c5bd8af65e50a51735eb112fed9cbe6337f14e06

>  config BR2_PACKAGE_EUDEV_RULES_GEN
>      bool "enable rules generator"
>      help
> @@ -33,6 +38,11 @@ config BR2_PACKAGE_EUDEV_ENABLE_HWDB
>      help
>        Enables hardware database installation to /etc/udev/hwdb.d
> 
> +config BR2_PACKAGE_EUDEV_ENABLE_KMOD
> +    bool "enable kernel module support"
> +    select BR2_PACKAGE_KMOD
> +    help
> +      Enable loadable kernel modules support (kmod)

In this case, what we usually do is:
  - we do not add such option above;
  - we enable the support if the corresponding package is enabled.

Which in this case would translate to a simple change in the .mk :

    ifeq ($(BR2_PACKAGE_KMOD),y)
    EUDEV_DEPENDENCIES += kmod
    EUDEV_CONF_OPTS += --enable-libkmod
    else
    EUDEV_CONF_OPTS += --disable-libkmod
    endif

And that's all (for kmod).

Care to split the patch in two and resend that?
Also, please explain a bit more the / vs. /usr thingy.

In the meantime, I marked this patch as "cjhamges requested" in our
patchwork.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
