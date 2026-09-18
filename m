Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C40DDC982DD
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 20:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92B4281320;
	Fri, 18 Sep 2026 20:46:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vavf_XAYEJEX; Fri, 18 Sep 2026 20:46:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C29E7812FD
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789764400;
	b=Q7heJhO09T1y36bQ7Q+OVxRx7idd8XHwl91Yf4VCj0lx6euV2MobegKHik5IbWceovP8
	 z4XyzB/4Dj8z2gSndLuGx4biWZRYIs8pLoS+yQYYGRktxMZVav+6VTYthkzsMKCekXbny
	 +yd+eHaw2dk+HBpd6bZHcZfs1QBYgduzjSbTIKwqaAEZE0WN0o6HlT29QmUcylI+LUKf2
	 WMX8RqhXFFwA8sPD/Z7/wbmLh9QhNR69AbkCLgMskQyboquFogA8A6sR99wqSQ3EWIsbO
	 v7JuSqGL91SKBY52zEXHPzdD2IZt7jZpWSwbFrjjvU4zjh5opbn16CYmpi3Wu0OlQDg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789764400;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=iSYd+C+Qkn2ED/noy3CWTQ7sTeiXz8vCRyINiBKvYHA=;
	b=pbJ34da9nnJBg1Ogexlkfib4YXqaKz9PZHA4/srhmzWNWyx8IIzLlk8pbPyC6oivG/3Z
	 RsQpoEK4X2uBB+EavUHHF91WC8RXnm2/EFuUFOCcT6OmE5GRzhoN43G1FTnDVvhlVezgV
	 JjL9TQnRTNDHWPLMg/Mo3feTD3/39jGDwweP18zvwWaObwW0uZLbV+A2tdZG/gRI4RqPQ
	 8VeVPUUJQdLUtN+uFtVdKG5IOKumgLf0mRMyUeaoLj9X0NJwqnEhgw1GtBwBDCu0f6nBB
	 8EILHuYmytXcCQvdPAkMwqd01zQO1EeDqsIm2XW48yU3MsSP83/yvohAhv6rIxeVKNw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789764400;
	bh=iSYd+C+Qkn2ED/noy3CWTQ7sTeiXz8vCRyINiBKvYHA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lIIFBwUNPCc+QDfKRaiYVKLZ/r0SgmjVczZs64n1eFxYu/EP2iZOOIyOm7Kxi7HkD
	 A/E8Z0ShbmPAo6cYHB1Okrmil2GBeq04Ii1w4ghPZJzVAl4cqzG7BZAFIi8aaurRQS
	 4z9hQcdBkLej24L//wov50JXSK+gD283BSanerc9NXkOnjfoStnR2CkVNQKFuF4zuJ
	 a5TMqXaaspozbAoLSqHWoeFZqS9RIRrZnnk10KJ9+2q+5R/TtS6cRId6tj8zC0D7AM
	 YdSdgZgT0P034t1d4B6EcetFdpyn5XSYVT7l/mWaeUjsQ8rS1Tuu0AZw5Ep6BQM6AD
	 lZC7T/fHnKaoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C29E7812FD;
	Fri, 18 Sep 2026 20:46:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DF11313D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 20:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C527F40BC9
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 20:46:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AKFJxTXHH5eL for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 20:46:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org EC39C40BE2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789764397;
 b=VuM+jl+cO04hRDQra+nQ72yH2v4QmsnneCbPLe9gRz2VbCzlDkUMDXV1H/EmZEz4ID1q
 3rcjfkiJmzDqog7+snnV+55fWrPF0Or15xFUik/Ktmgkt8FeI4tQ34scbr16OvUS1m3x2
 EKvsBrDaFW8Hd71YtRf2D1zp3sqWBaSm0Au1x+HCW/ZDjD2QkZiZH+II/d3BuS96m12Ae
 X0MidbZlPCyQw9NidxaI0N9V9/a7QZMXODliw+8VdT2tbJoKUTBjG+CTNLis3MPnyqphG
 UUdmjdwwPybEJ7p8106cf/43HPPIxhu46zuC/a/qROBTh1kA/0xh2/7zwxdR8ga0JKg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789764397;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=BKMjSfO0kKL56rsyqMkPJ7VPyc1GhQPWAO2sRSh2mBg=;
 b=ImQ1Ts2UkRpFExgXwK0WakHCWVhoYhCA+XfB6w4PA0ldh63tUKnqzUJ/qywXj9YS4K0J
 whAUmsSy6PzK0X7dcYd/Z7hQvX2IQg0LlrnprTnX3Y3q8iISFg5sEw61qfWE0jY5C53o2
 w8DPH8QztEewqVWTIdj4187XkgWvjAl5BL4DScHrrijLtVxW9FNsOmMeu3M4K1K2Mqwpk
 aKV8r9Yq27OZSlF4UN1VljWqZeiHYYWEhcWAYngRdIAiLK/acOgVjpwTtR3/MUrjlM1N9
 c0pvGkbXXiqBt88hKmqjesckTEIp1DbuqEgq7KW6cDNB/CnP6r+X+mLOC+SldXd52Ng==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC39C40BE2
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 20:46:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 68033976A6; Fri, 18 Sep 2026 20:45:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 22:30:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a4346a385811e3ef2ba209ded9a604f1cd7f38fb
X-Git-Newrev: 6fec797ebb79c50a496fcba6820935823aea4daf
X-Patchwork-Hint: ignore
Message-Id: <20260918204529.68033976A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xmlstarlet: bump version to 1.7.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6fec797ebb79c50a496fcba6820935823aea4daf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Upstream site switched to Github:
https://sourceforge.net/p/xmlstar/feature-requests/50/

