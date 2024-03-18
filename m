Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C10C54E5D
	for <buildroot@archiver.kernel.org>; Mon, 18 Mar 2024 16:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6BC960869;
	Mon, 18 Mar 2024 16:49:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9hPtN9_xx_-E; Mon, 18 Mar 2024 16:49:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89BAA608BA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89BAA608BA;
	Mon, 18 Mar 2024 16:49:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 390A51BF95F
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 16:49:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E2D060883
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 16:49:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s2Aq2XeGnc9v for <buildroot@lists.busybox.net>;
 Mon, 18 Mar 2024 16:49:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 549856085E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 549856085E
 for <buildroot@buildroot.org>; Mon, 18 Mar 2024 16:49:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4E59582BCF; Mon, 18 Mar 2024 16:49:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 18 Mar 2024 17:43:46 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 8873d98abe2016ee77eb1bd6877749f19ee9d649
X-Git-Newrev: ea9992b99e7ec22a20b33acaf8b2ed9480084ad5
X-Patchwork-Hint: ignore
Message-Id: <20240318164916.4E59582BCF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/libcoap: fix
 CVE-2024-0962
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

commit: https://git.buildroot.net/buildroot/commit/?id=ea9992b99e7ec22a20b33acaf8b2ed9480084ad5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

A vulnerability was found in obgm libcoap 4.3.4. It has been rated as
critical. Affected by this issue is the function get_split_entry of the
file src/coap_oscore.c of the component Configuration File Handler. The
manipulation leads to stack-based buffer overflow. The attack may be
launched remotely. The exploit has been disclosed to the public and may
be used. It is recommended to apply a patch to fix this issue.
VDB-252206 is the identifier assigned to this vulnerability.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9002b818be9128a6751766a180af7cd284aa7704)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-parsing-OSCORE-configuration-information.patch | 38 ++++++++++++++++++++++
 package/libcoap/libcoap.mk                         |  3 ++
 2 files changed, 41 insertions(+)

diff --git a/package/libcoap/0001-coap_oscore-c-Fix-parsing-OSCORE-configuration-information.patch b/package/libcoap/0001-coap_oscore-c-Fix-parsing-OSCORE-configuration-information.patch
new file mode 100644
index 0000000000..e75250d613
--- /dev/null
+++ b/package/libcoap/0001-coap_oscore-c-Fix-parsing-OSCORE-configuration-information.patch
@@ -0,0 +1,38 @@
+From 2b28d8b0e9607e71a145345b4fe49517e052b7d9 Mon Sep 17 00:00:00 2001
+From: Jon Shallow <supjps-libcoap@jpshallow.com>
+Date: Thu, 25 Jan 2024 18:03:17 +0000
+Subject: [PATCH] coap_oscore.c: Fix parsing OSCORE configuration information
+
+Upstream: https://github.com/obgm/libcoap/commit/2b28d8b0e9607e71a145345b4fe49517e052b7d9
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/coap_oscore.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/src/coap_oscore.c b/src/coap_oscore.c
+index 83f785c92..e0fb22947 100644
+--- a/src/coap_oscore.c
++++ b/src/coap_oscore.c
+@@ -1678,11 +1678,12 @@ get_split_entry(const char **start,
+                 oscore_value_t *value) {
+   const char *begin = *start;
+   const char *end;
++  const char *kend;
+   const char *split;
+   size_t i;
+ 
+ retry:
+-  end = memchr(begin, '\n', size);
++  kend = end = memchr(begin, '\n', size);
+   if (end == NULL)
+     return 0;
+ 
+@@ -1693,7 +1694,7 @@ get_split_entry(const char **start,
+ 
+   if (begin[0] == '#' || (end - begin) == 0) {
+     /* Skip comment / blank line */
+-    size -= end - begin + 1;
++    size -= kend - begin + 1;
+     begin = *start;
+     goto retry;
+   }
diff --git a/package/libcoap/libcoap.mk b/package/libcoap/libcoap.mk
index 62f08a20e9..29161142f6 100644
--- a/package/libcoap/libcoap.mk
+++ b/package/libcoap/libcoap.mk
@@ -15,6 +15,9 @@ LIBCOAP_CONF_OPTS = \
 	--disable-examples --disable-examples-source --without-tinydtls
 LIBCOAP_AUTORECONF = YES
 
+# 0001-coap_oscore-c-Fix-parsing-OSCORE-configuration-information.patch
+LIBCOAP_IGNORE_CVES += CVE-2024-0962
+
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 LIBCOAP_DEPENDENCIES += gnutls
 LIBCOAP_CONF_OPTS += \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
