Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2595DC982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:46:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8F5880F3F;
	Sun, 20 Sep 2026 14:46:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hC453LdZIV8o; Sun, 20 Sep 2026 14:46:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0992480EDD
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789915567;
	b=Kf9glVo2BU2WOl82cmkVxhgcguMvVZAji3dmqTrZ4qlakAQnmD42ZwoljKW9ahvPCgo3
	 QcRt9PmPaEjKm9+eA3/4zvfISKdo4bClqO6Cl39NEEcSO1cPyBNe3ydhD7jYj5CneX0fc
	 3z1Qcp9+693cKoawdt9/yLfxrpBcM5BExMPAxHVX6Ry1m8b+93IFCWT/XdtkkauB9CvGa
	 ks+gW94nZQDJOKEy6dATB0m5EYrhaOh+lbp1Ndu1OwYs7k1x1XyJX4lukguN5E3qgxWn9
	 96xxzewdwzBAalVu2kd2ZeEMJES229+0zlirfP1L7BzsfFp+Z9iC4ih0kuOGZILCO9w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789915567;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0VbkXkk1xpEOQhMO+zVipGweQU7rpa5j5oBRNvrA59g=;
	b=s1YT9TgpSWDZ/pubpg+rjaxJTlZbMfcztp5MPD8iX4SlJ2OzJL8lLRkI0JKHm1HuXfku
	 /80aFewtw3KpOFPwGwJVIaeSzuWDJnza1RInG7Wvk2nyo/cjny+7/wQclm1cTOxaRJPOi
	 leAm2PHteEqIC/MBvTWpxELgOEjCyKoWpWrJs2gnHNnkZ655c6aGWQNw1DF/YkjEXhymK
	 KRcMJMf1ZTIvzDEX/WOXENNdLC3ZJ/B6zNshldWujt/Biy1IPNgrw1lyWHQv2XDedQ55+
	 T1SBXSFpJnGPzAR4fU4VrriQCxnRh0WSZoWG5gppBsjV7ufBYEtLaGJIq5D5yktPI6Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789915567;
	bh=0VbkXkk1xpEOQhMO+zVipGweQU7rpa5j5oBRNvrA59g=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k5PfX1z+ckSY9CxB63TYw7FXT6i+RWsqdYkWVh01/+Vfhm34lzQDgVAdDA/Y2mAqp
	 /0q6/hFGSyb96lBO2hALRH/uiYtKiHdjewSU1iXYkgTLevttwt81lxUZrYKM5pKtyj
	 AW0tEc1fdNWNsoOiJDMW8cos5UU6wynl+8jY9CeWx1nvVIJGw1mMQpUqdIfFJWtthm
	 TIXEqLica+Q9A3pJdVF8uWe1iYZCNjTSIVk9Hf+pTyQ8uJLLt31TTS9a7S7ATAkbCY
	 7ftv6nsqm8Xf93iDGeaSOrDj/T7TYodSSckp7ncc0nJ4ga+svyX2ZG3SMEzu0jAsg/
	 T+9J1xNYpZ3pw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0992480EDD;
	Sun, 20 Sep 2026 14:46:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5655837A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:46:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4802B4009D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:46:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ub5u0XgrKk_1 for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:46:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 621FC4002B
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789915564;
 b=PqlB1G1zqA6PUxLZltLqZCXu10fXjLTbUTHWkOvgd5eZdpcfpuPDho6Zeb3LkkwptNFR
 RLX/uuOGpaNa8HBmjQ/6v2fqJwp3oKjhltJO13lyVsMA2+xH5mC7Duk9gGzbMTotYwfyP
 0WmjjMi0ZY3xoI6kibtegmwdq6pG4iaczPNG37E5vXqVpwFidU901QVl866WSjIklqQU+
 LsEuFD1u6pyAYQlgynrGxvPqWD7ku8HZVZNrKFNX34U9id2svv1y9qg0WU9vbrTTewXcF
 a64Rw6pUR1/Inz8qjC3aPE9OuV3K2qzvHP06dmIIbQFJS7Vg8+f9YtB2THGDJ4wmvaw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789915564;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=uKC7KxSy17C813qamL3f705ZVvnyKQr8JXL0DuQ+7mI=;
 b=i5/bFBsMNOt9ZdMSrF72vxG5xJsKDK/k879HVHfSZIR2U4ASJYMh90yc9jzcaqtIMnpg
 gaZy0s99omneMRDcM2E9Gzc8MnKyW/o4xpyievD729/dvtCQyTU2HYCAY+jxhz9gIJKt2
 VWIe/CZW3D7slth/Tt1DKeVBxSDRf3Xop4DagxGmWXpsmoGUkG/V4iGe6Ac6OzJ9I3EAM
 b7oV+RrnoKSO3W+C1LgJcAgd6NTlpHN1qgM+KIh94e/t7l1Trw4bdTf14AT/J2YOChzvu
 hFUS87FSZ4AV15l3ng/5UMQiNHFMhrd/Ve1wfqXMo5RWNar91jp8Q0O8ltEmsiAhGaQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=t27zH3Cr; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=t27zH3Cr
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 621FC4002B
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789915484;
 bh=uKC7KxSy17C813qamL3f705ZVvnyKQr8JXL0DuQ+7mI=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=t27zH3CrQ9gHqt7I/eSDj+Q7QuCYENd35WygzPHRxMuHrY/EGVseHOTR3YY39OilF
 US6U/Ln1dFmc9pPvrJV1lHdqA2zuQb9L+8MgkXmlrd9u6O2m9Z94c+rkVk/A5+lAzR
 iCVzhY2hc6noJehYjarEtc5tY8kZziQrDZuXtM1mCCnPI+dfFqOLVgrBX8OiyyzcyE
 3RbD9/kNZRPSuXfd2mzsvJGKsjCCO5+8zeUHpj1Sbo06kFHt2GOygTHA9JW9oITiH6
 Lk3m3DwKgGpXZNDxgHmW9LM4bkyoofkDJUOxDjssdywVOf375HMT0BhoMoZFke/K+T
 7RuRjzdVEzTfA==