Release notes:
https://github.com/xmlstarlet/xmlstarlet/releases/tag/1.7.0

Removed patches which are included in this release.
Instead of patch 0002 a different fix was committed upstream:
https://github.com/xmlstarlet/xmlstarlet/commit/f300cd048d22ed5291f885346c62779b92c4aca4

Switched to pkgconf to detect libxml2/libxslt expect for static builds:
https://github.com/xmlstarlet/xmlstarlet/commit/27063aa63c96541fe6db335aa36e5fa29bc5f0e9

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Fix-build-issues-with-libxml2-2.12.patch  | 97 ----------------------
 .../0002-xml_pyx-remove-ATTRIBUTE_UNUSED.patch     | 49 -----------
 package/xmlstarlet/Config.in                       |  2 +-
 package/xmlstarlet/xmlstarlet.hash                 |  5 +-
 package/xmlstarlet/xmlstarlet.mk                   | 18 ++--
 5 files changed, 9 insertions(+), 162 deletions(-)

diff --git a/package/xmlstarlet/0001-Fix-build-issues-with-libxml2-2.12.patch b/package/xmlstarlet/0001-Fix-build-issues-with-libxml2-2.12.patch
deleted file mode 100644
index 74034dad53..0000000000
--- a/package/xmlstarlet/0001-Fix-build-issues-with-libxml2-2.12.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From 702988467d67c3a33255de4c543f56767c64c72e Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sat, 23 Dec 2023 21:30:30 +0100
-Subject: [PATCH] Fix build issues with libxml2 2.12
-
-Based on initial work from Bernd Kuhls <bernd@kuhls.net>, improved by
-Yaakov Selkowitz.
-
-Upstream: https://sourceforge.net/p/xmlstar/patches/22/
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- src/trans.h      | 1 +
- src/xml.c        | 2 +-
- src/xml_edit.c   | 1 +
- src/xml_elem.c   | 2 +-
- src/xml_format.c | 1 +
- src/xmlstar.h    | 2 +-
- 6 files changed, 6 insertions(+), 3 deletions(-)
-
-diff --git a/src/trans.h b/src/trans.h
-index 016304e..395462c 100644
---- a/src/trans.h
-+++ b/src/trans.h
-@@ -36,6 +36,7 @@ THE SOFTWARE.
- #include <libxml/xinclude.h>
- #include <libxml/parserInternals.h>
- #include <libxml/uri.h>
-+#include <libxml/globals.h>
- 
- #include <libxslt/xslt.h>
- #include <libxslt/xsltInternals.h>
-diff --git a/src/xml.c b/src/xml.c
-index cf47cc2..e6f19c1 100644
---- a/src/xml.c
-+++ b/src/xml.c
-@@ -104,7 +104,7 @@ void reportGenericError(void* ctx, const char * msg, ...) {
- /* by default all errors are reported */
- static ErrorInfo errorInfo = { NULL, NULL, VERBOSE, CONTINUE };
- 
--void reportError(void *ptr, xmlErrorPtr error)
-+void reportError(void *ptr, const xmlError *error)
- {
-     ErrorInfo *errorInfo = (ErrorInfo*) ptr;
-     assert(errorInfo);
-diff --git a/src/xml_edit.c b/src/xml_edit.c
-index e199178..b3da8a4 100644
---- a/src/xml_edit.c
-+++ b/src/xml_edit.c
-@@ -42,6 +42,7 @@ THE SOFTWARE.
- #include <libxml/xpointer.h>
- #include <libxml/parserInternals.h>
- #include <libxml/uri.h>
-+#include <libxml/globals.h>
- #include <libexslt/exslt.h>
- 
- #include "xmlstar.h"
-diff --git a/src/xml_elem.c b/src/xml_elem.c
-index 024e62a..a73038a 100644
---- a/src/xml_elem.c
-+++ b/src/xml_elem.c
-@@ -186,7 +186,7 @@ typedef struct {
-  * put @name into @data->array[@data->offset]
-  */
- static void
--hash_key_put(void *payload, void *data, xmlChar *name)
-+hash_key_put(void *payload, void *data, const xmlChar *name)
- {
-     ArrayDest *dest = data;
-     dest->array[dest->offset++] = name;
-diff --git a/src/xml_format.c b/src/xml_format.c
-index e9da4df..ddd6614 100644
---- a/src/xml_format.c
-+++ b/src/xml_format.c
-@@ -42,6 +42,7 @@ THE SOFTWARE.
- #include <libxml/xpointer.h>
- #include <libxml/parserInternals.h>
- #include <libxml/uri.h>
-+#include <libxml/globals.h>
- 
- #include "xmlstar.h"
- 
-diff --git a/src/xmlstar.h b/src/xmlstar.h
-index 3e1eed3..e8d7177 100644
---- a/src/xmlstar.h
-+++ b/src/xmlstar.h
-@@ -32,7 +32,7 @@ typedef struct _errorInfo {
-     ErrorStop stop;
- } ErrorInfo;
- 
--void reportError(void *ptr, xmlErrorPtr error);
-+void reportError(void *ptr, const xmlError *error);
- void suppressErrors(void);
- 
- typedef struct _gOptions {
--- 
-2.43.0
-
diff --git a/package/xmlstarlet/0002-xml_pyx-remove-ATTRIBUTE_UNUSED.patch b/package/xmlstarlet/0002-xml_pyx-remove-ATTRIBUTE_UNUSED.patch
deleted file mode 100644
index dd7472301e..0000000000
--- a/package/xmlstarlet/0002-xml_pyx-remove-ATTRIBUTE_UNUSED.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 6b3ca3549abb998947088bdf264d65a0a86684cd Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Sun, 12 Oct 2025 18:38:54 +0200
-Subject: [PATCH] xml_pyx: remove ATTRIBUTE_UNUSED
-
-This define was removed in libxml2 2.14.0:
-https://gitlab.gnome.org/GNOME/libxml2/-/commit/208f27f9641a59863ce1f7d4992df77f7eb0ea9d
-
-Upstream: https://sourceforge.net/p/xmlstar/patches/23/
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/xml_pyx.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/xml_pyx.c b/src/xml_pyx.c
-index ab295f1..8adc028 100644
---- a/src/xml_pyx.c
-+++ b/src/xml_pyx.c
-@@ -200,7 +200,7 @@ pyxExternalEntityReferenceHandler(void* userData,
- }
- 
- static void
--pyxExternalSubsetHandler(void *ctx ATTRIBUTE_UNUSED, const xmlChar *name,
-+pyxExternalSubsetHandler(void *ctx, const xmlChar *name,
-                          const xmlChar *ExternalID, const xmlChar *SystemID)
- {
-     fprintf(stdout, "D %s PUBLIC", name); /* TODO: re-check */
-@@ -215,7 +215,7 @@ pyxExternalSubsetHandler(void *ctx ATTRIBUTE_UNUSED, const xmlChar *name,
- }
- 
- static void
--pyxCommentHandler(void *ctx ATTRIBUTE_UNUSED, const xmlChar *value)
-+pyxCommentHandler(void *ctx, const xmlChar *value)
- {
-     fprintf(stdout,"C");
-     SanitizeData(value, xmlStrlen(value));
-@@ -223,7 +223,7 @@ pyxCommentHandler(void *ctx ATTRIBUTE_UNUSED, const xmlChar *value)
- }
- 
- static void
--pyxCdataBlockHandler(void *ctx ATTRIBUTE_UNUSED, const xmlChar *value, int len)
-+pyxCdataBlockHandler(void *ctx, const xmlChar *value, int len)
- {
-     fprintf(stdout,"[");
-     SanitizeData(value, len);
--- 
-2.47.3
-
diff --git a/package/xmlstarlet/Config.in b/package/xmlstarlet/Config.in
index 99762b8761..b88c80801a 100644
--- a/package/xmlstarlet/Config.in
+++ b/package/xmlstarlet/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_XMLSTARLET
 	help
 	  Command Line XML Toolkit
 
-	  http://xmlstar.sourceforge.net/
+	  https://xmlstarlet.github.io
diff --git a/package/xmlstarlet/xmlstarlet.hash b/package/xmlstarlet/xmlstarlet.hash
index 4b696bb2a4..f1191857ae 100644
--- a/package/xmlstarlet/xmlstarlet.hash
+++ b/package/xmlstarlet/xmlstarlet.hash
@@ -1,5 +1,4 @@
-# From https://sourceforge.net/projects/xmlstar/files/xmlstarlet/1.6.1/
-sha1  87bb104f546caca71b9540807c5b2738944cb219  xmlstarlet-1.6.1.tar.gz
-md5  f3c5dfa3b1a2ee06cd57c255cc8b70a0  xmlstarlet-1.6.1.tar.gz
+# From https://github.com/xmlstarlet/xmlstarlet/releases/download/1.7.0/xmlstarlet-1.7.0.tar.gz.sha256
+sha256  df4c93458fc6b2ad144d65dccf3ef251349871e0578c5bc59edbfeecf9bf3454  xmlstarlet-1.7.0.tar.gz
 # Locally computed
 sha256  6641cc5b00c1651fa22175f34efd01695e64a348b1ba07048538276f44866862  COPYING
diff --git a/package/xmlstarlet/xmlstarlet.mk b/package/xmlstarlet/xmlstarlet.mk
index b79c3f566d..2a38ae206d 100644
--- a/package/xmlstarlet/xmlstarlet.mk
+++ b/package/xmlstarlet/xmlstarlet.mk
@@ -4,31 +4,25 @@
 #
 ################################################################################
 
-XMLSTARLET_VERSION = 1.6.1
-XMLSTARLET_SITE = http://downloads.sourceforge.net/project/xmlstar/xmlstarlet/$(XMLSTARLET_VERSION)
+XMLSTARLET_VERSION = 1.7.0
+XMLSTARLET_SITE = https://github.com/xmlstarlet/xmlstarlet/releases/download/$(XMLSTARLET_VERSION)
 XMLSTARLET_LICENSE = MIT
 XMLSTARLET_LICENSE_FILES = COPYING
 
-XMLSTARLET_DEPENDENCIES += libxml2 libxslt \
+XMLSTARLET_DEPENDENCIES += host-pkgconf libxml2 libxslt \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
+ifeq ($(BR2_STATIC_LIBS),y)
 XMLSTARLET_CONF_OPTS += \
+	--enable-static-libs \
 	--with-libxml-prefix=$(STAGING_DIR)/usr \
 	--with-libxslt-prefix=$(STAGING_DIR)/usr \
 	--with-libiconv-prefix=$(STAGING_DIR)/usr
-
-ifeq ($(BR2_STATIC_LIBS),y)
-XMLSTARLET_CONF_OPTS += --enable-static-libs
-XMLSTARLET_CONF_ENV = LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libxml-2.0 libexslt`"
 else
 XMLSTARLET_CONF_OPTS += --disable-static-libs
 endif
 
-HOST_XMLSTARLET_DEPENDENCIES += host-libxml2 host-libxslt
-
-HOST_XMLSTARLET_CONF_OPTS += \
-	--with-libxml-prefix=$(HOST_DIR) \
-	--with-libxslt-prefix=$(HOST_DIR)
+HOST_XMLSTARLET_DEPENDENCIES += host-libxml2 host-libxslt host-pkgconf
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
