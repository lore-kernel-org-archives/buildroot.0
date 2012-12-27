From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Thu, 27 Dec 2012 16:11:13 +0100
Subject: [Buildroot] [PATCH] libnl: add support of old kernel
Message-ID: <1356621073-6242-1-git-send-email-plagnioj@jcrosoft.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

without those patches libnl will not compile on old kernel

Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
---
 ...provide-local-copy-of-linux-can-netlink.h.patch |  142 +++
 ...-0002-netfilter-update-local-header-files.patch |  906 ++++++++++++++++++++
 ...efines-for-__aligned_be64-for-older-kerne.patch |   43 +
 3 files changed, 1091 insertions(+)
 create mode 100644 package/libnl/libnl-3.2.16-0001-can-provide-local-copy-of-linux-can-netlink.h.patch
 create mode 100644 package/libnl/libnl-3.2.16-0002-netfilter-update-local-header-files.patch
 create mode 100644 package/libnl/libnl-3.2.16-0003-Re-adding-defines-for-__aligned_be64-for-older-kerne.patch

diff --git a/package/libnl/libnl-3.2.16-0001-can-provide-local-copy-of-linux-can-netlink.h.patch b/package/libnl/libnl-3.2.16-0001-can-provide-local-copy-of-linux-can-netlink.h.patch
new file mode 100644
index 0000000..ab6a77b
--- /dev/null
+++ b/package/libnl/libnl-3.2.16-0001-can-provide-local-copy-of-linux-can-netlink.h.patch
@@ -0,0 +1,142 @@
+From 913a689de34686e5ed2fa3c56e46e81f9f6eb682 Mon Sep 17 00:00:00 2001
+From: Thomas Graf <tgraf@suug.ch>
+Date: Tue, 11 Dec 2012 17:59:30 +0100
+Subject: [PATCH 1/3] can: provide local copy of <linux/can/netlink.h>
+
+Signed-off-by: Thomas Graf <tgraf@suug.ch>
+---
+ include/linux/can/netlink.h |  122 +++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 122 insertions(+)
+ create mode 100644 include/linux/can/netlink.h
+
+diff --git a/include/linux/can/netlink.h b/include/linux/can/netlink.h
+new file mode 100644
+index 0000000..14966dd
+--- /dev/null
++++ b/include/linux/can/netlink.h
+@@ -0,0 +1,122 @@
++/*
++ * linux/can/netlink.h
++ *
++ * Definitions for the CAN netlink interface
++ *
++ * Copyright (c) 2009 Wolfgang Grandegger <wg@grandegger.com>
++ *
++ */
++
++#ifndef CAN_NETLINK_H
++#define CAN_NETLINK_H
++
++#include <linux/types.h>
++
++/*
++ * CAN bit-timing parameters
++ *
++ * For further information, please read chapter "8 BIT TIMING
++ * REQUIREMENTS" of the "Bosch CAN Specification version 2.0"
++ * at http://www.semiconductors.bosch.de/pdf/can2spec.pdf.
++ */
++struct can_bittiming {
++	__u32 bitrate;		/* Bit-rate in bits/second */
++	__u32 sample_point;	/* Sample point in one-tenth of a percent */
++	__u32 tq;		/* Time quanta (TQ) in nanoseconds */
++	__u32 prop_seg;		/* Propagation segment in TQs */
++	__u32 phase_seg1;	/* Phase buffer segment 1 in TQs */
++	__u32 phase_seg2;	/* Phase buffer segment 2 in TQs */
++	__u32 sjw;		/* Synchronisation jump width in TQs */
++	__u32 brp;		/* Bit-rate prescaler */
++};
++
++/*
++ * CAN harware-dependent bit-timing constant
++ *
++ * Used for calculating and checking bit-timing parameters
++ */
++struct can_bittiming_const {
++	char name[16];		/* Name of the CAN controller hardware */
++	__u32 tseg1_min;	/* Time segement 1 = prop_seg + phase_seg1 */
++	__u32 tseg1_max;
++	__u32 tseg2_min;	/* Time segement 2 = phase_seg2 */
++	__u32 tseg2_max;
++	__u32 sjw_max;		/* Synchronisation jump width */
++	__u32 brp_min;		/* Bit-rate prescaler */
++	__u32 brp_max;
++	__u32 brp_inc;
++};
++
++/*
++ * CAN clock parameters
++ */
++struct can_clock {
++	__u32 freq;		/* CAN system clock frequency in Hz */
++};
++
++/*
++ * CAN operational and error states
++ */
++enum can_state {
++	CAN_STATE_ERROR_ACTIVE = 0,	/* RX/TX error count < 96 */
++	CAN_STATE_ERROR_WARNING,	/* RX/TX error count < 128 */
++	CAN_STATE_ERROR_PASSIVE,	/* RX/TX error count < 256 */
++	CAN_STATE_BUS_OFF,		/* RX/TX error count >= 256 */
++	CAN_STATE_STOPPED,		/* Device is stopped */
++	CAN_STATE_SLEEPING,		/* Device is sleeping */
++	CAN_STATE_MAX
++};
++
++/*
++ * CAN bus error counters
++ */
++struct can_berr_counter {
++	__u16 txerr;
++	__u16 rxerr;
++};
++
++/*
++ * CAN controller mode
++ */
++struct can_ctrlmode {
++	__u32 mask;
++	__u32 flags;
++};
++
++#define CAN_CTRLMODE_LOOPBACK		0x01	/* Loopback mode */
++#define CAN_CTRLMODE_LISTENONLY		0x02 	/* Listen-only mode */
++#define CAN_CTRLMODE_3_SAMPLES		0x04	/* Triple sampling mode */
++#define CAN_CTRLMODE_ONE_SHOT		0x08	/* One-Shot mode */
++#define CAN_CTRLMODE_BERR_REPORTING	0x10	/* Bus-error reporting */
++
++/*
++ * CAN device statistics
++ */
++struct can_device_stats {
++	__u32 bus_error;	/* Bus errors */
++	__u32 error_warning;	/* Changes to error warning state */
++	__u32 error_passive;	/* Changes to error passive state */
++	__u32 bus_off;		/* Changes to bus off state */
++	__u32 arbitration_lost; /* Arbitration lost errors */
++	__u32 restarts;		/* CAN controller re-starts */
++};
++
++/*
++ * CAN netlink interface
++ */
++enum {
++	IFLA_CAN_UNSPEC,
++	IFLA_CAN_BITTIMING,
++	IFLA_CAN_BITTIMING_CONST,
++	IFLA_CAN_CLOCK,
++	IFLA_CAN_STATE,
++	IFLA_CAN_CTRLMODE,
++	IFLA_CAN_RESTART_MS,
++	IFLA_CAN_RESTART,
++	IFLA_CAN_BERR_COUNTER,
++	__IFLA_CAN_MAX
++};
++
++#define IFLA_CAN_MAX	(__IFLA_CAN_MAX - 1)
++
++#endif /* CAN_NETLINK_H */
+-- 
+1.7.10.4
+
diff --git a/package/libnl/libnl-3.2.16-0002-netfilter-update-local-header-files.patch b/package/libnl/libnl-3.2.16-0002-netfilter-update-local-header-files.patch
new file mode 100644
index 0000000..78fc21e
--- /dev/null
+++ b/package/libnl/libnl-3.2.16-0002-netfilter-update-local-header-files.patch
@@ -0,0 +1,906 @@
+From 7c85b8a53bfa19872c1165c1fddb321ed38d92c5 Mon Sep 17 00:00:00 2001
+From: Thomas Graf <tgraf@suug.ch>
+Date: Tue, 11 Dec 2012 18:06:29 +0100
+Subject: [PATCH 2/3] netfilter: update local header files
+
+Needed to NF_CT_EXPECT_PERMANENT etc.
+
+Signed-off-by: Thomas Graf <tgraf@suug.ch>
+---
+ include/linux/netfilter/nf_conntrack_common.h |  117 ++++++++++
+ include/linux/netfilter/nfnetlink.h           |  114 +++-------
+ include/linux/netfilter/nfnetlink_compat.h    |   63 +++++
+ include/linux/netfilter/nfnetlink_conntrack.h |  304 +++++++++++++------------
+ include/linux/netfilter/nfnetlink_queue.h     |  107 ++++-----
+ 5 files changed, 425 insertions(+), 280 deletions(-)
+ create mode 100644 include/linux/netfilter/nf_conntrack_common.h
+ create mode 100644 include/linux/netfilter/nfnetlink_compat.h
+
+diff --git a/include/linux/netfilter/nf_conntrack_common.h b/include/linux/netfilter/nf_conntrack_common.h
+new file mode 100644
+index 0000000..1644cdd
+--- /dev/null
++++ b/include/linux/netfilter/nf_conntrack_common.h
+@@ -0,0 +1,117 @@
++#ifndef _UAPI_NF_CONNTRACK_COMMON_H
++#define _UAPI_NF_CONNTRACK_COMMON_H
++/* Connection state tracking for netfilter.  This is separated from,
++   but required by, the NAT layer; it can also be used by an iptables
++   extension. */
++enum ip_conntrack_info {
++	/* Part of an established connection (either direction). */
++	IP_CT_ESTABLISHED,
++
++	/* Like NEW, but related to an existing connection, or ICMP error
++	   (in either direction). */
++	IP_CT_RELATED,
++
++	/* Started a new connection to track (only
++           IP_CT_DIR_ORIGINAL); may be a retransmission. */
++	IP_CT_NEW,
++
++	/* >= this indicates reply direction */
++	IP_CT_IS_REPLY,
++
++	IP_CT_ESTABLISHED_REPLY = IP_CT_ESTABLISHED + IP_CT_IS_REPLY,
++	IP_CT_RELATED_REPLY = IP_CT_RELATED + IP_CT_IS_REPLY,
++	IP_CT_NEW_REPLY = IP_CT_NEW + IP_CT_IS_REPLY,	
++	/* Number of distinct IP_CT types (no NEW in reply dirn). */
++	IP_CT_NUMBER = IP_CT_IS_REPLY * 2 - 1
++};
++
++/* Bitset representing status of connection. */
++enum ip_conntrack_status {
++	/* It's an expected connection: bit 0 set.  This bit never changed */
++	IPS_EXPECTED_BIT = 0,
++	IPS_EXPECTED = (1 << IPS_EXPECTED_BIT),
++
++	/* We've seen packets both ways: bit 1 set.  Can be set, not unset. */
++	IPS_SEEN_REPLY_BIT = 1,
++	IPS_SEEN_REPLY = (1 << IPS_SEEN_REPLY_BIT),
++
++	/* Conntrack should never be early-expired. */
++	IPS_ASSURED_BIT = 2,
++	IPS_ASSURED = (1 << IPS_ASSURED_BIT),
++
++	/* Connection is confirmed: originating packet has left box */
++	IPS_CONFIRMED_BIT = 3,
++	IPS_CONFIRMED = (1 << IPS_CONFIRMED_BIT),
++
++	/* Connection needs src nat in orig dir.  This bit never changed. */
++	IPS_SRC_NAT_BIT = 4,
++	IPS_SRC_NAT = (1 << IPS_SRC_NAT_BIT),
++
++	/* Connection needs dst nat in orig dir.  This bit never changed. */
++	IPS_DST_NAT_BIT = 5,
++	IPS_DST_NAT = (1 << IPS_DST_NAT_BIT),
++
++	/* Both together. */
++	IPS_NAT_MASK = (IPS_DST_NAT | IPS_SRC_NAT),
++
++	/* Connection needs TCP sequence adjusted. */
++	IPS_SEQ_ADJUST_BIT = 6,
++	IPS_SEQ_ADJUST = (1 << IPS_SEQ_ADJUST_BIT),
++
++	/* NAT initialization bits. */
++	IPS_SRC_NAT_DONE_BIT = 7,
++	IPS_SRC_NAT_DONE = (1 << IPS_SRC_NAT_DONE_BIT),
++
++	IPS_DST_NAT_DONE_BIT = 8,
++	IPS_DST_NAT_DONE = (1 << IPS_DST_NAT_DONE_BIT),
++
++	/* Both together */
++	IPS_NAT_DONE_MASK = (IPS_DST_NAT_DONE | IPS_SRC_NAT_DONE),
++
++	/* Connection is dying (removed from lists), can not be unset. */
++	IPS_DYING_BIT = 9,
++	IPS_DYING = (1 << IPS_DYING_BIT),
++
++	/* Connection has fixed timeout. */
++	IPS_FIXED_TIMEOUT_BIT = 10,
++	IPS_FIXED_TIMEOUT = (1 << IPS_FIXED_TIMEOUT_BIT),
++
++	/* Conntrack is a template */
++	IPS_TEMPLATE_BIT = 11,
++	IPS_TEMPLATE = (1 << IPS_TEMPLATE_BIT),
++
++	/* Conntrack is a fake untracked entry */
++	IPS_UNTRACKED_BIT = 12,
++	IPS_UNTRACKED = (1 << IPS_UNTRACKED_BIT),
++
++	/* Conntrack got a helper explicitly attached via CT target. */
++	IPS_HELPER_BIT = 13,
++	IPS_HELPER = (1 << IPS_HELPER_BIT),
++};
++
++/* Connection tracking event types */
++enum ip_conntrack_events {
++	IPCT_NEW,		/* new conntrack */
++	IPCT_RELATED,		/* related conntrack */
++	IPCT_DESTROY,		/* destroyed conntrack */
++	IPCT_REPLY,		/* connection has seen two-way traffic */
++	IPCT_ASSURED,		/* connection status has changed to assured */
++	IPCT_PROTOINFO,		/* protocol information has changed */
++	IPCT_HELPER,		/* new helper has been set */
++	IPCT_MARK,		/* new mark has been set */
++	IPCT_NATSEQADJ,		/* NAT is doing sequence adjustment */
++	IPCT_SECMARK,		/* new security mark has been set */
++};
++
++enum ip_conntrack_expect_events {
++	IPEXP_NEW,		/* new expectation */
++	IPEXP_DESTROY,		/* destroyed expectation */
++};
++
++/* expectation flags */
++#define NF_CT_EXPECT_PERMANENT		0x1
++#define NF_CT_EXPECT_INACTIVE		0x2
++#define NF_CT_EXPECT_USERSPACE		0x4
++
++
++#endif /* _UAPI_NF_CONNTRACK_COMMON_H */
+diff --git a/include/linux/netfilter/nfnetlink.h b/include/linux/netfilter/nfnetlink.h
+index 43979ac..4a4efaf 100644
+--- a/include/linux/netfilter/nfnetlink.h
++++ b/include/linux/netfilter/nfnetlink.h
+@@ -1,96 +1,56 @@
+-#ifndef _NFNETLINK_H
+-#define _NFNETLINK_H
++#ifndef _UAPI_NFNETLINK_H
++#define _UAPI_NFNETLINK_H
+ #include <linux/types.h>
+ #include <linux/netfilter/nfnetlink_compat.h>
+ 
+ enum nfnetlink_groups {
+-    NFNLGRP_NONE,
+-#define NFNLGRP_NONE            NFNLGRP_NONE
+-    NFNLGRP_CONNTRACK_NEW,
+-#define NFNLGRP_CONNTRACK_NEW       NFNLGRP_CONNTRACK_NEW
+-    NFNLGRP_CONNTRACK_UPDATE,
+-#define NFNLGRP_CONNTRACK_UPDATE    NFNLGRP_CONNTRACK_UPDATE
+-    NFNLGRP_CONNTRACK_DESTROY,
+-#define NFNLGRP_CONNTRACK_DESTROY   NFNLGRP_CONNTRACK_DESTROY
+-    NFNLGRP_CONNTRACK_EXP_NEW,
+-#define NFNLGRP_CONNTRACK_EXP_NEW   NFNLGRP_CONNTRACK_EXP_NEW
+-    NFNLGRP_CONNTRACK_EXP_UPDATE,
+-#define NFNLGRP_CONNTRACK_EXP_UPDATE    NFNLGRP_CONNTRACK_EXP_UPDATE
+-    NFNLGRP_CONNTRACK_EXP_DESTROY,
+-#define NFNLGRP_CONNTRACK_EXP_DESTROY   NFNLGRP_CONNTRACK_EXP_DESTROY
+-    __NFNLGRP_MAX,
++	NFNLGRP_NONE,
++#define NFNLGRP_NONE			NFNLGRP_NONE
++	NFNLGRP_CONNTRACK_NEW,
++#define NFNLGRP_CONNTRACK_NEW		NFNLGRP_CONNTRACK_NEW
++	NFNLGRP_CONNTRACK_UPDATE,
++#define NFNLGRP_CONNTRACK_UPDATE	NFNLGRP_CONNTRACK_UPDATE
++	NFNLGRP_CONNTRACK_DESTROY,
++#define NFNLGRP_CONNTRACK_DESTROY	NFNLGRP_CONNTRACK_DESTROY
++	NFNLGRP_CONNTRACK_EXP_NEW,
++#define	NFNLGRP_CONNTRACK_EXP_NEW	NFNLGRP_CONNTRACK_EXP_NEW
++	NFNLGRP_CONNTRACK_EXP_UPDATE,
++#define NFNLGRP_CONNTRACK_EXP_UPDATE	NFNLGRP_CONNTRACK_EXP_UPDATE
++	NFNLGRP_CONNTRACK_EXP_DESTROY,
++#define NFNLGRP_CONNTRACK_EXP_DESTROY	NFNLGRP_CONNTRACK_EXP_DESTROY
++	__NFNLGRP_MAX,
+ };
+-#define NFNLGRP_MAX (__NFNLGRP_MAX - 1)
++#define NFNLGRP_MAX	(__NFNLGRP_MAX - 1)
+ 
+ /* General form of address family dependent message.
+  */
+ struct nfgenmsg {
+-    __u8  nfgen_family;     /* AF_xxx */
+-    __u8  version;      /* nfnetlink version */
+-    __be16    res_id;       /* resource id */
++	__u8  nfgen_family;		/* AF_xxx */
++	__u8  version;		/* nfnetlink version */
++	__be16    res_id;		/* resource id */
+ };
+ 
+-#define NFNETLINK_V0    0
++#define NFNETLINK_V0	0
+ 
+ /* netfilter netlink message types are split in two pieces:
+  * 8 bit subsystem, 8bit operation.
+  */
+ 
+-#define NFNL_SUBSYS_ID(x)   ((x & 0xff00) >> 8)
+-#define NFNL_MSG_TYPE(x)    (x & 0x00ff)
++#define NFNL_SUBSYS_ID(x)	((x & 0xff00) >> 8)
++#define NFNL_MSG_TYPE(x)	(x & 0x00ff)
+ 
+ /* No enum here, otherwise __stringify() trick of MODULE_ALIAS_NFNL_SUBSYS()
+  * won't work anymore */
+-#define NFNL_SUBSYS_NONE        0
+-#define NFNL_SUBSYS_CTNETLINK       1
+-#define NFNL_SUBSYS_CTNETLINK_EXP   2
+-#define NFNL_SUBSYS_QUEUE       3
+-#define NFNL_SUBSYS_ULOG        4
+-#define NFNL_SUBSYS_OSF         5
+-#define NFNL_SUBSYS_IPSET       6
+-#define NFNL_SUBSYS_ACCT        7
+-#define NFNL_SUBSYS_CTNETLINK_TIMEOUT   8
+-#define NFNL_SUBSYS_CTHELPER        9
+-#define NFNL_SUBSYS_COUNT       10
+-
+-#ifdef __KERNEL__
+-
+-#include <linux/netlink.h>
+-#include <linux/capability.h>
+-#include <net/netlink.h>
+-
+-struct nfnl_callback {
+-    int (*call)(struct sock *nl, struct sk_buff *skb,
+-            const struct nlmsghdr *nlh,
+-            const struct nlattr * const cda[]);
+-    int (*call_rcu)(struct sock *nl, struct sk_buff *skb,
+-            const struct nlmsghdr *nlh,
+-            const struct nlattr * const cda[]);
+-    const struct nla_policy *policy;    /* netlink attribute policy */
+-    const u_int16_t attr_count;     /* number of nlattr's */
+-};
+-
+-struct nfnetlink_subsystem {
+-    const char *name;
+-    __u8 subsys_id;         /* nfnetlink subsystem ID */
+-    __u8 cb_count;          /* number of callbacks */
+-    const struct nfnl_callback *cb; /* callback for individual types */
+-};
+-
+-extern int nfnetlink_subsys_register(const struct nfnetlink_subsystem *n);
+-extern int nfnetlink_subsys_unregister(const struct nfnetlink_subsystem *n);
+-
+-extern int nfnetlink_has_listeners(struct net *net, unsigned int group);
+-extern int nfnetlink_send(struct sk_buff *skb, struct net *net, u32 pid, unsigned int group,
+-              int echo, gfp_t flags);
+-extern int nfnetlink_set_err(struct net *net, u32 pid, u32 group, int error);
+-extern int nfnetlink_unicast(struct sk_buff *skb, struct net *net, u_int32_t pid, int flags);
+-
+-extern void nfnl_lock(void);
+-extern void nfnl_unlock(void);
+-
+-#define MODULE_ALIAS_NFNL_SUBSYS(subsys) \
+-    MODULE_ALIAS("nfnetlink-subsys-" __stringify(subsys))
+-
+-#endif  /* __KERNEL__ */
+-#endif  /* _NFNETLINK_H */
++#define NFNL_SUBSYS_NONE 		0
++#define NFNL_SUBSYS_CTNETLINK		1
++#define NFNL_SUBSYS_CTNETLINK_EXP	2
++#define NFNL_SUBSYS_QUEUE		3
++#define NFNL_SUBSYS_ULOG		4
++#define NFNL_SUBSYS_OSF			5
++#define NFNL_SUBSYS_IPSET		6
++#define NFNL_SUBSYS_ACCT		7
++#define NFNL_SUBSYS_CTNETLINK_TIMEOUT	8
++#define NFNL_SUBSYS_CTHELPER		9
++#define NFNL_SUBSYS_COUNT		10
++
++#endif /* _UAPI_NFNETLINK_H */
+diff --git a/include/linux/netfilter/nfnetlink_compat.h b/include/linux/netfilter/nfnetlink_compat.h
+new file mode 100644
+index 0000000..ffb9503
+--- /dev/null
++++ b/include/linux/netfilter/nfnetlink_compat.h
+@@ -0,0 +1,63 @@
++#ifndef _NFNETLINK_COMPAT_H
++#define _NFNETLINK_COMPAT_H
++
++#include <linux/types.h>
++
++#ifndef __KERNEL__
++/* Old nfnetlink macros for userspace */
++
++/* nfnetlink groups: Up to 32 maximum */
++#define NF_NETLINK_CONNTRACK_NEW 		0x00000001
++#define NF_NETLINK_CONNTRACK_UPDATE		0x00000002
++#define NF_NETLINK_CONNTRACK_DESTROY		0x00000004
++#define NF_NETLINK_CONNTRACK_EXP_NEW		0x00000008
++#define NF_NETLINK_CONNTRACK_EXP_UPDATE		0x00000010
++#define NF_NETLINK_CONNTRACK_EXP_DESTROY	0x00000020
++
++/* Generic structure for encapsulation optional netfilter information.
++ * It is reminiscent of sockaddr, but with sa_family replaced
++ * with attribute type.
++ * ! This should someday be put somewhere generic as now rtnetlink and
++ * ! nfnetlink use the same attributes methods. - J. Schulist.
++ */
++
++struct nfattr {
++	__u16 nfa_len;
++	__u16 nfa_type;	/* we use 15 bits for the type, and the highest
++				 * bit to indicate whether the payload is nested */
++};
++
++/* FIXME: Apart from NFNL_NFA_NESTED shamelessly copy and pasted from
++ * rtnetlink.h, it's time to put this in a generic file */
++
++#define NFNL_NFA_NEST	0x8000
++#define NFA_TYPE(attr) 	((attr)->nfa_type & 0x7fff)
++
++#define NFA_ALIGNTO     4
++#define NFA_ALIGN(len)	(((len) + NFA_ALIGNTO - 1) & ~(NFA_ALIGNTO - 1))
++#define NFA_OK(nfa,len)	((len) > 0 && (nfa)->nfa_len >= sizeof(struct nfattr) \
++	&& (nfa)->nfa_len <= (len))
++#define NFA_NEXT(nfa,attrlen)	((attrlen) -= NFA_ALIGN((nfa)->nfa_len), \
++	(struct nfattr *)(((char *)(nfa)) + NFA_ALIGN((nfa)->nfa_len)))
++#define NFA_LENGTH(len)	(NFA_ALIGN(sizeof(struct nfattr)) + (len))
++#define NFA_SPACE(len)	NFA_ALIGN(NFA_LENGTH(len))
++#define NFA_DATA(nfa)   ((void *)(((char *)(nfa)) + NFA_LENGTH(0)))
++#define NFA_PAYLOAD(nfa) ((int)((nfa)->nfa_len) - NFA_LENGTH(0))
++#define NFA_NEST(skb, type) \
++({	struct nfattr *__start = (struct nfattr *)skb_tail_pointer(skb); \
++	NFA_PUT(skb, (NFNL_NFA_NEST | type), 0, NULL); \
++	__start;  })
++#define NFA_NEST_END(skb, start) \
++({      (start)->nfa_len = skb_tail_pointer(skb) - (unsigned char *)(start); \
++        (skb)->len; })
++#define NFA_NEST_CANCEL(skb, start) \
++({      if (start) \
++                skb_trim(skb, (unsigned char *) (start) - (skb)->data); \
++        -1; })
++
++#define NFM_NFA(n)      ((struct nfattr *)(((char *)(n)) \
++        + NLMSG_ALIGN(sizeof(struct nfgenmsg))))
++#define NFM_PAYLOAD(n)  NLMSG_PAYLOAD(n, sizeof(struct nfgenmsg))
++
++#endif /* ! __KERNEL__ */
++#endif /* _NFNETLINK_COMPAT_H */
+diff --git a/include/linux/netfilter/nfnetlink_conntrack.h b/include/linux/netfilter/nfnetlink_conntrack.h
+index c91be60..43bfe3e 100644
+--- a/include/linux/netfilter/nfnetlink_conntrack.h
++++ b/include/linux/netfilter/nfnetlink_conntrack.h
+@@ -3,241 +3,245 @@
+ #include <linux/netfilter/nfnetlink.h>
+ 
+ enum cntl_msg_types {
+-    IPCTNL_MSG_CT_NEW,
+-    IPCTNL_MSG_CT_GET,
+-    IPCTNL_MSG_CT_DELETE,
+-    IPCTNL_MSG_CT_GET_CTRZERO,
+-    IPCTNL_MSG_CT_GET_STATS_CPU,
+-    IPCTNL_MSG_CT_GET_STATS,
++	IPCTNL_MSG_CT_NEW,
++	IPCTNL_MSG_CT_GET,
++	IPCTNL_MSG_CT_DELETE,
++	IPCTNL_MSG_CT_GET_CTRZERO,
++	IPCTNL_MSG_CT_GET_STATS_CPU,
++	IPCTNL_MSG_CT_GET_STATS,
+ 
+-    IPCTNL_MSG_MAX
++	IPCTNL_MSG_MAX
+ };
+ 
+ enum ctnl_exp_msg_types {
+-    IPCTNL_MSG_EXP_NEW,
+-    IPCTNL_MSG_EXP_GET,
+-    IPCTNL_MSG_EXP_DELETE,
+-    IPCTNL_MSG_EXP_GET_STATS_CPU,
++	IPCTNL_MSG_EXP_NEW,
++	IPCTNL_MSG_EXP_GET,
++	IPCTNL_MSG_EXP_DELETE,
++	IPCTNL_MSG_EXP_GET_STATS_CPU,
+ 
+-    IPCTNL_MSG_EXP_MAX
++	IPCTNL_MSG_EXP_MAX
+ };
+ 
+ 
+ enum ctattr_type {
+-    CTA_UNSPEC,
+-    CTA_TUPLE_ORIG,
+-    CTA_TUPLE_REPLY,
+-    CTA_STATUS,
+-    CTA_PROTOINFO,
+-    CTA_HELP,
+-    CTA_NAT_SRC,
+-#define CTA_NAT CTA_NAT_SRC /* backwards compatibility */
+-    CTA_TIMEOUT,
+-    CTA_MARK,
+-    CTA_COUNTERS_ORIG,
+-    CTA_COUNTERS_REPLY,
+-    CTA_USE,
+-    CTA_ID,
+-    CTA_NAT_DST,
+-    CTA_TUPLE_MASTER,
+-    CTA_NAT_SEQ_ADJ_ORIG,
+-    CTA_NAT_SEQ_ADJ_REPLY,
+-    CTA_SECMARK,        /* obsolete */
+-    CTA_ZONE,
+-    CTA_SECCTX,
+-    CTA_TIMESTAMP,
+-    CTA_MARK_MASK,
+-    __CTA_MAX
++	CTA_UNSPEC,
++	CTA_TUPLE_ORIG,
++	CTA_TUPLE_REPLY,
++	CTA_STATUS,
++	CTA_PROTOINFO,
++	CTA_HELP,
++	CTA_NAT_SRC,
++#define CTA_NAT	CTA_NAT_SRC	/* backwards compatibility */
++	CTA_TIMEOUT,
++	CTA_MARK,
++	CTA_COUNTERS_ORIG,
++	CTA_COUNTERS_REPLY,
++	CTA_USE,
++	CTA_ID,
++	CTA_NAT_DST,
++	CTA_TUPLE_MASTER,
++	CTA_NAT_SEQ_ADJ_ORIG,
++	CTA_NAT_SEQ_ADJ_REPLY,
++	CTA_SECMARK,		/* obsolete */
++	CTA_ZONE,
++	CTA_SECCTX,
++	CTA_TIMESTAMP,
++	CTA_MARK_MASK,
++	__CTA_MAX
+ };
+ #define CTA_MAX (__CTA_MAX - 1)
+ 
+ enum ctattr_tuple {
+-    CTA_TUPLE_UNSPEC,
+-    CTA_TUPLE_IP,
+-    CTA_TUPLE_PROTO,
+-    __CTA_TUPLE_MAX
++	CTA_TUPLE_UNSPEC,
++	CTA_TUPLE_IP,
++	CTA_TUPLE_PROTO,
++	__CTA_TUPLE_MAX
+ };
+ #define CTA_TUPLE_MAX (__CTA_TUPLE_MAX - 1)
+ 
+ enum ctattr_ip {
+-    CTA_IP_UNSPEC,
+-    CTA_IP_V4_SRC,
+-    CTA_IP_V4_DST,
+-    CTA_IP_V6_SRC,
+-    CTA_IP_V6_DST,
+-    __CTA_IP_MAX
++	CTA_IP_UNSPEC,
++	CTA_IP_V4_SRC,
++	CTA_IP_V4_DST,
++	CTA_IP_V6_SRC,
++	CTA_IP_V6_DST,
++	__CTA_IP_MAX
+ };
+ #define CTA_IP_MAX (__CTA_IP_MAX - 1)
+ 
+ enum ctattr_l4proto {
+-    CTA_PROTO_UNSPEC,
+-    CTA_PROTO_NUM,
+-    CTA_PROTO_SRC_PORT,
+-    CTA_PROTO_DST_PORT,
+-    CTA_PROTO_ICMP_ID,
+-    CTA_PROTO_ICMP_TYPE,
+-    CTA_PROTO_ICMP_CODE,
+-    CTA_PROTO_ICMPV6_ID,
+-    CTA_PROTO_ICMPV6_TYPE,
+-    CTA_PROTO_ICMPV6_CODE,
+-    __CTA_PROTO_MAX
++	CTA_PROTO_UNSPEC,
++	CTA_PROTO_NUM,
++	CTA_PROTO_SRC_PORT,
++	CTA_PROTO_DST_PORT,
++	CTA_PROTO_ICMP_ID,
++	CTA_PROTO_ICMP_TYPE,
++	CTA_PROTO_ICMP_CODE,
++	CTA_PROTO_ICMPV6_ID,
++	CTA_PROTO_ICMPV6_TYPE,
++	CTA_PROTO_ICMPV6_CODE,
++	__CTA_PROTO_MAX
+ };
+ #define CTA_PROTO_MAX (__CTA_PROTO_MAX - 1)
+ 
+ enum ctattr_protoinfo {
+-    CTA_PROTOINFO_UNSPEC,
+-    CTA_PROTOINFO_TCP,
+-    CTA_PROTOINFO_DCCP,
+-    CTA_PROTOINFO_SCTP,
+-    __CTA_PROTOINFO_MAX
++	CTA_PROTOINFO_UNSPEC,
++	CTA_PROTOINFO_TCP,
++	CTA_PROTOINFO_DCCP,
++	CTA_PROTOINFO_SCTP,
++	__CTA_PROTOINFO_MAX
+ };
+ #define CTA_PROTOINFO_MAX (__CTA_PROTOINFO_MAX - 1)
+ 
+ enum ctattr_protoinfo_tcp {
+-    CTA_PROTOINFO_TCP_UNSPEC,
+-    CTA_PROTOINFO_TCP_STATE,
+-    CTA_PROTOINFO_TCP_WSCALE_ORIGINAL,
+-    CTA_PROTOINFO_TCP_WSCALE_REPLY,
+-    CTA_PROTOINFO_TCP_FLAGS_ORIGINAL,
+-    CTA_PROTOINFO_TCP_FLAGS_REPLY,
+-    __CTA_PROTOINFO_TCP_MAX
++	CTA_PROTOINFO_TCP_UNSPEC,
++	CTA_PROTOINFO_TCP_STATE,
++	CTA_PROTOINFO_TCP_WSCALE_ORIGINAL,
++	CTA_PROTOINFO_TCP_WSCALE_REPLY,
++	CTA_PROTOINFO_TCP_FLAGS_ORIGINAL,
++	CTA_PROTOINFO_TCP_FLAGS_REPLY,
++	__CTA_PROTOINFO_TCP_MAX
+ };
+ #define CTA_PROTOINFO_TCP_MAX (__CTA_PROTOINFO_TCP_MAX - 1)
+ 
+ enum ctattr_protoinfo_dccp {
+-    CTA_PROTOINFO_DCCP_UNSPEC,
+-    CTA_PROTOINFO_DCCP_STATE,
+-    CTA_PROTOINFO_DCCP_ROLE,
+-    CTA_PROTOINFO_DCCP_HANDSHAKE_SEQ,
+-    __CTA_PROTOINFO_DCCP_MAX,
++	CTA_PROTOINFO_DCCP_UNSPEC,
++	CTA_PROTOINFO_DCCP_STATE,
++	CTA_PROTOINFO_DCCP_ROLE,
++	CTA_PROTOINFO_DCCP_HANDSHAKE_SEQ,
++	__CTA_PROTOINFO_DCCP_MAX,
+ };
+ #define CTA_PROTOINFO_DCCP_MAX (__CTA_PROTOINFO_DCCP_MAX - 1)
+ 
+ enum ctattr_protoinfo_sctp {
+-    CTA_PROTOINFO_SCTP_UNSPEC,
+-    CTA_PROTOINFO_SCTP_STATE,
+-    CTA_PROTOINFO_SCTP_VTAG_ORIGINAL,
+-    CTA_PROTOINFO_SCTP_VTAG_REPLY,
+-    __CTA_PROTOINFO_SCTP_MAX
++	CTA_PROTOINFO_SCTP_UNSPEC,
++	CTA_PROTOINFO_SCTP_STATE,
++	CTA_PROTOINFO_SCTP_VTAG_ORIGINAL,
++	CTA_PROTOINFO_SCTP_VTAG_REPLY,
++	__CTA_PROTOINFO_SCTP_MAX
+ };
+ #define CTA_PROTOINFO_SCTP_MAX (__CTA_PROTOINFO_SCTP_MAX - 1)
+ 
+ enum ctattr_counters {
+-    CTA_COUNTERS_UNSPEC,
+-    CTA_COUNTERS_PACKETS,       /* 64bit counters */
+-    CTA_COUNTERS_BYTES,     /* 64bit counters */
+-    CTA_COUNTERS32_PACKETS,     /* old 32bit counters, unused */
+-    CTA_COUNTERS32_BYTES,       /* old 32bit counters, unused */
+-    __CTA_COUNTERS_MAX
++	CTA_COUNTERS_UNSPEC,
++	CTA_COUNTERS_PACKETS,		/* 64bit counters */
++	CTA_COUNTERS_BYTES,		/* 64bit counters */
++	CTA_COUNTERS32_PACKETS,		/* old 32bit counters, unused */
++	CTA_COUNTERS32_BYTES,		/* old 32bit counters, unused */
++	__CTA_COUNTERS_MAX
+ };
+ #define CTA_COUNTERS_MAX (__CTA_COUNTERS_MAX - 1)
+ 
+ enum ctattr_tstamp {
+-    CTA_TIMESTAMP_UNSPEC,
+-    CTA_TIMESTAMP_START,
+-    CTA_TIMESTAMP_STOP,
+-    __CTA_TIMESTAMP_MAX
++	CTA_TIMESTAMP_UNSPEC,
++	CTA_TIMESTAMP_START,
++	CTA_TIMESTAMP_STOP,
++	__CTA_TIMESTAMP_MAX
+ };
+ #define CTA_TIMESTAMP_MAX (__CTA_TIMESTAMP_MAX - 1)
+ 
+ enum ctattr_nat {
+-    CTA_NAT_UNSPEC,
+-    CTA_NAT_MINIP,
+-    CTA_NAT_MAXIP,
+-    CTA_NAT_PROTO,
+-    __CTA_NAT_MAX
++	CTA_NAT_UNSPEC,
++	CTA_NAT_V4_MINIP,
++#define CTA_NAT_MINIP CTA_NAT_V4_MINIP
++	CTA_NAT_V4_MAXIP,
++#define CTA_NAT_MAXIP CTA_NAT_V4_MAXIP
++	CTA_NAT_PROTO,
++	CTA_NAT_V6_MINIP,
++	CTA_NAT_V6_MAXIP,
++	__CTA_NAT_MAX
+ };
+ #define CTA_NAT_MAX (__CTA_NAT_MAX - 1)
+ 
+ enum ctattr_protonat {
+-    CTA_PROTONAT_UNSPEC,
+-    CTA_PROTONAT_PORT_MIN,
+-    CTA_PROTONAT_PORT_MAX,
+-    __CTA_PROTONAT_MAX
++	CTA_PROTONAT_UNSPEC,
++	CTA_PROTONAT_PORT_MIN,
++	CTA_PROTONAT_PORT_MAX,
++	__CTA_PROTONAT_MAX
+ };
+ #define CTA_PROTONAT_MAX (__CTA_PROTONAT_MAX - 1)
+ 
+ enum ctattr_natseq {
+-    CTA_NAT_SEQ_UNSPEC,
+-    CTA_NAT_SEQ_CORRECTION_POS,
+-    CTA_NAT_SEQ_OFFSET_BEFORE,
+-    CTA_NAT_SEQ_OFFSET_AFTER,
+-    __CTA_NAT_SEQ_MAX
++	CTA_NAT_SEQ_UNSPEC,
++	CTA_NAT_SEQ_CORRECTION_POS,
++	CTA_NAT_SEQ_OFFSET_BEFORE,
++	CTA_NAT_SEQ_OFFSET_AFTER,
++	__CTA_NAT_SEQ_MAX
+ };
+ #define CTA_NAT_SEQ_MAX (__CTA_NAT_SEQ_MAX - 1)
+ 
+ enum ctattr_expect {
+-    CTA_EXPECT_UNSPEC,
+-    CTA_EXPECT_MASTER,
+-    CTA_EXPECT_TUPLE,
+-    CTA_EXPECT_MASK,
+-    CTA_EXPECT_TIMEOUT,
+-    CTA_EXPECT_ID,
+-    CTA_EXPECT_HELP_NAME,
+-    CTA_EXPECT_ZONE,
+-    CTA_EXPECT_FLAGS,
+-    CTA_EXPECT_CLASS,
+-    CTA_EXPECT_NAT,
+-    CTA_EXPECT_FN,
+-    __CTA_EXPECT_MAX
++	CTA_EXPECT_UNSPEC,
++	CTA_EXPECT_MASTER,
++	CTA_EXPECT_TUPLE,
++	CTA_EXPECT_MASK,
++	CTA_EXPECT_TIMEOUT,
++	CTA_EXPECT_ID,
++	CTA_EXPECT_HELP_NAME,
++	CTA_EXPECT_ZONE,
++	CTA_EXPECT_FLAGS,
++	CTA_EXPECT_CLASS,
++	CTA_EXPECT_NAT,
++	CTA_EXPECT_FN,
++	__CTA_EXPECT_MAX
+ };
+ #define CTA_EXPECT_MAX (__CTA_EXPECT_MAX - 1)
+ 
+ enum ctattr_expect_nat {
+-    CTA_EXPECT_NAT_UNSPEC,
+-    CTA_EXPECT_NAT_DIR,
+-    CTA_EXPECT_NAT_TUPLE,
+-    __CTA_EXPECT_NAT_MAX
++	CTA_EXPECT_NAT_UNSPEC,
++	CTA_EXPECT_NAT_DIR,
++	CTA_EXPECT_NAT_TUPLE,
++	__CTA_EXPECT_NAT_MAX
+ };
+ #define CTA_EXPECT_NAT_MAX (__CTA_EXPECT_NAT_MAX - 1)
+ 
+ enum ctattr_help {
+-    CTA_HELP_UNSPEC,
+-    CTA_HELP_NAME,
+-    CTA_HELP_INFO,
+-    __CTA_HELP_MAX
++	CTA_HELP_UNSPEC,
++	CTA_HELP_NAME,
++	CTA_HELP_INFO,
++	__CTA_HELP_MAX
+ };
+ #define CTA_HELP_MAX (__CTA_HELP_MAX - 1)
+ 
+ enum ctattr_secctx {
+-    CTA_SECCTX_UNSPEC,
+-    CTA_SECCTX_NAME,
+-    __CTA_SECCTX_MAX
++	CTA_SECCTX_UNSPEC,
++	CTA_SECCTX_NAME,
++	__CTA_SECCTX_MAX
+ };
+ #define CTA_SECCTX_MAX (__CTA_SECCTX_MAX - 1)
+ 
+ enum ctattr_stats_cpu {
+-    CTA_STATS_UNSPEC,
+-    CTA_STATS_SEARCHED,
+-    CTA_STATS_FOUND,
+-    CTA_STATS_NEW,
+-    CTA_STATS_INVALID,
+-    CTA_STATS_IGNORE,
+-    CTA_STATS_DELETE,
+-    CTA_STATS_DELETE_LIST,
+-    CTA_STATS_INSERT,
+-    CTA_STATS_INSERT_FAILED,
+-    CTA_STATS_DROP,
+-    CTA_STATS_EARLY_DROP,
+-    CTA_STATS_ERROR,
+-    CTA_STATS_SEARCH_RESTART,
+-    __CTA_STATS_MAX,
++	CTA_STATS_UNSPEC,
++	CTA_STATS_SEARCHED,
++	CTA_STATS_FOUND,
++	CTA_STATS_NEW,
++	CTA_STATS_INVALID,
++	CTA_STATS_IGNORE,
++	CTA_STATS_DELETE,
++	CTA_STATS_DELETE_LIST,
++	CTA_STATS_INSERT,
++	CTA_STATS_INSERT_FAILED,
++	CTA_STATS_DROP,
++	CTA_STATS_EARLY_DROP,
++	CTA_STATS_ERROR,
++	CTA_STATS_SEARCH_RESTART,
++	__CTA_STATS_MAX,
+ };
+ #define CTA_STATS_MAX (__CTA_STATS_MAX - 1)
+ 
+ enum ctattr_stats_global {
+-    CTA_STATS_GLOBAL_UNSPEC,
+-    CTA_STATS_GLOBAL_ENTRIES,
+-    __CTA_STATS_GLOBAL_MAX,
++	CTA_STATS_GLOBAL_UNSPEC,
++	CTA_STATS_GLOBAL_ENTRIES,
++	__CTA_STATS_GLOBAL_MAX,
+ };
+ #define CTA_STATS_GLOBAL_MAX (__CTA_STATS_GLOBAL_MAX - 1)
+ 
+ enum ctattr_expect_stats {
+-    CTA_STATS_EXP_UNSPEC,
+-    CTA_STATS_EXP_NEW,
+-    CTA_STATS_EXP_CREATE,
+-    CTA_STATS_EXP_DELETE,
+-    __CTA_STATS_EXP_MAX,
++	CTA_STATS_EXP_UNSPEC,
++	CTA_STATS_EXP_NEW,
++	CTA_STATS_EXP_CREATE,
++	CTA_STATS_EXP_DELETE,
++	__CTA_STATS_EXP_MAX,
+ };
+ #define CTA_STATS_EXP_MAX (__CTA_STATS_EXP_MAX - 1)
+ 
+diff --git a/include/linux/netfilter/nfnetlink_queue.h b/include/linux/netfilter/nfnetlink_queue.h
+index 5fcd48c..70ec8c2 100644
+--- a/include/linux/netfilter/nfnetlink_queue.h
++++ b/include/linux/netfilter/nfnetlink_queue.h
+@@ -5,96 +5,97 @@
+ #include <linux/netfilter/nfnetlink.h>
+ 
+ enum nfqnl_msg_types {
+-    NFQNL_MSG_PACKET,       /* packet from kernel to userspace */
+-    NFQNL_MSG_VERDICT,      /* verdict from userspace to kernel */
+-    NFQNL_MSG_CONFIG,       /* connect to a particular queue */
+-    NFQNL_MSG_VERDICT_BATCH,    /* batchv from userspace to kernel */
++	NFQNL_MSG_PACKET,		/* packet from kernel to userspace */
++	NFQNL_MSG_VERDICT,		/* verdict from userspace to kernel */
++	NFQNL_MSG_CONFIG,		/* connect to a particular queue */
++	NFQNL_MSG_VERDICT_BATCH,	/* batchv from userspace to kernel */
+ 
+-    NFQNL_MSG_MAX
++	NFQNL_MSG_MAX
+ };
+ 
+ struct nfqnl_msg_packet_hdr {
+-    __be32      packet_id;  /* unique ID of packet in queue */
+-    __be16      hw_protocol;    /* hw protocol (network order) */
+-    __u8    hook;       /* netfilter hook */
++	__be32		packet_id;	/* unique ID of packet in queue */
++	__be16		hw_protocol;	/* hw protocol (network order) */
++	__u8	hook;		/* netfilter hook */
+ } __attribute__ ((packed));
+ 
+ struct nfqnl_msg_packet_hw {
+-    __be16      hw_addrlen;
+-    __u16   _pad;
+-    __u8    hw_addr[8];
++	__be16		hw_addrlen;
++	__u16	_pad;
++	__u8	hw_addr[8];
+ };
+ 
+ struct nfqnl_msg_packet_timestamp {
+-    __aligned_be64  sec;
+-    __aligned_be64  usec;
++	__aligned_be64	sec;
++	__aligned_be64	usec;
+ };
+ 
+ enum nfqnl_attr_type {
+-    NFQA_UNSPEC,
+-    NFQA_PACKET_HDR,
+-    NFQA_VERDICT_HDR,       /* nfqnl_msg_verdict_hrd */
+-    NFQA_MARK,          /* __u32 nfmark */
+-    NFQA_TIMESTAMP,         /* nfqnl_msg_packet_timestamp */
+-    NFQA_IFINDEX_INDEV,     /* __u32 ifindex */
+-    NFQA_IFINDEX_OUTDEV,        /* __u32 ifindex */
+-    NFQA_IFINDEX_PHYSINDEV,     /* __u32 ifindex */
+-    NFQA_IFINDEX_PHYSOUTDEV,    /* __u32 ifindex */
+-    NFQA_HWADDR,            /* nfqnl_msg_packet_hw */
+-    NFQA_PAYLOAD,           /* opaque data payload */
+-    NFQA_CT,            /* nf_conntrack_netlink.h */
+-    NFQA_CT_INFO,           /* enum ip_conntrack_info */
+-
+-    __NFQA_MAX
++	NFQA_UNSPEC,
++	NFQA_PACKET_HDR,
++	NFQA_VERDICT_HDR,		/* nfqnl_msg_verdict_hrd */
++	NFQA_MARK,			/* __u32 nfmark */
++	NFQA_TIMESTAMP,			/* nfqnl_msg_packet_timestamp */
++	NFQA_IFINDEX_INDEV,		/* __u32 ifindex */
++	NFQA_IFINDEX_OUTDEV,		/* __u32 ifindex */
++	NFQA_IFINDEX_PHYSINDEV,		/* __u32 ifindex */
++	NFQA_IFINDEX_PHYSOUTDEV,	/* __u32 ifindex */
++	NFQA_HWADDR,			/* nfqnl_msg_packet_hw */
++	NFQA_PAYLOAD,			/* opaque data payload */
++	NFQA_CT,			/* nf_conntrack_netlink.h */
++	NFQA_CT_INFO,			/* enum ip_conntrack_info */
++	NFQA_CAP_LEN,			/* __u32 length of captured packet */
++
++	__NFQA_MAX
+ };
+ #define NFQA_MAX (__NFQA_MAX - 1)
+ 
+ struct nfqnl_msg_verdict_hdr {
+-    __be32 verdict;
+-    __be32 id;
++	__be32 verdict;
++	__be32 id;
+ };
+ 
+ 
+ enum nfqnl_msg_config_cmds {
+-    NFQNL_CFG_CMD_NONE,
+-    NFQNL_CFG_CMD_BIND,
+-    NFQNL_CFG_CMD_UNBIND,
+-    NFQNL_CFG_CMD_PF_BIND,
+-    NFQNL_CFG_CMD_PF_UNBIND,
++	NFQNL_CFG_CMD_NONE,
++	NFQNL_CFG_CMD_BIND,
++	NFQNL_CFG_CMD_UNBIND,
++	NFQNL_CFG_CMD_PF_BIND,
++	NFQNL_CFG_CMD_PF_UNBIND,
+ };
+ 
+ struct nfqnl_msg_config_cmd {
+-    __u8    command;    /* nfqnl_msg_config_cmds */
+-    __u8    _pad;
+-    __be16      pf;     /* AF_xxx for PF_[UN]BIND */
++	__u8	command;	/* nfqnl_msg_config_cmds */
++	__u8	_pad;
++	__be16		pf;		/* AF_xxx for PF_[UN]BIND */
+ };
+ 
+ enum nfqnl_config_mode {
+-    NFQNL_COPY_NONE,
+-    NFQNL_COPY_META,
+-    NFQNL_COPY_PACKET,
++	NFQNL_COPY_NONE,
++	NFQNL_COPY_META,
++	NFQNL_COPY_PACKET,
+ };
+ 
+ struct nfqnl_msg_config_params {
+-    __be32      copy_range;
+-    __u8    copy_mode;  /* enum nfqnl_config_mode */
++	__be32		copy_range;
++	__u8	copy_mode;	/* enum nfqnl_config_mode */
+ } __attribute__ ((packed));
+ 
+ 
+ enum nfqnl_attr_config {
+-    NFQA_CFG_UNSPEC,
+-    NFQA_CFG_CMD,           /* nfqnl_msg_config_cmd */
+-    NFQA_CFG_PARAMS,        /* nfqnl_msg_config_params */
+-    NFQA_CFG_QUEUE_MAXLEN,      /* __u32 */
+-    NFQA_CFG_MASK,          /* identify which flags to change */
+-    NFQA_CFG_FLAGS,         /* value of these flags (__u32) */
+-    __NFQA_CFG_MAX
++	NFQA_CFG_UNSPEC,
++	NFQA_CFG_CMD,			/* nfqnl_msg_config_cmd */
++	NFQA_CFG_PARAMS,		/* nfqnl_msg_config_params */
++	NFQA_CFG_QUEUE_MAXLEN,		/* __u32 */
++	NFQA_CFG_MASK,			/* identify which flags to change */
++	NFQA_CFG_FLAGS,			/* value of these flags (__u32) */
++	__NFQA_CFG_MAX
+ };
+ #define NFQA_CFG_MAX (__NFQA_CFG_MAX-1)
+ 
+ /* Flags for NFQA_CFG_FLAGS */
+-#define NFQA_CFG_F_FAIL_OPEN            (1 << 0)
+-#define NFQA_CFG_F_CONNTRACK            (1 << 1)
+-#define NFQA_CFG_F_MAX              (1 << 2)
++#define NFQA_CFG_F_FAIL_OPEN			(1 << 0)
++#define NFQA_CFG_F_CONNTRACK			(1 << 1)
++#define NFQA_CFG_F_MAX				(1 << 2)
+ 
+ #endif /* _NFNETLINK_QUEUE_H */
+-- 
+1.7.10.4
+
diff --git a/package/libnl/libnl-3.2.16-0003-Re-adding-defines-for-__aligned_be64-for-older-kerne.patch b/package/libnl/libnl-3.2.16-0003-Re-adding-defines-for-__aligned_be64-for-older-kerne.patch
new file mode 100644
index 0000000..ba71c80
--- /dev/null
+++ b/package/libnl/libnl-3.2.16-0003-Re-adding-defines-for-__aligned_be64-for-older-kerne.patch
@@ -0,0 +1,43 @@
+From 25c407c71f3e11b0581bb8fb83dc7b3aa53a9c94 Mon Sep 17 00:00:00 2001
+From: Rich Fought <rmf.aero@gmail.com>
+Date: Thu, 13 Dec 2012 14:23:28 -0800
+Subject: [PATCH 3/3] Re-adding #defines for __aligned_be64 for older kernels
+
+---
+ include/linux/netfilter/nfnetlink_log.h   |    4 ++++
+ include/linux/netfilter/nfnetlink_queue.h |    4 ++++
+ 2 files changed, 8 insertions(+)
+
+diff --git a/include/linux/netfilter/nfnetlink_log.h b/include/linux/netfilter/nfnetlink_log.h
+index 90c2c95..2cfbf13 100644
+--- a/include/linux/netfilter/nfnetlink_log.h
++++ b/include/linux/netfilter/nfnetlink_log.h
+@@ -5,6 +5,10 @@
+  * and not any kind of function definitions.  It is shared between kernel and
+  * userspace.  Don't put kernel specific stuff in here */
+ 
++#ifndef __aligned_be64
++#define __aligned_be64 u_int64_t __attribute__((aligned(8)))
++#endif
++
+ #include <linux/types.h>
+ #include <linux/netfilter/nfnetlink.h>
+ 
+diff --git a/include/linux/netfilter/nfnetlink_queue.h b/include/linux/netfilter/nfnetlink_queue.h
+index 70ec8c2..95af967 100644
+--- a/include/linux/netfilter/nfnetlink_queue.h
++++ b/include/linux/netfilter/nfnetlink_queue.h
+@@ -4,6 +4,10 @@
+ #include <linux/types.h>
+ #include <linux/netfilter/nfnetlink.h>
+ 
++#ifndef __aligned_be64
++#define __aligned_be64 u_int64_t __attribute__((aligned(8)))
++#endif
++
+ enum nfqnl_msg_types {
+ 	NFQNL_MSG_PACKET,		/* packet from kernel to userspace */
+ 	NFQNL_MSG_VERDICT,		/* verdict from userspace to kernel */
+-- 
+1.7.10.4
+
-- 
1.7.10.4
