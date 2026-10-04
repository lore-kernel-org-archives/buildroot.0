Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 678BBCA5FCE
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 20:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 494BB6073D;
	Sun,  4 Oct 2026 20:19:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WuGtyFLBGgOA; Sun,  4 Oct 2026 20:19:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6146360705
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791145145;
	b=KB9udHjHZONoHfPaB2d2Y3SC8g5L5Qv8TfBbM5AoQRU4PfRGXPGR22i3spIJttyU4zY3
	 fpapSD4SbNyMosUVu5/4kVBYcK3nIF6vLTfEsri2PaSO+UWumiKcGlSn6SwDhBz8ubZZe
	 /s9Um5fdyDnXHz+Fcv2IA76E+eM5eGviS3Zwt0SOn1O3FuiTe3GSQc7/gNDhWOxCJvxSe
	 42BIzs5H9r4bOJBc+WperHpEKdO74QDgU1e48U+gKcYU/KhcHrOCOJVWunCo6Lhl0m7tZ
	 7rObApz81grLrW9F36YQ6PnP9UqqWyO2vOsDHFnfSqPlGRJdbzrIrsmKeaFdBQVbN6Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791145145;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=xBmsQVR2PVOXMs5dzIc/AisdS1PVsRxuSLVBrRzk3Tw=;
	b=GhB9sP29UbLiBEdZdZ/euJWyKLoV4IzptqY75mLoZWNUu9YUuSc7qxIRIciJc6fEBf40
	 P8YPnpZid6ngesR3iW5WAwUv0QuSbkT7tilritbXm67vOfjhOexI453nhEJSbhv3OkSbV
	 lDwndsrPXq3bZVd4cZIcbh2rou+G4+Sn9mWmKvFv39elJmR3ZfxwpMBXSgkgkXtyRuR/6
	 wh3nQKwSbVJmzVQQcQGXRtLDP0DM5hl9MjiinJkiIddxtmfkOyblGeUw6j3cp1p8wOxd7
	 6RpNA3q839oJKKFfk0/AZBS8X1it5nMXkQiriTJz0nGNBDQgCdroGcrQfrPdt5YzEmw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791145145;
	bh=xBmsQVR2PVOXMs5dzIc/AisdS1PVsRxuSLVBrRzk3Tw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=XNlHP3Ol+iyHiSAGWBDGeJyrKs1bsYcm8Yy1+F8fFgb29pkSoRikWkuQo+446vIGn
	 3FbcQiPRoSUP2+zcYZtOw9SGpK04jwURMgCuawHi+s25Q1Y8nnz1e0+4H2q3Ha6JHD
	 Xg164Ua6VA8eZ5CttlkvWUctsrpSNb4JcIg47XJEXruwgpDgwFEDGl2i/fFTPlM5kd
	 5yGPJ/saaC6TVNchs0FFn8g1OAgP8VhtuCs5R9PHWN2Ky3o8lr6pKzECSQHaCHu7D5
	 AHDslqXDU+B9cQsmKRVwPuKn6lkJwWrppqgWPSiO+trCN28CbLSSPgIYqG+/89bcnf
	 kubC4cRdRBsSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6146360705;
	Sun,  4 Oct 2026 20:19:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 59E04323
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 20:19:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4AE57400C8
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 20:19:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RTVmIvMcRhQ8 for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 20:19:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 4D17B40004
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791145142;
 b=eZFhMELlm50ctnqDs74zetDsxVKOQcFjexm7lH3Ay0W9bwM72yBEP7jUu6pX29SkiySG
 KOlUAc+N5IilXW+nWjMse0so3NtJkeMGfQHUoZxEOqKm97eR7JP7n62YiJHtBtTvSTTJy
 BrH0D6IiUJ7JldBdk5ukwKsro2vRRGlg8KcuiRXZLZUZnf5LX4vMAniFCxn35Nncr95Ra
 BSWQp2i4Yv7sJoP3Qe6PuqHgHvzhD/axwq8u3rGZGQzQ/ngDsYWhlzp1K5NfQw6aPXi4z
 hYfcw/bbkUYOyx1T5U797SEhedO6BZDMgTbgpMu2txnp3yQlkmL4rHSA1ZYQxfpH9Vg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791145142;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=WTcS/JvaI1aP7Gq+9p7TN/o12icL2HO+PJgmVmgrj5U=;
 b=oOWNwVCweoWpxn7QyOZ/OOBNpescUqxrHXaDOyj2aExG05+guQGClt1TqXE3s9uVX2/c
 3KWKy47g1PKL7KZVPwvrrBPmXq1oQ3V5WNBtsq2GlV+FPnmODK7aFqf/lVQpr7ij9xCxV
 MorHuqwFsN+Osv4BZOxoRpEzA/Z7RnCUkVZXIwF6gunnW6cZLEanH/sK5b0ZzOE7N6Fs+
 yzcedbj2THpPcgZRG94YO0sv9uu/BFYJsfGwMTEKGSQSpk2aZZ4C6o4AWeiR7aXaMX5SM
 yJPV9j01J9jvEiv2HkBiDwkobwAyL318pXoVUtBO5wy5rGPDFaypnpLuaGuQIPNAIcw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=dwDIAcWT; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::2b; helo=mail-oo2-x2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=dwDIAcWT
