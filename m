Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4856EFCE21
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 17:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EE2840654;
	Wed,  4 Mar 2026 17:51:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DNCcrmRCwCNm; Wed,  4 Mar 2026 17:51:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88CBD40661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772646717;
	bh=aOOFIW1Zx69Cd7EcppmqBzGxe0Pm+ITPNSxFGi1uUNY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=qKqPghGe1+rTWHCg1bB+kuCmL/L2MeWFRXbn2Cup69OK4s/4NrKfZ+6ATJG21SS6Z
	 15QK9qZcB1roO44+xdYMdMEt37rNMhbm3veOUVDdGDgQvBhgD9sqump6VIFGjN6vSf
	 Xx+zoPUQQ5B5o2xE77XIh52hTS8hITuAWLjOSxNhGcdIWAmCAHjxyYqzQs0VNjx0FY
	 4GTg5APbSGb7t+k72vOmsn0qPjAa6mRVD4+64SyeXLdLiAOCKc6sjGEh8jyGvx5n9c
	 Y9T1emtDyxLxEYxH3jDDw3ybJq9ppwd3C2PGersjFAbf5vM2WupS2qiqYx5z7+qmxL
	 exX8GwaM717cg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88CBD40661;
	Wed,  4 Mar 2026 17:51:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FB161EB
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 17:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85CB540689
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 17:51:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VLQ_4bnXBzYp for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 17:51:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2f; helo=mail-oa1-x2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9C75F40623
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C75F40623
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9C75F40623
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 17:51:55 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-4138136f02eso1774153fac.2
 for <buildroot@buildroot.org>; Wed, 04 Mar 2026 09:51:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772646714; x=1773251514;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cKiGjDoBefYdhpviQJ5dikqQYU7chQmGgr1jWj1OQlA=;
 b=DcGsRrLlv44YOaPfG0NFuUjTPw459JmOcDOKYBwyoZulO802Pc76fyyjC7Ha3R7thV
 x+61Ws3VwXOfehYzhiJaicLlQtBoilLSxp09u4C16P0nbNeIT/jgESg13T//+n7JK6oe
 kAQ/C/RHVcF5LzKxR82uFClwiCFHGn4OyDjJRRGgQLGG9vxCkTEDAoAddrasurYeLF5x
 CQ9qNS+v721mVINmqgNtywluFX57bjSxMPMifqFZ20ubQT/ihXJnMhyDj2BfT1/on6pB
 WNjyHIvzOaMdprXBTumZc2kca+IlpS3+aavCX2H5Wv0o9qTeWarLtIDUDE9uR+Vb4MU2
 vVOA==
X-Gm-Message-State: AOJu0YzNG4wxu41ZuAHxHKdt0UlhJG6oiIaBO04untpmUdC0Jdndqut/
 B1VWimv6kEKu+/UQO3p8CWVrZzOh+Z203gzzJuAAoBRsfuWw01Zn7zS8bOJ3Hw==
X-Gm-Gg: ATEYQzynEU1X4bEtudPh9S54by5Ei8/ulSRQ72qo2iTANrdv1RGB/tyebz6XV5ajrH8
 ZPuRSMbduj7etv1FH6+IUWUJdqQlBLoIhV8dvQeR9jfsGZaA1R69nW/rsLVelZZlVFhH2RO3o0e
 TNkAH+U3Af51rW8jhdyw5A39cakAP6HXARxRlR6VWeNtR9yArLSLuanhihuo0zwhwOvoAYO7H3U
 z4gLFSl6eBqK7m7tXte06v72Mxzy17RE2+zbZUcq5nicqDFtGbk89pPznyyEvPd/Avm/vQIZEPE
 Ye8eqlvGhpgvNfOHtcMgD/MawNUDMSWphaZt1fuwHfHsB062yP5a46QDEcG5cB0vA/W7JYANdD2
 sR4D/kZH+USK1qfbVU8ng2yjRxxTPJxHESC1XPiwQdjJAzzMzDRuG0rWm8v/01LpKm0h9uwbwpW
 HHBw7iXps8fYV4PQgkkzEjs5JzERbfYZLYI3ta599LSoCg/YuhPYulWW8qcNtX2dzpxmtKCl0no
 Y2yE7BAAqmm7e8hPJjNHPqvTOP08gsQE95+TkBbHe9gVffTT1X0WImMgyS7
