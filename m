Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC8BC83F22
	for <buildroot@archiver.kernel.org>; Wed, 16 Jul 2025 09:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EFE461430;
	Wed, 16 Jul 2025 09:34:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UIzESLk900Fa; Wed, 16 Jul 2025 09:34:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A9136144A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A9136144A;
	Wed, 16 Jul 2025 09:34:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 21144234
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 09:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E37B41418
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 09:34:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R9V5rp_3ymQ3 for <buildroot@buildroot.org>;
 Wed, 16 Jul 2025 09:34:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=fabien.lehoussel@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1B8A74092F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B8A74092F
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1B8A74092F
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 09:34:12 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4560cdf235cso21555375e9.1
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 02:34:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752658450; x=1753263250;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=332gTzYDAMEO9RxwJ/BJ3S40Yl3FjWyNihOU+fsOVAs=;
 b=j+bY469qtcT7lzU6iPclsOK2d1LeUn8eHJ8q+6lW/EMKn4+Lb32aD9HV4SFLRYELEJ
 8a01nkgwPnVNZm6EbUcLl3GYEFfENYI4Mu+FT/5/GP+ibivLK3jNqbtQ2ehnHla6rMsh
 EeE+vF5cLnyTrdhBfdeTaynjEoTBWMSaPohFp4F9T3ykCTr4/STqUofMjmpQTXNMujPE
 dniK2zZ6XGNHtdFLxnVmjwmqw0lI+0KlK/+r5s0sloOeL+W4aGlAoDnEIxG4HLbm3IGl
 aOrClVa3ZE0C5vywrm97+6SVh4x97eRShfCPHBPLw7A1nAfj/UGcrE9rFDFurSIQuSaX
 5rwQ==
X-Gm-Message-State: AOJu0YxgsnFzRetifmz8DIzw5w+f3qUV1Mfhd73HXVc71CYXw/2L7yFg
 qv2Ky9KmvJTwkIPLA55IhF/f1AzDNXkekkpfDDtfRmkOR7AKHibeHWiop5MWTwEBPvaJE8ZvqIs
 BrjN8
X-Gm-Gg: ASbGncv3F+mIHwYWAQDjf7uu0u16t9J6Lrl0VX9i8u4i23dwM/tk7UA9xksN9EEht3b
 YyS622oJB61pPSE7O5BJTWvpwAe8mHbBBiPa13Im6JRZ7pwHo2VOiltJtKzTH+pTKarcUAOE5IR
 BktWs5PUwUYgpGA+ETplstO4rJ9yVJxtI82hwXQeKRqKjGE2ZiHd/Atp7JnSi85gV4kuThxCoF8
 YwHmSweV62nJPwn4XJz66VF9jMzVzBiPj9KPcX4of0S3dO1zKkXaezuTJvzk9tcWe4MPxUXVY2D
 DgqUK/SbVPro5BwzkWZQq1nG3A0Tm5umI2NBHHrFnCDyN77fHwz3gaW7pglgTumKz9onfSAiO64
 TnRLrP2uKBm9n5W1wOImbuh8LcDX9Tb/25Vra9vm6Q3fXnE0ywsf8CvnGX67jyFoApEodj8WAK+
 +Fm/0Lu5VlmhKvtG5MAQBDFR302Zdph8B6
X-Google-Smtp-Source: AGHT+IHvxHxfC4FnFV+19Wl8ulvoGbx+0YRtoUb62bEC+sV1PEDlXQU5dqKUW/lcCJI3XjZCnPx6ug==
X-Received: by 2002:a05:600c:46ca:b0:450:6b55:cf91 with SMTP id
 5b1f17b1804b1-4562dfd72admr21265565e9.6.1752658450585; 
 Wed, 16 Jul 2025 02:34:10 -0700 (PDT)
Received: from NV4XMB-ME-MZ.idf.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e802984sm15415205e9.12.2025.07.16.02.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 02:34:10 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Fabien Lehoussel <fabien.lehoussel@smile.fr>
Date: Wed, 16 Jul 2025 11:33:44 +0200
Message-ID: <20250716093401.1213358-1-fabien.lehoussel@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1752658450; x=1753263250; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=332gTzYDAMEO9RxwJ/BJ3S40Yl3FjWyNihOU+fsOVAs=;
 b=gVGCqVwF7txnXvIwy0OZG843EDG9s25ZRfZ3zuQ/AT3zEJ6C0lQ9JwDvc2en37uBpr
 Rf6WrEG0bE4DD1lDzdUeeGtV2ai6QQ+HGr+suhL4LrS29cJt8a3Zu3/+cJhLV8JpKPXT
 yyG1nVHHtm2nvLagB0BHr2L0PfRutaPwjtCNY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=gVGCqVwF
Subject: [Buildroot] [PATCH v2 1/5] utils/generate-cyclonedx: add option to
 filter host packages
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
 utils/generate-cyclonedx | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 46f68ac63d..08c591e86b 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -279,6 +279,8 @@ def main():
                         default=sys.stdout)
     parser.add_argument("--virtual", default=False, action='store_true',
                         help="This option includes virtual packages to the CycloneDX output")
+    parser.add_argument("--no-host-packages", default=False, action='store_true',
+                        help="This option excludes host packages from the CycloneDX output")
 
     args = parser.parse_args()
 
@@ -288,11 +290,12 @@ def main():
 
     show_info_dict = json.load(args.in_file)
 
-    # Remove rootfs and virtual packages if not explicitly included
+    # Remove rootfs, host (if not included) and virtual packages (if not included)
     # from the cli arguments
     filtered_show_info_dict = {k: v for k, v in show_info_dict.items()
-                               if ("rootfs" not in v["type"]) and (args.virtual or v["virtual"] is False)}
-
+                               if ("rootfs" not in v["type"]) and 
+                                  (args.virtual or v["virtual"] is False) and
+                                  (not args.no_host_packages or "host" not in v["type"])}
     cyclonedx_dict = {
         "bomFormat": "CycloneDX",
         "$schema": f"http://cyclonedx.org/schema/bom-{CYCLONEDX_VERSION}.schema.json",
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
