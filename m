Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18247E728CD
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 17:27:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9220A83227;
	Fri, 29 Sep 2023 17:27:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9220A83227
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TqFsUbsRiy-7; Fri, 29 Sep 2023 17:27:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 983CD832EA;
	Fri, 29 Sep 2023 17:27:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 983CD832EA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2C4741BF83B
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 17:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04DB1828EF
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 17:27:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04DB1828EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YuadDHXAazA8 for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 17:27:39 +0000 (UTC)
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8BEC582373
 for <buildroot@busybox.net>; Fri, 29 Sep 2023 17:27:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BEC582373
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-53636f98538so3339228a12.1
 for <buildroot@busybox.net>; Fri, 29 Sep 2023 10:27:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696008457; x=1696613257;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Dl1WjFc4k1Vzq7hR+DUE7tqdtE1ZmCnmQhER6Oc9Vxo=;
 b=ahzKpGlwrnVyDsquK4EgFGfciZHPtQpO+TePOst1uS1AJHiO2CRUSlgQ3VwD/gPkgo
 AveZ88ot/AxETc++8FCoE+INoWClbAElfGNfTt86aEXmWYKdyJpOOicGle26o7ytQYi6
 SxUkGK+nKPucvOrjbFUhi7mOvh1EnR/FN+AcbHFuPZ4w4uOnPFNXz9TjWLK60r0xnskl
 uTcuX9TaZRvF6fxsMRquCAlxz7HYycpoP47Jjefm1Sw61tfx1yTw/olg2PCOjl+rLgJc
 sD5+Cns4IylPPdQri1CVV/F5H1xqfgGpWOF0ZI+wt2VRrbiosb4hD5NamGXHSOF7dwvT
 VoVQ==
X-Gm-Message-State: AOJu0YxJS18s/LXayNIhd+97YGfpkiI+jo9uawjmLNCZfd55fNDGQ1BV
 U5x1E78wvmVgwbGPQP6+/20QqEVcnZo=
X-Google-Smtp-Source: AGHT+IHrJPdmq9w1xDlbAXs5qpzS/1Ky4ES/DNWhR4V4ybt9DO2dWVxMjJKQS7O62xtvAuFC21LE6w==
X-Received: by 2002:aa7:c602:0:b0:52b:d169:b37a with SMTP id
 h2-20020aa7c602000000b0052bd169b37amr4301794edq.28.1696008457190; 
 Fri, 29 Sep 2023 10:27:37 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 dm3-20020a05640222c300b0053635409213sm2259927edb.34.2023.09.29.10.27.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Sep 2023 10:27:36 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 29 Sep 2023 19:27:32 +0200
Message-Id: <20230929172732.3214611-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696008457; x=1696613257; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Dl1WjFc4k1Vzq7hR+DUE7tqdtE1ZmCnmQhER6Oc9Vxo=;
 b=E7rvedLw1rvecrg1VRCKTYzGf8rxoViPqNB2yWQRezcSPd30dstAFRjs5xW1dW4KQo
 mq38tiumCKN1XxIuEPFeW4QeFvkA0uYmGK370T1HDa+IC6UhoELBYCRe2rvm3EIZnkDj
 WGk0KXqAuqDL2zLJyNAiwL+HmGrrNfVXFP6UIUtLZQNNmvXvEMwwEnOh28mQPcuArhvh
 R8OmiQim1WydqjbxGh0dD+BsnxRGogE9h0xui/HTpXV4yb5mSkLd8FuKrWmpmBNSkmDm
 1tbUD0QDku5IjxE2Cgfa8P6xhOnRcRAMXt2LwBIGotfoEa4Ha8SSLP56MeEJo5jHs+QN
 M7qA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=E7rvedLw
Subject: [Buildroot] [PATCH] package/iproute2: bump to version 6.5.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

remove upstream patches

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../0001-tc-add-missing-separator.patch       |  32 -----
 .../0002-tc-f_u32-fix-json-object-leak.patch  | 134 ------------------
 package/iproute2/iproute2.hash                |   2 +-
 package/iproute2/iproute2.mk                  |   2 +-
 4 files changed, 2 insertions(+), 168 deletions(-)
 delete mode 100644 package/iproute2/0001-tc-add-missing-separator.patch
 delete mode 100644 package/iproute2/0002-tc-f_u32-fix-json-object-leak.patch

