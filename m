Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB172C43458
	for <buildroot@archiver.kernel.org>; Mon,  6 Jul 2026 14:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8472060737;
	Mon,  6 Jul 2026 14:23:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8sJgs6_PcK_v; Mon,  6 Jul 2026 14:23:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4213607E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783347800;
	bh=1XvdVtrGNHZG89sH2FUFG9j56KoeMv/1yvRUHIjPU0E=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=ZaMv8HB7TB2QwCIc/eHgZYP+KfL+WbnFtYrDd9scMO1YPZDjoUVSGEqDFy2Lp8nHe
	 1XiG9P0wX3jdLWVhlPTHo0PZrdNol5MTFUt9PDhh9sb/QTyyGsePkEi6kuc16BfmAJ
	 GO2yL9hFZL/C7rZQv6vab9cXp7z7ApWdvYsfNZmJ/Vdy0JDTkIgDYOBQlaPurHHOvq
	 G+RziCbPmDr/ICWMXnCoDyR34uZ1V9WjW/ZoXOe7r56YNE3Pk6jdUCXE7A7MyJK7LS
	 ojl8lv2fBl7knBwLCHkohScSWFZSKGfYD4ZKRzMlBKWrg5EEEmuhRejFphxN61oZjV
	 VjYpisMEDPOJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4213607E3;
	Mon,  6 Jul 2026 14:23:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 89B80F2
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 14:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 760D0400B9
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 14:23:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZmI4cm5KF1qf for <buildroot@buildroot.org>;
 Mon,  6 Jul 2026 14:23:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7036E4003A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7036E4003A
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7036E4003A
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 14:23:17 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-4703bc0a99aso1695074f8f.3
 for <buildroot@buildroot.org>; Mon, 06 Jul 2026 07:23:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783347795; x=1783952595;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mXYL1R/YUY+AxB5KY/8JG9W2qw7zj9C2poXnr2b67Qc=;
 b=SJxArclrtdUAmjuok/LEm+aPHPypm+G0PZZtI6pRRmBkpJn+wsvszpjWRJZ1t8FK2d
 N1m+LqyhrPUTp7PGI5dp+E5xHlyeEXDeBvx/7vp6H/P0MC9PcEYvEgMMxea1beTmDXHP
 jkbBX+GW0FKQtKUu7j0/MZqsfXFJvhLELejm65FRNUwbHk5nIdV7RC1lLXF9OTLt7nAK
 2TlqXXSy8rddDmukgFoXl1SY96f9vP67M8LGg7khjk5poDgWSyqucJArOmIoYvMpMNcY
 Dm6mJE5h018CfWpRl6ppODlq87ncKWQpFRPC60PWHqtXO2k2pDFtqianeqy2ZHMTyM90
 0Xlw==
X-Gm-Message-State: AOJu0YzJ2MM0F4ILb6E0VRGkiweWsUlBYqLoFNPMq25+MoMBMRHtuDPL
 sCQH47qOAtEfcqhZr3wSb4RvW+Yi1/bKQkj9UeVK89BkNRT8dugTvAChnmPYpYt4p/0qcG1yciP
 bu74k
X-Gm-Gg: AfdE7ckM1Gyq4XNLEsQs5pP4w6SM7UlChrFZ3MAd52RePDbehyKdPhEZjM8bzuNsESK
 iPmO6bkfjP0ZJCNKpODD0lqwXMaeRSqfzz8DX0nljhWT2iYW+OWlm7eIz2OLrgkln+euwr26i8K
 2LoAqFwlABciJdJYJ02k1q20LkzrOQkJoIjTcm/XJxyACFjiDZVEVK99qniMcBfszF2eFBGC/sc
 KMtXcLZHVwiDXo+VCoCl2pV3zzZng6m/yFY3UwV3RtAXfn9ZZ8FeL/H+MlLv7+DgX0NB+dnliSV
 4ty4qo90w73k+NkhOsvc0uXTxjHgk3jX1aqjVfr1yWBZimLmjTcDSvcllnhic7Vcs4ahV6rs7a3
 oJG4C8ZeBI+5ApiedGJfZIkqrKzy58K8Y3Z3hRNwCvlszlfuFhn5ZTdLXvLLPmHJ1PApo8Aa9A1
 eh8oAHWEgTILEQIjOiNUjHT6MuRA==
X-Received: by 2002:a05:6000:d4b:b0:473:6e8d:7f8 with SMTP id
 ffacd0b85a97d-47de667616cmr529507f8f.14.1783347794903; 
 Mon, 06 Jul 2026 07:23:14 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa0f213e8sm22106252f8f.34.2026.07.06.07.23.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 07:23:14 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
	thomas.perale@mind.be
Date: Mon,  6 Jul 2026 16:23:04 +0200
Message-ID: <20260706142304.431254-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783347795; x=1783952595; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mXYL1R/YUY+AxB5KY/8JG9W2qw7zj9C2poXnr2b67Qc=;
 b=RbMTBF3r2bV/i9FglRA//rABrsqqD8a35LOOVBvLImsRBWCcIntR8rJDvqZ38wzEBp
 c2sf56tazUN1vRw+VDCjM9bSvJnZCzrxpinvAhxqK4xLjyI12Akd369KS44qwrrGwA4b
 EIMGek14O0y2M+2cKVZZBzBWpKdAfXqe5uRcfcrKRn9TCXAIs6wS1ZkFAC+g97s1ad6n
 vShBtJz2YGGSmn75K/aqYqeMk+/qd7mAjRiotIdytlI+i0tygF7nFHeII/N2YbEiTJ3b
 DEXbFMDdEDqpTk1L1vGlbSKOcoPdLhd8HpYebN3x5OPrnY4VRXeW9j9pVpjPE5ReQPP4
 uklg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=RbMTBF3r
Subject: [Buildroot] [PATCH for 2025.02.x] package/openvpn: security bump to
 v2.6.21
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See the release notes:
https://github.com/OpenVPN/openvpn/blob/v2.6.21/Changes.rst

This fixes the following vulnerabilities:
- CVE-2026-13117
- CVE-2026-13698
- CVE-2026-12996
- CVE-2026-13122
- CVE-2026-12932
- CVE-2026-11771

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index 957537dde6..2c90b87974 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256  952ecee5b911a5353c0a6d40af62a7076c6dea1481ef204ce6d3f10481531315  openvpn-2.6.20.tar.gz
+sha256  24cb6185e544a47323d6798b03d39f2367d96f227bee9cd1543e8ed528319b17  openvpn-2.6.21.tar.gz
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index a117f6ee8c..9ece4df3d8 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.6.20
+OPENVPN_VERSION = 2.6.21
 OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf libcap-ng
 OPENVPN_LICENSE = GPL-2.0
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
