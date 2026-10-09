Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01D1CA6012
	for <buildroot@archiver.kernel.org>; Fri,  9 Oct 2026 07:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6460E4091C;
	Fri,  9 Oct 2026 07:49:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iv-RrWVj_m5G; Fri,  9 Oct 2026 07:49:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7D4174091E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791532185;
	b=OLSJyRhNOj6g+4iT7NQUotI2kKLtzmsUKmZYHW6PLUOVv/5Ty+kNQg76l5aGFTADQQlo
	 4nZoLAdHD0p0f0u1Ntw9dyMuunAGP+X0tDTE4MuBSpXaHN0COceoThm8jrS3plC3Oo5Zz
	 eoBXgHhOwgztNBHpWbZ9Qg/XAQZy9UEO9zGnwLwiH9c/uz4qnBJRvbLZTE8MR3c2Rb3no
	 iy5Pha6M9v83AAHp0mDufFGT46JcwsJPGPPxeM5+ufQpBDDu8LIQwBb9pvXFacv5yPp//
	 auLo9SHTB2GsjpyY6Hi1TsCHdNKheg5ItUjut4H3XqVT+DgYU0IZXp8JxFhj12WtJTw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791532185;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=+CShjkJOQsONe+3ym8oBqP5w/QNhyJ0o76Hzzj7N3kw=;
	b=IyhrR7Y6JvRJomiCWdZAkGDmK4OMJ5hbd3P515slT3TqvOFy5hIPeiPYoVGyR8k8MpZX
	 nQ1UXfZjb+kQgb3hmWtKfaKU2jFOscN3ZNrdtYPfr64cpxFHggDgDeUml1JshRjiLfwsv
	 cCTn3ig/w5a3bjaAex+7v6R860N+VbVmksyPlbXnqBtJCGRj1zeUAfe4nqAF4giO0Df1n
	 3hboB1D0AXmLbQW3Tt1ROuMiPcSQqfGuDg6yP1JNCbv2DT6N2udM3iYd2fr0H3PMxu592
	 4LI7l6qbFw4tqsl41QhK8+TIrQBvJ+ph0NTYJ5ucRrtvnOWp3qywVKe0qM0Y/kPiVWg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="BHg/I2mo";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791532185;
	bh=+CShjkJOQsONe+3ym8oBqP5w/QNhyJ0o76Hzzj7N3kw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QYAjcqZEueSZ0I3bYv2qKye+2k/+j5vXc3YP37RL3sfd5apGNIQPiRFULlmFXk9z9
	 cG1H8fg78lGUaMLBGQPD7APGDdyDqYgQCHoOq3QVGnOSz0BbDBR2soc6PQF9MhF9VA
	 MEeSo5UrJF4FuyVH0pah7PCxVSLD+imW6Jnuxk+gkde9yNCYOkUx/KaecbG5LDsjQq
	 mGwFXoc6gbGCwAGCU+nSule+cLFU21Op6RNpxAJMDEdImgDeH5FVeln4j/sgaysC7y
	 8miWBQeqaa/Pz7EtsGyKXv21jxcNbwb0pLjzk6Y9zDGPIQsecS9mk5fpkL6GlgKBqt
	 /NnhFyHNbycGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D4174091E;
	Fri,  9 Oct 2026 07:49:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 81DA7356
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 07:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 678044091E
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 07:49:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xsF9CoRkKLE0 for <buildroot@buildroot.org>;
 Fri,  9 Oct 2026 07:49:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4C8664091C
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::62e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791532183;
 b=Mr95CjyAeDtfjartI3p4OvTolZgct+zkt5rDoH5e4lrJzdj5CwMWsUAloiJ0NkRsOmJi
 n6lZkM9OIKK+W37/zACQJH3vAIa+/hwCILobjz6d2XNj5o/30j0vlm02/OOqjmsYHdFjQ
 yClDsm6owHYremgjN9Yxdj+apVaU7jC0z8aodg562l/RYKwIMu4GVO7uUBok2UP+k255+
 OGLSWerE2Dhm93w3NZlFvjdxttfkSVAnDfotpmGWFZD/Us8XAMCameEOXmpelM8e9yd63
 5crh8yK+DgaGVQooNmtQnq6FaG9CFaoyZ6WZpwu3ZIOcq4ujYStuoTxK/PbaEtAjLUw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791532183;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=DPlOmYkbrSlvURodJWxdqnXv7aP+tv57t/frDn1VWp8=;
 b=Wzy6Ft5wMPLV0Sakt1Ley6tty1eA+JmnMwgbC1/VNOXrq9S4eG8C9lTukuvZ22wKzghE
 h81nT5HKq3gtZpY26ZbUxiqZOui/s4bWX+P84S0ivCZZH5LuRCHltP+BAbA+sR5FXcM0G
 u/pAtpN5RdTb7068OXlUwAVeTOVP0PS/9nCEPVOPqLiBwJ8T2v8qkqpFuiYqLwGGYTn/D
 hC7sKThmCVvDZJmGJvZbvAKjG/pHHOFQnAjZZEqZx7WYEE9d17TkUdHarDVQ0K/zwwdV5
 gWKOhZLBOrufMAgADElq/egZLjaTrtoLU3ZIc1IKoKgIChZghMUte8GEzb5CXkltnvw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="BHg/I2mo"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::62e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=mr.zoltan.gyarmati@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=BHg/I2mo
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4C8664091C
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 07:49:43 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-c2e5e801487so614384166b.3
 for <buildroot@buildroot.org>; Fri, 09 Oct 2026 00:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791532181; x=1792136981; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=DPlOmYkbrSlvURodJWxdqnXv7aP+tv57t/frDn1VWp8=;
 b=BHg/I2mowP+gOCSY4Uk3eSLYDHIH5Q0Yqw9Cp/spV5am9lM7ZQq1Wcxr0VcMfL7lXH
 ZVf1A5PlIGLLbrq+xOFvRyzoPNe3ahPYnHRMQoK3Cn7rHyVypfbdoHsSMrD9VU63RZ7Y
 wGDNYX6Tn7KigX+XN11T5X+YQqqPUkrUz3Twx7MBXb3Srm57VGyTKO9KasToDWE2Dsy6
 izeu2QmhRI4A8mCUjf4g7WMM6GL+A0jFlZ9HPP95JdyZ+SVOQ49NS+/kbwbuSjelmEK2
 MffpS/zYRFHO5kctwLy+C7Xjj5KVfWnXW0NBACTb8OyK2SXoimYOhjSfdxKmmQDlZjzB
 SBZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791532181; x=1792136981;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=DPlOmYkbrSlvURodJWxdqnXv7aP+tv57t/frDn1VWp8=;
 b=NQWDKnz7KBxUoTcyV9uvj+tszn9IVWftmdzcHxcHdWPSbpHfPV/+qRv3d891CQHL99
 DXSDpGfL0wNPc/YAktl+PCrsWGNILwSPOYrhibdPitxNfEP+qWkTsccdtXaZkABOlsBk
 FrMiPcj8j3diZlKqD2Ue1U/Qal/KR/3JBF4riMfzcfwwgpXQNXKqr2tvlDj67J2/YPSk
 AxinshdZUEkEt1MWJcNE1JqPCmaED1RMc2Bb/esiycc+W0YaBlXFnkLzQXb4Q1wOkrrg
 mATAcWiBQV9Nr+gNq64krNvPaOzxLdv3UcB7HqVB2Wad7K6jgazYRw+xYQYBBuI773yn
 GMWw==
