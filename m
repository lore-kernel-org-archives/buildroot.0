Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C74EE020C
	for <buildroot@archiver.kernel.org>; Tue, 26 Sep 2023 06:13:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B470C60BD6;
	Tue, 26 Sep 2023 06:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B470C60BD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EYpfIuAL7rgf; Tue, 26 Sep 2023 06:13:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BC5961449;
	Tue, 26 Sep 2023 06:13:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BC5961449
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EF4901BF30B
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 06:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FC3040207
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 06:11:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FC3040207
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rVPGHoELFe1A for <buildroot@lists.busybox.net>;
 Tue, 26 Sep 2023 06:11:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 936A7408CB
 for <buildroot@buildroot.org>; Tue, 26 Sep 2023 06:11:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 936A7408CB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 80BE8877EC; Tue, 26 Sep 2023 06:11:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Sep 2023 08:10:01 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 55e991660218e459b61d464cf801bf7121fd4ad0
X-Git-Newrev: 0e2c1f75d54bb99d039baf6bb35ae561a0ccb0ed
X-Patchwork-Hint: ignore
Message-Id: <20230926061109.80BE8877EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/libcoap: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=0e2c1f75d54bb99d039baf6bb35ae561a0ccb0ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
