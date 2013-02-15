From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Fri, 15 Feb 2013 22:16:42 +0200
Subject: [Buildroot] [PATCH] new package: adns
Message-ID: <1360959402-24775-1-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GNU adns

Advanced, easy to use, asynchronous-capable DNS client library and utilities.

adns is a resolver library for C (and C++) programs, and a collection of
useful DNS resolver utilities.

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 package/Config.in                      |    1 +
 package/adns/Config.in                 |    7 +
 package/adns/adns-1.4-cnamechain.patch | 1275 +++++++++++++++
 package/adns/adns-1.4-destdir.patch    |   54 +
 package/adns/adns-1.4-ipv6.patch       | 2725 ++++++++++++++++++++++++++++++++
 package/adns/adns-1.4-rh514838.patch   |   26 +
 package/adns/adns.mk                   |   15 +
 7 files changed, 4103 insertions(+), 0 deletions(-)
 create mode 100644 package/adns/Config.in
 create mode 100644 package/adns/adns-1.4-cnamechain.patch
 create mode 100644 package/adns/adns-1.4-destdir.patch
 create mode 100644 package/adns/adns-1.4-ipv6.patch
 create mode 100644 package/adns/adns-1.4-rh514838.patch
 create mode 100644 package/adns/adns.mk

diff --git a/package/Config.in b/package/Config.in
index 8588951..ec282b9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -612,6 +612,7 @@ source "package/sound-theme-freedesktop/Config.in"
 endmenu
 
 menu "Networking applications"
+source "package/adns/Config.in"
 source "package/argus/Config.in"
 source "package/arptables/Config.in"
 source "package/avahi/Config.in"
