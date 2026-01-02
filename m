Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B6FFA3751
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 15:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFC25810DC;
	Fri,  2 Jan 2026 15:08:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IY_4Mh2kOTvS; Fri,  2 Jan 2026 15:08:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB50881089
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767366491;
	bh=WJYxc6shM9TDc+2IGkPm8VxDYXRTUxzI9EJmzDqooeg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JD15RjgGl8bkZ6A4+fidiboGYEXGUijELe/KmLK+EOUkVvvv9UeJd060lS2qx8VYV
	 MZG+mqTLPen7G4dB2mMb0zajSSpSzEqFGpKofND6Qi/R9XOyig8AglAXTyRuDZsxAi
	 yvRZHHiu7BLcaUuqe06Wg8ETryvFd5YZK35fDI1MtSUKuCj5SNEIt6hFW9sa9A4Riw
	 f5yOivW7Pf4RSwcS3uYqXTg8U1tQ2OnCiqiQQOxGmikf4FwKnMn/Obst5xvpah48iS
	 M1/jFujeji50+MD6KUfZrlDpJj+8zY3yWw4VlJV+/P2zTd3RKRnGztTqdTl25Mb8jm
	 zpYjvR7HRmzBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB50881089;
	Fri,  2 Jan 2026 15:08:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 26169D7
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:08:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C53681007
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:08:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BtiBatiN67Jt for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 15:08:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=fabien.lehoussel@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F28C480F95
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F28C480F95
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F28C480F95
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:08:04 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-42e2e3c0dccso7325243f8f.2
 for <buildroot@buildroot.org>; Fri, 02 Jan 2026 07:08:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767366483; x=1767971283;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9pxSVRIce+YAgBjivrV1U8VRHNifq6fx8zAECrfvXS0=;
 b=hS9XUrV/WEtnafl+hkHX2jNZACad1uL6lwowt7QlGlnJS7qxwmnggWWJy9zP2smlJI
 HerHhyn+cc5hWLYxCzNoN6IFA4BgCITKT22rgzHRu6uTeFVjqkRXCS+YcEYyO3iAjqR1
 XoOsbffBy0ttX2GezJO+D0HOiXPGYwQC/jyoT4O+tL7kl9B/Ob5ZEDDs3XaOdzMbIzhv
 vOtpOwB4MItCfXAprYKZCc/pDld77BD46ygjczXMx9QYTPMPca4yjMU+2iSAe9dWqO65
 1st7U23/NFVw8RTh9eTXSlBmcAaOv047n3W2wLU0JxeTjrdv0GkBya/tR3UV7eWvdNuh
 2bUg==
X-Gm-Message-State: AOJu0YyTHh/e/EtDc80+Ljiq5X2WDFUbG57lN/hWuWBz5/Zg8UpKrSLN
 ZS+5MOq8qncEyvfmDnWrvNbjpIjuv/DaP1PvE+LFGjwS5Mbx1RQwydWdGV5eiudLaIJLWghqlvb
 nUtmQ
X-Gm-Gg: AY/fxX4XFDiyXqnmJ/6nETHrq4bQ1nQdno8L5APbSMZy2F1KvFpReJLbi6MXzJ+5Z+2
 6R40epRnMOt0/q0pH0CB7Yg6ZW0QJqWKI5u0v8yEb4l0t3NFFPON9/yzngBkQe5HKABTOCyV1Eh
 gTV87eAxJ3aai6W2pc0sXRPjpJU3eQ07Ta7TjnS4fziQnQAsx4Gn0UB5pfSYeJxddoCLheuArah
 RYeovaBzrJ+WQYVdfobaF4XZls5MeuwS/4CYy3MqRNX8rQQaMF02OQKjkmy8ds9g/YFZNlBYN8m
 +592HImLJaarYdFXg08wYOIbq9rtZHEWX22HqvOTTfu8XHW1NnCyiIlxn1hAEx5yJguEGTT66o9
 fE4IyijChMTRRY4XRo9roxn6NCPTf231Q9pOZbHYE8Q+TJzYKxiwsR6oA18Kazpsp7gGbgkmsya
 CawLBbpgMfYiEYWWUdz9RLjsh+qgDgsoCe3Bzb47z4snX3FZT5lRaEhUFkxSEq+0kBx7LgTbxsG
 V9JNPN2c/D6MivdSzVhbstdFq7a
