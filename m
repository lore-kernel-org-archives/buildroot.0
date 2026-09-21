Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BAFFC982ED
	for <buildroot@archiver.kernel.org>; Mon, 21 Sep 2026 11:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EE776071E;
	Mon, 21 Sep 2026 11:59:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FAhZjUO8KMK9; Mon, 21 Sep 2026 11:59:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 516AE606FA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789991985;
	b=lFxJO4qlKiHuK+v04+q8FBNdOrXnMKsuYUzGghVVV+ypv4By8jfkgIjmU3R4dyPltVs+
	 tHmW4yJtZFLQKkxLmzzD3nzVzh7PvEASNlImwWR4V+8B2wut22LLwOEDCW9g/XCBkIiQV
	 qnLNbNiFZKjvkQvFZq1iLihsLQjGPOAzrPTAwIMnRNw7o0RbI9LGCCHGVT4WU6pqaANsV
	 Zzb/qjuT2CO3Yd/gNV87INYyRM1FOgJhocgA0FaZJEr8st8YqOr76gbZTd7IQU4we8yej
	 QZPHs+10cTys6DpNWy96EsGbD1G/FxzDqKCSVsml6Qnj57wa8VPGWttGvx1dGycegMg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789991985;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Ir4JZwRLj1/4ZDjvxSDxPzyzM9SJi0zuQLCfUmZHF8g=;
	b=bJFP9TOKz0unbsvevdbZgE9tqdpKw6hEJ+/t222pwmRZrUrJUl0zIqWhPj3ZR7YK6Z82
	 snNCNUcV1ARrBQSCv+lNuSTcGXMujF2mKD8oTLOLdNQAAv8QAafWlioXh991eVeTH038P
	 EedBF6q0MwK80YrpdhPlkCwBBkxVeDq2pcKg/eUDA3rjCEZ7Hgm9i6WFoabCFcummqRS1
	 0ODSHSPN+R/IaZg3meJMIXscPnHZPlXGcArwHmv7pnZGkGoWy+unsAe2RR6PSvUH7Kq4+
	 ArJ0a8kuw1u+mzasoRt+bGkxNttWx1jjMrwaBg4ZC4t3ynm+65rJ3FRJ9F3uTDrTt5w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789991985;
	bh=Ir4JZwRLj1/4ZDjvxSDxPzyzM9SJi0zuQLCfUmZHF8g=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=oLZbmuA7YRZZU4oC1RU/aLqu2QvWaJy184EIlJ1Kvz77l9YlCrh0d7NsL7raRdUmc
	 ob7i/rSessMYzMDxtcljqS2Ff2o2I7teZ5m2nnbubg7HzZdRImE8TcNvoomYIAnhuN
	 OBBAVnbotLLrYsOw6hswJK1Y1lqnFcTw4CvYTIbTthwzoXC9bPljylZRXe6pRUh6ys
	 Ga8l0fujHUX79qulnvQribLrqYALS/Ddn3090soaglcVmkGcDYdEgZrHCVOuw7apji
	 l3X+K6bZFnoKD3Tv5IIfquBkjT/wppisb93uusAh0jATVXjuIGebbx+MaU/jsfHZAi
	 Hc1UaO8f3e9kA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 516AE606FA;
	Mon, 21 Sep 2026 11:59:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A5230392
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 11:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8ABB040111
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 11:59:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id od7vOExCVSam for <buildroot@buildroot.org>;
 Mon, 21 Sep 2026 11:59:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 19E0A40064
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789991983;
 b=ke0dtJAgRw6+enICfxusNR9upEpZsHp62wb5yy7yt/a2C3yioYBG7GWOV6dixpjigFVw
 IR9B46OsnRYofXy7cDmyjKkD00DACNUcoKpZveosIpjHlGczxNgXO8CndeLFc7oYdBwnK
 xAkvkql41kmayiaonx2U/+7edSguc6sD11XRLihLMwdY0WgsV48NEjWJy4dDdFLlaOXu5
 CPT0GOPrrNTpNQ90jhn1n/VMJgu8M6e/BvNbxcWZ8KpJufGk/7FcjhJiK9oR3lhHn8ezx
 dpEAI8vfSpJt64hdJmMgHsfH3jtZnBg4Mi0Gb8CgmaeucP0m86oVcYih3yOSfSb3RmA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789991983;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=fqKorMQNd52pV0lSgP0zCL5cGaaNZyaEVMu70OEebhU=;
 b=Wnzau8xuzaUgDFomEYbDLSnqiF+kgMfM0Ix/XH2+j0UPS+Lu1uuwdfibtQ+HNzftB8wW
 +FvnG0+o6RG8AitxPidsSirRagv34xqLER2zvJcbzrz1cRnmqm0d4GRUPz7xNKE8T4Jnm
 ZLlZJPuENNU/9WSCTXRfJipgDY2WFBgAlCkeHgEpngO8wRK90ml6PKv7ONiAsCp1A5Arj
 xNitM2MHgglZDgvc0C+K9yr3o3wfdKF1KZGr3WDatlBSzZ278cNBaHp80NI7Xf52VJpPb
 htHM0chZJKkfDo4WTm2n6fPjaVJ/Axkcmvfl29N+1mhbGdMbFEV4pewT0sCRkkQ1jag==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=YBi2IlSg; 
 arc=none smtp.remote-ip="2a00:1450:4864:33::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:33::10; helo=mail-ed2-x10.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ed2-x10.google.com (mail-ed2-x10.google.com
 [IPv6:2a00:1450:4864:33::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 19E0A40064
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 11:59:42 +0000 (UTC)
Received: by mail-ed2-x10.google.com with SMTP id
 4fb4d7f45d1cf-6a98505364aso4734597a12.3
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 04:59:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789991980; x=1790596780;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=fqKorMQNd52pV0lSgP0zCL5cGaaNZyaEVMu70OEebhU=;
 b=bvWcJZCYb+Dd/Ow4cvMKA6CK+A59+wRBxZRMCqh3itV11wtV74wD0tlFcw2s4bITWg
 nnacUGFzW64gjX/FA7OO876ECZKPqTa+2gxG9uSmkAnDg9o/0XhMbFU4vN/KYW8YlFuH
 htuLHJwjDdPdEOyISl0VbjQGm0v2mfCPrr/ssM2besouyF/FXL4P6pXU2bmpMX5bdwFa
 VultTKtVIuvNTJHDafkZKpl02mUWXoT61tFu1dau9xBdQpNN+Dy52C8AX6ptqy13Sfwr
 iVWWjllS881gxUZXobELv046qG6RrUFOZ78JGPf4orKVS4XvyY8HwoKRu7oflxHsEQ8d
 RedQ==
X-Gm-Message-State: AFuF++ndb1KR2NBU3oUNkjBY8CGGEqb6Lne2D0XPU3L61vGs/bRHXarX
 Qb/Yv/6T3SDHZcGGraJkwENQ0FfCKi3AqAEDpmAMpLITfvUwPFQdKlYblEtM/koRqQQlKD3AXLj
 xIxEEnbA=
X-Gm-Gg: AYBFou0HNPY7r6vO1avu9rJnJpxEZU/6rNIGs7zFn4Ic61LdlUpuUbsyF/ak/jixye2
 mX0Sjkq+t+CPehnt79CjTihBzgzcznK8Y6X+yMzbSB4WHHr7MwvOaIyS8PlVAMY5UFB7ft7Wnnz
 9M707U9jA7/hW+++LZt5m4dS7jIUj2yHtiGvFiusjHLQVUC26i+qxjSYuBjRrnM1cfo7dJW/LWf
 iZQh4gKJtq3DTFahlZj4hu5K3aEsL9MG8Ax2d1CIKetB0oy3Wheab0SMQwEgFgR0MnPbU5wXXJH
 tzqKMqe57kzfPq4BerrPiyOmyE9fk4DtEsgpCiv1dKoR/lP8Ldyg3XGf3E7aZvG18B+KmqMDquQ
 DDjW4cQ64UfGpOskk2TwnfsRUQ6PAyKgJesuR3bsxbqrdmRUGHSwRsJGfV2clibYK9nr7EvWb5P
 b1wm118nR56dziTWNSD17E2+aHbcRFJK+Jqq8Qr10jpX7fJnxOQJLE4x/UsLGWG9oD2+YiTs3X6
 A/4MaxmSYLUWQ==
X-Received: by 2002:a05:6402:500f:b0:6aa:1112:62fd with SMTP id
 4fb4d7f45d1cf-6aa53181cd5mr7300401a12.18.1789991979889; 
 Mon, 21 Sep 2026 04:59:39 -0700 (PDT)
Received: from chapelon.home ([2a02:a03f:63ab:dc01:ce15:1729:c989:3a9e])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6aa912c2f1esm751361a12.31.2026.09.21.04.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2026 04:59:39 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, raphael.melotte@mind.be,
 Titouan Christophe <titouan.christophe@mind.be>
Date: Mon, 21 Sep 2026 13:59:25 +0200
Message-ID: <20260921115925.117991-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for 2025.02.x] package/{glibc,
 localedef}: security bump to version 2.41-163
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

