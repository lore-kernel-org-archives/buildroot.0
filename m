Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60753CEB2CC
	for <buildroot@archiver.kernel.org>; Sat, 15 Nov 2025 11:27:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A1036089A;
	Sat, 15 Nov 2025 11:27:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6hqM1kZpyy7R; Sat, 15 Nov 2025 11:27:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03C2560895
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03C2560895;
	Sat, 15 Nov 2025 11:27:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E28B7158
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 11:27:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C101040DDC
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 11:27:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NREVqKtyA4XZ for <buildroot@buildroot.org>;
 Sat, 15 Nov 2025 11:27:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BB5D640DC1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB5D640DC1
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BB5D640DC1
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 11:27:01 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b73875aa527so20240566b.3
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 03:27:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763206019; x=1763810819;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xGf81OtQe8cd3kIlXr0jb4hjS/o6YilIpNQf/GLqc0s=;
 b=XJFyVSuAKcHPFBdUpDHbBWpm4QCR+vs3ZGqr2Pd5b3maKn3T7uims0LbhiALCO271x
 ZjWeIUHerXIUewmAlsotHhWcKHWpiWL1/p2N/w48vAjFHDgZR6nrRJ9al0R6nturzgFI
 prQ3dEGTxoU9FQxf15AS3kmSu4MvQlAvOInGDUmiv1M4c08stpw67jKvBgnrRKEiDeZp
 FnxB/imsiYTkUKtFb3C5YGkrvM5M7hj/wGbahQ/A3GXUyi1Agi3JFxVPgn5pzftjV4vg
 w0FK7errmx1FS6rzMR9S/pQmPClxQ7FUk59DGwkvEQpxTdZuWqMlNDxGZ0wRzf3GkKH8
 +UCg==
X-Gm-Message-State: AOJu0YycGX7b7vmjKm7gDE0vxfm10OcpPLuYqMoz6GYBC33REGVEA53b
 xPto+zED8r1nwhWlr9kblApp3IK0SfrqPDyV9f5Zsm9fmRbvxYR9O/9vFP5b3CFm2/UOzFc71Y0
 PEM7p
X-Gm-Gg: ASbGnctgfz5/CXgf60ZA7GK3faNJqtM6zfH1Ip72qhlK1zq5HRrvIwQ/pg9iGoVPhpL
 fE7znNhH/fpSUcr/dhISKwtSOBfn4B7t4DSpFTnfeEY//bIPEqR3ESQNMvATtn0zKnE0l5q5HrD
 vTanham/VzmtuxGI6AszymckW28vFEO7zoets7vgGfMKN+PXZlnNahKd2GhYlhvUFp0XN4FoLeQ
 ExWQ+4DkG2iGUXg3SqyTUHroHedqx3dsJ+WY+hdBYRMRqUrHPC5OgUi2kgGjnc6G5NRHSdE9Eq0
 /tFFgq8Hmf0CZlb5/1deXPcr4lcsAkVoS/XPXShlnAQxsMUvMWWfxsEVLp3CjkvQF3zDnXdx9Ns
 ZT4rYkMVQ1++e8xfshtX4sVOrtSKJR67nvIO9BAegwRUpdbdiDirHnIj+Wfeo8mCQF1rkU4QCwY
 Hy5vVfLMS4CR4u96KJfp1JqwpS+MjylxGJm+w9+7JZFGK//kZSPnpW7wNk4H/cezvTsJGNMmYnN
 wlehJ19EawSALms62aAAe7hBqTMdKC6bPCUZvvr5BcHo9+vWCVfv3npbIqR5K1NBg==
X-Google-Smtp-Source: AGHT+IHtKBn7T57zmtVL5WBI17jLliM42mNJbLEpCntMihmF9lkF7UkBS0+Q2RwmTnUCp++R7L6C/A==
X-Received: by 2002:a17:907:e849:b0:b33:b8bc:d1da with SMTP id
 a640c23a62f3a-b73677eda54mr550736066b.1.1763206018428; 
 Sat, 15 Nov 2025 03:26:58 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-54-71-163.retail.telecomitalia.it. [79.54.71.163])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fdac667sm583655766b.58.2025.11.15.03.26.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Nov 2025 03:26:57 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat, 15 Nov 2025 12:26:54 +0100
Message-ID: <20251115112654.392564-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1763206019; x=1763810819;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xGf81OtQe8cd3kIlXr0jb4hjS/o6YilIpNQf/GLqc0s=;
 b=iadoUxI+jC+VDdSY4SQACixLXQKA6fyvAjWI/z/BfS+xuaZmyZht7Byhl+oDEis3PA
 8/s+BbGPSvhleAWagUPW4qaWVeg9iblR1wgs2bReu6c7zWi7onBgiwUxEcDTtdf+fWjF
 iTCpvLmja+zEMVbRZRxWj6eRcDudn8nyOUHE4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=iadoUxI+
Subject: [Buildroot] [PATCH 1/1] package/{aardvark-dns,
 netavark}: bump to versions 1.17.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump the versions of those two packages, that must be updated in
lock-step to minor-level compatible versions.

For release notes, see:
https://github.com/containers/aardvark-dns/releases
https://github.com/containers/netavark/releases

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/aardvark-dns/aardvark-dns.hash | 2 +-
 package/aardvark-dns/aardvark-dns.mk   | 2 +-
 package/netavark/netavark.hash         | 2 +-
 package/netavark/netavark.mk           | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/aardvark-dns/aardvark-dns.hash b/package/aardvark-dns/aardvark-dns.hash
index 9c502775a4ee..134dd34a1b03 100644
--- a/package/aardvark-dns/aardvark-dns.hash
+++ b/package/aardvark-dns/aardvark-dns.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  629df64d5d713b5b78cf8d9387de12d84b88103a8581457e60c7697cf64ad83c  aardvark-dns-v1.16.0-git4-cargo4.tar.gz
+sha256  aeb5fc77455b01916b28f7c306834446f3f6e184c02d38b177c578bb4f01939e  aardvark-dns-v1.17.0-git4-cargo4.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/aardvark-dns/aardvark-dns.mk b/package/aardvark-dns/aardvark-dns.mk
index 368e52ab393d..09a3a421f2c1 100644
--- a/package/aardvark-dns/aardvark-dns.mk
+++ b/package/aardvark-dns/aardvark-dns.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version here, also update netavark in lockstep
-AARDVARK_DNS_VERSION = v1.16.0
+AARDVARK_DNS_VERSION = v1.17.0
 AARDVARK_DNS_SITE = https://github.com/containers/aardvark-dns
 AARDVARK_DNS_SITE_METHOD = git
 
diff --git a/package/netavark/netavark.hash b/package/netavark/netavark.hash
index 8e8adc4ad3b8..79fcb2eab101 100644
--- a/package/netavark/netavark.hash
+++ b/package/netavark/netavark.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1eb17a5ed223928bdd433e0eb8518682ae71dd02981019fb726a9330d7166b2d  netavark-v1.16.1-git4-cargo4.tar.gz
+sha256  4c696e3e61b425270762f8d9d97705358de15de80e06fac7142cf65011d1dc0c  netavark-v1.17.0-git4-cargo4.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/netavark/netavark.mk b/package/netavark/netavark.mk
index 1754759bc686..d47cee0fe14b 100644
--- a/package/netavark/netavark.mk
+++ b/package/netavark/netavark.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version here, also update aardvark-dns in lockstep
-NETAVARK_VERSION = v1.16.1
+NETAVARK_VERSION = v1.17.0
 NETAVARK_SITE = https://github.com/containers/netavark
 NETAVARK_SITE_METHOD = git
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
