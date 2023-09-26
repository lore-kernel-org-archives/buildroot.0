Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA78EE020C
	for <buildroot@archiver.kernel.org>; Tue, 26 Sep 2023 06:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 749F56147E;
	Tue, 26 Sep 2023 06:14:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 749F56147E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KqqEgwUoGzwG; Tue, 26 Sep 2023 06:14:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8C4161480;
	Tue, 26 Sep 2023 06:14:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8C4161480
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C82C01BF30B
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 06:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1E7F81325
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 06:12:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1E7F81325
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N5_lfydIngd4 for <buildroot@lists.busybox.net>;
 Tue, 26 Sep 2023 06:12:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C757C81320
 for <buildroot@buildroot.org>; Tue, 26 Sep 2023 06:12:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C757C81320
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B7BB887815; Tue, 26 Sep 2023 06:12:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Sep 2023 08:09:09 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: e69fb4864062f145366815a092779b857c244407
X-Git-Newrev: 44291c61cd991b4a7fe0422cfb7ea82c157c8ec4
X-Patchwork-Hint: ignore
Message-Id: <20230926061220.B7BB887815@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/libcoap: fix
 CVE-2023-30362
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

commit: https://git.buildroot.net/buildroot/commit/?id=44291c61cd991b4a7fe0422cfb7ea82c157c8ec4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 868be6f6ae8db1090b97b618d7dca4ec4d9799ed)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Backport-fix-for-CVE-2023-30362.patch     | 59 ++++++++++++++++++++++
 package/libcoap/libcoap.mk                         |  2 +
 2 files changed, 61 insertions(+)

diff --git a/package/libcoap/0001-Backport-fix-for-CVE-2023-30362.patch b/package/libcoap/0001-Backport-fix-for-CVE-2023-30362.patch
new file mode 100644
index 0000000000..ddc5329299
--- /dev/null
+++ b/package/libcoap/0001-Backport-fix-for-CVE-2023-30362.patch
@@ -0,0 +1,59 @@
+From c63ecbdc6b38cc7e571a72964fe9ca63834dcc89 Mon Sep 17 00:00:00 2001
+From: Jon Shallow <supjps-libcoap@jpshallow.com>
+Date: Wed, 6 Sep 2023 21:38:13 +0200
+Subject: [PATCH] Backport fix for CVE-2023-30362
+
+Upstream: https://github.com/obgm/libcoap/issues/1063#issuecomment-1626962307
+Signed-off-by: Daniel Lang <dalang@gmx.at>
+---
+ src/net.c | 34 +++++++++++++++++++++-------------
+ 1 file changed, 21 insertions(+), 13 deletions(-)
+
+diff --git a/src/net.c b/src/net.c
+index 98859443..e259ab00 100644
+--- a/src/net.c
++++ b/src/net.c
+@@ -1305,19 +1305,27 @@ coap_send_internal(coap_session_t *session, coap_pdu_t *pdu) {
+ 
+       /* Need to check that we are not seeing this proxy in the return loop */
+       if (pdu->data && opt == NULL) {
+-        if (pdu->used_size + 1 <= pdu->max_size) {
+-          char *a_match;
+-          size_t data_len = pdu->used_size - (pdu->data - pdu->token);
+-          pdu->data[data_len] = '\000';
+-          a_match = strstr((char*)pdu->data, cp);
+-          if (a_match && (a_match == (char*)pdu->data || a_match[-1] == ' ') &&
+-              ((size_t)(a_match - (char*)pdu->data + len) == data_len ||
+-               a_match[len] == ' ')) {
+-            coap_log(LOG_WARNING, "Proxy loop detected '%s'\n",
+-                     (char*)pdu->data);
+-            coap_delete_pdu(pdu);
+-            return (coap_mid_t)COAP_DROPPED_RESPONSE;
+-          }
++        char *a_match;
++        size_t data_len;
++
++        if (pdu->used_size + 1 > pdu->max_size) {
++          /* No space */
++          return (coap_mid_t)COAP_DROPPED_RESPONSE;
++        }
++        if (!coap_pdu_resize(pdu, pdu->used_size + 1)) {
++          /* Internal error */
++          return (coap_mid_t)COAP_DROPPED_RESPONSE;
++        }
++        data_len = pdu->used_size - (pdu->data - pdu->token);
++        pdu->data[data_len] = '\000';
++        a_match = strstr((char*)pdu->data, cp);
++        if (a_match && (a_match == (char*)pdu->data || a_match[-1] == ' ') &&
++            ((size_t)(a_match - (char*)pdu->data + len) == data_len ||
++             a_match[len] == ' ')) {
++          coap_log(LOG_WARNING, "Proxy loop detected '%s'\n",
++                   (char*)pdu->data);
++          coap_delete_pdu(pdu);
++          return (coap_mid_t)COAP_DROPPED_RESPONSE;
+         }
+       }
+       if (pdu->used_size + len + 1 <= pdu->max_size) {
+-- 
+2.42.0
+
diff --git a/package/libcoap/libcoap.mk b/package/libcoap/libcoap.mk
index 4b536d8117..3773ad293c 100644
--- a/package/libcoap/libcoap.mk
+++ b/package/libcoap/libcoap.mk
@@ -14,6 +14,8 @@ LIBCOAP_DEPENDENCIES = host-pkgconf
 LIBCOAP_CONF_OPTS = \
 	--disable-examples --disable-examples-source --without-tinydtls
 LIBCOAP_AUTORECONF = YES
+# 0001-Backport-fix-for-CVE-2023-30362.patch
+LIBCOAP_IGNORE_CVES += CVE-2023-30362
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 LIBCOAP_DEPENDENCIES += gnutls
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
