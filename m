Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B3D8C61DB2
	for <buildroot@archiver.kernel.org>; Fri, 13 Jun 2025 11:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C03C40A67;
	Fri, 13 Jun 2025 11:06:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ldFTcEXHYGX; Fri, 13 Jun 2025 11:06:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9B1840A4F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9B1840A4F;
	Fri, 13 Jun 2025 11:06:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 141091D9
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 11:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0249D60B1E
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 11:06:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LvI12XIJj6MT for <buildroot@buildroot.org>;
 Fri, 13 Jun 2025 11:06:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=fabien.lehoussel@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4BCB060A71
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BCB060A71
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4BCB060A71
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 11:06:06 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a36748920cso1914649f8f.2
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 04:06:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749812764; x=1750417564;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RdMqXvz8lzZXB4ZBt2kaDlZBYU+B9NbO4kLdWSuWTDo=;
 b=fzNHdx97G0p4izBVeFXNPghAVgyJvshvN0HX875kUSX9A01qRQOZ2UjecvTx7lo7qX
 o6cah6KH5JdEBJxHknvUaWrjzVxfVRCw5u+eWbQxZH4VCzzNxRcUmzbV8XuQ6NlyZUEr
 SVaQGmapqjU76dYRBEsS1dTUoLi2/VXUB4bb9+KrdS7vN/KJK5gvN3ElEwfTfAvp7XYQ
 /8fW800a6efLMIG3I6WeFSA6aSviYKVVlNEkC7x5MBKiHaVYccRF6Mm+w6HJxtQNDT1e
 oP0K/2eoYWyhwZw32JPBVIi20OX+PJWRrgZFJZExDJPTc7erQxHdTLzo2T7a797stiqP
 ICfw==
X-Gm-Message-State: AOJu0YzdBYTiJapvctEPZbJ8h3qVO2jdNDf64RrBbdwh+1C53MKmrG1u
 8KV7IspsafLHf9h9nMQfdfphApmdKyTQ5gk9lXgb6dL/3i1UYHywuQkFbwsgPg8hYzmYtYDJihA
 OwGN7
X-Gm-Gg: ASbGncvrODxOgNidCijarAU1lnoptF7RbO3WRUZOcjFdGGSCm3etRDg7fjaCxgkumYQ
 ZQcSkHtQcFmH95L2clNmjY1a8MEBTnRNWU2kvzRzUeVF1lTzqTIAnuf9nkAQAHVtgWZ8DOFIpJO
 8E/qLm5z8DnFfVCrYfeD7MBDq41G99jpySZ/Q5mr4xEs3kB4PJarexpBOZBUW5vuzylL2f9J3+a
 df3fIZ45XdZ/bO+6keEVFPo/VnboyJEP/fTTz1zh66pJR2XGpqBeRjkaSDsTR7+Q3g+jvta8/P1
 ejtk9+pSS5ik4Udh42kEB2NcgTbRWLyp/FQYt8+VvuRyrB0VME5CvXm2meBf2p2nYJEe1VqeuK4
 =
X-Google-Smtp-Source: AGHT+IHHrNXVtF3rgsCPAATH6KsshX4Xdpe9UmG4V0gMnkyQ4VO1dQqq8hfYmutsHq4q4vy8p5mB6w==
X-Received: by 2002:a05:6000:4205:b0:3a4:f892:de7f with SMTP id
 ffacd0b85a97d-3a5687655dcmr2382575f8f.36.1749812764033; 
 Fri, 13 Jun 2025 04:06:04 -0700 (PDT)
Received: from NV4XMB-ME-MZ.. ([2a01:e0a:943:83d0:e0a4:5913:a608:fb7f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568a7f8f9sm2060459f8f.42.2025.06.13.04.06.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 04:06:03 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Fabien Lehoussel <fabien.lehoussel@smile.fr>
Date: Fri, 13 Jun 2025 13:05:56 +0200
Message-ID: <20250613110559.2665663-4-fabien.lehoussel@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613110559.2665663-1-fabien.lehoussel@smile.fr>
References: <20250613110559.2665663-1-fabien.lehoussel@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1749812764; x=1750417564; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RdMqXvz8lzZXB4ZBt2kaDlZBYU+B9NbO4kLdWSuWTDo=;
 b=DZ4x1gJUDpBIf+dhHCDtEOxwnXb9XXmfyk9KUxP1KRXO1pXEcDvlYFzMEGwa3jORTz
 lBGokB5CABJdgIAbVQkbJHuD+z05i3ULjgu/Z9sRDi8mMWozq3EawLwatIgzOR9wSyVp
 /saLqT7cwsEF08BWZJ0Y5xKefRfSZALAspqBY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=DZ4x1gJU
Subject: [Buildroot] [PATCH 4/7] utils/generate-cyclonedx: add timestamp
 field in metadata
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

Adds a timestamp field to the SBOM metadata section, following the
CycloneDX specification requirements. This improves compliance with
the standard and provides valuable information about when the SBOM
was generated.

Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
---
 utils/generate-cyclonedx | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index a069f467b6..5a6a191606 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -17,6 +17,7 @@ from pathlib import Path
 import urllib.request
 import subprocess
 import sys
+import datetime
 
 CYCLONEDX_VERSION = "1.6"
 SPDX_SCHEMA_URL = f"https://raw.githubusercontent.com/CycloneDX/specification/{CYCLONEDX_VERSION}/schema/spdx.schema.json"
@@ -302,6 +303,7 @@ def main():
         "$schema": f"http://cyclonedx.org/schema/bom-{CYCLONEDX_VERSION}.schema.json",
         "specVersion": f"{CYCLONEDX_VERSION}",
         "metadata": {
+            "timestamp": datetime.datetime.now().astimezone().isoformat(),
             "component": {
                 "bom-ref": "buildroot",
                 "name": "buildroot",
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
