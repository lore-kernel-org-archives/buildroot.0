Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24093C7EE39
	for <buildroot@archiver.kernel.org>; Mon, 30 Jun 2025 07:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEAE16132E;
	Mon, 30 Jun 2025 07:24:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6HDuH-4grYQI; Mon, 30 Jun 2025 07:24:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA479610E0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA479610E0;
	Mon, 30 Jun 2025 07:24:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2AAE01C9
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 07:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1041440071
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 07:24:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R1wcowqiiD4u for <buildroot@buildroot.org>;
 Mon, 30 Jun 2025 07:24:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A447940079
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A447940079
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A447940079
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 07:24:27 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a54700a463so2415190f8f.1
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 00:24:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751268265; x=1751873065;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vHwU47TRuI8WVCxr0ONd2M2BSC6SwZqhS97cfc5ec4Y=;
 b=XV43sql1eBg9I8WxP/TXu9u/AoZnMpga0/JVa2PA0nAOXjvB6hkfGLurJipNvNvRCz
 qMzlcnQ9FH5XjtavFSzse1BcB14zBh+bJLONcBdydb78VqfyuHUGfiES6JfIC9r/adaJ
 vB8NoLj2vSnZGwvT01370gK2/loSIgQq0M/02ZesrVYyDlz6glNWQ5FTZPSKvcTMd6q3
 VEf9To1vfIykI9+WQW21Tfm4bMLtaJcSM50wAJcmrsW1rnhNOyy+mQMfwn/i9TC5THd6
 c+49pfRbTybmPT6efz7anCofo/Bu9MdGLPQ7d1pyp77+dhb2VPSXTvva/E1Nb8bmYmDu
 B5KA==
X-Gm-Message-State: AOJu0YxNsfr9dG/ufWXGwfmZUVVw4Enez2bfuKQON2QM7xPCJ1qmRylJ
 fPpPBsics28DPQW0rn+InRsafzC68eytKLTZV29fCJZxHHe0O8TqLP1JRccgC1VjeeUd/KWVYUV
 j1k1s
X-Gm-Gg: ASbGnctf6ouF085SvVnfX9GJhbI3hXPTDGs8RIOCaQp7AiOjj47PnYNO8NAhLHqYJVu
 qByfG0do1PJgGvOT5I+9RFt7GqEVmGnhcUFPdYGrzsQrPk3ES/xQJpkhzYSc7tv+CQ/xFgzjROA
 x+AreUY5n/8d6tKRLmqVWr5QEzRWVcMmnIVdwYOOpnR7LNsA7r+ToTNPBtRM30eoFjwikVjEK37
 O2yNNR9edJEsBZyCSJJ8fSvLQoFv9ABibnxTTi9Jzi3LMZHdKwBldde3qPJAep5AO6Bntho2n/w
 CUigyZjxAYf7/ylJmWRwfMH3bNLYMlyFrPtPf7Ubi8MB2E7qGXGvFSJCXGH38Mi7T7Zu1GwIFlp
 xKpOHeDFgkw==
X-Google-Smtp-Source: AGHT+IHfsUeBMxAsWHS0W3FQktdjnBdh8Wd859XRdnmwczMG8qEVHggt6BJRcqvDtKDvmVU1BOOuKA==
X-Received: by 2002:a05:6000:188e:b0:3a4:ebfc:8c7 with SMTP id
 ffacd0b85a97d-3a980296d1emr10205798f8f.8.1751268264848; 
 Mon, 30 Jun 2025 00:24:24 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a892e6280bsm9743352f8f.94.2025.06.30.00.24.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jun 2025 00:24:24 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 30 Jun 2025 09:24:23 +0200