X-Gm-Message-State: AFq9FYJYm6nbs7iIKPvZ0Y2O1ckfjkMr3qz+yKKZNl+aCJLQPUxOCjA6
 H7EYnwQuQdVs1IVOAx4/32FkSrbGgFvvLsPRTRiXc09/Sp+pdbXd0YqpawFfTw==
X-Gm-Gg: AYBFou1QSHOfbcviR/5e7bDKadIjb4JCJcaxOK7326tnTzlfFGP4Tuli52t9rpH3bzc
 sfAJpIJI4bjOrOhotIvKf6EWa5udTCQApMto1+zA06GTBkpn0YFrCtV3rX4ukT2TOldcMeQuV0d
 RqfD/aE97vPIFLvrAVoZatFC2Nc3AcSgEDEaRY2YbtC9WoeyMyh5lH9rdoBPZQNwyRXGJS1aBHS
 qeDGYexPhHAjggSIuSPcjpYTioiDMKsJQ+BaPdFWOVKbRDwd43sGrP+cpfTE7+hHKEF8O8UU2Qj
 kliTCfruM2OaQYntTP9axPqHHtqfPZZQgcTdKwhBxSbukrMwgfFsaQHYnRkNg2gFZZ5cIqToaer
 Z2k6Cv2UJbOq3oHO8w/a+jatKAMmo6CTeP2Ce2CJopaSUblIo8ARNqMbsZyRxaGPLMojvYaPpqk
 S4rJAGZtmbZXk31aa1AwGj44VxzGd7/OWaapZkxHOXBYuoDsTIx6Ne4ziNvUmFrC8CO6sADUZb3
 ytMQ2LG+IJ5Ac3/zfkvrWjgyZBu4v1/elRaCRl6BI+MXzTjB+yKTcPBBddH
