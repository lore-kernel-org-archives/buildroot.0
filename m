Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C4FC636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E198610DD;
	Tue, 21 Feb 2023 00:57:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E198610DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jWeDbyJLyIKr; Tue, 21 Feb 2023 00:57:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3C0B61110;
	Tue, 21 Feb 2023 00:57:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3C0B61110
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 752051BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0979C41823
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0979C41823
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id myDTfj8sXg49 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:53:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A3604181E
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:53:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A3604181E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 05D0886495; Mon, 20 Feb 2023 20:53:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 15 Feb 2023 22:38:54 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3b361028e6302ee0b062674f0483845930e94ba7
X-Git-Newrev: 295baf16a181b110eba09007f6ad7ac384914581
X-Patchwork-Hint: ignore
Message-Id: <20230220205301.05D0886495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/open-iscsi: fix
 libressl build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=295baf16a181b110eba09007f6ad7ac384914581
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix the following libressl build failure raised since the addition of
the package in commit 2a571acddd0badaf9636649d98fd095757878348:

/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/or1k-buildroot-linux-gnu/11.3.0/../../../../or1k-buildroot-linux-gnu/bin/ld: iscsid.p/usr_auth.c.o: in function `auth_hash_init':
auth.c:(.text+0x7bc): undefined reference to `EVP_sha3_256'

Fixes:
 - http://autobuild.buildroot.org/results/48a4bddc355956733d712214797350cca8e111d9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-SHA3-is-not-supported-by-libressl.patch   | 144 +++++++++++++++++++++
 1 file changed, 144 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
