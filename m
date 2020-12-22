From: Antoine Tenart <atenart@kernel.org>
Date: Tue, 22 Dec 2020 16:54:55 +0100
Subject: [Buildroot] [PATCH 00/15] packages: Add SELinux modules to some
 packages
In-Reply-To: <20201222150736.319593-1-maxime.chevallier@bootlin.com>
References: <20201222150736.319593-1-maxime.chevallier@bootlin.com>
Message-ID: <160865249576.1448242.9915039771107087372@kwain.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maxime,

Quoting Maxime Chevallier (2020-12-22 16:07:21)
> 
> Following the recent support for the SELinux refpolicy and the ability
> for packages to select their own SELinux module in the refpolicy [1],
> this series adds a first batch of matching between packages and their
> respective module.

Nice to see packages using this feature :)

> This series focuses on the tools that are impacted by the following
> modules in the refpolicy [2] :
> 
>   - services/networkmanager, which adds support for :
>     - dhcp

I'm not sure about this one. When looking at the module definitions
dhclient and dhcpcd seem to be supported by system/sysnetwork rather
than than by services/networkmanager. (Haven't built an image to test
though).

>     - iwd
>     - network-manager
>     - wpa_supplicant
> 
>   - system/ipatbles, which adds support for :
>     - ebtables
>     - ipset
>     - iptables
>     - nftables
> 
>   - admin/netutils, which adds support for :
>     - fping
>     - iputils

iputils can install lots of utilities based on the configuration, many
of which are supported by admin/netutils. Some are not supported in the
refpolicy, and some by other modules, such as rdisc or tftpd.

I think the selinux module selection should be conditional depending on
the utilities installed by the iputils package, to avoid installing an
unused selinux module and to fix the support of others.

>     - mtr
>     - nmap
>     - tcpdump
> 
>   - services/entropyd, which adds support for :
>     - haveged
>     - jitterentropy-library

The other selinux module selections LGTM.

> With this series, the above-mentionned tools can now be used on systems
> that have SELinux enabled.
> 
> This series was split per-package, which generates lots of one-liner
> patches. Due to the nature of the changes, I expect more patches like
> that to follow, so we might also use a "one package per module" approach
> if you want.

> Maxime Chevallier (15):
>   packages/dhcp: add SELinux module

Nitpick: s/packages/package/

>   package/iwd: add SELinux module
>   package/network-manager: add SELinux module
>   package/wpa_supplicant: add SELinux module
>   package/ebtables: add SELinux module
>   package/ipset: add SELinux module
>   package/iptables: add SELinux module
>   package/nftables: add SELinux module
>   package/fping: add SELinux module
>   package/iputils: add SELinux module
>   package/mtr: add SELinux module
>   package/nmap: add SELinux module
>   package/tcpdump: add SELinux module
>   package/haveged: add SELinux module
>   package/jitterentropy-library: add SELinux module

Thanks!
Antoine
