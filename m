Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 038A3C433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Jun 2022 17:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41CD2417CF;
	Wed, 22 Jun 2022 17:00:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41CD2417CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wT-xxzZx29uU; Wed, 22 Jun 2022 17:00:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85E33417BE;
	Wed, 22 Jun 2022 17:00:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85E33417BE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1DFAD1BF47F
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 17:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC07560BB2
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 17:00:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC07560BB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dgqpHpX0mTKW for <buildroot@lists.busybox.net>;
 Wed, 22 Jun 2022 17:00:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2E6F60AC3
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E2E6F60AC3
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 17:00:21 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id e25so20424522wrc.13
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 10:00:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y20WY2ktkqmhWkGoh3aSmGVj4DR3idiCXM/+Op6rz/o=;
 b=5zMHJIH20E7PFyX6aYE5Q53I7xwRhv8wEOYTWmcL9mZFA+2QvA3rHTCinDauXAvgHZ
 +iIYSETBGNzP2o4f9kG5zgSagHSY/bGJpo4PYEWTwEWs9EiRO9QvJjI0vaxe8iy4EQAs
 tRp47+dIhqX1d/HZFCHO1tuW85nLs1IzoSZTbyeoDeiY5BCGABUVU1Mq3cPGJG3D0I+k
 iQkYmReIDkLEZPDAeAJ6RMeqwbiStW2qckunNqGx3zksCM+AxfOtqMe2NgUfj6DOkTGS
 81iSZzlK5KaYw5o3A9ZyxRM6Ptkabbqzf3WNrGtlq8tUw/b2mv4eJVcn8aGFyuBEppJH
 SZIg==
X-Gm-Message-State: AJIora/wpWZuuqMUqPdlw7iAkw7Zx+rnc1vP/yhxec09XH2DlZ+V0fiX
 OrHcfTEPZdZ72GWHf6KpsDMk5+nsUSo=
X-Google-Smtp-Source: AGRyM1tD7AJbtqMcib5pl6wi/UphuK3tWIGUKMZhPk05bzrE1Fnu1gbzdRZ8HsFE87xhmsLIqiv11w==
X-Received: by 2002:adf:f446:0:b0:21b:821f:a916 with SMTP id
 f6-20020adff446000000b0021b821fa916mr4169114wrp.11.1655917219768; 
 Wed, 22 Jun 2022 10:00:19 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 j11-20020a05600c190b00b0039c5328ad92sm31147745wmq.41.2022.06.22.10.00.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 10:00:19 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Jun 2022 18:57:28 +0200
Message-Id: <20220622165728.71856-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y20WY2ktkqmhWkGoh3aSmGVj4DR3idiCXM/+Op6rz/o=;
 b=X9M5KwhYDf0S2o6xEK6ZWwvi6Z6NbAaH6SZtSrRE/BLuA5BOwUaZ2tnpFlWAGVhjA4
 tH/UG5um1ls0HqwTc9nPOazg+uzJqsPnqZ76jHYvDpqe5ZoSHy0/i7hvrFbcptxPcIG7
 UQsGfENd8pzul1cYE29d3EGVZ0VCg1LHWfxAA0ZspCuTnFyJuwv0tPbY9W5vMIJoke/d
 N180nU4LlEZPr5ENqJWO5ZTBJmVbSjPt/xL8XBlI1nwP3PaaID2Joqmcx8wnTHLNPe7u
 Xluk6CHzJrpZve5+rHfhIcR4auJSKWwxMevaFRmVh/lDt+mkGdWfIOE0ACC1liErhwOi
 rqdg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=X9M5KwhY
Subject: [Buildroot] [PATCH 1/1] package/libnfnetlink: bump to version 1.0.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop first and second patches (already in version) and so also drop
  autoreconf
