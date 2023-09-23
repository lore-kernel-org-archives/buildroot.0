Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A80CE7A88
	for <buildroot@archiver.kernel.org>; Sat, 23 Sep 2023 20:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71F8740646;
	Sat, 23 Sep 2023 20:54:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71F8740646
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yIHZ_44rSuYH; Sat, 23 Sep 2023 20:54:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74D6A414BF;
	Sat, 23 Sep 2023 20:54:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74D6A414BF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 331EC1BF292
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 20:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0BE55414BF
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 20:54:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0BE55414BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uNoe9wIZFh5r for <buildroot@lists.busybox.net>;
 Sat, 23 Sep 2023 20:54:42 +0000 (UTC)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8E41040646
 for <buildroot@buildroot.org>; Sat, 23 Sep 2023 20:54:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E41040646
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3231eff8aecso131442f8f.1
 for <buildroot@buildroot.org>; Sat, 23 Sep 2023 13:54:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695502480; x=1696107280;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FgrWDBu1KnwRF/fpPR++xlJ9Dzfn4jKzRqVuQGTod14=;
 b=I1oD0ZAvzfdZGjkq7v+Q/vlwdqkf+di0rIico+g1MTnnijWTyyQOcaY3VbhpLm8g1B
 mM3XMsHp8HILepZpNcblE0wFZL2P5EMC07ZQfh3YdrfepZOvlWOwei8uDU1kQcAVlwRm
 JVhrk7+pnP9ViB47jkiu9EyMZMtPwLV/EBXwnWtbuI27ek6WjlRz0zAEbMwAI7AlMna4
 IH/VXc4g2/5+cnu85RSqOhjOV6wNWl1JCDElxeaIZreSNc9LAz/KYcZV2WewsWKXIz0u
 EMwRSzdn5PyMciv+0A4iVCoRfVh1iOixEdBEtPXKcJMzr8pr01YYp/SN+3l/axFAhvAk
 xIaA==
X-Gm-Message-State: AOJu0YwT1F/ZjiaGcvRHmo16U2UgNX/dnCcSEW4sjOh0EsgMmcD+bk+g
 ofXiew9qtF9Vckn9qduatLUyqjtUZI4=
X-Google-Smtp-Source: AGHT+IExb2/6m74Qaa9SrMTK/q45CqE5QbNZseTxqOJAaWqptZPaVlPkNJ7M/d54m01hfYZkKZNaBg==
X-Received: by 2002:a5d:49cc:0:b0:31c:7ada:5e05 with SMTP id
 t12-20020a5d49cc000000b0031c7ada5e05mr2566780wrs.51.1695502480060; 
 Sat, 23 Sep 2023 13:54:40 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 d6-20020adff2c6000000b003217af3f530sm7845775wrp.0.2023.09.23.13.54.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Sep 2023 13:54:39 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Sep 2023 22:54:37 +0200
Message-Id: <20230923205437.259708-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695502480; x=1696107280; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FgrWDBu1KnwRF/fpPR++xlJ9Dzfn4jKzRqVuQGTod14=;
 b=W8VNIKD0kcJYk2v2Nl/M1Q8x5yStdnESYGO3MjdGTgzMI/WbbmlLtnR4UIEyVWpY6b
 NuqdV+s3E9sXF6jYaxeaL8BjYryibCPZ7l76fsk2qJM3pQxJipyXRTUOIvvSPQQDy5VA
 iI/3kywlJYykym3gvbNfv7aD44eDdwTbohkVodHCrPpVt9Y3C1QoFO4Stq8A2eUvSaaI
 tj/wG37BbDGaqC0VaiJ3fgASe0si2nIp5AtkD0y9xXceVfYfEMgWkBfmAlhjRyD23JXZ
 9BqIIlxGGSPH+KX8vQtdsePd1fxt75Y4n1BOkWvIXUNWBamseKVPuxRsiTLDHJtACS7R
 1X6A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=W8VNIKD0
