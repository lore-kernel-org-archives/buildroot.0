Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 425FCFA3729
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 15:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0915B80FA6;
	Fri,  2 Jan 2026 15:08:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N3-evm11tTEU; Fri,  2 Jan 2026 15:08:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68B2181007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767366486;
	bh=HDRJWhj1sMBjbNWmMitGaZ67TEQLA5c87jPHBn65ItE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MrPdtD0P+qZKpw881UcunFtm4PqrBRXgJC5P65GodfPMcZsXrt+rL3PAWCKfn4tCZ
	 +lZiXrV5DrEFtf8Si5MigD/Gq+qM1CIVxallSEElPFWHGGKE7KmgEMXoSh0cWg+pDn
	 5YoUGYMth0KaWw3AzTW2lwvHbRl/caLnRaZ7RvuXpqtEYjgulNF7FcvA2eAW8JCwOH
	 1dmHuotbUTeK3/n0r2xxGK0CNoNPWwR2eeqCBzj2iUCwV3lkT+T5R3EvJjeZPdM+Aq
	 tK4bvmq0M2e6My73Lsht7nXOO0f+bz6n3kqMV1VeygeD/sU/TyMXi2no6jAZ1btE4l
	 ETuiDBn4KYxVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68B2181007;
	Fri,  2 Jan 2026 15:08:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B4023D7
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:08:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A95B6068C
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:08:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jz8kjVY9U1CE for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 15:08:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=fabien.lehoussel@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 519D460689
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 519D460689
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 519D460689
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:08:03 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-47755de027eso72591175e9.0
 for <buildroot@buildroot.org>; Fri, 02 Jan 2026 07:08:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767366481; x=1767971281;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XoWjd1U37qKm5aUPoKiD2904ZfHyzcfa076m0CpHSyA=;
 b=lxB+xtB2Ej8pU2agsLlaZVEqTKZgzqsmzduba64hlPe3u7i/2CZ6wPTnumHXv8hr2q
 XPTl5kreUfRMgVzNfZWCSxY1yH+paALNqB5MkA0Aqa+jJxRkI4SnTcZDjKzNxeYP9FSg
 N83uKee2NyraM8e1kdz8rYElkCMCU0O9o7eX0FKjYhZgGWKAcGce1LlEGGCBXhcJe+7g
 xV9wYTcPrZYtY0lhjzBlsznEW7e3wi9Gz1w9LtA21EdVk8P3eSOev4wZvHj5mq1/Thlw
 n4Oer8xRT/JeZgJaJhTky8ViRkJ8X5KXsLLiVHdCNhLs72ZWD6XoYa+mbmnfUI1BKlO6
 Vg1g==
X-Gm-Message-State: AOJu0Yzc+nXFMjtzSU+CSb5bD8tz0L/kPjl/12MmtCYbleX5v1uIFdUN
 aKzWTTKgKb5aUbIffjcAkFhz/rl0lFRJ8wboxp4Qq6WPGY5d04HuQKAzSsn8Uk0i6U9PBcLO3G2
 NhZ6d
X-Gm-Gg: AY/fxX4DS3efi7xt9LL0fGnR+CdtSlwzBkQ8NehAzJ9E1CvK4YkhTgXUSaW3k85L/5L
 70qFgTqIge09QncEhpOEzZKPUXfUHJGap4mkBfZsSihPayZe5L4Frj6lend5zUUqovX9WtAKWSn
 MA2W3+xnRaZgQDb4IKvPJICrDFxqD7G1S/KprHdaScC2zN2U6QRaeC1daLg3ChbxCSx/k7R4K8n
 ocD3CjEWKJKAGDhzycj2BnjFS9Ag2DHYlIZmmghfxKIGur8SaTtoram05OKiu0VgWEYsCrTrhMU
 /KWnSXmDa1eu8xM5xJCpLQk/URvHAqflkQvytSZkpHtCi0mk7HwA3mSdVwGPzwSUnxtNW4Ycnyi
 yIGBVacSSG4aCmobhQIVPo+guaQRlG6Wf01+AqVrvYUxQy0SkODYesGGWLWCtkqbYPEelT5CFlO
 eRRqYtnV8hn1mFmu8/6oA/8h976HYABIrzU1ytDL1nk7Pg4Zyxldi6oEvf/YHFe6gyJ0VFvuW4d
 i0BXBpRgVL/UI9tCU0d9L2ek0qM
