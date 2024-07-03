Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 195FAC2BD09
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 08:29:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6646441741;
	Wed,  3 Jul 2024 08:29:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CWNrhjOru9Yr; Wed,  3 Jul 2024 08:29:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D15241718
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D15241718;
	Wed,  3 Jul 2024 08:29:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5B5581BF2EC
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 08:29:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54DE040259
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 08:29:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gJkIDebMWY2U for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 08:29:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=sairon@sairon.cz; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 26F924020B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26F924020B
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 26F924020B
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 08:29:19 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-57d05e0017aso3200218a12.1
 for <buildroot@buildroot.org>; Wed, 03 Jul 2024 01:29:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719995358; x=1720600158;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EFod/ogih+BOxGhIfZPmZjltWOWggcLKurgiwqbCo9U=;
 b=iiDVeGo3PX6neSoL7E3vlakPblQPGJNsy5TYgOTaDLGMWg8Y32ndK15l2gh9OyzTBF
 eZee+oPmV+yrecXDx9lYfTZdSyo85UnxIRkM5bqDxvxpD1RZAM/4CXu5llFjhHguyaZA
 K4ep6gajgr/hpkBvmtqlzyjnUq2inHMxs8Mvri3WNw4FKug6OncXJH4STqDl7i5zuP4Q
 JGmbAHqmS3sSZk+Kk5L+lDstIQT/5pxV1SiAXFGvZFmIb5WgvkhSrYOYPyBdA87ZN6BQ
 zy4sumIAAKL6A7mxIOYNlAkzFLUoqr/8MaNLF2ijMQu/2i9vqtMjBbxKW7SqigMj0icp
 97IA==
X-Gm-Message-State: AOJu0YyHRhRBv+98uq9GTDSuA8J70LskNHxagYMi8FEApS18ttMzA3eL
 6d2Y4mCX59Q4aR+v5MD5/hlEThuy7G/xsAxIfxbigSbqsQ7GP1B0OXnZUs7ta+uUmVonxYx+8s6
 R
X-Google-Smtp-Source: AGHT+IHfVhEU0huTTBL8c8CnvOXavWjcbFQgZ7g0SRnasKafiYOzp1P/iVRBJ+HpMXfnhcvoETUmbw==
X-Received: by 2002:a05:6402:4405:b0:58c:7c2f:5c0b with SMTP id
 4fb4d7f45d1cf-58c7c2f5ea7mr1272212a12.25.1719995358052; 
 Wed, 03 Jul 2024 01:29:18 -0700 (PDT)
Received: from krabice.lan (ip-89-103-66-201.bb.vodafone.cz. [89.103.66.201])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5861324f0a3sm6725115a12.35.2024.07.03.01.29.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 01:29:17 -0700 (PDT)
From: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
To: buildroot@buildroot.org
Date: Wed,  3 Jul 2024 10:28:48 +0200
Message-Id: <20240703082850.750420-3-sairon@sairon.cz>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240703082850.750420-1-sairon@sairon.cz>
References: <20240703082850.750420-1-sairon@sairon.cz>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sairon.cz; s=google; t=1719995358; x=1720600158; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EFod/ogih+BOxGhIfZPmZjltWOWggcLKurgiwqbCo9U=;
 b=bImz3IG5iCh2wQN1VwbfHsKLYBvJV9EwmgL3OT/HrwPlzpvSV3MMZWEL8dvvws1f9a
 V5ZcL3ALjeQ48EtbP8iRHE0GFB0wp6N3BGGw2a4GHrPzVjJBI6YRe5K5qRV77SJRPpoU
 c6RauoicLNdIdrqQHe0wfp1O8m5YfEWhW93R31jnWsVmMLhNaaP76l4cPabNBeXpOMBA
 VSWqAKivhwQMHmTcZMyp+frfuffNOWj0gXkhWOtY11aT2RYFL2jhiUuWS0rWhceimGtE
 QOyiQGKOvp/GUpfgPuOfolDicfivZgJMBl7ZQLl8JexvcEyIxt1Bp7QK35/ILBwcnBrR
 oD0A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=sairon.cz
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=sairon.cz header.i=@sairon.cz
 header.a=rsa-sha256 header.s=google header.b=bImz3IG5
Subject: [Buildroot] [PATCH 2/4] package/erofs-utils: add config option for
 LZMA compression
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
Cc: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>,
 Gao Xiang <hsiangkao@aol.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ICogRW5hYmxlZCBMWk1BIGNvbXByZXNzaW9uIGZvciBob3N0IGJ1aWxkLgogKiBBZGRlZCBvcHRp