- Drop third patch (not needed since
  https://git.netfilter.org/libnfnetlink/commit/?id=efa1d8e417ae5b685c206853aaa0e7f762574585)
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libnfnetlink/0001-uclinux.patch       |  26 ----
 ...002-include-Sync-with-kernel-headers.patch | 114 ------------------
 package/libnfnetlink/0002-musl.patch          |  32 -----
 package/libnfnetlink/libnfnetlink.hash        |   7 +-
 package/libnfnetlink/libnfnetlink.mk          |   3 +-
 5 files changed, 4 insertions(+), 178 deletions(-)
 delete mode 100644 package/libnfnetlink/0001-uclinux.patch
 delete mode 100644 package/libnfnetlink/0002-include-Sync-with-kernel-headers.patch
 delete mode 100644 package/libnfnetlink/0002-musl.patch

diff --git a/package/libnfnetlink/0001-uclinux.patch b/package/libnfnetlink/0001-uclinux.patch
deleted file mode 100644
index b15201283a..0000000000
--- a/package/libnfnetlink/0001-uclinux.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 8e5a9d8f32c9646d01d8c84e979892dfd28a7f7c Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Tue, 10 Sep 2013 15:35:22 -0300
-Subject: [PATCH] configure: uclinux is also linux
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 0926a1c..b979772 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -18,7 +18,7 @@ AC_DISABLE_STATIC
- AM_PROG_LIBTOOL
- 
- case "$host" in 
--*-*-linux*) ;;
-+*-*-linux* | *-*-uclinux*) ;;
- *) AC_MSG_ERROR([Linux only, dude!]);;
- esac
- 
--- 
-1.8.1.5
-
diff --git a/package/libnfnetlink/0002-include-Sync-with-kernel-headers.patch b/package/libnfnetlink/0002-include-Sync-with-kernel-headers.patch
deleted file mode 100644
index f9e9c2e2ea..0000000000
--- a/package/libnfnetlink/0002-include-Sync-with-kernel-headers.patch
+++ /dev/null
@@ -1,114 +0,0 @@
-From 7a1a07c0028a1c88cd7716a058697c552a563b24 Mon Sep 17 00:00:00 2001
-From: Felix Janda <felix.janda@posteo.de>
-Date: Sat, 16 May 2015 14:49:07 +0200
-Subject: include: Sync with kernel headers
-
-Signed-off-by: Felix Janda <felix.janda@posteo.de>
-Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
-
-[Retrieved from:
-https://git.netfilter.org/libnfnetlink/commit/?id=7a1a07c0028a1c88cd7716a058697c552a563b24]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- include/libnfnetlink/linux_nfnetlink.h        | 44 ++++-----------------------
- include/libnfnetlink/linux_nfnetlink_compat.h | 12 ++++----
- 2 files changed, 12 insertions(+), 44 deletions(-)
-
-diff --git a/include/libnfnetlink/linux_nfnetlink.h b/include/libnfnetlink/linux_nfnetlink.h
-index 76a8550..44a38d6 100644
---- a/include/libnfnetlink/linux_nfnetlink.h
-+++ b/include/libnfnetlink/linux_nfnetlink.h
-@@ -25,9 +25,9 @@ enum nfnetlink_groups {
- /* General form of address family dependent message.
-  */
- struct nfgenmsg {
--	u_int8_t  nfgen_family;		/* AF_xxx */
--	u_int8_t  version;		/* nfnetlink version */
--	u_int16_t    res_id;		/* resource id */
-+	__u8  nfgen_family;		/* AF_xxx */
-+	__u8  version;		/* nfnetlink version */
-+	__be16    res_id;		/* resource id */
- };
- 
- #define NFNETLINK_V0	0
-@@ -46,40 +46,8 @@ struct nfgenmsg {
- #define NFNL_SUBSYS_CTNETLINK_EXP	2
- #define NFNL_SUBSYS_QUEUE		3
- #define NFNL_SUBSYS_ULOG		4
--#define NFNL_SUBSYS_COUNT		5
-+#define NFNL_SUBSYS_OSF			5
-+#define NFNL_SUBSYS_IPSET		6
-+#define NFNL_SUBSYS_COUNT		7
- 
--#ifdef __KERNEL__
--
--#include <linux/netlink.h>
--#include <linux/capability.h>
--#include <net/netlink.h>
--
--struct nfnl_callback
--{
--	int (*call)(struct sock *nl, struct sk_buff *skb, 
--		struct nlmsghdr *nlh, struct nlattr *cda[]);
--	const struct nla_policy *policy;	/* netlink attribute policy */
--	const u_int16_t attr_count;		/* number of nlattr's */
--};
--
--struct nfnetlink_subsystem
--{
--	const char *name;
--	__u8 subsys_id;			/* nfnetlink subsystem ID */
--	__u8 cb_count;			/* number of callbacks */
--	const struct nfnl_callback *cb;	/* callback for individual types */
--};
--
--extern int nfnetlink_subsys_register(const struct nfnetlink_subsystem *n);
--extern int nfnetlink_subsys_unregister(const struct nfnetlink_subsystem *n);
--
--extern int nfnetlink_has_listeners(unsigned int group);
--extern int nfnetlink_send(struct sk_buff *skb, u32 pid, unsigned group, 
--			  int echo);
--extern int nfnetlink_unicast(struct sk_buff *skb, u_int32_t pid, int flags);
--
--#define MODULE_ALIAS_NFNL_SUBSYS(subsys) \
--	MODULE_ALIAS("nfnetlink-subsys-" __stringify(subsys))
--
--#endif	/* __KERNEL__ */
- #endif	/* _NFNETLINK_H */
-diff --git a/include/libnfnetlink/linux_nfnetlink_compat.h b/include/libnfnetlink/linux_nfnetlink_compat.h
-index e145176..74b9e55 100644
---- a/include/libnfnetlink/linux_nfnetlink_compat.h
-+++ b/include/libnfnetlink/linux_nfnetlink_compat.h
-@@ -1,6 +1,8 @@
- #ifndef _NFNETLINK_COMPAT_H
- #define _NFNETLINK_COMPAT_H
--#ifndef __KERNEL__
-+
-+#include <linux/types.h>
-+
- /* Old nfnetlink macros for userspace */
- 
- /* nfnetlink groups: Up to 32 maximum */
-@@ -18,10 +20,9 @@
-  * ! nfnetlink use the same attributes methods. - J. Schulist.
-  */
- 
--struct nfattr
--{
--	u_int16_t nfa_len;
--	u_int16_t nfa_type;	/* we use 15 bits for the type, and the highest
-+struct nfattr {
-+	__u16 nfa_len;
-+	__u16 nfa_type;	/* we use 15 bits for the type, and the highest
- 				 * bit to indicate whether the payload is nested */
- };
- 
-@@ -57,5 +58,4 @@ struct nfattr
-         + NLMSG_ALIGN(sizeof(struct nfgenmsg))))
- #define NFM_PAYLOAD(n)  NLMSG_PAYLOAD(n, sizeof(struct nfgenmsg))
- 
--#endif /* ! __KERNEL__ */
- #endif /* _NFNETLINK_COMPAT_H */
--- 
-cgit v1.2.3
-
diff --git a/package/libnfnetlink/0002-musl.patch b/package/libnfnetlink/0002-musl.patch
deleted file mode 100644
index bee7898aae..0000000000
--- a/package/libnfnetlink/0002-musl.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Include <sys/types.h> to get the u_int* definitions
-
-This is needed to fix the build with the musl C library, and this
-patch comes from
-http://git.alpinelinux.org/cgit/aports/plain/main/libnfnetlink/musl-fix-includes.patch.
-
-It will no longer be needed with upcoming upstream releases of
-libnfnetlink, since they have switched to use the <stdint.h> types
-instead. However this change was too invasive to backport.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
---- libnfnetlink-1.0.1.orig/include/libnfnetlink/linux_nfnetlink.h
-+++ libnfnetlink-1.0.1/include/libnfnetlink/linux_nfnetlink.h
-@@ -1,6 +1,6 @@
- #ifndef _NFNETLINK_H
- #define _NFNETLINK_H
--#include <linux/types.h>
-+#include <sys/types.h>
- #include <libnfnetlink/linux_nfnetlink_compat.h>
- 
- enum nfnetlink_groups {
---- libnfnetlink-1.0.1.orig/include/libnfnetlink/libnfnetlink.h
-+++ libnfnetlink-1.0.1/include/libnfnetlink/libnfnetlink.h
-@@ -15,6 +15,7 @@
- #define aligned_u64 unsigned long long __attribute__((aligned(8)))
- #endif
- 
-+#include <sys/types.h>
- #include <sys/socket.h>	/* for sa_family_t */
- #include <linux/netlink.h>
- #include <libnfnetlink/linux_nfnetlink.h>
diff --git a/package/libnfnetlink/libnfnetlink.hash b/package/libnfnetlink/libnfnetlink.hash
index 3392d239b6..63708f8f26 100644
--- a/package/libnfnetlink/libnfnetlink.hash
+++ b/package/libnfnetlink/libnfnetlink.hash
@@ -1,6 +1,5 @@
-# From ftp://ftp.netfilter.org/pub/libnfnetlink/libnfnetlink-1.0.1.tar.bz2.{md5sum,sha1sum}
-md5	98927583d2016a9fb1936fed992e2c5e	libnfnetlink-1.0.1.tar.bz2
-sha1	27ae2dfbd976e28cb7a417f9e946c901f512dd9a	libnfnetlink-1.0.1.tar.bz2
+# From http://ftp.netfilter.org/pub/libnfnetlink/libnfnetlink-1.0.2.tar.bz2.sha256sum
+sha256  b064c7c3d426efb4786e60a8e6859b82ee2f2c5e49ffeea640cfe4fe33cbc376  libnfnetlink-1.0.2.tar.bz2
 
 # Hash for license file:
-sha256	91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad	COPYING
+sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
diff --git a/package/libnfnetlink/libnfnetlink.mk b/package/libnfnetlink/libnfnetlink.mk
index a5ad47b85e..85a717b8d2 100644
--- a/package/libnfnetlink/libnfnetlink.mk
+++ b/package/libnfnetlink/libnfnetlink.mk
@@ -4,10 +4,9 @@
 #
 ################################################################################
 
-LIBNFNETLINK_VERSION = 1.0.1
+LIBNFNETLINK_VERSION = 1.0.2
 LIBNFNETLINK_SOURCE = libnfnetlink-$(LIBNFNETLINK_VERSION).tar.bz2
 LIBNFNETLINK_SITE = http://www.netfilter.org/projects/libnfnetlink/files
-LIBNFNETLINK_AUTORECONF = YES
 LIBNFNETLINK_INSTALL_STAGING = YES
 LIBNFNETLINK_LICENSE = GPL-2.0
 LIBNFNETLINK_LICENSE_FILES = COPYING
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