Subject: [Buildroot] [PATCH 1/1] package/open-iscsi: bump to version 2.1.9
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

- Drop patch (already in version)
- Drop license comment and add REAMDE and libopeniscsiusr/COPYING as
  license files due to
  https://github.com/open-iscsi/open-iscsi/commit/10d50ed4bcf9ef6820f7fe544df0c3605ea4144f

https://github.com/open-iscsi/open-iscsi/blob/2.1.9/Changelog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                           |   1 -
 ...01-SHA3-is-not-supported-by-libressl.patch | 144 ------------------
 package/open-iscsi/open-iscsi.hash            |   4 +-
 package/open-iscsi/open-iscsi.mk              |   8 +-
 4 files changed, 6 insertions(+), 151 deletions(-)
 delete mode 100644 package/open-iscsi/0001-SHA3-is-not-supported-by-libressl.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 8acd9558eb..b9f06a7c11 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1025,7 +1025,6 @@ package/olsr/0003-pud-adapt-to-API-changes-in-gpsd-3-20.patch Upstream
 package/olsr/0005-lib-pud-src-gpsdclient.c-drop-handling-of-gpsdata-fi.patch Upstream
 package/olsr/S50olsr Indent Shellcheck Variables
 package/omxplayer/0001-Update-Makefile-to-be-compatible-with-buildroot.patch Upstream
-package/open-iscsi/0001-SHA3-is-not-supported-by-libressl.patch Upstream
 package/open-plc-utils/0001-Remove-OWNER-and-GROUPS-parameters-to-install.patch Upstream
 package/open2300/0001-fix-makefile.patch Upstream
 package/openjdk/17.0.8+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch Upstream
