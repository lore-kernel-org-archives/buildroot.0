Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7171EC636D4
	for <buildroot@archiver.kernel.org>; Mon, 13 Feb 2023 18:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18489409E9;
	Mon, 13 Feb 2023 18:18:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18489409E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MVHQF5is_t-X; Mon, 13 Feb 2023 18:18:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3EF4E409D5;
	Mon, 13 Feb 2023 18:18:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EF4E409D5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F3EB01BF289
 for <buildroot@lists.busybox.net>; Mon, 13 Feb 2023 18:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CDA7D81B72
 for <buildroot@lists.busybox.net>; Mon, 13 Feb 2023 18:18:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDA7D81B72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G1_1wkW95M5a for <buildroot@lists.busybox.net>;
 Mon, 13 Feb 2023 18:18:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90F7B81B6D
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 90F7B81B6D
 for <buildroot@buildroot.org>; Mon, 13 Feb 2023 18:18:01 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 f23-20020a05600c491700b003dff4480a17so8688217wmp.1
 for <buildroot@buildroot.org>; Mon, 13 Feb 2023 10:18:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qUHMzDdPEoI67aHuj/Je7yMU35rkDW9rBRSyZNU5G3w=;
 b=3zqlEkpiVs+Vq8cVB+mYzSm02cnlUonyB06Hg5AopqydodZxW9BfrCCdpEja0ZwG50
 aSULUUoTCaueMPUkJk2S3klL+nF5buhjbkMcspykE9u1ziJkkf+49zXpzuMJK4fT2oKS
 O7jDqCdxbs/H+cSvA8yEzD/pkRfIYsu2Br2OvgOD1PHyl4mImuvSVB5GDP/hfIukErt0
 Ak3Uui+7PVi6QXB1y3NKvCU1wCZkkbgvh41+HjHU+ttKHPsBQeB0C51h1y97n6QPx/3N
 0ZwppGZyLAwcEa7DsBeydREe2hUTqXTyeoMNKnO2Ar+1b0RvdwdZIWlFNx/T6ObjWSYY
 XVVw==
X-Gm-Message-State: AO0yUKVNbE9Z5Do5GLTYRcI/NAKVuZt/9bcHr4pGT4acqQWQ6wOAyNlN
 fpIrPRlY5A6zjVVLIYPH0yUZGMwhN24=
X-Google-Smtp-Source: AK7set8cCVep3kvvQWzCmUpdj47nIqJVKMfRuUA4ZsUXGcBTN86YBx5SWg6ImquiSCKqOAY5UFPqjg==
X-Received: by 2002:a05:600c:1604:b0:3d2:3be4:2d9a with SMTP id
 m4-20020a05600c160400b003d23be42d9amr19907336wmn.20.1676312279613; 
 Mon, 13 Feb 2023 10:17:59 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 bg1-20020a05600c3c8100b003e118684d56sm15792057wmb.45.2023.02.13.10.17.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 10:17:59 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 13 Feb 2023 19:17:54 +0100
Message-Id: <20230213181754.913323-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qUHMzDdPEoI67aHuj/Je7yMU35rkDW9rBRSyZNU5G3w=;
 b=YvP7J+gtSRL7KpPdrH2L7NO5eb/iVBeouLpomNhR/8ZXaSlX7mYM9U6mBtsdNhq2Ex
 kSFYTIoTQ8m41ecqiZUUv9nAj7ML+c4+Tcn2IuQmWrpnM0kPjJpu7KilylLPMRAr4jGd
 +d681+U0hK8DxxWcyNwfB50Uvy/Ha/yGmAwhK3+AeDqQWrK9R2vfyYxVTJ/HCnkcs2P8
 mDIjAG3MMYjh+cNStcwwLnNbLQDJSDYEJ0RJ7pxjewAIE2u255EShRH6Z0K0rvJ1C4FJ
 qT2mW9TF1ZYGeYL25bRfVKCojJo5Cv+261vHdF//XUhUi0bHhj4IWdZWDzxpSV084bhB
 4hqA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YvP7J+gt
Subject: [Buildroot] [PATCH 1/1] package/open-iscsi: fix libressl build
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
Cc: TIAN Yuanhao <tianyuanhao3@163.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following libressl build failure raised since the addition of
the package in commit 2a571acddd0badaf9636649d98fd095757878348:

