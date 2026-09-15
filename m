Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 676E3C88E53
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 08:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19F756066C;
	Tue, 15 Sep 2026 08:49:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w_hd4WDgtHwG; Tue, 15 Sep 2026 08:49:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 39AF760708
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789462179;
	b=PboW3puJnapBmUe0O0Y3fMg2W1wFEIfWvSTRzKem3LX86Ve1O6V14IDLwAfgIsAc7EDj
	 zFpEJRBQ29W5fp3nni7dvezeIVL0NMA0ZFZoPtgbGRhUBFO4m6llBD3UPIYeZTVm2K+9g
	 7pidKq24WHSkvyNVXm/QPfBpfsMGwi5FHtuMUHDv/NGuTxiJuCfDYwyshop2Ww5M9ZjV1
	 TaeAFY/+6MXCWb5K6VtwKXg4CWQx3lpaC8u/eldHuyIDtTJ4dnXoQb66SoxShr2lWNKWc
	 fFDtMrSZfCFvChnPIqs5Z+6JM+dSBImYt6FlCPkcvXb8iDR70tVmceSO1GfTDTTmTig==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789462179;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=R7vycLjR4SmFxqcFqSFNhzodosFYSMbSCG7rz1BF3PI=;
	b=Eg6zG51kenjn9NqSCUh2vfesbnhpguCRfTPObL7FmHPIL/RrtaKodERjfLW40k+/dKM1
	 2pIwhPyy1jlBL8Lsvyvzrl7l3/fWzzDS5egal9GvL/5Lf9MDHloZmiT3tDztSxBrqsXHA
	 buaMMStvSoanyeojEqzxqcrMvXGRsFRqhs5N24URnjUutNr/QAa9j/fDmI4M4tbG/swl8
	 wSAhpRwvINyvTA1LJipffz4RbKVSBl9Ji/rRcYjEIxS+J0oLAm+mpRKxlnlM13oLc7lIK
	 TM81LweqQDVyZT8ssPDLRJckK4wZcB5SQTfIepXUCzTysbnQU4tLXT3KxsLSaecPxXg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="VVTg/iP2";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789462179;
	bh=R7vycLjR4SmFxqcFqSFNhzodosFYSMbSCG7rz1BF3PI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bEomyfULW3rgFGUEmequjUZwk+g71cbsD9hVyl2QLGUV4M+45BEjiYTvG7BWcPNFM
	 KMTy0pR3OmIh8hZeT9AQ2xvFIz8bz/6va68+O6K0vwxz1lwMPL5vC2iXAP6h6JiD3+
	 Alo+5fUKVklZ734rC4JkBSPywFud0xSZjgpp2Zq0cvjk7V02Gc4fatARyB/uhG05EH
	 HJ8Bn97qlD7vVGK4s4ahhjTGbc6vDcWKzWsiwdm64Bj01w5kl+aYJvEYMF64ptYOXn
	 LbhR14HYrH2TzJBwE8LHQS8EjPmOU4Co19Uo8v9qRjbwhysPVbreIMPG+QFh/uZamH
	 JkT0bIEZdQJrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39AF760708;
	Tue, 15 Sep 2026 08:49:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 70272259
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 08:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 615D560708
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 08:49:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ppH6lZ4jhO5A for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 08:49:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 550656066C
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789462176;
 b=hzIIO/g46ihKolGm6eI0jl+iiQdCvmRdYR5oZbu4oKijKQi16Rt354X0QWGTm/eVgaKi
 8kNcvkze4ogsArtggLGo2XSXaObtJRRbxeTZ5EReVBwbW+ehBIXoKSvmxaAMHrIsvkqv9
 rxLk/WDWJOZGtEf0kOYyiBpc4aYwlNnmZhIacxnUewSKryckCqcTCDrfulgR7X1KUt7Bh
 nx4JNqmwfTwslAxx3vGVt4jo1ai7v3kPGO2KPUKULQC//Oc3MbczcjqGkBl3/QrCiSOC2
 R7KWElB7+xJMRry7kQmIop4ioUsqsNXsCUEX+Qef67lv90z90dgAi1f/498DzI6l7fw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789462176;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=Ag6X75PKfYTIUISPnSPT8LUAzlPYokAcxFNXctNm5EQ=;
 b=seG4Lj1PC0bjzplfWWNFPYKOrwC38GMsvEV1T6ndJE9xHn/wZGy67NZhq5/Uy+wPWTh7
 ubund4pwV1ffbTJqW7qQ1maFRP36u+qihrxPCOozS8KmjGMm57j2432x/YSOyYakmIVZs
 oc88gZARFj+qmCH2/9eXgCkneo545PBV190d/MXwRQr/IflXHAsOH6uLc8hBe3J8IZzhf
 dCevynscBsRwq85SYOiIMK3FA5z6pOdHuQ7A+Ic7MxVLRfZf1Niq7/pRZLrAfRNKnK2Ji
 bQmnv1+AslmEQyMyi2UmdFPSEULmC8fCacSLO9cNwRzl27jEBELFAU7dU3txoXoDFxQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="VVTg/iP2"; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=VVTg/iP2
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 550656066C
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 08:49:35 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49ccead2aecso11932385e9.0
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 01:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789462174; x=1790066974; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Ag6X75PKfYTIUISPnSPT8LUAzlPYokAcxFNXctNm5EQ=;
 b=VVTg/iP2nL2x31NoULaHGIalsZxfEgAx11c3Xynd7LqqKaxC6dWxnyh7aRjSCx5mc4
 7vwV1Yir78tJpIdB3kKTT8Om4pdewjwrTN+pSmf/nPSh2U0g7HxsUj2duXxubIcaForG
 ifalZkHl5u2E0NmWQ8b26wzSwMlF1d0aC1dPnEC2H/EzNIIR7clMQKppH/sGlFR85iAB
 Kz301pT9DREeesCA/eQgBuG+QiYR274era8KZUl3l3XolWXe8qR8lk1RPTujpj6T2i9z
 MfEo6Shu4HZP+sfMRWsU39FYJtzG1q7AX4ajnFwwKQFGylvNLzB3/CSl9+v6RNyz+4fE
 e9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789462174; x=1790066974;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Ag6X75PKfYTIUISPnSPT8LUAzlPYokAcxFNXctNm5EQ=;
 b=Nb2uWPvfYVAvBddXE9glgIgKpo/Q6LKgHfMqUWZkJINLg5jBS9JFZWb6rrT+8UNRuj
 kYVLJyV+ue9sTZ80KiGKg83AdcvW8DkIV5GsvIXaka17/Q5LeaHszsVfLuPCXyfaB02D
 kp0sKMm9EL+rhYIWYuybuPodRsL9gTtTywcfR0q/vZTzirp00rQF8fndOKQL5RQ8t1PI
 kemft0z83tfVCfQ4KAmjXFxrLykJyZvG0DcXFTvBUtBAbQHa+099hsJ7EmYPrt5YXgVT
 1oTnwIgXceW62oSulQ88sJWaollIxVf0mGgcheg5cdDYB5i4kAIWtVsBCH2T4WNnkldL
 XNxA==
