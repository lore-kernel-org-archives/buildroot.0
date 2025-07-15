Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C08CC83F34
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:23:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B3084173B;
	Thu, 17 Jul 2025 20:23:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sEZRXBlFXQMr; Thu, 17 Jul 2025 20:22:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A4924171F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A4924171F;
	Thu, 17 Jul 2025 20:22:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 12A991A6
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A31B4607E3
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:22:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gbwMS0fmznIJ for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:22:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3F706086A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3F706086A
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:22:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A1582865B2; Thu, 17 Jul 2025 20:22:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 15 Jul 2025 18:36:54 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 1b9c58a33de54ad123f1eea6cd6033f41461ac21
X-Git-Newrev: 5980de098ad53bcc5cc752f3f353857f27ad8d40
X-Patchwork-Hint: ignore
Message-Id: <20250717202236.A1582865B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libxml2: add
 patch for CVE-2025-6021
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5980de098ad53bcc5cc752f3f353857f27ad8d40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

This fixes an integer overflow vulnerability [1], in libxml2 version
2.13 by backporting the commit [2] from libxml2 2.14. This commit uses
the SIZE_MAX macro, for which stdint.h was included in tree.c, as done in [3].

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-6021
[2] https://gitlab.gnome.org/GNOME/libxml2/-/commit/ad346c9a249c4b380bf73c460ad3e81135c5d781
[3] https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch

Signed-off-by: Tim Soubry <tim.soubry@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit a1cf6bcc0698f3c033fceeeae2a07b9f25d7049c)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...ree-Fix-integer-overflow-in-xmlBuildQName.patch | 59 ++++++++++++++++++++++
 package/libxml2/libxml2.mk                         |  3 ++
 2 files changed, 62 insertions(+)

diff --git a/package/libxml2/0001-tree-Fix-integer-overflow-in-xmlBuildQName.patch b/package/libxml2/0001-tree-Fix-integer-overflow-in-xmlBuildQName.patch
new file mode 100644
index 0000000000..962e1e091f
--- /dev/null
+++ b/package/libxml2/0001-tree-Fix-integer-overflow-in-xmlBuildQName.patch
@@ -0,0 +1,59 @@
+From 719cfb3f3893c7f8fada2ad71fabb68c5fe953bf Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Tue, 27 May 2025 12:53:17 +0200
+Subject: [PATCH] tree: Fix integer overflow in xmlBuildQName
+
+This issue affects memory safety and might receive a CVE ID later.
+
+Fixes #926.
+
+Signed-off-by: Tim Soubry <tim.soubry@mind.be>
+Upstream: https://gitlab.gnome.org/GNOME/libxml2/-/commit/ad346c9a249c4b380bf73c460ad3e81135c5d781
+CVE: CVE-2025-6021
+[tim: include needed stdint header]
+---
+ tree.c | 11 +++++++----
+ 1 file changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/tree.c b/tree.c
+index f097cf87..53385568 100644
+--- a/tree.c
++++ b/tree.c
+@@ -23,6 +23,7 @@
+ #include <limits.h>
+ #include <ctype.h>
+ #include <stdlib.h>
++#include <stdint.h>
+ 
+ #ifdef LIBXML_ZLIB_ENABLED
+ #include <zlib.h>
+@@ -167,10 +168,10 @@ xmlGetParameterEntityFromDtd(const xmlDtd *dtd, const xmlChar *name) {
+ xmlChar *
+ xmlBuildQName(const xmlChar *ncname, const xmlChar *prefix,
+ 	      xmlChar *memory, int len) {
+-    int lenn, lenp;
++    size_t lenn, lenp;
+     xmlChar *ret;
+ 
+-    if (ncname == NULL) return(NULL);
++    if ((ncname == NULL) || (len < 0)) return(NULL);
+     if (prefix == NULL) return((xmlChar *) ncname);
+ 
+ #ifdef FUZZING_BUILD_MODE_UNSAFE_FOR_PRODUCTION
+@@ -181,9 +182,11 @@ xmlBuildQName(const xmlChar *ncname, const xmlChar *prefix,
+ 
+     lenn = strlen((char *) ncname);
+     lenp = strlen((char *) prefix);
++    if (lenn >= SIZE_MAX - lenp - 1)
++        return(NULL);
+ 
+-    if ((memory == NULL) || (len < lenn + lenp + 2)) {
+-	ret = (xmlChar *) xmlMallocAtomic(lenn + lenp + 2);
++    if ((memory == NULL) || ((size_t) len < lenn + lenp + 2)) {
++	ret = xmlMalloc(lenn + lenp + 2);
+ 	if (ret == NULL)
+ 	    return(NULL);
+     } else {
+-- 
+2.39.5
+
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 789c6a297e..f8651e726b 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -15,6 +15,9 @@ LIBXML2_LICENSE_FILES = Copyright
 LIBXML2_CPE_ID_VENDOR = xmlsoft
 LIBXML2_CONFIG_SCRIPTS = xml2-config
 
+#0001-tree-Fix-integer-overflow-in-xmlBuildQName.patch
+LIBXML2_IGNORE_CVES += CVE-2025-6021
+
 # relocation truncated to fit: R_68K_GOT16O
 ifeq ($(BR2_m68k_cf),y)
 LIBXML2_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -mxgot"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
