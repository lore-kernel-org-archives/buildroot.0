Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0237C77B76
	for <buildroot@archiver.kernel.org>; Mon, 17 Apr 2023 19:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 508CB81F25;
	Mon, 17 Apr 2023 19:42:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 508CB81F25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tAsvBF6qrHfG; Mon, 17 Apr 2023 19:41:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D63D81F6A;
	Mon, 17 Apr 2023 19:41:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D63D81F6A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 813701BF2CA
 for <buildroot@lists.busybox.net>; Mon, 17 Apr 2023 19:41:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A43E40462
 for <buildroot@lists.busybox.net>; Mon, 17 Apr 2023 19:41:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A43E40462
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oanGCmHrQp1W for <buildroot@lists.busybox.net>;
 Mon, 17 Apr 2023 19:41:54 +0000 (UTC)
X-Greylist: delayed 23:24:27 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 697C8401C9
Received: from mxd-2-a2f.seznam.cz (mxd-2-a2f.seznam.cz
 [IPv6:2a02:598:64:8a00::1000:a2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 697C8401C9
 for <buildroot@buildroot.org>; Mon, 17 Apr 2023 19:41:54 +0000 (UTC)
Received: from email.seznam.cz by smtpc-mxd-6fdf5f5c8f-nc7j9
 (smtpc-mxd-6fdf5f5c8f-nc7j9 [2a02:598:64:8a00::1000:a2f])
 id 50d574f4e6f5cbaf50d2ca83; Mon, 17 Apr 2023 21:41:52 +0200 (CEST)
Received: from localhost.localdomain (mail.ms-free.net [185.147.46.46])
 by smtpd-relay-6f4cd59c79-tw52f (smtpd/2.0.10) with ESMTPA
 id 61d8be6f-9291-4994-9a49-0eb3af4fb042;
 Mon, 17 Apr 2023 21:41:32 +0200
From: Petr Vorel <pevik@seznam.cz>
To: buildroot@buildroot.org
Date: Mon, 17 Apr 2023 21:41:30 +0200
Message-Id: <20230417194130.2442781-1-pevik@seznam.cz>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=seznam.cz; s=szn20221014; t=1681760512;
 bh=cRHMUr3TzRZhsaosu2Ye29f+nybw7qA+XM/zfTlK4L0=;
 h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
 Content-Transfer-Encoding;
 b=f/CmCV6tUvJhB5nsy4aahnv7TENw2W4GJ6t8xRULOpcw0lVk7EOMbffjuFe/xJlLk
 LO3Ys/1fhoCacczUzzYvEXdMGTGlw6kXcc8MRbXx7acAecQpuAZfQXqLUg4RJeiB3D
 WSkoH5YPM/H4nJqjnSfD5Lk5seDzOiDL6ECz8Hfp/rlWYBV6aogVNQccqEzC8O65rY
 PKgPfoWWpI+KQAOijQHVW+ADhFLw8UWuyRaaHbIN+t3Y0zfUIWq3hCs4A8adOg8f97
 OR9xwyvG1QnTkvNcoaL2Nlp2CquoJNDV39BSNJ0VVjuVnp5gKNTYYNhGAg1v2Szg60
 mbeUm/QM46nQQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=seznam.cz header.i=@seznam.cz
 header.a=rsa-sha256 header.s=szn20221014 header.b=f/CmCV6t
Subject: [Buildroot] [PATCH] package/iproute2: bump version to 6.2.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Petr Vorel <petr.vorel@gmail.com>

Backport 2 fixes from upcoming release (memory leak and incorrect JSON
output).

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Tested:
                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
(will run the rest)

Kind regards,
Petr

 .../0001-tc-add-missing-separator.patch       |  32 +++++
 .../0002-tc-f_u32-fix-json-object-leak.patch  | 134 ++++++++++++++++++
 package/iproute2/iproute2.hash                |   2 +-
 package/iproute2/iproute2.mk                  |   2 +-
 4 files changed, 168 insertions(+), 2 deletions(-)
 create mode 100644 package/iproute2/0001-tc-add-missing-separator.patch
 create mode 100644 package/iproute2/0002-tc-f_u32-fix-json-object-leak.patch

diff --git a/package/iproute2/0001-tc-add-missing-separator.patch b/package/iproute2/0001-tc-add-missing-separator.patch
new file mode 100644
index 0000000000..534b2c8f6b
--- /dev/null
+++ b/package/iproute2/0001-tc-add-missing-separator.patch
@@ -0,0 +1,32 @@
+From 4e0e56e0ef05387f7f5d8ab41fe6ec6a1897b26d Mon Sep 17 00:00:00 2001
+From: Christian Hesse <mail@eworm.de>
+Date: Thu, 23 Feb 2023 11:15:03 +0100
+Subject: [PATCH] tc: add missing separator
+Upstream: https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=4e0e56e0ef05387f7f5d8ab41fe6ec6a1897b26d
+
+This is missing a separator, that was accidently removed
+when JSON was added.
+
+Fixes: 010a8388aea1 ("tc: Add JSON output to tc-class")
+Signed-off-by: Christian Hesse <mail@eworm.de>
+Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
+---
+ tc/tc_class.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tc/tc_class.c b/tc/tc_class.c
+index c1feb009..096fa2ec 100644
+--- a/tc/tc_class.c
++++ b/tc/tc_class.c
+@@ -356,7 +356,7 @@ int print_class(struct nlmsghdr *n, void *arg)
+ 		print_string(PRINT_ANY, "parent", "parent %s ", abuf);
+ 	}
+ 	if (t->tcm_info)
+-		print_0xhex(PRINT_ANY, "leaf", "leaf %x", t->tcm_info>>16);
++		print_0xhex(PRINT_ANY, "leaf", "leaf %x: ", t->tcm_info>>16);
+ 
+ 	q = get_qdisc_kind(RTA_DATA(tb[TCA_KIND]));
+ 	if (tb[TCA_OPTIONS]) {
+-- 
+2.40.0
+
diff --git a/package/iproute2/0002-tc-f_u32-fix-json-object-leak.patch b/package/iproute2/0002-tc-f_u32-fix-json-object-leak.patch
new file mode 100644
index 0000000000..3d90fee56c
--- /dev/null
+++ b/package/iproute2/0002-tc-f_u32-fix-json-object-leak.patch
@@ -0,0 +1,134 @@
+From 6637a6d512a940c3d9c101f4eaca3c1c7a36517c Mon Sep 17 00:00:00 2001
+From: Hangbin Liu <liuhangbin@gmail.com>
+Date: Tue, 28 Feb 2023 15:31:46 +0800
+Subject: [PATCH] tc: f_u32: fix json object leak
+Upstream: https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=6637a6d512a940c3d9c101f4eaca3c1c7a36517c
+
+Previously, the code returned directly within the switch statement in
+the functions print_{ipv4, ipv6}. While this approach was functional,
+after the commit 721435dc, we can no longer return directly because we
+need to close the match object. To resolve this issue, replace the return
+statement with break.
+
+Fixes: 721435dcfd92 ("tc: u32: add json support in `print_raw`, `print_ipv4`, `print_ipv6`")
+Signed-off-by: Hangbin Liu <liuhangbin@gmail.com>
+Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
+---
+ tc/f_u32.c | 24 ++++++++++--------------
+ 1 file changed, 10 insertions(+), 14 deletions(-)
+
+diff --git a/tc/f_u32.c b/tc/f_u32.c
+index de2d0c9e..936dbd65 100644
+--- a/tc/f_u32.c
++++ b/tc/f_u32.c
+@@ -828,12 +828,12 @@ static void print_ipv4(FILE *f, const struct tc_u32_key *key)
+ 			print_nl();
+ 			print_uint(PRINT_ANY, "ip_ihl", "  match IP ihl %u",
+ 				   ntohl(key->val) >> 24);
+-			return;
++			break;
+ 		case 0x00ff0000:
+ 			print_nl();
+ 			print_0xhex(PRINT_ANY, "ip_dsfield", "  match IP dsfield %#x",
+ 				    ntohl(key->val) >> 16);
+-			return;
++			break;
+ 		}
+ 		break;
+ 	case 8:
+@@ -841,7 +841,6 @@ static void print_ipv4(FILE *f, const struct tc_u32_key *key)
+ 			print_nl();
+ 			print_int(PRINT_ANY, "ip_protocol", "  match IP protocol %d",
+ 				  ntohl(key->val) >> 16);
+-			return;
+ 		}
+ 		break;
+ 	case 12:
+@@ -864,7 +863,6 @@ static void print_ipv4(FILE *f, const struct tc_u32_key *key)
+ 				print_string(PRINT_ANY, "address", "%s", addr);
+ 				print_int(PRINT_ANY, "prefixlen", "/%d", bits);
+ 				close_json_object();
+-				return;
+ 			}
+ 		}
+ 		break;
+@@ -874,19 +872,19 @@ static void print_ipv4(FILE *f, const struct tc_u32_key *key)
+ 		case 0x0000ffff:
+ 			print_uint(PRINT_ANY, "dport", "match dport %u",
+ 				   ntohl(key->val) & 0xffff);
+-			return;
++			break;
+ 		case 0xffff0000:
+ 			print_nl();
+ 			print_uint(PRINT_ANY, "sport", "  match sport %u",
+ 				   ntohl(key->val) >> 16);
+-			return;
++			break;
+ 		case 0xffffffff:
+ 			print_nl();
+ 			print_uint(PRINT_ANY, "dport", "  match dport %u, ",
+ 				   ntohl(key->val) & 0xffff);
+ 			print_uint(PRINT_ANY, "sport", "match sport %u",
+ 				   ntohl(key->val) >> 16);
+-			return;
++			break;
+ 		}
+ 		/* XXX: Default print_raw */
+ 	}
+@@ -905,12 +903,12 @@ static void print_ipv6(FILE *f, const struct tc_u32_key *key)
+ 			print_nl();
+ 			print_uint(PRINT_ANY, "ip_ihl", "  match IP ihl %u",
+ 				   ntohl(key->val) >> 24);
+-			return;
++			break;
+ 		case 0x00ff0000:
+ 			print_nl();
+ 			print_0xhex(PRINT_ANY, "ip_dsfield", "  match IP dsfield %#x",
+ 				    ntohl(key->val) >> 16);
+-			return;
++			break;
+ 		}
+ 		break;
+ 	case 8:
+@@ -918,7 +916,6 @@ static void print_ipv6(FILE *f, const struct tc_u32_key *key)
+ 			print_nl();
+ 			print_int(PRINT_ANY, "ip_protocol", "  match IP protocol %d",
+ 				  ntohl(key->val) >> 16);
+-			return;
+ 		}
+ 		break;
+ 	case 12:
+@@ -941,7 +938,6 @@ static void print_ipv6(FILE *f, const struct tc_u32_key *key)
+ 				print_string(PRINT_ANY, "address", "%s", addr);
+ 				print_int(PRINT_ANY, "prefixlen", "/%d", bits);
+ 				close_json_object();
+-				return;
+ 			}
+ 		}
+ 		break;
+@@ -952,11 +948,11 @@ static void print_ipv6(FILE *f, const struct tc_u32_key *key)
+ 			print_nl();
+ 			print_uint(PRINT_ANY, "sport", "  match sport %u",
+ 				   ntohl(key->val) & 0xffff);
+-			return;
++			break;
+ 		case 0xffff0000:
+ 			print_uint(PRINT_ANY, "dport", "match dport %u",
+ 				   ntohl(key->val) >> 16);
+-			return;
++			break;
+ 		case 0xffffffff:
+ 			print_nl();
+ 			print_uint(PRINT_ANY, "sport", "  match sport %u, ",
+@@ -964,7 +960,7 @@ static void print_ipv6(FILE *f, const struct tc_u32_key *key)
+ 			print_uint(PRINT_ANY, "dport", "match dport %u",
+ 				   ntohl(key->val) >> 16);
+ 
+-			return;
++			break;
+ 		}
+ 		/* XXX: Default print_raw */
+ 	}
+-- 
+2.40.0
+
diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index 9e8be43f2b..d1ab936181 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256  5ce12a0fec6b212725ef218735941b2dab76244db7e72646a76021b0537b43ab  iproute2-6.1.0.tar.xz
+sha256  4d72730200ec5b2aabaa1a2f20553c6748292f065d9a154c7d5e22559df9fd62  iproute2-6.2.0.tar.xz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 9792630f15..15af076db9 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 6.1.0
+IPROUTE2_VERSION = 6.2.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