/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/or1k-buildroot-linux-gnu/11.3.0/../../../../or1k-buildroot-linux-gnu/bin/ld: iscsid.p/usr_auth.c.o: in function `auth_hash_init':
auth.c:(.text+0x7bc): undefined reference to `EVP_sha3_256'

Fixes:
 - http://autobuild.buildroot.org/results/48a4bddc355956733d712214797350cca8e111d9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...01-SHA3-is-not-supported-by-libressl.patch | 144 ++++++++++++++++++
 1 file changed, 144 insertions(+)
 create mode 100644 package/open-iscsi/0001-SHA3-is-not-supported-by-libressl.patch

diff --git a/package/open-iscsi/0001-SHA3-is-not-supported-by-libressl.patch b/package/open-iscsi/0001-SHA3-is-not-supported-by-libressl.patch
new file mode 100644
index 0000000000..0423179d93
--- /dev/null
+++ b/package/open-iscsi/0001-SHA3-is-not-supported-by-libressl.patch
@@ -0,0 +1,144 @@
+From 29a4c3a518d13bfc0a07915e7e87fbec2b66597c Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 13 Feb 2023 08:55:11 +0100
+Subject: [PATCH] SHA3 is not supported by libressl
+
+Disable SHA3 with libressl as it is not supported resulting in the
+following build failure:
+
+/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/or1k-buildroot-linux-gnu/11.3.0/../../../../or1k-buildroot-linux-gnu/bin/ld: iscsid.p/usr_auth.c.o: in function `auth_hash_init':
+auth.c:(.text+0x7bc): undefined reference to `EVP_sha3_256'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/48a4bddc355956733d712214797350cca8e111d9
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/open-iscsi/open-iscsi/pull/396]
+---
+ libopeniscsiusr/idbm.h |  2 ++
+ usr/auth.c             | 13 ++++++++++++-
+ usr/auth.h             |  4 ++++
+ usr/idbm.c             |  2 ++
+ 4 files changed, 20 insertions(+), 1 deletion(-)
+
+diff --git a/libopeniscsiusr/idbm.h b/libopeniscsiusr/idbm.h
+index be5986f..1043b27 100644
+--- a/libopeniscsiusr/idbm.h
++++ b/libopeniscsiusr/idbm.h
+@@ -56,7 +56,9 @@ enum iscsi_chap_algs {
+ 	ISCSI_AUTH_CHAP_ALG_MD5 = 5,
+ 	ISCSI_AUTH_CHAP_ALG_SHA1 = 6,
+ 	ISCSI_AUTH_CHAP_ALG_SHA256 = 7,
++#ifndef LIBRESSL_VERSION_NUMBER
+ 	ISCSI_AUTH_CHAP_ALG_SHA3_256 = 8,
++#endif
+ 	AUTH_CHAP_ALG_MAX_COUNT = 5,
+ };
+ 
+diff --git a/usr/auth.c b/usr/auth.c
+index 46c328e..5f50e26 100644
+--- a/usr/auth.c
++++ b/usr/auth.c
+@@ -181,9 +181,11 @@ static int auth_hash_init(EVP_MD_CTX **context, int chap_alg) {
+ 	case AUTH_CHAP_ALG_SHA256:
+ 		digest = EVP_sha256();
+ 		break;
++#ifndef LIBRESSL_VERSION_NUMBER
+ 	case AUTH_CHAP_ALG_SHA3_256:
+ 		digest = EVP_sha3_256();
+ 		break;
++#endif
+ 	}
+ 
+ 	if (*context == NULL)
+@@ -298,7 +300,9 @@ static int
+ acl_chk_chap_alg_optn(int chap_algorithm)
+ {
+ 	if (chap_algorithm == AUTH_OPTION_NONE ||
++#ifndef LIBRESSL_VERSION_NUMBER
+ 	    chap_algorithm == AUTH_CHAP_ALG_SHA3_256 ||
++#endif
+ 	    chap_algorithm == AUTH_CHAP_ALG_SHA256 ||
+ 	    chap_algorithm == AUTH_CHAP_ALG_SHA1 ||
+ 	    chap_algorithm == AUTH_CHAP_ALG_MD5)
+@@ -711,9 +715,11 @@ acl_chk_chap_alg_key(struct iscsi_acl *client)
+ 				case AUTH_CHAP_ALG_SHA256:
+ 					client->chap_challenge_len = AUTH_CHAP_SHA256_RSP_LEN;
+ 					break;
++#ifndef LIBRESSL_VERSION_NUMBER
+ 				case AUTH_CHAP_ALG_SHA3_256:
+ 					client->chap_challenge_len = AUTH_CHAP_SHA3_256_RSP_LEN;
+ 					break;
++#endif
+ 				}
+ 				return;
+ 			}
+@@ -862,7 +868,10 @@ acl_local_auth(struct iscsi_acl *client)
+ 			client->local_state = AUTH_LOCAL_STATE_ERROR;
+ 			client->dbg_status = AUTH_DBG_STATUS_CHAP_ALG_REJECT;
+ 			break;
+-		} else if ((client->negotiated_chap_alg != AUTH_CHAP_ALG_SHA3_256) &&
++		} else if (
++#ifndef LIBRESSL_VERSION_NUMBER
++			   (client->negotiated_chap_alg != AUTH_CHAP_ALG_SHA3_256) &&
++#endif
+ 			   (client->negotiated_chap_alg != AUTH_CHAP_ALG_SHA256) &&
+ 			   (client->negotiated_chap_alg != AUTH_CHAP_ALG_SHA1) &&
+ 			   (client->negotiated_chap_alg != AUTH_CHAP_ALG_MD5)) {
+@@ -1824,6 +1833,7 @@ acl_init_chap_digests(int *value_list, unsigned *chap_algs, int conf_count) {
+ 				            "SHA256 due to crypto lib configuration");
+ 			}
+ 			break;
++#ifndef LIBRESSL_VERSION_NUMBER
+ 		case AUTH_CHAP_ALG_SHA3_256:
+ 			if (EVP_DigestInit_ex(context, EVP_sha3_256(), NULL)) {
+ 				value_list[i++] = AUTH_CHAP_ALG_SHA3_256;
+@@ -1832,6 +1842,7 @@ acl_init_chap_digests(int *value_list, unsigned *chap_algs, int conf_count) {
+ 				            "SHA3-256 due to crypto lib configuration");
+ 			}
+ 			break;
++#endif
+ 		case ~0:
+ 			/* unset value in array, just ignore */
+ 			break;
+diff --git a/usr/auth.h b/usr/auth.h
+index 16cdb24..9357772 100644
+--- a/usr/auth.h
++++ b/usr/auth.h
+@@ -32,7 +32,9 @@ enum {
+ 	AUTH_CHAP_MD5_RSP_LEN = 16,
+ 	AUTH_CHAP_SHA1_RSP_LEN = 20,
+ 	AUTH_CHAP_SHA256_RSP_LEN = 32,
++#ifndef LIBRESSL_VERSION_NUMBER
+ 	AUTH_CHAP_SHA3_256_RSP_LEN = 32,
++#endif
+ 	AUTH_CHAP_RSP_MAX = 32,
+ };
+ 
+@@ -67,7 +69,9 @@ enum {
+ 	AUTH_CHAP_ALG_MD5 = 5,
+ 	AUTH_CHAP_ALG_SHA1 = 6,
+ 	AUTH_CHAP_ALG_SHA256 = 7,
++#ifndef LIBRESSL_VERSION_NUMBER
+ 	AUTH_CHAP_ALG_SHA3_256 = 8,
++#endif
+ 	AUTH_CHAP_ALG_MAX_COUNT = 5
+ };
+ 
+diff --git a/usr/idbm.c b/usr/idbm.c
+index 90bc142..082e1c6 100644
+--- a/usr/idbm.c
++++ b/usr/idbm.c
+@@ -200,7 +200,9 @@ static struct int_list_tbl {
+ 	{ "MD5", AUTH_CHAP_ALG_MD5 },
+ 	{ "SHA1", AUTH_CHAP_ALG_SHA1 },
+ 	{ "SHA256", AUTH_CHAP_ALG_SHA256 },
++#ifndef LIBRESSL_VERSION_NUMBER
+ 	{ "SHA3-256", AUTH_CHAP_ALG_SHA3_256 },
++#endif
+ };
+ 
+ static void
+-- 
+2.39.0
+
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