b24gZm9yIExaTUEgc3VwcG9ydCBvbiB0YXJnZXQuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gxIxlcm3D
oWsgPHNhaXJvbkBzYWlyb24uY3o+Ci0tLQogcGFja2FnZS9lcm9mcy11dGlscy9Db25maWcuaW4g
ICAgICB8ICA2ICsrKysrKwogcGFja2FnZS9lcm9mcy11dGlscy9lcm9mcy11dGlscy5tayB8IDEx
ICsrKysrKysrKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9lcm9mcy11dGlscy9Db25maWcuaW4gYi9wYWNr
YWdlL2Vyb2ZzLXV0aWxzL0NvbmZpZy5pbgppbmRleCA5ZDlhYTE1OWMwLi4yODRiMmNkMDU5IDEw
MDY0NAotLS0gYS9wYWNrYWdlL2Vyb2ZzLXV0aWxzL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL2Vy
b2ZzLXV0aWxzL0NvbmZpZy5pbgpAQCAtMTUsNiArMTUsMTIgQEAgY29uZmlnIEJSMl9QQUNLQUdF
X0VST0ZTX1VUSUxTX0xaNAogCWhlbHAKIAkgIFN1cHBvcnQgTFo0IGNvbXByZXNzaW9uIGFsZ29y
aXRobQogCitjb25maWcgQlIyX1BBQ0tBR0VfRVJPRlNfVVRJTFNfTFpNQQorCWJvb2wgImx6bWEg
c3VwcG9ydCIKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfWFoKKwloZWxwCisJICBTdXBwb3J0IExaTUEg
Y29tcHJlc3Npb24gYWxnb3JpdGhtCisKIGNvbmZpZyBCUjJfUEFDS0FHRV9FUk9GU19VVElMU19F
Uk9GU0ZVU0UKIAlib29sICJlcm9mc2Z1c2Ugc3VwcG9ydCIKIAlkZXBlbmRzIG9uIEJSMl9VU0Vf
TU1VICMgbGliZnVzZQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9lcm9mcy11dGlscy9lcm9mcy11dGls
cy5tayBiL3BhY2thZ2UvZXJvZnMtdXRpbHMvZXJvZnMtdXRpbHMubWsKaW5kZXggMGFlZDk5YmE3
Ni4uZmJmNzc5NTU4MyAxMDA2NDQKLS0tIGEvcGFja2FnZS9lcm9mcy11dGlscy9lcm9mcy11dGls
cy5taworKysgYi9wYWNrYWdlL2Vyb2ZzLXV0aWxzL2Vyb2ZzLXV0aWxzLm1rCkBAIC0yMSw2ICsy
MSwxMyBAQCBlbHNlCiBFUk9GU19VVElMU19DT05GX09QVFMgKz0gLS1kaXNhYmxlLWx6NAogZW5k
aWYKIAoraWZlcSAoJChCUjJfUEFDS0FHRV9FUk9GU19VVElMU19MWk1BKSx5KQorRVJPRlNfVVRJ
TFNfREVQRU5ERU5DSUVTICs9IHh6CitFUk9GU19VVElMU19DT05GX09QVFMgKz0gLS1lbmFibGUt
bHptYQorZWxzZQorRVJPRlNfVVRJTFNfQ09ORl9PUFRTICs9IC0tZGlzYWJsZS1sem1hCitlbmRp
ZgorCiBpZmVxICgkKEJSMl9QQUNLQUdFX0xJQlNFTElOVVgpLHkpCiBFUk9GU19VVElMU19DT05G
X09QVFMgKz0gLS13aXRoLXNlbGludXgKIEVST0ZTX1VUSUxTX0RFUEVOREVOQ0lFUyArPSBsaWJz
ZWxpbnV4CkBAIC0zNSw4ICs0Miw4IEBAIGVsc2UKIEVST0ZTX1VUSUxTX0NPTkZfT1BUUyArPSAt
LWRpc2FibGUtZnVzZQogZW5kaWYKIAotSE9TVF9FUk9GU19VVElMU19ERVBFTkRFTkNJRVMgPSBo
b3N0LXBrZ2NvbmYgaG9zdC11dGlsLWxpbnV4IGhvc3QtbHo0Ci1IT1NUX0VST0ZTX1VUSUxTX0NP
TkZfT1BUUyArPSAtLWVuYWJsZS1sejQgLS1kaXNhYmxlLWZ1c2UgLS13aXRob3V0LXNlbGludXgK
K0hPU1RfRVJPRlNfVVRJTFNfREVQRU5ERU5DSUVTID0gaG9zdC1wa2djb25mIGhvc3QtdXRpbC1s
aW51eCBob3N0LWx6NCBob3N0LXh6CitIT1NUX0VST0ZTX1VUSUxTX0NPTkZfT1BUUyArPSAtLWVu
YWJsZS1sejQgLS1lbmFibGUtbHptYSAtLWRpc2FibGUtZnVzZSAtLXdpdGhvdXQtc2VsaW51eAog
CiAkKGV2YWwgJChhdXRvdG9vbHMtcGFja2FnZSkpCiAkKGV2YWwgJChob3N0LWF1dG90b29scy1w
YWNrYWdlKSkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
