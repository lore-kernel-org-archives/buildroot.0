Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8011CC61DB2
	for <buildroot@archiver.kernel.org>; Fri, 13 Jun 2025 11:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26B23842CD;
	Fri, 13 Jun 2025 11:06:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5cxlAi_4xV_l; Fri, 13 Jun 2025 11:06:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55A51842C2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55A51842C2;
	Fri, 13 Jun 2025 11:06:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 63662183
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 11:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 55071842C8
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 11:06:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qi26dDxJz5Bo for <buildroot@buildroot.org>;
 Fri, 13 Jun 2025 11:06:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=fabien.lehoussel@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5B578842C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B578842C0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B578842C0
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 11:06:04 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-451d7b50815so16568205e9.2
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 04:06:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749812762; x=1750417562;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0rTcWMZrBSikKxIqAlX67n+xC9BJ5JJ47RNgEtACZBM=;
 b=Q7Gq/ZQgjyjLaWI2Ax36jEMYwCPO3jP6EEXWQJG3S82BdvgeFKLivJ5g7i5HGJuZMD
 4ulX52u8fLy/7bZRh61lzZKr6rVpk+OyTH5TTL8s80N1GjyPK67f651KKv61wtNSZzNW
 p0l/loHzF3SdR5S4CD81H26YcVHG3gIJwOAfLZRogRuOCUeAir5ExnIe43tHX470uT9i
 qNIMfN5c5y4P388eVaajeIbuRG/MyTXDZYLY9JCkVmPqU9kbERMnb8V1PwXl8m/eKkTk
 Xu/U3udEus9VkHTz6hA4ureX8nIRG3+ObsQYsRoHGsF9inrSru7+Ns3Wz7elVQbw3JIz
 0E6w==
X-Gm-Message-State: AOJu0Yzz8UPQn1ijXakqTpSXPzAXM66LZ1HQ9P0EzJd7Lw+fFRn/n15v
 EjoJwQ82JO2ZcMR03wKXvaoLD+Ksi8Cij4KwZQ68LyyY/ThZlry5DNZEk0XJumGiZHQYZ8te9gB
 uaWDy
X-Gm-Gg: ASbGncsVTS0uLBxiLLs76DOoEANV80MVW/Gyad4StP/RQdtHKhUGytu6Mafxr7Ivj1N
 t4pVjCjlgW51NtX2kLNA0Cv9NGIYL8vpPcCfcBSg9yw6ITFUoS9eyjhnYweQf9ZkgQ3qprhTGzP
 DnORkoXYCo6Z4/FeGkjkrrPmG9ZDYdyMS4eavPz/cFHs/5cZ3VmVfqPNsGWg580RTePBbaZK8IX
 dqIOkaPhLFNy6+CvyweShg/HoTqA2GS9uRwldQcZycyZyGQOaOkYEuhOjXC4yRkxXtth9qfpoUi
 7NNCv6Os7dpysIfdPwPM5k8r8IBnp2aUSGQubAJ1ZQr797W24DYbhyTiK3QPKHtANF1IoxK1/c0
 =
X-Google-Smtp-Source: AGHT+IHsWonLwOrIHb0P7gmueWRnOE+GRZW/w6MVV87BGVhqgQg8Qn7ZgExIIfeTgq1ljetw9JcL0A==
X-Received: by 2002:a05:600c:34ce:b0:440:54ef:dfdc with SMTP id
 5b1f17b1804b1-45334b02c0fmr25944625e9.8.1749812761963; 
 Fri, 13 Jun 2025 04:06:01 -0700 (PDT)
Received: from NV4XMB-ME-MZ.. ([2a01:e0a:943:83d0:e0a4:5913:a608:fb7f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568a7f8f9sm2060459f8f.42.2025.06.13.04.06.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 04:06:01 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Fabien Lehoussel <fabien.lehoussel@smile.fr>
Date: Fri, 13 Jun 2025 13:05:53 +0200
Message-ID: <20250613110559.2665663-1-fabien.lehoussel@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1749812762; x=1750417562; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0rTcWMZrBSikKxIqAlX67n+xC9BJ5JJ47RNgEtACZBM=;
 b=mhRQZrb13OZnn8L5JNsNa/H7Ilu0hqYslPhcrRmDYh4a4sSBSefNecVn4lrqa1gaU0
 Lho5PUXOLmebBIK3Ka6HCQCbcoTWY7zrJkYv4gyVKAotFJ+ara3l5j56zC6wHYER2PRf
 cluWgv6Sv7SbZiO4m4mY7EAbIhTBApS8nGd+M=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=mhRQZrb1
Subject: [Buildroot] [PATCH 1/7] utils/generate-cyclonedx: add option to
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

Adds a new command-line option '--no-host-packages' that allows users
to exclude host packages from the generated SBOM. This is useful when
focusing on target packages only, resulting in a more concise and
relevant software bill of materials.

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
