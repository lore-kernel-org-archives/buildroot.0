Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 680C3C6FD1D
	for <buildroot@archiver.kernel.org>; Wed, 22 Mar 2023 01:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5A2141403;
	Wed, 22 Mar 2023 01:51:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5A2141403
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mPRHClod1FTA; Wed, 22 Mar 2023 01:51:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E1674139E;
	Wed, 22 Mar 2023 01:51:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E1674139E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 602E71BF337
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 01:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47E3140320
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 01:51:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47E3140320
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TBJRl4v-AOLM for <buildroot@lists.busybox.net>;
 Wed, 22 Mar 2023 01:51:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CA62401C9
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9CA62401C9
 for <buildroot@buildroot.org>; Wed, 22 Mar 2023 01:51:50 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id t129so7832270iof.12
 for <buildroot@buildroot.org>; Tue, 21 Mar 2023 18:51:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679449909;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PKIkaT1+TRjwr6OdRl6E1ljCQtLTT1GrSVTDLy9UyDw=;
 b=sajcLe4oj0r4DsFGsdrEX9MZUlJVFJmaSbbCz4HnB5ThsVITpYNNTssIFEKVyXSbB4
 w/mZOanvZnVXBIl2jjp6d+weGfjHY344UZ0shf7glokWHISBPWLww5u3x1/4Kf/1l/93
 q0sJ/MgSGElrWHnXEa5RA/7aqS89ZnAG8JslukLaEsG1yxD+kS4dmZQJYNyQHO5pwDra
 CPgUIG5Jwdkv7NqyOUywfd68W2V9O3xz3PWAKEwHO0tj84YsGsL67WzhsoKUUqgaCq0T
 hTVnOdQ2cSJHscaXE9wkFkjXo2HFCxfSYuFmVDh91ozsN8+qYub8sRST0dYWLk1GMqfl
 sFBQ==
X-Gm-Message-State: AO0yUKWgenTaGY1UAGaRxyTXTyBR2vNWxs/+mK/HuCG8ik5PbThuU5yf
 C83iJHTi5i0YMxUpHYmrxXrlvo/kPTdq5w==
X-Google-Smtp-Source: AK7set9A5jlEh305aIpKWCPFQCHYGti5/oAMQc1neh1dbeIkCSULC4mn78ekApTk7y2FvmepWX8C9A==
X-Received: by 2002:a5e:de46:0:b0:752:ee32:322d with SMTP id
 e6-20020a5ede46000000b00752ee32322dmr3129779ioq.18.1679449909486; 
 Tue, 21 Mar 2023 18:51:49 -0700 (PDT)
Received: from james-x399.localdomain (97-118-149-35.hlrn.qwest.net.
 [97.118.149.35]) by smtp.gmail.com with ESMTPSA id
 m24-20020a6bea18000000b0074e3d8e8e13sm4162656ioc.45.2023.03.21.18.51.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 18:51:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Mar 2023 19:51:45 -0600
Message-Id: <20230322015145.88984-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679449909;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PKIkaT1+TRjwr6OdRl6E1ljCQtLTT1GrSVTDLy9UyDw=;
 b=CD1cPXBm/g615OjFrgY/dKwLjY7kC/GVFRZeDKOjFRQsJBkq7TChPm1oIZfnuZuhnv
 hV3I5J8SXHgyDwlM8qnlNHX9tpHS0/dAJBLq1IGwNcHr7loSBPwXDXjT8im0ju8WEzf8
 kPniFsEjqr9AbsMFFsAmOaCQFUXv6hsdwgncrB1hMRtEJdQTAFgQxAGeFXypRP0Ohmwa
 A3J8mEfxtFTAkuOpjJGUBLdCRcihQdgroh80Iuva66kurSBEpgZO8hkX8qmuo+howI8o
 G5QY5/0Sri1qyVMac1SLsGLcqQW8NPwGHx73aq1xODV8CqmZBCETlrZqx/P0KNEnRu1o
 GhLA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CD1cPXBm
Subject: [Buildroot] [PATCH 1/1] package/python-bleak: bump to version 0.20.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
 Marcin Niestroj <m.niestroj@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-bleak/python-bleak.hash | 4 ++--
 package/python-bleak/python-bleak.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bleak/python-bleak.hash b/package/python-bleak/python-bleak.hash
index 001ef65b65..2cd038cb68 100644
--- a/package/python-bleak/python-bleak.hash
+++ b/package/python-bleak/python-bleak.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bleak/json
-md5  d038483ec145c3d32c1ef03e04c42621  bleak-0.19.5.tar.gz
-sha256  87845a96453c58c19031c735444a7b3156800534bcd3f23ba74e119e9ae3cd88  bleak-0.19.5.tar.gz
+md5  6f9881cc85648683927ab0b9c58a1a52  bleak-0.20.0.tar.gz
+sha256  7f6fe69454ad5d4c0ab05ae4a9aa1aabd6926d7128eab2fac4ef8a58a72999ee  bleak-0.20.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c4029a2b63b3824ab68be841f414addbdde20cb79cdbe272fa80c0b2abe65374  LICENSE
diff --git a/package/python-bleak/python-bleak.mk b/package/python-bleak/python-bleak.mk
index 95ac1d1766..7d3dc2831f 100644
--- a/package/python-bleak/python-bleak.mk
+++ b/package/python-bleak/python-bleak.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BLEAK_VERSION = 0.19.5
+PYTHON_BLEAK_VERSION = 0.20.0
 PYTHON_BLEAK_SOURCE = bleak-$(PYTHON_BLEAK_VERSION).tar.gz
-PYTHON_BLEAK_SITE = https://files.pythonhosted.org/packages/e6/b4/e63829826a157d180831a1c5d3720e75d613c1290cb239510d148b906836
+PYTHON_BLEAK_SITE = https://files.pythonhosted.org/packages/aa/86/5084561ed4f31aec0322bef015db949a9f2bf0b4f6bd72b16479cf03f459
 PYTHON_BLEAK_SETUP_TYPE = setuptools
 PYTHON_BLEAK_LICENSE = MIT
 PYTHON_BLEAK_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