diff --git a/package/adns/Config.in b/package/adns/Config.in
new file mode 100644
index 0000000..1971381
--- /dev/null
+++ b/package/adns/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_ADNS
+	bool "adns"
+	help
+	  Advanced, easy to use, asynchronous-capable DNS client
+	  library and utilities.
+
+	  http://www.chiark.greenend.org.uk/~ian/adns
diff --git a/package/adns/adns-1.4-cnamechain.patch b/package/adns/adns-1.4-cnamechain.patch
new file mode 100644
index 0000000..1eadf54
--- /dev/null
+++ b/package/adns/adns-1.4-cnamechain.patch
@@ -0,0 +1,1275 @@
+[ADNS] Re: CNAME chains 
+Brad Spencer spencer at infointeractive.com 
+Mon, 28 Aug 2006 14:43:00 -0300 
+
+Previous message: CNAME chains 
+Next message: CNAME chains option 
+Messages sorted by: [ date ] [ thread ] [ subject ] [ author ] 
+--pf9I7BMVVzbSWLtt
+Content-Type: text/plain; charset=us-ascii
+Content-Disposition: inline
+
+On Fri, Aug 25, 2006 at 11:36:04AM -0700, William Ahern wrote:
+> On Fri, Aug 25, 2006 at 09:39:01AM +0100, peter burden wrote:
+> > Hello,
+> >    Is there any way to make ADNS follow CNAME chains ?
+> > 
+> >    I have set the adns_qf_cname_loose query flag and it seems OK for a 
+> > single
+> >    CNAME - e.g. (output from 'dig')
+
+I posted a small patch back in 2003 that made changes to adns so that
+it would follow CNAME chains.  See
+
+http://www.chiark.greenend.org.uk/pipermail/adns-discuss/2003/001072.html
+
+The patch included in that post is against an old adns version, so I
+have attached my latest version of the patch to this message.  (I have
+not tested that the attached patch applied cleanly to the current adns
+source, but it may be slightly more in sync with the current version.)
+
+> CNAME chains are technically not allowed. Such chains are violations of the
+> specifications. Also, I believe MX host lookups returning CNAMEs (i.e. MX
+> yahoo.com -> A mail.yahoo.com -> CNAME foo) is also illegal.
+
+I have also been told that CNAME chains are illegal, but I can not
+find any actual text that says that a resolver should fail when it
+encounters them.  In fact, RFC 1034 Section 3.6.2 says:
+
+  Domain names in RRs which point at another name should always point at
+  the primary name and not the alias.  This avoids extra indirections in
+  accessing information.  For example, the address to name RR for the
+  above host should be:
+
+     52.0.0.10.IN-ADDR.ARPA  IN      PTR     C.ISI.EDU
+
+  rather than pointing at USC-ISIC.ARPA.
+
+The above implies that CNAME chains are illegal, IMO.  But then, the
+next sentence is:
+
+  Of course, by the robustness principle, domain software should not
+  fail when presented with CNAME chains or loops; CNAME chains
+  should be followed and CNAME loops signalled as an error.
+
+This advice, coupled with the fact that CNAME chains exist in the
+wild, triggered me to create the patch in the first place.  My patch
+doesn't detect loops, but instead simply won't follow chains longer
+than a certain (hard-coded) size.
+
+Hope this helps!
+
+-- 
+------------------------------------------------------------------
+Brad Spencer - spencer at infointeractive.com - "It's quite nice..."
+Systems Architect | InfoInterActive Corp. | A Canadian AOL Company
+
+--pf9I7BMVVzbSWLtt
+Content-Type: text/plain; charset=us-ascii
+Content-Disposition: attachment; filename="cname_chains.diff"
+
+diff -Naur adns-1.4.org/src/internal.h adns-1.4/src/internal.h
+--- adns-1.4.org/src/internal.h	2013-01-02 19:55:38.935194976 +0200
++++ adns-1.4/src/internal.h	2013-01-02 19:55:47.129330386 +0200
+@@ -231,6 +231,9 @@
+   int cname_dglen, cname_begin;
+   /* If non-0, has been allocated using . */
+ 
++  int cname_alias_hops_left;
++  /* The number of cname alias hops we will allow */
++
+   vbuf search_vb;
+   int search_origlen, search_pos, search_doneabs;
+   /* Used by the searching algorithm.  The query domain in textual form
+diff -Naur adns-1.4.org/src/internal.h.orig adns-1.4/src/internal.h.orig
+--- adns-1.4.org/src/internal.h.orig	1970-01-01 02:00:00.000000000 +0200
++++ adns-1.4/src/internal.h.orig	2006-04-08 17:36:57.000000000 +0300
+@@ -0,0 +1,760 @@
++/*
++ * internal.h
++ * - declarations of private objects with external linkage (adns__*)
++ * - definitons of internal macros
++ * - comments regarding library data structures
++ */
++/*
++ *  This file is part of adns, which is
++ *    Copyright (C) 1997-2000,2003,2006  Ian Jackson
++ *    Copyright (C) 1999-2000,2003,2006  Tony Finch
++ *    Copyright (C) 1991 Massachusetts Institute of Technology
++ *  (See the file INSTALL for full details.)
++ *
++ *  This program is free software; you can redistribute it and/or modify
++ *  it under the terms of the GNU General Public License as published by
++ *  the Free Software Foundation; either version 2, or (at your option)
++ *  any later version.
++ *
++ *  This program is distributed in the hope that it will be useful,
++ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
++ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ *  GNU General Public License for more details.
++ *
++ *  You should have received a copy of the GNU General Public License
++ *  along with this program; if not, write to the Free Software Foundation,
++ *  Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
++ */
++
++#ifndef ADNS_INTERNAL_H_INCLUDED
++#define ADNS_INTERNAL_H_INCLUDED
++
++#include "config.h"
++typedef unsigned char byte;
++
++#include <stdarg.h>
++#include <assert.h>
++#include <unistd.h>
++#include <signal.h>
++#include <errno.h>
++#include <string.h>
++#include <stdlib.h>
++
++#include <sys/time.h>
++
++#include "adns.h"
++#include "dlist.h"
++
++#ifdef ADNS_REGRESS_TEST
++# include "hredirect.h"
++#endif
++
++/* Configuration and constants */
++
++#define MAXSERVERS 5
++#define MAXSORTLIST 15
++#define UDPMAXRETRIES 15
++#define UDPRETRYMS 2000
++#define TCPWAITMS 30000
++#define TCPCONNMS 14000
++#define TCPIDLEMS 30000
++#define MAXTTLBELIEVE (7*86400) /* any TTL > 7 days is capped */
++
++#define DNS_PORT 53
++#define DNS_MAXUDP 512
++#define DNS_MAXLABEL 63
++#define DNS_MAXDOMAIN 255
++#define DNS_HDRSIZE 12
++#define DNS_IDOFFSET 0
++#define DNS_CLASS_IN 1
++
++#define DNS_INADDR_ARPA "in-addr", "arpa"
++
++#define MAX_POLLFDS  ADNS_POLLFDS_RECOMMENDED
++
++typedef enum {
++  cc_user,
++  cc_entex,
++  cc_freq
++} consistency_checks;
++
++typedef enum {
++  rcode_noerror,
++  rcode_formaterror,
++  rcode_servfail,
++  rcode_nxdomain,
++  rcode_notimp,
++  rcode_refused
++} dns_rcode;
++
++/* Shared data structures */
++
++typedef union {
++  adns_status status;
++  char *cp;
++  adns_rrtype type;
++  int i;
++  struct in_addr ia;
++  unsigned long ul;
++} rr_align;
++
++typedef struct {
++  int used, avail;
++  byte *buf;
++} vbuf;
++
++typedef struct {
++  adns_state ads;
++  adns_query qu;
++  int serv;
++  const byte *dgram;
++  int dglen, nsstart, nscount, arcount;
++  struct timeval now;
++} parseinfo;
++
++typedef struct typeinfo {
++  adns_rrtype typekey;
++  const char *rrtname;
++  const char *fmtname;
++  int rrsz;
++
++  void (*makefinal)(adns_query qu, void *data);
++  /* Change memory management of *data.
++   * Previously, used alloc_interim, now use alloc_final.
++   */
++
++  adns_status (*convstring)(vbuf *vb, const void *data);
++  /* Converts the RR data to a string representation in vbuf.
++   * vbuf will be appended to (it must have been initialised),
++   * and will not be null-terminated by convstring.
++   */
++
++  adns_status (*parse)(const parseinfo *pai, int cbyte,
++		       int max, void *store_r);
++  /* Parse one RR, in dgram of length dglen, starting at cbyte and
++   * extending until at most max.
++   *
++   * The RR should be stored at *store_r, of length qu->typei->rrsz.
++   *
++   * If there is an overrun which might indicate truncation, it should set
++   * *rdstart to -1; otherwise it may set it to anything else positive.
++   *
++   * nsstart is the offset of the authority section.
++   */
++
++  int (*diff_needswap)(adns_state ads,const void *datap_a,const void *datap_b);
++  /* Returns !0 if RR a should be strictly after RR b in the sort order,
++   * 0 otherwise.  Must not fail.
++   */
++
++  adns_status (*qdparselabel)(adns_state ads,
++			      const char **p_io, const char *pe, int labelnum,
++			      char label_r[DNS_MAXDOMAIN], int *ll_io,
++			      adns_queryflags flags,
++			      const struct typeinfo *typei);
++  /* Parses one label from the query domain string.  On entry, *p_io
++   * points to the next character to parse and *ll_io is the size of
++   * the buffer.  pe points just after the end of the query domain
++   * string.  On successful return, label_r[] and *ll_io are filled in
++   * and *p_io points to *pe or just after the label-ending `.'.  */
++
++  void (*postsort)(adns_state ads, void *array, int nrrs,
++		   const struct typeinfo *typei);
++  /* Called immediately after the RRs have been sorted, and may rearrange
++   * them.  (This is really for the benefit of SRV's bizarre weighting
++   * stuff.)  May be 0 to mean nothing needs to be done.
++   */
++} typeinfo;
++
++adns_status adns__qdpl_normal(adns_state ads,
++			      const char **p_io, const char *pe, int labelnum,
++			      char label_r[], int *ll_io,
++			      adns_queryflags flags,
++			      const typeinfo *typei);
++  /* implemented in transmit.c, used by types.c as default
++   * and as part of implementation for some fancier types */
++
++typedef struct allocnode {
++  struct allocnode *next, *back;
++} allocnode;
++
++union maxalign {
++  byte d[1];
++  struct in_addr ia;
++  long l;
++  void *p;
++  void (*fp)(void);
++  union maxalign *up;
++} data;
++
++typedef struct {
++  void *ext;
++  void (*callback)(adns_query parent, adns_query child);
++  union {
++    adns_rr_addr ptr_parent_addr;
++    adns_rr_hostaddr *hostaddr;
++  } info;
++} qcontext;
++
++struct adns__query {
++  adns_state ads;
++  enum { query_tosend, query_tcpw, query_childw, query_done } state;
++  adns_query back, next, parent;
++  struct { adns_query head, tail; } children;
++  struct { adns_query back, next; } siblings;
++  struct { allocnode *head, *tail; } allocations;
++  int interim_allocd, preserved_allocd;
++  void *final_allocspace;
++
++  const typeinfo *typei;
++  byte *query_dgram;
++  int query_dglen;
++
++  vbuf vb;
++  /* General-purpose messing-about buffer.
++   * Wherever a `big' interface is crossed, this may be corrupted/changed
++   * unless otherwise specified.
++   */
++
++  adns_answer *answer;
++  /* This is allocated when a query is submitted, to avoid being unable
++   * to relate errors to queries if we run out of memory.  During
++   * query processing status, rrs is 0.  cname is set if
++   * we found a cname (this corresponds to cname_dgram in the query
++   * structure).  type is set from the word go.  nrrs and rrs
++   * are set together, when we find how many rrs there are.
++   * owner is set during querying unless we're doing searchlist,
++   * in which case it is set only when we find an answer.
++   */
++
++  byte *cname_dgram;
++  int cname_dglen, cname_begin;
++  /* If non-0, has been allocated using . */
++
++  vbuf search_vb;
++  int search_origlen, search_pos, search_doneabs;
++  /* Used by the searching algorithm.  The query domain in textual form
++   * is copied into the vbuf, and _origlen set to its length.  Then
++   * we walk the searchlist, if we want to.  _pos says where we are
++   * (next entry to try), and _doneabs says whether we've done the
++   * absolute query yet (0=not yet, 1=done, -1=must do straight away,
++   * but not done yet).  If flags doesn't have adns_qf_search then
++   * the vbuf is initialised but empty and everything else is zero.
++   */
++
++  int id, flags, retries;
++  int udpnextserver;
++  unsigned long udpsent; /* bitmap indexed by server */
++  struct timeval timeout;
++  time_t expires; /* Earliest expiry time of any record we used. */
++
++  qcontext ctx;
++
++  /* Possible states:
++   *
++   *  state   Queue   child  id   nextudpserver  udpsent     tcpfailed
++   *
++   *  tosend  NONE    null   >=0  0              zero        zero
++   *  tosend  udpw    null   >=0  any            nonzero     zero
++   *  tosend  NONE    null   >=0  any            nonzero     zero
++   *
++   *  tcpw    tcpw    null   >=0  irrelevant     any         any
++   *
++   *  child   childw  set    >=0  irrelevant     irrelevant  irrelevant
++   *  child   NONE    null   >=0  irrelevant     irrelevant  irrelevant
++   *  done    output  null   -1   irrelevant     irrelevant  irrelevant
++   *
++   * Queries are only not on a queue when they are actually being processed.
++   * Queries in state tcpw/tcpw have been sent (or are in the to-send buffer)
++   * iff the tcp connection is in state server_ok.
++   *
++   *			      +------------------------+
++   *             START -----> |      tosend/NONE       |
++   *			      +------------------------+
++   *                         /                       |\  \
++   *        too big for UDP /             UDP timeout  \  \ send via UDP
++   *        send via TCP   /              more retries  \  \
++   *        when conn'd   /                  desired     \  \
++   *                     |     	       	       	       	  |  |
++   *                     v				  |  v
++   *              +-----------+         	    	+-------------+
++   *              | tcpw/tcpw | ________                | tosend/udpw |
++   *              +-----------+         \	    	+-------------+
++   *                 |    |              |     UDP timeout | |
++   *                 |    |              |      no more    | |
++   *                 |    |              |      retries    | |
++   *                  \   | TCP died     |      desired    | |
++   *                   \   \ no more     |                 | |
++   *                    \   \ servers    | TCP            /  |
++   *                     \   \ to try    | timeout       /   |
++   *                  got \   \          v             |_    | got
++   *                 reply \   _| +------------------+      / reply
++   *   	       	       	    \  	  | done/output FAIL |     /
++   *                         \    +------------------+    /
++   *                          \                          /
++   *                           _|                      |_
++   *                             (..... got reply ....)
++   *                              /                   \
++   *        need child query/ies /                     \ no child query
++   *                            /                       \
++   *                          |_                         _|
++   *		   +---------------+		       +----------------+
++   *               | childw/childw | ----------------> | done/output OK |
++   *               +---------------+  children done    +----------------+
++   */
++};
++
++struct query_queue { adns_query head, tail; };
++
++struct adns__state {
++  adns_initflags iflags;
++  adns_logcallbackfn *logfn;
++  void *logfndata;
++  int configerrno;
++  struct query_queue udpw, tcpw, childw, output;
++  adns_query forallnext;
++  int nextid, udpsocket, tcpsocket;
++  vbuf tcpsend, tcprecv;
++  int nservers, nsortlist, nsearchlist, searchndots, tcpserver, tcprecv_skip;
++  enum adns__tcpstate {
++    server_disconnected, server_connecting,
++    server_ok, server_broken
++  } tcpstate;
++  struct timeval tcptimeout;
++  /* This will have tv_sec==0 if it is not valid.  It will always be
++   * valid if tcpstate _connecting.  When _ok, it will be nonzero if
++   * we are idle (ie, tcpw queue is empty), in which case it is the
++   * absolute time when we will close the connection.
++   */
++  struct sigaction stdsigpipe;
++  sigset_t stdsigmask;
++  struct pollfd pollfds_buf[MAX_POLLFDS];
++  struct server {
++    struct in_addr addr;
++  } servers[MAXSERVERS];
++  struct sortlist {
++    struct in_addr base, mask;
++  } sortlist[MAXSORTLIST];
++  char **searchlist;
++  unsigned short rand48xsubi[3];
++};
++
++/* From setup.c: */
++
++int adns__setnonblock(adns_state ads, int fd); /* => errno value */
++
++/* From general.c: */
++
++void adns__vlprintf(adns_state ads, const char *fmt, va_list al);
++void adns__lprintf(adns_state ads, const char *fmt,
++		   ...) PRINTFFORMAT(2,3);
++
++void adns__vdiag(adns_state ads, const char *pfx, adns_initflags prevent,
++		 int serv, adns_query qu, const char *fmt, va_list al);
++
++void adns__debug(adns_state ads, int serv, adns_query qu,
++		 const char *fmt, ...) PRINTFFORMAT(4,5);
++void adns__warn(adns_state ads, int serv, adns_query qu,
++		const char *fmt, ...) PRINTFFORMAT(4,5);
++void adns__diag(adns_state ads, int serv, adns_query qu,
++		const char *fmt, ...) PRINTFFORMAT(4,5);
++
++int adns__vbuf_ensure(vbuf *vb, int want);
++int adns__vbuf_appendstr(vbuf *vb, const char *data); /* doesn't include nul */
++int adns__vbuf_append(vbuf *vb, const byte *data, int len);
++/* 1=>success, 0=>realloc failed */
++void adns__vbuf_appendq(vbuf *vb, const byte *data, int len);
++void adns__vbuf_init(vbuf *vb);
++void adns__vbuf_free(vbuf *vb);
++
++const char *adns__diag_domain(adns_state ads, int serv, adns_query qu,
++			      vbuf *vb,
++			      const byte *dgram, int dglen, int cbyte);
++/* Unpicks a domain in a datagram and returns a string suitable for
++ * printing it as.  Never fails - if an error occurs, it will
++ * return some kind of string describing the error.
++ *
++ * serv may be -1 and qu may be 0.  vb must have been initialised,
++ * and will be left in an arbitrary consistent state.
++ *
++ * Returns either vb->buf, or a pointer to a string literal.  Do not modify
++ * vb before using the return value.
++ */
++
++void adns__isort(void *array, int nobjs, int sz, void *tempbuf,
++		 int (*needswap)(void *context, const void *a, const void *b),
++		 void *context);
++/* Does an insertion sort of array which must contain nobjs objects
++ * each sz bytes long.  tempbuf must point to a buffer at least
++ * sz bytes long.  needswap should return !0 if a>b (strictly, ie
++ * wrong order) 0 if a<=b (ie, order is fine).
++ */
++
++void adns__sigpipe_protect(adns_state);
++void adns__sigpipe_unprotect(adns_state);
++/* If SIGPIPE protection is not disabled, will block all signals except
++ * SIGPIPE, and set SIGPIPE's disposition to SIG_IGN.  (And then restore.)
++ * Each call to _protect must be followed by a call to _unprotect before
++ * any significant amount of code gets to run, since the old signal mask
++ * is stored in the adns structure.
++ */
++
++/* From transmit.c: */
++
++adns_status adns__mkquery(adns_state ads, vbuf *vb, int *id_r,
++			  const char *owner, int ol,
++			  const typeinfo *typei, adns_rrtype type,
++			  adns_queryflags flags);
++/* Assembles a query packet in vb.  A new id is allocated and returned.
++ */
++
++adns_status adns__mkquery_frdgram(adns_state ads, vbuf *vb, int *id_r,
++				  const byte *qd_dgram, int qd_dglen,
++				  int qd_begin,
++				  adns_rrtype type, adns_queryflags flags);
++/* Same as adns__mkquery, but takes the owner domain from an existing datagram.
++ * That domain must be correct and untruncated.
++ */
++
++void adns__querysend_tcp(adns_query qu, struct timeval now);
++/* Query must be in state tcpw/tcpw; it will be sent if possible and
++ * no further processing can be done on it for now.  The connection
++ * might be broken, but no reconnect will be attempted.
++ */
++
++void adns__query_send(adns_query qu, struct timeval now);
++/* Query must be in state tosend/NONE; it will be moved to a new state,
++ * and no further processing can be done on it for now.
++ * (Resulting state is one of udp/timew, tcpwait/timew (if server not
++ * connected), tcpsent/timew, child/childw or done/output.)
++ * __query_send may decide to use either UDP or TCP depending whether
++ * _qf_usevc is set (or has become set) and whether the query is too
++ * large.
++ */
++
++/* From query.c: */
++
++adns_status adns__internal_submit(adns_state ads, adns_query *query_r,
++				  const typeinfo *typei, vbuf *qumsg_vb,
++				  int id,
++				  adns_queryflags flags, struct timeval now,
++				  const qcontext *ctx);
++/* Submits a query (for internal use, called during external submits).
++ *
++ * The new query is returned in *query_r, or we return adns_s_nomemory.
++ *
++ * The query datagram should already have been assembled in qumsg_vb;
++ * the memory for it is _taken over_ by this routine whether it
++ * succeeds or fails (if it succeeds, the vbuf is reused for qu->vb).
++ *
++ * *ctx is copied byte-for-byte into the query.
++ *
++ * When the child query is done, ctx->callback will be called.  The
++ * child will already have been taken off both the global list of
++ * queries in ads and the list of children in the parent.  The child
++ * will be freed when the callback returns.  The parent will have been
++ * taken off the global childw queue.
++ *
++ * The callback should either call adns__query_done, if it is
++ * complete, or adns__query_fail, if an error has occurred, in which
++ * case the other children (if any) will be cancelled.  If the parent
++ * has more unfinished children (or has just submitted more) then the
++ * callback may choose to wait for them - it must then put the parent
++ * back on the childw queue.
++ */
++
++void adns__search_next(adns_state ads, adns_query qu, struct timeval now);
++/* Walks down the searchlist for a query with adns_qf_search.
++ * The query should have just had a negative response, or not had
++ * any queries sent yet, and should not be on any queue.
++ * The query_dgram if any will be freed and forgotten and a new
++ * one constructed from the search_* members of the query.
++ *
++ * Cannot fail (in case of error, calls adns__query_fail).
++ */
++
++void *adns__alloc_interim(adns_query qu, size_t sz);
++void *adns__alloc_preserved(adns_query qu, size_t sz);
++/* Allocates some memory, and records which query it came from
++ * and how much there was.
++ *
++ * If an error occurs in the query, all the memory from _interim is
++ * simply freed.  If the query succeeds, one large buffer will be made
++ * which is big enough for all these allocations, and then
++ * adns__alloc_final will get memory from this buffer.
++ *
++ * _alloc_interim can fail (and return 0).
++ * The caller must ensure that the query is failed.
++ *
++ * The memory from _preserved is is kept and transferred into the
++ * larger buffer - unless we run out of memory, in which case it too
++ * is freed.  When you use _preserved you have to add code to the
++ * x_nomem error exit case in adns__makefinal_query to clear out the
++ * pointers you made to those allocations, because that's when they're
++ * thrown away; you should also make a note in the declaration of
++ * those pointer variables, to note that they are _preserved rather
++ * than _interim.  If they're in the answer, note it here:
++ *  answer->cname and answer->owner are _preserved.
++ */
++
++void adns__transfer_interim(adns_query from, adns_query to,
++			    void *block, size_t sz);
++/* Transfers an interim allocation from one query to another, so that
++ * the `to' query will have room for the data when we get to makefinal
++ * and so that the free will happen when the `to' query is freed
++ * rather than the `from' query.
++ *
++ * It is legal to call adns__transfer_interim with a null pointer; this
++ * has no effect.
++ *
++ * _transfer_interim also ensures that the expiry time of the `to' query
++ * is no later than that of the `from' query, so that child queries'
++ * TTLs get inherited by their parents.
++ */
++
++void *adns__alloc_mine(adns_query qu, size_t sz);
++/* Like _interim, but does not record the length for later
++ * copying into the answer.  This just ensures that the memory
++ * will be freed when we're done with the query.
++ */
++
++void *adns__alloc_final(adns_query qu, size_t sz);
++/* Cannot fail, and cannot return 0.
++ */
++
++void adns__makefinal_block(adns_query qu, void **blpp, size_t sz);
++void adns__makefinal_str(adns_query qu, char **strp);
++
++void adns__reset_preserved(adns_query qu);
++/* Resets all of the memory management stuff etc. to take account of
++ * only the _preserved stuff from _alloc_preserved.  Used when we find
++ * an error somewhere and want to just report the error (with perhaps
++ * CNAME, owner, etc. info), and also when we're halfway through RRs
++ * in a datagram and discover that we need to retry the query.
++ */
++
++void adns__query_done(adns_query qu);
++void adns__query_fail(adns_query qu, adns_status stat);
++
++/* From reply.c: */
++
++void adns__procdgram(adns_state ads, const byte *dgram, int len,
++		     int serv, int viatcp, struct timeval now);
++/* This function is allowed to cause new datagrams to be constructed
++ * and sent, or even new queries to be started.  However,
++ * query-sending functions are not allowed to call any general event
++ * loop functions in case they accidentally call this.
++ *
++ * Ie, receiving functions may call sending functions.
++ * Sending functions may NOT call receiving functions.
++ */
++
++/* From types.c: */
++
++const typeinfo *adns__findtype(adns_rrtype type);
++
++/* From parse.c: */
++
++typedef struct {
++  adns_state ads;
++  adns_query qu;
++  int serv;
++  const byte *dgram;
++  int dglen, max, cbyte, namelen;
++  int *dmend_r;
++} findlabel_state;
++
++void adns__findlabel_start(findlabel_state *fls, adns_state ads,
++			   int serv, adns_query qu,
++			   const byte *dgram, int dglen, int max,
++			   int dmbegin, int *dmend_rlater);
++/* Finds labels in a domain in a datagram.
++ *
++ * Call this routine first.
++ * dmend_rlater may be null.  ads (and of course fls) may not be.
++ * serv may be -1, qu may be null - they are for error reporting.
++ */
++
++adns_status adns__findlabel_next(findlabel_state *fls,
++				 int *lablen_r, int *labstart_r);
++/* Then, call this one repeatedly.
++ *
++ * It will return adns_s_ok if all is well, and tell you the length
++ * and start of successive labels.  labstart_r may be null, but
++ * lablen_r must not be.
++ *
++ * After the last label, it will return with *lablen_r zero.
++ * Do not then call it again; instead, just throw away the findlabel_state.
++ *
++ * *dmend_rlater will have been set to point to the next part of
++ * the datagram after the label (or after the uncompressed part,
++ * if compression was used).  *namelen_rlater will have been set
++ * to the length of the domain name (total length of labels plus
++ * 1 for each intervening dot).
++ *
++ * If the datagram appears to be truncated, *lablen_r will be -1.
++ * *dmend_rlater, *labstart_r and *namelen_r may contain garbage.
++ * Do not call _next again.
++ *
++ * There may also be errors, in which case *dmend_rlater,
++ * *namelen_rlater, *lablen_r and *labstart_r may contain garbage.
++ * Do not then call findlabel_next again.
++ */
++
++typedef enum {
++  pdf_quoteok= 0x001
++} parsedomain_flags;
++
++adns_status adns__parse_domain(adns_state ads, int serv, adns_query qu,
++			       vbuf *vb, parsedomain_flags flags,
++			       const byte *dgram, int dglen, int *cbyte_io,
++			       int max);
++/* vb must already have been initialised; it will be reset if necessary.
++ * If there is truncation, vb->used will be set to 0; otherwise
++ * (if there is no error) vb will be null-terminated.
++ * If there is an error vb and *cbyte_io may be left indeterminate.
++ *
++ * serv may be -1 and qu may be 0 - they are used for error reporting only.
++ */
++
++adns_status adns__parse_domain_more(findlabel_state *fls, adns_state ads,
++				    adns_query qu, vbuf *vb,
++				    parsedomain_flags flags,
++				    const byte *dgram);
++/* Like adns__parse_domain, but you pass it a pre-initialised findlabel_state,
++ * for continuing an existing domain or some such of some kind.  Also, unlike
++ * _parse_domain, the domain data will be appended to vb, rather than replacing
++ * the existing contents.
++ */
++
++adns_status adns__findrr(adns_query qu, int serv,
++			 const byte *dgram, int dglen, int *cbyte_io,
++			 int *type_r, int *class_r, unsigned long *ttl_r,
++			 int *rdlen_r, int *rdstart_r,
++			 int *ownermatchedquery_r);
++/* Finds the extent and some of the contents of an RR in a datagram
++ * and does some checks.  The datagram is *dgram, length dglen, and
++ * the RR starts at *cbyte_io (which is updated afterwards to point
++ * to the end of the RR).
++ *
++ * The type, class, TTL and RRdata length and start are returned iff
++ * the corresponding pointer variables are not null.  type_r, class_r
++ * and ttl_r may not be null.  The TTL will be capped.
++ *
++ * If ownermatchedquery_r != 0 then the owner domain of this
++ * RR will be compared with that in the query (or, if the query
++ * has gone to a CNAME lookup, with the canonical name).
++ * In this case, *ownermatchedquery_r will be set to 0 or 1.
++ * The query datagram (or CNAME datagram) MUST be valid and not truncated.
++ *
++ * If there is truncation then *type_r will be set to -1 and
++ * *cbyte_io, *class_r, *rdlen_r, *rdstart_r and *eo_matched_r will be
++ * undefined.
++ *
++ * qu must obviously be non-null.
++ *
++ * If an error is returned then *type_r will be undefined too.
++ */
++
++adns_status adns__findrr_anychk(adns_query qu, int serv,
++				const byte *dgram, int dglen, int *cbyte_io,
++				int *type_r, int *class_r,
++				unsigned long *ttl_r,
++				int *rdlen_r, int *rdstart_r,
++				const byte *eo_dgram, int eo_dglen,
++				int eo_cbyte, int *eo_matched_r);
++/* Like adns__findrr_checked, except that the datagram and
++ * owner to compare with can be specified explicitly.
++ *
++ * If the caller thinks they know what the owner of the RR ought to
++ * be they can pass in details in eo_*: this is another (or perhaps
++ * the same datagram), and a pointer to where the putative owner
++ * starts in that datagram.  In this case *eo_matched_r will be set
++ * to 1 if the datagram matched or 0 if it did not.  Either
++ * both eo_dgram and eo_matched_r must both be non-null, or they
++ * must both be null (in which case eo_dglen and eo_cbyte will be ignored).
++ * The eo datagram and contained owner domain MUST be valid and
++ * untruncated.
++ */
++
++void adns__update_expires(adns_query qu, unsigned long ttl,
++			  struct timeval now);
++/* Updates the `expires' field in the query, so that it doesn't exceed
++ * now + ttl.
++ */
++
++int vbuf__append_quoted1035(vbuf *vb, const byte *buf, int len);
++
++/* From event.c: */
++
++void adns__tcp_broken(adns_state ads, const char *what, const char *why);
++/* what and why may be both 0, or both non-0. */
++
++void adns__tcp_tryconnect(adns_state ads, struct timeval now);
++
++void adns__autosys(adns_state ads, struct timeval now);
++/* Make all the system calls we want to if the application wants us to.
++ * Must not be called from within adns internal processing functions,
++ * lest we end up in recursive descent !
++ */
++
++void adns__must_gettimeofday(adns_state ads, const struct timeval **now_io,
++			     struct timeval *tv_buf);
++
++int adns__pollfds(adns_state ads, struct pollfd pollfds_buf[MAX_POLLFDS]);
++void adns__fdevents(adns_state ads,
++		    const struct pollfd *pollfds, int npollfds,
++		    int maxfd, const fd_set *readfds,
++		    const fd_set *writefds, const fd_set *exceptfds,
++		    struct timeval now, int *r_r);
++int adns__internal_check(adns_state ads,
++			 adns_query *query_io,
++			 adns_answer **answer,
++			 void **context_r);
++
++void adns__timeouts(adns_state ads, int act,
++		    struct timeval **tv_io, struct timeval *tvbuf,
++		    struct timeval now);
++/* If act is !0, then this will also deal with the TCP connection
++ * if previous events broke it or require it to be connected.
++ */
++
++/* From check.c: */
++
++void adns__consistency(adns_state ads, adns_query qu, consistency_checks cc);
++
++/* Useful static inline functions: */
++
++static inline int ctype_whitespace(int c) {
++  return c==' ' || c=='\n' || c=='\t';
++}
++static inline int ctype_digit(int c) { return c>='0' && c<='9'; }
++static inline int ctype_alpha(int c) {
++  return (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z');
++}
++static inline int ctype_822special(int c) {
++  return strchr("()<>@,;:\\\".[]",c) != 0;
++}
++static inline int ctype_domainunquoted(int c) {
++  return ctype_alpha(c) || ctype_digit(c) || (strchr("-_/+",c) != 0);
++}
++
++static inline int errno_resources(int e) { return e==ENOMEM || e==ENOBUFS; }
++
++/* Useful macros */
++
++#define MEM_ROUND(sz)						\
++  (( ((sz)+sizeof(union maxalign)-1) / sizeof(union maxalign) )	\
++   * sizeof(union maxalign) )
++
++#define GETIL_B(cb) (((dgram)[(cb)++]) & 0x0ff)
++#define GET_B(cb,tv) ((tv)= GETIL_B((cb)))
++#define GET_W(cb,tv) ((tv)=0,(tv)|=(GETIL_B((cb))<<8), (tv)|=GETIL_B(cb), (tv))
++#define GET_L(cb,tv) ( (tv)=0,				\
++		       (tv)|=(GETIL_B((cb))<<24),	\
++		       (tv)|=(GETIL_B((cb))<<16),	\
++		       (tv)|=(GETIL_B((cb))<<8),	\
++		       (tv)|=GETIL_B(cb),		\
++		       (tv) )
++
++#endif
+diff -Naur adns-1.4.org/src/query.c adns-1.4/src/query.c
+--- adns-1.4.org/src/query.c	2013-01-02 19:55:38.931192468 +0200
++++ adns-1.4/src/query.c	2013-01-02 19:55:47.131331642 +0200
+@@ -63,6 +63,8 @@
+ 
+   qu->cname_dgram= 0;
+   qu->cname_dglen= qu->cname_begin= 0;
++  /* Allow CNAME chains up to some sane limit */
++  qu->cname_alias_hops_left = 10;
+ 
+   adns__vbuf_init(&qu->search_vb);
+   qu->search_origlen= qu->search_pos= qu->search_doneabs= 0;
+diff -Naur adns-1.4.org/src/reply.c adns-1.4/src/reply.c
+--- adns-1.4.org/src/reply.c	2013-01-02 19:55:38.936195603 +0200
++++ adns-1.4/src/reply.c	2013-01-02 19:55:47.134333524 +0200
+@@ -190,12 +190,13 @@
+       if (qu->flags & adns_qf_cname_forbid) {
+ 	adns__query_fail(qu,adns_s_prohibitedcname);
+ 	return;
+-      } else if (qu->cname_dgram) { /* Ignore second and subsequent CNAME(s) */
++      } else if (qu->cname_dgram && --(qu->cname_alias_hops_left) <= 0) { /* Don't follow "too long" CNAME chains */
+ 	adns__debug(ads,serv,qu,"allegedly canonical name %s"
+-		    " is actually alias for %s", qu->answer->cname,
++		    " is actually alias for %s and aliases too deep",
++                    qu->answer->cname,
+ 		    adns__diag_domain(ads,serv,qu, &qu->vb,
+ 				      dgram,dglen,rdstart));
+-	adns__query_fail(qu,adns_s_prohibitedcname);
++	adns__query_fail(qu,adns_s_norecurse);
+ 	return;
+       } else if (wantedrrs) { /* Ignore CNAME(s) after RR(s). */
+ 	adns__debug(ads,serv,qu,"ignoring CNAME (to %s) coexisting with RR",
+diff -Naur adns-1.4.org/src/reply.c.orig adns-1.4/src/reply.c.orig
+--- adns-1.4.org/src/reply.c.orig	1970-01-01 02:00:00.000000000 +0200
++++ adns-1.4/src/reply.c.orig	2006-04-08 17:36:57.000000000 +0300
+@@ -0,0 +1,390 @@
++/*
++ * reply.c
++ * - main handling and parsing routine for received datagrams
++ */
++/*
++ *  This file is part of adns, which is
++ *    Copyright (C) 1997-2000,2003,2006  Ian Jackson
++ *    Copyright (C) 1999-2000,2003,2006  Tony Finch
++ *    Copyright (C) 1991 Massachusetts Institute of Technology
++ *  (See the file INSTALL for full details.)
++ *  
++ *  This program is free software; you can redistribute it and/or modify
++ *  it under the terms of the GNU General Public License as published by
++ *  the Free Software Foundation; either version 2, or (at your option)
++ *  any later version.
++ *  
++ *  This program is distributed in the hope that it will be useful,
++ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
++ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ *  GNU General Public License for more details.
++ *  
++ *  You should have received a copy of the GNU General Public License
++ *  along with this program; if not, write to the Free Software Foundation,
++ *  Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA. 
++ */
++
++#include <stdlib.h>
++
++#include "internal.h"
++    
++void adns__procdgram(adns_state ads, const byte *dgram, int dglen,
++		     int serv, int viatcp, struct timeval now) {
++  int cbyte, rrstart, wantedrrs, rri, foundsoa, foundns, cname_here;
++  int id, f1, f2, qdcount, ancount, nscount, arcount;
++  int flg_ra, flg_rd, flg_tc, flg_qr, opcode;
++  int rrtype, rrclass, rdlength, rdstart;
++  int anstart, nsstart, arstart;
++  int ownermatched, l, nrrs;
++  unsigned long ttl, soattl;
++  const typeinfo *typei;
++  adns_query qu, nqu;
++  dns_rcode rcode;
++  adns_status st;
++  vbuf tempvb;
++  byte *newquery, *rrsdata;
++  parseinfo pai;
++  
++  if (dglen<DNS_HDRSIZE) {
++    adns__diag(ads,serv,0,"received datagram"
++	       " too short for message header (%d)",dglen);
++    return;
++  }
++  cbyte= 0;
++  GET_W(cbyte,id);
++  GET_B(cbyte,f1);
++  GET_B(cbyte,f2);
++  GET_W(cbyte,qdcount);
++  GET_W(cbyte,ancount);
++  GET_W(cbyte,nscount);
++  GET_W(cbyte,arcount);
++  assert(cbyte == DNS_HDRSIZE);
++
++  flg_qr= f1&0x80;
++  opcode= (f1&0x78)>>3;
++  flg_tc= f1&0x02;
++  flg_rd= f1&0x01;
++  flg_ra= f2&0x80;
++  rcode= (f2&0x0f);
++
++  cname_here= 0;
++  
++  if (!flg_qr) {
++    adns__diag(ads,serv,0,"server sent us a query, not a response");
++    return;
++  }
++  if (opcode) {
++    adns__diag(ads,serv,0,"server sent us unknown opcode"
++	       " %d (wanted 0=QUERY)",opcode);
++    return;
++  }
++
++  qu= 0;
++  /* See if we can find the relevant query, or leave qu=0 otherwise ... */   
++
++  if (qdcount == 1) {
++    for (qu= viatcp ? ads->tcpw.head : ads->udpw.head; qu; qu= nqu) {
++      nqu= qu->next;
++      if (qu->id != id) continue;
++      if (dglen < qu->query_dglen) continue;
++      if (memcmp(qu->query_dgram+DNS_HDRSIZE,
++		 dgram+DNS_HDRSIZE,
++		 qu->query_dglen-DNS_HDRSIZE))
++	continue;
++      if (viatcp) {
++	assert(qu->state == query_tcpw);
++      } else {
++	assert(qu->state == query_tosend);
++	if (!(qu->udpsent & (1<<serv))) continue;
++      }
++      break;
++    }
++    if (qu) {
++      /* We're definitely going to do something with this query now */
++      if (viatcp) LIST_UNLINK(ads->tcpw,qu);
++      else LIST_UNLINK(ads->udpw,qu);
++    }
++  }
++  
++  /* If we're going to ignore the packet, we return as soon as we have
++   * failed the query (if any) and printed the warning message (if
++   * any).
++   */
++  switch (rcode) {
++  case rcode_noerror:
++  case rcode_nxdomain:
++    break;
++  case rcode_formaterror:
++    adns__warn(ads,serv,qu,"server cannot understand our query"
++	       " (Format Error)");
++    if (qu) adns__query_fail(qu,adns_s_rcodeformaterror);
++    return;
++  case rcode_servfail:
++    if (qu) adns__query_fail(qu,adns_s_rcodeservfail);
++    else adns__debug(ads,serv,qu,"server failure on unidentifiable query");
++    return;
++  case rcode_notimp:
++    adns__warn(ads,serv,qu,"server claims not to implement our query");
++    if (qu) adns__query_fail(qu,adns_s_rcodenotimplemented);
++    return;
++  case rcode_refused:
++    adns__debug(ads,serv,qu,"server refused our query");
++    if (qu) adns__query_fail(qu,adns_s_rcoderefused);
++    return;
++  default:
++    adns__warn(ads,serv,qu,"server gave unknown response code %d",rcode);
++    if (qu) adns__query_fail(qu,adns_s_rcodeunknown);
++    return;
++  }
++
++  if (!qu) {
++    if (!qdcount) {
++      adns__diag(ads,serv,0,"server sent reply without quoting our question");
++    } else if (qdcount>1) {
++      adns__diag(ads,serv,0,"server claimed to answer %d"
++		 " questions with one message", qdcount);
++    } else if (ads->iflags & adns_if_debug) {
++      adns__vbuf_init(&tempvb);
++      adns__debug(ads,serv,0,"reply not found, id %02x, query owner %s",
++		  id, adns__diag_domain(ads,serv,0,&tempvb,
++					dgram,dglen,DNS_HDRSIZE));
++      adns__vbuf_free(&tempvb);
++    }
++    return;
++  }
++
++  /* We're definitely going to do something with this packet and this
++   * query now. */
++  
++  anstart= qu->query_dglen;
++  arstart= -1;
++
++  /* Now, take a look at the answer section, and see if it is complete.
++   * If it has any CNAMEs we stuff them in the answer.
++   */
++  wantedrrs= 0;
++  cbyte= anstart;
++  for (rri= 0; rri<ancount; rri++) {
++    rrstart= cbyte;
++    st= adns__findrr(qu,serv, dgram,dglen,&cbyte,
++		     &rrtype,&rrclass,&ttl, &rdlength,&rdstart,
++		     &ownermatched);
++    if (st) { adns__query_fail(qu,st); return; }
++    if (rrtype == -1) goto x_truncated;
++
++    if (rrclass != DNS_CLASS_IN) {
++      adns__diag(ads,serv,qu,"ignoring answer RR with wrong class %d"
++		 " (expected IN=%d)", rrclass,DNS_CLASS_IN);
++      continue;
++    }
++    if (!ownermatched) {
++      if (ads->iflags & adns_if_debug) {
++	adns__debug(ads,serv,qu,"ignoring RR with an unexpected owner %s",
++		    adns__diag_domain(ads,serv,qu, &qu->vb,
++				      dgram,dglen,rrstart));
++      }
++      continue;
++    }
++    if (rrtype == adns_r_cname &&
++	(qu->answer->type & adns_rrt_typemask) != adns_r_cname) {
++      if (qu->flags & adns_qf_cname_forbid) {
++	adns__query_fail(qu,adns_s_prohibitedcname);
++	return;
++      } else if (qu->cname_dgram) { /* Ignore second and subsequent CNAME(s) */
++	adns__debug(ads,serv,qu,"allegedly canonical name %s"
++		    " is actually alias for %s", qu->answer->cname,
++		    adns__diag_domain(ads,serv,qu, &qu->vb,
++				      dgram,dglen,rdstart));
++	adns__query_fail(qu,adns_s_prohibitedcname);
++	return;
++      } else if (wantedrrs) { /* Ignore CNAME(s) after RR(s). */
++	adns__debug(ads,serv,qu,"ignoring CNAME (to %s) coexisting with RR",
++		    adns__diag_domain(ads,serv,qu, &qu->vb,
++				      dgram,dglen,rdstart));
++      } else {
++	qu->cname_begin= rdstart;
++	qu->cname_dglen= dglen;
++	st= adns__parse_domain(ads,serv,qu, &qu->vb,
++			       qu->flags & adns_qf_quotefail_cname
++			       ? 0 : pdf_quoteok,
++			       dgram,dglen, &rdstart,rdstart+rdlength);
++	if (!qu->vb.used) goto x_truncated;
++	if (st) { adns__query_fail(qu,st); return; }
++	l= strlen(qu->vb.buf)+1;
++	qu->answer->cname= adns__alloc_preserved(qu,l);
++	if (!qu->answer->cname) {
++	  adns__query_fail(qu,adns_s_nomemory);
++	  return;
++	}
++
++	qu->cname_dgram= adns__alloc_mine(qu,dglen);
++	memcpy(qu->cname_dgram,dgram,dglen);
++
++	memcpy(qu->answer->cname,qu->vb.buf,l);
++	cname_here= 1;
++	adns__update_expires(qu,ttl,now);
++	/* If we find the answer section truncated after this point we restart
++	 * the query at the CNAME; if beforehand then we obviously have to use
++	 * TCP.  If there is no truncation we can use the whole answer if
++	 * it contains the relevant info.
++	 */
++      }
++    } else if (rrtype == (qu->answer->type & adns_rrt_typemask)) {
++      wantedrrs++;
++    } else {
++      adns__debug(ads,serv,qu,"ignoring answer RR"
++		  " with irrelevant type %d",rrtype);
++    }
++  }
++
++  /* We defer handling truncated responses here, in case there was a CNAME
++   * which we could use.
++   */
++  if (flg_tc) goto x_truncated;
++  
++  nsstart= cbyte;
++
++  if (!wantedrrs) {
++    /* Oops, NODATA or NXDOMAIN or perhaps a referral
++     * (which would be a problem) */
++
++    /* RFC2308: NODATA has _either_ a SOA _or_ _no_ NS records
++     * in authority section */
++    foundsoa= 0; soattl= 0; foundns= 0;
++    for (rri= 0; rri<nscount; rri++) {
++      rrstart= cbyte;
++      st= adns__findrr(qu,serv, dgram,dglen,&cbyte,
++		       &rrtype,&rrclass,&ttl, &rdlength,&rdstart, 0);
++      if (st) { adns__query_fail(qu,st); return; }
++      if (rrtype==-1) goto x_truncated;
++      if (rrclass != DNS_CLASS_IN) {
++	adns__diag(ads,serv,qu,
++		   "ignoring authority RR with wrong class %d"
++		   " (expected IN=%d)", rrclass,DNS_CLASS_IN);
++	continue;
++      }
++      if (rrtype == adns_r_soa_raw) { foundsoa= 1; soattl= ttl; break; }
++      else if (rrtype == adns_r_ns_raw) { foundns= 1; }
++    }
++    
++    if (rcode == rcode_nxdomain) {
++      /* We still wanted to look for the SOA so we could find the TTL. */
++      adns__update_expires(qu,soattl,now);
++
++      if (qu->flags & adns_qf_search && !qu->cname_dgram) {
++	adns__search_next(ads,qu,now);
++      } else {
++	adns__query_fail(qu,adns_s_nxdomain);
++      }
++      return;
++    }
++
++    if (foundsoa || !foundns) {
++      /* Aha !  A NODATA response, good. */
++      adns__update_expires(qu,soattl,now);
++      adns__query_fail(qu,adns_s_nodata);
++      return;
++    }
++
++    /* Now what ?  No relevant answers, no SOA, and at least some NS's.
++     * Looks like a referral.  Just one last chance ... if we came across
++     * a CNAME in this datagram then we should probably do our own CNAME
++     * lookup now in the hope that we won't get a referral again.
++     */
++    if (cname_here) goto x_restartquery;
++
++    /* Bloody hell, I thought we asked for recursion ? */
++    if (!flg_ra) {
++      adns__diag(ads,serv,qu,"server is not willing"
++		 " to do recursive lookups for us");
++      adns__query_fail(qu,adns_s_norecurse);
++    } else {
++      if (!flg_rd)
++	adns__diag(ads,serv,qu,"server thinks"
++		   " we didn't ask for recursive lookup");
++      else
++	adns__debug(ads,serv,qu,"server claims to do recursion,"
++		    " but gave us a referral");
++      adns__query_fail(qu,adns_s_invalidresponse);
++    }
++    return;
++  }
++
++  /* Now, we have some RRs which we wanted. */
++
++  qu->answer->rrs.untyped= adns__alloc_interim(qu,qu->typei->rrsz*wantedrrs);
++  if (!qu->answer->rrs.untyped) {
++    adns__query_fail(qu,adns_s_nomemory);
++    return;
++  }
++
++  typei= qu->typei;
++  cbyte= anstart;
++  rrsdata= qu->answer->rrs.bytes;
++
++  pai.ads= qu->ads;
++  pai.qu= qu;
++  pai.serv= serv;
++  pai.dgram= dgram;
++  pai.dglen= dglen;
++  pai.nsstart= nsstart;
++  pai.nscount= nscount;
++  pai.arcount= arcount;
++  pai.now= now;
++
++  for (rri=0, nrrs=0; rri<ancount; rri++) {
++    st= adns__findrr(qu,serv, dgram,dglen,&cbyte,
++		     &rrtype,&rrclass,&ttl, &rdlength,&rdstart,
++		     &ownermatched);
++    assert(!st); assert(rrtype != -1);
++    if (rrclass != DNS_CLASS_IN ||
++	rrtype != (qu->answer->type & adns_rrt_typemask) ||
++	!ownermatched)
++      continue;
++    adns__update_expires(qu,ttl,now);
++    st= typei->parse(&pai, rdstart,rdstart+rdlength, rrsdata+nrrs*typei->rrsz);
++    if (st) { adns__query_fail(qu,st); return; }
++    if (rdstart==-1) goto x_truncated;
++    nrrs++;
++  }
++  assert(nrrs==wantedrrs);
++  qu->answer->nrrs= nrrs;
++
++  /* This may have generated some child queries ... */
++  if (qu->children.head) {
++    qu->state= query_childw;
++    LIST_LINK_TAIL(ads->childw,qu);
++    return;
++  }
++  adns__query_done(qu);
++  return;
++
++ x_truncated:
++  
++  if (!flg_tc) {
++    adns__diag(ads,serv,qu,"server sent datagram which points outside itself");
++    adns__query_fail(qu,adns_s_invalidresponse);
++    return;
++  }
++  qu->flags |= adns_qf_usevc;
++  
++ x_restartquery:
++  if (qu->cname_dgram) {
++    st= adns__mkquery_frdgram(qu->ads,&qu->vb,&qu->id,
++			      qu->cname_dgram,qu->cname_dglen,qu->cname_begin,
++			      qu->answer->type, qu->flags);
++    if (st) { adns__query_fail(qu,st); return; }
++    
++    newquery= realloc(qu->query_dgram,qu->vb.used);
++    if (!newquery) { adns__query_fail(qu,adns_s_nomemory); return; }
++    
++    qu->query_dgram= newquery;
++    qu->query_dglen= qu->vb.used;
++    memcpy(newquery,qu->vb.buf,qu->vb.used);
++  }
++  
++  if (qu->state == query_tcpw) qu->state= query_tosend;
++  qu->retries= 0;
++  adns__reset_preserved(qu);
++  adns__query_send(qu,now);
++}
+
+--pf9I7BMVVzbSWLtt--
diff --git a/package/adns/adns-1.4-destdir.patch b/package/adns/adns-1.4-destdir.patch
new file mode 100644
index 0000000..3270ed4
--- /dev/null
+++ b/package/adns/adns-1.4-destdir.patch
@@ -0,0 +1,54 @@
+Fix installation directory
+Upstream-Status: Pending
+
+diff -Naur adns-1.4.org/client/Makefile.in adns-1.4/client/Makefile.in
+--- adns-1.4.org/client/Makefile.in	2013-01-02 20:43:31.157268223 +0200
++++ adns-1.4/client/Makefile.in	2013-01-02 20:53:11.831761446 +0200
+@@ -58,9 +58,9 @@
+ all:		$(TARGETS)
+ 
+ install:	$(TARG_INSTALL)
+-		mkdir -p $(bindir)
++		$(INSTALL_PROGRAM) -d $(DESTDIR)/$(bindir)
+ 		set -xe; for f in $(TARG_INSTALL); \
+-			do $(INSTALL_PROGRAM) $$f $(bindir)/$$f; done
++			do $(INSTALL_PROGRAM) $$f $(DESTDIR)/$(bindir)/$$f; done
+ 
+ uninstall:
+ 		for f in $(TARGETS); do rm -f $(bindir)/$$f; done
+diff -Naur adns-1.4.org/dynamic/Makefile.in adns-1.4/dynamic/Makefile.in
+--- adns-1.4.org/dynamic/Makefile.in	2013-01-02 20:43:31.164272612 +0200
++++ adns-1.4/dynamic/Makefile.in	2013-01-02 20:54:42.702711906 +0200
+@@ -30,10 +30,10 @@
+ ALLOBJS=	$(addsuffix _p.o, $(basename $(LIBOBJS)))
+ 
+ install:
+-		mkdir -p $(libdir)
+-		$(INSTALL_PROGRAM) $(SHLIBFILE) $(libdir)/$(SHLIBFILE)
+-		ln -sf $(SHLIBFILE) $(libdir)/$(SHLIBSONAME)
+-		ln -sf $(SHLIBSONAME) $(libdir)/$(SHLIBFORLINK)
++		$(INSTALL_PROGRAM) -d $(DESTDIR)/$(libdir)
++		$(INSTALL_PROGRAM) $(SHLIBFILE) $(DESTDIR)/$(libdir)/$(SHLIBFILE)
++		ln -sf $(SHLIBFILE) $(DESTDIR)/$(libdir)/$(SHLIBSONAME)
++		ln -sf $(SHLIBSONAME) $(DESTDIR)/$(libdir)/$(SHLIBFORLINK)
+ 
+ uninstall:
+ 		rm -f $(libdir)/$(SHLIBFILE) $(libdir)/$(SHLIBSONAME)
+diff -Naur adns-1.4.org/src/Makefile.in adns-1.4/src/Makefile.in
+--- adns-1.4.org/src/Makefile.in	2013-01-02 20:43:31.162271358 +0200
++++ adns-1.4/src/Makefile.in	2013-01-02 20:56:31.669003041 +0200
+@@ -28,10 +28,11 @@
+ include		adns.make
+ 
+ install:
+-		mkdir -p $(libdir) $(includedir)
++		$(INSTALL_PROGRAM) -d $(DESTDIR)/$(libdir) 
++		$(INSTALL_PROGRAM) -d $(DESTDIR)/$(includedir)
+ 		set -xe; for f in $(TARGETS); \
+-			do $(INSTALL_DATA) $$f $(libdir)/$$f; done
+-		$(INSTALL_DATA) $(srcdir)/../src/adns.h $(includedir)/adns.h
++			do $(INSTALL_DATA) $$f $(DESTDIR)/$(libdir)/$$f; done
++		$(INSTALL_DATA) $(srcdir)/../src/adns.h $(DESTDIR)/$(includedir)/adns.h
+ 
+ uninstall:
+ 		for f in $(TARGETS); do rm -f $(libdir)/$$f; done
diff --git a/package/adns/adns-1.4-ipv6.patch b/package/adns/adns-1.4-ipv6.patch
new file mode 100644
index 0000000..8d02257
--- /dev/null
+++ b/package/adns/adns-1.4-ipv6.patch
@@ -0,0 +1,2725 @@
+Add IPv6 support
+Upstream-Status: Pending
+
+diff --git a/Makefile b/Makefile
+index 5ba3e19..a87bc87 100644
+--- a/Makefile
++++ b/Makefile
+@@ -56,9 +56,9 @@ dist_tmp=dist_tmp/adns-$(DISTVERSION)
+ dist:			distprep
+ 	rm -rf dist_tmp*
+ 	mkdir dist_tmp $(dist_tmp)
+-	find \( -name CVS -o -name dist_tmp* \) -prune -o -type d -print | \
++	find . \( -name CVS -o -name dist_tmp* \) -prune -o -type d -print | \
+ 		sed -e 's#.*#mkdir -p $(dist_tmp)/&#' | sh
+-	find \( -name CVS -o -name dist_tmp* \) -prune -o -type f -print | \
++	find . \( -name CVS -o -name dist_tmp* \) -prune -o -type f -print | \
+ 		sed -e 's#.*#ln & $(dist_tmp)/&#' | sh
+ 	$(MAKE) -C dist_tmp/adns-$(DISTVERSION) distclean
+ 	cd dist_tmp && tar cf ../$(dist_tmp).tar `basename $(dist_tmp)`
+diff --git a/Makefile.in b/Makefile.in
+index 6e2e449..0babf0e 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -56,9 +56,9 @@ dist_tmp=dist_tmp/adns-$(DISTVERSION)
+ dist:			distprep
+ 	rm -rf dist_tmp*
+ 	mkdir dist_tmp $(dist_tmp)
+-	find \( -name CVS -o -name dist_tmp* \) -prune -o -type d -print | \
++	find . \( -name CVS -o -name dist_tmp* \) -prune -o -type d -print | \
+ 		sed -e 's#.*#mkdir -p $(dist_tmp)/&#' | sh
+-	find \( -name CVS -o -name dist_tmp* \) -prune -o -type f -print | \
++	find . \( -name CVS -o -name dist_tmp* \) -prune -o -type f -print | \
+ 		sed -e 's#.*#ln & $(dist_tmp)/&#' | sh
+ 	$(MAKE) -C dist_tmp/adns-$(DISTVERSION) distclean
+ 	cd dist_tmp && tar cf ../$(dist_tmp).tar `basename $(dist_tmp)`
+diff --git a/client/adh-main.c b/client/adh-main.c
+index b6f3bd4..f2032ec 100644
+--- a/client/adh-main.c
++++ b/client/adh-main.c
+@@ -91,6 +91,7 @@ void of_type(const struct optioninfo *oi, const char *arg, const char *arg2) {
+     { adns_r_rp,     "rp"     },
+     { adns_r_srv,    "srv"    },
+     { adns_r_addr,   "addr"   },
++    { adns_r_srv,    "srv"    },
+     
+     /* types with only one version */
+     { adns_r_cname,  "cname"  },
+@@ -99,6 +100,7 @@ void of_type(const struct optioninfo *oi, const char *arg, const char *arg2) {
+     
+     /* raw versions */
+     { adns_r_a,        "a"    },
++    { adns_r_aaaa,     "aaaa" },
+     { adns_r_ns_raw,   "ns-"  },
+     { adns_r_soa_raw,  "soa-" },
+     { adns_r_ptr_raw,  "ptr-" },
+diff --git a/client/adh-opts.c b/client/adh-opts.c
+index 08310e0..7b17c89 100644
+--- a/client/adh-opts.c
++++ b/client/adh-opts.c
+@@ -32,6 +32,8 @@ int ov_verbose= 0;
+ adns_rrtype ov_type= adns_r_none;
+ int ov_search=0, ov_qc_query=0, ov_qc_anshost=0, ov_qc_cname=1;
+ int ov_tcp=0, ov_cname=0, ov_format=fmt_default;
++int ov_ipflags=0;
++int ov_ip6mapped=0;
+ char *ov_id= 0;
+ struct perqueryflags_remember ov_pqfr = { 1,1,1, tm_none };
+ 
+@@ -114,6 +116,16 @@ static const struct optioninfo perquery_options[]= {
+   { ot_value,            "CNAME ok for query domain, but not in RRs (default)",
+     "Cs", "cname-ok",      &ov_cname, 0 },
+   
++  { ot_desconly, "per-query IPv6 mode:" },
++  { ot_value,            "Ask only for IPv6 addresses",
++    "I6", "ip6-only", &ov_ipflags, adns_qf_ip6 },
++  { ot_value,            "Ask only for IPv4 addresses",
++    "I4", "ip4-only", &ov_ipflags, adns_qf_ip4 },
++  { ot_value,            "Ask for both IPv4 and IPv6 addresses (default)",
++    "IX", "ipv6-mixed", &ov_ipflags, adns_qf_ip4|adns_qf_ip6 },
++  { ot_value,            "Ask for both IPv4 and IPv6 addresses, using IPv4-mapped IPv6 addresses",
++    "IM", "ipv6-mapped", &ov_ip6mapped, adns_qf_ip6mapped },
++  
+   { ot_desconly, "asynchronous/pipe mode options:" },
+   { ot_funcarg,          "Set <id>, default is decimal sequence starting 0",
+     0, "asynch-id",        0,0, &of_asynch_id, "id" },
+diff --git a/client/adh-query.c b/client/adh-query.c
+index 125bb33..2186004 100644
+--- a/client/adh-query.c
++++ b/client/adh-query.c
+@@ -92,24 +92,37 @@ static void prep_query(struct query_node **qun_r, int *quflags_r) {
+     (ov_qc_query ? adns_qf_quoteok_query : 0) |
+     (ov_qc_anshost ? adns_qf_quoteok_anshost : 0) |
+     (ov_qc_cname ? 0 : adns_qf_quoteok_cname) |
++    ov_ipflags | ov_ip6mapped |
+     ov_cname,
+     
+   *qun_r= qun;
+ }
+   
++static int a2addr(adns_rr_addr *rr, const char *addr) {
++  char *p;
++  if (strchr(addr, ':')) {
++    memset(&rr->addr.inet6, 0, sizeof(rr->addr.inet6));
++    rr->addr.sa.sa_family = AF_INET6;
++    p = (char *) &rr->addr.inet6.sin6_addr;
++  }
++  else {
++    memset(&rr->addr.inet, 0, sizeof(rr->addr.inet));
++    rr->addr.sa.sa_family = AF_INET;
++    p = (char *) &rr->addr.inet.sin_addr;
++  }
++  return inet_pton(rr->addr.sa.sa_family, addr, p) > 0;
++}
++
+ void of_ptr(const struct optioninfo *oi, const char *arg, const char *arg2) {
+   struct query_node *qun;
+   int quflags, r;
+-  struct sockaddr_in sa;
+-
+-  memset(&sa,0,sizeof(sa));
+-  sa.sin_family= AF_INET;
+-  if (!inet_aton(arg,&sa.sin_addr)) usageerr("invalid IP address %s",arg);
++  adns_rr_addr rr;
+ 
++  if (!a2addr(&rr, arg)) usageerr("invalid IP address %s",arg);
+   prep_query(&qun,&quflags);
+   qun->owner= xstrsave(arg);
+   r= adns_submit_reverse(ads,
+-			 (struct sockaddr*)&sa,
++			 &rr.addr.sa,
+ 			 ov_type == adns_r_none ? adns_r_ptr : ov_type,
+ 			 quflags,
+ 			 qun,
+@@ -122,17 +135,14 @@ void of_ptr(const struct optioninfo *oi, const char *arg, const char *arg2) {
+ void of_reverse(const struct optioninfo *oi, const char *arg, const char *arg2) {
+   struct query_node *qun;
+   int quflags, r;
+-  struct sockaddr_in sa;
+-
+-  memset(&sa,0,sizeof(sa));
+-  sa.sin_family= AF_INET;
+-  if (!inet_aton(arg,&sa.sin_addr)) usageerr("invalid IP address %s",arg);
++  adns_rr_addr rr;
+ 
++  if (!a2addr(&rr, arg)) usageerr("invalid IP address %s",arg);
+   prep_query(&qun,&quflags);
+   qun->owner= xmalloc(strlen(arg) + strlen(arg2) + 2);
+   sprintf(qun->owner, "%s %s", arg,arg2);
+   r= adns_submit_reverse_any(ads,
+-			     (struct sockaddr*)&sa, arg2,
++			     &rr.addr.sa, arg2,
+ 			     ov_type == adns_r_none ? adns_r_txt : ov_type,
+ 			     quflags,
+ 			     qun,
+diff --git a/client/adnshost.h b/client/adnshost.h
+index fcc96a3..7e2341a 100644
+--- a/client/adnshost.h
++++ b/client/adnshost.h
+@@ -81,6 +81,8 @@ extern int ov_verbose;
+ extern adns_rrtype ov_type;
+ extern int ov_search, ov_qc_query, ov_qc_anshost, ov_qc_cname;
+ extern int ov_tcp, ov_cname, ov_format;
++extern int ov_ipflags;
++extern int ov_ip6mapped;
+ extern char *ov_id;
+ extern struct perqueryflags_remember ov_pqfr;
+ 
+diff --git a/client/adnstest.c b/client/adnstest.c
+index 550cf27..ae70285 100644
+--- a/client/adnstest.c
++++ b/client/adnstest.c
+@@ -119,13 +119,16 @@ static const adns_rrtype defaulttypes[]= {
+   adns_r_ptr_raw,
+   adns_r_hinfo,
+   adns_r_mx_raw,
++  adns_r_srv_raw,
+   adns_r_txt,
+   adns_r_rp_raw,
++  adns_r_aaaa, /* Does the order matter? */
+   
+   adns_r_addr,
+   adns_r_ns,
+   adns_r_ptr,
+   adns_r_mx,
++  adns_r_srv,
+   
+   adns_r_soa,
+   adns_r_rp,
+diff --git a/regress/case-connfail.sys b/regress/case-connfail.sys
+index b62923b..2064368 100644
+--- a/regress/case-connfail.sys
++++ b/regress/case-connfail.sys
+@@ -3,76 +3,88 @@
+  start 1056289303.784817
+  socket type=SOCK_DGRAM
+  socket=6
++ +0.000066
++ socket type=SOCK_DGRAM
++ socket=7
+  +0.000031
+  fcntl fd=6 cmd=F_GETFL
+  fcntl=~O_NONBLOCK&...
+  +0.000010
+  fcntl fd=6 cmd=F_SETFL O_NONBLOCK|...
+  fcntl=OK
++ +0.000264
++ fcntl fd=7 cmd=F_GETFL
++ fcntl=~O_NONBLOCK&...
++ +0.000087
++ fcntl fd=7 cmd=F_SETFL O_NONBLOCK|...
++ fcntl=OK
+  +0.000007
+  socket type=SOCK_STREAM
+- socket=7
++ socket=8
+  +0.000059
+- fcntl fd=7 cmd=F_GETFL
++ fcntl fd=8 cmd=F_GETFL
+  fcntl=~O_NONBLOCK&...
+  +0.000007
+- fcntl fd=7 cmd=F_SETFL O_NONBLOCK|...
++ fcntl fd=8 cmd=F_SETFL O_NONBLOCK|...
+  fcntl=OK
+  +0.000006
+- connect fd=7 addr=172.18.45.36:53
++ connect fd=8 addr=172.18.45.36:53
+  connect=ENOTSOCK
+  +0.000013
+- close fd=7
++ close fd=8
+  close=OK
+  +0.000031
+  socket type=SOCK_STREAM
+- socket=7
++ socket=8
+  +0.000035
+- fcntl fd=7 cmd=F_GETFL
++ fcntl fd=8 cmd=F_GETFL
+  fcntl=~O_NONBLOCK&...
+  +0.000006
+- fcntl fd=7 cmd=F_SETFL O_NONBLOCK|...
++ fcntl fd=8 cmd=F_SETFL O_NONBLOCK|...
+  fcntl=OK
+  +0.000007
+- connect fd=7 addr=172.18.45.6:53
++ connect fd=8 addr=172.18.45.6:53
+  connect=ENOTSOCK
+  +0.000008
+- close fd=7
++ close fd=8
+  close=OK
+  +0.000013
+- select max=7 rfds=[6] wfds=[] efds=[] to=0.000000
++ select max=8 rfds=[6,7] wfds=[] efds=[] to=0.000000
+  select=0 rfds=[] wfds=[] efds=[]
+  +0.000036
+  socket type=SOCK_STREAM
+- socket=7
++ socket=8
+  +0.000036
+- fcntl fd=7 cmd=F_GETFL
++ fcntl fd=8 cmd=F_GETFL
+  fcntl=~O_NONBLOCK&...
+  +0.000007
+- fcntl fd=7 cmd=F_SETFL O_NONBLOCK|...
++ fcntl fd=8 cmd=F_SETFL O_NONBLOCK|...
+  fcntl=OK
+  +0.000006
+- connect fd=7 addr=172.18.45.36:53
++ connect fd=8 addr=172.18.45.36:53
+  connect=ENOTSOCK
+  +0.000008
+- close fd=7
++ close fd=8
+  close=OK
+  +0.000013
+  socket type=SOCK_STREAM
+- socket=7
++ socket=8
+  +0.000036
+- fcntl fd=7 cmd=F_GETFL
++ fcntl fd=8 cmd=F_GETFL
+  fcntl=~O_NONBLOCK&...
+  +0.000007
+- fcntl fd=7 cmd=F_SETFL O_NONBLOCK|...
++ fcntl fd=8 cmd=F_SETFL O_NONBLOCK|...
+  fcntl=OK
+  +0.000006
+- connect fd=7 addr=172.18.45.6:53
++ connect fd=8 addr=172.18.45.6:53
+  connect=ENOTSOCK
+  +0.000008
+- close fd=7
++ close fd=8
+  close=OK
+  +0.000012
+  close fd=6
+  close=OK
++ +0.000067
++ close fd=7
++ close=OK
+  +0.000023
+diff --git a/regress/case-flags10.sys b/regress/case-flags10.sys
+index fe0b341..99f1f8b 100644
+--- a/regress/case-flags10.sys
++++ b/regress/case-flags10.sys
+@@ -3,13 +3,25 @@ adnstest default
+  start 929580072.670441
+  socket type=SOCK_DGRAM
+  socket=4
++ +0.000066
++ socket type=SOCK_DGRAM
++ socket=7
+  +0.000191
+  fcntl fd=4 cmd=F_GETFL
+  fcntl=~O_NONBLOCK&...
+  +0.000084
+  fcntl fd=4 cmd=F_SETFL O_NONBLOCK|...
+  fcntl=OK
++ +0.000264
++ fcntl fd=7 cmd=F_GETFL
++ fcntl=~O_NONBLOCK&...
++ +0.000087
++ fcntl fd=7 cmd=F_SETFL O_NONBLOCK|...
++ fcntl=OK
+  +0.000061
+  close fd=4
+  close=OK
++ +0.000067
++ close fd=7
++ close=OK
+  +0.000001
+diff --git a/regress/case-longdom1.sys b/regress/case-longdom1.sys
+index a54e14d..6920322 100644
+--- a/regress/case-longdom1.sys
++++ b/regress/case-longdom1.sys
+@@ -3,13 +3,25 @@ adnstest default
+  start 951955690.505811
+  socket type=SOCK_DGRAM
+  socket=4
++ +0.000066
++ socket type=SOCK_DGRAM
++ socket=7
+  +0.000126
+  fcntl fd=4 cmd=F_GETFL
+  fcntl=~O_NONBLOCK&...
+  +0.000058
+  fcntl fd=4 cmd=F_SETFL O_NONBLOCK|...
+  fcntl=OK
++ +0.000264
++ fcntl fd=7 cmd=F_GETFL
++ fcntl=~O_NONBLOCK&...
++ +0.000087
++ fcntl fd=7 cmd=F_SETFL O_NONBLOCK|...
++ fcntl=OK
+  +0.000035
+  close fd=4
+  close=OK
++ +0.000067
++ close fd=7
++ close=OK
+  +0.000269
+diff --git a/regress/case-longdomsrch0.sys b/regress/case-longdomsrch0.sys
+index 298bec8..94be025 100644
+--- a/regress/case-longdomsrch0.sys
++++ b/regress/case-longdomsrch0.sys
+@@ -3,13 +3,25 @@ adnstest ndots100
+  start 951956073.321566
+  socket type=SOCK_DGRAM
+  socket=4
++ +0.000066
++ socket type=SOCK_DGRAM
++ socket=7
+  +0.000131
+  fcntl fd=4 cmd=F_GETFL
+  fcntl=~O_NONBLOCK&...
+  +0.000056
+  fcntl fd=4 cmd=F_SETFL O_NONBLOCK|...
+  fcntl=OK
++ +0.000264
++ fcntl fd=7 cmd=F_GETFL
++ fcntl=~O_NONBLOCK&...
++ +0.000087
++ fcntl fd=7 cmd=F_SETFL O_NONBLOCK|...
++ fcntl=OK
+  +0.000034
+  close fd=4
+  close=OK
++ +0.000067
++ close fd=7
++ close=OK
+  +0.000340
+diff --git a/regress/case-longlab1.sys b/regress/case-longlab1.sys
+index 5b0e46a..d832c9d 100644
+--- a/regress/case-longlab1.sys
++++ b/regress/case-longlab1.sys
+@@ -3,13 +3,25 @@ adnstest default
+  start 951955261.286712
+  socket type=SOCK_DGRAM
+  socket=4
++ +0.000066
++ socket type=SOCK_DGRAM
++ socket=7
+  +0.000128
+  fcntl fd=4 cmd=F_GETFL
+  fcntl=~O_NONBLOCK&...
+  +0.000053
+  fcntl fd=4 cmd=F_SETFL O_NONBLOCK|...
+  fcntl=OK
++ +0.000264
++ fcntl fd=7 cmd=F_GETFL
++ fcntl=~O_NONBLOCK&...
++ +0.000087
++ fcntl fd=7 cmd=F_SETFL O_NONBLOCK|...
++ fcntl=OK
+  +0.000033
+  close fd=4
+  close=OK
++ +0.000067
++ close fd=7
++ close=OK
+  +0.000238
+diff --git a/regress/case-tcpmultipart.sys b/regress/case-tcpmultipart.sys
+index d26ded2..00e2488 100644
+--- a/regress/case-tcpmultipart.sys
++++ b/regress/case-tcpmultipart.sys
+@@ -3,12 +3,21 @@ adnstest tunnel
+  start 938365454.994875
+  socket type=SOCK_DGRAM
+  socket=4
++ +0.000066
++ socket type=SOCK_DGRAM
++ socket=7
+  +0.000164
+  fcntl fd=4 cmd=F_GETFL
+  fcntl=~O_NONBLOCK&...
+  +0.000055
+  fcntl fd=4 cmd=F_SETFL O_NONBLOCK|...
+  fcntl=OK
++ +0.000264
++ fcntl fd=7 cmd=F_GETFL
++ fcntl=~O_NONBLOCK&...
++ +0.000087
++ fcntl fd=7 cmd=F_SETFL O_NONBLOCK|...
++ fcntl=OK
+  +0.000043
+  socket type=SOCK_STREAM
+  socket=5
+@@ -22,7 +31,7 @@ adnstest tunnel
+  connect fd=5 addr=172.31.80.9:53
+  connect=EINPROGRESS
+  +0.000414
+- select max=6 rfds=[4] wfds=[5] efds=[] to=13.998324
++ select max=8 rfds=[4,7] wfds=[5] efds=[] to=13.998324
+  select=1 rfds=[] wfds=[5] efds=[]
+  +1.-647444
+  read fd=5 buflen=1
+@@ -43,7 +52,7 @@ adnstest tunnel
+      2d616464 72046172 70610000 0c0001.
+  write=47
+  +0.000273
+- select max=6 rfds=[4,5] wfds=[] efds=[5] to=29.644233
++ select max=8 rfds=[4,5,7] wfds=[] efds=[5] to=29.644233
+  select=1 rfds=[5] wfds=[] efds=[]
+  +0.538651
+  read fd=5 buflen=2
+@@ -66,7 +75,7 @@ adnstest tunnel
+  read fd=5 buflen=297
+  read=EAGAIN
+  +0.000476
+- select max=6 rfds=[4,5] wfds=[] efds=[5] to=29.105246
++ select max=8 rfds=[4,5,7] wfds=[] efds=[5] to=29.105246
+  select=1 rfds=[5] wfds=[] efds=[]
+  +1.-401146
+  read fd=5 buflen=297
+@@ -109,7 +118,7 @@ adnstest tunnel
+  read fd=5 buflen=2572
+  read=EAGAIN
+  +0.000101
+- select max=6 rfds=[4,5] wfds=[] efds=[5] to=28.502804
++ select max=8 rfds=[4,5,7] wfds=[] efds=[5] to=28.502804
+  select=1 rfds=[5] wfds=[] efds=[]
+  +0.336462
+  read fd=5 buflen=2572
+@@ -148,7 +157,7 @@ adnstest tunnel
+  read fd=5 buflen=1624
+  read=EAGAIN
+  +0.000124
+- select max=6 rfds=[4,5] wfds=[] efds=[5] to=28.162903
++ select max=8 rfds=[4,5,7] wfds=[] efds=[5] to=28.162903
+  select=1 rfds=[5] wfds=[] efds=[]
+  +1.-683589
+  read fd=5 buflen=1624
+@@ -187,7 +196,7 @@ adnstest tunnel
+  read fd=5 buflen=676
+  read=EAGAIN
+  +0.000114
+- select max=6 rfds=[4,5] wfds=[] efds=[5] to=27.843177
++ select max=8 rfds=[4,5,7] wfds=[] efds=[5] to=27.843177
+  select=1 rfds=[5] wfds=[] efds=[]
+  +0.376863
+  read fd=5 buflen=676
+@@ -230,7 +239,7 @@ adnstest tunnel
+  read fd=5 buflen=3248
+  read=EAGAIN
+  +0.000066
+- select max=6 rfds=[4,5] wfds=[] efds=[5] to=27.454446
++ select max=8 rfds=[4,5,7] wfds=[] efds=[5] to=27.454446
+  select=1 rfds=[5] wfds=[] efds=[]
+  +0.316770
+  read fd=5 buflen=3248
+@@ -242,6 +251,9 @@ adnstest tunnel
+  +0.000429
+  close fd=4
+  close=OK
++ +0.000067
++ close fd=7
++ close=OK
+  +0.000375
+  close fd=5
+  close=OK
+diff --git a/regress/case-timeout.sys b/regress/case-timeout.sys
+index f810c3b..756becc 100644
+--- a/regress/case-timeout.sys
++++ b/regress/case-timeout.sys
+@@ -3,19 +3,28 @@ adnstest noserver
+  start 912889153.349504
+  socket type=SOCK_DGRAM
+  socket=4
++ +0.000066
++ socket type=SOCK_DGRAM
++ socket=7
+  +0.000193
+  fcntl fd=4 cmd=F_GETFL
+  fcntl=~O_NONBLOCK&...
+  +0.000088
+  fcntl fd=4 cmd=F_SETFL O_NONBLOCK|...
+  fcntl=OK
++ +0.000264
++ fcntl fd=7 cmd=F_GETFL
++ fcntl=~O_NONBLOCK&...
++ +0.000087
++ fcntl fd=7 cmd=F_SETFL O_NONBLOCK|...
++ fcntl=OK
+  +0.000072
+  sendto fd=4 addr=172.18.45.36:53
+      311f0100 00010000 00000000 06636869 61726b08 67726565 6e656e64 036f7267
+      02756b00 00010001.
+  sendto=40
+  +0.000617
+- select max=5 rfds=[4] wfds=[] efds=[] to=1.999383
++ select max=8 rfds=[4,7] wfds=[] efds=[] to=1.999383
+  select=0 rfds=[] wfds=[] efds=[]
+  +2.008683
+  sendto fd=4 addr=172.18.45.36:53
+@@ -23,7 +32,7 @@ adnstest noserver
+      02756b00 00010001.
+  sendto=40
+  +0.000406
+- select max=5 rfds=[4] wfds=[] efds=[] to=1.999594
++ select max=8 rfds=[4,7] wfds=[] efds=[] to=1.999594
+  select=0 rfds=[] wfds=[] efds=[]
+  +2.009544
+  sendto fd=4 addr=172.18.45.36:53
+@@ -31,7 +40,7 @@ adnstest noserver
+      02756b00 00010001.
+  sendto=40
+  +0.000428
+- select max=5 rfds=[4] wfds=[] efds=[] to=1.999572
++ select max=8 rfds=[4,7] wfds=[] efds=[] to=1.999572
+  select=0 rfds=[] wfds=[] efds=[]
+  +2.009567
+  sendto fd=4 addr=172.18.45.36:53
+@@ -39,7 +48,7 @@ adnstest noserver
+      02756b00 00010001.
+  sendto=40
+  +0.000449
+- select max=5 rfds=[4] wfds=[] efds=[] to=1.999551
++ select max=8 rfds=[4,7] wfds=[] efds=[] to=1.999551
+  select=0 rfds=[] wfds=[] efds=[]
+  +2.009551
+  sendto fd=4 addr=172.18.45.36:53
+@@ -47,7 +56,7 @@ adnstest noserver
+      02756b00 00010001.
+  sendto=40
+  +0.000381
+- select max=5 rfds=[4] wfds=[] efds=[] to=1.999619
++ select max=8 rfds=[4,7] wfds=[] efds=[] to=1.999619
+  select=0 rfds=[] wfds=[] efds=[]
+  +2.009614
+  sendto fd=4 addr=172.18.45.36:53
+@@ -55,7 +64,7 @@ adnstest noserver
+      02756b00 00010001.
+  sendto=40
+  +0.000383
+- select max=5 rfds=[4] wfds=[] efds=[] to=1.999617
++ select max=8 rfds=[4,7] wfds=[] efds=[] to=1.999617
+  select=0 rfds=[] wfds=[] efds=[]
+  +2.009622
+  sendto fd=4 addr=172.18.45.36:53
+@@ -63,7 +72,7 @@ adnstest noserver
+      02756b00 00010001.
+  sendto=40
+  +0.000387
+- select max=5 rfds=[4] wfds=[] efds=[] to=1.999613
++ select max=8 rfds=[4,7] wfds=[] efds=[] to=1.999613
+  select=0 rfds=[] wfds=[] efds=[]
+  +2.009603
+  sendto fd=4 addr=172.18.45.36:53
+@@ -71,7 +80,7 @@ adnstest noserver
+      02756b00 00010001.
+  sendto=40
+  +0.000404
+- select max=5 rfds=[4] wfds=[] efds=[] to=1.999596
++ select max=8 rfds=[4,7] wfds=[] efds=[] to=1.999596
+  select=0 rfds=[] wfds=[] efds=[]
+  +2.009607
+  sendto fd=4 addr=172.18.45.36:53
+@@ -79,7 +88,7 @@ adnstest noserver
+      02756b00 00010001.
+  sendto=40
+  +0.000468
+- select max=5 rfds=[4] wfds=[] efds=[] to=1.999532
++ select max=8 rfds=[4,7] wfds=[] efds=[] to=1.999532
+  select=0 rfds=[] wfds=[] efds=[]
+  +2.009526
+  sendto fd=4 addr=172.18.45.36:53
+@@ -87,7 +96,7 @@ adnstest noserver
+      02756b00 00010001.
+  sendto=40
+  +0.000431
+- select max=5 rfds=[4] wfds=[] efds=[] to=1.999569
++ select max=8 rfds=[4,7] wfds=[] efds=[] to=1.999569
+  select=0 rfds=[] wfds=[] efds=[]
+  +2.009564
+  sendto fd=4 addr=172.18.45.36:53
+@@ -95,7 +104,7 @@ adnstest noserver
+      02756b00 00010001.
+  sendto=40
+  +0.000429
+- select max=5 rfds=[4] wfds=[] efds=[] to=1.999571
++ select max=8 rfds=[4,7] wfds=[] efds=[] to=1.999571
+  select=0 rfds=[] wfds=[] efds=[]
+  +2.009586
+  sendto fd=4 addr=172.18.45.36:53
+@@ -103,7 +112,7 @@ adnstest noserver
+      02756b00 00010001.
+  sendto=40
+  +0.000479
+- select max=5 rfds=[4] wfds=[] efds=[] to=1.999521
++ select max=8 rfds=[4,7] wfds=[] efds=[] to=1.999521
+  select=0 rfds=[] wfds=[] efds=[]
+  +2.009511
+  sendto fd=4 addr=172.18.45.36:53
+@@ -111,7 +120,7 @@ adnstest noserver
+      02756b00 00010001.
+  sendto=40
+  +0.000430
+- select max=5 rfds=[4] wfds=[] efds=[] to=1.999570
++ select max=8 rfds=[4,7] wfds=[] efds=[] to=1.999570
+  select=0 rfds=[] wfds=[] efds=[]
+  +2.009571
+  sendto fd=4 addr=172.18.45.36:53
+@@ -119,7 +128,7 @@ adnstest noserver
+      02756b00 00010001.
+  sendto=40
+  +0.000440
+- select max=5 rfds=[4] wfds=[] efds=[] to=1.999560
++ select max=8 rfds=[4,7] wfds=[] efds=[] to=1.999560
+  select=0 rfds=[] wfds=[] efds=[]
+  +2.009564
+  sendto fd=4 addr=172.18.45.36:53
+@@ -127,9 +136,12 @@ adnstest noserver
+      02756b00 00010001.
+  sendto=40
+  +0.000439
+- select max=5 rfds=[4] wfds=[] efds=[] to=1.999561
++ select max=8 rfds=[4,7] wfds=[] efds=[] to=1.999561
+  select=0 rfds=[] wfds=[] efds=[]
+  +2.009554
+  close fd=4
+  close=OK
++ +0.000067
++ close fd=7
++ close=OK
+  +0.000267
+diff --git a/regress/case-unknownq.sys b/regress/case-unknownq.sys
+index 736210d..052c028 100644
+--- a/regress/case-unknownq.sys
++++ b/regress/case-unknownq.sys
+@@ -3,13 +3,25 @@ adnstest default
+  start 933811310.565828
+  socket type=SOCK_DGRAM
+  socket=4
++ +0.000066
++ socket type=SOCK_DGRAM
++ socket=7
+  +0.000264
+  fcntl fd=4 cmd=F_GETFL
+  fcntl=~O_NONBLOCK&...
+  +0.000087
+  fcntl fd=4 cmd=F_SETFL O_NONBLOCK|...
+  fcntl=OK
++ +0.000264
++ fcntl fd=7 cmd=F_GETFL
++ fcntl=~O_NONBLOCK&...
++ +0.000087
++ fcntl fd=7 cmd=F_SETFL O_NONBLOCK|...
++ fcntl=OK
+  +0.000067
+  close fd=4
+  close=OK
++ +0.000067
++ close fd=7
++ close=OK
+  +0.000307
+diff --git a/regress/hcommon.c b/regress/hcommon.c
+index 0324e58..60cd7cc 100644
+--- a/regress/hcommon.c
++++ b/regress/hcommon.c
+@@ -144,10 +144,18 @@ void Qwrite(	int fd , const void *buf , size_t len 	) {
+   Q_vb();
+ }
+ void Tvbaddr(const struct sockaddr *addr, int len) {
+-  const struct sockaddr_in *ai= (const struct sockaddr_in*)addr;
+-  assert(len==sizeof(struct sockaddr_in));
+-  assert(ai->sin_family==AF_INET);
+-  Tvbf("%s:%u",inet_ntoa(ai->sin_addr),htons(ai->sin_port));
++  if(addr->sa_family==AF_INET) {
++    const struct sockaddr_in *ai= (const struct sockaddr_in*)addr;
++    assert(len==sizeof(struct sockaddr_in));
++    assert(ai->sin_family==AF_INET);
++    Tvbf("%s:%u",inet_ntoa(ai->sin_addr),htons(ai->sin_port));
++  } else {
++    char buf[INET6_ADDRSTRLEN];
++    const struct sockaddr_in6 *ai6= (const struct sockaddr_in6*)addr;
++    assert(len==sizeof(struct sockaddr_in6));
++    assert(ai6->sin6_family==AF_INET6);
++    Tvbf("%s:%u",inet_ntop(AF_INET6, &(ai6->sin6_addr), buf, sizeof(buf)),htons(ai6->sin6_port));
++  }
+ }
+ void Tvbbytes(const void *buf, int len) {
+   const byte *bp;
+diff --git a/regress/hcommon.c.m4 b/regress/hcommon.c.m4
+index 0f205fe..5de19d4 100644
+--- a/regress/hcommon.c.m4
++++ b/regress/hcommon.c.m4
+@@ -129,11 +129,18 @@ m4_define(`hm_specsyscall', `')
+ m4_include(`hsyscalls.i4')
+ 
+ void Tvbaddr(const struct sockaddr *addr, int len) {
+-  const struct sockaddr_in *ai= (const struct sockaddr_in*)addr;
+-  
+-  assert(len==sizeof(struct sockaddr_in));
+-  assert(ai->sin_family==AF_INET);
+-  Tvbf("%s:%u",inet_ntoa(ai->sin_addr),htons(ai->sin_port));
++  if(addr->sa_family==AF_INET) {
++    const struct sockaddr_in *ai= (const struct sockaddr_in*)addr;
++    assert(len==sizeof(struct sockaddr_in));
++    assert(ai->sin_family==AF_INET);
++    Tvbf("%s:%u",inet_ntoa(ai->sin_addr),htons(ai->sin_port));
++  } else {
++    char buf[INET6_ADDRSTRLEN];
++    const struct sockaddr_in6 *ai6= (const struct sockaddr_in6*)addr;
++    assert(len==sizeof(struct sockaddr_in6));
++    assert(ai6->sin6_family==AF_INET6);
++    Tvbf("%s:%u",inet_ntop(AF_INET6, &(ai6->sin6_addr), buf, sizeof(buf)),htons(ai6->sin6_port));
++  }
+ }
+ 
+ void Tvbbytes(const void *buf, int len) {
+diff --git a/regress/hplayback.c b/regress/hplayback.c
+index 594f7e6..e0e2246 100644
+--- a/regress/hplayback.c
++++ b/regress/hplayback.c
+@@ -153,22 +153,42 @@ static void Ppollfds(struct pollfd *fds, int nfds) {
+ }
+ #endif
+ static void Paddr(struct sockaddr *addr, int *lenr) {
++  struct sockaddr_in6 *sa6= (struct sockaddr_in6*)addr;
+   struct sockaddr_in *sa= (struct sockaddr_in*)addr;
+   char *p, *ep;
+   long ul;
+   assert(*lenr >= sizeof(*sa));
+-  p= strchr(vb2.buf+vb2.used,':');
+-  if (!p) Psyntax("no port on address");
+-  *p++= 0;
+   memset(sa,0,sizeof(*sa));
+-  sa->sin_family= AF_INET;
+-  if (!inet_aton(vb2.buf+vb2.used,&sa->sin_addr)) Psyntax("invalid address");
+-  ul= strtoul(p,&ep,10);
+-  if (*ep && *ep != ' ') Psyntax("invalid port (bad syntax)");
+-  if (ul >= 65536) Psyntax("port too large");
+-  sa->sin_port= htons(ul);
+-  *lenr= sizeof(*sa);
+-  vb2.used= ep - (char*)vb2.buf;
++  if (!inet_aton(vb2.buf+vb2.used,&sa->sin_addr)){  
++    p= strchr(vb2.buf+vb2.used,':');
++    if (!p) Psyntax("no port on address");
++    *p++= 0;
++    sa->sin_family= AF_INET;
++    ul= strtoul(p,&ep,10);
++    if (*ep && *ep != ' ') Psyntax("invalid port (bad syntax)");
++    if (ul >= 65536) Psyntax("port too large");
++    sa->sin_port= htons(ul);
++    *lenr= sizeof(*sa);
++    vb2.used= ep - (char*)vb2.buf;
++    return;
++    } else {
++    assert(*lenr >= sizeof(*sa6));
++    memset(sa6,0,sizeof(*sa6));
++    if (!inet_pton(AF_INET6, vb2.buf+vb2.used, &sa6->sin6_addr)) {
++      p= strrchr(vb2.buf+vb2.used,':');
++      if (!p) Psyntax("no port on address");
++      *p++= 0;
++      sa6->sin6_family= AF_INET6;
++      ul= strtoul(p,&ep,10);
++      if (*ep && *ep != ' ') Psyntax("invalid port (bad syntax)");
++      if (ul >= 65536) Psyntax("port too large");
++      sa6->sin6_port= htons(ul);
++      *lenr= sizeof(*sa6);
++      vb2.used= ep - (char*)vb2.buf;
++      return;
++      }
++    }
++  Psyntax("invalid address"); 
+ }
+ static int Pbytes(byte *buf, int maxlen) {
+   static const char hexdigits[]= "0123456789abcdef";
+@@ -283,7 +303,6 @@ int Hpoll(	struct pollfd *fds , int nfds , int timeout 	) {
+ int Hsocket(	int domain , int type , int protocol 	) {
+  int r, amtread;
+  char *ep;
+-	Tmust("socket","domain",domain==AF_INET); 
+   Tmust("socket","type",type==SOCK_STREAM || type==SOCK_DGRAM); 
+  Qsocket(	 type 	);
+  if (!adns__vbuf_ensure(&vb2,1000)) Tnomem();
+diff --git a/regress/hplayback.c.m4 b/regress/hplayback.c.m4
+index 868aa52..d023b7c 100644
+--- a/regress/hplayback.c.m4
++++ b/regress/hplayback.c.m4
+@@ -210,24 +210,42 @@ static void Ppollfds(struct pollfd *fds, int nfds) {
+ #endif
+ 
+ static void Paddr(struct sockaddr *addr, int *lenr) {
++  struct sockaddr_in6 *sa6= (struct sockaddr_in6*)addr;
+   struct sockaddr_in *sa= (struct sockaddr_in*)addr;
+   char *p, *ep;
+   long ul;
+-  
+   assert(*lenr >= sizeof(*sa));
+-  p= strchr(vb2.buf+vb2.used,':');
+-  if (!p) Psyntax("no port on address");
+-  *p++= 0;
+   memset(sa,0,sizeof(*sa));
+-  sa->sin_family= AF_INET;
+-  if (!inet_aton(vb2.buf+vb2.used,&sa->sin_addr)) Psyntax("invalid address");
+-  ul= strtoul(p,&ep,10);
+-  if (*ep && *ep != hm_squote hm_squote) Psyntax("invalid port (bad syntax)");
+-  if (ul >= 65536) Psyntax("port too large");
+-  sa->sin_port= htons(ul);
+-  *lenr= sizeof(*sa);
+-
+-  vb2.used= ep - (char*)vb2.buf;
++  if (!inet_aton(vb2.buf+vb2.used,&sa->sin_addr)){  
++    p= strchr(vb2.buf+vb2.used,':');
++    if (!p) Psyntax("no port on address");
++    *p++= 0;
++    sa->sin_family= AF_INET;
++    ul= strtoul(p,&ep,10);
++    if (*ep && *ep != ' ') Psyntax("invalid port (bad syntax)");
++    if (ul >= 65536) Psyntax("port too large");
++    sa->sin_port= htons(ul);
++    *lenr= sizeof(*sa);
++    vb2.used= ep - (char*)vb2.buf;
++    return;
++    } else {
++    assert(*lenr >= sizeof(*sa6));
++    memset(sa6,0,sizeof(*sa6));
++    if (!inet_pton(AF_INET6, vb2.buf+vb2.used, &sa6->sin6_addr)) {
++      p= strrchr(vb2.buf+vb2.used,':');
++      if (!p) Psyntax("no port on address");
++      *p++= 0;
++      sa6->sin6_family= AF_INET6;
++      ul= strtoul(p,&ep,10);
++      if (*ep && *ep != ' ') Psyntax("invalid port (bad syntax)");
++      if (ul >= 65536) Psyntax("port too large");
++      sa6->sin6_port= htons(ul);
++      *lenr= sizeof(*sa6);
++      vb2.used= ep - (char*)vb2.buf;
++      return;
++      }
++    }
++  Psyntax("invalid address"); 
+ }
+ 
+ static int Pbytes(byte *buf, int maxlen) {
+diff --git a/regress/hrecord.c b/regress/hrecord.c
+index 88e24a4..67dff6f 100644
+--- a/regress/hrecord.c
++++ b/regress/hrecord.c
+@@ -81,7 +81,6 @@ int Hpoll(	struct pollfd *fds , int nfds , int timeout 	) {
+ #endif
+ int Hsocket(	int domain , int type , int protocol 	) {
+  int r, e;
+-	Tmust("socket","domain",domain==AF_INET); 
+   Tmust("socket","type",type==SOCK_STREAM || type==SOCK_DGRAM); 
+  Qsocket(	 type 	);
+  r= socket(	domain , type , protocol 	);
+diff --git a/regress/hsyscalls.i4 b/regress/hsyscalls.i4
+index ad90104..b5dfc56 100644
+--- a/regress/hsyscalls.i4
++++ b/regress/hsyscalls.i4
+@@ -70,7 +70,7 @@ hm_syscall(
+ 
+ hm_syscall(
+ 	socket, `hm_rv_fd', `
+-	hm_arg_must(int,domain,AF_INET) hm_na
++	hm_arg_ign(int,domain) hm_na
+ 	hm_arg_socktype(type) hm_na
+ 	hm_arg_ign(int,protocol) hm_na
+ ')
+diff --git a/src/adns.h b/src/adns.h
+index 34f9f49..aad05fd 100644
+--- a/src/adns.h
++++ b/src/adns.h
+@@ -71,6 +71,10 @@
+ extern "C" { /* I really dislike this - iwj. */
+ #endif
+ 
++#ifndef AF_INET6
++#include "adns-in6fake.h"
++#endif
++
+ /* All struct in_addr anywhere in adns are in NETWORK byte order. */
+ 
+ typedef struct adns__state *adns_state;
+@@ -87,7 +91,10 @@ typedef enum { /* In general, or together the desired flags: */
+  adns_if_eintr=       0x0020,/* allow _wait and _synchronous to return EINTR */
+  adns_if_nosigpipe=   0x0040,/* applic has SIGPIPE ignored, do not protect */
+  adns_if_checkc_entex=0x0100,/* consistency checks on entry/exit to adns fns */
+- adns_if_checkc_freq= 0x0300 /* consistency checks very frequently (slow!) */
++ adns_if_checkc_freq= 0x0300,/* consistency checks very frequently (slow!) */
++ adns_if_ip4only=     0x1000,/* make default be adns_qf_ip4 */
++ adns_if_ip6only=     0x2000,/* make default be adns_qf_ip6 */
++ adns_if_ip6mapped=   0x4000,/* make default be adns_qf_ip4|adns_qf_ip6|adns_qf_ip6mapped */
+ } adns_initflags;
+ 
+ typedef enum { /* In general, or together the desired flags: */
+@@ -101,9 +108,54 @@ typedef enum { /* In general, or together the desired flags: */
+  adns_qf_quotefail_cname=0x00000080,/* refuse if quote-req chars in CNAME we go via */
+  adns_qf_cname_loose=    0x00000100,/* allow refs to CNAMEs - without, get _s_cname */
+  adns_qf_cname_forbid=   0x00000200,/* don't follow CNAMEs, instead give _s_cname */
++
++ /* Affects addr queries and additional section processing */
++ adns_qf_ip4=            0x00001000, /* Ask for A records */
++ adns_qf_ip6=            0x00002000, /* Ask for AAAA records */
++ adns_qf_ip6mapped=      0x00004000, /* Return any IPv4 addresses as IPv6 mapped addresses */
++
++ adns__qf_ip_mask=       0x00003000,
+  adns__qf_internalmask=  0x0ff00000
+ } adns_queryflags;
+ 
++/* IPv6 support:
++ *
++ * The _qf_ip4 and _qf_ip6 says which kinds of address records (A and
++ * AAAA) we should ask for. _qf_ip6mapped says how we return ipv6
++ * addresses to the caller. Four modes of operation, corresponding to
++ * the _if_ip* flags:
++ *
++ *     Record type:         A              AAAA
++ *  flags:
++ *
++ *    Default               => AF_INET     => AF_INET6
++ *				        
++ *    _if_ip4only           => AF_INET     not used
++ *				        
++ *    _if_ip6only           not used       => AF_INET6
++ *				        
++ *    _if_ipv6mapped        => AF_INET6    => AF_INET6
++ *				        
++ *    _if_ip4only           => AF_INET6    not used
++ *      | _if_ipv6mapped
++ *
++ * Furthermore, there are configuration options which can prevent the
++ * use of either AAAA or A records for _r_addr; so it is safe to use
++ * _qf_ip6_mapped and _r_addr without checking explicitly whether the host
++ * has IPv6 connectivity.
++ *
++ * The corresponding _qf_ip* flags are constructed from the _if_ip*
++ * flags and the query flags submitted to functions like adns_submit.
++ * If none of _qf_ip4 and _qf_ip6 are set explicitly in the query
++ * flags, the default behaviour is used. If the flags are set, the
++ * default configuration is overridden.
++ *
++ * Applications which do not support IPv4 should set none of these
++ * flags.  Applications which have been `naively' converted to use
++ * AF_INET6 throughout should set adns_if_ip6.  Applications which
++ * know what they are doing should know which flags to set :-).
++ */
++  
+ typedef enum {
+  adns_rrt_typemask=  0x0ffff,
+  adns__qtf_deref=    0x10000,/* dereference domains; perhaps get extra data */
+@@ -127,6 +179,8 @@ typedef enum {
+     *
+     * Don't forget adns_qf_quoteok if that's what you want. */
+ 
++ adns__qtf_special= 0x80000,/* no simple correspondence to a single rr type */
++
+  adns_r_none=             0,
+  		     
+  adns_r_a=                1,
+@@ -151,6 +205,7 @@ typedef enum {
+  		     
+  adns_r_rp_raw=          17,
+  adns_r_rp=                  adns_r_rp_raw|adns__qtf_mail822,
++ adns_r_aaaa=            28,   /* RFC 1886 */
+ 
+  /* For SRV records, query domain without _qf_quoteok_query must look
+   * as expected from SRV RFC with hostname-like Name.  _With_
+@@ -158,7 +213,8 @@ typedef enum {
+  adns_r_srv_raw=         33,
+  adns_r_srv=                 adns_r_srv_raw|adns__qtf_deref,
+ 		     
+- adns_r_addr=                adns_r_a|adns__qtf_deref
++ /* FIXME: Maybe add adns__qtf_deref too? */
++ adns_r_addr=                1 | adns__qtf_special,
+  
+ } adns_rrtype;
+ 
+@@ -284,9 +340,13 @@ typedef enum {
+ 
+ typedef struct {
+   int len;
++#if 0
++  int order; /* Cache index on sortlist? */
++#endif
+   union {
+     struct sockaddr sa;
+     struct sockaddr_in inet;
++    struct sockaddr_in6 inet6;
+   } addr;
+ } adns_rr_addr;
+ 
+@@ -355,6 +415,7 @@ typedef struct {
+     adns_rr_intstr *(*manyistr);     /* txt (list strs ends with i=-1, str=0)*/
+     adns_rr_addr *addr;              /* addr */
+     struct in_addr *inaddr;          /* a */
++    struct in6_addr *in6addr;        /* aaaa */
+     adns_rr_hostaddr *hostaddr;      /* ns */
+     adns_rr_intstrpair *intstrpair;  /* hinfo */
+     adns_rr_strpair *strpair;        /* rp, rp_raw */
+@@ -506,6 +567,13 @@ int adns_init_logfn(adns_state *newstate_r, adns_initflags flags,
+  *   setting of adns_if_check_entex, adns_if_check_freq, or neither,
+  *   in the flags passed to adns_init.
+  * 
++ *  in6only
++ *  in4only
++ *   Return only IPv6, respectively only IPv4 addresses, in
++ *   _rr_addr's.  This may result in an adns_s_nodata error, if the
++ *   application only supports, or the remote host only has, the wrong
++ *   kind of address.
++ * 
+  * There are a number of environment variables which can modify the
+  * behaviour of adns.  They take effect only if adns_init is used, and
+  * the caller of adns_init can disable them using adns_if_noenv.  In
+@@ -589,7 +657,33 @@ int adns_submit_reverse(adns_state ads,
+ 			void *context,
+ 			adns_query *query_r);
+ /* type must be _r_ptr or _r_ptr_raw.  _qf_search is ignored.
+- * addr->sa_family must be AF_INET or you get ENOSYS.
++ * addr->sa_family must be AF_INET or AF_INET6 or you get ENOSYS.
++ */
++
++int adns_getaddrinfo(adns_state ads,
++		     const char *name,           /* Eg, "www.example.coom" */
++		     const char *service,        /* Eg, "http" */
++		     const char *protocol,       /* Eg, "tcp" */
++		     unsigned short defaultport, /* Eg, 80 */
++		     adns_queryflags flags,
++		     adns_answer **answer_r, int *invented_r);
++/* Does an SRV lookup (RFC2052).  If this fails, tries an AAAA or A
++ * lookup instead, and if found uses getservbyname to find the port
++ * number (or failing that, uses defaultport. The defaultport is in
++ * hot byte order).  In the `fallback' case, will invent an SRV record
++ * which have priority and weight == 0 and set *invented_r to 1; if
++ * real SRV records were found, will set *invented_r to 0.  invented_r
++ * may be null but answer_r may not be.  If _getaddrinfo returns
++ * nonzero, *answer_r and/or *invented_r may or may not have been
++ * overwritten and should not be used.
++ *
++ * NB, like adns_synchronous, can fail either by returning an errno
++ * value, or by returning an adns_answer with ->nrrs==0 and
++ * ->status!=0.
++ *
++ * You have to write two loops when using the returned value, an outer
++ * one to loop over the returned SRV's, and an inner one to loop over
++ * the addresses for each one.
+  */
+ 
+ int adns_submit_reverse_any(adns_state ads,
+@@ -602,7 +696,7 @@ int adns_submit_reverse_any(adns_state ads,
+ /* For RBL-style reverse `zone's; look up
+  *   <reversed-address>.<zone>
+  * Any type is allowed.  _qf_search is ignored.
+- * addr->sa_family must be AF_INET or you get ENOSYS.
++ * addr->sa_family must be AF_INET or AF_INET6 or you get ENOSYS.
+  */
+ 
+ void adns_finish(adns_state ads);
+@@ -830,7 +924,7 @@ int adns_beforepoll(adns_state ads, struct pollfd *fds,
+  * In any case this call won't block.
+  */
+ 
+-#define ADNS_POLLFDS_RECOMMENDED 2
++#define ADNS_POLLFDS_RECOMMENDED 3
+ /* If you allocate an fds buf with at least RECOMMENDED entries then
+  * you are unlikely to need to enlarge it.  You are recommended to do
+  * so if it's convenient.  However, you must be prepared for adns to
+diff --git a/src/check.c b/src/check.c
+index 41cdde5..704a15e 100644
+--- a/src/check.c
++++ b/src/check.c
+@@ -4,6 +4,7 @@
+  */
+ /*
+  *  This file is part of adns, which is
++ *    Copyright (C) 2009 Luca Bruno
+  *    Copyright (C) 1997-2000,2003,2006  Ian Jackson
+  *    Copyright (C) 1999-2000,2003,2006  Tony Finch
+  *    Copyright (C) 1991 Massachusetts Institute of Technology
+@@ -24,6 +25,8 @@
+  *  Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA. 
+  */
+ 
++#include <stdlib.h>
++
+ #include "internal.h"
+ 
+ void adns_checkconsistency(adns_state ads, adns_query qu) {
+@@ -77,11 +80,11 @@ static void checkc_notcpbuf(adns_state ads) {
+ static void checkc_global(adns_state ads) {
+   int i;
+   
+-  assert(ads->udpsocket >= 0);
+-
++  assert((ads->udpsocket >= 0) || (ads->udpsocket6 >= 0));
++#if 0
+   for (i=0; i<ads->nsortlist; i++)
+     assert(!(ads->sortlist[i].base.s_addr & ~ads->sortlist[i].mask.s_addr));
+-
++#endif
+   assert(ads->tcpserver >= 0 && ads->tcpserver < ads->nservers);
+   
+   switch (ads->tcpstate) {
+diff --git a/src/event.c b/src/event.c
+index ad5861e..3fb95a1 100644
+--- a/src/event.c
++++ b/src/event.c
+@@ -6,6 +6,7 @@
+  */
+ /*
+  *  This file is part of adns, which is
++ *    Copyright (C) 2009 Luca Bruno
+  *    Copyright (C) 1997-2000,2003,2006  Ian Jackson
+  *    Copyright (C) 1999-2000,2003,2006  Tony Finch
+  *    Copyright (C) 1991 Massachusetts Institute of Technology
+@@ -100,6 +101,7 @@ static void tcp_broken_events(adns_state ads) {
+ void adns__tcp_tryconnect(adns_state ads, struct timeval now) {
+   int r, fd, tries;
+   struct sockaddr_in addr;
++  struct sockaddr_in6 addr6;
+   struct protoent *proto;
+ 
+   for (tries=0; tries<ads->nservers; tries++) {
+@@ -123,7 +125,7 @@ void adns__tcp_tryconnect(adns_state ads, struct timeval now) {
+       adns__diag(ads,-1,0,"unable to find protocol no. for TCP !");
+       return;
+     }
+-    fd= socket(AF_INET,SOCK_STREAM,proto->p_proto);
++    fd= socket(ads->servers[ads->tcpserver].sin_family,SOCK_STREAM,proto->p_proto);
+     if (fd<0) {
+       adns__diag(ads,-1,0,"cannot create TCP socket: %s",strerror(errno));
+       return;
+@@ -135,11 +137,19 @@ void adns__tcp_tryconnect(adns_state ads, struct timeval now) {
+       close(fd);
+       return;
+     }
+-    memset(&addr,0,sizeof(addr));
+-    addr.sin_family= AF_INET;
+-    addr.sin_port= htons(DNS_PORT);
+-    addr.sin_addr= ads->servers[ads->tcpserver].addr;
+-    r= connect(fd,(const struct sockaddr*)&addr,sizeof(addr));
++    if(ads->servers[ads->tcpserver].sin_family==AF_INET) {
++      memset(&addr,0,sizeof(addr));
++      addr.sin_family= AF_INET;
++      addr.sin_port= htons(DNS_PORT);
++      addr.sin_addr= ads->servers[ads->tcpserver].addr;
++      r= connect(fd,(const struct sockaddr*)&addr,sizeof(addr));
++    } else {
++      memset(&addr6,0,sizeof(addr6));
++      addr6.sin6_family= AF_INET6;
++      addr6.sin6_port= htons(DNS_PORT);
++      addr6.sin6_addr= ads->servers[ads->tcpserver].addr6;
++      r= connect(fd,(const struct sockaddr*)&addr6,sizeof(addr6));
++    }
+     ads->tcpsocket= fd;
+     ads->tcpstate= server_connecting;
+     if (r==0) { tcp_connected(ads,now); return; }
+@@ -311,34 +321,41 @@ void adns_processtimeouts(adns_state ads, const struct timeval *now) {
+ int adns__pollfds(adns_state ads, struct pollfd pollfds_buf[MAX_POLLFDS]) {
+   /* Returns the number of entries filled in.  Always zeroes revents. */
+ 
+-  assert(MAX_POLLFDS==2);
+-
+-  pollfds_buf[0].fd= ads->udpsocket;
+-  pollfds_buf[0].events= POLLIN;
+-  pollfds_buf[0].revents= 0;
++  assert(MAX_POLLFDS==3);
++  if (ads->udpsocket >= 0) {
++    pollfds_buf[0].fd= ads->udpsocket;
++    pollfds_buf[0].events= POLLIN;
++    pollfds_buf[0].revents= 0;
++  }
++  if(ads->udpsocket6 >= 0) {
++    pollfds_buf[1].fd= ads->udpsocket6;
++    pollfds_buf[1].events= POLLIN;
++    pollfds_buf[1].revents= 0;
++  }
+ 
+   switch (ads->tcpstate) {
+   case server_disconnected:
+   case server_broken:
+-    return 1;
++    return 2;
+   case server_connecting:
+-    pollfds_buf[1].events= POLLOUT;
++    pollfds_buf[2].events= POLLOUT;
+     break;
+   case server_ok:
+-    pollfds_buf[1].events=
++    pollfds_buf[2].events=
+       ads->tcpsend.used ? POLLIN|POLLOUT|POLLPRI : POLLIN|POLLPRI;
+     break;
+   default:
+     abort();
+   }
+-  pollfds_buf[1].fd= ads->tcpsocket;
+-  return 2;
++  pollfds_buf[2].fd= ads->tcpsocket;
++  return 3;
+ }
+ 
+ int adns_processreadable(adns_state ads, int fd, const struct timeval *now) {
+   int want, dgramlen, r, udpaddrlen, serv, old_skip;
+   byte udpbuf[DNS_MAXUDP];
+   struct sockaddr_in udpaddr;
++  struct sockaddr_in6 udpaddr6;
+   
+   adns__consistency(ads,0,cc_entex);
+ 
+@@ -431,6 +448,48 @@ int adns_processreadable(adns_state ads, int fd, const struct timeval *now) {
+       adns__procdgram(ads,udpbuf,r,serv,0,*now);
+     }
+   }
++  else if (fd == ads->udpsocket6) {
++    for (;;) {
++      udpaddrlen= sizeof(udpaddr6);
++      r= recvfrom(ads->udpsocket6,udpbuf,sizeof(udpbuf),0,
++                  (struct sockaddr*)&udpaddr6,&udpaddrlen);
++      if (r<0) {
++        if (errno == EAGAIN || errno == EWOULDBLOCK) { r= 0; goto xit; }
++        if (errno == EINTR) continue;
++        if (errno_resources(errno)) { r= errno; goto xit; }
++        adns__warn(ads,-1,0,"datagram receive error: %s",strerror(errno));
++        r= 0; goto xit;
++      }
++      if (udpaddrlen != sizeof(udpaddr6)) {
++        adns__diag(ads,-1,0,"datagram received with wrong address length %d"
++                   " (expected %lu)", udpaddrlen,
++                   (unsigned long)sizeof(udpaddr6));
++        continue;
++      }
++      if (udpaddr6.sin6_family != AF_INET6) {
++        adns__diag(ads,-1,0,"datagram received with wrong protocol family"
++                   " %u (expected %u)",udpaddr6.sin6_family,AF_INET6);
++        continue;
++      }
++      if (ntohs(udpaddr6.sin6_port) != DNS_PORT) {
++        adns__diag(ads,-1,0,"datagram received from wrong port"
++                   " %u (expected %u)", ntohs(udpaddr6.sin6_port),DNS_PORT);
++        continue;
++      }
++      for (serv= 0;
++	   serv < ads->nservers &&
++	    (memcmp(&(ads->servers[serv].addr6.s6_addr), &(udpaddr6.sin6_addr.s6_addr), sizeof(struct in6_addr)));
++           serv++);
++      if (serv >= ads->nservers) {
++	char buf_dst[INET6_ADDRSTRLEN];
++        adns__warn(ads,-1,0,"datagram received from unknown nameserver %s",
++                   inet_ntop(AF_INET6, &(udpaddr6.sin6_addr), buf_dst, INET6_ADDRSTRLEN*sizeof(char)));
++        continue;
++      }
++      adns__procdgram(ads,udpbuf,r,serv,0,*now);
++    }
++  }
++
+   r= 0;
+ xit:
+   adns__consistency(ads,0,cc_entex);
+diff --git a/src/internal.h b/src/internal.h
+index 58cd15d..e4e56c9 100644
+--- a/src/internal.h
++++ b/src/internal.h
+@@ -129,6 +129,16 @@ typedef struct typeinfo {
+    * and will not be null-terminated by convstring.
+    */
+ 
++  void (*submithook)(adns_query qu,
++		     /* FIXME: Do we need to pass flags? Isn't qu->flags enough? */
++		     adns_queryflags flags,
++		     struct timeval now);
++  /* If NULL, submitting a query means to format it and send it over
++   * the wire. If non-NULL, the labels are written to qu->vb, and then
++   * this function is called. It's the hook's responsibility to submit
++   * the query, or submit some other queries and put the original on
++   * the child queue. */
++
+   adns_status (*parse)(const parseinfo *pai, int cbyte,
+ 		       int max, void *store_r);
+   /* Parse one RR, in dgram of length dglen, starting at cbyte and
+@@ -176,6 +186,8 @@ adns_status adns__qdpl_normal(adns_state ads,
+ 
+ typedef struct allocnode {
+   struct allocnode *next, *back;
++  size_t size;
++  /* Needed for realloc */
+ } allocnode;
+ 
+ union maxalign {
+@@ -191,11 +203,16 @@ typedef struct {
+   void *ext;
+   void (*callback)(adns_query parent, adns_query child);
+   union {
+-    adns_rr_addr ptr_parent_addr;
+     adns_rr_hostaddr *hostaddr;
+   } info;
+ } qcontext;
+ 
++typedef struct {
++  union {
++    adns_rr_addr ptr_addr;
++  } info;
++} qextra;
++
+ struct adns__query {
+   adns_state ads;
+   enum { query_tosend, query_tcpw, query_childw, query_done } state;
+@@ -242,13 +259,19 @@ struct adns__query {
+    * the vbuf is initialised but empty and everything else is zero.
+    */
+ 
+-  int id, flags, retries;
++  int id;
++  /* -2 at allocation, -1 when done, >= 0 while the query is pending. */
++  
++  int flags, retries;
+   int udpnextserver;
+   unsigned long udpsent; /* bitmap indexed by server */
+   struct timeval timeout;
+   time_t expires; /* Earliest expiry time of any record we used. */
+ 
+   qcontext ctx;
++  /* Information related to the parent of the query */
++  qextra extra;
++  /* Extra information about this query. */
+ 
+   /* Possible states:
+    *
+@@ -270,34 +293,34 @@ struct adns__query {
+    *
+    *			      +------------------------+
+    *             START -----> |      tosend/NONE       |
+-   *			      +------------------------+
+-   *                         /                       |\  \
+-   *        too big for UDP /             UDP timeout  \  \ send via UDP
+-   *        send via TCP   /              more retries  \  \
+-   *        when conn'd   /                  desired     \  \
+-   *                     |     	       	       	       	  |  |
+-   *                     v				  |  v
+-   *              +-----------+         	    	+-------------+
+-   *              | tcpw/tcpw | ________                | tosend/udpw |
+-   *              +-----------+         \	    	+-------------+
+-   *                 |    |              |     UDP timeout | |
+-   *                 |    |              |      no more    | |
+-   *                 |    |              |      retries    | |
+-   *                  \   | TCP died     |      desired    | |
+-   *                   \   \ no more     |                 | |
+-   *                    \   \ servers    | TCP            /  |
+-   *                     \   \ to try    | timeout       /   |
+-   *                  got \   \          v             |_    | got
+-   *                 reply \   _| +------------------+      / reply
+-   *   	       	       	    \  	  | done/output FAIL |     /
+-   *                         \    +------------------+    /
+-   *                          \                          /
+-   *                           _|                      |_
+-   *                             (..... got reply ....)
+-   *                              /                   \
++   *                     _____+------------------------+
++   *  consists of  __-----           /                |\  \
++   *  child-     /                 /      UDP timeout  \  \ send via UDP
++   *  queries   /  too big for UDP/       more retries  \  \
++   *  only     /   send via TCP  /           desired     \  \
++   *          /    when conn'd  /                         |  |
++   *         /                |_                          |  v
++   *        |     +-----------+                         +-------------+
++   *        |     | tcpw/tcpw | ________                | tosend/udpw |
++   *        |     +-----------+         \               +-------------+
++   *        |        |    |              |     UDP timeout | |
++   *        |        |    |              |      no more    | |
++   *        |        |    |              |      retries    | |
++   *        |         \   | TCP died     |      desired    | |
++   *        |          \   \ no more     |                 | |
++   *        |           \   \ servers    | TCP            /  |
++   *        |            \   \ to try    | timeout       /   |
++   *        |         got \   \          v             |_    | got
++   *        |        reply \   _| +------------------+      / reply
++   *         \              \     | done/output FAIL |     /
++   *          \              \    +------------------+    /
++   *           \              \                          /
++   *            \              _|                      |_
++   *             \               (..... got reply ....)
++   *              \               /                   \
+    *        need child query/ies /                     \ no child query
+-   *                            /                       \
+-   *                          |_                         _|
++   *                \           /                       \
++   *                 _|       |_                         _|
+    *		   +---------------+		       +----------------+
+    *               | childw/childw | ----------------> | done/output OK |
+    *               +---------------+  children done    +----------------+
+@@ -313,7 +336,7 @@ struct adns__state {
+   int configerrno;
+   struct query_queue udpw, tcpw, childw, output;
+   adns_query forallnext;
+-  int nextid, udpsocket, tcpsocket;
++  int nextid, udpsocket, udpsocket6, tcpsocket;
+   vbuf tcpsend, tcprecv;
+   int nservers, nsortlist, nsearchlist, searchndots, tcpserver, tcprecv_skip;
+   enum adns__tcpstate {
+@@ -330,10 +353,17 @@ struct adns__state {
+   sigset_t stdsigmask;
+   struct pollfd pollfds_buf[MAX_POLLFDS];
+   struct server {
++    sa_family_t sin_family;
+     struct in_addr addr;
++    struct in6_addr addr6;
+   } servers[MAXSERVERS];
+   struct sortlist {
+-    struct in_addr base, mask;
++    sa_family_t family;
++    unsigned prefix;
++    union {
++      struct in_addr inet;
++      struct in6_addr inet6;
++    } base;
+   } sortlist[MAXSORTLIST];
+   char **searchlist;
+   unsigned short rand48xsubi[3];
+@@ -401,6 +431,15 @@ void adns__sigpipe_unprotect(adns_state);
+ 
+ /* From transmit.c: */
+ 
++adns_status adns__mkquery_labels(adns_state ads, vbuf *vb,
++				 const char *owner, int ol,
++				 const typeinfo *typei, adns_queryflags flags);
++/* Assembles the owner part of a query packet in vb. */
++
++adns_status adns__mkquery_labels_frdgram(adns_state ads, vbuf *vb,
++					 const byte *qd_dgram, int qd_dglen,
++					 int qd_begin);
++
+ adns_status adns__mkquery(adns_state ads, vbuf *vb, int *id_r,
+ 			  const char *owner, int ol,
+ 			  const typeinfo *typei, adns_rrtype type,
+@@ -408,6 +447,11 @@ adns_status adns__mkquery(adns_state ads, vbuf *vb, int *id_r,
+ /* Assembles a query packet in vb.  A new id is allocated and returned.
+  */
+ 
++adns_status adns__mkquery_frlabels(adns_state ads, vbuf *vb, int *id_r,
++				   char *l, int llen,
++				   adns_rrtype type, adns_queryflags flags);
++/* Same as adns__mkquery, but with the labels preformatted. */
++
+ adns_status adns__mkquery_frdgram(adns_state ads, vbuf *vb, int *id_r,
+ 				  const byte *qd_dgram, int qd_dglen,
+ 				  int qd_begin,
+@@ -447,6 +491,9 @@ adns_status adns__internal_submit(adns_state ads, adns_query *query_r,
+  * the memory for it is _taken over_ by this routine whether it
+  * succeeds or fails (if it succeeds, the vbuf is reused for qu->vb).
+  *
++ * For query types with a submithook (i.e. adns_r_addr),
++ * vbuf should contain just the label, not a complete query.
++ *
+  * *ctx is copied byte-for-byte into the query.
+  *
+  * When the child query is done, ctx->callback will be called.  The
+@@ -474,6 +521,7 @@ void adns__search_next(adns_state ads, adns_query qu, struct timeval now);
+  */
+ 
+ void *adns__alloc_interim(adns_query qu, size_t sz);
++void *adns__realloc_interim(adns_query qu, void *p, size_t sz);
+ void *adns__alloc_preserved(adns_query qu, size_t sz);
+ /* Allocates some memory, and records which query it came from
+  * and how much there was.
+diff --git a/src/query.c b/src/query.c
+index d09702e..2894e4d 100644
+--- a/src/query.c
++++ b/src/query.c
+@@ -36,6 +36,10 @@
+ 
+ #include "internal.h"
+ 
++#if DMALLOC
++# include <dmalloc.h>
++#endif
++
+ static adns_query query_alloc(adns_state ads,
+ 			      const typeinfo *typei, adns_rrtype type,
+ 			      adns_queryflags flags, struct timeval now) {
+@@ -76,6 +80,7 @@ static adns_query query_alloc(adns_state ads,
+   qu->expires= now.tv_sec + MAXTTLBELIEVE;
+ 
+   memset(&qu->ctx,0,sizeof(qu->ctx));
++  memset(&qu->extra,0,sizeof(qu->extra));
+ 
+   qu->answer->status= adns_s_ok;
+   qu->answer->cname= qu->answer->owner= 0;
+@@ -88,6 +93,20 @@ static adns_query query_alloc(adns_state ads,
+   return qu;
+ }
+ 
++static adns_queryflags default_ip6_flags(adns_state ads)
++{
++  adns_queryflags flags = 0;
++
++  if (!(ads->iflags & adns_if_ip4only))
++    flags |= adns_qf_ip4;
++  if (!(ads->iflags & adns_if_ip6only))
++    flags |= adns_qf_ip6;
++  if (ads->iflags & adns_if_ip6mapped)
++    flags |= adns_qf_ip6mapped;
++
++  return flags;
++}
++
+ static void query_submit(adns_state ads, adns_query qu,
+ 			 const typeinfo *typei, vbuf *qumsg_vb, int id,
+ 			 adns_queryflags flags, struct timeval now) {
+@@ -108,6 +127,7 @@ static void query_submit(adns_state ads, adns_query qu,
+   adns__query_send(qu,now);
+ }
+ 
++/* FIXME: Take a adns_rrtype type artument? */
+ adns_status adns__internal_submit(adns_state ads, adns_query *query_r,
+ 				  const typeinfo *typei, vbuf *qumsg_vb,
+ 				  int id,
+@@ -115,12 +135,26 @@ adns_status adns__internal_submit(adns_state ads, adns_query *query_r,
+ 				  const qcontext *ctx) {
+   adns_query qu;
+ 
++  if (!(flags & adns__qf_ip_mask))
++    flags |= default_ip6_flags(ads);
++  
+   qu= query_alloc(ads,typei,typei->typekey,flags,now);
+   if (!qu) { adns__vbuf_free(qumsg_vb); return adns_s_nomemory; }
+   *query_r= qu;
+ 
+   memcpy(&qu->ctx,ctx,sizeof(qu->ctx));
+-  query_submit(ads,qu, typei,qumsg_vb,id,flags,now);
++
++  if (typei->submithook) {
++    qu->vb = *qumsg_vb;
++    adns__vbuf_init(qumsg_vb);
++
++    typei->submithook(qu, flags, now); 
++    if (qu->children.head) {
++      qu->state= query_childw;
++      LIST_LINK_TAIL(ads->childw,qu);
++    }
++  }
++  else query_submit(ads,qu, typei,qumsg_vb,id,flags,now);
+   
+   return adns_s_ok;
+ }
+@@ -133,21 +167,32 @@ static void query_simple(adns_state ads, adns_query qu,
+   int id;
+   adns_status stat;
+ 
+-  stat= adns__mkquery(ads,&qu->vb,&id, owner,ol,
+-		      typei,qu->answer->type, flags);
+-  if (stat) {
+-    if (stat == adns_s_querydomaintoolong && (flags & adns_qf_search)) {
+-      adns__search_next(ads,qu,now);
+-      return;
+-    } else {
+-      adns__query_fail(qu,stat);
+-      return;
++  if (typei->submithook) {
++    stat= adns__mkquery_labels(ads, &qu->vb, owner, ol, typei, flags);
++    if (stat) goto fail;
++
++    typei->submithook(qu, flags, now); 
++    if (qu->children.head) {
++      qu->state= query_childw;
++      LIST_LINK_TAIL(ads->childw,qu);
+     }
++    return;
+   }
++  else {
++    stat= adns__mkquery(ads,&qu->vb,&id, owner,ol,
++			typei,qu->answer->type,flags);
++    if (stat) goto fail;
+ 
+   vb_new= qu->vb;
+   adns__vbuf_init(&qu->vb);
+   query_submit(ads,qu, typei,&vb_new,id, flags,now);
++    return;
++  }
++ fail:
++  if (stat == adns_s_querydomaintoolong && (flags & adns_qf_search)) 
++    adns__search_next(ads,qu,now);
++  else
++    adns__query_fail(qu,stat);
+ }
+ 
+ void adns__search_next(adns_state ads, adns_query qu, struct timeval now) {
+@@ -222,6 +267,9 @@ int adns_submit(adns_state ads,
+ 
+   adns__consistency(ads,0,cc_entex);
+ 
++  if (!(flags & adns__qf_ip_mask))
++    flags |= default_ip6_flags(ads);
++
+   typei= adns__findtype(type);
+   if (!typei) return ENOSYS;
+ 
+@@ -288,13 +336,13 @@ int adns_submit_reverse_any(adns_state ads,
+ 
+   flags &= ~adns_qf_search;
+ 
+-  if (addr->sa_family != AF_INET) return ENOSYS;
+-  iaddr= (const unsigned char*)
+-    &(((const struct sockaddr_in*)addr) -> sin_addr);
+-
++  switch (addr->sa_family) {
++  default: return ENOSYS;
++  case AF_INET: 
++    iaddr= (const unsigned char*) &((const struct sockaddr_in*)addr)->sin_addr;      
+   lreq= strlen(zone) + 4*4 + 1;
+   if (lreq > sizeof(shortbuf)) {
+-    buf= malloc(strlen(zone) + 4*4 + 1);
++      buf= malloc(lreq);
+     if (!buf) return errno;
+     buf_free= buf;
+   } else {
+@@ -302,7 +350,32 @@ int adns_submit_reverse_any(adns_state ads,
+     buf_free= 0;
+   }
+   sprintf(buf, "%d.%d.%d.%d.%s", iaddr[3], iaddr[2], iaddr[1], iaddr[0], zone);
+-
++    break;
++  case AF_INET6:
++    iaddr= (const unsigned char*) &((const struct sockaddr_in6*)addr)->sin6_addr;      
++    lreq = strlen(zone) + 2*32 + 1;
++    if (lreq > sizeof(shortbuf)) {
++      buf= malloc(lreq);
++      if (!buf) return errno;
++      buf_free= buf;
++    }
++    else {
++      buf= shortbuf;
++      buf_free= 0;
++    }
++    strcpy(buf + 2*32, zone);
++    {
++      int i;
++      const unsigned char *p;
++      static const unsigned char hex[16] = "0123456789abcdef";
++      for (i = 0, p = iaddr + 15; i < 2*32; p--) {
++	buf[i++] = hex[*p & 0xf];
++	buf[i++] = '.';
++	buf[i++] = hex[*p / 0x10];
++	buf[i++] = '.';
++      }
++    }
++  }
+   r= adns_submit(ads,buf,type,flags,context,query_r);
+   free(buf_free);
+   return r;
+@@ -314,9 +387,34 @@ int adns_submit_reverse(adns_state ads,
+ 			adns_queryflags flags,
+ 			void *context,
+ 			adns_query *query_r) {
++  int r;
++  /* Address record used for forward lookup and consistency check */
++  adns_rr_addr rr;
++  const char *zone;
++  
+   if (type != adns_r_ptr && type != adns_r_ptr_raw) return EINVAL;
+-  return adns_submit_reverse_any(ads,addr,"in-addr.arpa",
++  memset(&rr, 0, sizeof(rr));
++  rr.addr.sa.sa_family = addr->sa_family;
++  
++  switch (addr->sa_family) {
++  default: return ENOSYS;
++  case AF_INET:
++    zone = "in-addr.arpa";
++    rr.len = sizeof(rr.addr.inet);
++    rr.addr.inet.sin_addr = ((const struct sockaddr_in *)addr)->sin_addr;
++    break;
++  case AF_INET6:
++    zone = "ip6.arpa";
++    rr.len = sizeof(rr.addr.inet6);
++    rr.addr.inet6.sin6_addr = ((const struct sockaddr_in6 *)addr)->sin6_addr;
++    break;
++  }
++  
++  r= adns_submit_reverse_any(ads,addr,zone,
+ 				 type,flags,context,query_r);
++  if (r) return r;
++  (*query_r)->extra.info.ptr_addr = rr;
++  return 0;
+ }
+ 
+ int adns_synchronous(adns_state ads,
+@@ -344,9 +442,36 @@ static void *alloc_common(adns_query qu, size_t sz) {
+   an= malloc(MEM_ROUND(MEM_ROUND(sizeof(*an)) + sz));
+   if (!an) return 0;
+   LIST_LINK_TAIL(qu->allocations,an);
++  an->size = sz;
+   return (byte*)an + MEM_ROUND(sizeof(*an));
+ }
+ 
++void *adns__realloc_interim(adns_query qu, void *p, size_t sz) {
++  allocnode *an; 
++  allocnode *nan;
++
++  sz = MEM_ROUND(sz);
++  assert(sz); /* Freeing via realloc not supported */
++  assert(!qu->final_allocspace);
++
++  an = (allocnode *) ((byte *) p - MEM_ROUND(sizeof(*an)));
++  assert(an->size <= qu->interim_allocd);
++
++  nan = realloc(an, MEM_ROUND(MEM_ROUND(sizeof(*an)) + sz));
++  if (!nan) return 0;
++
++  qu->interim_allocd -= nan->size;
++  qu->interim_allocd += sz;
++  nan->size = sz;
++  
++  if (nan->next) nan->next->back = nan;
++  else qu->allocations.tail = nan;
++  if (nan->back) nan->back->next = nan;
++  else qu->allocations.head = nan;
++  
++  return (byte*)nan + MEM_ROUND(sizeof(*nan));
++}
++
+ void *adns__alloc_interim(adns_query qu, size_t sz) {
+   void *rv;
+   
+diff --git a/src/setup.c b/src/setup.c
+index 44c3cee..07b1f13 100644
+--- a/src/setup.c
++++ b/src/setup.c
+@@ -5,6 +5,7 @@
+  */
+ /*
+  *  This file is part of adns, which is
++ *    Copyright (C) 2009 Luca Bruno
+  *    Copyright (C) 1997-2000,2003,2006  Ian Jackson
+  *    Copyright (C) 1999-2000,2003,2006  Tony Finch
+  *    Copyright (C) 1991 Massachusetts Institute of Technology
+@@ -41,12 +42,12 @@
+ 
+ static void readconfig(adns_state ads, const char *filename, int warnmissing);
+ 
+-static void addserver(adns_state ads, struct in_addr addr) {
++static void addserverv4(adns_state ads, struct in_addr addr) {
+   int i;
+   struct server *ss;
+   
+   for (i=0; i<ads->nservers; i++) {
+-    if (ads->servers[i].addr.s_addr == addr.s_addr) {
++    if ((ads->servers[i].sin_family == AF_INET) && (ads->servers[i].addr.s_addr == addr.s_addr)) {
+       adns__debug(ads,-1,0,"duplicate nameserver %s ignored",inet_ntoa(addr));
+       return;
+     }
+@@ -58,10 +59,35 @@ static void addserver(adns_state ads, struct in_addr addr) {
+   }
+ 
+   ss= ads->servers+ads->nservers;
++  ss->sin_family= AF_INET;
+   ss->addr= addr;
+   ads->nservers++;
+ }
+ 
++static void addserverv6(adns_state ads, struct in6_addr addr) {
++  int i;
++  struct server *ss;
++  char buf[INET6_ADDRSTRLEN];
++
++  for (i=0; i<ads->nservers; i++) {
++    if ((ads->servers[i].sin_family == AF_INET6) && !(memcmp(&(ads->servers[i].addr6.s6_addr), &(addr.s6_addr), sizeof(struct in6_addr)))) {
++      adns__debug(ads,-1,0,"duplicate nameserver %s ignored", inet_ntop(AF_INET6, &addr, buf, INET6_ADDRSTRLEN*sizeof(char)));
++      return;
++    }
++  }
++
++  if (ads->nservers>=MAXSERVERS) {
++    adns__diag(ads,-1,0,"too many nameservers, ignoring %s", inet_ntop(AF_INET6, &addr, buf, INET6_ADDRSTRLEN*sizeof(char)));
++    return;
++  }
++
++  ss= ads->servers+ads->nservers;
++  ss->sin_family= AF_INET6;
++  ss->addr6= addr;
++  ads->nservers++;
++}
++
++
+ static void freesearchlist(adns_state ads) {
+   if (ads->nsearchlist) free(*ads->searchlist);
+   free(ads->searchlist);
+@@ -105,16 +131,28 @@ static int nextword(const char **bufp_io, const char **word_r, int *l_r) {
+ 
+ static void ccf_nameserver(adns_state ads, const char *fn,
+ 			   int lno, const char *buf) {
+-  struct in_addr ia;
+-  
+-  if (!inet_aton(buf,&ia)) {
+-    configparseerr(ads,fn,lno,"invalid nameserver address `%s'",buf);
+-    return;
++  struct in_addr ia4;
++  struct in6_addr ia6;
++  char ns_name[INET6_ADDRSTRLEN];
++
++  if (!inet_aton(buf,&ia4)) {
++    if (!inet_pton(AF_INET6, buf,&ia6)) {
++	configparseerr(ads,fn,lno,"invalid nameserver address `%s'",buf);
++	return;
++    }
++    else {
++	adns__debug(ads,-1,0,"using nameserver %s", inet_ntop(AF_INET6, &ia6, ns_name, INET6_ADDRSTRLEN*sizeof(char)));
++	addserverv6(ads,ia6);
++	
++    }
++  }
++  else {
++    adns__debug(ads,-1,0,"using nameserver %s",inet_ntoa(ia4));
++    addserverv4(ads,ia4);
+   }
+-  adns__debug(ads,-1,0,"using nameserver %s",inet_ntoa(ia));
+-  addserver(ads,ia);
+ }
+ 
++
+ static void ccf_search(adns_state ads, const char *fn,
+ 		       int lno, const char *buf) {
+   const char *bufp, *word;
+@@ -150,6 +188,7 @@ static void ccf_search(adns_state ads, const char *fn,
+ 
+ static void ccf_sortlist(adns_state ads, const char *fn,
+ 			 int lno, const char *buf) {
++  /* FIXME: Handle IPv6 addresses */
+   const char *word;
+   char tbuf[200], *slash, *ep;
+   struct in_addr base, mask;
+@@ -191,6 +230,21 @@ static void ccf_sortlist(adns_state ads, const char *fn,
+ 			 " overlaps address `%s'",slash,tbuf);
+ 	  continue;
+ 	}
++	{
++	  /* Convert bitmask to prefix length */
++	  unsigned long bits;
++
++	  for(bits=ntohl(mask.s_addr), initial = 0;
++	      bits & 0x80000000UL;
++	      bits <<= 1)
++	    initial++;
++
++	  if (bits & 0xffffffff) {
++	    configparseerr(ads,fn,lno,
++			   "mask `%s' in sortlist is non-continuous",slash);
++	    continue;
++	  }
++	}
+       } else {
+ 	initial= strtoul(slash,&ep,10);
+ 	if (*ep || initial>32) {
+@@ -202,11 +256,11 @@ static void ccf_sortlist(adns_state ads, const char *fn,
+     } else {
+       baselocal= ntohl(base.s_addr);
+       if (!baselocal & 0x080000000UL) /* class A */
+-	mask.s_addr= htonl(0x0ff000000UL);
++	initial = 8;
+       else if ((baselocal & 0x0c0000000UL) == 0x080000000UL)
+-	mask.s_addr= htonl(0x0ffff0000UL); /* class B */
++	initial= 16;                  /* class B */
+       else if ((baselocal & 0x0f0000000UL) == 0x0e0000000UL)
+-	mask.s_addr= htonl(0x0ff000000UL); /* class C */
++	initial= 24;                  /* class C */
+       else {
+ 	configparseerr(ads,fn,lno, "network address `%s'"
+ 		       " in sortlist is not in classed ranges,"
+@@ -215,8 +269,10 @@ static void ccf_sortlist(adns_state ads, const char *fn,
+       }
+     }
+ 
+-    ads->sortlist[ads->nsortlist].base= base;
+-    ads->sortlist[ads->nsortlist].mask= mask;
++    ads->sortlist[ads->nsortlist].family= AF_INET;
++    ads->sortlist[ads->nsortlist].base.inet= base;
++    ads->sortlist[ads->nsortlist].prefix= initial;
++
+     ads->nsortlist++;
+   }
+ }
+@@ -522,7 +578,7 @@ static int init_begin(adns_state *ads_r, adns_initflags flags,
+   LIST_INIT(ads->output);
+   ads->forallnext= 0;
+   ads->nextid= 0x311f;
+-  ads->udpsocket= ads->tcpsocket= -1;
++  ads->udpsocket= ads->udpsocket6= ads->tcpsocket= -1;
+   adns__vbuf_init(&ads->tcpsend);
+   adns__vbuf_init(&ads->tcprecv);
+   ads->tcprecv_skip= 0;
+@@ -550,16 +606,22 @@ static int init_finish(adns_state ads) {
+     if (ads->logfn && ads->iflags & adns_if_debug)
+       adns__lprintf(ads,"adns: no nameservers, using localhost\n");
+     ia.s_addr= htonl(INADDR_LOOPBACK);
+-    addserver(ads,ia);
++    addserverv4(ads,ia);
+   }
+ 
+   proto= getprotobyname("udp"); if (!proto) { r= ENOPROTOOPT; goto x_free; }
+   ads->udpsocket= socket(AF_INET,SOCK_DGRAM,proto->p_proto);
+   if (ads->udpsocket<0) { r= errno; goto x_free; }
+ 
++  ads->udpsocket6= socket(AF_INET6,SOCK_DGRAM,proto->p_proto);
++  if (ads->udpsocket6<0) { r= errno; goto x_free6; }
++
+   r= adns__setnonblock(ads,ads->udpsocket);
+   if (r) { r= errno; goto x_closeudp; }
+   
++  r= adns__setnonblock(ads,ads->udpsocket6);
++  if (r) { r= errno; goto x_closeudp6; }
++  
+   return 0;
+ 
+  x_closeudp:
+@@ -567,6 +629,12 @@ static int init_finish(adns_state ads) {
+  x_free:
+   free(ads);
+   return r;
++ 
++ x_closeudp6:
++  close(ads->udpsocket6);
++ x_free6:
++  free(ads);
++  return r;
+ }
+ 
+ static void init_abort(adns_state ads) {
+@@ -678,7 +746,10 @@ void adns_finish(adns_state ads) {
+     else if (ads->output.head) adns_cancel(ads->output.head);
+     else break;
+   }
+-  close(ads->udpsocket);
++  if (ads->udpsocket >= 0)
++    close(ads->udpsocket);
++  if (ads->udpsocket6 >= 0)
++    close(ads->udpsocket6);
+   if (ads->tcpsocket >= 0) close(ads->tcpsocket);
+   adns__vbuf_free(&ads->tcpsend);
+   adns__vbuf_free(&ads->tcprecv);
+diff --git a/src/transmit.c b/src/transmit.c
+index 7afb90f..fb733fc 100644
+--- a/src/transmit.c
++++ b/src/transmit.c
+@@ -5,6 +5,7 @@
+  */
+ /*
+  *  This file is part of adns, which is
++ *    Copyright (C) 2009 Luca Bruno
+  *    Copyright (C) 1997-2000,2003,2006  Ian Jackson
+  *    Copyright (C) 1999-2000,2003,2006  Tony Finch
+  *    Copyright (C) 1991 Massachusetts Institute of Technology
+@@ -62,6 +63,8 @@ static adns_status mkquery_header(adns_state ads, vbuf *vb,
+   return adns_s_ok;
+ }
+ 
++/* FIXME: Return value is always adns_s_ok, and never used. But I
++ * don't understand why we can assert that we have space in the vbuf. */
+ static adns_status mkquery_footer(vbuf *vb, adns_rrtype type) {
+   byte *rqp;
+ 
+@@ -118,17 +121,15 @@ adns_status adns__qdpl_normal(adns_state ads,
+   return adns_s_ok;
+ }
+ 
+-adns_status adns__mkquery(adns_state ads, vbuf *vb, int *id_r,
++adns_status adns__mkquery_labels(adns_state ads, vbuf *vb,
+ 			  const char *owner, int ol,
+-			  const typeinfo *typei, adns_rrtype type,
+-			  adns_queryflags flags) {
++				 const typeinfo *typei, adns_queryflags flags) {
+   int labelnum, ll, nbytes;
+-  byte label[255];
+-  byte *rqp;
++  byte label[255], *rqp;
+   const char *p, *pe;
+   adns_status st;
+ 
+-  st= mkquery_header(ads,vb,id_r,ol+2); if (st) return st;
++  if (!adns__vbuf_ensure(vb,ol+2)) return adns_s_nomemory;
+   
+   MKQUERY_START(vb);
+ 
+@@ -149,22 +150,31 @@ adns_status adns__mkquery(adns_state ads, vbuf *vb, int *id_r,
+   MKQUERY_ADDB(0);
+ 
+   MKQUERY_STOP(vb);
++  return adns_s_ok;  
++}
++
++adns_status adns__mkquery(adns_state ads, vbuf *vb, int *id_r,
++			  const char *owner, int ol,
++			  const typeinfo *typei, adns_rrtype type,
++			  adns_queryflags flags) {
++  adns_status st;
+   
++  st= mkquery_header(ads,vb,id_r,ol+2); if (st) return st;
++  st= adns__mkquery_labels(ads, vb, owner, ol, typei, flags); if (st) return st;
+   st= mkquery_footer(vb,type);
+   
+   return adns_s_ok;
+ }
+ 
+-adns_status adns__mkquery_frdgram(adns_state ads, vbuf *vb, int *id_r,
++adns_status adns__mkquery_labels_frdgram(adns_state ads, vbuf *vb,
+ 				  const byte *qd_dgram, int qd_dglen,
+-				  int qd_begin,
+-				  adns_rrtype type, adns_queryflags flags) {
++                                         int qd_begin) {
++  adns_status st;
+   byte *rqp;
+   findlabel_state fls;
+   int lablen, labstart;
+-  adns_status st;
+ 
+-  st= mkquery_header(ads,vb,id_r,qd_dglen); if (st) return st;
++  if (!adns__vbuf_ensure(vb,qd_dglen)) return adns_s_nomemory;
+ 
+   MKQUERY_START(vb);
+ 
+@@ -181,6 +191,30 @@ adns_status adns__mkquery_frdgram(adns_state ads, vbuf *vb, int *id_r,
+ 
+   MKQUERY_STOP(vb);
+   
++  return adns_s_ok;  
++}
++
++adns_status adns__mkquery_frdgram(adns_state ads, vbuf *vb, int *id_r,
++				  const byte *qd_dgram, int qd_dglen,
++				  int qd_begin,
++				  adns_rrtype type, adns_queryflags flags) {
++  adns_status st;
++
++  st= mkquery_header(ads,vb,id_r,qd_dglen); if (st) return st;
++  st= adns__mkquery_labels_frdgram(ads, vb, qd_dgram, qd_dglen, qd_begin);
++  if (st) return st;
++  st= mkquery_footer(vb,type);
++  
++  return adns_s_ok;
++}
++
++adns_status adns__mkquery_frlabels(adns_state ads, vbuf *vb, int *id_r,
++                                   char *l, int llen,
++                                   adns_rrtype type, adns_queryflags flags) {
++  adns_status st;
++  
++  st= mkquery_header(ads,vb,id_r,llen); if (st) return st;
++  if (!adns__vbuf_append(vb, l, llen)) return adns_s_nomemory;
+   st= mkquery_footer(vb,type);
+   
+   return adns_s_ok;
+@@ -251,6 +285,7 @@ static void query_usetcp(adns_query qu, struct timeval now) {
+ 
+ void adns__query_send(adns_query qu, struct timeval now) {
+   struct sockaddr_in servaddr;
++  struct sockaddr_in6 servaddr6;
+   int serv, r;
+   adns_state ads;
+ 
+@@ -266,15 +301,25 @@ void adns__query_send(adns_query qu, struct timeval now) {
+   }
+ 
+   serv= qu->udpnextserver;
+-  memset(&servaddr,0,sizeof(servaddr));
+-
+   ads= qu->ads;
+-  servaddr.sin_family= AF_INET;
+-  servaddr.sin_addr= ads->servers[serv].addr;
+-  servaddr.sin_port= htons(DNS_PORT);
++
++  if(ads->servers[serv].sin_family == AF_INET) {
++    memset(&servaddr,0,sizeof(servaddr));
++    servaddr.sin_family= ads->servers[serv].sin_family;
++    servaddr.sin_addr= ads->servers[serv].addr;
++    servaddr.sin_port= htons(DNS_PORT);
++    r= sendto(ads->udpsocket,qu->query_dgram,qu->query_dglen,0,
++		(const struct sockaddr*)&servaddr,sizeof(servaddr));
++  } else {
++    memset(&servaddr6,0,sizeof(servaddr6));
++    servaddr6.sin6_family= ads->servers[serv].sin_family;
++    servaddr6.sin6_addr= ads->servers[serv].addr6;
++    servaddr6.sin6_port= htons(DNS_PORT);
++    r= sendto(ads->udpsocket6,qu->query_dgram,qu->query_dglen,0,
++		(const struct sockaddr*)&servaddr6,sizeof(servaddr6));
++  }
++
+   
+-  r= sendto(ads->udpsocket,qu->query_dgram,qu->query_dglen,0,
+-	    (const struct sockaddr*)&servaddr,sizeof(servaddr));
+   if (r<0 && errno == EMSGSIZE) {
+     qu->retries= 0;
+     query_usetcp(qu,now);
+diff --git a/src/types.c b/src/types.c
+index 36ff879..712ae69 100644
+--- a/src/types.c
++++ b/src/types.c
+@@ -48,12 +48,15 @@
+  * _manyistr                  (mf,cs)
+  * _txt                       (pa)
+  * _inaddr                    (pa,dip,di)
+- * _addr                      (pa,di,csp,cs)
++ * _in6addr                   (pa,cs)
++ * _addr                      (sh,di,csp,cs)
+  * _domain                    (pap)
+  * _host_raw                  (pa)
+  * _hostaddr                  (pap,pa,dip,di,mfp,mf,csp,cs +pap_findaddrs)
+  * _mx_raw                    (pa,di)
+  * _mx                        (pa,di)
++ * _srv_raw                   (pa,di,mf,cs)
++ * _srv                       (pa,di,mf,cs)
+  * _inthostaddr               (mf,cs)
+  * _ptr                       (pa)
+  * _strpair                   (mf,cs)
+@@ -251,14 +254,20 @@ static adns_status pa_inaddr(const parseinfo *pai, int cbyte,
+   return adns_s_ok;
+ }
+ 
+-static int search_sortlist(adns_state ads, struct in_addr ad) {
++static int search_sortlist_in(adns_state ads, struct in_addr ad) {
+   const struct sortlist *slp;
+   int i;
+   
+   for (i=0, slp=ads->sortlist;
+-       i<ads->nsortlist &&
+-	 !((ad.s_addr & slp->mask.s_addr) == slp->base.s_addr);
+-       i++, slp++);
++       i<ads->nsortlist;
++       i++, slp++) {
++    if (slp->family == AF_INET) {
++      struct in_addr mask;
++      mask.s_addr = htonl(-1 << slp->prefix);
++      if ( (ad.s_addr & mask.s_addr ) == slp->base.inet.s_addr)
++	break;
++    }
++  }
+   return i;
+ }
+ 
+@@ -267,8 +276,8 @@ static int dip_inaddr(adns_state ads, struct in_addr a, struct in_addr b) {
+   
+   if (!ads->nsortlist) return 0;
+ 
+-  ai= search_sortlist(ads,a);
+-  bi= search_sortlist(ads,b);
++  ai= search_sortlist_in(ads,a);
++  bi= search_sortlist_in(ads,b);
+   return bi<ai;
+ }
+ 
+@@ -289,27 +298,297 @@ static adns_status cs_inaddr(vbuf *vb, const void *datap) {
+ }
+ 
+ /*
+- * _addr   (pa,di,csp,cs)
++ * _in6addr   (pa,dip,di)
+  */
+ 
+-static adns_status pa_addr(const parseinfo *pai, int cbyte,
++static adns_status pa_in6addr(const parseinfo *pai, int cbyte,
+ 			   int max, void *datap) {
+-  adns_rr_addr *storeto= datap;
++  struct in_addr *storeto= datap;
++  
++  if (max-cbyte != 16) return adns_s_invaliddata;
++  memcpy(storeto, pai->dgram + cbyte, 16);
++  return adns_s_ok;
++}
++
++static int search_sortlist_in6(adns_state ads, const struct in6_addr *ad) {
++  const struct sortlist *slp;
++  int i;
++  
++  for (i=0, slp=ads->sortlist;
++       i<ads->nsortlist;
++       i++, slp++) {
++    if (slp->family == AF_INET6) {
++      int pb = slp->prefix / 8;
++      int mask = 0xff & (-1 << (slp->prefix % 8)); 
++      if (memcmp(ad->s6_addr, slp->base.inet6.s6_addr, pb) == 0
++	  && (!mask
++	      || (ad->s6_addr[pb] & mask) == slp->base.inet6.s6_addr[pb]))
++	break;
++    }
++  }
++  return i;
++}
++
++static int dip_in6addr(adns_state ads,
++		       const struct in6_addr *a, const struct in6_addr *b) {
++  int ai, bi;
++  
++  if (!ads->nsortlist) return 0;
++
++  ai= search_sortlist_in6(ads,a);
++  bi= search_sortlist_in6(ads,b);
++  return bi<ai;
++}
++
++static int di_in6addr(adns_state ads,
++		     const void *datap_a, const void *datap_b) {
++  const struct in6_addr *ap= datap_a, *bp= datap_b;
++
++  return dip_in6addr(ads,ap,bp);
++}
++
++
++static adns_status cs_in6addr(vbuf *vb, const void *datap) {
++  char buf[INET6_ADDRSTRLEN];
++  const char *ia;
++
++  ia= inet_ntop(AF_INET6, datap, buf, sizeof(buf)); assert(ia);
++  CSP_ADDSTR(ia);
++  return adns_s_ok;
++}
++
++/*
++ * _addr   (sh,pa,di,csp,cs)
++ */
++
++static void mk_mapped_ipv6(struct sockaddr_in6 *sa, const struct in_addr *in) {
++  memset(sa, 0, sizeof(*sa));
++  sa->sin6_family = AF_INET6;
++  sa->sin6_addr.s6_addr16[5] = 0xffff;
++  sa->sin6_addr.s6_addr32[3] = in->s_addr;
++}
++
++static void icb_addr(adns_query parent, adns_query child) {
++  adns_answer *cans= child->answer;
++  adns_answer *pans= parent->answer;
++  adns_state ads= parent->ads;
++  adns_rr_addr *addr;
++  
++  int i;
++
++  if (parent->expires > child->expires) parent->expires = child->expires;
++  
++  if (cans->status == adns_s_nxdomain) {
++    adns__query_fail(parent,cans->status);
++    return;
++  }  
++  if (cans->status == adns_s_nodata && parent->children.head) {
++    /* We may get records from the remaining queries */
++    LIST_LINK_TAIL(ads->childw,parent);
++    return;
++  }
++  if (cans->status) {
++    if (pans->nrrs)
++      adns__query_done(parent);
++    else
++      adns__query_fail(parent,cans->status);
++    return;
++  }
++
++  assert(cans->nrrs);
++
++  /* Copy CNAME. CNAME must be consistent for both queries. */
++  if (cans->cname && pans->cname) {
++    if (strcmp(cans->cname, pans->cname)) {
++      adns__query_fail(parent, adns_s_inconsistent);
++      return;
++    }
++  }
++  else if (pans->cname) {
++    adns__query_fail(parent, adns_s_inconsistent);
++    return;
++  }
++  else if (cans->cname) {
++    size_t len;
++    if (pans->nrrs) {
++      adns__query_fail(parent, adns_s_inconsistent);
++      return;
++    }
++    len = strlen(cans->cname) + 1;
++    pans->cname = adns__alloc_preserved(parent, len);
++    if (!pans->cname) {
++      adns__query_fail(parent, adns_s_nomemory);
++      return;
++    }
++    memcpy(pans->cname, cans->cname, len);
++  }
++  if (pans->nrrs)
++    {
++      void *p = adns__realloc_interim(parent,pans->rrs.untyped,
++				      sizeof(adns_rr_addr) * (cans->nrrs + pans->nrrs));
++      if (!p) {
++	adns__query_fail(parent, adns_s_nomemory);
++	return;
++      }
++      pans->rrs.untyped = p;
++      addr = pans->rrs.addr + pans->nrrs;
++      pans->nrrs += cans->nrrs;
++    }
++  else {
++    pans->rrs.untyped
++      = adns__alloc_interim(parent,sizeof(adns_rr_addr) * cans->nrrs);
++    if (!pans->rrs.untyped) {
++      adns__query_fail(parent,adns_s_nomemory);
++      return;
++    }
++    pans->nrrs = cans->nrrs;
++    addr = pans->rrs.addr;
++  }
++
++  switch (cans->type) {
++  default: abort();
++  case adns_r_a:
++    if (parent->flags & adns_qf_ip6mapped)
++      for (i = 0; i<cans->nrrs; i++) {
++	addr[i].len = sizeof(struct sockaddr_in6);
++	mk_mapped_ipv6(&addr[i].addr.inet6, &cans->rrs.inaddr[i]);
++      }
++    else
++      for (i = 0; i<cans->nrrs; i++) {
++	addr[i].len = sizeof(struct sockaddr_in);
++	memset(&addr[i].addr.inet, 0, sizeof(addr[i].addr.inet));
++	addr[i].addr.inet.sin_family = AF_INET;
++	addr[i].addr.inet.sin_addr = cans->rrs.inaddr[i];
++      }
++    break;
++  case adns_r_aaaa:
++    for (i = 0; i<cans->nrrs; i++) {
++      addr[i].len = sizeof(struct sockaddr_in6);
++      memset(&addr[i].addr.inet6, 0, sizeof(addr[i].addr.inet6));
++      addr[i].addr.inet6.sin6_family = AF_INET6;
++      addr[i].addr.inet6.sin6_addr = cans->rrs.in6addr[i];
++    }
++    break;
++  }
++  
++  if (!parent->children.head) {
++    adns__query_done(parent);
++    return;
++  } else {
++    LIST_LINK_TAIL(ads->childw,parent);
++    return;
++  }
++}
++
++static void sh_addr(adns_query qu,
++		    adns_queryflags flags, struct timeval now)
++{
++  adns_status st;
++  int id;
++  qcontext ctx;
++  adns_query nqu;
++  vbuf vb;
++
++  assert(flags & adns__qf_ip_mask);
++  
++  /* Must have a non-negative id, or else adns__internal_check will
++   * think that we are on the output queue. */
++  qu->id = 0;
++  
++  ctx.ext= 0;
++  ctx.callback= icb_addr;
++  /* What to store in ctx.info? */
++
++  adns__vbuf_init(&vb);
++
++  if (flags & adns_qf_ip4) { /* A query */
++    st= adns__mkquery_frlabels(qu->ads, &vb, &id, 
++			       qu->vb.buf, qu->vb.used, adns_r_a, flags);
++    if (st) { adns__query_fail(qu, st); return; }
++    
++    st= adns__internal_submit(qu->ads, &nqu, adns__findtype(adns_r_a),
++			      &vb, id, flags, now, &ctx);
++    if (st) { adns__query_fail(qu, st); return; }
++    
++    nqu->parent = qu;
++    LIST_LINK_TAIL_PART(qu->children,nqu,siblings.);
++  }
++
++  if (flags & adns_qf_ip6) { /* AAAA query */
++    st= adns__mkquery_frlabels(qu->ads, &vb, &id, 
++			       qu->vb.buf, qu->vb.used, adns_r_aaaa, flags);
++    if (st) { adns__query_fail(qu, st); return; }
++    
++    st= adns__internal_submit(qu->ads, &nqu, adns__findtype(adns_r_aaaa),
++			      &vb, id, flags, now, &ctx);
++    if (st) { adns__query_fail(qu, st); return; }
++    
++    nqu->parent = qu;
++    LIST_LINK_TAIL_PART(qu->children,nqu,siblings.);
++  }
++  assert(qu->children.head);
++}
++
++static adns_status pap_addr(const parseinfo *pai, adns_rrtype type, int cbyte,
++			    int max, adns_rr_addr *rr) {
++  
+   const byte *dgram= pai->dgram;
++  adns_queryflags flags = pai->qu->flags;
++  
++  switch (type)
++  {
++  default: abort();
++  case adns_r_a:
++    assert(flags & adns_qf_ip4);
+ 
+   if (max-cbyte != 4) return adns_s_invaliddata;
+-  storeto->len= sizeof(storeto->addr.inet);
+-  memset(&storeto->addr,0,sizeof(storeto->addr.inet));
+-  storeto->addr.inet.sin_family= AF_INET;
+-  memcpy(&storeto->addr.inet.sin_addr,dgram+cbyte,4);
++    
++    if (flags & adns_qf_ip6mapped) {
++      rr->len = sizeof(struct sockaddr_in6);
++      mk_mapped_ipv6(&rr->addr.inet6, (const struct in_addr *) (dgram+cbyte));
++    }
++    else {
++      rr->len= sizeof(rr->addr.inet);
++      memset(&rr->addr.inet,0,sizeof(rr->addr.inet));
++      rr->addr.inet.sin_family= AF_INET;
++      memcpy(&rr->addr.inet.sin_addr,dgram+cbyte,4);
++    }
++    break;
++  case adns_r_aaaa:
++    assert(flags & adns_qf_ip6);
++    
++    if (max-cbyte != 16) return adns_s_invaliddata;
++    
++    rr->len= sizeof(rr->addr.inet6);
++    memset(&rr->addr,0,sizeof(rr->addr.inet6));
++    rr->addr.inet6.sin6_family= AF_INET6;
++    memcpy(&rr->addr.inet6.sin6_addr,dgram+cbyte,16);
++
++    break;
++  }
++  
+   return adns_s_ok;
+ }
+ 
++static int search_sortlist_addr(adns_state ads, const adns_rr_addr *ad) {
++  switch(ad->addr.sa.sa_family) {
++  default: abort();
++  case AF_INET: return search_sortlist_in(ads, ad->addr.inet.sin_addr);
++  case AF_INET6: return search_sortlist_in6(ads, &ad->addr.inet6.sin6_addr);
++  }
++}
++
++static int dip_addr(adns_state ads,
++		    const adns_rr_addr *a, const adns_rr_addr *b) {
++  int ai, bi;
++  ai = search_sortlist_addr(ads, a);
++  bi = search_sortlist_addr(ads, b);
++  return bi<ai;
++}
++
+ static int di_addr(adns_state ads, const void *datap_a, const void *datap_b) {
+   const adns_rr_addr *ap= datap_a, *bp= datap_b;
+-
+-  assert(ap->addr.sa.sa_family == AF_INET);
+-  return dip_inaddr(ads, ap->addr.inet.sin_addr, bp->addr.inet.sin_addr);
++  return dip_addr(ads, ap, bp);
+ }
+ 
+ static int div_addr(void *context, const void *datap_a, const void *datap_b) {
+@@ -320,7 +599,7 @@ static int div_addr(void *context, const void *datap_a, const void *datap_b) {
+ 
+ static adns_status csp_addr(vbuf *vb, const adns_rr_addr *rrp) {
+   const char *ia;
+-  char buf[30];
++  char buf[INET6_ADDRSTRLEN];
+ 
+   switch (rrp->addr.inet.sin_family) {
+   case AF_INET:
+@@ -328,6 +607,12 @@ static adns_status csp_addr(vbuf *vb, const adns_rr_addr *rrp) {
+     ia= inet_ntoa(rrp->addr.inet.sin_addr); assert(ia);
+     CSP_ADDSTR(ia);
+     break;
++  case AF_INET6:
++    CSP_ADDSTR("INET6 ");
++    ia= inet_ntop(AF_INET6, &rrp->addr.inet6.sin6_addr,
++		  buf, sizeof(buf)); assert(ia);
++    CSP_ADDSTR(ia);
++    break;
+   default:
+     sprintf(buf,"AF=%u",rrp->addr.sa.sa_family);
+     CSP_ADDSTR(buf);
+@@ -424,17 +709,22 @@ static adns_status pap_findaddrs(const parseinfo *pai, adns_rr_hostaddr *ha,
+ 			    &type, &class, &ttl, &rdlen, &rdstart,
+ 			    pai->dgram, pai->dglen, dmstart, &ownermatched);
+     if (st) return st;
+-    if (!ownermatched || class != DNS_CLASS_IN || type != adns_r_a) {
++    if (!ownermatched || class != DNS_CLASS_IN) {
+       if (naddrs>0) break; else continue;
+     }
++    if (! ((type == adns_r_a && (pai->qu->flags & adns_qf_ip4))
++	   || (type == adns_r_aaaa && (pai->qu->flags & adns_qf_ip6)))) {
++      if (naddrs>0) break; else continue;
++    }
++    
+     if (naddrs == -1) {
+       naddrs= 0;
+     }
+     if (!adns__vbuf_ensure(&pai->qu->vb, (naddrs+1)*sizeof(adns_rr_addr)))
+       R_NOMEM;
+     adns__update_expires(pai->qu,ttl,pai->now);
+-    st= pa_addr(pai, rdstart,rdstart+rdlen,
+-		pai->qu->vb.buf + naddrs*sizeof(adns_rr_addr));
++    st= pap_addr(pai, type, rdstart,rdstart+rdlen,
++		 (adns_rr_addr *) pai->qu->vb.buf + naddrs);
+     if (st) return st;
+     naddrs++;
+   }
+@@ -476,7 +766,6 @@ static adns_status pap_hostaddr(const parseinfo *pai, int *cbyte_io,
+   adns_status st;
+   int dmstart, cbyte;
+   qcontext ctx;
+-  int id;
+   adns_query nqu;
+   adns_queryflags nflags;
+ 
+@@ -500,9 +789,8 @@ static adns_status pap_hostaddr(const parseinfo *pai, int *cbyte_io,
+   if (st) return st;
+   if (rrp->naddrs != -1) return adns_s_ok;
+ 
+-  st= adns__mkquery_frdgram(pai->ads, &pai->qu->vb, &id,
+-			    pai->dgram, pai->dglen, dmstart,
+-			    adns_r_addr, adns_qf_quoteok_query);
++  st= adns__mkquery_labels_frdgram(pai->ads, &pai->qu->vb,
++				   pai->dgram, pai->dglen, dmstart);
+   if (st) return st;
+ 
+   ctx.ext= 0;
+@@ -513,7 +801,7 @@ static adns_status pap_hostaddr(const parseinfo *pai, int *cbyte_io,
+   if (!(pai->qu->flags & adns_qf_cname_loose)) nflags |= adns_qf_cname_forbid;
+   
+   st= adns__internal_submit(pai->ads, &nqu, adns__findtype(adns_r_addr),
+-			    &pai->qu->vb, id, nflags, pai->now, &ctx);
++			    &pai->qu->vb, 0, nflags, pai->now, &ctx);
+   if (st) return st;
+ 
+   nqu->parent= pai->qu;
+@@ -539,11 +827,7 @@ static int dip_hostaddr(adns_state ads,
+   if (ap->astatus != bp->astatus) return ap->astatus;
+   if (ap->astatus) return 0;
+ 
+-  assert(ap->addrs[0].addr.sa.sa_family == AF_INET);
+-  assert(bp->addrs[0].addr.sa.sa_family == AF_INET);
+-  return dip_inaddr(ads,
+-		    ap->addrs[0].addr.inet.sin_addr,
+-		    bp->addrs[0].addr.inet.sin_addr);
++  return dip_addr(ads, &ap->addrs[0], &bp->addrs[0]);
+ }
+ 
+ static int di_hostaddr(adns_state ads,
+@@ -717,7 +1001,7 @@ static void icb_ptr(adns_query parent, adns_query child) {
+     return;
+   }
+ 
+-  queried= &parent->ctx.info.ptr_parent_addr;
++  queried= &parent->extra.info.ptr_addr;
+   for (i=0, found=cans->rrs.addr; i<cans->nrrs; i++, found++) {
+     if (queried->len == found->len &&
+ 	!memcmp(&queried->addr,&found->addr,queried->len)) {
+@@ -734,18 +1018,12 @@ static void icb_ptr(adns_query parent, adns_query child) {
+   adns__query_fail(parent,adns_s_inconsistent);
+ }
+ 
++/* FIXME: Completely different in adns-1.4. */
+ static adns_status pa_ptr(const parseinfo *pai, int dmstart,
+ 			  int max, void *datap) {
+-  static const char *const (expectdomain[])= { DNS_INADDR_ARPA };
+-  
+   char **rrp= datap;
+   adns_status st;
+-  adns_rr_addr *ap;
+-  findlabel_state fls;
+-  char *ep;
+-  byte ipv[4];
+-  char labbuf[4];
+-  int cbyte, i, lablen, labstart, l, id;
++  int cbyte;
+   adns_query nqu;
+   qcontext ctx;
+ 
+@@ -755,48 +1033,20 @@ static adns_status pa_ptr(const parseinfo *pai, int dmstart,
+   if (st) return st;
+   if (cbyte != max) return adns_s_invaliddata;
+ 
+-  ap= &pai->qu->ctx.info.ptr_parent_addr;
+-  if (!ap->len) {
+-    adns__findlabel_start(&fls, pai->ads, -1, pai->qu,
+-			  pai->qu->query_dgram, pai->qu->query_dglen,
+-			  pai->qu->query_dglen, DNS_HDRSIZE, 0);
+-    for (i=0; i<4; i++) {
+-      st= adns__findlabel_next(&fls,&lablen,&labstart); assert(!st);
+-      if (lablen<=0 || lablen>3) return adns_s_querydomainwrong;
+-      memcpy(labbuf, pai->qu->query_dgram + labstart, lablen);
+-      labbuf[lablen]= 0;
+-      ipv[3-i]= strtoul(labbuf,&ep,10);
+-      if (*ep) return adns_s_querydomainwrong;
+-      if (lablen>1 && pai->qu->query_dgram[labstart]=='0')
+-	return adns_s_querydomainwrong;
+-    }
+-    for (i=0; i<sizeof(expectdomain)/sizeof(*expectdomain); i++) {
+-      st= adns__findlabel_next(&fls,&lablen,&labstart); assert(!st);
+-      l= strlen(expectdomain[i]);
+-      if (lablen != l ||
+-	  memcmp(pai->qu->query_dgram + labstart, expectdomain[i], l))
+-	return adns_s_querydomainwrong;
+-    }
+-    st= adns__findlabel_next(&fls,&lablen,0); assert(!st);
+-    if (lablen) return adns_s_querydomainwrong;
+-    
+-    ap->len= sizeof(struct sockaddr_in);
+-    memset(&ap->addr,0,sizeof(ap->addr.inet));
+-    ap->addr.inet.sin_family= AF_INET;
+-    ap->addr.inet.sin_addr.s_addr=
+-      htonl((ipv[0]<<24) | (ipv[1]<<16) | (ipv[2]<<8) | (ipv[3]));
+-  }
++  /* Should be initialized by adns_submit_reverse. If it's not, we
++   * can't do any consistency checking. */
++  if (!pai->qu->extra.info.ptr_addr.len) return adns_s_ok;
+ 
+-  st= adns__mkquery_frdgram(pai->ads, &pai->qu->vb, &id,
+-			    pai->dgram, pai->dglen, dmstart,
+-			    adns_r_addr, adns_qf_quoteok_query);
++  pai->qu->vb.used = 0;
++  st= adns__mkquery_labels_frdgram(pai->ads, &pai->qu->vb,
++				   pai->dgram, pai->dglen, dmstart);
+   if (st) return st;
+ 
+   ctx.ext= 0;
+   ctx.callback= icb_ptr;
+   memset(&ctx.info,0,sizeof(ctx.info));
+   st= adns__internal_submit(pai->ads, &nqu, adns__findtype(adns_r_addr),
+-			    &pai->qu->vb, id,
++			    &pai->qu->vb, 0,
+ 			    adns_qf_quoteok_query, pai->now, &ctx);
+   if (st) return st;
+ 
+@@ -1250,13 +1500,16 @@ static void mf_flat(adns_query qu, void *data) { }
+ 
+ #define DEEP_TYPE(code,rrt,fmt,memb,parser,comparer,printer)	\
+  { adns_r_##code, rrt,fmt,TYPESZ_M(memb), mf_##memb,		\
+-      printer,parser,comparer, adns__qdpl_normal,0 }
++     printer,0,parser,comparer, adns__qdpl_normal,0 }
+ #define FLAT_TYPE(code,rrt,fmt,memb,parser,comparer,printer)	\
+  { adns_r_##code, rrt,fmt,TYPESZ_M(memb), mf_flat,		\
+-     printer,parser,comparer, adns__qdpl_normal,0 }
++     printer,0,parser,comparer, adns__qdpl_normal,0 }
+ #define XTRA_TYPE(code,rrt,fmt,memb,parser,comparer,printer,qdpl,postsort) \
+  { adns_r_##code, rrt,fmt,TYPESZ_M(memb), mf_##memb,			   \
+-    printer,parser,comparer,qdpl,postsort }
++     printer,0,parser,comparer,qdpl,postsort }
++#define SPECIAL_TYPE(code,rrt,fmt,memb,submit,comparer,printer) \
++ { adns_r_##code, rrt,fmt,TYPESZ_M(memb), mf_flat,		\
++   printer,submit,0,comparer, adns__qdpl_normal,0 }
+ 
+ static const typeinfo typeinfos[] = {
+ /* Must be in ascending order of rrtype ! */
+@@ -1271,10 +1524,11 @@ DEEP_TYPE(hinfo,  "HINFO", 0, intstrpair,pa_hinfo,   0,        cs_hinfo      ),
+ DEEP_TYPE(mx_raw, "MX",   "raw",intstr,  pa_mx_raw,  di_mx_raw,cs_inthost    ),
+ DEEP_TYPE(txt,    "TXT",   0,   manyistr,pa_txt,     0,        cs_txt        ),
+ DEEP_TYPE(rp_raw, "RP",   "raw",strpair, pa_rp,      0,        cs_rp         ),
++FLAT_TYPE(aaaa,   "AAAA",   0,  in6addr, pa_in6addr, di_in6addr, cs_in6addr  ),
+ XTRA_TYPE(srv_raw,"SRV",  "raw",srvraw , pa_srvraw,  di_srv,   cs_srvraw,
+ 	                                               qdpl_srv, postsort_srv),
+ 
+-FLAT_TYPE(addr,   "A",  "addr", addr,    pa_addr,    di_addr,  cs_addr       ),
++/* adns__qtf_deref set */
+ DEEP_TYPE(ns,     "NS", "+addr",hostaddr,pa_hostaddr,di_hostaddr,cs_hostaddr ),
+ DEEP_TYPE(ptr,    "PTR","checked",str,   pa_ptr,     0,        cs_domain     ),
+ DEEP_TYPE(mx,     "MX", "+addr",inthostaddr,pa_mx,   di_mx,    cs_inthostaddr),
+@@ -1283,6 +1537,9 @@ XTRA_TYPE(srv,    "SRV","+addr",srvha,   pa_srvha,   di_srv,   cs_srvha,
+ 
+ DEEP_TYPE(soa,    "SOA","822",  soa,     pa_soa,     0,        cs_soa        ),
+ DEEP_TYPE(rp,     "RP", "822",  strpair, pa_rp,      0,        cs_rp         ),
++
++/* adns__qtf_special set */
++SPECIAL_TYPE(addr,"<A+AAAA>", "addr",addr,sh_addr,   di_addr,  cs_addr       ),
+ };
+ 
+ static const typeinfo typeinfo_unknown=
diff --git a/package/adns/adns-1.4-rh514838.patch b/package/adns/adns-1.4-rh514838.patch
new file mode 100644
index 0000000..d0da303
--- /dev/null
+++ b/package/adns/adns-1.4-rh514838.patch
@@ -0,0 +1,26 @@
+Fixes Bug 514838
+
+Upstream-Status: Pending
+URL: https://bugzilla.redhat.com/show_bug.cgi?id=514838
+
+diff -up adns-1.4/src/general.c.rh514838 adns-1.4/src/general.c
+--- adns-1.4/src/general.c.rh514838	2006-04-08 16:36:57.000000000 +0200
++++ adns-1.4/src/general.c	2009-08-06 13:55:06.752562767 +0200
+@@ -267,6 +267,8 @@ static const struct sinfo {
+   SINFO( nodata,              "No such data"                                 )
+ };
+ 
++static const char *unknown_error_str = "unknown error code";
++
+ static int si_compar(const void *key, const void *elem) {
+   const adns_status *st= key;
+   const struct sinfo *si= elem;
+@@ -283,7 +285,7 @@ const char *adns_strerror(adns_status st
+   const struct sinfo *si;
+ 
+   si= findsinfo(st);
+-  return si->string;
++  return (si == NULL) ? unknown_error_str : si->string;
+ }
+ 
+ const char *adns_errabbrev(adns_status st) {
diff --git a/package/adns/adns.mk b/package/adns/adns.mk
new file mode 100644
index 0000000..be4aefd
--- /dev/null
+++ b/package/adns/adns.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# adns
+#
+#############################################################
+
+ADNS_VERSION = 1.4
+ADNS_SOURCE = adns-$(ADNS_VERSION).tar.gz
+ADNS_SITE = http://www.chiark.greenend.org.uk/~ian/adns/ftp/
+ADNS_AUTORECONF = YES
+ADNS_INSTALL_STAGING = YES
+ADNS_CONF_OPT += --enable-dynamic=elf
+
+$(eval $(autotools-package))
+
-- 
1.7.7.6