X-Gm-Message-State: AFuF++lN/hVLII6Zj4l6J46S9PFocSqCTz1iZIvMItoJfN+1I/9Epst8
 BjNmquG0tDJDMn16jd9LwePKbWI9csWxTgJbnY6fK1xnP00xATIBl6eSS0hCblw=
X-Gm-Gg: AYBFou17OhIDnzLVHShIYrAiKglgNuGiYTYg7WmZUiHY5nUqS96ThFV7q7fFcApFKuH
 E/YJvEMBgfrpz1zTn9VA32VN8jYyk5vfus1ctlW+LGjkQYXogBSwc0z/AajzV4xgCDHSgt9Gjx5
 pH+4nxDX8SZ8l6LrCx8EsLIR1432MJrEoQV9YCuBD9GuKkh/QniJWx1TfpGcRZRFK144VMtPZF2
 N3CA3SZKqSdVejjGhZaVBBrmZsXcbGobQ0W70YqG5E1fqvNO0Cab4qm/MLKJFtAzMFIME9D9HdF
 eIbnaM4/S/xU0862QbVGyBG05WNjyXOYyemO3hpMlA2Mo9kRUXBE0zG9sxAecA8M00pcAxbPqAr
 bcG40FLLja/VoEPSR0TCi8Vu5HNxCjL8WcpsWbvz6O2KHV8SgUnitDrGLZjQEwO+GO+ejMndQ8E
 XjwL/x23UyqT2G3GsIHSc9TKn4C6PKd1O11Phx+HAYH70obFjrDLFsVX3bFO14Uo35oQVl2ppow
 ydezbMZpRCsXps=
X-Received: by 2002:a05:600c:4e54:b0:49c:dada:f581 with SMTP id
 5b1f17b1804b1-49e7a5ed78amr85830615e9.0.1789462173327; 
 Tue, 15 Sep 2026 01:49:33 -0700 (PDT)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e7d69f6d6sm58821065e9.8.2026.09.15.01.49.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2026 01:49:32 -0700 (PDT)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Shirokov <shirokovalexs@gmail.com>
Date: Tue, 15 Sep 2026 10:49:23 +0200
Message-ID: <20260915084929.427540-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/broot: bump to version 1.60.1
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

Changelog: https://github.com/Canop/broot/blob/v1.60.1/CHANGELOG.md

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
---
 package/broot/broot.hash | 2 +-
 package/broot/broot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/broot/broot.hash b/package/broot/broot.hash
index d883337d9d..1f45965fd5 100644
--- a/package/broot/broot.hash
+++ b/package/broot/broot.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  c7ff621324c799976d52becd7d0c24aad6f991b10421303884065305d4c00a1a  broot-1.60.0-cargo6.tar.gz
+sha256  6daf2a7381fdbce5acc08261c2899304b4a1efa7c33623e456b8c45853cdb7a0  broot-1.60.1-cargo6.tar.gz
 sha256  89461664ce2aee7d80ea8fba7118fe7abd490d76ba435cf1d81d3128e060711f  LICENSE
diff --git a/package/broot/broot.mk b/package/broot/broot.mk
index c4cdce2e51..1467f55279 100644
--- a/package/broot/broot.mk
+++ b/package/broot/broot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BROOT_VERSION = 1.60.0
+BROOT_VERSION = 1.60.1
 BROOT_SITE = $(call github,Canop,broot,v$(BROOT_VERSION))
 BROOT_LICENSE = MIT
 BROOT_LICENSE_FILES = LICENSE
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