X-Google-Smtp-Source: AGHT+IFJ66LXAGuJyXTk319M6Vr+CCa2XIJ93zG+xQVNlJ61qO6EtDaV66JCzKIJn3zsk2+Ecv3G2g==
X-Received: by 2002:a05:6000:3109:b0:430:f494:6a9c with SMTP id
 ffacd0b85a97d-4324e4cd1b9mr45021451f8f.17.1767366482740; 
 Fri, 02 Jan 2026 07:08:02 -0800 (PST)
Received: from FRSMI25-GRAVITY.idf.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eab2721sm84629079f8f.39.2026.01.02.07.08.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 07:08:02 -0800 (PST)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Fabien Lehoussel <fabien.lehoussel@smile.fr>
Date: Fri,  2 Jan 2026 16:07:57 +0100
Message-ID: <20260102150757.1480511-5-fabien.lehoussel@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260102150757.1480511-1-fabien.lehoussel@smile.fr>
References: <20260102150757.1480511-1-fabien.lehoussel@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1767366483; x=1767971283; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9pxSVRIce+YAgBjivrV1U8VRHNifq6fx8zAECrfvXS0=;
 b=uqyGeOWY7C/oPmfp2nz12gdXsS8XZibUobBTBiavS3cB+PFdU5DO0KFk5eQdL+fUuk
 v6r9zcHMN+w5T0U/IW7Hyb+PzV4FnXMSWJiiLQZ3ijCRPV38mBHrJpqoFw4Wm8XwKul3
 RIGSZFiuIVK1wtcSwJpHeoPJ9wbsrzdC9fCk8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=uqyGeOWY
Subject: [Buildroot] [PATCH 5/5] utils/generate-cyclonedx: add option to
 identify packages without CPE
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

This option enables users to explicitly list components within the generated
SBOM that do not have an associated Common Platform Enumeration (CPE) identifier.
Needs --print-info flag for verbose output

Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
---
 utils/generate-cyclonedx | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index e47b6f2f6e..64620ee170 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -400,6 +400,38 @@ def print_dict_diff(original_dict, filtered_dict, verbose=True):
 
     print(f"{'='*60}")
 
+
+def print_cpe_analysis(dictionary, verbose=True):
+    """Analyze CPE identifiers in the packages.
+
+    Args:
+        dictionary (dict): Dictionary of packages
+        verbose (bool): If True, prints the analysis. Default is True.
+    """
+    if not verbose:
+        return
+
+    packages_without_cpe = {pkg: dictionary[pkg] for pkg in dictionary.keys()
+                            if 'cpe-id' not in dictionary[pkg]}
+
+    print(f"\n{'='*60}")
+    print(f"CPE Analysis")
+    print(f"{'='*60}")
+    print(f"Statistics:")
+    print(f"  - Total packages: {len(dictionary)}")
+    print(f"  - With CPE: {len(dictionary) - len(packages_without_cpe)}")
+    print(f"  - Without CPE: {len(packages_without_cpe)}")
+    
+    if packages_without_cpe:
+        print(f"\nPackages without CPE identifier ({len(packages_without_cpe)}):")
+        for pkg in sorted(packages_without_cpe.keys()):
+            pkg_info = packages_without_cpe[pkg]
+            print(f"  - {pkg} ({pkg_info.get('version', 'unknown')})")
+    else:
+        print(f"\nAll packages have CPE identifiers")
+
+    print(f"{'='*60}\n")
+
 def main():
     parser = argparse.ArgumentParser(
             description='''Create a CycloneDX SBoM for the Buildroot configuration.
@@ -435,6 +467,9 @@ def main():
     # Show differences between original and filtered dictionary
     print_dict_diff(show_info_dict, filtered_show_info_dict, verbose=args.print_info)
 
+    # Analyze CPE coverage
+    print_cpe_analysis(filtered_show_info_dict, verbose=args.print_info)
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
