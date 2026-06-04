Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B6DCD6E6E
	for <buildroot@archiver.kernel.org>; Thu,  4 Jun 2026 22:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FDE68565A;
	Thu,  4 Jun 2026 22:20:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wQ26ClbmBmep; Thu,  4 Jun 2026 22:20:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 375D185654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780611631;
	bh=ujhRCuKJM9fCVgc6tcPpCS1AXeo/6lVOrzGMS6LjFkE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BseEcKwJMyukwkigHDGWTSVDuumZRMeSVlMnYFicRDpxpSDEvh92OLygqaD3Zl2jU
	 VmavbzNfMMiC4Gl5DgXyyJhtv3t1QA30t6ywS9pqi3tlbKxdWKiWLTpuzm5Z+2p2v4
	 PtSVYPqM0Zq7LvwaKfcpYw957S8yKwoLGVTZdfIXdEhIrOqSTBa7ZdZ/dgrXM4kqfL
	 62Ub+uwf7tvKojVpo51SFRXVzyn6Fu5hrmyepveI8EL9MJK2rJ19xpLPaN5lnOgAM3
	 rTQV9KJb/XTh17KYNeIuSjCPNYFD6c9rgYbkLkqiHe29PwSIsrK7LurWHFeJPUpINX
	 iVeFDDOWWrw+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 375D185654;
	Thu,  4 Jun 2026 22:20:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AB25192
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 22:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 003A56F9DC
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 22:20:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P8pcrXYMvytD for <buildroot@buildroot.org>;
 Thu,  4 Jun 2026 22:20:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::f31; helo=mail-qv1-xf31.google.com;
 envelope-from=mr.bossman075@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 24E046F9DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24E046F9DA
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 24E046F9DA
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 22:20:28 +0000 (UTC)
Received: by mail-qv1-xf31.google.com with SMTP id
 6a1803df08f44-8ccea53f35cso13545836d6.1
 for <buildroot@buildroot.org>; Thu, 04 Jun 2026 15:20:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780611628; x=1781216428;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BLR8EkYbPE0a/xgUjAfhBX4zydPMO2v96tDgJaNwr80=;
 b=dpdGWaYHD0JqxQXMG/zEYBCtKheiXWOqMN1uO2BATvXdVAnXrIisC8UBlkr01CJq3D
 vKO0VCKu8HuQxI5eHQkh5yghqf3slnksuvnX5bJUzkW5AeHEELJLTI09QTdWHRNWpXX0
 e1mZ7jAg1YtSPLuFIk5UZ4mj9pl+okzoQLlJKpENTQdMS9kGJmVRv+UgDQbjZG6kNAoO
 k3Oeccqq6LGgQWgXupAdTSV4RiJt1N8LBGWFCwMdYCw76SdQokYBNH8gv9W7pNonS8W9
 GaQhkv61/B6ywDpYvtW0AfXqMNis96kuRsISRf4aIHGy+39XRnYC83u0vol8VT+rj93k
 BPPw==
X-Gm-Message-State: AOJu0Yz59vX9jvIgU2KFdw1rRlgWICitzIOYP0y4cUlvslWSwBFCMecq
 llz0iSgkpPIa2syiZsCXTALneiSj43c7bruJjy2/87nnOcXwc/rg0YiGyaBxeSdv
