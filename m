Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 676F3E77199
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 20:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C2ED6089F;
	Thu,  9 Jan 2025 20:11:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JlZL3-4JKGCa; Thu,  9 Jan 2025 20:11:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28155606A7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28155606A7;
	Thu,  9 Jan 2025 20:11:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 389F1940
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 20:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 177254048F
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 20:11:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eK4xu03BG_mf for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 20:11:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12a; helo=mail-il1-x12a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E9491403B2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9491403B2
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E9491403B2
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 20:11:00 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-3a8146a8ddaso3739475ab.1
 for <buildroot@buildroot.org>; Thu, 09 Jan 2025 12:11:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736453459; x=1737058259;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6peaU/BWIzecQrqjOYCxTL8bPtMaEGNJR9FilYjvKjI=;
 b=er3PloPIUltGOgqKs/LrzO7LLVyZizJSD9FM4a/BbbdFWsiIlJk5rPQyN4OkTzj+dA
 lLCMJm9URKECavP9V5EZWHCc2Wdu/zJFHyvBWW0K4nDd73OMMPCKtTFwJOb1fKrUZiLs
 vz/QYMjk4U0mxVix1H+uvxxa/9/MopOfUgOmTCG30LAYfeNcggI4qqf7GBZO7G1YhZq4
 14MPkMx0CM+d0Y5mX1jLCFmxSlx2QrpQHOeRu0V7BmdmPGrynKfMqNW6gJxt3gwWE7nx
 voHj0acMjRPNncO35tbgjWnKH8u6zoadXarNaBhSp9QhL/jEf+m1VuXJUKSV2/xblVfs
 SWVg==
X-Gm-Message-State: AOJu0YwnZp26j7mcz+SkP+taJ5jodgNkqI3/J3GSuqlDFGjtaSnhYAkc
 hunORd/zTdUtmc+7/kpyOtzcza4wc8zRdTno5y5O8oPSfUaukdpvns4vLXA0Wps=
X-Gm-Gg: ASbGnct1ijAU5n49CqxFDwZmrEfTyrexRMoz2Qk131ZIbnoJrx2wXQkHllxkwF1kXOL
 jc+PSOlOy1ekH/xzuJqyjEFwZ5jPWr2h1fWPRFg9KkAein6GQ++jIi6pLltM1gf058eLy325biE
 G4aLjxBGBuV9Guujt0UHAOgjCyvKBapiOtCf5hFrdDkDXNiubUPlw+d0ZCWrwkC/l9VCxPBazSh
 apYaMHOsoYOh7tXpIF841JOVauxBf56513xziZrrJtmFlDTbLiyjdZyS/7TCOmGo7//cilC3QHi
 VCkfWbb8x2wDKd4ZIjx7o+dbxb+F0Io=
X-Google-Smtp-Source: AGHT+IFMKMeiDfoeBqe9LjVQgQjpPPPyfbBWzdy9SvFnSqjPMFQnLWnh4VeiTELkyfoS0leiLvuBBQ==
X-Received: by 2002:a05:6e02:2608:b0:3a7:81c6:be7e with SMTP id
 e9e14a558f8ab-3ce3a9d6203mr64557405ab.13.1736453459630; 
 Thu, 09 Jan 2025 12:10:59 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b717838sm479399173.102.2025.01.09.12.10.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 12:10:59 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  9 Jan 2025 13:10:50 -0700
Message-Id: <20250109201054.2382903-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736453459; x=1737058259; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6peaU/BWIzecQrqjOYCxTL8bPtMaEGNJR9FilYjvKjI=;
 b=Pve/omy1YwyxL3Go9WwvJP48PVHNsUFVM45vWeVernzz3l3YK14T2MrgkBT+3JpIxP
 kbfyu32K3QLmgqbGaYyMhQNhHIM2+p1gFx6YITvu0RKvSXVy6O6jCngVaW2BoXhd+YMZ
 j01pGsEIsJhS5SQ2xJ/dG5fqJLKJQ104twf5nusNkt2lAsLB6xJm8v/UGWSiurkTpyOl
 G1VWEjNd6eRFRfkpFvyNEgEhnUE9F0OeCYpQMzZfiQEFoQzICvPtNh3aGQ7IAbSvZizb
 cMgq19Z0CMuPjXolyw9MF7cPi+Ne5XXjEiow+DpXeeXU2OG8QYgq6za1LJtaztTivD0A
 WrFQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Pve/omy1
Subject: [Buildroot] [PATCH 1/5] package/python-types-psutil: new host
 package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-types-psutil/python-types-psutil.hash   |  5 +++++
 package/python-types-psutil/python-types-psutil.mk | 14 ++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 package/python-types-psutil/python-types-psutil.hash
 create mode 100644 package/python-types-psutil/python-types-psutil.mk

diff --git a/package/python-types-psutil/python-types-psutil.hash b/package/python-types-psutil/python-types-psutil.hash
new file mode 100644
index 0000000000..a1d673f2b1
--- /dev/null
+++ b/package/python-types-psutil/python-types-psutil.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/types-psutil/json
+md5  411972eff624e78ca26706d297cde546  types_psutil-6.1.0.20241221.tar.gz
+sha256  600f5a36bd5e0eb8887f0e3f3ff2cf154d90690ad8123c8a707bba4ab94d3185  types_psutil-6.1.0.20241221.tar.gz
+# Locally computed sha256 checksums
+sha256  295f8538c94ae5c3043301cf7cff1c852dab6a786a8ddee471e061b40d5ecabe  LICENSE
diff --git a/package/python-types-psutil/python-types-psutil.mk b/package/python-types-psutil/python-types-psutil.mk
new file mode 100644
index 0000000000..50ae884c85
--- /dev/null
+++ b/package/python-types-psutil/python-types-psutil.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-types-psutil
+#
+################################################################################
+
+PYTHON_TYPES_PSUTIL_VERSION = 6.1.0.20241221
+PYTHON_TYPES_PSUTIL_SOURCE = types_psutil-$(PYTHON_TYPES_PSUTIL_VERSION).tar.gz
+PYTHON_TYPES_PSUTIL_SITE = https://files.pythonhosted.org/packages/44/8c/5f82cd554cc5bb79d137f082e4c9f8d22e85c8c08dabee4971d422a9abdd
+PYTHON_TYPES_PSUTIL_SETUP_TYPE = setuptools
+PYTHON_TYPES_PSUTIL_LICENSE = Apache-2.0
+PYTHON_TYPES_PSUTIL_LICENSE_FILES = LICENSE
+
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
