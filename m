Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA0EC02194
	for <buildroot@archiver.kernel.org>; Thu,  6 Feb 2025 18:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C279B6FB12;
	Thu,  6 Feb 2025 18:06:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sCgvA-XL6A2m; Thu,  6 Feb 2025 18:06:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA4666FB0B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA4666FB0B;
	Thu,  6 Feb 2025 18:06:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 968F2C5
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 18:06:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7ABCB41662
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 18:06:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hCq8pRUWbdLb for <buildroot@buildroot.org>;
 Thu,  6 Feb 2025 18:06:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B443541658
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B443541658
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B443541658
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 18:06:32 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-38db8f8786fso658011f8f.1
 for <buildroot@buildroot.org>; Thu, 06 Feb 2025 10:06:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738865190; x=1739469990;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fXzOloDcF6ZHPKKFiBxhuUaxjD8uXsGGnem4Yll+XZs=;
 b=xEvjqmPXWlR+ggiie+3ZvuKIGtdDsZNTEda4RugtSYG8s/EHLJ3IyLb7oXElipYHG9
 mmKmL+Dd2nwLxIVo3WdJjEre4Wia+0mdXx0PLnqSFU+Jo/JWRye1bfYJY3dgNydEuHxN
 IibvjrX8ZD8Ar49RSA3S74BZU3F5U3GRUh6rdy6yma9f2RzXb/KPI5kRC3/tE5J0vZk7
 7mbOC5N6aNSoUyz+/MX+jnuTTldd52cS/KhfpjjxD5hWbQCKeg380ghSVE04gY9cXRhA
 9xiKqjxYnGe/LAh8qJQkpHs6C+HJfi9ty/AD7gCbOEMPikfZFjF1Hr4nJITWSP3RqXPW
 4+5A==
X-Gm-Message-State: AOJu0YzuBzy4rFrTwBK0xEvdSxUvcIgPkuB/jkYlXeDKru1jy7iVEZsS
 iCDL/7ZJs5y/v7VJotgIFBVt5zq1kfV5yioEd4eB5gHDDNlrVXE5ZpddEs9zHGCraJ2cvuVKCXv
 UJZY=
X-Gm-Gg: ASbGncsTEV9QOMjKeW//KydJSybb0wtLKGPCsXi9vBW7LzvLPV4778NAAYuPRyrPM/V
 OvPr0jUAop/apvCM5mcZma0+D0bNW+xREsUk/y6RcPNvQPA5coCECbcs6Ukb2jr0fcwmiTjP2Kj
 r/UkotwcT6VCKMjFF6VCj1Xmq4W2dM3XsicRO8uOPfEQEeKUowRCXTpJM2DnPL1XnjkAfbfQ/ar
 HqV2Nk6+DlJ4BuaT36nEFcSdRW7c13KfuhO2wc+oB/5kqQdybLsrrBBS2pgtfXkzHhAsSfgLsya
 6FPU4ip6bS788/uP2WYCw5haP5Os1tE=
X-Google-Smtp-Source: AGHT+IEuE/8SGrmJFq1vwrwgQcYgxBT+qRarPtXkPbLI4GBriaSJ3DkGI24DlbQgEUC61N0NcIJRmg==
X-Received: by 2002:a05:6000:1883:b0:38a:88bc:a8e3 with SMTP id
 ffacd0b85a97d-38db48a006bmr6951058f8f.33.1738865189576; 
 Thu, 06 Feb 2025 10:06:29 -0800 (PST)
Received: from localhost.localdomain ([79.132.233.153])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dbde1dfaesm2342370f8f.90.2025.02.06.10.06.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 10:06:29 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu,  6 Feb 2025 19:06:12 +0100
Message-ID: <20250206180614.984105-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738865190; x=1739469990; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fXzOloDcF6ZHPKKFiBxhuUaxjD8uXsGGnem4Yll+XZs=;
 b=e3wpODAfjMuRp22LwaNehvYWizPfEszRCnDtMflsVNm8zoSa0PO/6CLbyh+cOXLWw/
 CQvkY66eOpDmU5mqWGxX/TJQBa1L76mkaqJ4mITsJFMCO8Daj5T+hSHg6GChWNsmhUMV
 PdDRixMR5R7/mLXIFu99PsWjz4ohVvLaNAxdEWgwLe8y1ElqGhpXTNsbsNGH68NBrSCQ
 4j5eHWDgzCjB1QU92bYHK8stGYGt4XMa97pZIJddbmCHBnhlDk3TC86RlB2r73l9JdVZ
 c0HORGQY9w4msQY6H1SYqKj1PxqHweo4pujKnRQIim20W7FJto0hgq0ipHdcNO9zBIW3
 6Azg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=e3wpODAf
Subject: [Buildroot] [v3,RFC,PATCH 0/2] Support CycloneDX SBOM
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Matthias Swiggers <matthias.swiggers@mind.be>,
 Thomas Perale <thomas.perale@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This series is the sequel of a patch series sent in April 2024
https://lore.kernel.org/buildroot/Zhb8vKs-ltd8ghUR@landeda/T/
from which it was agreed to parse the content of the `show-info` JSON
output with a python script instead of generating the SBOM from the makefile.

The DependencyTrack instance is still available at https://dependencytrack-lqgs7zhwmq-ew.a.run.app/
for you to test CycloneDX and see the possibility.
Login with username `buildroot` and password `buildroot`.

To generate a CycloneDX SBOM you can run the following command:

```
make show-info | utils/generate-cyclonedx.py | jq '.'
```

## Changes from v2

* show-info: removed the absolute path for the patches. Similar to the
  `staging_dir`, etc .. properties.
* Python: bug fixes
* Python: code retrieve the final of virtual package in the dependency without
  adding the virtual package to it.
* Python: In the vulnerabilities property is should be stated that it has been
  excluded by buildroot
* pkg-utils: Doesn't rely on `.applied_patches_list`, and instead returns a
  consistant list of patches. For now we will ignore the corner cases that rely
  on patching during the pre/post hooks.
* pkg-utils: Use the `pkg-patches-dir` function during the `.stamp_patched` step
  and the `<pkg>_HASH_FILE` variable in `pkg-generic.mk`.
  * This change would need special attention. The logic of the
    variable changed a bit, the previous implementation would only pick the
    hash/patch file in the version subdirectory if present if a hash/patch file
    also exist in the package directory it will also be applied.
    I don't think there is a case where where an hash file is present in
    the `<pkg>/<version/*.hash` directory as well as in `<pkg>/*.hash`
    directory. For instance the 'lua', 'openjdk-bin' package has hash files
    only in version sub-directory.

Thomas Perale (2):
  package/pkg-utils.mk: add patches to show-info json
  support/scripts/generate-cyclonedx.py: add script to generate
    CycloneDX-style SBOM

 package/pkg-utils.mk        |  20 +++
 utils/generate-cyclonedx.py | 307 ++++++++++++++++++++++++++++++++++++
 2 files changed, 327 insertions(+)
 create mode 100755 utils/generate-cyclonedx.py

-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
