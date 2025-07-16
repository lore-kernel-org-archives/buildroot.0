Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D18AC83F22
	for <buildroot@archiver.kernel.org>; Wed, 16 Jul 2025 09:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F399A614CC;
	Wed, 16 Jul 2025 09:34:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wmN-8QnNxeSI; Wed, 16 Jul 2025 09:34:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 886EC614E1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 886EC614E1;
	Wed, 16 Jul 2025 09:34:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 125C7234
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 09:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1EC361488
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 09:34:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j0uG9gRnRelK for <buildroot@buildroot.org>;
 Wed, 16 Jul 2025 09:34:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=fabien.lehoussel@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 139DF614C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 139DF614C7
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 139DF614C7
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 09:34:16 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4561ca74829so28493325e9.0
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 02:34:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752658454; x=1753263254;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ovGoimMCDLeYjroeMfuNVwlvB27nxPDnJgoKMybKDdo=;
 b=Bceq16QvbA7yFpJSBtBYoMvNqvhWW3X2bqrtfIe+CANy34ySWnLxKzE5oLZiam8Nej
 9gTPKmzdXuxkW1gbVW93JnhZHY0DwnzHr1IkBCwpkkkNkTXayrmYzOV94vRaJjrqQZOo
 3ELqJa2VBe/x+56WIIC/geY4/BY3FckRyZXrwSUzvbP1qJJgx4dz2J7dipafCHTMjXhg
 eOpCgekFN/8vAO6MjnDzbEeHwqV3yP79Ly++6nxtXQGjob8LFfHvkCJka8xHkdtxXLvp
 hKcaaQ5RxtvPOfLWbLyKh8v0xVTsRmbEwLZ7u3igrZhKvMJVFKMevX3y09msT28UvEbi
 hQMg==
X-Gm-Message-State: AOJu0YwzJGl+1lljh8pSNLxJ7PVpo5sa5+LusZtzxxBSo4YNc/Qs8VIx
 wbtdc8iDLZyxjTrAK5EpJiXd9lNb0eMtr/Dtb9SVsQhcW32DRvkRZt+f/UAk8cHtpEyCS6VfF6b
 huAyg
X-Gm-Gg: ASbGncsVXZ1yVwfjDNDQwfCvDb0H8luOIYDmrH07HZI7uoXdVNUKXTrk8BGJ/K8OEv/
 U/XQ44ekCzBWoauqkULxAtQZd2jsJeRlaIbnSH+izy/SrRWYIuW2SjpTXDet5/tglq9n8AH+/8U
 beeDeDWieCRtd7kt481/doaiYJ5OAI3HX905S0nUy6VHPE/Of3lgJEiu5yAjqN+x683nj8s5dA3
 B/YwYVjkuNbTS7WvpbOxeJair98Hc5HrsU8MSvcJR+NLxEg66mVaWvewcKbCYW8iNnpl/h+zkIa
 vyxJGTzo+HzM4KTbBWAWJoU4eI4jTnFWYeqc872AW/sRRKnxjI381KGNcUlmFzPhpGBn5BrqpAV
 1NTuXyFsZVMo+EIHPq3r/Ozgxqs8x7BBIRozD7mheId/u2Do9U9FwKym8mYhCuKJEC3gxIG/3Eu
 nbsmw72LsiMkTSzgbT0L+NJmzEFI63r9Iv
X-Google-Smtp-Source: AGHT+IGbcr80/GaPKkf+l1vjzXGD4NFzZOomOJcPNcfUDMeLyHcq4IP6dadPYOJb9k0rIxeYKLmuFg==
X-Received: by 2002:a05:600c:3b1e:b0:439:643a:c8d5 with SMTP id
 5b1f17b1804b1-4562e321debmr20835785e9.0.1752658454477; 
 Wed, 16 Jul 2025 02:34:14 -0700 (PDT)
Received: from NV4XMB-ME-MZ.idf.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e802984sm15415205e9.12.2025.07.16.02.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 02:34:14 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Fabien Lehoussel <fabien.lehoussel@smile.fr>
Date: Wed, 16 Jul 2025 11:33:47 +0200
Message-ID: <20250716093401.1213358-4-fabien.lehoussel@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250716093401.1213358-1-fabien.lehoussel@smile.fr>
References: <20250716093401.1213358-1-fabien.lehoussel@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1752658454; x=1753263254; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ovGoimMCDLeYjroeMfuNVwlvB27nxPDnJgoKMybKDdo=;
 b=Ja7ZrbtxkwdrM+rIewc9DD74+K0E1Re3jFiWhpkRwytl2T64HRP7gidGTS0mnMttCL
 1mnVQ8LDjL2G6DaQNCtCpdv7/znDZyjS2iIIeBhu43OIS5Cg81qxEa8bceyWvQMddeHp
 5UNzMbUcPGLg8aDnNOm3Hp5eduITFu9hjbQxY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=Ja7Zrbtx
Subject: [Buildroot] [PATCH v2 4/5] utils/generate-cyclonedx: add project
 name and version options
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

Options used to customize the project name and version in the generated SBOM metadata.
Sets buildroot generate-cyclonedx as a tool in the metadata section

Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
---
 utils/generate-cyclonedx | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index d3acf755e1..d28750735f 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -278,6 +278,11 @@ def main():
     parser.add_argument("-o", "--out-file", nargs="?", type=argparse.FileType("w"),
                         default=sys.stdout)
 
+    parser.add_argument("--project-name", type=str, default="buildroot",
+                        help="Specify the project name to use in the SBOM metadata (default:'buildroot')")
+    parser.add_argument("--project-version", type=str, default=f"{BR2_VERSION_FULL}",
+                        help="Specify the project version to use in the SBOM metadata (default: builroot version)")
+
     parser.add_argument("--no-host-packages", default=False, action='store_true',
                         help="This option excludes host packages from the CycloneDX output")
 
@@ -300,11 +305,27 @@ def main():
         "specVersion": f"{CYCLONEDX_VERSION}",
         "metadata": {
             "component": {
-                "bom-ref": "buildroot",
-                "name": "buildroot",
+                "bom-ref": args.project_name,
+                "name": args.project_name,
+                "version": args.project_version,
                 "type": "firmware",
-                "version": f"{BR2_VERSION_FULL}",
             },
+            "tools": {
+                "components": [
+                    {
+                        "type": "application",
+                        "name": "Buildroot generate-cyclonedx",
+                        "version": f"{BR2_VERSION_FULL}",
+                        "licenses": [
+                            {
+                                "license": {
+                                    "id": "GPL-2.0"
+                                }
+                            }
+                        ]
+                    }
+                ],
+            }
         },
         "components": [
             cyclonedx_component(name, comp) for name, comp in filtered_show_info_dict.items()
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
