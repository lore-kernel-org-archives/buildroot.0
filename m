From: Ilias Apalodimas <apalos@gmail.com>
Date: Thu, 9 Mar 2017 09:39:00 +0200
Subject: [Buildroot] [PATCH] package/keepalived: fix compilation with
	musl
In-Reply-To: <1488999383-18704-1-git-send-email-yann.morin.1998@free.fr>
References: <1488999383-18704-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <CADvJCofycfKCZr3X_eMuur7CNLAxRwRe2oZ2Nh+LLkp+sbMHJg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
There's been a new version out since my commit. We can update to that
and see if the problem persists.

Regards
Ilias

On Wed, Mar 8, 2017 at 8:56 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Backport one patch from upstream to fix build without netlink.
> Add two patches to fix integer types.
>
> Fixes:
>     http://autobuild.buildroot.org/results/b61/b61c2cfa949c2a20f0702522857d78651207e6d2/
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Ilias Apalodimas <apalos@gmail.com>
> ---
>  ...onal-compilation-for-LIBIPVS-without-netl.patch | 35 +++++++++
>  .../0002-check-libipvs-add-missing-include.patch   | 36 +++++++++
>  .../0003-keepalived-ip_vs-fix-integer-types.patch  | 87 ++++++++++++++++++++++
>  3 files changed, 158 insertions(+)
>  create mode 100644 package/keepalived/0001-Fix-conditional-compilation-for-LIBIPVS-without-netl.patch
>  create mode 100644 package/keepalived/0002-check-libipvs-add-missing-include.patch
>  create mode 100644 package/keepalived/0003-keepalived-ip_vs-fix-integer-types.patch
>
> diff --git a/package/keepalived/0001-Fix-conditional-compilation-for-LIBIPVS-without-netl.patch b/package/keepalived/0001-Fix-conditional-compilation-for-LIBIPVS-without-netl.patch
> new file mode 100644
> index 0000000..ff2787c
> --- /dev/null
> +++ b/package/keepalived/0001-Fix-conditional-compilation-for-LIBIPVS-without-netl.patch
> @@ -0,0 +1,35 @@
> +From 79be21b0ace51d87e80d5a1baa439f726ccc2e69 Mon Sep 17 00:00:00 2001
> +From: Quentin Armitage <quentin@armitage.org.uk>
> +Date: Tue, 29 Nov 2016 11:37:15 +0000
> +Subject: [PATCH] Fix conditional compilation for LIBIPVS without netlink
> +
> +Signed-off-by: Quentin Armitage <quentin@armitage.org.uk>
> +[yann.morin.1998 at free.fr: backport from upstream 79be21b]
> +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +---
> + keepalived/check/libipvs.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/keepalived/check/libipvs.c b/keepalived/check/libipvs.c
> +index 1a7394a..5054daa 100644
> +--- a/keepalived/check/libipvs.c
> ++++ b/keepalived/check/libipvs.c
> +@@ -162,6 +162,7 @@ static struct nla_policy ipvs_stats_policy[IPVS_STATS_ATTR_MAX + 1] = {
> +       CHECK_IPV4(s, ret);
> + #endif
> +
> ++#ifdef LIBIPVS_USE_NL
> + #ifndef NLA_PUT_S32
> + #define NLA_PUT_S32(msg, attrtype, value) \
> +       NLA_PUT_TYPE(msg, int32_t, attrtype, value)
> +@@ -173,7 +174,6 @@ nla_get_s32(struct nlattr *attr)
> + }
> + #endif
> +
> +-#ifdef LIBIPVS_USE_NL
> + #ifndef FALLBACK_LIBNL1
> + static int nlerr2syserr(int err)
> + {
> +--
> +2.7.4
> +
> diff --git a/package/keepalived/0002-check-libipvs-add-missing-include.patch b/package/keepalived/0002-check-libipvs-add-missing-include.patch
> new file mode 100644
> index 0000000..253c2bc
> --- /dev/null
> +++ b/package/keepalived/0002-check-libipvs-add-missing-include.patch
> @@ -0,0 +1,36 @@
> +From accf32b0a293fbb3d877c9610e77f185e1e0d7d7 Mon Sep 17 00:00:00 2001
> +From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +Date: Wed, 8 Mar 2017 19:05:58 +0100
> +Subject: [PATCH] check/libipvs: add missing include
> +
> +u_int16_t et al. are from stdint.h, so it needs to be included.
> +
> +It happens to work on glibc and uClibc, becasue those C libraries are
> +very much lax on what headers they internally include, so stdint.h is
> +pulled in automagically.
> +
> +However, musl is very conservative and standards-compliant, so its
> +headers do not internally include much.
> +
> +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +---
> +Upstream status: https://github.com/acassen/keepalived/pull/540
> +---
> + keepalived/check/libipvs.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/keepalived/check/libipvs.c b/keepalived/check/libipvs.c
> +index 58c2746..9766fa7 100644
> +--- a/keepalived/check/libipvs.c
> ++++ b/keepalived/check/libipvs.c
> +@@ -26,6 +26,7 @@
> + #include <netinet/in.h>
> + #include <sys/socket.h>
> + #include <arpa/inet.h>
> ++#include <stdint.h>
> +
> + #ifdef LIBIPVS_USE_NL
> + #include <netlink/netlink.h>
> +--
> +2.7.4
> +
> diff --git a/package/keepalived/0003-keepalived-ip_vs-fix-integer-types.patch b/package/keepalived/0003-keepalived-ip_vs-fix-integer-types.patch
> new file mode 100644
> index 0000000..d499dac
> --- /dev/null
> +++ b/package/keepalived/0003-keepalived-ip_vs-fix-integer-types.patch
> @@ -0,0 +1,87 @@
> +From db4ed22c5b46cc7e0eb3096cfd4ce73f26537c65 Mon Sep 17 00:00:00 2001
> +From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +Date: Wed, 8 Mar 2017 19:18:49 +0100
> +Subject: [PATCH] keepalived/ip_vs: fix integer types
> +
> +The correct, standard integer types are uint8_t and uint16_t, not
> +u_int8_t nor u_int16_t (the latter being kernel types).
> +
> +glibc and uClibc may define the kernel-compatible types, but musl (which
> +is standards-compliant) does not.
> +
> +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +---
> +Upstream status: https://github.com/acassen/keepalived/pull/540
> +---
> + keepalived/include/ip_vs.h | 16 ++++++++--------
> + 1 file changed, 8 insertions(+), 8 deletions(-)
> +
> +diff --git a/keepalived/include/ip_vs.h b/keepalived/include/ip_vs.h
> +index 391fd6e..07d0ae4 100644
> +--- a/keepalived/include/ip_vs.h
> ++++ b/keepalived/include/ip_vs.h
> +@@ -36,7 +36,7 @@ typedef struct ip_vs_stats_user ip_vs_stats_t;
> +
> + struct ip_vs_service_app {
> +       struct ip_vs_service_user user;
> +-      u_int16_t               af;
> ++      uint16_t                af;
> +       union nf_inet_addr      nf_addr;
> + #ifdef _HAVE_PE_NAME_
> +       char                    pe_name[IP_VS_PENAME_MAXLEN];
> +@@ -45,7 +45,7 @@ struct ip_vs_service_app {
> +
> + struct ip_vs_dest_app {
> +       struct ip_vs_dest_user  user;
> +-      u_int16_t               af;
> ++      uint16_t                af;
> +       union nf_inet_addr      nf_addr;
> + };
> +
> +@@ -53,7 +53,7 @@ struct ip_vs_dest_app {
> + struct ip_vs_service_entry_app {
> +       struct ip_vs_service_entry user;
> +       ip_vs_stats_t           stats;
> +-      u_int16_t               af;
> ++      uint16_t                af;
> +       union nf_inet_addr      nf_addr;
> + #ifdef _HAVE_PE_NAME_
> +       char                    pe_name[IP_VS_PENAME_MAXLEN];
> +@@ -64,7 +64,7 @@ struct ip_vs_service_entry_app {
> + struct ip_vs_dest_entry_app {
> +       struct ip_vs_dest_entry user;
> +       ip_vs_stats_t           stats;
> +-      u_int16_t               af;
> ++      uint16_t                af;
> +       union nf_inet_addr      nf_addr;
> +
> + };
> +@@ -84,7 +84,7 @@ struct ip_vs_get_dests_app {
> +       struct ip_vs_dest_entry_app     entrytable[0];
> +       } user;
> +
> +-      u_int16_t               af;
> ++      uint16_t                af;
> +       union nf_inet_addr      nf_addr;
> + };
> +
> +@@ -126,13 +126,13 @@ struct ip_vs_daemon_app {
> +       uint16_t                sync_maxlen;
> +
> +       /* Multicast Port (base) */
> +-      u_int16_t               mcast_port;
> ++      uint16_t                mcast_port;
> +
> +       /* Multicast TTL */
> +-      u_int8_t                mcast_ttl;
> ++      uint8_t                 mcast_ttl;
> +
> +       /* Multicast Address Family */
> +-      u_int16_t               mcast_af;
> ++      uint16_t                mcast_af;
> +
> +       /* Multicast Address */
> +       union nf_inet_addr      mcast_group;
> +--
> +2.7.4
> +
> --
> 2.7.4
>
