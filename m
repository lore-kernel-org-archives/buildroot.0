Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D16F5C433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Dec 2021 17:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BFA5402F6;
	Wed, 22 Dec 2021 17:48:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 188ceYa2ze5b; Wed, 22 Dec 2021 17:48:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC6D640252;
	Wed, 22 Dec 2021 17:48:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C7701BF27E
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 17:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1715C40273
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 17:48:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WxB6HFVvFYHY for <buildroot@lists.busybox.net>;
 Wed, 22 Dec 2021 17:48:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02D3940227
 for <buildroot@buildroot.org>; Wed, 22 Dec 2021 17:48:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CD51E82897; Wed, 22 Dec 2021 17:42:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Dec 2021 18:48:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ffb2b79004837c80467e51a50b2ce7566399da7b
X-Git-Newrev: 2fd3c2cf43a189430cb53cb1434d37d7a3a78b47
X-Patchwork-Hint: ignore
Message-Id: <20211222174245.CD51E82897@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/janus-gateway: fix CVE-2021-4124
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

commit: https://git.buildroot.net/buildroot/commit/?id=2fd3c2cf43a189430cb53cb1434d37d7a3a78b47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

janus-gateway is vulnerable to Improper Neutralization of Input During
Web Page Generation ('Cross-site Scripting')

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0004-Fixed-missing-XSS-mitigation.patch        | 25 ++++++++++++++++++++++
 package/janus-gateway/janus-gateway.mk             |  3 +++
 2 files changed, 28 insertions(+)

diff --git a/package/janus-gateway/0004-Fixed-missing-XSS-mitigation.patch b/package/janus-gateway/0004-Fixed-missing-XSS-mitigation.patch
new file mode 100644
index 0000000000..e1e612133b
--- /dev/null
+++ b/package/janus-gateway/0004-Fixed-missing-XSS-mitigation.patch
@@ -0,0 +1,25 @@
+From f62bba6513ec840761f2434b93168106c7c65a3d Mon Sep 17 00:00:00 2001
+From: Lorenzo Miniero <lminiero@gmail.com>
+Date: Wed, 15 Dec 2021 14:10:01 +0100
+Subject: [PATCH] Fixed missing XSS mitigation (see #2817)
+
+[Retrieved from:
+https://github.com/meetecho/janus-gateway/commit/f62bba6513ec840761f2434b93168106c7c65a3d]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ html/textroomtest.js | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/html/textroomtest.js b/html/textroomtest.js
+index bf95a260a..7d5ae832c 100644
+--- a/html/textroomtest.js
++++ b/html/textroomtest.js
+@@ -351,7 +351,7 @@ function sendPrivateMsg(username) {
+ 				text: JSON.stringify(message),
+ 				error: function(reason) { bootbox.alert(reason); },
+ 				success: function() {
+-					$('#chatroom').append('<p style="color: purple;">[' + getDateString() + '] <b>[whisper to ' + display + ']</b> ' + result);
++					$('#chatroom').append('<p style="color: purple;">[' + getDateString() + '] <b>[whisper to ' + display + ']</b> ' + escapeXmlTags(result));
+ 					$('#chatroom').get(0).scrollTop = $('#chatroom').get(0).scrollHeight;
+ 				}
+ 			});
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index 98e00aeeb8..83d28ff6c7 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -14,6 +14,9 @@ JANUS_GATEWAY_CPE_ID_PRODUCT = janus
 # 0003-Fix-potential-Cross-site-Scripting-XSS-exploits-in-demos.patch
 JANUS_GATEWAY_IGNORE_CVES += CVE-2021-4020
 
+# 0004-Fixed-missing-XSS-mitigation.patch
+JANUS_GATEWAY_IGNORE_CVES += CVE-2021-4124
+
 # ding-libs provides the ini_config library
 JANUS_GATEWAY_DEPENDENCIES = host-pkgconf jansson libnice \
 	libsrtp host-gengetopt libglib2 openssl libconfig \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
