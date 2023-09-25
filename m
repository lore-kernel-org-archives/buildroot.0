Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D8ECE7A94
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 11:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DBAA6106C;
	Mon, 25 Sep 2023 11:48:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DBAA6106C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tqm3zSZx8ut8; Mon, 25 Sep 2023 11:48:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CE1C610D1;
	Mon, 25 Sep 2023 11:48:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CE1C610D1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 363CA1BF95F
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 11:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E02340571
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 11:48:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E02340571
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UQT4PqEYXNqd for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 11:48:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 071A840127
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 11:48:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 071A840127
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EAF1A87724; Mon, 25 Sep 2023 11:48:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Sep 2023 09:27:46 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 00ccd623ac7434bc979e00e72617437f05654c09
X-Git-Newrev: 1effeee51ebf84c16697924c6fa108418a552118
X-Patchwork-Hint: ignore
Message-Id: <20230925114821.EAF1A87724@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/opensc: fix
 CVE-2023-2977
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1effeee51ebf84c16697924c6fa108418a552118
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

A vulnerability was found in OpenSC. This security flaw cause a buffer
overrun vulnerability in pkcs15 cardos_have_verifyrc_package. The
attacker can supply a smart card package with malformed ASN1 context.
The cardos_have_verifyrc_package function scans the ASN1 buffer for 2
tags, where remaining length is wrongly caculated due to moved starting
pointer. This leads to possible heap-based buffer oob read. In cases
where ASAN is enabled while compiling this causes a crash. Further info
leak or more damage is possible.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9c4c3c4c9c0f4e1bf8b98e6465832c05d85317c2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...gth-calculation-to-fix-buffer-overrun-bug.patch | 51 ++++++++++++++++++++++
 package/opensc/opensc.mk                           |  3 ++
 2 files changed, 54 insertions(+)

diff --git a/package/opensc/0004-pkcs15init-correct-left-length-calculation-to-fix-buffer-overrun-bug.patch b/package/opensc/0004-pkcs15init-correct-left-length-calculation-to-fix-buffer-overrun-bug.patch
new file mode 100644
index 0000000000..079f960b59
--- /dev/null
+++ b/package/opensc/0004-pkcs15init-correct-left-length-calculation-to-fix-buffer-overrun-bug.patch
@@ -0,0 +1,51 @@
+From 81944d1529202bd28359bede57c0a15deb65ba8a Mon Sep 17 00:00:00 2001
+From: fullwaywang <fullwaywang@tencent.com>
+Date: Mon, 29 May 2023 10:38:48 +0800
+Subject: [PATCH] pkcs15init: correct left length calculation to fix buffer
+ overrun bug. Fixes #2785
+
+Upstream: https://github.com/OpenSC/OpenSC/commit/81944d1529202bd28359bede57c0a15deb65ba8a
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/pkcs15init/pkcs15-cardos.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/pkcs15init/pkcs15-cardos.c b/src/pkcs15init/pkcs15-cardos.c
+index 9715cf390f..f41f73c349 100644
+--- a/src/pkcs15init/pkcs15-cardos.c
++++ b/src/pkcs15init/pkcs15-cardos.c
+@@ -872,7 +872,7 @@ static int cardos_have_verifyrc_package(sc_card_t *card)
+ 	sc_apdu_t apdu;
+         u8        rbuf[SC_MAX_APDU_BUFFER_SIZE];
+         int       r;
+-	const u8  *p = rbuf, *q;
++	const u8  *p = rbuf, *q, *pp;
+ 	size_t    len, tlen = 0, ilen = 0;
+ 
+ 	sc_format_apdu(card, &apdu, SC_APDU_CASE_2_SHORT, 0xca, 0x01, 0x88);
+@@ -888,13 +888,13 @@ static int cardos_have_verifyrc_package(sc_card_t *card)
+ 		return 0;
+ 
+ 	while (len != 0) {
+-		p = sc_asn1_find_tag(card->ctx, p, len, 0xe1, &tlen);
+-		if (p == NULL)
++		pp = sc_asn1_find_tag(card->ctx, p, len, 0xe1, &tlen);
++		if (pp == NULL)
+ 			return 0;
+ 		if (card->type == SC_CARD_TYPE_CARDOS_M4_3)	{
+ 			/* the verifyRC package on CardOS 4.3B use Manufacturer ID 0x01	*/
+ 			/* and Package Number 0x07					*/
+-			q = sc_asn1_find_tag(card->ctx, p, tlen, 0x01, &ilen);
++			q = sc_asn1_find_tag(card->ctx, pp, tlen, 0x01, &ilen);
+ 			if (q == NULL || ilen != 4)
+ 				return 0;
+ 			if (q[0] == 0x07)
+@@ -902,7 +902,7 @@ static int cardos_have_verifyrc_package(sc_card_t *card)
+ 		} else if (card->type == SC_CARD_TYPE_CARDOS_M4_4)	{
+ 			/* the verifyRC package on CardOS 4.4 use Manufacturer ID 0x03	*/
+ 			/* and Package Number 0x02					*/
+-			q = sc_asn1_find_tag(card->ctx, p, tlen, 0x03, &ilen);
++			q = sc_asn1_find_tag(card->ctx, pp, tlen, 0x03, &ilen);
+ 			if (q == NULL || ilen != 4)
+ 				return 0;
+ 			if (q[0] == 0x02)
diff --git a/package/opensc/opensc.mk b/package/opensc/opensc.mk
index f9e2f5083e..70472b8fef 100644
--- a/package/opensc/opensc.mk
+++ b/package/opensc/opensc.mk
@@ -13,4 +13,7 @@ OPENSC_DEPENDENCIES = openssl pcsc-lite
 OPENSC_INSTALL_STAGING = YES
 OPENSC_CONF_OPTS = --disable-cmocka --disable-strict
 
+# 0004-pkcs15init-correct-left-length-calculation-to-fix-buffer-overrun-bug.patch
+OPENSC_IGNORE_CVES += CVE-2023-2977
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
