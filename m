Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9913CCD184
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 21:32:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A3B080F32;
	Sun, 12 Oct 2025 21:32:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kuvsQZ2P7ZsB; Sun, 12 Oct 2025 21:32:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5206E8100B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5206E8100B;
	Sun, 12 Oct 2025 21:32:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B9E312B
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 21:31:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DB4F40A47
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 21:31:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A3lnuc0ZLs45 for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 21:31:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A685240A45
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A685240A45
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A685240A45
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 21:31:56 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5C0BEA4C66D3;
 Sun, 12 Oct 2025 23:31:42 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37338)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v83fJ-000000000qb-1hKH;
 Sun, 12 Oct 2025 21:31:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Pierre-Jean Texier <texier.pj2@gmail.com>
Date: Sun, 12 Oct 2025 23:31:40 +0200
Message-ID: <20251012213141.3512892-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251012213141.3512892-1-bernd@kuhls.net>
References: <20251012213141.3512892-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760304702;
 bh=7h/IG6IhoW4ej9SjXDmAis1broSHlcyott1WhhXlalQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=JDb6BCJq/zidRUKt7mdja+yQL2rfNdQ6MgcPNSOcJJdS5hF/xEFYygIXXFeyMZ0PC
 stomOBOdFxI51OGs5dCLIMXmVRHUkX400suACW4jJLo6dyXmbb55pYuof1RQmiSvNA
 kjTNlKUHQsEkoMOLjlLuEvrc/Dqs2n7oJDyEPJA7zD8XEx66n6mPrqjcRMDyNh504p
 C8/tbP4kwvC7qSDvH3nhsZ1J0Gww6tqxN0MHrXDNighHeYFmhhs2ICuMCzPiH5EbqF
 XguR1V8nziiglB4eR205TUMA80000UVh2t02skoVqKV1SFwk68rNxgDZM6CxPwyFYs
 kIr8HGPAUZltQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=JDb6BCJq
Subject: [Buildroot] [PATCH 2/3] package/libxml2: bump version to 2.15.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removed all patches because they are included in this release, although
with different commits than mentioned in our patch files:

0001: https://gitlab.gnome.org/GNOME/libxml2/-/commit/acbbeef9f5dcdcc901c5f3fa14d583ef8cfd22f0
0002: https://gitlab.gnome.org/GNOME/libxml2/-/commit/f7ebc65f05bffded58d1e1b2138eb124c2e44f21
0003: https://gitlab.gnome.org/GNOME/libxml2/-/commit/c24909ba2601848825b49a60f988222da3019667
0004: https://gitlab.gnome.org/GNOME/libxml2/-/commit/c340e419505cf4bf1d9ed7019a87cc00ec200434

Updated license hash due to upstream commit:
https://gitlab.gnome.org/GNOME/libxml2/-/commit/4bd66d4549b2e8925a752e0daac3a189d2fec8f7

Removed python3 bindings due to their pending removal in 2.16:
https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.0.news
which prevents us from adding a dependency on host-doxygen due to
upstream commit
https://gitlab.gnome.org/GNOME/libxml2/-/commit/bbe5827c94cc9b0e393ff3e6eef6dec2376317e2
"Doxygen will also be required to build the Python bindings."

Removed lzma support due to upstream removal:
https://gitlab.gnome.org/GNOME/libxml2/-/commit/1763281cd65ded4067ddf123eb7358690c214b0b

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...ix-integer-overflow-in-xmlBuildQName.patch |  59 ------
 ...emory-safety-issues-in-xmlSchematron.patch | 186 ------------------
 ...ull-pointer-dereference-leading-to-D.patch |  70 -------
 ...uffer-overflows-of-interactive-shell.patch | 103 ----------
 package/libxml2/libxml2.hash                  |   6 +-
 package/libxml2/libxml2.mk                    |  39 +---
 6 files changed, 6 insertions(+), 457 deletions(-)
 delete mode 100644 package/libxml2/0001-tree-Fix-integer-overflow-in-xmlBuildQName.patch
 delete mode 100644 package/libxml2/0002-schematron-Fix-memory-safety-issues-in-xmlSchematron.patch
 delete mode 100644 package/libxml2/0003-Schematron-Fix-null-pointer-dereference-leading-to-D.patch
 delete mode 100644 package/libxml2/0004-fix-potential-buffer-overflows-of-interactive-shell.patch