Message-ID: <20250630072423.1126928-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751268265; x=1751873065; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vHwU47TRuI8WVCxr0ONd2M2BSC6SwZqhS97cfc5ec4Y=;
 b=fTEOybEuUzvUiXqrTIto62xAJO0CVmVhSl9ifaVfBPKUR7U7XJU2psiWm867U8WYMX
 D/JZts1AkMzOKJzUfumtdLGRC44HuHDHzISIe9JwMRDTH9Ue/v8pQVtFsZjTRicCZOV8
 JcEF6mEumY6c7kKrUzNBYcOswUFoTuCpNaQTSTa1RjWGS+2rHst+5zwtPq+7ZRtOTDFw
 ZbM/KZxXsJiJVYr5AUaB7xeyPqmdy7TyE0qO35ozbR/bLVqwaefVQYFV2vfWYiL2XurG
 KTNgUDtl+mRPu6Q6CqAHPZ7rFgCbMYUkyKP0P5yl6F5dDl9qR35BdP0KDYafE/JAqRJr
 FRkQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fTEOybEu
Subject: [Buildroot] [PATCH] package/modsecurity2: security bump to v2.9.10
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
Cc: =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issues:

- CVE 2025-47947: Versions up to and including 2.9.8 are vulnerable to
  denial of service in one special case (in stable released versions):
  when the payload's content type is application/json, and there is at
  least one rule which does a sanitiseMatchedBytes action. A patch is
  available at pull request 3389 and expected to be part of version
  2.9.9. No known workarounds are available.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-47947
  - https://github.com/owasp-modsecurity/ModSecurity/pull/3389

- CVE-2025-48866: Versions prior to 2.9.10 contain a denial of service
  vulnerability similar to GHSA-859r-vvv8-rm8r/CVE-2025-47947. The
  `sanitiseArg` (and `sanitizeArg` - this is the same action but an
  alias) is vulnerable to adding an excessive number of arguments,
  thereby leading to denial of service. Version 2.9.10 fixes the issue.
  As a workaround, avoid using rules that contain the `sanitiseArg` (or
  `sanitizeArg`) action.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-48866
  - https://github.com/owasp-modsecurity/ModSecurity/commit/3a54ccea62d3f7151bb08cb78d60c5e90b53ca2e

For more details on the version bump, see:
  - https://github.com/owasp-modsecurity/ModSecurity/releases/tag/v2.9.8
  - https://github.com/owasp-modsecurity/ModSecurity/releases/tag/v2.9.9
  - https://github.com/owasp-modsecurity/ModSecurity/releases/tag/v2.9.10

Also this patch change the _SOURCE variable that now include a 'v'
prefixing the version.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/modsecurity2/modsecurity2.hash | 2 +-
 package/modsecurity2/modsecurity2.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/modsecurity2/modsecurity2.hash b/package/modsecurity2/modsecurity2.hash
index fbb7fabb3a..cd8a96aa00 100644
--- a/package/modsecurity2/modsecurity2.hash
+++ b/package/modsecurity2/modsecurity2.hash
@@ -1,5 +1,5 @@
 # From https://github.com/owasp-modsecurity/ModSecurity/releases/download/v2.9.7/modsecurity-2.9.7.tar.gz.sha256
-sha256  2a28fcfccfef21581486f98d8d5fe0397499749b8380f60ec7bb1c08478e1839  modsecurity-2.9.7.tar.gz
+sha256  081cda52975494139922fa4b54f474fed8a6db4b7f586cb0d3aeec635f7a4d53  modsecurity-v2.9.10.tar.gz
 
 # Locally computed
 sha256  2c564f5a67e49e74c80e5a7dcacd1904e7408f1fd6a95218b38c04f012d94cb9  LICENSE
diff --git a/package/modsecurity2/modsecurity2.mk b/package/modsecurity2/modsecurity2.mk
index 36d6e1a847..b644fe7407 100644
--- a/package/modsecurity2/modsecurity2.mk
+++ b/package/modsecurity2/modsecurity2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MODSECURITY2_VERSION = 2.9.7
-MODSECURITY2_SOURCE = modsecurity-$(MODSECURITY2_VERSION).tar.gz
+MODSECURITY2_VERSION = 2.9.10
+MODSECURITY2_SOURCE = modsecurity-v$(MODSECURITY2_VERSION).tar.gz
 MODSECURITY2_SITE = https://github.com/owasp-modsecurity/ModSecurity/releases/download/v$(MODSECURITY2_VERSION)
 MODSECURITY2_LICENSE = Apache-2.0
 MODSECURITY2_LICENSE_FILES = LICENSE
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
