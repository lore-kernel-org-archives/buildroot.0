Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FD6BC6377B
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 21:46:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 366DB61208
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 21:46:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 366DB61208
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 033C140134;
	Wed, 21 Jul 2021 21:46:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UiNEB3uSxlBq; Wed, 21 Jul 2021 21:46:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34D97400F3;
	Wed, 21 Jul 2021 21:46:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C0B271C1187
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 21:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACF2D605D2
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 21:45:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jPr5OVAv94po for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 21:45:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8B8FD605A2
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 21:45:26 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id f9so3666612wrq.11
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 14:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LKuOJxz+Lz1+kzXHlqyof08EDyFFgOHPKjoTYbRmXTM=;
 b=SbeTsJInvD4raALJSN4tvqrvp3FSKQsyVJIIEqifKInXbtHo5BFNu9OrPWlgU+DYjQ
 Urv53bMI1F82ZqNCjWRWunb/2UvK5Op5u/omXN/F3A9FDkmpw2vP8jXWMQTzQkCpfjUs
 vULUX5ZuaFou3TEdbFH6BfCdusHvEX8jIgRXa8M9NyD+DAxSlqyzqSlFNz8gNkg1eYOD
 6ty3p7Wjfd1wi61cG8+vRVcOU2ibR4funjEIKRStdKBO+er3jSnUuPRYWdtcnEox8jt0
 4UJ63wIgcK2S++i2IwpjetkzOvZTqtca7FGCQsSel/sMNL/teok9eXXuTeOb8CUQS2jG
 c9Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LKuOJxz+Lz1+kzXHlqyof08EDyFFgOHPKjoTYbRmXTM=;
 b=ubo8rlYcgtU37VKzE47eDx7oaZeg3gO/InT60m9QGh2E6FqqOSxkQScpk7Mli5ehqw
 /2xA25xRmGIw4cvm8SzpAY0RbPwC5zq6LwTvuALon7t97bhfo9+zIM8BizugCRe1N22a
 ZRqx/hQblh9YEnKwXhAdVNKvtzD52/hzapODC8/SLrEFNUpYXsp0/aLsXyIt4A402UsP
 DyErernnw2sSD8VPjJPD4+JC7GF6HcWC8lK/i3cgYuwcqH3mm2dySXIk4sEMgbpPzdZX
 v/tD+1XFuRXUBcY92DZV8M/Nc8q0GWzgveQhvo2DptIG7tkHP/30MrxLKwXWVY0U2IGk
 uWPg==
X-Gm-Message-State: AOAM530D18fQZ2sPIPRbknH+kFIDj63Mbrrv0WKQb0yBZ3mdye5XCt5U
 CzyPQk2P/L85lFmIAPNoSzVFsiFvazEdfg==
X-Google-Smtp-Source: ABdhPJzVyJewk0HitMNJVDJAXpC/qT8nYHYljhEBHL5Uo10b6h8bKNpIKPo1d7Mhi/7tpuTf7Puqww==
X-Received: by 2002:a5d:6391:: with SMTP id p17mr25557864wru.61.1626903924411; 
 Wed, 21 Jul 2021 14:45:24 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id p11sm28367127wrw.53.2021.07.21.14.45.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 14:45:23 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 21 Jul 2021 23:45:16 +0200
Message-Id: <20210721214517.806537-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/libnfnetlink: fix build on musl
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Include upstream patch to fix build failure with suricata raised since
bump to version 6.0.3 in commit 4c429c3f8c322381991a58fcc37c01da9eb5e8a6

Fixes:
 - http://autobuild.buildroot.org/results/0b960f40b5d7e4bb0c4ba20638fe66a9e0964ab3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...002-include-Sync-with-kernel-headers.patch | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)
 create mode 100644 package/libnfnetlink/0002-include-Sync-with-kernel-headers.patch