X-Google-Smtp-Source: AGHT+IHLEs8VBA4i9XOGiU+eGMKZMOSHWN+PXmA+mryYHFXs8RVPz2g0YwVEQjus7vSrnHQMY8xkgg==
X-Received: by 2002:a05:6000:420c:b0:430:f5ed:83f3 with SMTP id
 ffacd0b85a97d-4324e4c7284mr48207092f8f.9.1767366481098; 
 Fri, 02 Jan 2026 07:08:01 -0800 (PST)
Received: from FRSMI25-GRAVITY.idf.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eab2721sm84629079f8f.39.2026.01.02.07.08.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 07:08:00 -0800 (PST)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Fabien Lehoussel <fabien.lehoussel@smile.fr>
Date: Fri,  2 Jan 2026 16:07:54 +0100
Message-ID: <20260102150757.1480511-2-fabien.lehoussel@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260102150757.1480511-1-fabien.lehoussel@smile.fr>
References: <20260102150757.1480511-1-fabien.lehoussel@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1767366481; x=1767971281; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XoWjd1U37qKm5aUPoKiD2904ZfHyzcfa076m0CpHSyA=;
 b=ur4HQRmLrNikzp4kFeS64v8VMS/iR6OBpOfvo+ibzqHSQSB+Xfw6iGG9Ju8iypVH2e
 zzD6czKY0I8jGP8cOffRqehpeKxbgbHcGg1Zsea5ngCloUoX3Pm2GYmNiJNwVtPhioTP
 O4MokcnaIuDdwLbvUW96zqQ+mSiv78YNZdoEA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=ur4HQRmL
Subject: [Buildroot] [PATCH 2/5] utils/generate-cyclonedx: add diff
 reporting for package filtering
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

- Adds new function to compare original vs. filtered package dictionaries
- Lists removed packages
- Introduces --print-info flag for verbose output

Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
---
 utils/generate-cyclonedx | 43 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 29c73f3616..5de6afa39a 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -362,6 +362,43 @@ def br2_parse_deps_recursively(ref, show_info_dict, deps=[]):
 
     return deps
 
+def print_dict_diff(original_dict, filtered_dict, verbose=True):
+    """
+    Displays the differences between two dictionaries.
+    Shows only the keys (package names) that are present in the original
+    but missing from the filtered one.
+
+    Args:
+        original_dict: Original dictionary
+        filtered_dict: Filtered dictionary
+        verbose (bool): If True, prints the difference. Default is True.
+    """
+    if not verbose:
+        return
+
+    print(f"\n{'='*60}")
+    print(f"Difference between original and filtered dictionary")
+    print(f"{'='*60}")
+
+    # Removed packages (present in original, absent in filtered)
+    removed_packages = set(original_dict.keys()) - set(filtered_dict.keys())
+
+    # Kept packages
+    kept_packages = set(original_dict.keys()) & set(filtered_dict.keys())
+
+    print(f"Statistics:")
+    print(f"  - Total original: {len(original_dict)} packages")
+    print(f"  - Kept: {len(kept_packages)} packages")
+    print(f"  - Removed: {len(removed_packages)} packages")
+
+    if removed_packages:
+        print(f"\nRemoved packages ({len(removed_packages)}):")
+        for pkg in sorted(removed_packages):
+            print(f"  - {pkg}")
+    else:
+        print(f"\nNo packages removed")
+
+    print(f"{'='*60}")
 
 def main():
     parser = argparse.ArgumentParser(
@@ -377,7 +414,8 @@ def main():
                         help="Specify the project name to use in the SBOM metadata (default:'buildroot')")
     parser.add_argument("--project-version", type=str, default=f"{BR2_VERSION_FULL}",
                         help="Specify the project version to use in the SBOM metadata (default: builroot version)")
-
+    parser.add_argument("--print-info", default=False, action='store_true',
+                        help="Print dictionary analysis output")
     args = parser.parse_args()
 
     if args.in_file is None:
@@ -391,6 +429,9 @@ def main():
     filtered_show_info_dict = {k: v for k, v in show_info_dict.items()
                                 if (len(v.get('downloads', [])) > 0)}
 
+    # Show differences between original and filtered dictionary
+    print_dict_diff(show_info_dict, filtered_show_info_dict, verbose=args.print_info)
+
     cyclonedx_dict = {
         "bomFormat": "CycloneDX",
         "$schema": f"http://cyclonedx.org/schema/bom-{CYCLONEDX_VERSION}.schema.json",
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
