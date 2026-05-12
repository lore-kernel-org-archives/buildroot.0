Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 985BACD4F24
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 14:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68BB160DC9;
	Tue, 12 May 2026 14:53:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2hHWmRSbJruW; Tue, 12 May 2026 14:53:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C3D060DBD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778597595;
	bh=qa2RRD9a7knVzSPCLpXiefRRDj49pUeXcG6Y219SHe0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JjPSf1yV6BeufJEije3hUqv+xGo7sHVwc8nbppn13BS61IDf/9IzOdDTtohnnWUII
	 g4u9US9K2RzoYqh+ysdb0c2IOtXto1Cv52VC/jwU2+pwcZ+y5YN/nZ9MLUnj+HVFtR
	 C59yFlLVFMFPglxFr/M7sFbomaT4hiHbgVrW86VNcnpF4FVpRvub3UE19MTPZQHWet
	 wbh2WRRStaGYvplSBXuB0PDSUx6XkcUpLqqtUx1j2Y9BktSz+Rm6WKMVSED/foeA6/
	 vbp0LDCubwbHMc/TlReLwe4T++ocDtlBINYilIRKeIUIpRUYUv3mV+xOnHL2D8V/9Y
	 /6N/hGjG7KyWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C3D060DBD;
	Tue, 12 May 2026 14:53:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 47A6515F
 for <buildroot@buildroot.org>; Tue, 12 May 2026 14:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D6FA4065A
 for <buildroot@buildroot.org>; Tue, 12 May 2026 14:53:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rKhK-E9mb0IG for <buildroot@buildroot.org>;
 Tue, 12 May 2026 14:53:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 269BC40137
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 269BC40137
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 269BC40137
 for <buildroot@buildroot.org>; Tue, 12 May 2026 14:53:13 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b10b.dip0.t-ipconnect.de [84.161.177.11])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E51E1A4C09B1;
 Tue, 12 May 2026 16:52:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45106)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wMoSj-000000004ON-2Lsd;
 Tue, 12 May 2026 14:51:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Antoine Tenart <atenart@kernel.org>,
 Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 12 May 2026 16:51:56 +0200
Message-ID: <20260512145156.320992-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260512145156.320992-1-bernd@kuhls.net>
References: <20260512145156.320992-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778597521;
 bh=xAFviBz38BTlyjz5gC4hrRR6hxPVdmGmVKKf1HW2ynQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=SW2OooQ1Kzvpn2DCyb3O2vxtDf495j/f1Y4tbtGStqwFczdOs3mgu/NXFkMHLwXjJ
 i0oxLWmAY+eok5VgAUYLvscGy/DJmyVoSy+Un5DBDDvSCkpzyP3houlKdebrToK2br
 Rk6fzya0ws/zpihWdZFS+N9Qg6prY7rB8QrTv8rVstihsrXHYVKt7961w3VD37kV0Z
 oD1ZvlhbE1lBHgvrvjOtjsfHzlaeH1CydiqEzKnWVVNcYtK7xeTo/5yKHFZsgrWoMs
 Egg4dI+g0+UcrzCdQW3q8P9l6BnfiH43BzK3j3f5yUOwhYlmtAUFiW8zA6OldAtlAZ
 xrr199exoiRGg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=SW2OooQ1
Subject: [Buildroot] [PATCH/next 8/8] package/semodule-utils: bump version
 to 3.10
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

https://github.com/SELinuxProject/selinux/releases/tag/3.10

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/semodule-utils/semodule-utils.hash | 2 +-
 package/semodule-utils/semodule-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/semodule-utils/semodule-utils.hash b/package/semodule-utils/semodule-utils.hash
index 65d34a0fce..feab08433a 100644
--- a/package/semodule-utils/semodule-utils.hash
+++ b/package/semodule-utils/semodule-utils.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  729be36e4726c5d0833732681a94b2e0e4aff973c076504e41f8547abb6c5424  semodule-utils-3.9.tar.gz
+sha256  1c2f14cc098cbb4d75912d131c5f747e70246e1042e72f2ab40e28f53cf45c10  semodule-utils-3.10.tar.gz
 
 # Hash for license file
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/semodule-utils/semodule-utils.mk b/package/semodule-utils/semodule-utils.mk
index 75955845df..d1fe15e806 100644
--- a/package/semodule-utils/semodule-utils.mk
+++ b/package/semodule-utils/semodule-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SEMODULE_UTILS_VERSION = 3.9
+SEMODULE_UTILS_VERSION = 3.10
 SEMODULE_UTILS_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(SEMODULE_UTILS_VERSION)
 SEMODULE_UTILS_LICENSE = GPL-2.0
 SEMODULE_UTILS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