diff --git a/package/libnfnetlink/0002-include-Sync-with-kernel-headers.patch b/package/libnfnetlink/0002-include-Sync-with-kernel-headers.patch
new file mode 100644
index 0000000000..f9e9c2e2ea
--- /dev/null
+++ b/package/libnfnetlink/0002-include-Sync-with-kernel-headers.patch
@@ -0,0 +1,114 @@
+From 7a1a07c0028a1c88cd7716a058697c552a563b24 Mon Sep 17 00:00:00 2001
+From: Felix Janda <felix.janda@posteo.de>
+Date: Sat, 16 May 2015 14:49:07 +0200
+Subject: include: Sync with kernel headers
+
+Signed-off-by: Felix Janda <felix.janda@posteo.de>
+Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
+
+[Retrieved from:
+https://git.netfilter.org/libnfnetlink/commit/?id=7a1a07c0028a1c88cd7716a058697c552a563b24]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ include/libnfnetlink/linux_nfnetlink.h        | 44 ++++-----------------------
+ include/libnfnetlink/linux_nfnetlink_compat.h | 12 ++++----
+ 2 files changed, 12 insertions(+), 44 deletions(-)
+
+diff --git a/include/libnfnetlink/linux_nfnetlink.h b/include/libnfnetlink/linux_nfnetlink.h
+index 76a8550..44a38d6 100644
+--- a/include/libnfnetlink/linux_nfnetlink.h
++++ b/include/libnfnetlink/linux_nfnetlink.h
+@@ -25,9 +25,9 @@ enum nfnetlink_groups {
+ /* General form of address family dependent message.
+  */
+ struct nfgenmsg {
+-	u_int8_t  nfgen_family;		/* AF_xxx */
+-	u_int8_t  version;		/* nfnetlink version */
+-	u_int16_t    res_id;		/* resource id */
++	__u8  nfgen_family;		/* AF_xxx */
++	__u8  version;		/* nfnetlink version */
++	__be16    res_id;		/* resource id */
+ };
+ 
+ #define NFNETLINK_V0	0
+@@ -46,40 +46,8 @@ struct nfgenmsg {
+ #define NFNL_SUBSYS_CTNETLINK_EXP	2
+ #define NFNL_SUBSYS_QUEUE		3
+ #define NFNL_SUBSYS_ULOG		4
+-#define NFNL_SUBSYS_COUNT		5
++#define NFNL_SUBSYS_OSF			5
++#define NFNL_SUBSYS_IPSET		6
++#define NFNL_SUBSYS_COUNT		7
+ 
+-#ifdef __KERNEL__
+-
+-#include <linux/netlink.h>
+-#include <linux/capability.h>
+-#include <net/netlink.h>
+-
+-struct nfnl_callback
+-{
+-	int (*call)(struct sock *nl, struct sk_buff *skb, 
+-		struct nlmsghdr *nlh, struct nlattr *cda[]);
+-	const struct nla_policy *policy;	/* netlink attribute policy */
+-	const u_int16_t attr_count;		/* number of nlattr's */
+-};
+-
+-struct nfnetlink_subsystem
+-{
+-	const char *name;
+-	__u8 subsys_id;			/* nfnetlink subsystem ID */
+-	__u8 cb_count;			/* number of callbacks */
+-	const struct nfnl_callback *cb;	/* callback for individual types */
+-};
+-
+-extern int nfnetlink_subsys_register(const struct nfnetlink_subsystem *n);
+-extern int nfnetlink_subsys_unregister(const struct nfnetlink_subsystem *n);
+-
+-extern int nfnetlink_has_listeners(unsigned int group);
+-extern int nfnetlink_send(struct sk_buff *skb, u32 pid, unsigned group, 
+-			  int echo);
+-extern int nfnetlink_unicast(struct sk_buff *skb, u_int32_t pid, int flags);
+-
+-#define MODULE_ALIAS_NFNL_SUBSYS(subsys) \
+-	MODULE_ALIAS("nfnetlink-subsys-" __stringify(subsys))
+-
+-#endif	/* __KERNEL__ */
+ #endif	/* _NFNETLINK_H */
+diff --git a/include/libnfnetlink/linux_nfnetlink_compat.h b/include/libnfnetlink/linux_nfnetlink_compat.h
+index e145176..74b9e55 100644
+--- a/include/libnfnetlink/linux_nfnetlink_compat.h
++++ b/include/libnfnetlink/linux_nfnetlink_compat.h
+@@ -1,6 +1,8 @@
+ #ifndef _NFNETLINK_COMPAT_H
+ #define _NFNETLINK_COMPAT_H
+-#ifndef __KERNEL__
++
++#include <linux/types.h>
++
+ /* Old nfnetlink macros for userspace */
+ 
+ /* nfnetlink groups: Up to 32 maximum */
+@@ -18,10 +20,9 @@
+  * ! nfnetlink use the same attributes methods. - J. Schulist.
+  */
+ 
+-struct nfattr
+-{
+-	u_int16_t nfa_len;
+-	u_int16_t nfa_type;	/* we use 15 bits for the type, and the highest
++struct nfattr {
++	__u16 nfa_len;
++	__u16 nfa_type;	/* we use 15 bits for the type, and the highest
+ 				 * bit to indicate whether the payload is nested */
+ };
+ 
+@@ -57,5 +58,4 @@ struct nfattr
+         + NLMSG_ALIGN(sizeof(struct nfgenmsg))))
+ #define NFM_PAYLOAD(n)  NLMSG_PAYLOAD(n, sizeof(struct nfgenmsg))
+ 
+-#endif /* ! __KERNEL__ */
+ #endif /* _NFNETLINK_COMPAT_H */
+-- 
+cgit v1.2.3
+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
