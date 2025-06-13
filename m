Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86290C71151
	for <buildroot@archiver.kernel.org>; Fri, 13 Jun 2025 11:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47A8640A6D;
	Fri, 13 Jun 2025 11:06:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VDbH92u5oFo1; Fri, 13 Jun 2025 11:06:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51A4E40A73
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51A4E40A73;
	Fri, 13 Jun 2025 11:06:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 230621DC
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 11:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F284540A4D
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 11:06:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E8LKHUgW0F9c for <buildroot@buildroot.org>;
 Fri, 13 Jun 2025 11:06:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=fabien.lehoussel@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CE343409D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE343409D2
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CE343409D2
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 11:06:05 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a548a73ff2so1964659f8f.0
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 04:06:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749812763; x=1750417563;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fo0J63oCpGdiVDIeGW5hqAWLqMuVXD8rvWF1MKOInLI=;
 b=uUMCLcbM2Klf47B784tSObyQXEx4Z9zzqp7kWyS6fM0iG4C2dFrKeht1p9rhUqF/jD
 K1Y1gIY7CUfde1MqJJTBZEjGUjeXKcejzjzNj4R+b0if7vNOvqwQf+oW5c4H29duIcKJ
 QSJZtFBMMPvYozXDUH5eNTzE+b5nDJNKKEZNoCeY5658dTqJw3xIk5Yqx5WgxCpxyKsW
 xeSs9yHwi5gAh0hnJo9dwN/tczCfcYvukPOBhp+ILpnffc+Wj7mGviGvgi+e/7I2KQ8h
 TF4o6QPVBnpnnAFf0wq+kPluNvJHJTwD8/06haaSk/JYQQjYwVgnHuN3CmgBL/B1uzTQ
 78bQ==
X-Gm-Message-State: AOJu0YzwteBVcE3ehqDIIfHsDxSurC6qPSfCqwG6lgbff7qdio4swDnB
 hZMMozpZhkklbx9bzC7B26NQpCVmoY47hVMnbY6O6p4L1dU9DL/iB8SHKHnGJ8GcI0sEOU/6Bvx
 xIH+y
X-Gm-Gg: ASbGncu+ShdSiEFC41cQzx6uXcMXQfDDAhNbnGUzgaytQaoLp/CBS8ca2D3AMS9+tjd
 wTmPqsB0Vk+56AKzt3dsquooRogYdQlG6Zh45WMEQ3LDE1lxWhrpeU8url1rfWNOKBWlGmXrC9g
 Rkd0UUlq7fVwvLlTqY/0WxZf8ncTxo437tt9/zUrOh2+vP0BDnkvpf+N+HxXUNU1KG7D93QwDxA
 vIw/0/fUg39NPl6YT/w9a9dq8j4YOE6vBh/WDxmXc/h7xzfnLB0DayKX5uo9OovfBHs1c7l4mlm
 qb9uzjoiRfFLo7Lp1U9vyAXVMtL1WKZGaN8moAL4Xk/0JIU5PQkGKdXnidOKyo0S+3PitHj9scI
 =
X-Google-Smtp-Source: AGHT+IFOSA2CTCckfe9UlIYQ0EzCG1YAX9L1BeKUaDTru+BuTBCSdNqTfnjK+76OeuaMxO59hTc+2Q==
X-Received: by 2002:a5d:64c9:0:b0:3a4:e65d:5d8c with SMTP id
 ffacd0b85a97d-3a56873b421mr2268977f8f.40.1749812763416; 
 Fri, 13 Jun 2025 04:06:03 -0700 (PDT)
Received: from NV4XMB-ME-MZ.. ([2a01:e0a:943:83d0:e0a4:5913:a608:fb7f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568a7f8f9sm2060459f8f.42.2025.06.13.04.06.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 04:06:03 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Fabien Lehoussel <fabien.lehoussel@smile.fr>
Date: Fri, 13 Jun 2025 13:05:55 +0200
Message-ID: <20250613110559.2665663-3-fabien.lehoussel@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613110559.2665663-1-fabien.lehoussel@smile.fr>
References: <20250613110559.2665663-1-fabien.lehoussel@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1749812763; x=1750417563; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fo0J63oCpGdiVDIeGW5hqAWLqMuVXD8rvWF1MKOInLI=;
 b=Zb4IqOaBug353YV/IRywLrbGLLzsiCkpTfHC0vNBJvzv4C8idy8W+cGCpiEBLG+jjp
 0jmc9WFNE8QFGWl6+IyMDRC3p5gC1/sBzBFVLZ9AjESBKRLeEs1FCw6xdAQMd+sfE5kn
 7RQl5zJKU+WZOv1jagnRJVGWnLqkpN1u0u4Ls=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=Zb4IqOaB
Subject: [Buildroot] [PATCH 3/7] utils/generate-cyclonedx: move metadata
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

Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
---
 utils/generate-cyclonedx | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 2c234e1a45..a069f467b6 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -301,6 +301,14 @@ def main():
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
@@ -310,14 +318,6 @@ def main():
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
