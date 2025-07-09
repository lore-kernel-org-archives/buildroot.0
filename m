Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F34C83F0A
	for <buildroot@archiver.kernel.org>; Wed,  9 Jul 2025 15:15:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE802407A5;
	Wed,  9 Jul 2025 15:15:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dvIDwBtnKzck; Wed,  9 Jul 2025 15:15:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E291E407B9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E291E407B9;
	Wed,  9 Jul 2025 15:15:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7903A15F
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 15:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6AB0881570
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 15:15:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vsGI7Rni6709 for <buildroot@buildroot.org>;
 Wed,  9 Jul 2025 15:15:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=tim.soubry@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 08A47815D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08A47815D9
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 08A47815D9
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 15:15:47 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a4fb9c2436so45209f8f.1
 for <buildroot@buildroot.org>; Wed, 09 Jul 2025 08:15:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752074145; x=1752678945;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QxrkSFTNNi+xbyQ/k+p9Ze93RLyeOSx9EC8fOI2oGEY=;
 b=LfFv4rCwmYtgyLkqmmBP79bS6vC+JFcEvvUGuAtNBzkpr08wLmLr9mgRcVspP81eli
 AOErdOiVUrS3hOl79GeRBwtEQ9Gbj9pgZ2bocEUBa8nPYVRHWg2t6fqYceThrUWO3DGE
 SxE8XnHuSUJhj7j6VeOkA1nKBonWqPTC+u+3NxBj5TRC3S/lf6lqglJh9pyG17hKzi7z
 IOORuD7lEJtIevHQ56m+1Yujcab8w4NB+f8baZKH2y9mGK0/M5FWzpSPySYtYZgXIAh7
 oBeSaxrT17lQ8HZa8iJgd1nLKAAV0exzYldUgfUiM0t/F8OL03e0nBpYXa6f4V6ZxUD9
 E78Q==
X-Gm-Message-State: AOJu0YxBuAzMWQhW0vNv114ZewFzCm7dsFgaBCSFqAAhbSIrkE05aQ1Y
 8ra2D8gCpglyYlZtFXEpeBGCvG7ZWKs8/GHp8efiz8gCcfNhPjuuKBYoFtPSAhYx8BxpOkuAvoq
 opiFG1A4=
X-Gm-Gg: ASbGncvtXHZD6Tni/FbGiy8NT2ENJzqKbfCKyAMT0Vx8OOeU+/K6a8dLyVN1B0d/MhK
 n70ShkVZhikDNXCSgZImV1TvocrIbN+A4+QfCSeJcnHMaGAB+UQ0X5yRLf4WmPhhXpAUt5uVLQs
 xtmjGxC/0JQM+VBtZkn/wAY1xKaRn2wUn1vyoBIugXIamdvf+cZ6tJ7LQx5pfiIrPQN4Ft6XDAX
 rQxWFHSIBys4cyie9mGTmVI0kqfOzS2IXn/3QRnDY7VqYYW5GOlSJk5KxSVZVlA4j/+1lFZsliN
 ms3r/qTtvBhHlliap4VhE8sPwkgp9GScVE62/UrqNEh1t+mAWHmRgKNP6Z1tP0lLtn5LWL8GRl8
 V62D9RB8mOE0O8Wzoxb2CBXlvTd1mkNYKFsYRhPHp+6eTwrIZKV2O6hSeqo5uH+uYXJO9
X-Google-Smtp-Source: AGHT+IGYG/IlTrqjmxmrtDanMMzpN1JcbUwWQH1hbf0xlsZiTyRJKXBvWe7qOAg61t81XF482d/vmw==
X-Received: by 2002:a05:6000:65c:b0:3a4:ec32:e4da with SMTP id
 ffacd0b85a97d-3b5e788bc43mr363351f8f.15.1752074144750; 
 Wed, 09 Jul 2025 08:15:44 -0700 (PDT)
Received: from TimMind.telenet.be
 (ptr-377wgeyf4tq7vco44vbx.18120a2.ip6.access.telenet.be.
 [2a02:181f:0:4023:f979:8572:d806:db9d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b49cb46c61sm12455771f8f.63.2025.07.09.08.15.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 08:15:44 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Date: Wed,  9 Jul 2025 17:15:40 +0200
Message-Id: <20250709151542.2605609-1-tim.soubry@mind.be>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752074145; x=1752678945; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QxrkSFTNNi+xbyQ/k+p9Ze93RLyeOSx9EC8fOI2oGEY=;
 b=G9KXRia374kzrUvc8vFFFxnCNm73Xmy8TaIbA6u+FyXyk+qdTQj6GTKlrXcmgaFyML
 B+AlQiCfY/TAA06JFUTiF59KFi9SYgm2zlkPF2ddec4RB44ocWwTVThpqMVnHQYHylJv
 scvY2DqNzfYgIdrBgtyeXHIEz+v5HwD0KWfUJQ/dRS2/xBdcX1oKFg2jNUpVcgTET9Jg
 MTa9ZAxjEl4JyEGq0jvqGKsQBZmZEw4U0yRXQEiypaGlKEn3vLpx6w28IZSlgw5uGziU
 oloIJ3rzvxvOX806aeQbtTIdeRAsZeSKR/UhbwNdXTwI6S7MLvzoWxbLfW1a5/zgAsWY
 ukbw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=G9KXRia3
Subject: [Buildroot] [PATCH 1/3] package/libxml2: add patch for CVE-2025-6021
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
From: Tim Soubry via buildroot <buildroot@buildroot.org>
Reply-To: Tim Soubry <tim.soubry@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes an integer overflow vulnerability [1], in libxml2 version
2.13 by backporting the commit [2] from libxml2 2.14. This commit uses
the SIZE_MAX macro, for which stdint.h was included in tree.c, as done in [3].

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-6021
[2] https://gitlab.gnome.org/GNOME/libxml2/-/commit/ad346c9a249c4b380bf73c460ad3e81135c5d781
[3] https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch

Signed-off-by: Tim Soubry <tim.soubry@mind.be>
---
 ...ix-integer-overflow-in-xmlBuildQName.patch | 59 +++++++++++++++++++
 package/libxml2/libxml2.mk                    |  3 +
 2 files changed, 62 insertions(+)
 create mode 100644 package/libxml2/0001-tree-Fix-integer-overflow-in-xmlBuildQName.patch

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
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
