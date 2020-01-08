From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 8 Jan 2020 22:09:29 +0100
Subject: [Buildroot] [PATCH 0/2] package/wireguard upgrade
In-Reply-To: <20200106104731.13306-1-peter@korsgaard.com>
References: <20200106104731.13306-1-peter@korsgaard.com>
Message-ID: <20200108210929.GD17943@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2020-01-06 11:47 +0100, Peter Korsgaard spake thusly:
> With the kernel support for WireGuard getting mainlined, the upstream repo
> has been split in a wireguard-tools repo for the userspace tooling and
> wireguard-linux-compat for the kernel side (for 3.10+ legacy kernels).
> 
> This series changes the wireguard package to use the wireguard-tools
> repo and adds a package for wireguard-linux-compat.

So, previously, selecting BR2_PACKAGE_WIREGUARD would build both the
kernel module and the userland tools, as they were packagesd in a single
upstream package.

Now, they are separated into two different upstream packages, namely
wireguard-tools and wireguard-linux-compat.

With your patchset, an existing defconfig will now only build the
userland tools, even if the user would still need the kernel module for
older kernels.

So, my proposal would be to have a single patch that introduces the
split, with a renaming of the existing wireguard package, and a legacy
symbol that selects both the userland tools and the compat module.

This would allow existing configs to stay to iso-functionality. Thanks
to the legacy handling, the user will notice and will have to confirm
they still need/want the kernel module, and they can disable it if not.

Thoughts?

Regards,
Yann E. MORIN.

> Peter Korsgaard (2):
>   package/wireguard: change to the wireguard-tools package
>   package/wireguard-linux-compat: new package
> 
>  DEVELOPERS                                    |  1 +
>  package/Config.in                             |  1 +
>  package/wireguard-linux-compat/Config.in      | 23 +++++++++++++++++++
>  .../wireguard-linux-compat.hash               |  4 ++++
>  .../wireguard-linux-compat.mk                 | 15 ++++++++++++
>  package/wireguard/Config.in                   |  9 ++++----
>  package/wireguard/wireguard.hash              |  4 ++--
>  package/wireguard/wireguard.mk                | 15 ++++--------
>  8 files changed, 55 insertions(+), 17 deletions(-)
>  create mode 100644 package/wireguard-linux-compat/Config.in
>  create mode 100644 package/wireguard-linux-compat/wireguard-linux-compat.hash
>  create mode 100644 package/wireguard-linux-compat/wireguard-linux-compat.mk
> 
> -- 
> 2.20.1
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