X-KAS-Sym: v3:f51bdf72230551df:f9NnCreHs9kSnbMHh6AQdUFyi4vT0ysTuSfFuAQb1+Gxoi8Jfz3lO+KrB2DeTBKeXjT0lwPd2ophCA3F+v+GZvhFlIBU+QKhu+ybVOfg3EHT3MlcRpRvQktOsgJhRsIPALxvYyBhhxNnYCE6obl1o50gAonnv157yLjz1DqCWN47h7t3uGG6haE/+QCl6peUI/vdtKUEOPguOHtIjeLQw2ZSvs9SigPQ0ly22rWdnqQfFx4YWvu/1HbcD6LUsBe0xcLvKWC7ZgeG69JhrpeXORhdzb1VUBZOYiQJc18uAWs2B+mptoIqbEFj6Yl1D0sZ4aKGuMvi+V1/RbjqRW8wdA==:ohBpBFKoOxg3wJL9fXOIjgmqgwCDaT6m/VSmrW4y/WsuaD24lQ3dU5Ea9LTWqsXsMEn47yLPX+TRBnMQC+Y9AEPFLxuJgFbxCVbfbA7NUYjiWHSsFsPEGwUPzmch4kbEVWn+TfdYAFQlYFeXybvQGHByQGlKotygYGaGQjbmAhHMtbGOHqF+mLY0d6IjjSWBCUbZBE6hTUOWvvnINNhCnaLx7gz5xp/0LkB5oLiNtauTg7ukS5XarEhgklfbakUxzL4gpyfveNro/eQK7s0BN8KWKBdbRjD6XOCNG4RFZhmulScyUefjxUcOFsZXZ6fqyKyB5W0vyX55sm4/E8oW6eT5ZAXkdsrPU69dpo2okquAL+ZhdwAFuBvoNNLdWSSr5pKa+0iJPIe9R+yhaqEQgevNZbwMOxPzjutj0tFG1w86nam4s2zh7G5nu77VP1SQvg2mL3c/kJwxyyRI4AnEVICSDV53itk7D22rNlmJzrtjYq87Xkl5Un8PRQTfuGF2MHdj4jElBKgT0tBri7RKVXOUf52a6jO5+4oADQuZflcSViTewOTiqIVpR1dMCcVyycrbovxFoZuab4PLj0TAMarin0eyUgqUjWeKi+gEiE0Lom
 CBdRAzr/075+BM0/0eCzsBTEo=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4D69FA4C4859
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 16:44:44 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47000)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8Ima-000000000hB-0GN5
 for buildroot@buildroot.org; Sun, 20 Sep 2026 14:44:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:43:31 +0200
Message-ID: <20260920144428.3009612-11-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920144428.3009612-1-bernd@kuhls.net>
References: <20260920144428.3009612-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v4 10/66] package/libp11: bump version to 0.4.20
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

https://github.com/OpenSC/libp11/blob/libp11-0.4.20/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libp11/libp11.hash | 4 ++--
 package/libp11/libp11.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libp11/libp11.hash b/package/libp11/libp11.hash
index 8a31a6f39e..10ab7388ad 100644
--- a/package/libp11/libp11.hash
+++ b/package/libp11/libp11.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OpenSC/libp11/releases/tag/libp11-0.4.18
-sha256  9292de67ca73aba1deacf577c9086b595765f36ef47712cfeb49fa31f6e772fb  libp11-0.4.18.tar.gz
+# From https://github.com/OpenSC/libp11/releases/tag/libp11-0.4.20
+sha256  a125e0310ff10c189fc1b32a9652101486ea94a6b07c677a30e90e3638d2db48  libp11-0.4.20.tar.gz
 # Locally computed:
 sha256  d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f  COPYING
diff --git a/package/libp11/libp11.mk b/package/libp11/libp11.mk
index 51a44f5b3d..38cc1c2e6d 100644
--- a/package/libp11/libp11.mk
+++ b/package/libp11/libp11.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBP11_VERSION = 0.4.18
+LIBP11_VERSION = 0.4.20
 LIBP11_SITE = https://github.com/OpenSC/libp11/releases/download/libp11-$(LIBP11_VERSION)
 LIBP11_DEPENDENCIES = openssl host-pkgconf
 LIBP11_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