diff --git a/package/iproute2/0001-tc-add-missing-separator.patch b/package/iproute2/0001-tc-add-missing-separator.patch
deleted file mode 100644
index 534b2c8f6..000000000
--- a/package/iproute2/0001-tc-add-missing-separator.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 4e0e56e0ef05387f7f5d8ab41fe6ec6a1897b26d Mon Sep 17 00:00:00 2001
-From: Christian Hesse <mail@eworm.de>
-Date: Thu, 23 Feb 2023 11:15:03 +0100
-Subject: [PATCH] tc: add missing separator
-Upstream: https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=4e0e56e0ef05387f7f5d8ab41fe6ec6a1897b26d
-
-This is missing a separator, that was accidently removed
-when JSON was added.
-
-Fixes: 010a8388aea1 ("tc: Add JSON output to tc-class")
-Signed-off-by: Christian Hesse <mail@eworm.de>
-Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
----
- tc/tc_class.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tc/tc_class.c b/tc/tc_class.c
-index c1feb009..096fa2ec 100644
---- a/tc/tc_class.c
-+++ b/tc/tc_class.c
-@@ -356,7 +356,7 @@ int print_class(struct nlmsghdr *n, void *arg)
- 		print_string(PRINT_ANY, "parent", "parent %s ", abuf);
- 	}
- 	if (t->tcm_info)
--		print_0xhex(PRINT_ANY, "leaf", "leaf %x", t->tcm_info>>16);
-+		print_0xhex(PRINT_ANY, "leaf", "leaf %x: ", t->tcm_info>>16);
- 
- 	q = get_qdisc_kind(RTA_DATA(tb[TCA_KIND]));
- 	if (tb[TCA_OPTIONS]) {
--- 
-2.40.0
-
diff --git a/package/iproute2/0002-tc-f_u32-fix-json-object-leak.patch b/package/iproute2/0002-tc-f_u32-fix-json-object-leak.patch
deleted file mode 100644
index 3d90fee56..000000000
--- a/package/iproute2/0002-tc-f_u32-fix-json-object-leak.patch
+++ /dev/null
@@ -1,134 +0,0 @@
-From 6637a6d512a940c3d9c101f4eaca3c1c7a36517c Mon Sep 17 00:00:00 2001
-From: Hangbin Liu <liuhangbin@gmail.com>
-Date: Tue, 28 Feb 2023 15:31:46 +0800
-Subject: [PATCH] tc: f_u32: fix json object leak
-Upstream: https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=6637a6d512a940c3d9c101f4eaca3c1c7a36517c
-
-Previously, the code returned directly within the switch statement in
-the functions print_{ipv4, ipv6}. While this approach was functional,
-after the commit 721435dc, we can no longer return directly because we
-need to close the match object. To resolve this issue, replace the return
-statement with break.
-
-Fixes: 721435dcfd92 ("tc: u32: add json support in `print_raw`, `print_ipv4`, `print_ipv6`")
-Signed-off-by: Hangbin Liu <liuhangbin@gmail.com>
-Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
----
- tc/f_u32.c | 24 ++++++++++--------------
- 1 file changed, 10 insertions(+), 14 deletions(-)
-
-diff --git a/tc/f_u32.c b/tc/f_u32.c
-index de2d0c9e..936dbd65 100644
---- a/tc/f_u32.c
-+++ b/tc/f_u32.c
-@@ -828,12 +828,12 @@ static void print_ipv4(FILE *f, const struct tc_u32_key *key)
- 			print_nl();
- 			print_uint(PRINT_ANY, "ip_ihl", "  match IP ihl %u",
- 				   ntohl(key->val) >> 24);
--			return;
-+			break;
- 		case 0x00ff0000:
- 			print_nl();
- 			print_0xhex(PRINT_ANY, "ip_dsfield", "  match IP dsfield %#x",
- 				    ntohl(key->val) >> 16);
--			return;
-+			break;
- 		}
- 		break;
- 	case 8:
-@@ -841,7 +841,6 @@ static void print_ipv4(FILE *f, const struct tc_u32_key *key)
- 			print_nl();
- 			print_int(PRINT_ANY, "ip_protocol", "  match IP protocol %d",
- 				  ntohl(key->val) >> 16);
--			return;
- 		}
- 		break;
- 	case 12:
-@@ -864,7 +863,6 @@ static void print_ipv4(FILE *f, const struct tc_u32_key *key)
- 				print_string(PRINT_ANY, "address", "%s", addr);
- 				print_int(PRINT_ANY, "prefixlen", "/%d", bits);
- 				close_json_object();
--				return;
- 			}
- 		}
- 		break;
-@@ -874,19 +872,19 @@ static void print_ipv4(FILE *f, const struct tc_u32_key *key)
- 		case 0x0000ffff:
- 			print_uint(PRINT_ANY, "dport", "match dport %u",
- 				   ntohl(key->val) & 0xffff);
--			return;
-+			break;
- 		case 0xffff0000:
- 			print_nl();
- 			print_uint(PRINT_ANY, "sport", "  match sport %u",
- 				   ntohl(key->val) >> 16);
--			return;
-+			break;
- 		case 0xffffffff:
- 			print_nl();
- 			print_uint(PRINT_ANY, "dport", "  match dport %u, ",
- 				   ntohl(key->val) & 0xffff);
- 			print_uint(PRINT_ANY, "sport", "match sport %u",
- 				   ntohl(key->val) >> 16);
--			return;
-+			break;
- 		}
- 		/* XXX: Default print_raw */
- 	}
-@@ -905,12 +903,12 @@ static void print_ipv6(FILE *f, const struct tc_u32_key *key)
- 			print_nl();
- 			print_uint(PRINT_ANY, "ip_ihl", "  match IP ihl %u",
- 				   ntohl(key->val) >> 24);
--			return;
-+			break;
- 		case 0x00ff0000:
- 			print_nl();
- 			print_0xhex(PRINT_ANY, "ip_dsfield", "  match IP dsfield %#x",
- 				    ntohl(key->val) >> 16);
--			return;
-+			break;
- 		}
- 		break;
- 	case 8:
-@@ -918,7 +916,6 @@ static void print_ipv6(FILE *f, const struct tc_u32_key *key)
- 			print_nl();
- 			print_int(PRINT_ANY, "ip_protocol", "  match IP protocol %d",
- 				  ntohl(key->val) >> 16);
--			return;
- 		}
- 		break;
- 	case 12:
-@@ -941,7 +938,6 @@ static void print_ipv6(FILE *f, const struct tc_u32_key *key)
- 				print_string(PRINT_ANY, "address", "%s", addr);
- 				print_int(PRINT_ANY, "prefixlen", "/%d", bits);
- 				close_json_object();
--				return;
- 			}
- 		}
- 		break;
-@@ -952,11 +948,11 @@ static void print_ipv6(FILE *f, const struct tc_u32_key *key)
- 			print_nl();
- 			print_uint(PRINT_ANY, "sport", "  match sport %u",
- 				   ntohl(key->val) & 0xffff);
--			return;
-+			break;
- 		case 0xffff0000:
- 			print_uint(PRINT_ANY, "dport", "match dport %u",
- 				   ntohl(key->val) >> 16);
--			return;
-+			break;
- 		case 0xffffffff:
- 			print_nl();
- 			print_uint(PRINT_ANY, "sport", "  match sport %u, ",
-@@ -964,7 +960,7 @@ static void print_ipv6(FILE *f, const struct tc_u32_key *key)
- 			print_uint(PRINT_ANY, "dport", "match dport %u",
- 				   ntohl(key->val) >> 16);
- 
--			return;
-+			break;
- 		}
- 		/* XXX: Default print_raw */
- 	}
--- 
-2.40.0
-
diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index d1ab93618..edd03b645 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256  4d72730200ec5b2aabaa1a2f20553c6748292f065d9a154c7d5e22559df9fd62  iproute2-6.2.0.tar.xz
+sha256  a70179085fa1b96d3c33b040c809b75e2b57563adc505a4ad05e2609df373463  iproute2-6.5.0.tar.xz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 49a65516d..a2e90a66f 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 6.2.0
+IPROUTE2_VERSION = 6.5.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
