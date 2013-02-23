From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 23 Feb 2013 18:48:16 +0100
Subject: [Buildroot] [PATCH] new package: adns
In-Reply-To: <1360959402-24775-1-git-send-email-stefan.froberg@petroprogram.com>
References: <1360959402-24775-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <512900E0.9080605@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/02/13 21:16, Stefan Fr?berg wrote:
> GNU adns
>
> Advanced, easy to use, asynchronous-capable DNS client library and utilities.

  It's not really necessary to repeat the help text in the commit message.

>
> adns is a resolver library for C (and C++) programs, and a collection of
> useful DNS resolver utilities.

  Isn't this just repeating the above?

>
> Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
[snip]
> diff --git a/package/adns/adns-1.4-cnamechain.patch b/package/adns/adns-1.4-cnamechain.patch
> new file mode 100644
> index 0000000..1eadf54
> --- /dev/null
> +++ b/package/adns/adns-1.4-cnamechain.patch
> @@ -0,0 +1,1275 @@
> +[ADNS] Re: CNAME chains

  Could you start the patch with a link to the place where you found it, 
and your Signed-off-by?

> +Brad Spencer spencer at infointeractive.com
> +Mon, 28 Aug 2006 14:43:00 -0300
[snip]
> +diff -Naur adns-1.4.org/src/internal.h adns-1.4/src/internal.h
> +--- adns-1.4.org/src/internal.h	2013-01-02 19:55:38.935194976 +0200
> ++++ adns-1.4/src/internal.h	2013-01-02 19:55:47.129330386 +0200
> +@@ -231,6 +231,9 @@
> +   int cname_dglen, cname_begin;
> +   /* If non-0, has been allocated using . */
> +
> ++  int cname_alias_hops_left;
> ++  /* The number of cname alias hops we will allow */
> ++
> +   vbuf search_vb;
> +   int search_origlen, search_pos, search_doneabs;
> +   /* Used by the searching algorithm.  The query domain in textual form
> +diff -Naur adns-1.4.org/src/internal.h.orig adns-1.4/src/internal.h.orig
> +--- adns-1.4.org/src/internal.h.orig	1970-01-01 02:00:00.000000000 +0200
> ++++ adns-1.4/src/internal.h.orig	2006-04-08 17:36:57.000000000 +0300

  This file is redundant.

[snip]
> +diff -Naur adns-1.4.org/src/query.c adns-1.4/src/query.c
> +--- adns-1.4.org/src/query.c	2013-01-02 19:55:38.931192468 +0200
> ++++ adns-1.4/src/query.c	2013-01-02 19:55:47.131331642 +0200
> +@@ -63,6 +63,8 @@
> +
> +   qu->cname_dgram= 0;
> +   qu->cname_dglen= qu->cname_begin= 0;
> ++  /* Allow CNAME chains up to some sane limit */
> ++  qu->cname_alias_hops_left = 10;
> +
> +   adns__vbuf_init(&qu->search_vb);
> +   qu->search_origlen= qu->search_pos= qu->search_doneabs= 0;
> +diff -Naur adns-1.4.org/src/reply.c adns-1.4/src/reply.c
> +--- adns-1.4.org/src/reply.c	2013-01-02 19:55:38.936195603 +0200
> ++++ adns-1.4/src/reply.c	2013-01-02 19:55:47.134333524 +0200
> +@@ -190,12 +190,13 @@
> +       if (qu->flags & adns_qf_cname_forbid) {
> + 	adns__query_fail(qu,adns_s_prohibitedcname);
> + 	return;
> +-      } else if (qu->cname_dgram) { /* Ignore second and subsequent CNAME(s) */
> ++      } else if (qu->cname_dgram && --(qu->cname_alias_hops_left) <= 0) { /* Don't follow "too long" CNAME chains */
> + 	adns__debug(ads,serv,qu,"allegedly canonical name %s"
> +-		    " is actually alias for %s", qu->answer->cname,
> ++		    " is actually alias for %s and aliases too deep",
> ++                    qu->answer->cname,
> + 		    adns__diag_domain(ads,serv,qu, &qu->vb,
> + 				      dgram,dglen,rdstart));
> +-	adns__query_fail(qu,adns_s_prohibitedcname);
> ++	adns__query_fail(qu,adns_s_norecurse);
> + 	return;
> +       } else if (wantedrrs) { /* Ignore CNAME(s) after RR(s). */
> + 	adns__debug(ads,serv,qu,"ignoring CNAME (to %s) coexisting with RR",
> +diff -Naur adns-1.4.org/src/reply.c.orig adns-1.4/src/reply.c.orig
> +--- adns-1.4.org/src/reply.c.orig	1970-01-01 02:00:00.000000000 +0200
> ++++ adns-1.4/src/reply.c.orig	2006-04-08 17:36:57.000000000 +0300

  This file is redundant.

[snip]
> diff --git a/package/adns/adns-1.4-destdir.patch b/package/adns/adns-1.4-destdir.patch
> new file mode 100644
> index 0000000..3270ed4
> --- /dev/null
> +++ b/package/adns/adns-1.4-destdir.patch
> @@ -0,0 +1,54 @@
> +Fix installation directory
> +Upstream-Status: Pending

  Is this a patch you wrote yourself or a patch from somewhere else? In 
either case, it requires your Signed-off-by.

[snip]

> diff --git a/package/adns/adns-1.4-ipv6.patch b/package/adns/adns-1.4-ipv6.patch
> new file mode 100644
> index 0000000..8d02257
> --- /dev/null
> +++ b/package/adns/adns-1.4-ipv6.patch
> @@ -0,0 +1,2725 @@
> +Add IPv6 support
> +Upstream-Status: Pending

  Ditto.

  Also, this looks like a feature patch, not a cross-build patch, so we 
normally would not include it in buildroot...

> +
> +diff --git a/Makefile b/Makefile
> +index 5ba3e19..a87bc87 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -56,9 +56,9 @@ dist_tmp=dist_tmp/adns-$(DISTVERSION)
> + dist:			distprep
> + 	rm -rf dist_tmp*
> + 	mkdir dist_tmp $(dist_tmp)
> +-	find \( -name CVS -o -name dist_tmp* \) -prune -o -type d -print | \
> ++	find . \( -name CVS -o -name dist_tmp* \) -prune -o -type d -print | \
> + 		sed -e 's#.*#mkdir -p $(dist_tmp)/&#' | sh
> +-	find \( -name CVS -o -name dist_tmp* \) -prune -o -type f -print | \
> ++	find . \( -name CVS -o -name dist_tmp* \) -prune -o -type f -print | \

  These have nothing to do with IPv6, and anyway pointless.

> + 		sed -e 's#.*#ln & $(dist_tmp)/&#' | sh
> + 	$(MAKE) -C dist_tmp/adns-$(DISTVERSION) distclean
> + 	cd dist_tmp && tar cf ../$(dist_tmp).tar `basename $(dist_tmp)`
> +diff --git a/Makefile.in b/Makefile.in
> +index 6e2e449..0babf0e 100644
> +--- a/Makefile.in
> ++++ b/Makefile.in
> +@@ -56,9 +56,9 @@ dist_tmp=dist_tmp/adns-$(DISTVERSION)
> + dist:			distprep
> + 	rm -rf dist_tmp*
> + 	mkdir dist_tmp $(dist_tmp)
> +-	find \( -name CVS -o -name dist_tmp* \) -prune -o -type d -print | \
> ++	find . \( -name CVS -o -name dist_tmp* \) -prune -o -type d -print | \
> + 		sed -e 's#.*#mkdir -p $(dist_tmp)/&#' | sh
> +-	find \( -name CVS -o -name dist_tmp* \) -prune -o -type f -print | \
> ++	find . \( -name CVS -o -name dist_tmp* \) -prune -o -type f -print | \

  Ditto.

> + 		sed -e 's#.*#ln & $(dist_tmp)/&#' | sh
> + 	$(MAKE) -C dist_tmp/adns-$(DISTVERSION) distclean
> + 	cd dist_tmp && tar cf ../$(dist_tmp).tar `basename $(dist_tmp)`
> +diff --git a/client/adh-main.c b/client/adh-main.c
> +index b6f3bd4..f2032ec 100644
> +--- a/client/adh-main.c
> ++++ b/client/adh-main.c
> +@@ -91,6 +91,7 @@ void of_type(const struct optioninfo *oi, const char *arg, const char *arg2) {
> +     { adns_r_rp,     "rp"     },
> +     { adns_r_srv,    "srv"    },
> +     { adns_r_addr,   "addr"   },
> ++    { adns_r_srv,    "srv"    },
> +
> +     /* types with only one version */
> +     { adns_r_cname,  "cname"  },
> +@@ -99,6 +100,7 @@ void of_type(const struct optioninfo *oi, const char *arg, const char *arg2) {
> +
> +     /* raw versions */
> +     { adns_r_a,        "a"    },
> ++    { adns_r_aaaa,     "aaaa" },
> +     { adns_r_ns_raw,   "ns-"  },
> +     { adns_r_soa_raw,  "soa-" },
> +     { adns_r_ptr_raw,  "ptr-" },
> +diff --git a/client/adh-opts.c b/client/adh-opts.c
> +index 08310e0..7b17c89 100644
> +--- a/client/adh-opts.c
> ++++ b/client/adh-opts.c
> +@@ -32,6 +32,8 @@ int ov_verbose= 0;
> + adns_rrtype ov_type= adns_r_none;
> + int ov_search=0, ov_qc_query=0, ov_qc_anshost=0, ov_qc_cname=1;
> + int ov_tcp=0, ov_cname=0, ov_format=fmt_default;
> ++int ov_ipflags=0;
> ++int ov_ip6mapped=0;
> + char *ov_id= 0;
> + struct perqueryflags_remember ov_pqfr = { 1,1,1, tm_none };
> +
> +@@ -114,6 +116,16 @@ static const struct optioninfo perquery_options[]= {
> +   { ot_value,            "CNAME ok for query domain, but not in RRs (default)",
> +     "Cs", "cname-ok",      &ov_cname, 0 },
> +
> ++  { ot_desconly, "per-query IPv6 mode:" },
> ++  { ot_value,            "Ask only for IPv6 addresses",
> ++    "I6", "ip6-only", &ov_ipflags, adns_qf_ip6 },
> ++  { ot_value,            "Ask only for IPv4 addresses",
> ++    "I4", "ip4-only", &ov_ipflags, adns_qf_ip4 },
> ++  { ot_value,            "Ask for both IPv4 and IPv6 addresses (default)",
> ++    "IX", "ipv6-mixed", &ov_ipflags, adns_qf_ip4|adns_qf_ip6 },
> ++  { ot_value,            "Ask for both IPv4 and IPv6 addresses, using IPv4-mapped IPv6 addresses",
> ++    "IM", "ipv6-mapped", &ov_ip6mapped, adns_qf_ip6mapped },
> ++
> +   { ot_desconly, "asynchronous/pipe mode options:" },
> +   { ot_funcarg,          "Set <id>, default is decimal sequence starting 0",
> +     0, "asynch-id",        0,0, &of_asynch_id, "id" },
> +diff --git a/client/adh-query.c b/client/adh-query.c
> +index 125bb33..2186004 100644
> +--- a/client/adh-query.c
> ++++ b/client/adh-query.c
> +@@ -92,24 +92,37 @@ static void prep_query(struct query_node **qun_r, int *quflags_r) {
> +     (ov_qc_query ? adns_qf_quoteok_query : 0) |
> +     (ov_qc_anshost ? adns_qf_quoteok_anshost : 0) |
> +     (ov_qc_cname ? 0 : adns_qf_quoteok_cname) |
> ++    ov_ipflags | ov_ip6mapped |
> +     ov_cname,
> +
> +   *qun_r= qun;
> + }
> +
> ++static int a2addr(adns_rr_addr *rr, const char *addr) {
> ++  char *p;
> ++  if (strchr(addr, ':')) {
> ++    memset(&rr->addr.inet6, 0, sizeof(rr->addr.inet6));

  Is addr.inet6 defined if the toolchain doesn't have IPv6 support? Same 
for AF_INET6.

> ++    rr->addr.sa.sa_family = AF_INET6;
> ++    p = (char *) &rr->addr.inet6.sin6_addr;
> ++  }
> ++  else {
> ++    memset(&rr->addr.inet, 0, sizeof(rr->addr.inet));
> ++    rr->addr.sa.sa_family = AF_INET;
> ++    p = (char *) &rr->addr.inet.sin_addr;
> ++  }
> ++  return inet_pton(rr->addr.sa.sa_family, addr, p) > 0;
> ++}
> ++
> + void of_ptr(const struct optioninfo *oi, const char *arg, const char *arg2) {
> +   struct query_node *qun;
> +   int quflags, r;
> +-  struct sockaddr_in sa;
> +-
> +-  memset(&sa,0,sizeof(sa));
> +-  sa.sin_family= AF_INET;
> +-  if (!inet_aton(arg,&sa.sin_addr)) usageerr("invalid IP address %s",arg);
> ++  adns_rr_addr rr;
> +
> ++  if (!a2addr(&rr, arg)) usageerr("invalid IP address %s",arg);
> +   prep_query(&qun,&quflags);
> +   qun->owner= xstrsave(arg);
> +   r= adns_submit_reverse(ads,
> +-			 (struct sockaddr*)&sa,
> ++			 &rr.addr.sa,
> + 			 ov_type == adns_r_none ? adns_r_ptr : ov_type,
> + 			 quflags,
> + 			 qun,
> +@@ -122,17 +135,14 @@ void of_ptr(const struct optioninfo *oi, const char *arg, const char *arg2) {
> + void of_reverse(const struct optioninfo *oi, const char *arg, const char *arg2) {
> +   struct query_node *qun;
> +   int quflags, r;
> +-  struct sockaddr_in sa;
> +-
> +-  memset(&sa,0,sizeof(sa));
> +-  sa.sin_family= AF_INET;
> +-  if (!inet_aton(arg,&sa.sin_addr)) usageerr("invalid IP address %s",arg);
> ++  adns_rr_addr rr;
> +
> ++  if (!a2addr(&rr, arg)) usageerr("invalid IP address %s",arg);
> +   prep_query(&qun,&quflags);
> +   qun->owner= xmalloc(strlen(arg) + strlen(arg2) + 2);
> +   sprintf(qun->owner, "%s %s", arg,arg2);
> +   r= adns_submit_reverse_any(ads,
> +-			     (struct sockaddr*)&sa, arg2,
> ++			     &rr.addr.sa, arg2,
> + 			     ov_type == adns_r_none ? adns_r_txt : ov_type,
> + 			     quflags,
> + 			     qun,
> +diff --git a/client/adnshost.h b/client/adnshost.h
> +index fcc96a3..7e2341a 100644
> +--- a/client/adnshost.h
> ++++ b/client/adnshost.h
> +@@ -81,6 +81,8 @@ extern int ov_verbose;
> + extern adns_rrtype ov_type;
> + extern int ov_search, ov_qc_query, ov_qc_anshost, ov_qc_cname;
> + extern int ov_tcp, ov_cname, ov_format;
> ++extern int ov_ipflags;
> ++extern int ov_ip6mapped;
> + extern char *ov_id;
> + extern struct perqueryflags_remember ov_pqfr;
> +
> +diff --git a/client/adnstest.c b/client/adnstest.c
> +index 550cf27..ae70285 100644
> +--- a/client/adnstest.c
> ++++ b/client/adnstest.c
> +@@ -119,13 +119,16 @@ static const adns_rrtype defaulttypes[]= {
> +   adns_r_ptr_raw,
> +   adns_r_hinfo,
> +   adns_r_mx_raw,
> ++  adns_r_srv_raw,
> +   adns_r_txt,
> +   adns_r_rp_raw,
> ++  adns_r_aaaa, /* Does the order matter? */
> +
> +   adns_r_addr,
> +   adns_r_ns,
> +   adns_r_ptr,
> +   adns_r_mx,
> ++  adns_r_srv,
> +
> +   adns_r_soa,
> +   adns_r_rp,
> +diff --git a/regress/case-connfail.sys b/regress/case-connfail.sys
> +index b62923b..2064368 100644
> +--- a/regress/case-connfail.sys
> ++++ b/regress/case-connfail.sys

  If we keep this patch in buildroot, I wouldn't include the regression 
test changes. We anyway don't run the tests.

[snip]
> +diff --git a/regress/case-flags10.sys b/regress/case-flags10.sys
[snip]
> +diff --git a/regress/case-longdom1.sys b/regress/case-longdom1.sys
[snip]
> +diff --git a/regress/case-longdomsrch0.sys b/regress/case-longdomsrch0.sys
[snip]
> +diff --git a/regress/case-longlab1.sys b/regress/case-longlab1.sys
[snip]
> +diff --git a/regress/case-tcpmultipart.sys b/regress/case-tcpmultipart.sys
[snip]
> +diff --git a/regress/case-timeout.sys b/regress/case-timeout.sys
[snip]
> +diff --git a/regress/case-unknownq.sys b/regress/case-unknownq.sys
[snip]
> +diff --git a/regress/hcommon.c b/regress/hcommon.c
[snip]
> +diff --git a/regress/hcommon.c.m4 b/regress/hcommon.c.m4
[snip]
> +diff --git a/regress/hplayback.c b/regress/hplayback.c
[snip]
> +diff --git a/regress/hplayback.c.m4 b/regress/hplayback.c.m4
[snip]
> +diff --git a/regress/hrecord.c b/regress/hrecord.c
[snip]
> +diff --git a/regress/hsyscalls.i4 b/regress/hsyscalls.i4
[snip]

  All of the above can be removed...

> +diff --git a/src/adns.h b/src/adns.h
> +index 34f9f49..aad05fd 100644
> +--- a/src/adns.h
> ++++ b/src/adns.h
> +@@ -71,6 +71,10 @@
> + extern "C" { /* I really dislike this - iwj. */
> + #endif
> +
> ++#ifndef AF_INET6
> ++#include "adns-in6fake.h"
> ++#endif

  Ah, I guess this answers my question about addr.inet6 being defined...

> ++
> + /* All struct in_addr anywhere in adns are in NETWORK byte order. */

[snip]

  Rest of the patch should stay (except for it being a feature-adding patch).

  BTW, is this patch really 4 years old? Does that imply that adns is in 
fact dead?


> diff --git a/package/adns/adns-1.4-rh514838.patch b/package/adns/adns-1.4-rh514838.patch
> new file mode 100644
> index 0000000..d0da303
> --- /dev/null
> +++ b/package/adns/adns-1.4-rh514838.patch
> @@ -0,0 +1,26 @@
> +Fixes Bug 514838

  A bit more explanation would be useful :-) And add your Sob.

> +
> +Upstream-Status: Pending
> +URL: https://bugzilla.redhat.com/show_bug.cgi?id=514838
> +
> +diff -up adns-1.4/src/general.c.rh514838 adns-1.4/src/general.c
> +--- adns-1.4/src/general.c.rh514838	2006-04-08 16:36:57.000000000 +0200
> ++++ adns-1.4/src/general.c	2009-08-06 13:55:06.752562767 +0200
> +@@ -267,6 +267,8 @@ static const struct sinfo {
> +   SINFO( nodata,              "No such data"                                 )
> + };
> +
> ++static const char *unknown_error_str = "unknown error code";
> ++
> + static int si_compar(const void *key, const void *elem) {
> +   const adns_status *st= key;
> +   const struct sinfo *si= elem;
> +@@ -283,7 +285,7 @@ const char *adns_strerror(adns_status st
> +   const struct sinfo *si;
> +
> +   si= findsinfo(st);
> +-  return si->string;
> ++  return (si == NULL) ? unknown_error_str : si->string;
> + }
> +
> + const char *adns_errabbrev(adns_status st) {
> diff --git a/package/adns/adns.mk b/package/adns/adns.mk
> new file mode 100644
> index 0000000..be4aefd
> --- /dev/null
> +++ b/package/adns/adns.mk
> @@ -0,0 +1,15 @@
> +#############################################################
> +#
> +# adns
> +#
> +#############################################################
> +
> +ADNS_VERSION = 1.4
> +ADNS_SOURCE = adns-$(ADNS_VERSION).tar.gz
> +ADNS_SITE = http://www.chiark.greenend.org.uk/~ian/adns/ftp/
> +ADNS_AUTORECONF = YES
> +ADNS_INSTALL_STAGING = YES
> +ADNS_CONF_OPT += --enable-dynamic=elf

  Shouldn't this be in an ifeq ($(BR2_PREFER_STATIC_LIB),)?

> +
> +$(eval $(autotools-package))
> +

  Redundant empty line at end of file.


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
