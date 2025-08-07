Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D9E1C87FCA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 20:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53E09805BC;
	Thu,  7 Aug 2025 20:54:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z-ecuGQN2HZE; Thu,  7 Aug 2025 20:54:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 348968099B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 348968099B;
	Thu,  7 Aug 2025 20:54:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 275649CF
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 20:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 24663406CE
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 20:54:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FKzqNpwoUBXp for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 20:54:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 12677406CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12677406CB
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 12677406CB
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 20:54:41 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-458b49c98a7so9804495e9.1
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 13:54:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754600080; x=1755204880;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xtYJymDUEiV9fsF+on2o9UAC2HoEoe4VsT9wO+zD+nk=;
 b=H6KwRJav+JFViDpDyRwxfoVRoSAQM2RUaop3Yx7kv6h4//N2TxiebLsZUg9RyqTh8H
 64QXnpXZhRa0DxT9HPM4O8rgO6C0XVjOUFEI9mh0METkKPWOY7gYwBa+k0goGveZQK30
 H5yR4W3YudWB26QDFeqoloZyuji8gCRPOcwNAO/saetU5vY1XloUQVH5sO5O216cHRD5
 CaCmvPBYJ6FhZ249YH+ZJFrtBNZkgb0sNd3A40/87/iiy0vg80U04032Wqzq+tmv8qsj
 ct92pL3QjxYeA013a63ePNd5vQold/5g4QWgm0YlLlIDxyFKcY76k5flVuoWl0uGdTLs
 Wzcg==
X-Gm-Message-State: AOJu0YxMsH8ODKXbq/ac65JO7fiLjcyeC2u+giTVOmhPDcD0/9/DjlSM
 FoyjI6AZChQKTUqWobFf9SqP+uyPtUQH5TOHbzSpPOf+dzZskPD6xK0oi+UOCj9crbuqLBSI4VJ
 lQs5ReAg=
X-Gm-Gg: ASbGncsbg02y/sVfGHx60CqULyScQS6gdFPWD4M127vDKTBkpuAzMIzUQM+PW1sGdD9
 XyC4PbRF9X4lb0UUVVM5nsdQFN5e0f0UIqYrSZCKwPdnS/CX6GTf+iZTg+W7C5WKB6ZdC9/yIwX
 34CK8eJaYtDgThxhpDy75HHON1CR4T6q70iWvzYl1DF5nTAW1tZ7n/MtkAM0cQ0y95vqbsrF1BR
 40YCxbd4l7QYIj6vSpnMdMTeDnyKCUrihjCqFUDmg51XVld3LdmcWftS7R8XLf+BuqmcPsektd2
 WGm7Dw4mb+aNoHeNSpWDUbVNF2/g4a0PJw8JGyijzPdCjQfj4kN0/6twknYTvrbenC0srEEqlxT
 HXgJfNfR+xUf2zw==
X-Google-Smtp-Source: AGHT+IHavDjx/IaLecmKYUuPSyzIxQ+R5qBMWQPAkz7qr/91iflQkLjAogqFCS0JRw5qrKdk1vI6XQ==
X-Received: by 2002:a05:600c:45cc:b0:43c:ea1a:720a with SMTP id
 5b1f17b1804b1-459f4f2e6d7mr2906765e9.1.1754600079777; 
 Thu, 07 Aug 2025 13:54:39 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459c58ed07fsm203784605e9.22.2025.08.07.13.54.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 13:54:39 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  7 Aug 2025 22:54:39 +0200
Message-ID: <20250807205439.1104044-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754600080; x=1755204880; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xtYJymDUEiV9fsF+on2o9UAC2HoEoe4VsT9wO+zD+nk=;
 b=SwFEybUUQpH3oI88lFcr2jg50NwNmRC6301nZU6PuQAxJjjizUDoycnhJtzbJZiwHP
 sYlzydU46M0IJFE/K5yagcPOr7paUfDyjqYcTGUViJBM4Pbf8OnZXWvgBm71tblF+GqP
 91rVUfD/M1mjcCgWlZzVpYAcUjKo+45SeuHFDntP44ICuahD8E3jo8vq/y/RPWDjGyv1
 2w2jpQJVBD9tW5PYewnYFH+oY7Suf4wBXBSPnKowJS5GL55QEtmSNXDomnbkTKGLr4lW
 Gruhjp/xm2HKbBk/6FaMsSyYFaZ7PVpSPHKmVL92XUajhnPJ/LZVDxO+KOEGBc/rY5yd
 g0yg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=SwFEybUU
Subject: [Buildroot] [PATCH] package/libhtp: security bump to v0.5.51
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For more information on the release, see:
 - https://github.com/OISF/libhtp/releases/tag/0.5.51
 - https://github.com/OISF/libhtp/releases/tag/0.5.50
 - https://github.com/OISF/libhtp/compare/0.5.49...0.5.51

This fixes the following vulnerability:

- CVE-2025-53537

    LibHTP is a security-aware parser for the HTTP protocol and its
    related bits and pieces. In versions 0.5.50 and below, there is a
    traffic-induced memory leak that can starve the process of memory,
    leading to loss of visibility. To workaround this issue, set
    `suricata.yaml app-layer.protocols.http.libhtp.default-config.lzma-
    enabled` to false. This issue is fixed in version 0.5.51.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-53537
  - https://github.com/OISF/libhtp/security/advisories/GHSA-v3qq-h8mh-vph7

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libhtp/libhtp.hash | 2 +-
 package/libhtp/libhtp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libhtp/libhtp.hash b/package/libhtp/libhtp.hash
index 2e93586f7a..11105f8586 100644
--- a/package/libhtp/libhtp.hash
+++ b/package/libhtp/libhtp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  214395f8b42011154e133dfb4e94d15e4e3e3e12535e744a4c1eec8687d12c18  libhtp-0.5.49.tar.gz
+sha256  699475c2e512d5af05312e808f1f759a5d3c4cb154e73d82eaa6906ceacfaeb4  libhtp-0.5.51.tar.gz
 sha256  87c93904e5434c81622ea690c2b90097b9f162aaa92a96542649a157dbf98d15  LICENSE
diff --git a/package/libhtp/libhtp.mk b/package/libhtp/libhtp.mk
index bb6559bc92..a986a79f1d 100644
--- a/package/libhtp/libhtp.mk
+++ b/package/libhtp/libhtp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHTP_VERSION = 0.5.49
+LIBHTP_VERSION = 0.5.51
 LIBHTP_SITE = $(call github,OISF,libhtp,$(LIBHTP_VERSION))
 LIBHTP_LICENSE = BSD-3-Clause
 LIBHTP_LICENSE_FILES = LICENSE
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
