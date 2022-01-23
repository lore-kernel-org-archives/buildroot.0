Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 886A2C433F5
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 19:41:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D4B740253;
	Sun, 23 Jan 2022 19:41:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 55vvsgcatNHu; Sun, 23 Jan 2022 19:41:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EFCE14012E;
	Sun, 23 Jan 2022 19:41:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 528EC1BF406
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 19:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A98081CA0
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 19:41:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dNTXO-0q3Wb3 for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 19:41:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FCEA8248F
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 19:41:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CD97C82B2E; Sun, 23 Jan 2022 19:34:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 20:39:30 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 3377aa01883c8b88ff2c4918cd0dbc0e863e9bdb
X-Git-Newrev: d4e00807d44b61a444410afa66650a0095532a8d
X-Patchwork-Hint: ignore
Message-Id: <20220123193446.CD97C82B2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/janus-gateway:
 fix CVE-2021-4124
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

commit: https://git.buildroot.net/buildroot/commit/?id=d4e00807d44b61a444410afa66650a0095532a8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

janus-gateway is vulnerable to Improper Neutralization of Input During
Web Page Generation ('Cross-site Scripting')

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2fd3c2cf43a189430cb53cb1434d37d7a3a78b47)
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
