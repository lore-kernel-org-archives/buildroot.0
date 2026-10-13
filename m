Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 494F8CC6B1C
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 058FD607A9;
	Tue, 13 Oct 2026 20:42:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o2TLSUMWr6lx; Tue, 13 Oct 2026 20:42:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 040946072E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791924168;
	b=arxKWA05ckgEr25o+YeqGJGdy7h3SDvqs0MuD6sPXEZe3PfmwpS2Nuu0u3RaA5CF9kxD
	 Mv0PxlNSfjY782ah13xQrTb6zE/gw8qAVfD3MFXvePyX0jL08TG/u4pQbn9bcdLX+ey7O
	 mCieAB1EL2Q5S9wpqprfb+ZfWsa8YoMyAArTKzMVw2Qa9TATByCXospi5ggOkG9JX+MV6
	 liridyhTC+RwIcJYtt7hkXWuph0uJfwuUuK7U8/fQynASsgul99qkr5z5vYH3R9z9XSSq
	 97kEiRrFnTlJkEmFCadoKDzydXh6jBPPJK13pE8HmUtsXm68Udt+vuouL7MZTBb93Zg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791924168;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=P3hqKgOnXayJ3AFUbIFlldKwmtTnihaHh90nh/jdkDE=;
	b=S8JCZy1B+gRnqonCvVFcUWWZgYlx+KMZlUTCLSzp+xAjFiLxCXWeCj/E2wJSqMPy497W
	 8NvMtyB72Sre7/KNGUpttR8S1dgTlAIl0V5Xn7xhFMHujaPlh1WsFKgIm1lw7g6xfTxT+
	 kHCr6Bk1jVVWu2I0UW1bCBw7LfEAzVo0X1Npl4SFjFVZ4jvn/k+X/Xv0ZbCNtJLtk6W/Q
	 bfw44ehE1zoECepItqNQJsCJx9l0RRo7TuSc5pSik6IIy8um0PztBLUBXWGuRblds28IM
	 RDS3+CyJX53uuPYD/S7k4uJx31TXusHvwiFSnqJd6MJ++FQ858YGchFmOJo+iWXLsvQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WA5C5pBr;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791924168;
	bh=P3hqKgOnXayJ3AFUbIFlldKwmtTnihaHh90nh/jdkDE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=KCNWWz2it950U2frJvEfPUuDBbdE9pCF2R4G1OYv1aGaqSA6pqCaKr9L4kDSTvvnQ
	 zswb36I9eV1Hz+HI+p0Lf6bKbd3z1iJlhu6R3oljsBbpv78bSamsX/9kZdWoCEo3N5
	 eeez3jVCCuvHI+c1TvSJA55G2Yxnfdo6wQhuRoShb4x0DepSuKxo65kPIer+MzDVgs
	 fmJqdEpX0O2B0Q5pZIUFdZ/Ss/U1fu8fMoaWkIPPNp43ChWB5OawtHawwnkiMSaZYk
	 tjxyP21l+TsRrfx+o2C8e6uzDkg7v4IJRVvWhwn4II7GYY1enYsw8zSTIvzZmR5gjX
	 8m7DYy++zrdNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 040946072E;
	Tue, 13 Oct 2026 20:42:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4348B2AE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:42:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 34FA0607A9
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:42:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QsBhYInBPC-g for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:42:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4840E6072E
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::336"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791924164;
 b=gZAwawYbNU2iDv432RdV8nTCEX8NEHls33mouxAWLFY42BHZVc0pUb2JRzk3zl41KIXQ
 5/7Ah9ttwZtbUCL5VlWAvpjEWDpVHppdFmLMA9V6IClhlcMi841hSAobIxUAAWkBvcdCG
 AnY309zcVIzTrBLIWeiigGmqWrIMF6aC2ii6ZVmNcjmQ8iOaIau76SrCb9AvH7/CcBkoG
 165laSP++nUfS3hgz1n3kTghZj8xFdTRqxvVaw50itAFgsNdjWpri7exCTFzAop96knwp
 NJYjFq0Fpz1OY+mChhIx1JSbvGu5J4LBz8qlWWHYI+vjRD4VYGdgqJk4Z7VRxoUio+w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791924164;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=odgplNGBb2X6YmU0rlWAppNtpUVNQVgxZVrScvzWsa8=;
 b=saV2gZAjin4K8q5nSnmlu0YvtS0o3f2JwHFDJykpgAY9BxGwOt2JTpgCBaBA6QEGSr3/
 5Vld///089GdhFwLOLa+BoN+x8uy4StWr5xWAnIF7f1+1fNRYGP+B0aPQOeZ98Uf1itwz
 PIwof2JCMsF7CG6iCw2hdmF08hR1+umoXJJCCnFmYhZbZLfQK/PlKS4Pd9J9wHPa6oZgr
 BWBj0n/7wn/oFyViAgmSxu0RMoYTY+xWvm/7W3q7RQs4VolPWJGVuboGVO4z7Nx/K6qWM
 8+tS18FMJyAf6j5I7ghN/TCYS/p6VXjZLwv+p2Kgna4kl3GyctoBKu3L7UAGygakRwA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=WA5C5pBr; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::336; helo=mail-ot1-x336.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=WA5C5pBr
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4840E6072E
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:42:43 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-81579d03929so2381820a34.2
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 13:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791924163; x=1792528963; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=odgplNGBb2X6YmU0rlWAppNtpUVNQVgxZVrScvzWsa8=;
 b=WA5C5pBr/2VEQ1a8gcxiAq0X+KGWjWls4LGD5FewFN6iewSxGS/uGhLpulNOVszblL
 TczSLcogL0wcOuuBCCOFrgTut05d4CiYTF8jnvp9OwrTjrh24Cj2e6wELYl50KpLf5vd
 NCDcufn6cDRdWuMOefd2DcKxzuUKYpyZzkHY0ATTSOZIfK3USEn2GMGsDTErYF2nebQ5
 O7BCZPJ/INSHmRLO+Sc5h+6l6U8hcfE0AtCVp8bI4I3uElxLMIC/w4p0OCtc8OZnsFs4
 TOxCur45hzSQeBAUOR74MYaxicF8fpulaNiqnZSkZUEXb3BPOd14eOrThBIiusVR/MfR
 J+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791924163; x=1792528963;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=odgplNGBb2X6YmU0rlWAppNtpUVNQVgxZVrScvzWsa8=;
 b=xbu8zUpHh4xw0NfeIWLhLoY5BW/Jk9hmJWG+0lh8UXXrfyFb/lE7vscD4nXgOlmXz9
 +CAD78k9kiLoEtvpUD5hB8lxfgK0bEWaExXcUha9YqERB4KO0oq94liCgBxNz62RP0BS
 GPpXZfyiSa6QeaHOBOT2U/qkuu46AOq9bhsuAYIZOuou0ezt7VyuU7R8vcK4wYbuFqpt
 RVeugTEhtEy3g+FvDxvzTvvC3Z3wxj1/UcoHfJuQ69jh/j6uvuaYqV5Hh4l7y2l7lSHG
 aXMv2p+SahwSk3uk9/KVdGoEtBD4NLnzd/q6Yu05vZguxWOkW9SEznVn+Bu7iVGetiwo
 B/xw==