X-Received: by 2002:a05:6871:ea0a:b0:409:8bfb:c7ba with SMTP id
 586e51a60fabf-416abad94fbmr1666039fac.37.1772646714142; 
 Wed, 04 Mar 2026 09:51:54 -0800 (PST)
Received: from james-x399.localdomain (71-33-158-51.hlrn.qwest.net.
 [71.33.158.51]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4160cbd405fsm19001687fac.0.2026.03.04.09.51.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 09:51:53 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  4 Mar 2026 10:51:51 -0700
Message-ID: <20260304175151.3660918-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772646714; x=1773251514; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cKiGjDoBefYdhpviQJ5dikqQYU7chQmGgr1jWj1OQlA=;
 b=l5FFchQVPe9yoNFOTf4W7SJQLQOLftjOU6brC34gHKKj3mqgNlkUCuiVnVLW0SZHog
 mc4W3sEaL8UkE8sfBE+uC2Bvm73GdPGsI1wRYUZkZT9H8qpkb73TEOvzP9b7qpVNqbGW
 YX4l/zUzpY77oNu77K3H+QelkcgOiC08Iep9ztofl3sGkXH//BmlHpKspmThGZ9Dgqup
 JWBCPlLqQpJ7hY0Zi1EroAEZwa5XaICENY5AyMrhWvBpgvVvgJjN3FEx/5P3nPQQf+VL
 Oe6eXeLnlWafRXXN9pjFfhxGK+4OCPAc4/s4s+bx0An720q8ACsu+xRoeFBHQJ+uMgGP
 oH/w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=l5FFchQV
Subject: [Buildroot] [PATCH 1/1] package/python-cryptography: bump to
 version 46.0.5
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cryptography/python-cryptography.hash | 2 +-
 package/python-cryptography/python-cryptography.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index 1ca864d995..25d987a321 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  983924b55a7bf04cca9e329ca46310602a42c0bbd0b9e77795f85c1b50691f97  python-cryptography-46.0.3-cargo4.tar.gz
+sha256  18ecafb2c1f2de6d02d1b848f0f80736f0f93e8708afaf3df3064e8722077291  python-cryptography-46.0.5-cargo4.tar.gz
 # Locally computed sha256 checksums
 sha256  3e0c7c091a948b82533ba98fd7cbb40432d6f1a9acbf85f5922d2f99a93ae6bb  LICENSE
 sha256  aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index f2da36b08a..0747394fc6 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CRYPTOGRAPHY_VERSION = 46.0.3
+PYTHON_CRYPTOGRAPHY_VERSION = 46.0.5
 PYTHON_CRYPTOGRAPHY_SOURCE_PYPI = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
-PYTHON_CRYPTOGRAPHY_SITE_PYPI = https://files.pythonhosted.org/packages/9f/33/c00162f49c0e2fe8064a62cb92b93e50c74a72bc370ab92f86112b33ff62
+PYTHON_CRYPTOGRAPHY_SITE_PYPI = https://files.pythonhosted.org/packages/60/04/ee2a9e8542e4fa2773b81771ff8349ff19cdd56b7258a0cc442639052edb
 PYTHON_CRYPTOGRAPHY_SITE = $(PYTHON_CRYPTOGRAPHY_SITE_PYPI)/$(PYTHON_CRYPTOGRAPHY_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_CRYPTOGRAPHY_SETUP_TYPE = maturin
 PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
