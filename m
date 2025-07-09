Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B5DDC83F03
	for <buildroot@archiver.kernel.org>; Wed,  9 Jul 2025 15:15:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 938C540BC6;
	Wed,  9 Jul 2025 15:15:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V-dNMTNkFz2h; Wed,  9 Jul 2025 15:15:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F3024081E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F3024081E;
	Wed,  9 Jul 2025 15:15:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D0F6812E
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 15:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C26DD407A5
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 15:15:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n93aXOoJRUod for <buildroot@buildroot.org>;
 Wed,  9 Jul 2025 15:15:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=tim.soubry@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 75FE140786
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75FE140786
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 75FE140786
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 15:15:48 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a4e742dc97so744046f8f.0
 for <buildroot@buildroot.org>; Wed, 09 Jul 2025 08:15:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752074146; x=1752678946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CA7qjVoQL190REtOvjem4FM1B03wn2tTaU7KaOetWSQ=;
 b=rgPCRjdRvqS1+dn3f6Swm2j0rZ22TgurD7BUsAxj3ChWf3/cuupUUhnBd3AKHmv74y
 Pv8s6gzurRyzptn+lU4OiyLtxCzOemc8A0B15I1+JExw9eOEMMcXbNg8nEB6x+b4EMz9
 f9l8UHB6qZ0qNl3tVkIOnvpRhe3ZhwJrQncCAk/8auYAHi7kOdoaQt4NhEHH3VMvcF/a
 ggjGO6HVxLKS5YGI7d8Hk86aunrqphbghvcOh13ep8+GXwXRmnXZ+2TTrBWger0dBJhi
 f9igg4iHEHw5gUT5y6QKWHzlD1oj4qEivbYzKY5jv5Ug7I2YSlderjpNuq3I/2VrnoGk
 9y2Q==
X-Gm-Message-State: AOJu0YwBQeg9cZqGPwsMKPe3LVtE8dwyM+TvyYObSoh3K7zPU3iq2QL/
 yxmoN3XGivwy0+/dzLdZpGls1ZM+dIspGhhZu5RUaW8S+R9eJTE5VHNzHfRsHu6vMBAWjFA5bAZ
 r1V/sWFM=
X-Gm-Gg: ASbGncsOtjx3N+RNaQ5w9NHXUwqfAr+o6iepDe4IpDxgNBOEMFvxK/mPTZe5mabkWYZ
 NTcUOcwmW8kFbszOORwf2wPnIoLSjReyi24Tsto88LXP4LIR17VDFLlrGbjuKsBaut/U/TaHN3Y
 yp+QFoRh+V6VaWqhniDbVqfLTV0F+M8sARZOrmXIrIMZUgmathYMl9pMohvq72OgTJGdasnCYwF
 w9uygl/Q4KyCpfC3EpXPtOD+JcohQQgOB+kIQmxX58hEBXYbe5fgnR89vETA1lw0WyxMsoZICLv
 39CBBRBXLBm4etykk1COiOVFRmmAavGn6c913WB01HyiCkykTLKFUhnVefA4OXUglHeCv34ed+S
 8xgUv0peTsB7mlCKBfNhUXEEqpwl7TPNDtrgVhg35W9xBbXUHSSXOxaNe1A==
X-Google-Smtp-Source: AGHT+IF3bN9hxAU4jh+nE1BiYYBi8LKr+YWKc3QZMgNm1BTzcXgAcVi8wQYIHqsgmO7ZtXHysoTvrw==
X-Received: by 2002:a05:6000:24c6:b0:3a5:5130:1c71 with SMTP id
 ffacd0b85a97d-3b5e43939a3mr2625497f8f.0.1752074145728; 
 Wed, 09 Jul 2025 08:15:45 -0700 (PDT)