Fixes CVE-2026-8674, see
https://gitlab.com/gnutools/glibc/-/commit/c97fdd483232a831829aaff458a212307f1bf4bc

(alternative to commit 7162c4daa58c7881d0866f5a64c525bea1c58867)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/glibc/glibc.hash       | 2 +-
 package/glibc/glibc.mk         | 2 +-
 package/localedef/localedef.mk | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 0243dac049..b4549549a0 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from git)
-sha256  987c4f5951a25dbdcc0b76deddf4fcb97a122cc4f505d351fd44863936e7d903  glibc-2.41-161-g5dd252cf1d113644b3679f5a158e9ef20217865e-git4.tar.gz
+sha256  b369d2b38357104ba1b3848bfe4139c6a4dfdaea28ac31b3cf2a3985fb008a93  glibc-2.41-163-gc97fdd483232a831829aaff458a212307f1bf4bc-git4.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index dfe599b912..34a6175855 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.41-161-g5dd252cf1d113644b3679f5a158e9ef20217865e
+GLIBC_VERSION = 2.41-163-gc97fdd483232a831829aaff458a212307f1bf4bc
 GLIBC_SITE = https://gitlab.com/gnutools/glibc.git
 GLIBC_SITE_METHOD = git
 
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index e812ce36a7..3412db3c58 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION, SITE and LICENSE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.41-161-g5dd252cf1d113644b3679f5a158e9ef20217865e
+LOCALEDEF_VERSION = 2.41-163-gc97fdd483232a831829aaff458a212307f1bf4bc
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
 LOCALEDEF_SITE = https://gitlab.com/gnutools/glibc.git
 LOCALEDEF_SITE_METHOD = git
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