Received: from mail-oo2-x2b.google.com (mail-oo2-x2b.google.com
 [IPv6:2607:f8b0:4864:31::2b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4D17B40004
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 20:19:01 +0000 (UTC)
Received: by mail-oo2-x2b.google.com with SMTP id
 46e09a7af769-82389b6da4dso1331545a34.0
 for <buildroot@buildroot.org>; Sun, 04 Oct 2026 13:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791145140; x=1791749940; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=WTcS/JvaI1aP7Gq+9p7TN/o12icL2HO+PJgmVmgrj5U=;
 b=dwDIAcWTSZyZHn5c6PEMY3U1QKkB2VFm817aM3IR5ndg2c9d4r1WM/LCqMfBdCDPNc
 yBj5GTvqCmjGrRg1LDIMdMIYuXyw+Ic77z0EHT96OBVm54kS0aSVaI63eiwmlH2plXww
 be9z9UVFgfdhvdY4SRGcvljdMA+tW9csLiO+utbhtUUpS0NXSXwkYsTfETibFDcNzBcE
 S8EBlJ5ZrucdMN6yb0jmiV7X7j7nuaZq+XtCZx+E9/DaoeyeZ9ExJOdj7EDPDbQDO3/5
 5JH0mOVEu0NtRUFRbwHqFFQ/PXNq6EU6nS2/j818prRM7+w+r3D+IL0OrbnvL5HTRHCl
 upYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791145140; x=1791749940;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=WTcS/JvaI1aP7Gq+9p7TN/o12icL2HO+PJgmVmgrj5U=;
 b=DAJAQwvVIi57s+Uw8iblw3XEoQHNsfVRA0FPYIPPubKniezvVhsLHcHBXOV9d4QOzr
 oHxMHEmLUegcFgrxpY4AYBvejH92Rgr8Lmmf3VROgzJXh4onddXQD8S1zd4pJtqTUA0k
 RAcFTUacJsSH85LZDbQcexfVn3MLAtBA0ffexKwxwv+zMvta7TMTmakhXq388xZ2vN8q
 fvw2EdoHFISuN/rWbIN16mZjsbLvOC+bNjl/2g35FuT7WWJwtJ1dSFs43gkg3hs9vHkj
 69Qb43Ea2E3pF/qNV3wcMTlb/mIUNbpo00GXtxozuAHUXpxZ8bXkAdXELhXEn/RAPiu5
 cxkQ==
X-Gm-Message-State: AFuF++kYEq+O54+JdyrXXCMPidMpIVroydjsN11jGj7fcuGOgH281DLD
 nHNQrQGBK/iS0fPvYBHb0LmvMJIWPjUzvG3x8tjjxmvjFq3eMbK8oLKUXefapw==
X-Gm-Gg: AYBFou35C1OZZ4Zggrg9tOiTbB6vOOeQ0tecGpj40lULnhNsqb+NyEXrtgcWL9daldy
 a5gESoifqvlPFku2lJAey1t2lkEw1hTKInV6PiVBrc4hZoVF2oiO277jv5E5rho4JC7qmywN3Wa
 5bMYdJuVgeJSFsV8C9oGz+GaDD8rNa9trtkXTGIQyu4mXHS4webk2waYTP+AEU8ZgTT8VvmpLpq
 7hhkFWuI4MxSEWSwkejNLlMJxUKeNpveNt+JLd4k0Axo5rXyoYSWo/t25g9Nxjo2t+2qlrL01II
 +xpackzA2gHLp5Fc0FayQcFmoDlz5CiGRfwckKm4ykNShXoV3xTnaplnvmhG7IRazjOweEQ4hds
 PjX1Ie/vw1HUreNQv2Yn5CHyIHQvlP8/8S/o6fLak/4qANQhiGZHOd2HmxrWSLeOIZYeTOTEyfk
 iW0Glp+NJNiv1SjyLXWEQFajrsnIsGUoFe6q+ZSZhOxv8ARvxlula9Ey2XWumNhmZ87IzLz8lqu
 8iXX9eOgOIoav8as7V21GQvmQmoKME2HBMg3KyN7r6luYFypMQrhqSWg+1fW0RCko2m7o8wx+Vv
 2F7YXJajA7RMSNKI0wGiYAmAT82mWsyjW+OLrQT0ZampKWsbbYZOW3wlcsPs3n0cR5gfmNuYln9
 VC5ElpA0WwJylZZVLbQjahmyQ4N3bpGx7PtOXnaqCtbgH
X-Received: by 2002:a05:6830:700d:b0:821:8e71:1bb5 with SMTP id
 46e09a7af769-822821831e3mr10368996a34.14.1791145140661; 
 Sun, 04 Oct 2026 13:19:00 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a86abbesm10037861a34.24.2026.10.04.13.18.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2026 13:19:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Oct 2026 14:18:45 -0600
Message-ID: <20261004201853.915471-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pyqt5-sip: bump to version
 12.20.0
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
 Ralf Dragon <hypnotoad@lindra.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyqt5-sip/python-pyqt5-sip.hash | 4 ++--
 package/python-pyqt5-sip/python-pyqt5-sip.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyqt5-sip/python-pyqt5-sip.hash b/package/python-pyqt5-sip/python-pyqt5-sip.hash
index 65882779dc..d09a28a7bb 100644
--- a/package/python-pyqt5-sip/python-pyqt5-sip.hash
+++ b/package/python-pyqt5-sip/python-pyqt5-sip.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyqt5-sip/json
-md5  30996db30ec078362cce4920dafdd08b  pyqt5_sip-12.19.0.tar.gz
-sha256  71cacf1879da2cd3e50cb239e21673cfe02d358af70ab6768817c960428868c3  pyqt5_sip-12.19.0.tar.gz
+md5  0e5e480e619f926f1368f176838d4272  pyqt5_sip-12.20.0.tar.gz
+sha256  93e0622791f8d22cd4a32a29edfdd2ef6d6680f4c47f59b03ebf1c5da3c3e896  pyqt5_sip-12.20.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3e6f5b427c36f94ecf86bc01698af7030a1ed6eb3748110d5dbb8d142d804611  LICENSE
diff --git a/package/python-pyqt5-sip/python-pyqt5-sip.mk b/package/python-pyqt5-sip/python-pyqt5-sip.mk
index 74e1f28eb5..c4ff9746c2 100644
--- a/package/python-pyqt5-sip/python-pyqt5-sip.mk
+++ b/package/python-pyqt5-sip/python-pyqt5-sip.mk
@@ -14,8 +14,8 @@
 # recorded in the PyPI source file "sip.h", in the SIP_VERSION_STR
 # macro. For example, PyQt5-sip 12.15.0 was generated with Python-SIP
 # 6.8.6.
-PYTHON_PYQT5_SIP_VERSION = 12.19.0
-PYTHON_PYQT5_SIP_SITE = https://files.pythonhosted.org/packages/0d/9d/5179b8e619fe084218a87f963f1648cba4c5aa5bb98dd5661d2cbb9eb1e4
+PYTHON_PYQT5_SIP_VERSION = 12.20.0
+PYTHON_PYQT5_SIP_SITE = https://files.pythonhosted.org/packages/cd/ab/835df8e6fb06a618a4b8664765c5598e933c8113e90448e294549c9447f7
 PYTHON_PYQT5_SIP_SOURCE = pyqt5_sip-$(PYTHON_PYQT5_SIP_VERSION).tar.gz
 PYTHON_PYQT5_SIP_LICENSE = BSD-2-Clause
 PYTHON_PYQT5_SIP_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
