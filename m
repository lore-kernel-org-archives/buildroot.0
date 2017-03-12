From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 12 Mar 2017 19:18:06 +0200
Subject: [Buildroot] [PATCH] libnl: bump to version 3.2.29
Message-ID: <ba0a3fc34ab165fa4434c71e4547811a078f70e1.1489339086.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Include upstream equivalent patch to fix build with older kernel headers. This
fixes build failures caused by the previous (reverted) version bump:
http://autobuild.buildroot.net/results/563/563f46e9a11f9e3b174a4e1308444f284d1b3421/
http://autobuild.buildroot.net/results/970/970463b628d9c81d5e217e92a455d2e05d0aa89e/
http://autobuild.buildroot.net/results/cee/ceea635a9d620398cbcd44ccb859b07bf6682780/

Add libc-compat.h patch to make it work for musl libc.

Add another upstream patch to fix both missing strerror_l() implementation,
and optionally missing locale support in uClibc-ng:
http://autobuild.buildroot.net/results/dce/dce5d21c27df57ac96d9302752dd1802e7a9786b/
http://autobuild.buildroot.net/results/c4b/c4b1c3f396ddd1d9242aed0953558606f929d57d/
http://autobuild.buildroot.net/results/44d/44dd3db6cdda4646fa12ccf243d6aca16bed3c90/

Add host-pkgconf dependency, since configure.ac uses PKG_CHECK_MODULES.

Add optional dependency on the 'check' package.

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .../0001-fix-libc-kernel-headers-conflict.patch    | 756 +++++++++++++++++++++
 ...musl-workaround-to-the-libc-compat.h-copy.patch |  37 +
 ...usage-of-strerror_l-if-it-doesn-t-exist-i.patch | 106 +++
 package/libnl/libnl.hash                           |   4 +-
 package/libnl/libnl.mk                             |  13 +-
 5 files changed, 912 insertions(+), 4 deletions(-)
 create mode 100644 package/libnl/0001-fix-libc-kernel-headers-conflict.patch
 create mode 100644 package/libnl/0003-Add-musl-workaround-to-the-libc-compat.h-copy.patch
 create mode 100644 package/libnl/0004-lib-escape-usage-of-strerror_l-if-it-doesn-t-exist-i.patch