diff --git a/package/open-iscsi/0001-SHA3-is-not-supported-by-libressl.patch b/package/open-iscsi/0001-SHA3-is-not-supported-by-libressl.patch
deleted file mode 100644
index 0423179d93..0000000000
--- a/package/open-iscsi/0001-SHA3-is-not-supported-by-libressl.patch
+++ /dev/null
@@ -1,144 +0,0 @@
-From 29a4c3a518d13bfc0a07915e7e87fbec2b66597c Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 13 Feb 2023 08:55:11 +0100
-Subject: [PATCH] SHA3 is not supported by libressl
-
-Disable SHA3 with libressl as it is not supported resulting in the
-following build failure:
-
-/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/or1k-buildroot-linux-gnu/11.3.0/../../../../or1k-buildroot-linux-gnu/bin/ld: iscsid.p/usr_auth.c.o: in function `auth_hash_init':
-auth.c:(.text+0x7bc): undefined reference to `EVP_sha3_256'
-
-Fixes:
- - http://autobuild.buildroot.org/results/48a4bddc355956733d712214797350cca8e111d9
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/open-iscsi/open-iscsi/pull/396]
----
- libopeniscsiusr/idbm.h |  2 ++
- usr/auth.c             | 13 ++++++++++++-
- usr/auth.h             |  4 ++++
- usr/idbm.c             |  2 ++
- 4 files changed, 20 insertions(+), 1 deletion(-)
-
-diff --git a/libopeniscsiusr/idbm.h b/libopeniscsiusr/idbm.h
-index be5986f..1043b27 100644
---- a/libopeniscsiusr/idbm.h
-+++ b/libopeniscsiusr/idbm.h
-@@ -56,7 +56,9 @@ enum iscsi_chap_algs {
- 	ISCSI_AUTH_CHAP_ALG_MD5 = 5,
- 	ISCSI_AUTH_CHAP_ALG_SHA1 = 6,
- 	ISCSI_AUTH_CHAP_ALG_SHA256 = 7,
-+#ifndef LIBRESSL_VERSION_NUMBER
- 	ISCSI_AUTH_CHAP_ALG_SHA3_256 = 8,
-+#endif
- 	AUTH_CHAP_ALG_MAX_COUNT = 5,
- };
- 
-diff --git a/usr/auth.c b/usr/auth.c
-index 46c328e..5f50e26 100644
---- a/usr/auth.c
-+++ b/usr/auth.c
-@@ -181,9 +181,11 @@ static int auth_hash_init(EVP_MD_CTX **context, int chap_alg) {
- 	case AUTH_CHAP_ALG_SHA256:
- 		digest = EVP_sha256();
- 		break;
-+#ifndef LIBRESSL_VERSION_NUMBER
- 	case AUTH_CHAP_ALG_SHA3_256:
- 		digest = EVP_sha3_256();
- 		break;
-+#endif
- 	}
- 
- 	if (*context == NULL)
-@@ -298,7 +300,9 @@ static int
- acl_chk_chap_alg_optn(int chap_algorithm)
- {
- 	if (chap_algorithm == AUTH_OPTION_NONE ||
-+#ifndef LIBRESSL_VERSION_NUMBER
- 	    chap_algorithm == AUTH_CHAP_ALG_SHA3_256 ||
-+#endif
- 	    chap_algorithm == AUTH_CHAP_ALG_SHA256 ||
- 	    chap_algorithm == AUTH_CHAP_ALG_SHA1 ||
- 	    chap_algorithm == AUTH_CHAP_ALG_MD5)
-@@ -711,9 +715,11 @@ acl_chk_chap_alg_key(struct iscsi_acl *client)
- 				case AUTH_CHAP_ALG_SHA256:
- 					client->chap_challenge_len = AUTH_CHAP_SHA256_RSP_LEN;
- 					break;
-+#ifndef LIBRESSL_VERSION_NUMBER
- 				case AUTH_CHAP_ALG_SHA3_256:
- 					client->chap_challenge_len = AUTH_CHAP_SHA3_256_RSP_LEN;
- 					break;
-+#endif
- 				}
- 				return;
- 			}
-@@ -862,7 +868,10 @@ acl_local_auth(struct iscsi_acl *client)
- 			client->local_state = AUTH_LOCAL_STATE_ERROR;
- 			client->dbg_status = AUTH_DBG_STATUS_CHAP_ALG_REJECT;
- 			break;
--		} else if ((client->negotiated_chap_alg != AUTH_CHAP_ALG_SHA3_256) &&
-+		} else if (
-+#ifndef LIBRESSL_VERSION_NUMBER
-+			   (client->negotiated_chap_alg != AUTH_CHAP_ALG_SHA3_256) &&
-+#endif
- 			   (client->negotiated_chap_alg != AUTH_CHAP_ALG_SHA256) &&
- 			   (client->negotiated_chap_alg != AUTH_CHAP_ALG_SHA1) &&
- 			   (client->negotiated_chap_alg != AUTH_CHAP_ALG_MD5)) {
-@@ -1824,6 +1833,7 @@ acl_init_chap_digests(int *value_list, unsigned *chap_algs, int conf_count) {
- 				            "SHA256 due to crypto lib configuration");
- 			}
- 			break;
-+#ifndef LIBRESSL_VERSION_NUMBER
- 		case AUTH_CHAP_ALG_SHA3_256:
- 			if (EVP_DigestInit_ex(context, EVP_sha3_256(), NULL)) {
- 				value_list[i++] = AUTH_CHAP_ALG_SHA3_256;
-@@ -1832,6 +1842,7 @@ acl_init_chap_digests(int *value_list, unsigned *chap_algs, int conf_count) {
- 				            "SHA3-256 due to crypto lib configuration");
- 			}
- 			break;
-+#endif
- 		case ~0:
- 			/* unset value in array, just ignore */
- 			break;
-diff --git a/usr/auth.h b/usr/auth.h
-index 16cdb24..9357772 100644
---- a/usr/auth.h
-+++ b/usr/auth.h
-@@ -32,7 +32,9 @@ enum {
- 	AUTH_CHAP_MD5_RSP_LEN = 16,
- 	AUTH_CHAP_SHA1_RSP_LEN = 20,
- 	AUTH_CHAP_SHA256_RSP_LEN = 32,
-+#ifndef LIBRESSL_VERSION_NUMBER
- 	AUTH_CHAP_SHA3_256_RSP_LEN = 32,
-+#endif
- 	AUTH_CHAP_RSP_MAX = 32,
- };
- 
-@@ -67,7 +69,9 @@ enum {
- 	AUTH_CHAP_ALG_MD5 = 5,
- 	AUTH_CHAP_ALG_SHA1 = 6,
- 	AUTH_CHAP_ALG_SHA256 = 7,
-+#ifndef LIBRESSL_VERSION_NUMBER
- 	AUTH_CHAP_ALG_SHA3_256 = 8,
-+#endif
- 	AUTH_CHAP_ALG_MAX_COUNT = 5
- };
- 
-diff --git a/usr/idbm.c b/usr/idbm.c
-index 90bc142..082e1c6 100644
---- a/usr/idbm.c
-+++ b/usr/idbm.c
-@@ -200,7 +200,9 @@ static struct int_list_tbl {
- 	{ "MD5", AUTH_CHAP_ALG_MD5 },
- 	{ "SHA1", AUTH_CHAP_ALG_SHA1 },
- 	{ "SHA256", AUTH_CHAP_ALG_SHA256 },
-+#ifndef LIBRESSL_VERSION_NUMBER
- 	{ "SHA3-256", AUTH_CHAP_ALG_SHA3_256 },
-+#endif
- };
- 
- static void
--- 
-2.39.0
-
diff --git a/package/open-iscsi/open-iscsi.hash b/package/open-iscsi/open-iscsi.hash
index 9fd651cae8..de75cbf1e9 100644
--- a/package/open-iscsi/open-iscsi.hash
+++ b/package/open-iscsi/open-iscsi.hash
@@ -1,3 +1,5 @@
 # Locally calculated
