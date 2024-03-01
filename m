Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3855EC5478C
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 21:04:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08AC483BCE;
	Fri,  1 Mar 2024 21:04:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hYrFOd6hjrRv; Fri,  1 Mar 2024 21:04:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AFBD83BE7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AFBD83BE7;
	Fri,  1 Mar 2024 21:04:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1CDF51BF995
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 21:04:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1EF638376D
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 21:04:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1X5BHvb__hWa for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 21:04:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3125683BE0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3125683BE0
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 21:04:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2BBD487E28; Fri,  1 Mar 2024 21:04:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 1 Mar 2024 22:01:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b1b4923d18bc6e8a40e990e172cd9f12087fcdb6
X-Git-Newrev: 9002b818be9128a6751766a180af7cd284aa7704
X-Patchwork-Hint: ignore
Message-Id: <20240301210411.2BBD487E28@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcoap: fix CVE-2024-0962
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

commit: https://git.buildroot.net/buildroot/commit/?id=9002b818be9128a6751766a180af7cd284aa7704
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A vulnerability was found in obgm libcoap 4.3.4. It has been rated as
critical. Affected by this issue is the function get_split_entry of the
file src/coap_oscore.c of the component Configuration File Handler. The
manipulation leads to stack-based buffer overflow. The attack may be
launched remotely. The exploit has been disclosed to the public and may
be used. It is recommended to apply a patch to fix this issue.
VDB-252206 is the identifier assigned to this vulnerability.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