diff --git a/package/libnl/0001-fix-libc-kernel-headers-conflict.patch b/package/libnl/0001-fix-libc-kernel-headers-conflict.patch
new file mode 100644
index 000000000000..d9dfc6e1832a
--- /dev/null
+++ b/package/libnl/0001-fix-libc-kernel-headers-conflict.patch
@@ -0,0 +1,756 @@
+Fix libc kernel headers conflict
+
+Add missing kernel headers to fix conflicts with toolchain provided kernel
+headers of older versions.
+
+This patch is equivalent to upstream commit 6c7f4215003 ("build: distribute
+in.h in6.h libc-compat.h"). These files are present in upstream git repo, but
+are missing from the distributed tarball.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+
+--- /dev/null
++++ b/include/linux-private/linux/in.h
+@@ -0,0 +1,299 @@
++/*
++ * INET		An implementation of the TCP/IP protocol suite for the LINUX
++ *		operating system.  INET is implemented using the  BSD Socket
++ *		interface as the means of communication with the user level.
++ *
++ *		Definitions of the Internet Protocol.
++ *
++ * Version:	@(#)in.h	1.0.1	04/21/93
++ *
++ * Authors:	Original taken from the GNU Project <netinet/in.h> file.
++ *		Fred N. van Kempen, <waltje@uWalt.NL.Mugnet.ORG>
++ *
++ *		This program is free software; you can redistribute it and/or
++ *		modify it under the terms of the GNU General Public License
++ *		as published by the Free Software Foundation; either version
++ *		2 of the License, or (at your option) any later version.
++ */
++#ifndef _LINUX_IN_H
++#define _LINUX_IN_H
++
++#include <linux/types.h>
++#include <linux/libc-compat.h>
++#include <linux/socket.h>
++
++#if __UAPI_DEF_IN_IPPROTO
++/* Standard well-defined IP protocols.  */
++enum {
++  IPPROTO_IP = 0,		/* Dummy protocol for TCP		*/
++#define IPPROTO_IP		IPPROTO_IP
++  IPPROTO_ICMP = 1,		/* Internet Control Message Protocol	*/
++#define IPPROTO_ICMP		IPPROTO_ICMP
++  IPPROTO_IGMP = 2,		/* Internet Group Management Protocol	*/
++#define IPPROTO_IGMP		IPPROTO_IGMP
++  IPPROTO_IPIP = 4,		/* IPIP tunnels (older KA9Q tunnels use 94) */
++#define IPPROTO_IPIP		IPPROTO_IPIP
++  IPPROTO_TCP = 6,		/* Transmission Control Protocol	*/
++#define IPPROTO_TCP		IPPROTO_TCP
++  IPPROTO_EGP = 8,		/* Exterior Gateway Protocol		*/
++#define IPPROTO_EGP		IPPROTO_EGP
++  IPPROTO_PUP = 12,		/* PUP protocol				*/
++#define IPPROTO_PUP		IPPROTO_PUP
++  IPPROTO_UDP = 17,		/* User Datagram Protocol		*/
++#define IPPROTO_UDP		IPPROTO_UDP
++  IPPROTO_IDP = 22,		/* XNS IDP protocol			*/
++#define IPPROTO_IDP		IPPROTO_IDP
++  IPPROTO_TP = 29,		/* SO Transport Protocol Class 4	*/
++#define IPPROTO_TP		IPPROTO_TP
++  IPPROTO_DCCP = 33,		/* Datagram Congestion Control Protocol */
++#define IPPROTO_DCCP		IPPROTO_DCCP
++  IPPROTO_IPV6 = 41,		/* IPv6-in-IPv4 tunnelling		*/
++#define IPPROTO_IPV6		IPPROTO_IPV6
++  IPPROTO_RSVP = 46,		/* RSVP Protocol			*/
++#define IPPROTO_RSVP		IPPROTO_RSVP
++  IPPROTO_GRE = 47,		/* Cisco GRE tunnels (rfc 1701,1702)	*/
++#define IPPROTO_GRE		IPPROTO_GRE
++  IPPROTO_ESP = 50,		/* Encapsulation Security Payload protocol */
++#define IPPROTO_ESP		IPPROTO_ESP
++  IPPROTO_AH = 51,		/* Authentication Header protocol	*/
++#define IPPROTO_AH		IPPROTO_AH
++  IPPROTO_MTP = 92,		/* Multicast Transport Protocol		*/
++#define IPPROTO_MTP		IPPROTO_MTP
++  IPPROTO_BEETPH = 94,		/* IP option pseudo header for BEET	*/
++#define IPPROTO_BEETPH		IPPROTO_BEETPH
++  IPPROTO_ENCAP = 98,		/* Encapsulation Header			*/
++#define IPPROTO_ENCAP		IPPROTO_ENCAP
++  IPPROTO_PIM = 103,		/* Protocol Independent Multicast	*/
++#define IPPROTO_PIM		IPPROTO_PIM
++  IPPROTO_COMP = 108,		/* Compression Header Protocol		*/
++#define IPPROTO_COMP		IPPROTO_COMP
++  IPPROTO_SCTP = 132,		/* Stream Control Transport Protocol	*/
++#define IPPROTO_SCTP		IPPROTO_SCTP
++  IPPROTO_UDPLITE = 136,	/* UDP-Lite (RFC 3828)			*/
++#define IPPROTO_UDPLITE		IPPROTO_UDPLITE
++  IPPROTO_MPLS = 137,		/* MPLS in IP (RFC 4023)		*/
++#define IPPROTO_MPLS		IPPROTO_MPLS
++  IPPROTO_RAW = 255,		/* Raw IP packets			*/
++#define IPPROTO_RAW		IPPROTO_RAW
++  IPPROTO_MAX
++};
++#endif
++
++#if __UAPI_DEF_IN_ADDR
++/* Internet address. */
++struct in_addr {
++	__be32	s_addr;
++};
++#endif
++
++#define IP_TOS		1
++#define IP_TTL		2
++#define IP_HDRINCL	3
++#define IP_OPTIONS	4
++#define IP_ROUTER_ALERT	5
++#define IP_RECVOPTS	6
++#define IP_RETOPTS	7
++#define IP_PKTINFO	8
++#define IP_PKTOPTIONS	9
++#define IP_MTU_DISCOVER	10
++#define IP_RECVERR	11
++#define IP_RECVTTL	12
++#define	IP_RECVTOS	13
++#define IP_MTU		14
++#define IP_FREEBIND	15
++#define IP_IPSEC_POLICY	16
++#define IP_XFRM_POLICY	17
++#define IP_PASSSEC	18
++#define IP_TRANSPARENT	19
++
++/* BSD compatibility */
++#define IP_RECVRETOPTS	IP_RETOPTS
++
++/* TProxy original addresses */
++#define IP_ORIGDSTADDR       20
++#define IP_RECVORIGDSTADDR   IP_ORIGDSTADDR
++
++#define IP_MINTTL       21
++#define IP_NODEFRAG     22
++#define IP_CHECKSUM	23
++#define IP_BIND_ADDRESS_NO_PORT	24
++
++/* IP_MTU_DISCOVER values */
++#define IP_PMTUDISC_DONT		0	/* Never send DF frames */
++#define IP_PMTUDISC_WANT		1	/* Use per route hints	*/
++#define IP_PMTUDISC_DO			2	/* Always DF		*/
++#define IP_PMTUDISC_PROBE		3       /* Ignore dst pmtu      */
++/* Always use interface mtu (ignores dst pmtu) but don't set DF flag.
++ * Also incoming ICMP frag_needed notifications will be ignored on
++ * this socket to prevent accepting spoofed ones.
++ */
++#define IP_PMTUDISC_INTERFACE		4
++/* weaker version of IP_PMTUDISC_INTERFACE, which allos packets to get
++ * fragmented if they exeed the interface mtu
++ */
++#define IP_PMTUDISC_OMIT		5
++
++#define IP_MULTICAST_IF			32
++#define IP_MULTICAST_TTL 		33
++#define IP_MULTICAST_LOOP 		34
++#define IP_ADD_MEMBERSHIP		35
++#define IP_DROP_MEMBERSHIP		36
++#define IP_UNBLOCK_SOURCE		37
++#define IP_BLOCK_SOURCE			38
++#define IP_ADD_SOURCE_MEMBERSHIP	39
++#define IP_DROP_SOURCE_MEMBERSHIP	40
++#define IP_MSFILTER			41
++#define MCAST_JOIN_GROUP		42
++#define MCAST_BLOCK_SOURCE		43
++#define MCAST_UNBLOCK_SOURCE		44
++#define MCAST_LEAVE_GROUP		45
++#define MCAST_JOIN_SOURCE_GROUP		46
++#define MCAST_LEAVE_SOURCE_GROUP	47
++#define MCAST_MSFILTER			48
++#define IP_MULTICAST_ALL		49
++#define IP_UNICAST_IF			50
++
++#define MCAST_EXCLUDE	0
++#define MCAST_INCLUDE	1
++
++/* These need to appear somewhere around here */
++#define IP_DEFAULT_MULTICAST_TTL        1
++#define IP_DEFAULT_MULTICAST_LOOP       1
++
++/* Request struct for multicast socket ops */
++
++#if __UAPI_DEF_IP_MREQ
++struct ip_mreq  {
++	struct in_addr imr_multiaddr;	/* IP multicast address of group */
++	struct in_addr imr_interface;	/* local IP address of interface */
++};
++
++struct ip_mreqn {
++	struct in_addr	imr_multiaddr;		/* IP multicast address of group */
++	struct in_addr	imr_address;		/* local IP address of interface */
++	int		imr_ifindex;		/* Interface index */
++};
++
++struct ip_mreq_source {
++	__be32		imr_multiaddr;
++	__be32		imr_interface;
++	__be32		imr_sourceaddr;
++};
++
++struct ip_msfilter {
++	__be32		imsf_multiaddr;
++	__be32		imsf_interface;
++	__u32		imsf_fmode;
++	__u32		imsf_numsrc;
++	__be32		imsf_slist[1];
++};
++
++#define IP_MSFILTER_SIZE(numsrc) \
++	(sizeof(struct ip_msfilter) - sizeof(__u32) \
++	+ (numsrc) * sizeof(__u32))
++
++struct group_req {
++	__u32				 gr_interface;	/* interface index */
++	struct __kernel_sockaddr_storage gr_group;	/* group address */
++};
++
++struct group_source_req {
++	__u32				 gsr_interface;	/* interface index */
++	struct __kernel_sockaddr_storage gsr_group;	/* group address */
++	struct __kernel_sockaddr_storage gsr_source;	/* source address */
++};
++
++struct group_filter {
++	__u32				 gf_interface;	/* interface index */
++	struct __kernel_sockaddr_storage gf_group;	/* multicast address */
++	__u32				 gf_fmode;	/* filter mode */
++	__u32				 gf_numsrc;	/* number of sources */
++	struct __kernel_sockaddr_storage gf_slist[1];	/* interface index */
++};
++
++#define GROUP_FILTER_SIZE(numsrc) \
++	(sizeof(struct group_filter) - sizeof(struct __kernel_sockaddr_storage) \
++	+ (numsrc) * sizeof(struct __kernel_sockaddr_storage))
++#endif
++
++#if __UAPI_DEF_IN_PKTINFO
++struct in_pktinfo {
++	int		ipi_ifindex;
++	struct in_addr	ipi_spec_dst;
++	struct in_addr	ipi_addr;
++};
++#endif
++
++/* Structure describing an Internet (IP) socket address. */
++#if  __UAPI_DEF_SOCKADDR_IN
++#define __SOCK_SIZE__	16		/* sizeof(struct sockaddr)	*/
++struct sockaddr_in {
++  __kernel_sa_family_t	sin_family;	/* Address family		*/
++  __be16		sin_port;	/* Port number			*/
++  struct in_addr	sin_addr;	/* Internet address		*/
++
++  /* Pad to size of `struct sockaddr'. */
++  unsigned char		__pad[__SOCK_SIZE__ - sizeof(short int) -
++			sizeof(unsigned short int) - sizeof(struct in_addr)];
++};
++#define sin_zero	__pad		/* for BSD UNIX comp. -FvK	*/
++#endif
++
++#if __UAPI_DEF_IN_CLASS
++/*
++ * Definitions of the bits in an Internet address integer.
++ * On subnets, host and network parts are found according
++ * to the subnet mask, not these masks.
++ */
++#define	IN_CLASSA(a)		((((long int) (a)) & 0x80000000) == 0)
++#define	IN_CLASSA_NET		0xff000000
++#define	IN_CLASSA_NSHIFT	24
++#define	IN_CLASSA_HOST		(0xffffffff & ~IN_CLASSA_NET)
++#define	IN_CLASSA_MAX		128
++
++#define	IN_CLASSB(a)		((((long int) (a)) & 0xc0000000) == 0x80000000)
++#define	IN_CLASSB_NET		0xffff0000
++#define	IN_CLASSB_NSHIFT	16
++#define	IN_CLASSB_HOST		(0xffffffff & ~IN_CLASSB_NET)
++#define	IN_CLASSB_MAX		65536
++
++#define	IN_CLASSC(a)		((((long int) (a)) & 0xe0000000) == 0xc0000000)
++#define	IN_CLASSC_NET		0xffffff00
++#define	IN_CLASSC_NSHIFT	8
++#define	IN_CLASSC_HOST		(0xffffffff & ~IN_CLASSC_NET)
++
++#define	IN_CLASSD(a)		((((long int) (a)) & 0xf0000000) == 0xe0000000)
++#define	IN_MULTICAST(a)		IN_CLASSD(a)
++#define IN_MULTICAST_NET	0xF0000000
++
++#define	IN_EXPERIMENTAL(a)	((((long int) (a)) & 0xf0000000) == 0xf0000000)
++#define	IN_BADCLASS(a)		IN_EXPERIMENTAL((a))
++
++/* Address to accept any incoming messages. */
++#define	INADDR_ANY		((unsigned long int) 0x00000000)
++
++/* Address to send to all hosts. */
++#define	INADDR_BROADCAST	((unsigned long int) 0xffffffff)
++
++/* Address indicating an error return. */
++#define	INADDR_NONE		((unsigned long int) 0xffffffff)
++
++/* Network number for local host loopback. */
++#define	IN_LOOPBACKNET		127
++
++/* Address to loopback in software to local host.  */
++#define	INADDR_LOOPBACK		0x7f000001	/* 127.0.0.1   */
++#define	IN_LOOPBACK(a)		((((long int) (a)) & 0xff000000) == 0x7f000000)
++
++/* Defines for Multicast INADDR */
++#define INADDR_UNSPEC_GROUP   	0xe0000000U	/* 224.0.0.0   */
++#define INADDR_ALLHOSTS_GROUP 	0xe0000001U	/* 224.0.0.1   */
++#define INADDR_ALLRTRS_GROUP    0xe0000002U	/* 224.0.0.2 */
++#define INADDR_MAX_LOCAL_GROUP  0xe00000ffU	/* 224.0.0.255 */
++#endif
++
++/* <asm/byteorder.h> contains the htonl type stuff.. */
++#include <asm/byteorder.h> 
++
++
++#endif /* _LINUX_IN_H */
+--- /dev/null
++++ b/include/linux-private/linux/in6.h
+@@ -0,0 +1,293 @@
++/*
++ *	Types and definitions for AF_INET6 
++ *	Linux INET6 implementation 
++ *
++ *	Authors:
++ *	Pedro Roque		<roque@di.fc.ul.pt>	
++ *
++ *	Sources:
++ *	IPv6 Program Interfaces for BSD Systems
++ *      <draft-ietf-ipngwg-bsd-api-05.txt>
++ *
++ *	Advanced Sockets API for IPv6
++ *	<draft-stevens-advanced-api-00.txt>
++ *
++ *	This program is free software; you can redistribute it and/or
++ *      modify it under the terms of the GNU General Public License
++ *      as published by the Free Software Foundation; either version
++ *      2 of the License, or (at your option) any later version.
++ */
++
++#ifndef _LINUX_IN6_H
++#define _LINUX_IN6_H
++
++#include <linux/types.h>
++#include <linux/libc-compat.h>
++
++/*
++ *	IPv6 address structure
++ */
++
++#if __UAPI_DEF_IN6_ADDR
++struct in6_addr {
++	union {
++		__u8		u6_addr8[16];
++#if __UAPI_DEF_IN6_ADDR_ALT
++		__be16		u6_addr16[8];
++		__be32		u6_addr32[4];
++#endif
++	} in6_u;
++#define s6_addr			in6_u.u6_addr8
++#if __UAPI_DEF_IN6_ADDR_ALT
++#define s6_addr16		in6_u.u6_addr16
++#define s6_addr32		in6_u.u6_addr32
++#endif
++};
++#endif /* __UAPI_DEF_IN6_ADDR */
++
++#if __UAPI_DEF_SOCKADDR_IN6
++struct sockaddr_in6 {
++	unsigned short int	sin6_family;    /* AF_INET6 */
++	__be16			sin6_port;      /* Transport layer port # */
++	__be32			sin6_flowinfo;  /* IPv6 flow information */
++	struct in6_addr		sin6_addr;      /* IPv6 address */
++	__u32			sin6_scope_id;  /* scope id (new in RFC2553) */
++};
++#endif /* __UAPI_DEF_SOCKADDR_IN6 */
++
++#if __UAPI_DEF_IPV6_MREQ
++struct ipv6_mreq {
++	/* IPv6 multicast address of group */
++	struct in6_addr ipv6mr_multiaddr;
++
++	/* local IPv6 address of interface */
++	int		ipv6mr_ifindex;
++};
++#endif /* __UAPI_DEF_IVP6_MREQ */
++
++#define ipv6mr_acaddr	ipv6mr_multiaddr
++
++struct in6_flowlabel_req {
++	struct in6_addr	flr_dst;
++	__be32	flr_label;
++	__u8	flr_action;
++	__u8	flr_share;
++	__u16	flr_flags;
++	__u16 	flr_expires;
++	__u16	flr_linger;
++	__u32	__flr_pad;
++	/* Options in format of IPV6_PKTOPTIONS */
++};
++
++#define IPV6_FL_A_GET	0
++#define IPV6_FL_A_PUT	1
++#define IPV6_FL_A_RENEW	2
++
++#define IPV6_FL_F_CREATE	1
++#define IPV6_FL_F_EXCL		2
++#define IPV6_FL_F_REFLECT	4
++#define IPV6_FL_F_REMOTE	8
++
++#define IPV6_FL_S_NONE		0
++#define IPV6_FL_S_EXCL		1
++#define IPV6_FL_S_PROCESS	2
++#define IPV6_FL_S_USER		3
++#define IPV6_FL_S_ANY		255
++
++
++/*
++ *	Bitmask constant declarations to help applications select out the 
++ *	flow label and priority fields.
++ *
++ *	Note that this are in host byte order while the flowinfo field of
++ *	sockaddr_in6 is in network byte order.
++ */
++
++#define IPV6_FLOWINFO_FLOWLABEL		0x000fffff
++#define IPV6_FLOWINFO_PRIORITY		0x0ff00000
++
++/* These definitions are obsolete */
++#define IPV6_PRIORITY_UNCHARACTERIZED	0x0000
++#define IPV6_PRIORITY_FILLER		0x0100
++#define IPV6_PRIORITY_UNATTENDED	0x0200
++#define IPV6_PRIORITY_RESERVED1		0x0300
++#define IPV6_PRIORITY_BULK		0x0400
++#define IPV6_PRIORITY_RESERVED2		0x0500
++#define IPV6_PRIORITY_INTERACTIVE	0x0600
++#define IPV6_PRIORITY_CONTROL		0x0700
++#define IPV6_PRIORITY_8			0x0800
++#define IPV6_PRIORITY_9			0x0900
++#define IPV6_PRIORITY_10		0x0a00
++#define IPV6_PRIORITY_11		0x0b00
++#define IPV6_PRIORITY_12		0x0c00
++#define IPV6_PRIORITY_13		0x0d00
++#define IPV6_PRIORITY_14		0x0e00
++#define IPV6_PRIORITY_15		0x0f00
++
++/*
++ *	IPV6 extension headers
++ */
++#if __UAPI_DEF_IPPROTO_V6
++#define IPPROTO_HOPOPTS		0	/* IPv6 hop-by-hop options	*/
++#define IPPROTO_ROUTING		43	/* IPv6 routing header		*/
++#define IPPROTO_FRAGMENT	44	/* IPv6 fragmentation header	*/
++#define IPPROTO_ICMPV6		58	/* ICMPv6			*/
++#define IPPROTO_NONE		59	/* IPv6 no next header		*/
++#define IPPROTO_DSTOPTS		60	/* IPv6 destination options	*/
++#define IPPROTO_MH		135	/* IPv6 mobility header		*/
++#endif /* __UAPI_DEF_IPPROTO_V6 */
++
++/*
++ *	IPv6 TLV options.
++ */
++#define IPV6_TLV_PAD1		0
++#define IPV6_TLV_PADN		1
++#define IPV6_TLV_ROUTERALERT	5
++#define IPV6_TLV_JUMBO		194
++#define IPV6_TLV_HAO		201	/* home address option */
++
++/*
++ *	IPV6 socket options
++ */
++#if __UAPI_DEF_IPV6_OPTIONS
++#define IPV6_ADDRFORM		1
++#define IPV6_2292PKTINFO	2
++#define IPV6_2292HOPOPTS	3
++#define IPV6_2292DSTOPTS	4
++#define IPV6_2292RTHDR		5
++#define IPV6_2292PKTOPTIONS	6
++#define IPV6_CHECKSUM		7
++#define IPV6_2292HOPLIMIT	8
++#define IPV6_NEXTHOP		9
++#define IPV6_AUTHHDR		10	/* obsolete */
++#define IPV6_FLOWINFO		11
++
++#define IPV6_UNICAST_HOPS	16
++#define IPV6_MULTICAST_IF	17
++#define IPV6_MULTICAST_HOPS	18
++#define IPV6_MULTICAST_LOOP	19
++#define IPV6_ADD_MEMBERSHIP	20
++#define IPV6_DROP_MEMBERSHIP	21
++#define IPV6_ROUTER_ALERT	22
++#define IPV6_MTU_DISCOVER	23
++#define IPV6_MTU		24
++#define IPV6_RECVERR		25
++#define IPV6_V6ONLY		26
++#define IPV6_JOIN_ANYCAST	27
++#define IPV6_LEAVE_ANYCAST	28
++
++/* IPV6_MTU_DISCOVER values */
++#define IPV6_PMTUDISC_DONT		0
++#define IPV6_PMTUDISC_WANT		1
++#define IPV6_PMTUDISC_DO		2
++#define IPV6_PMTUDISC_PROBE		3
++/* same as IPV6_PMTUDISC_PROBE, provided for symetry with IPv4
++ * also see comments on IP_PMTUDISC_INTERFACE
++ */
++#define IPV6_PMTUDISC_INTERFACE		4
++/* weaker version of IPV6_PMTUDISC_INTERFACE, which allows packets to
++ * get fragmented if they exceed the interface mtu
++ */
++#define IPV6_PMTUDISC_OMIT		5
++
++/* Flowlabel */
++#define IPV6_FLOWLABEL_MGR	32
++#define IPV6_FLOWINFO_SEND	33
++
++#define IPV6_IPSEC_POLICY	34
++#define IPV6_XFRM_POLICY	35
++#endif
++
++/*
++ * Multicast:
++ * Following socket options are shared between IPv4 and IPv6.
++ *
++ * MCAST_JOIN_GROUP		42
++ * MCAST_BLOCK_SOURCE		43
++ * MCAST_UNBLOCK_SOURCE		44
++ * MCAST_LEAVE_GROUP		45
++ * MCAST_JOIN_SOURCE_GROUP	46
++ * MCAST_LEAVE_SOURCE_GROUP	47
++ * MCAST_MSFILTER		48
++ */
++
++/*
++ * Advanced API (RFC3542) (1)
++ *
++ * Note: IPV6_RECVRTHDRDSTOPTS does not exist. see net/ipv6/datagram.c.
++ */
++
++#define IPV6_RECVPKTINFO	49
++#define IPV6_PKTINFO		50
++#define IPV6_RECVHOPLIMIT	51
++#define IPV6_HOPLIMIT		52
++#define IPV6_RECVHOPOPTS	53
++#define IPV6_HOPOPTS		54
++#define IPV6_RTHDRDSTOPTS	55
++#define IPV6_RECVRTHDR		56
++#define IPV6_RTHDR		57
++#define IPV6_RECVDSTOPTS	58
++#define IPV6_DSTOPTS		59
++#define IPV6_RECVPATHMTU	60
++#define IPV6_PATHMTU		61
++#define IPV6_DONTFRAG		62
++#if 0	/* not yet */
++#define IPV6_USE_MIN_MTU	63
++#endif
++
++/*
++ * Netfilter (1)
++ *
++ * Following socket options are used in ip6_tables;
++ * see include/linux/netfilter_ipv6/ip6_tables.h.
++ *
++ * IP6T_SO_SET_REPLACE / IP6T_SO_GET_INFO		64
++ * IP6T_SO_SET_ADD_COUNTERS / IP6T_SO_GET_ENTRIES	65
++ */
++
++/*
++ * Advanced API (RFC3542) (2)
++ */
++#define IPV6_RECVTCLASS		66
++#define IPV6_TCLASS		67
++
++/*
++ * Netfilter (2)
++ *
++ * Following socket options are used in ip6_tables;
++ * see include/linux/netfilter_ipv6/ip6_tables.h.
++ *
++ * IP6T_SO_GET_REVISION_MATCH	68
++ * IP6T_SO_GET_REVISION_TARGET	69
++ * IP6T_SO_ORIGINAL_DST		80
++ */
++
++#define IPV6_AUTOFLOWLABEL	70
++/* RFC5014: Source address selection */
++#define IPV6_ADDR_PREFERENCES	72
++
++#define IPV6_PREFER_SRC_TMP		0x0001
++#define IPV6_PREFER_SRC_PUBLIC		0x0002
++#define IPV6_PREFER_SRC_PUBTMP_DEFAULT	0x0100
++#define IPV6_PREFER_SRC_COA		0x0004
++#define IPV6_PREFER_SRC_HOME		0x0400
++#define IPV6_PREFER_SRC_CGA		0x0008
++#define IPV6_PREFER_SRC_NONCGA		0x0800
++
++/* RFC5082: Generalized Ttl Security Mechanism */
++#define IPV6_MINHOPCOUNT		73
++
++#define IPV6_ORIGDSTADDR        74
++#define IPV6_RECVORIGDSTADDR    IPV6_ORIGDSTADDR
++#define IPV6_TRANSPARENT        75
++#define IPV6_UNICAST_IF         76
++
++/*
++ * Multicast Routing:
++ * see include/uapi/linux/mroute6.h.
++ *
++ * MRT6_BASE			200
++ * ...
++ * MRT6_MAX
++ */
++#endif /* _LINUX_IN6_H */
+--- /dev/null
++++ b/include/linux-private/linux/libc-compat.h
+@@ -0,0 +1,143 @@
++/*
++ * Compatibility interface for userspace libc header coordination:
++ *
++ * Define compatibility macros that are used to control the inclusion or
++ * exclusion of UAPI structures and definitions in coordination with another
++ * userspace C library.
++ *
++ * This header is intended to solve the problem of UAPI definitions that
++ * conflict with userspace definitions. If a UAPI header has such conflicting
++ * definitions then the solution is as follows:
++ *
++ * * Synchronize the UAPI header and the libc headers so either one can be
++ *   used and such that the ABI is preserved. If this is not possible then
++ *   no simple compatibility interface exists (you need to write translating
++ *   wrappers and rename things) and you can't use this interface.
++ *
++ * Then follow this process:
++ *
++ * (a) Include libc-compat.h in the UAPI header.
++ *      e.g. #include <linux/libc-compat.h>
++ *     This include must be as early as possible.
++ *
++ * (b) In libc-compat.h add enough code to detect that the comflicting
++ *     userspace libc header has been included first.
++ *
++ * (c) If the userspace libc header has been included first define a set of
++ *     guard macros of the form __UAPI_DEF_FOO and set their values to 1, else
++ *     set their values to 0.
++ *
++ * (d) Back in the UAPI header with the conflicting definitions, guard the
++ *     definitions with:
++ *     #if __UAPI_DEF_FOO
++ *       ...
++ *     #endif
++ *
++ * This fixes the situation where the linux headers are included *after* the
++ * libc headers. To fix the problem with the inclusion in the other order the
++ * userspace libc headers must be fixed like this:
++ *
++ * * For all definitions that conflict with kernel definitions wrap those
++ *   defines in the following:
++ *   #if !__UAPI_DEF_FOO
++ *     ...
++ *   #endif
++ *
++ * This prevents the redefinition of a construct already defined by the kernel.
++ */
++#ifndef _LIBC_COMPAT_H
++#define _LIBC_COMPAT_H
++
++/* We have included glibc headers... */
++#if defined(__GLIBC__)
++
++/* Coordinate with glibc netinet/in.h header. */
++#if defined(_NETINET_IN_H)
++
++/* GLIBC headers included first so don't define anything
++ * that would already be defined. */
++#define __UAPI_DEF_IN_ADDR		0
++#define __UAPI_DEF_IN_IPPROTO		0
++#define __UAPI_DEF_IN_PKTINFO		0
++#define __UAPI_DEF_IP_MREQ		0
++#define __UAPI_DEF_SOCKADDR_IN		0
++#define __UAPI_DEF_IN_CLASS		0
++
++#define __UAPI_DEF_IN6_ADDR		0
++/* The exception is the in6_addr macros which must be defined
++ * if the glibc code didn't define them. This guard matches
++ * the guard in glibc/inet/netinet/in.h which defines the
++ * additional in6_addr macros e.g. s6_addr16, and s6_addr32. */
++#if defined(__USE_MISC) || defined (__USE_GNU)
++#define __UAPI_DEF_IN6_ADDR_ALT		0
++#else
++#define __UAPI_DEF_IN6_ADDR_ALT		1
++#endif
++#define __UAPI_DEF_SOCKADDR_IN6		0
++#define __UAPI_DEF_IPV6_MREQ		0
++#define __UAPI_DEF_IPPROTO_V6		0
++#define __UAPI_DEF_IPV6_OPTIONS		0
++#define __UAPI_DEF_IN6_PKTINFO		0
++#define __UAPI_DEF_IP6_MTUINFO		0
++
++#else
++
++/* Linux headers included first, and we must define everything
++ * we need. The expectation is that glibc will check the
++ * __UAPI_DEF_* defines and adjust appropriately. */
++#define __UAPI_DEF_IN_ADDR		1
++#define __UAPI_DEF_IN_IPPROTO		1
++#define __UAPI_DEF_IN_PKTINFO		1
++#define __UAPI_DEF_IP_MREQ		1
++#define __UAPI_DEF_SOCKADDR_IN		1
++#define __UAPI_DEF_IN_CLASS		1
++
++#define __UAPI_DEF_IN6_ADDR		1
++/* We unconditionally define the in6_addr macros and glibc must
++ * coordinate. */
++#define __UAPI_DEF_IN6_ADDR_ALT		1
++#define __UAPI_DEF_SOCKADDR_IN6		1
++#define __UAPI_DEF_IPV6_MREQ		1
++#define __UAPI_DEF_IPPROTO_V6		1
++#define __UAPI_DEF_IPV6_OPTIONS		1
++#define __UAPI_DEF_IN6_PKTINFO		1
++#define __UAPI_DEF_IP6_MTUINFO		1
++
++#endif /* _NETINET_IN_H */
++
++/* Definitions for xattr.h */
++#if defined(_SYS_XATTR_H)
++#define __UAPI_DEF_XATTR		0
++#else
++#define __UAPI_DEF_XATTR		1
++#endif
++
++/* If we did not see any headers from any supported C libraries,
++ * or we are being included in the kernel, then define everything
++ * that we need. */
++#else /* !defined(__GLIBC__) */
++
++/* Definitions for in.h */
++#define __UAPI_DEF_IN_ADDR		1
++#define __UAPI_DEF_IN_IPPROTO		1
++#define __UAPI_DEF_IN_PKTINFO		1
++#define __UAPI_DEF_IP_MREQ		1
++#define __UAPI_DEF_SOCKADDR_IN		1
++#define __UAPI_DEF_IN_CLASS		1
++
++/* Definitions for in6.h */
++#define __UAPI_DEF_IN6_ADDR		1
++#define __UAPI_DEF_IN6_ADDR_ALT		1
++#define __UAPI_DEF_SOCKADDR_IN6		1
++#define __UAPI_DEF_IPV6_MREQ		1
++#define __UAPI_DEF_IPPROTO_V6		1
++#define __UAPI_DEF_IPV6_OPTIONS		1
++#define __UAPI_DEF_IN6_PKTINFO		1
++#define __UAPI_DEF_IP6_MTUINFO		1
++
++/* Definitions for xattr.h */
++#define __UAPI_DEF_XATTR		1
++
++#endif /* __GLIBC__ */
++
++#endif /* _LIBC_COMPAT_H */
diff --git a/package/libnl/0003-Add-musl-workaround-to-the-libc-compat.h-copy.patch b/package/libnl/0003-Add-musl-workaround-to-the-libc-compat.h-copy.patch
new file mode 100644
index 000000000000..57d1c8747dea
--- /dev/null
+++ b/package/libnl/0003-Add-musl-workaround-to-the-libc-compat.h-copy.patch
@@ -0,0 +1,37 @@
+From be07fdbc9658de19304defa7538f219cd3f21ec0 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Sun, 12 Mar 2017 08:52:20 +0200
+Subject: [PATCH] Add musl workaround to the libc-compat.h copy
+
+The libc-compat.h kernel header uses glibc specific macros to solve conflicts
+with libc provided headers. This patch makes libc-compat.h work also for musl
+libc.
+
+Future rebase note: when upstream updates libc-compat.h some additional macro
+definitions will be needed. See the Buildroot iproute2 patch
+package/iproute2/0001-Add-the-musl-workaround-to-the-libc-compat.h-copy.patch.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: libc-compat.h is a local copy of a kernel headers. A proper
+musl fix must go to the kernel first.
+---
+ include/linux-private/linux/libc-compat.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/linux-private/linux/libc-compat.h b/include/linux-private/linux/libc-compat.h
+index 9bed5b6ae4d9..e2562a819464 100644
+--- a/include/linux-private/linux/libc-compat.h
++++ b/include/linux-private/linux/libc-compat.h
+@@ -49,7 +49,7 @@
+ #define _LIBC_COMPAT_H
+ 
+ /* We have included glibc headers... */
+-#if defined(__GLIBC__)
++#if 1
+ 
+ /* Coordinate with glibc netinet/in.h header. */
+ #if defined(_NETINET_IN_H)
+-- 
+2.11.0
+
diff --git a/package/libnl/0004-lib-escape-usage-of-strerror_l-if-it-doesn-t-exist-i.patch b/package/libnl/0004-lib-escape-usage-of-strerror_l-if-it-doesn-t-exist-i.patch
new file mode 100644
index 000000000000..6a9c35438619
--- /dev/null
+++ b/package/libnl/0004-lib-escape-usage-of-strerror_l-if-it-doesn-t-exist-i.patch
@@ -0,0 +1,106 @@
+From e15966ac7f3b43df2acf869f98089762807d0568 Mon Sep 17 00:00:00 2001
+From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
+Date: Fri, 10 Mar 2017 17:44:22 +0300
+Subject: [PATCH] lib: escape usage of strerror_l() if it doesn't exist in libc
+
+uClibc doesn't implement strerror_l() and thus libnl starting from
+3.2.29 couldn't be compiled with it any longer.
+
+To work-around that problem we'll just do a check on strerror_l()
+availability during configuration and if it's not there just fall back
+to locale-less strerror().
+
+See-also: 6c2d111177e91184073c44f83d4a6182aaba06d7
+
+http://lists.infradead.org/pipermail/libnl/2017-March/002301.html
+
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+Signed-off-by: Thomas Haller <thaller@redhat.com>
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Patch status: upstream commit e15966ac7f3b43df
+
+ configure.ac    | 2 ++
+ lib/utils.c     | 8 +++++++-
+ src/lib/utils.c | 6 ++++++
+ 3 files changed, 15 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 68b285e5b15c..2739b997ee3a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -121,6 +121,8 @@ fi
+ 
+ AC_CONFIG_SUBDIRS([doc])
+ 
++AC_CHECK_FUNCS([strerror_l])
++
+ AC_CONFIG_FILES([
+ Makefile
+ libnl-3.0.pc
+diff --git a/lib/utils.c b/lib/utils.c
+index fb350d13fd2f..06273c5b291e 100644
+--- a/lib/utils.c
++++ b/lib/utils.c
+@@ -30,7 +30,9 @@
+ #include <netlink/utils.h>
+ #include <linux/socket.h>
+ #include <stdlib.h> /* exit() */
++#ifdef HAVE_STRERROR_L
+ #include <locale.h>
++#endif
+ 
+ /**
+  * Global variable indicating the desired level of debugging output.
+@@ -123,9 +125,10 @@ int __nl_read_num_str_file(const char *path, int (*cb)(long, const char *))
+ 
+ const char *nl_strerror_l(int err)
+ {
++	const char *buf;
++#ifdef HAVE_STRERROR_L
+ 	int errno_save = errno;
+ 	locale_t loc = newlocale(LC_MESSAGES_MASK, "", (locale_t)0);
+-	const char *buf;
+ 
+ 	if (loc == (locale_t)0) {
+ 		if (errno == ENOENT)
+@@ -140,6 +143,9 @@ const char *nl_strerror_l(int err)
+ 	}
+ 
+ 	errno = errno_save;
++#else
++	buf = strerror(err);
++#endif
+ 	return buf;
+ }
+ /** @endcond */
+diff --git a/src/lib/utils.c b/src/lib/utils.c
+index 5878f279c364..feb1d4ef4056 100644
+--- a/src/lib/utils.c
++++ b/src/lib/utils.c
+@@ -81,6 +81,7 @@ void nl_cli_fatal(int err, const char *fmt, ...)
+ 		fprintf(stderr, "\n");
+ 	} else {
+ 		char *buf;
++#ifdef HAVE_STRERROR_L
+ 		locale_t loc = newlocale(LC_MESSAGES_MASK, "", (locale_t)0);
+ 		if (loc == (locale_t)0) {
+ 			if (errno == ENOENT)
+@@ -91,9 +92,14 @@ void nl_cli_fatal(int err, const char *fmt, ...)
+ 		}
+ 		if (loc != (locale_t)0)
+ 			buf = strerror_l(err, loc);
++#else
++		buf = strerror(err);
++#endif
+ 		fprintf(stderr, "%s\n", buf);
++#ifdef HAVE_STRERROR_L
+ 		if (loc != (locale_t)0)
+ 			freelocale(loc);
++#endif
+ 	}
+ 
+ 	exit(abs(err));
+-- 
+2.11.0
+
diff --git a/package/libnl/libnl.hash b/package/libnl/libnl.hash
index 2f1a3cb1b322..9761a9580cc9 100644
--- a/package/libnl/libnl.hash
+++ b/package/libnl/libnl.hash
@@ -1,2 +1,2 @@
-# From https://github.com/thom311/libnl/releases/download/libnl3_2_27/libnl-3.2.27.tar.gz.sha256sum
-sha256	4bbbf92b3c78a90f423cf96260bf419a28b75db8cced47051217a56795f58ec6	libnl-3.2.27.tar.gz
+# From https://github.com/thom311/libnl/releases/download/libnl3_2_29/libnl-3.2.29.tar.gz.sha256sum
+sha256	0beb593dc6abfffa18a5c787b27884979c1b7e7f1fd468c801e3cc938a685922	libnl-3.2.29.tar.gz
diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index 85c0db86f6cd..f31a92c206f9 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -4,12 +4,14 @@
 #
 ################################################################################
 
-LIBNL_VERSION = 3.2.27
+LIBNL_VERSION = 3.2.29
 LIBNL_SITE = https://github.com/thom311/libnl/releases/download/libnl$(subst .,_,$(LIBNL_VERSION))
 LIBNL_LICENSE = LGPLv2.1+
 LIBNL_LICENSE_FILES = COPYING
 LIBNL_INSTALL_STAGING = YES
-LIBNL_DEPENDENCIES = host-bison host-flex
+LIBNL_DEPENDENCIES = host-bison host-flex host-pkgconf
+# Patching configure.ac
+LIBNL_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_LIBNL_TOOLS),y)
 LIBNL_CONF_OPTS += --enable-cli
@@ -17,4 +19,11 @@ else
 LIBNL_CONF_OPTS += --disable-cli
 endif
 
+ifeq ($(BR2_PACKAGE_CHECK),y)
+LIBNL_DEPENDENCIES += check
+LIBNL_CONF_OPTS += --enable-unit-tests
+else
+LIBNL_CONF_OPTS += --disable-unit-tests
+endif
+
 $(eval $(autotools-package))
-- 
2.11.0