-sha256  9565bdf6b68b223e1e0d455d9a04d7536724a3f5b5a254e9398d06b2a0c6b6d2  open-iscsi-2.1.8.tar.gz
+sha256  60e2a1e3058a8af7f702e86a5a0511b05b8754d29d3d2df4e0e301399b5cf70a  open-iscsi-2.1.9.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  7e6580de9d99b680697d51ec0c5e88acd9ed329139d181472cc5a592d0684fa5  README
+sha256  e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118  libopeniscsiusr/COPYING
diff --git a/package/open-iscsi/open-iscsi.mk b/package/open-iscsi/open-iscsi.mk
index e5b965b80d..00370a339a 100644
--- a/package/open-iscsi/open-iscsi.mk
+++ b/package/open-iscsi/open-iscsi.mk
@@ -4,12 +4,10 @@
 #
 ################################################################################
 
-OPEN_ISCSI_VERSION = 2.1.8
+OPEN_ISCSI_VERSION = 2.1.9
 OPEN_ISCSI_SITE = $(call github,open-iscsi,open-iscsi,$(OPEN_ISCSI_VERSION))
-# The COPYING file says GPL-2.0, but there is some GPL-3.0+ code as
-# well. See https://github.com/open-iscsi/open-iscsi/issues/379
-OPEN_ISCSI_LICENSE = GPL-2.0+, GPL-3.0+
-OPEN_ISCSI_LICENSE_FILES = COPYING
+OPEN_ISCSI_LICENSE = GPL-2.0+, GPL-3.0+, LGPL-3.0+
+OPEN_ISCSI_LICENSE_FILES = COPYING README libopeniscsiusr/COPYING
 OPEN_ISCSI_CPE_ID_VENDOR = open-iscsi_project
 OPEN_ISCSI_DEPENDENCIES = kmod open-isns openssl util-linux
 
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