X-Gm-Gg: Acq92OHWETkI4N2hGcA8E5MIRVXuLWXJ9OKD6flan9iviTtJ58syg4BlqeOZN2uYnTM
 b4cHXS5uhvUd0qJ8jc+vZgJ882Ps+F05lGKNlWK0vJfZwLCVbyxicNRUKPCrrfnubPIoGGBsVen
 OeAh4LIz1WtBAkMbcy2JalmX3OTr8OlFOHd7a/1/9KlUHpf+L/wCJAw1y5xW89hunsxLtnGncbo
 PYcWzRiAqFQkXTF9IHe8MooPn3e68bfxTRBzTaJ6Z27s2SAnEIEb7YAMq7HK2q3QUJqe0FU6gBU
 csX9zq1FOJimjS5/t0DvdLWmbFWLrHMVFBURqAdljZuqto+ekRPqc+mSX44H3Rh8JFzJaHlCRVs
 xpyqS3IT5IN/ZMpb/b2WOxGYZg4pfmrO9BLHVxWaS84iyAxugmnv7ZKurB+K/mTQHcLJpUt2q6F
 mlvXmOOGOdEBazdiIizSIwNA+utxTy56Zz1tOftfxWwYgi0mEffxO14LO+rvJzopa7W0I3r0Zck
 bA4h8YXcWV0djeXsK/2qCKDC8oyYIi5f51uP5OdhpkMVHfcWyv0rMzRfw==
X-Received: by 2002:a05:622a:8c7:b0:517:6e09:74ad with SMTP id
 d75a77b69052e-51795c647fdmr12322031cf.57.1780611627685; 
 Thu, 04 Jun 2026 15:20:27 -0700 (PDT)
Received: from jesse-desktop (pool-108-26-186-76.bstnma.fios.verizon.net.
 [108.26.186.76]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51775c07e91sm63529601cf.4.2026.06.04.15.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 15:20:27 -0700 (PDT)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: buildroot@buildroot.org
Cc: Alistair Francis <alistair@alistair23.me>,
 Jesse Taube <jtaubepe@redhat.com>
Date: Thu,  4 Jun 2026 18:20:26 -0400
Message-ID: <20260604222026.1187569-1-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780611628; x=1781216428; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BLR8EkYbPE0a/xgUjAfhBX4zydPMO2v96tDgJaNwr80=;
 b=Spt9hyX2qslPGt5vzHy9y6qoaWI/f0Ua26Y3R1BD99KGrftKgusZb3PswPmqBTq45I
 LObxkiCUULXTshMUDBtAI6en1SEz9R3lG1R0d6E+94AQfLeC4VRR6G7qTikNbpk/GBhe
 6WMO0gB5WCynSRn+zy5q+IuiplD5HKn8bo8IrEhJMnc7V4M4YDnj7/DT8n9MhW1D/CXY
 l7D81Qg2fCIJ+niXIhueSRsTz4PJjwVg1dg5Fao3c02c7pW6m8MyBpTwt7UShDmErUap
 dkJRwLshiPmb3elVqAKSjKQFvZ5Te+dkTPJ5jr+FHEZPXw8t7P35CUcWUlY5qGuWGx55
 05mQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Spt9hyX2
Subject: [Buildroot] [PATCH] opensbi: Pass GCC_TARGET_ARCH to -march
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

From: Jesse Taube <jtaubepe@redhat.com>

Use GCC_TARGET_ARCH to set PLATFORM_RISCV_ISA which sets the
-march option in gcc when building opensbu. This allows opensbi to be
built with additional extensions pass in the BR2_RISCV_ISA_EXTRA option.

Signed-off-by: Jesse Taube <jtaubepe@redhat.com>
---
 boot/opensbi/opensbi.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/boot/opensbi/opensbi.mk b/boot/opensbi/opensbi.mk
index f9f550176f..e1bf9cb443 100644
--- a/boot/opensbi/opensbi.mk
+++ b/boot/opensbi/opensbi.mk
@@ -32,6 +32,10 @@ OPENSBI_MAKE_ENV = \
 	CROSS_COMPILE=$(TARGET_CROSS) \
 	$(call qstrip,$(BR2_TARGET_OPENSBI_ADDITIONAL_VARIABLES))
 
+ifneq ($(GCC_TARGET_ARCH),)
+OPENSBI_MAKE_ENV += PLATFORM_RISCV_ISA="$(GCC_TARGET_ARCH)"
+endif
+
 OPENSBI_PLAT = $(call qstrip,$(BR2_TARGET_OPENSBI_PLAT))
 ifneq ($(OPENSBI_PLAT),)
 OPENSBI_MAKE_ENV += PLATFORM=$(OPENSBI_PLAT)
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
