From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 16 Jan 2018 15:27:27 +0100
Subject: [Buildroot] [PATCH v3] open-lldp: new package
In-Reply-To: <20180116110055.839-1-laurent_pubs@yahoo.com>
References: <20180116110055.839-1-laurent_pubs@yahoo.com>
Message-ID: <CAGm1_ksY2qSVsZXiMBc=-zFRDhZ2VZx5xj9g7fT3aCqJB6WaDQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jan 16, 2018 at 12:00 PM, Laurent Charpentier
<laurent_pubs@yahoo.com> wrote:
> The lldpad package comes with utilities to manage an LLDP interface with
> support for reading and configuring TLVs. TLVs and interfaces are individual
> controlled allowing flexible configuration for TX only, RX only, or TX/RX
> modes per TLV.
>
> http://open-lldp.org/
>
> Signed-off-by: Laurent Charpentier <laurent_pubs@yahoo.com>
>
> ---
> Changes v2 -> v3:
>   - added changes history
>   - added comment in Config.in (depends on !BR2_TOOLCHAIN_HAS_THREADS)
>   - removed comment in open-lldp.hash
>
> Changes v1 -> v2:
>   - removed call to bootstrap.sh. However the m4 directory needs to be
>     created for autoconf.
>   - added hash for COPYING.
>   - fixed gcc compile errors (inline functions).
> ---
>  DEVELOPERS                                         |  3 +
>  package/Config.in                                  |  1 +
>  ...1-vdptool-fixed-compile-error-for-getline.patch | 27 ++++++++
>  ...-functions-work-with-both-gnu11-and-gnu89.patch | 73 ++++++++++++++++++++++
>  package/open-lldp/Config.in                        | 15 +++++
>  package/open-lldp/open-lldp.hash                   |  3 +
>  package/open-lldp/open-lldp.mk                     | 24 +++++++
>  7 files changed, 146 insertions(+)
>  create mode 100644 package/open-lldp/0001-vdptool-fixed-compile-error-for-getline.patch
>  create mode 100644 package/open-lldp/0002-get-inline-functions-work-with-both-gnu11-and-gnu89.patch
>  create mode 100644 package/open-lldp/Config.in
>  create mode 100644 package/open-lldp/open-lldp.hash
>  create mode 100644 package/open-lldp/open-lldp.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 0e754456cb..07c31ce5e4 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -931,6 +931,9 @@ F:  package/qt5/
>  N:     Julien Floret <julien.floret@6wind.com>
>  F:     package/lldpd/
>
> +N:     Laurent Charpentier <laurent_pubs@yahoo.com>
> +F:     package/open-lldp/
> +
>  N:     Julien Viard de Galbert <julien@vdg.name>
>  F:     package/dieharder/
>  F:     package/easy-rsa/
> diff --git a/package/Config.in b/package/Config.in
> index 8e8e7581ce..b515066f6e 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1763,6 +1763,7 @@ endif
>         source "package/odhcp6c/Config.in"
>         source "package/odhcploc/Config.in"
>         source "package/olsr/Config.in"
> +       source "package/open-lldp/Config.in"
>         source "package/open-plc-utils/Config.in"
>         source "package/openntpd/Config.in"
>         source "package/openobex/Config.in"
> diff --git a/package/open-lldp/0001-vdptool-fixed-compile-error-for-getline.patch b/package/open-lldp/0001-vdptool-fixed-compile-error-for-getline.patch
> new file mode 100644
> index 0000000000..c20267786e
> --- /dev/null
> +++ b/package/open-lldp/0001-vdptool-fixed-compile-error-for-getline.patch
> @@ -0,0 +1,27 @@
> +From 3c7887bb8a61a3b49a2989329c756a038023c544 Mon Sep 17 00:00:00 2001
> +From: Laurent Charpentier <laurent_pubs@yahoo.com>
> +Date: Fri, 12 Jan 2018 12:25:41 +0100
> +Subject: [PATCH] vdptool: fixed compile error for getline()
> +
> +vdptool.c was generating an error: implicit declaration for the getline() function.
> +
> +Signed-off-by: Laurent Charpentier <laurent_pubs@yahoo.com>
> +---
> + vdptool.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/vdptool.c b/vdptool.c
> +index b805372..4930f6a 100644
> +--- a/vdptool.c
> ++++ b/vdptool.c
> +@@ -36,6 +36,7 @@
> +  * set and query VSI profile settings.
> +  */
> +
> ++#define _GNU_SOURCE
> + #include <stdlib.h>
> + #include <stdio.h>
> + #include <unistd.h>
> +--
> +2.14.3
> +
> diff --git a/package/open-lldp/0002-get-inline-functions-work-with-both-gnu11-and-gnu89.patch b/package/open-lldp/0002-get-inline-functions-work-with-both-gnu11-and-gnu89.patch
> new file mode 100644
> index 0000000000..57a23b2a70
> --- /dev/null
> +++ b/package/open-lldp/0002-get-inline-functions-work-with-both-gnu11-and-gnu89.patch
> @@ -0,0 +1,73 @@
> +From e186ca9ebda181f62504a1922559ef3ddae5e3b6 Mon Sep 17 00:00:00 2001
> +From: Laurent Charpentier <laurent_pubs@yahoo.com>
> +Date: Mon, 15 Jan 2018 11:24:45 +0100
> +Subject: [PATCH] get inline functions work with both gnu11 and gnu89
> +
> +After gcc upgraded to gcc5, and if the codes are compiled without optimization(-O0), and the below error will happen:
> +
> +./include/lldp_8021qaz.h:237:12: error: inline function 'ieee8021qaz_clif_cmd' declared but never defined [-Werror]
> + inline int ieee8021qaz_clif_cmd(void *data, struct sockaddr_un *from,
> +            ^
> +./include/lldp_8021qaz.h:222:13: error: inline function 'set_prio_map' declared but never defined [-Werror]
> + inline void set_prio_map(u32 *prio_map, u8 prio, int tc);
> +             ^
> +./include/lldp_8021qaz.h:221:12: error: inline function 'get_prio_map' declared but never defined [-Werror]
> + inline int get_prio_map(u32 prio_map, int tc);
> +
> +gcc5 defaults to -std=gnu11 instead of -std=gnu89, and it requires that exactly one C source file has the callable copy of the inline function.
> +
> +Signed-off-by: Laurent Charpentier <laurent_pubs@yahoo.com>
> +---
> + include/lldp_8021qaz.h | 6 ------
> + lldp_8021qaz.c         | 4 ++--
> + 2 files changed, 2 insertions(+), 8 deletions(-)
> +
> +diff --git a/include/lldp_8021qaz.h b/include/lldp_8021qaz.h
> +index 55353b8..09dee20 100644
> +--- a/include/lldp_8021qaz.h
> ++++ b/include/lldp_8021qaz.h
> +@@ -218,9 +218,6 @@ int ieee8021qaz_mod_app(struct app_tlv_head *head, int peer,
> +                       u8 prio, u8 sel, u16 proto, u32 ops);
> + int ieee8021qaz_app_sethw(char *ifname, struct app_tlv_head *head);
> +
> +-inline int get_prio_map(u32 prio_map, int tc);
> +-inline void set_prio_map(u32 *prio_map, u8 prio, int tc);
> +-
> + struct ieee8021qaz_tlvs *ieee8021qaz_data(const char *);
> +
> + int ieee8021qaz_tlvs_rxed(const char *ifname);
> +@@ -234,9 +231,6 @@ int ieee8021qaz_rchange(struct port *port, struct lldp_agent *,
> + void ieee8021qaz_ifup(char *ifname, struct lldp_agent *);
> + void ieee8021qaz_ifdown(char *ifname, struct lldp_agent *);
> + u8 ieee8021qaz_mibDeleteObject(struct port *port, struct lldp_agent *);
> +-inline int ieee8021qaz_clif_cmd(void *data, struct sockaddr_un *from,
> +-                              socklen_t fromlen, char *ibuf, int ilen,
> +-                              char *rbuf);
> + int ieee8021qaz_check_operstate(void);
> + int get_dcbx_hw(const char *ifname, __u8 *dcbx);
> +
> +diff --git a/lldp_8021qaz.c b/lldp_8021qaz.c
> +index 094676d..f154317 100644
> +--- a/lldp_8021qaz.c
> ++++ b/lldp_8021qaz.c
> +@@ -396,7 +396,7 @@ static int read_cfg_file(char *ifname, struct lldp_agent *agent,
> +       return 0;
> + }
> +
> +-inline int get_prio_map(u32 prio_map, int prio)
> ++static inline int get_prio_map(u32 prio_map, int prio)
> + {
> +       if (prio > 7)
> +               return 0;
> +@@ -404,7 +404,7 @@ inline int get_prio_map(u32 prio_map, int prio)
> +       return (prio_map >> (4 * (7-prio))) & 0xF;
> + }
> +
> +-inline void set_prio_map(u32 *prio_map, u8 prio, int tc)
> ++static inline void set_prio_map(u32 *prio_map, u8 prio, int tc)
> + {
> +       u32 mask = ~(0xffffffff & (0xF << (4 * (7-prio))));
> +       *prio_map &= mask;
> +--
> +2.14.3
> +
> diff --git a/package/open-lldp/Config.in b/package/open-lldp/Config.in
> new file mode 100644
> index 0000000000..d54cf181d3
> --- /dev/null
> +++ b/package/open-lldp/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_OPEN_LLDP
> +       bool "open-lldp"
> +       depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
> +       select BR2_PACKAGE_LIBCONFIG
> +       select BR2_PACKAGE_LIBNL
> +       select BR2_PACKAGE_READLINE
> +       help
> +         This package contains the Linux user space daemon and
> +         configuration tool for Intel LLDP Agent with Enhanced Ethernet
> +         support for the Data Center.
> +
> +         http://open-lldp.org/
> +
> +comment "open-lldp needs a toolchain w/ threads"
> +       depends on !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/open-lldp/open-lldp.hash b/package/open-lldp/open-lldp.hash
> new file mode 100644
> index 0000000000..fdd85fed4f
> --- /dev/null
> +++ b/package/open-lldp/open-lldp.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256 f2c8a3307970374b01ad832ea18cf6d9abce6f00b3d8aed9305aa1428ad8252d  open-lldp-036e314bd93602f7388262cc37faf8b626980af1.tar.gz
> +sha256 67af5abeb092213cd9c53781503320f635ba28b641e0c3f24d367e8e93a9839b  COPYING
> diff --git a/package/open-lldp/open-lldp.mk b/package/open-lldp/open-lldp.mk
> new file mode 100644
> index 0000000000..76dda52085
> --- /dev/null
> +++ b/package/open-lldp/open-lldp.mk
> @@ -0,0 +1,24 @@
> +################################################################################
> +#
> +# open-lldp
> +#
> +################################################################################
> +
> +OPEN_LLDP_VERSION = 036e314bd93602f7388262cc37faf8b626980af1
> +OPEN_LLDP_SITE = git://open-lldp.org/open-lldp.git
> +OPEN_LLDP_DEPENDENCIES = readline libnl libconfig

host-pkgconf must be added as this tool will be used to find libnl
etc. in configure script.

Yegor

> +OPEN_LLDP_LICENSE = GPL-2.0
> +OPEN_LLDP_LICENSE_FILES = COPYING
> +
> +# Fetching from git, need to generate configure/Makefile.in
> +OPEN_LLDP_AUTORECONF = YES
> +
> +# Create the m4 directory (missing from the archive).
> +# This is required for autoconf.
> +define OPEN_LLDP_BOOTSTRAP
> +       mkdir -p $(@D)/m4
> +endef
> +
> +OPEN_LLDP_PRE_CONFIGURE_HOOKS += OPEN_LLDP_BOOTSTRAP
> +
> +$(eval $(autotools-package))
> --
> 2.14.3
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
