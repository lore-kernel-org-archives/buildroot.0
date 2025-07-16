Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D79C83F27
	for <buildroot@archiver.kernel.org>; Wed, 16 Jul 2025 09:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE2B56147F;
	Wed, 16 Jul 2025 09:34:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wlwf8VuUJijm; Wed, 16 Jul 2025 09:34:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AAFB614C4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AAFB614C4;
	Wed, 16 Jul 2025 09:34:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CD9B0234
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 09:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BAD0E61488
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 09:34:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Y5hV3NSC3ld for <buildroot@buildroot.org>;
 Wed, 16 Jul 2025 09:34:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=fabien.lehoussel@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8A2D26147F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A2D26147F
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A2D26147F
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 09:34:16 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a54690d369so5149580f8f.3
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 02:34:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752658454; x=1753263254;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jIEiaXRXVbNsgUPyp1JlGp1sCQGbjwRnIxQrlBXnryk=;
 b=bxjyIGqa/h2oPKHq+NzwBNBKEVB7NpsTdJebEYhqnbdYztLeIhWyy4a3pKn3/IHaKQ
 LsP2QVOOVZhRYtDBaJ2jakehsRJ/SpoA8UhNzRLZFRi0BPsXRRSGQBRedWZbGCqvyYmz
 oRMdHMtvj/d/GkLQjFck7iGEjPc3yyyogMSEPu4L408gmyIKOASxyM66cRUCexBlET0b
 CG/fxrllGX8Pw8/9sRe6iDdJAyw1ot01r4mJMy1Wf76kj0R+MQNfPH9xf/dCwRJOcYQ3
 vkcdyqNvDZLf3HBn2p5uGc70RTcfFpi/x4W0tSADpQ6etedMJE/6kWVIxhTTcWxO/ksQ
 j0+w==
X-Gm-Message-State: AOJu0YxzlnwHRHGdjAzc/+lxc9/EkphRiGETs6NXxY7zPZKgFzzQEbxQ
 ryZxBFZGj/+ZrwOqXnKoiS79JZO2RdQtIm2uaWWifBv0tD5jo0CZFshXFygBsNZNTPQOeoXtI81
 YseMe
X-Gm-Gg: ASbGncufPC8qwz5a0TH5f2HRgDlyfa8+f8QsyW7gAsXiUZXExtLuOWyBNxkuv6IdJxi
 0P+zK4viqaVadBD9f2e0t7x50Cfg+o2a6JwGosjbcw2/qdCRM4qxUYu10c+PkiDottS/9uAKka5
 /4CPnMOhmtDHn+X6i5afZXcnsThIR3bKqIFSiPHyuWS5EY8xp00+MWLWRgN7PhnSnjc/sbsP3g6
 6sCPnxfH1XoLBEGlY5u4mjt8DtgSpyCYXs+jkMWzfzZbPuX7ayG9Fhc8mk7ICSVAeUrnvVttmoK
 juDYo1zpLSKR0p6k16WDtMUGfkAcUoHZUhG1ulsjEDNe1XLJLGYrqRSQ+s0wv+yWPJWji0oXPWi
 Z2jLbYCczPuJeGildNyrWqT4IfIVrc03K8T6ZGp45O1nEYB/Gb7nPwSfZGtpoty3OHyJLoIJrJU
 e0aWa0e2ZmbB+V1w0RF+nA+Lkj5pGEk6C4
X-Google-Smtp-Source: AGHT+IGdoZUMywUVsJNfF1CTth0Rl6Lht3fac2LGdFqiRKTqg1fnkUU+FQ1+xOei1mD7KOWe6fth8A==
X-Received: by 2002:a05:6000:2301:b0:3a5:287b:da02 with SMTP id
 ffacd0b85a97d-3b60e50fc76mr1316998f8f.40.1752658453879; 
 Wed, 16 Jul 2025 02:34:13 -0700 (PDT)
Received: from NV4XMB-ME-MZ.idf.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e802984sm15415205e9.12.2025.07.16.02.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 02:34:13 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Fabien Lehoussel <fabien.lehoussel@smile.fr>
Date: Wed, 16 Jul 2025 11:33:46 +0200
Message-ID: <20250716093401.1213358-3-fabien.lehoussel@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250716093401.1213358-1-fabien.lehoussel@smile.fr>
References: <20250716093401.1213358-1-fabien.lehoussel@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1752658454; x=1753263254; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jIEiaXRXVbNsgUPyp1JlGp1sCQGbjwRnIxQrlBXnryk=;
 b=ktsvIK/XqdUZ/hv+FCdrDJu28CBhcyCABYJhRk0fkzxK/jKCet0Jw3Flf/ud4m4Sxn
 Z9bxVPIoa3geDUOBLaK/gpEgCBaeJBwVRUyhR7dBVkAaPxI0Wcx/KJEJtJkqPjwCN4lo
 OwS9zhCXmsZ5xuj1Db7U+nYZAw1tVAipCVDY0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=ktsvIK/X
Subject: [Buildroot] [PATCH v2 3/5] utils/generate-cyclonedx: move metadata
 section to top level
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
From: Fabien Lehoussel via buildroot <buildroot@buildroot.org>
Reply-To: Fabien Lehoussel <fabien.lehoussel@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This makes it more readable and easier to quickly identify basic information.

Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
---
 utils/generate-cyclonedx | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 14f655bca2..d3acf755e1 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -298,6 +298,14 @@ def main():
         "bomFormat": "CycloneDX",
         "$schema": f"http://cyclonedx.org/schema/bom-{CYCLONEDX_VERSION}.schema.json",
         "specVersion": f"{CYCLONEDX_VERSION}",
+        "metadata": {
+            "component": {
+                "bom-ref": "buildroot",
+                "name": "buildroot",
+                "type": "firmware",
+                "version": f"{BR2_VERSION_FULL}",
+            },
+        },
         "components": [
             cyclonedx_component(name, comp) for name, comp in filtered_show_info_dict.items()
         ],
@@ -307,14 +315,6 @@ def main():
               for ref in filtered_show_info_dict],
         ],
         "vulnerabilities": cyclonedx_vulnerabilities(show_info_dict),
-        "metadata": {
-            "component": {
-                "bom-ref": "buildroot",
-                "name": "buildroot",
-                "type": "firmware",
-                "version": f"{BR2_VERSION_FULL}",
-            },
-        },
     }
 
     args.out_file.write(json.dumps(cyclonedx_dict, indent=2))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