diff --git a/package/libxml2/0001-tree-Fix-integer-overflow-in-xmlBuildQName.patch b/package/libxml2/0001-tree-Fix-integer-overflow-in-xmlBuildQName.patch
deleted file mode 100644
index 962e1e091f..0000000000
--- a/package/libxml2/0001-tree-Fix-integer-overflow-in-xmlBuildQName.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 719cfb3f3893c7f8fada2ad71fabb68c5fe953bf Mon Sep 17 00:00:00 2001
-From: Nick Wellnhofer <wellnhofer@aevum.de>
-Date: Tue, 27 May 2025 12:53:17 +0200
-Subject: [PATCH] tree: Fix integer overflow in xmlBuildQName
-
-This issue affects memory safety and might receive a CVE ID later.
-
-Fixes #926.
-
-Signed-off-by: Tim Soubry <tim.soubry@mind.be>
-Upstream: https://gitlab.gnome.org/GNOME/libxml2/-/commit/ad346c9a249c4b380bf73c460ad3e81135c5d781
-CVE: CVE-2025-6021
-[tim: include needed stdint header]
----
- tree.c | 11 +++++++----
- 1 file changed, 7 insertions(+), 4 deletions(-)
-
-diff --git a/tree.c b/tree.c
-index f097cf87..53385568 100644
---- a/tree.c
-+++ b/tree.c
-@@ -23,6 +23,7 @@
- #include <limits.h>
- #include <ctype.h>
- #include <stdlib.h>
-+#include <stdint.h>
- 
- #ifdef LIBXML_ZLIB_ENABLED
- #include <zlib.h>
-@@ -167,10 +168,10 @@ xmlGetParameterEntityFromDtd(const xmlDtd *dtd, const xmlChar *name) {
- xmlChar *
- xmlBuildQName(const xmlChar *ncname, const xmlChar *prefix,
- 	      xmlChar *memory, int len) {
--    int lenn, lenp;
-+    size_t lenn, lenp;
-     xmlChar *ret;
- 
--    if (ncname == NULL) return(NULL);
-+    if ((ncname == NULL) || (len < 0)) return(NULL);
-     if (prefix == NULL) return((xmlChar *) ncname);
- 
- #ifdef FUZZING_BUILD_MODE_UNSAFE_FOR_PRODUCTION
-@@ -181,9 +182,11 @@ xmlBuildQName(const xmlChar *ncname, const xmlChar *prefix,
- 
-     lenn = strlen((char *) ncname);
-     lenp = strlen((char *) prefix);
-+    if (lenn >= SIZE_MAX - lenp - 1)
-+        return(NULL);
- 
--    if ((memory == NULL) || (len < lenn + lenp + 2)) {
--	ret = (xmlChar *) xmlMallocAtomic(lenn + lenp + 2);
-+    if ((memory == NULL) || ((size_t) len < lenn + lenp + 2)) {
-+	ret = xmlMalloc(lenn + lenp + 2);
- 	if (ret == NULL)
- 	    return(NULL);
-     } else {
--- 
-2.39.5
-
diff --git a/package/libxml2/0002-schematron-Fix-memory-safety-issues-in-xmlSchematron.patch b/package/libxml2/0002-schematron-Fix-memory-safety-issues-in-xmlSchematron.patch
deleted file mode 100644
index 1aadf4d3bc..0000000000
--- a/package/libxml2/0002-schematron-Fix-memory-safety-issues-in-xmlSchematron.patch
+++ /dev/null
@@ -1,186 +0,0 @@
-From a89ed49b681fb4299120154ce0d6ca38e9abe482 Mon Sep 17 00:00:00 2001
-From: Nick Wellnhofer <wellnhofer@aevum.de>
-Date: Fri, 4 Jul 2025 14:28:26 +0200
-Subject: [PATCH] schematron: Fix memory safety issues in
- xmlSchematronReportOutput
-
-Fix use-after-free (CVE-2025-49794) and type confusion (CVE-2025-49796)
-in xmlSchematronReportOutput.
-
-Fixes #931.
-Fixes #933.
-
-Upstream: https://gitlab.gnome.org/GNOME/libxml2/-/commit/71e1e8af5ee46dad1b57bb96cfbf1c3ad21fbd7b
-CVE: CVE-2025-49794 CVE-2025-49796
-Signed-off-by: Tim Soubry <tim.soubry@mind.be>
----
- result/schematron/cve-2025-49794_0.err |  2 ++
- result/schematron/cve-2025-49796_0.err |  2 ++
- schematron.c                           | 49 ++++++++++++++------------
- test/schematron/cve-2025-49794.sct     | 10 ++++++
- test/schematron/cve-2025-49794_0.xml   |  6 ++++
- test/schematron/cve-2025-49796.sct     |  9 +++++
- test/schematron/cve-2025-49796_0.xml   |  3 ++
- 7 files changed, 58 insertions(+), 23 deletions(-)
- create mode 100644 result/schematron/cve-2025-49794_0.err
- create mode 100644 result/schematron/cve-2025-49796_0.err
- create mode 100644 test/schematron/cve-2025-49794.sct
- create mode 100644 test/schematron/cve-2025-49794_0.xml
- create mode 100644 test/schematron/cve-2025-49796.sct
- create mode 100644 test/schematron/cve-2025-49796_0.xml
-
-diff --git a/result/schematron/cve-2025-49794_0.err b/result/schematron/cve-2025-49794_0.err
-new file mode 100644
-index 00000000..57752310
---- /dev/null
-+++ b/result/schematron/cve-2025-49794_0.err
-@@ -0,0 +1,2 @@
-+./test/schematron/cve-2025-49794_0.xml:2: element boo0: schematron error : /librar0/boo0 line 2:  
-+./test/schematron/cve-2025-49794_0.xml fails to validate
-diff --git a/result/schematron/cve-2025-49796_0.err b/result/schematron/cve-2025-49796_0.err
-new file mode 100644
-index 00000000..bf875ee0
---- /dev/null
-+++ b/result/schematron/cve-2025-49796_0.err
-@@ -0,0 +1,2 @@
-+./test/schematron/cve-2025-49796_0.xml:2: element boo0: schematron error : /librar0/boo0 line 2:  
-+./test/schematron/cve-2025-49796_0.xml fails to validate
-diff --git a/schematron.c b/schematron.c
-index 1de25deb..426300c8 100644
---- a/schematron.c
-+++ b/schematron.c
-@@ -1414,27 +1414,15 @@ exit:
-  *                                                                      *
-  ************************************************************************/
- 
--static xmlNodePtr
-+static xmlXPathObjectPtr
- xmlSchematronGetNode(xmlSchematronValidCtxtPtr ctxt,
-                      xmlNodePtr cur, const xmlChar *xpath) {
--    xmlNodePtr node = NULL;
--    xmlXPathObjectPtr ret;
--
-     if ((ctxt == NULL) || (cur == NULL) || (xpath == NULL))
-         return(NULL);
- 
-     ctxt->xctxt->doc = cur->doc;
-     ctxt->xctxt->node = cur;
--    ret = xmlXPathEval(xpath, ctxt->xctxt);
--    if (ret == NULL)
--        return(NULL);
--
--    if ((ret->type == XPATH_NODESET) &&
--        (ret->nodesetval != NULL) && (ret->nodesetval->nodeNr > 0))
--        node = ret->nodesetval->nodeTab[0];
--
--    xmlXPathFreeObject(ret);
--    return(node);
-+    return(xmlXPathEval(xpath, ctxt->xctxt));
- }
- 
- /**
-@@ -1480,25 +1468,40 @@ xmlSchematronFormatReport(xmlSchematronValidCtxtPtr ctxt,
-             (child->type == XML_CDATA_SECTION_NODE))
-             ret = xmlStrcat(ret, child->content);
-         else if (IS_SCHEMATRON(child, "name")) {
-+            xmlXPathObject *obj = NULL;
-             xmlChar *path;
- 
-             path = xmlGetNoNsProp(child, BAD_CAST "path");
- 
-             node = cur;
-             if (path != NULL) {
--                node = xmlSchematronGetNode(ctxt, cur, path);
--                if (node == NULL)
--                    node = cur;
-+                obj = xmlSchematronGetNode(ctxt, cur, path);
-+                if ((obj != NULL) &&
-+                    (obj->type == XPATH_NODESET) &&
-+                    (obj->nodesetval != NULL) &&
-+                    (obj->nodesetval->nodeNr > 0))
-+                    node = obj->nodesetval->nodeTab[0];
-                 xmlFree(path);
-             }
- 
--            if ((node->ns == NULL) || (node->ns->prefix == NULL))
--                ret = xmlStrcat(ret, node->name);
--            else {
--                ret = xmlStrcat(ret, node->ns->prefix);
--                ret = xmlStrcat(ret, BAD_CAST ":");
--                ret = xmlStrcat(ret, node->name);
-+            switch (node->type) {
-+                case XML_ELEMENT_NODE:
-+                case XML_ATTRIBUTE_NODE:
-+                    if ((node->ns == NULL) || (node->ns->prefix == NULL))
-+                        ret = xmlStrcat(ret, node->name);
-+                    else {
-+                        ret = xmlStrcat(ret, node->ns->prefix);
-+                        ret = xmlStrcat(ret, BAD_CAST ":");
-+                        ret = xmlStrcat(ret, node->name);
-+                    }
-+                    break;
-+
-+                /* TODO: handle other node types */
-+                default:
-+                    break;
-             }
-+
-+            xmlXPathFreeObject(obj);
-         } else if (IS_SCHEMATRON(child, "value-of")) {
-             xmlChar *select;
-             xmlXPathObjectPtr eval;
-diff --git a/test/schematron/cve-2025-49794.sct b/test/schematron/cve-2025-49794.sct
-new file mode 100644
-index 00000000..7fc9ee3d
---- /dev/null
-+++ b/test/schematron/cve-2025-49794.sct
-@@ -0,0 +1,10 @@
-+<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron">
-+    <sch:pattern id="">
-+        <sch:rule context="boo0">
-+            <sch:report test="not(0)">
-+                <sch:name path="&#9;e|namespace::*|e"/>
-+            </sch:report>
-+            <sch:report test="0"></sch:report>
-+        </sch:rule>
-+    </sch:pattern>
-+</sch:schema>
-diff --git a/test/schematron/cve-2025-49794_0.xml b/test/schematron/cve-2025-49794_0.xml
-new file mode 100644
-index 00000000..debc64ba
---- /dev/null
-+++ b/test/schematron/cve-2025-49794_0.xml
-@@ -0,0 +1,6 @@
-+<librar0>
-+    <boo0 t="">
-+        <author></author>
-+    </boo0>
-+    <ins></ins>
-+</librar0>
-diff --git a/test/schematron/cve-2025-49796.sct b/test/schematron/cve-2025-49796.sct
-new file mode 100644
-index 00000000..e9702d75
---- /dev/null
-+++ b/test/schematron/cve-2025-49796.sct
-@@ -0,0 +1,9 @@
-+<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron">
-+    <sch:pattern id="">
-+        <sch:rule context="boo0">
-+            <sch:report test="not(0)">
-+                <sch:name path="/"/>
-+            </sch:report>
-+        </sch:rule>
-+    </sch:pattern>
-+</sch:schema>
-diff --git a/test/schematron/cve-2025-49796_0.xml b/test/schematron/cve-2025-49796_0.xml
-new file mode 100644
-index 00000000..be33c4ec
---- /dev/null
-+++ b/test/schematron/cve-2025-49796_0.xml
-@@ -0,0 +1,3 @@
-+<librar0>
-+    <boo0/>
-+</librar0>
--- 
-2.39.5
-
diff --git a/package/libxml2/0003-Schematron-Fix-null-pointer-dereference-leading-to-D.patch b/package/libxml2/0003-Schematron-Fix-null-pointer-dereference-leading-to-D.patch
deleted file mode 100644
index 38b3e9be41..0000000000
--- a/package/libxml2/0003-Schematron-Fix-null-pointer-dereference-leading-to-D.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 4df1c80c4edc51ecb9f2f574203128a06fd31406 Mon Sep 17 00:00:00 2001
-From: Michael Mann <mmann78@netscape.net>
-Date: Sat, 21 Jun 2025 12:11:30 -0400
-Subject: [PATCH] Schematron: Fix null pointer dereference leading to DoS
-
-(CVE-2025-49795)
-
-Fixes #932
-
-Upstream: https://gitlab.gnome.org/GNOME/libxml2/-/commit/499bcb78ab389f60c2fd634ce410d4bb85c18765
-CVE: CVE-2025-49795
-Signed-off-by: Tim Soubry <tim.soubry@mind.be>
----
- result/schematron/zvon16_0.err | 1 +
- schematron.c                   | 2 ++
- test/schematron/zvon16.sct     | 7 +++++++
- test/schematron/zvon16_0.xml   | 5 +++++
- 4 files changed, 15 insertions(+)
- create mode 100644 result/schematron/zvon16_0.err
- create mode 100644 test/schematron/zvon16.sct
- create mode 100644 test/schematron/zvon16_0.xml
-
-diff --git a/result/schematron/zvon16_0.err b/result/schematron/zvon16_0.err
-new file mode 100644
-index 00000000..465cf2eb
---- /dev/null
-+++ b/result/schematron/zvon16_0.err
-@@ -0,0 +1 @@
-+xmlSchematronParse: could not load './test/schematron/zvon16.sct'
-\ No newline at end of file
-diff --git a/schematron.c b/schematron.c
-index 426300c8..b51b20e1 100644
---- a/schematron.c
-+++ b/schematron.c
-@@ -1509,6 +1509,8 @@ xmlSchematronFormatReport(xmlSchematronValidCtxtPtr ctxt,
-             select = xmlGetNoNsProp(child, BAD_CAST "select");
-             comp = xmlXPathCtxtCompile(ctxt->xctxt, select);
-             eval = xmlXPathCompiledEval(comp, ctxt->xctxt);
-+            if (eval == NULL)
-+                return ret;
- 
-             switch (eval->type) {
-             case XPATH_NODESET: {
-diff --git a/test/schematron/zvon16.sct b/test/schematron/zvon16.sct
-new file mode 100644
-index 00000000..4d24c054
---- /dev/null
-+++ b/test/schematron/zvon16.sct
-@@ -0,0 +1,7 @@
-+<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron"
-+	<sch:pattern id="TestPattern">
-+		<sch:rule context="book">
-+			<sch:report test="not(@available)">Book <sch:value-of select="falae()"/> test</sch:report>
-+		</sch:rule>
-+	</sch:pattern>
-+</sch:schema>
-diff --git a/test/schematron/zvon16_0.xml b/test/schematron/zvon16_0.xml
-new file mode 100644
-index 00000000..551e2d65
---- /dev/null
-+++ b/test/schematron/zvon16_0.xml
-@@ -0,0 +1,5 @@
-+<library>
-+	<book title="Test Book" id="bk101">
-+		<author>Test Author</author>
-+	</book>
-+</library>
--- 
-2.39.5
-
diff --git a/package/libxml2/0004-fix-potential-buffer-overflows-of-interactive-shell.patch b/package/libxml2/0004-fix-potential-buffer-overflows-of-interactive-shell.patch
deleted file mode 100644
index 7d1314c5f9..0000000000
--- a/package/libxml2/0004-fix-potential-buffer-overflows-of-interactive-shell.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From: Michael Mann <mmann78@netscape.net>
-Date: Fri, 20 Jun 2025 23:05:00 -0400
-Subject: Fix potential buffer overflows of interactive shell
-
-Upstream: https://gitlab.gnome.org/GNOME/libxml2/-/commit/5e9ec5c107d3f5b5179c3dbc19df43df041cd55b
-Upstream: https://sources.debian.org/src/libxml2/2.12.7+dfsg+really2.9.14-2.1/debian/patches/CVE-2025-6170.patch/
-CVE: CVE-2025-6170
-[thomas: Originally backported for v2.9.14 re-applied on v2.13.8]
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- debugXML.c                       | 15 ++++++++++-----
- result/scripts/long_command      |  8 ++++++++
- test/scripts/long_command.script |  6 ++++++
- test/scripts/long_command.xml    |  1 +
- 4 files changed, 25 insertions(+), 5 deletions(-)
- create mode 100644 result/scripts/long_command
- create mode 100644 test/scripts/long_command.script
- create mode 100644 test/scripts/long_command.xml
-
-diff --git a/debugXML.c b/debugXML.c
-index ed56b0f8..452b9573 100644
---- a/debugXML.c
-+++ b/debugXML.c
-@@ -1033,6 +1033,10 @@ xmlCtxtDumpOneNode(xmlDebugCtxtPtr ctxt, xmlNodePtr node)
-     xmlCtxtGenericNodeCheck(ctxt, node);
- }
- 
-+#define MAX_PROMPT_SIZE     500
-+#define MAX_ARG_SIZE        400
-+#define MAX_COMMAND_SIZE    100
-+
- /**
-  * xmlCtxtDumpNode:
-  * @output:  the FILE * for the output
-@@ -2795,10 +2799,10 @@ void
- xmlShell(xmlDocPtr doc, const char *filename, xmlShellReadlineFunc input,
-          FILE * output)
- {
--    char prompt[500] = "/ > ";
-+    char prompt[MAX_PROMPT_SIZE] = "/ > ";
-     char *cmdline = NULL, *cur;
--    char command[100];
--    char arg[400];
-+    char command[MAX_COMMAND_SIZE];
-+    char arg[MAX_ARG_SIZE];
-     int i;
-     xmlShellCtxtPtr ctxt;
-     xmlXPathObjectPtr list;
-@@ -2856,7 +2860,8 @@ xmlShell(xmlDocPtr doc, const char *filename, xmlShellReadlineFunc input,
-             cur++;
-         i = 0;
-         while ((*cur != ' ') && (*cur != '\t') &&
--               (*cur != '\n') && (*cur != '\r')) {
-+               (*cur != '\n') && (*cur != '\r') &&
-+               (i < (MAX_COMMAND_SIZE - 1))) {
-             if (*cur == 0)
-                 break;
-             command[i++] = *cur++;
-@@ -2871,7 +2876,7 @@ xmlShell(xmlDocPtr doc, const char *filename, xmlShellReadlineFunc input,
-         while ((*cur == ' ') || (*cur == '\t'))
-             cur++;
-         i = 0;
--        while ((*cur != '\n') && (*cur != '\r') && (*cur != 0)) {
-+        while ((*cur != '\n') && (*cur != '\r') && (*cur != 0) && (i < (MAX_ARG_SIZE-1))) {
-             if (*cur == 0)
-                 break;
-             arg[i++] = *cur++;
-diff --git a/result/scripts/long_command b/result/scripts/long_command
-new file mode 100644
-index 00000000..e6f00708
---- /dev/null
-+++ b/result/scripts/long_command
-@@ -0,0 +1,8 @@
-+/ > b > b > Object is a Node Set :
-+Set contains 1 nodes:
-+1  ELEMENT a:c
-+b > Unknown command This_is_a_really_long_command_string_designed_to_test_the_limits_of_the_memory_that_stores_the_comm
-+b > b > Unknown command ess_currents_of_time_and_existence
-+b > <?xml version="1.0"?>
-+<a xmlns:a="bar"><b xmlns:a="foo">Navigating_the_labyrinthine_corridors_of_human_cognition_one_often_encounters_the_perplexing_paradox_that_the_more_we_delve_into_the_intricate_dance_of_neural_pathways_and_synaptic_firings_the_further_we_seem_to_stray_from_a_truly_holistic_understanding_of_consciousness_a_phenomenon_that_remains_as_elusive_as_a_moonbeam_caught_in_a_spiderweb_yet_undeniably_shapes_every_fleeting_thought_every_prof</b></a>
-+b > 
-\ No newline at end of file
-diff --git a/test/scripts/long_command.script b/test/scripts/long_command.script
-new file mode 100644
-index 00000000..00f6df09
---- /dev/null
-+++ b/test/scripts/long_command.script
-@@ -0,0 +1,6 @@
-+cd a/b
-+set <a:c/>
-+xpath //*[namespace-uri()="foo"]
-+This_is_a_really_long_command_string_designed_to_test_the_limits_of_the_memory_that_stores_the_command_please_dont_crash foo
-+set Navigating_the_labyrinthine_corridors_of_human_cognition_one_often_encounters_the_perplexing_paradox_that_the_more_we_delve_into_the_intricate_dance_of_neural_pathways_and_synaptic_firings_the_further_we_seem_to_stray_from_a_truly_holistic_understanding_of_consciousness_a_phenomenon_that_remains_as_elusive_as_a_moonbeam_caught_in_a_spiderweb_yet_undeniably_shapes_every_fleeting_thought_every_profound_emotion_and_every_grand_aspiration_that_propels_our_species_ever_onward_through_the_relentless_currents_of_time_and_existence
-+save -
-diff --git a/test/scripts/long_command.xml b/test/scripts/long_command.xml
-new file mode 100644
-index 00000000..1ba44016
---- /dev/null
-+++ b/test/scripts/long_command.xml
-@@ -0,0 +1 @@
-+<a xmlns:a="bar"><b xmlns:a="foo"/></a>
--- 
-2.50.1
diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
index 3f53b51b33..59f1ef2ac0 100644
--- a/package/libxml2/libxml2.hash
+++ b/package/libxml2/libxml2.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/libxml2/2.13/libxml2-2.13.8.sha256sum
-sha256  277294cb33119ab71b2bc81f2f445e9bc9435b893ad15bb2cd2b0e859a0ee84a  libxml2-2.13.8.tar.xz
+# From https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.0.sha256sum
+sha256  5abc766497c5b1d6d99231f662e30c99402a90d03b06c67b62d6c1179dedd561  libxml2-2.15.0.tar.xz
 # License files, locally calculated
-sha256  c99aae1afe013e50b8b3701e089222b351258043c3025b64053a233fd25b4be7  Copyright
+sha256  5d4873884a890122a4b9b20ad56ac6f7da1d796a5bfcf04a427970ac96217626  Copyright
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 36cdd5a63d..09c5fcc163 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBXML2_VERSION_MAJOR = 2.13
-LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).8
+LIBXML2_VERSION_MAJOR = 2.15
+LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).0
 LIBXML2_SOURCE = libxml2-$(LIBXML2_VERSION).tar.xz
 LIBXML2_SITE = \
 	https://download.gnome.org/sources/libxml2/$(LIBXML2_VERSION_MAJOR)
@@ -15,18 +15,6 @@ LIBXML2_LICENSE_FILES = Copyright
 LIBXML2_CPE_ID_VENDOR = xmlsoft
 LIBXML2_CONFIG_SCRIPTS = xml2-config
 
-#0001-tree-Fix-integer-overflow-in-xmlBuildQName.patch
-LIBXML2_IGNORE_CVES += CVE-2025-6021
-
-#0002-schematron-Fix-memory-safety-issues-in-xmlSchematron.patch
-LIBXML2_IGNORE_CVES += CVE-2025-49794 CVE-2025-49796
-
-#0003-Schematron-Fix-null-pointer-dereference-leading-to-D.patch
-LIBXML2_IGNORE_CVES += CVE-2025-49795
-
-# 0004-fix-potential-buffer-overflows-of-interactive-shell.patch
-LIBXML2_IGNORE_CVES += CVE-2025-6170
-
 # relocation truncated to fit: R_68K_GOT16O
 ifeq ($(BR2_m68k_cf),y)
 LIBXML2_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -mxgot"
@@ -37,21 +25,7 @@ LIBXML2_CONF_OPTS = --with-http --with-gnu-ld --without-debug
 HOST_LIBXML2_DEPENDENCIES = host-pkgconf
 LIBXML2_DEPENDENCIES = host-pkgconf
 
-HOST_LIBXML2_CONF_OPTS = --without-zlib --without-lzma
-
-ifeq ($(BR2_PACKAGE_PYTHON3),y)
-LIBXML2_DEPENDENCIES += python3
-LIBXML2_CONF_OPTS += --with-python
-else
-LIBXML2_CONF_OPTS += --without-python
-endif
-
-ifeq ($(BR2_PACKAGE_HOST_PYTHON3),y)
-HOST_LIBXML2_DEPENDENCIES += host-python3
-HOST_LIBXML2_CONF_OPTS += --with-python
-else
-HOST_LIBXML2_CONF_OPTS += --without-python
-endif
+HOST_LIBXML2_CONF_OPTS = --without-zlib
 
 ifeq ($(BR2_PACKAGE_ICU),y)
 LIBXML2_DEPENDENCIES += icu
@@ -67,13 +41,6 @@ else
 LIBXML2_CONF_OPTS += --without-zlib
 endif
 
-ifeq ($(BR2_PACKAGE_XZ),y)
-LIBXML2_DEPENDENCIES += xz
-LIBXML2_CONF_OPTS += --with-lzma
-else
-LIBXML2_CONF_OPTS += --without-lzma
-endif
-
 LIBXML2_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
 ifeq ($(BR2_ENABLE_LOCALE)$(BR2_PACKAGE_LIBICONV),y)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