X-Gm-Message-State: AFq9FYL9dmPgLj6tXqf46n2VjdAWaV1EA+GvPb1h8JuhinKsWNMX9eOF
 mg2vlfSRvlTlxxvMOpQ6eBT/r3Lvhuqna95hHy5ZrEV6nCTmAP+D9oMFJfi1a47a
X-Gm-Gg: AYBFou2t1Xv2zq1iGEDEGywDDvnKAYNhwb0yJQ+FZyRpDlBIt21xgxygGw/RnIoqKTP
 5tJuQKD9xYkFcj7aL9AOyY+WicQLzUM23/60VeijLG5dpiRxrcZZG9kKNFktLKoYnClDfQddfX+
 vXKoQV+XPboVQx0h0XdERcrZ9s6oz8jDtgsBDAfi71wNEgRWzfQ5V/7gSlwyIQ0X1TRb67ZBfKS
 9ad2z1Hzsf2PSbVnmtHkLFLeRt8RW44OiPCkvCf9EUB0PlKqkJjH/tvgEVsOb8cmpM/YWqlwRie
 IoZ0ckzCTroApKUVDgjRp/D0N+/9v5QMSmBsE5MvL03/NQb/KjS788G8QuWEVf5w1u78R0lvyjA
 +GPVSmhzrHWkBaas1GYX+7rEPR65/SW814dEshZKx9xg7D9IxseXrddGnCVRLprU67gRFya79nA
 Uwhw0s9j/NXTvDAQ8cahuUdQxhkLCBdx1a4nqs8kP09Y/ys6nH4xrOqCnF8aCOz72iq+kRCqjKI
 fLmFnwak36ckGNZ1i3xfiGYuEyTUTxcDJeCl/26duyGYfKvPN4vb0KPYd7i9DZ1TCoH03uQrWIv
 F3e+JE3LaYHW7RBFeMpzygjUZiZpHI/oz1mytAOdZoEt3vvBBh1mrBHJ69gzOVcA1eb65PIf72m
 tw3kiSW54xrPZcUfGdxz4R825DaC2aw3A2zhLPGB8kw==