Received: from TimMind.telenet.be
 (ptr-377wgeyf4tq7vco44vbx.18120a2.ip6.access.telenet.be.
 [2a02:181f:0:4023:f979:8572:d806:db9d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b49cb46c61sm12455771f8f.63.2025.07.09.08.15.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 08:15:45 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Date: Wed,  9 Jul 2025 17:15:41 +0200
Message-Id: <20250709151542.2605609-2-tim.soubry@mind.be>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250709151542.2605609-1-tim.soubry@mind.be>
References: <20250709151542.2605609-1-tim.soubry@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752074146; x=1752678946; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CA7qjVoQL190REtOvjem4FM1B03wn2tTaU7KaOetWSQ=;
 b=STBcHqU2d2Ddse3JwPLpbj0d9JYgVp8NEbRuQg83RIXdCvbtVufNhJclLpDQpeng1h
 3c/xBGgXxuPolusfT/r/xYm1dbnD5r4hjrZDvNnqSJOOYSlO14rLj1vdsq3A+hzg3wk2
 B2DWpABVX1mRG4llgBMdvt2o4VXhsMNkccoeSEyZRiShzAYqgq4jfAANdu8ObeqhNsFE
 aMdCZPI5tm1SGjrV25a7MnWhvqPeEdUN4o6ZPLoCgFhRyDzT5SdQpF3IBEafkRZrtB7G
 lWIycNQsl1FJNNH/aX9AfHrc81Y9hjxGSCxK6TR8n9NIt6TUQffiO/NWWnRadeiQeoCS
 X2Yg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=STBcHqU2
Subject: [Buildroot] [PATCH 2/3] package/libxml2: add patch for
 CVE-2025-49794 & CVE-2025-49796
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

This patch fixes CVE-2025-49794 [1] and CVE-2025-49796 [2] by
backporting the commit from [3] to libxml2 2.13.

[1] https://nvd.nist.gov/vuln/detail/cve-2025-49794
[2] https://nvd.nist.gov/vuln/detail/cve-2025-49796
[3] https://gitlab.gnome.org/GNOME/libxml2/-/commit/71e1e8af5ee46dad1b57bb96cfbf1c3ad21fbd7b

Signed-off-by: Tim Soubry <tim.soubry@mind.be>
---
 ...emory-safety-issues-in-xmlSchematron.patch | 186 ++++++++++++++++++
 package/libxml2/libxml2.mk                    |   3 +
 2 files changed, 189 insertions(+)
 create mode 100644 package/libxml2/0002-schematron-Fix-memory-safety-issues-in-xmlSchematron.patch

diff --git a/package/libxml2/0002-schematron-Fix-memory-safety-issues-in-xmlSchematron.patch b/package/libxml2/0002-schematron-Fix-memory-safety-issues-in-xmlSchematron.patch
new file mode 100644
index 0000000000..1aadf4d3bc
--- /dev/null
+++ b/package/libxml2/0002-schematron-Fix-memory-safety-issues-in-xmlSchematron.patch
@@ -0,0 +1,186 @@
+From a89ed49b681fb4299120154ce0d6ca38e9abe482 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Fri, 4 Jul 2025 14:28:26 +0200
+Subject: [PATCH] schematron: Fix memory safety issues in
+ xmlSchematronReportOutput
+
+Fix use-after-free (CVE-2025-49794) and type confusion (CVE-2025-49796)
+in xmlSchematronReportOutput.
+
+Fixes #931.
+Fixes #933.
+
+Upstream: https://gitlab.gnome.org/GNOME/libxml2/-/commit/71e1e8af5ee46dad1b57bb96cfbf1c3ad21fbd7b
+CVE: CVE-2025-49794 CVE-2025-49796
+Signed-off-by: Tim Soubry <tim.soubry@mind.be>
+---
+ result/schematron/cve-2025-49794_0.err |  2 ++
+ result/schematron/cve-2025-49796_0.err |  2 ++
+ schematron.c                           | 49 ++++++++++++++------------
+ test/schematron/cve-2025-49794.sct     | 10 ++++++
+ test/schematron/cve-2025-49794_0.xml   |  6 ++++
+ test/schematron/cve-2025-49796.sct     |  9 +++++
+ test/schematron/cve-2025-49796_0.xml   |  3 ++
+ 7 files changed, 58 insertions(+), 23 deletions(-)
+ create mode 100644 result/schematron/cve-2025-49794_0.err
+ create mode 100644 result/schematron/cve-2025-49796_0.err
+ create mode 100644 test/schematron/cve-2025-49794.sct
+ create mode 100644 test/schematron/cve-2025-49794_0.xml
+ create mode 100644 test/schematron/cve-2025-49796.sct
+ create mode 100644 test/schematron/cve-2025-49796_0.xml
+
+diff --git a/result/schematron/cve-2025-49794_0.err b/result/schematron/cve-2025-49794_0.err
+new file mode 100644
+index 00000000..57752310
+--- /dev/null
++++ b/result/schematron/cve-2025-49794_0.err
+@@ -0,0 +1,2 @@
++./test/schematron/cve-2025-49794_0.xml:2: element boo0: schematron error : /librar0/boo0 line 2:  
++./test/schematron/cve-2025-49794_0.xml fails to validate
+diff --git a/result/schematron/cve-2025-49796_0.err b/result/schematron/cve-2025-49796_0.err
+new file mode 100644
+index 00000000..bf875ee0
+--- /dev/null
++++ b/result/schematron/cve-2025-49796_0.err
+@@ -0,0 +1,2 @@
++./test/schematron/cve-2025-49796_0.xml:2: element boo0: schematron error : /librar0/boo0 line 2:  
++./test/schematron/cve-2025-49796_0.xml fails to validate
+diff --git a/schematron.c b/schematron.c
+index 1de25deb..426300c8 100644
+--- a/schematron.c
++++ b/schematron.c
+@@ -1414,27 +1414,15 @@ exit:
+  *                                                                      *
+  ************************************************************************/
+ 
+-static xmlNodePtr
++static xmlXPathObjectPtr
+ xmlSchematronGetNode(xmlSchematronValidCtxtPtr ctxt,
+                      xmlNodePtr cur, const xmlChar *xpath) {
+-    xmlNodePtr node = NULL;
+-    xmlXPathObjectPtr ret;
+-
+     if ((ctxt == NULL) || (cur == NULL) || (xpath == NULL))
+         return(NULL);
+ 
+     ctxt->xctxt->doc = cur->doc;
+     ctxt->xctxt->node = cur;
+-    ret = xmlXPathEval(xpath, ctxt->xctxt);
+-    if (ret == NULL)
+-        return(NULL);
+-
+-    if ((ret->type == XPATH_NODESET) &&
+-        (ret->nodesetval != NULL) && (ret->nodesetval->nodeNr > 0))
+-        node = ret->nodesetval->nodeTab[0];
+-
+-    xmlXPathFreeObject(ret);
+-    return(node);
++    return(xmlXPathEval(xpath, ctxt->xctxt));
+ }
+ 
+ /**
+@@ -1480,25 +1468,40 @@ xmlSchematronFormatReport(xmlSchematronValidCtxtPtr ctxt,
+             (child->type == XML_CDATA_SECTION_NODE))
+             ret = xmlStrcat(ret, child->content);
+         else if (IS_SCHEMATRON(child, "name")) {
++            xmlXPathObject *obj = NULL;
+             xmlChar *path;
+ 
+             path = xmlGetNoNsProp(child, BAD_CAST "path");
+ 
+             node = cur;
+             if (path != NULL) {
+-                node = xmlSchematronGetNode(ctxt, cur, path);
+-                if (node == NULL)
+-                    node = cur;
++                obj = xmlSchematronGetNode(ctxt, cur, path);
++                if ((obj != NULL) &&
++                    (obj->type == XPATH_NODESET) &&
++                    (obj->nodesetval != NULL) &&
++                    (obj->nodesetval->nodeNr > 0))
++                    node = obj->nodesetval->nodeTab[0];
+                 xmlFree(path);
+             }
+ 
+-            if ((node->ns == NULL) || (node->ns->prefix == NULL))
+-                ret = xmlStrcat(ret, node->name);
+-            else {
+-                ret = xmlStrcat(ret, node->ns->prefix);
+-                ret = xmlStrcat(ret, BAD_CAST ":");
+-                ret = xmlStrcat(ret, node->name);
++            switch (node->type) {
++                case XML_ELEMENT_NODE:
++                case XML_ATTRIBUTE_NODE:
++                    if ((node->ns == NULL) || (node->ns->prefix == NULL))
++                        ret = xmlStrcat(ret, node->name);
++                    else {
++                        ret = xmlStrcat(ret, node->ns->prefix);
++                        ret = xmlStrcat(ret, BAD_CAST ":");
++                        ret = xmlStrcat(ret, node->name);
++                    }
++                    break;
++
++                /* TODO: handle other node types */
++                default:
++                    break;
+             }
++
++            xmlXPathFreeObject(obj);
+         } else if (IS_SCHEMATRON(child, "value-of")) {
+             xmlChar *select;
+             xmlXPathObjectPtr eval;
+diff --git a/test/schematron/cve-2025-49794.sct b/test/schematron/cve-2025-49794.sct
+new file mode 100644
+index 00000000..7fc9ee3d
+--- /dev/null
++++ b/test/schematron/cve-2025-49794.sct
+@@ -0,0 +1,10 @@
++<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron">
++    <sch:pattern id="">
++        <sch:rule context="boo0">
++            <sch:report test="not(0)">
++                <sch:name path="&#9;e|namespace::*|e"/>
++            </sch:report>
++            <sch:report test="0"></sch:report>
++        </sch:rule>
++    </sch:pattern>
++</sch:schema>
+diff --git a/test/schematron/cve-2025-49794_0.xml b/test/schematron/cve-2025-49794_0.xml
+new file mode 100644
+index 00000000..debc64ba
+--- /dev/null
++++ b/test/schematron/cve-2025-49794_0.xml
+@@ -0,0 +1,6 @@
++<librar0>
++    <boo0 t="">
++        <author></author>
++    </boo0>
++    <ins></ins>
++</librar0>
+diff --git a/test/schematron/cve-2025-49796.sct b/test/schematron/cve-2025-49796.sct
+new file mode 100644
+index 00000000..e9702d75
+--- /dev/null
++++ b/test/schematron/cve-2025-49796.sct
+@@ -0,0 +1,9 @@
++<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron">
++    <sch:pattern id="">
++        <sch:rule context="boo0">
++            <sch:report test="not(0)">
++                <sch:name path="/"/>
++            </sch:report>
++        </sch:rule>
++    </sch:pattern>
++</sch:schema>
+diff --git a/test/schematron/cve-2025-49796_0.xml b/test/schematron/cve-2025-49796_0.xml
+new file mode 100644
+index 00000000..be33c4ec
+--- /dev/null
++++ b/test/schematron/cve-2025-49796_0.xml
+@@ -0,0 +1,3 @@
++<librar0>
++    <boo0/>
++</librar0>
+-- 
+2.39.5
+
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index f8651e726b..a4373a691a 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -18,6 +18,9 @@ LIBXML2_CONFIG_SCRIPTS = xml2-config
 #0001-tree-Fix-integer-overflow-in-xmlBuildQName.patch
 LIBXML2_IGNORE_CVES += CVE-2025-6021
 
+#0002-schematron-Fix-memory-safety-issues-in-xmlSchematron.patch
+LIBXML2_IGNORE_CVES += CVE-2025-49794 CVE-2025-49796
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