X-Received: by 2002:a17:907:9801:b0:c2d:be57:f73a with SMTP id
 a640c23a62f3a-c31a9fcedffmr111799566b.13.1791532180882; 
 Fri, 09 Oct 2026 00:49:40 -0700 (PDT)
Received: from PECS-93BMLD4.foss.net (254C249B.nat.pool.telekom.hu.
 [37.76.36.155]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c31a9a38050sm56277966b.24.2026.10.09.00.49.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2026 00:49:39 -0700 (PDT)
From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
To: buildroot@buildroot.org
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Fri,  9 Oct 2026 09:49:35 +0200
Message-ID: <20261009074937.992939-1-mr.zoltan.gyarmati@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/libusb-compat: bump to version 0.1.9
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

Release notes:
https://github.com/libusb/libusb-compat-0.1/releases/tag/v0.1.9

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
---
 package/libusb-compat/libusb-compat.hash | 2 +-
 package/libusb-compat/libusb-compat.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libusb-compat/libusb-compat.hash b/package/libusb-compat/libusb-compat.hash
index b22fa5434d..ea3a89187c 100644
--- a/package/libusb-compat/libusb-compat.hash
+++ b/package/libusb-compat/libusb-compat.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  d199c173fd3cd9d27c7f4bb6608befc7eb761984e6664da7d9d4386ff66fe6fc  libusb-compat-0.1.8.tar.gz
+sha256  b09aa33e943080352041ea3d5ac01fd90ea96e9337212865de0dda776886dbb9  libusb-compat-0.1.9.tar.gz
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/libusb-compat/libusb-compat.mk b/package/libusb-compat/libusb-compat.mk
index b54dbded27..4e78a213b7 100644
--- a/package/libusb-compat/libusb-compat.mk
+++ b/package/libusb-compat/libusb-compat.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBUSB_COMPAT_VERSION_MAJOR = 0.1
-LIBUSB_COMPAT_VERSION = $(LIBUSB_COMPAT_VERSION_MAJOR).8
+LIBUSB_COMPAT_VERSION = $(LIBUSB_COMPAT_VERSION_MAJOR).9
 LIBUSB_COMPAT_SITE = https://github.com/libusb/libusb-compat-0.1/releases/download/v$(LIBUSB_COMPAT_VERSION)
 LIBUSB_COMPAT_DEPENDENCIES = host-pkgconf libusb
 HOST_LIBUSB_COMPAT_DEPENDENCIES = host-pkgconf host-libusb
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
