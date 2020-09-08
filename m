From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 9 Sep 2020 00:28:46 +0200
Subject: [Buildroot] [PATCH 2020.02.x v2 3/4] package/systemd: Backport
 fix for network-generator
In-Reply-To: <20200908221256.126984-3-brandon.maier@rockwellcollins.com>
References: <20200908221256.126984-1-brandon.maier@rockwellcollins.com>
 <20200908221256.126984-3-brandon.maier@rockwellcollins.com>
Message-ID: <20200908222846.GK14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Brandon, All,

On 2020-09-08 17:12 -0500, Brandon Maier spake thusly:
> The systemd-network-generator.service will fail to parse the bootarg "ip=xxx"
> if it's missing the (optional) hostname field. Backport this fix from
> systemd v245.
> 
> Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
> ---
> v2:
> - Add "backport from" and SoB

Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  ...twork-generator-allow-empty-hostname.patch | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 package/systemd/0003-network-generator-allow-empty-hostname.patch
> 
> diff --git a/package/systemd/0003-network-generator-allow-empty-hostname.patch b/package/systemd/0003-network-generator-allow-empty-hostname.patch
> new file mode 100644
> index 0000000000..8d1f3aa86f
> --- /dev/null
> +++ b/package/systemd/0003-network-generator-allow-empty-hostname.patch
> @@ -0,0 +1,44 @@
> +From 21a925a4ac7955e7d7e6cfd477e96d3a2aaee7db Mon Sep 17 00:00:00 2001
> +From: Yu Watanabe <watanabe.yu+github@gmail.com>
> +Date: Thu, 12 Dec 2019 19:01:21 +0900
> +Subject: [PATCH 1/1] network-generator: allow empty hostname
> +
> +Fixes #14319.
> +
> +[Brandon: backport from https://github.com/systemd/systemd/commit/21a925a4ac7955e7d7e6cfd477e96d3a2aaee7db]
> +Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
> +---
> + src/network/generator/network-generator.c | 10 ++++++----
> + 1 file changed, 6 insertions(+), 4 deletions(-)
> +
> +diff --git a/src/network/generator/network-generator.c b/src/network/generator/network-generator.c
> +index 81afa95307..bed1e42697 100644
> +--- a/src/network/generator/network-generator.c
> ++++ b/src/network/generator/network-generator.c
> +@@ -574,7 +574,7 @@ static int parse_netmask_or_prefixlen(int family, const char **value, unsigned c
> + 
> + static int parse_cmdline_ip_address(Context *context, int family, const char *value) {
> +         union in_addr_union addr = {}, peer = {}, gateway = {};
> +-        const char *hostname, *ifname, *dhcp_type, *dns, *p;
> ++        const char *hostname = NULL, *ifname, *dhcp_type, *dns, *p;
> +         unsigned char prefixlen;
> +         int r;
> + 
> +@@ -599,9 +599,11 @@ static int parse_cmdline_ip_address(Context *context, int family, const char *va
> +         if (!p)
> +                 return -EINVAL;
> + 
> +-        hostname = strndupa(value, p - value);
> +-        if (!hostname_is_valid(hostname, false))
> +-                return -EINVAL;
> ++        if (p != value) {
> ++                hostname = strndupa(value, p - value);
> ++                if (!hostname_is_valid(hostname, false))
> ++                        return -EINVAL;
> ++        }
> + 
> +         value = p + 1;
> + 
> +-- 
> +2.23.0
> +
> -- 
> 2.28.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