X-Received: by 2002:a05:6830:2a92:b0:80c:d30f:975 with SMTP id
 46e09a7af769-83096fa818bmr13674409a34.22.1791924162904; 
 Tue, 13 Oct 2026 13:42:42 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-83039076dc3sm14682914a34.14.2026.10.13.13.42.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 13:42:42 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 14:42:40 -0600
Message-ID: <20261013204240.2392493-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013204240.2392493-1-james.hilliard1@gmail.com>
References: <20261013204240.2392493-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/python-pydantic: bump to version
 2.14.1
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
 Manuel Diener <manuel.diener@oss.othermo.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pydantic/python-pydantic.hash | 4 ++--
 package/python-pydantic/python-pydantic.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydantic/python-pydantic.hash b/package/python-pydantic/python-pydantic.hash
index a818d02069..68ffab3df5 100644
--- a/package/python-pydantic/python-pydantic.hash
+++ b/package/python-pydantic/python-pydantic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic/json
-md5  38980d18ae9c2e8d54a2cdd46a46d40a  pydantic-2.13.5.tar.gz
-sha256  51a9c5f7b2f8e636f04c6cada605d9b6a3bf1348fdf945a3d8869b19bba0ee08  pydantic-2.13.5.tar.gz
+md5  d1d82b6afbe5cbed83544dd99a104c02  pydantic-2.14.1.tar.gz
+sha256  94f478203dd03404682a1ada216965651dd74b1d2d5ffd62e00e0837caab5c26  pydantic-2.14.1.tar.gz
 # Locally computed sha256 checksums
 sha256  a9e186f3ca16b5eef84318e7a701721351a00cb7b8ae3a4394b67b49e3529ef3  LICENSE
diff --git a/package/python-pydantic/python-pydantic.mk b/package/python-pydantic/python-pydantic.mk
index f9e1baef9a..0a48204cca 100644
--- a/package/python-pydantic/python-pydantic.mk
+++ b/package/python-pydantic/python-pydantic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_VERSION = 2.13.5
+PYTHON_PYDANTIC_VERSION = 2.14.1
 PYTHON_PYDANTIC_SOURCE = pydantic-$(PYTHON_PYDANTIC_VERSION).tar.gz
-PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/53/ef/fc4f868f4e2cee79f863883abffceff107875f569b848507319842d2a681
+PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/7c/0b/8e10b2e693af8ec54346a14caf36221334775975a747c9ceaa3f8371d96d
 PYTHON_PYDANTIC_SETUP_TYPE = hatch
 PYTHON_PYDANTIC_LICENSE = MIT
 PYTHON_PYDANTIC_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
