Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B1BC4167B
	for <buildroot@archiver.kernel.org>; Tue, 28 Nov 2023 13:43:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38D7B41488;
	Tue, 28 Nov 2023 13:43:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38D7B41488
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kit2V6vxzhIr; Tue, 28 Nov 2023 13:43:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 929FF4097E;
	Tue, 28 Nov 2023 13:43:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 929FF4097E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BE6531BF94D
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 13:43:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 982268188D
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 13:43:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 982268188D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6wTxlBQq5gC4 for <buildroot@lists.busybox.net>;
 Tue, 28 Nov 2023 13:43:41 +0000 (UTC)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 90C548188B
 for <buildroot@buildroot.org>; Tue, 28 Nov 2023 13:43:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90C548188B
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1d001e4cf7cso3564365ad.2
 for <buildroot@buildroot.org>; Tue, 28 Nov 2023 05:43:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701179021; x=1701783821;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wS+flWyR3exiQB5xQ+x6Qbf+J4/IsLK8BY36n7KN+8M=;
 b=OCeSC3lSmWOMAfurDIkiqrzPVDCpl3JJXT1v2kz9YmURhSOAkNYEbrCcSkBLc2bn8m
 ID1V60/HurWj5F6jfs3nYFK0R4plnxoCerKHdG3hfp01dE5qsZSYVeoA8VUS6xSu3JWz
 bi+I5BAdbB1PiOH2Q+V/ln17MGTHPnKNOmRBFdkr4sBxLRm/pBUPvhhpA3dRyk0T55P+
 7/miHR5/j+adQKSuJn7mBJoqfDkjLcSxMmAkohwYiiIbWPLEmWu3AD/+WzpWkeU+VQ8u
 zkk65b96hyuQrjKPS2olZhAP9Wiv9qa+xj631p4lP3LMuvfTI5pQOZiKL71A4UGawfRL
 cz4Q==
X-Gm-Message-State: AOJu0YyKfDRHrU7Cm27WTE7KB/ETzCVeLlyFjVP8Ki03zlutIT2YHI/2
 wLWDvQjjSJCdES91vC3M6fw9969SRaQYZQ35odxo0w==
X-Google-Smtp-Source: AGHT+IFR5E2HW+J5Y2okc9bFOqx47vZ2J+afTOqUNWF1deYI5o+Q55KV2n5JTte4vZtx+K73t0sXIQ==
X-Received: by 2002:a17:902:bb8f:b0:1cf:8c88:51cb with SMTP id
 m15-20020a170902bb8f00b001cf8c8851cbmr13390445pls.62.1701179020778; 
 Tue, 28 Nov 2023 05:43:40 -0800 (PST)
Received: from alesmao.newtesc.com ([187.120.6.114])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a17090301c400b001cf5cb82358sm10277305plh.14.2023.11.28.05.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Nov 2023 05:43:40 -0800 (PST)
From: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
To: buildroot@buildroot.org
Date: Tue, 28 Nov 2023 10:43:01 -0300
Message-ID: <20231128134301.6018-2-flavio.tapajos@newtesc.com.br>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231128134301.6018-1-flavio.tapajos@newtesc.com.br>
References: <20231128134301.6018-1-flavio.tapajos@newtesc.com.br>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1701179021; x=1701783821;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wS+flWyR3exiQB5xQ+x6Qbf+J4/IsLK8BY36n7KN+8M=;
 b=Vj6usgcMb6IdPwl1phpiy5ao6/ePLsAD/T6HzHZVtEHK5Lx1cebCcarObul8DrAOip
 Zi/Lvnbiv5oNBMJjXXn+k16XUEuv6+gRWrbTAiX4swj9Adk+6Ga9SrQnFKqIH8rZCz91
 6sBAaqqSDF/6G4Aez10tzpYN2+sHVgNrKR2iBn879svlgC0trEw3/PWXiAch1kOjR0kU
 7ZBb+E3ldfOR6mTOvhv9zdByBAj4X5P+BFz246iX/aVgsX6Ze5DwviQLboZ2BN0n/PO1
 bep/EZMBJWZcaIxOlXAVz+LVgKvi+y2i8fggqzctmWQrkBrQ/tWUutNA8Sl0vw+f/fLJ
 ttGA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=Vj6usgcM
Subject: [Buildroot] [PATCH 2/2] package/rsyslog: add libdbi-drivers
 optional dependency
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
Cc: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TmVlZGVkIGluIG9yZGVyIHRvIHVzZSBvbWxpYmRiaSBtb2R1bGUKClNpZ25lZC1vZmYtYnk6IEZs
w6F2aW8gVGFwYWrDs3MgPGZsYXZpby50YXBham9zQG5ld3Rlc2MuY29tLmJyPgotLS0KIHBhY2th
Z2UvcnN5c2xvZy9Db25maWcuaW4gIHwgMSArCiBwYWNrYWdlL3JzeXNsb2cvcnN5c2xvZy5tayB8
IDcgKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9wYWNrYWdlL3JzeXNsb2cvQ29uZmlnLmluIGIvcGFja2FnZS9yc3lzbG9nL0NvbmZpZy5pbgpp
bmRleCAzYmEzMjYxOTFhLi5lMDdkYjgxOGUyIDEwMDY0NAotLS0gYS9wYWNrYWdlL3JzeXNsb2cv
Q29uZmlnLmluCisrKyBiL3BhY2thZ2UvcnN5c2xvZy9Db25maWcuaW4KQEAgLTEzLDYgKzEzLDcg
QEAgY29uZmlnIEJSMl9QQUNLQUdFX1JTWVNMT0cKIAlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCRVNU
UgogCXNlbGVjdCBCUjJfUEFDS0FHRV9MSUJMT0dHSU5HCiAJc2VsZWN0IEJSMl9QQUNLQUdFX0xJ
QkZBU1RKU09OCisJc2VsZWN0IEJSMl9QQUNLQUdFX0xJQkRCSV9EUklWRVJTCiAJaGVscAogCSAg
UnN5c2xvZyBpcyBhIHBvd2VyZnVsIGFuZCBmbGV4aWJsZSBzeXNsb2cgaW1wbGVtZW50YXRpb24K
IApkaWZmIC0tZ2l0IGEvcGFja2FnZS9yc3lzbG9nL3JzeXNsb2cubWsgYi9wYWNrYWdlL3JzeXNs
b2cvcnN5c2xvZy5tawppbmRleCBjZjlmMmMwZTc5Li44ZWE5MmVhNzg1IDEwMDY0NAotLS0gYS9w
YWNrYWdlL3JzeXNsb2cvcnN5c2xvZy5taworKysgYi9wYWNrYWdlL3JzeXNsb2cvcnN5c2xvZy5t
awpAQCAtMTUxLDYgKzE1MSwxMyBAQCBSU1lTTE9HX0NPTkZfT1BUUyArPSBcCiAJLS1kaXNhYmxl
LW9tam91cm5hbAogZW5kaWYKIAoraWZlcSAoJChCUjJfUEFDS0FHRV9MSUJEQklfRFJJVkVSUyks
eSkKK1JTWVNMT0dfQ09ORl9PUFRTICs9IC0tZW5hYmxlLWxpYmRiaQorUlNZU0xPR19ERVBFTkRF
TkNJRVMgKz0gbGliZGJpLWRyaXZlcnMKK2Vsc2UKK1JTWVNMT0dfQ09ORl9PUFRTICs9IC0tZGlz
YWJsZS1saWJkYmkKK2VuZGlmCisKIGRlZmluZSBSU1lTTE9HX0lOU1RBTExfSU5JVF9TWVNURU1E
CiAJJChJTlNUQUxMKSAtbSAwNjQ0IC1EIHBhY2thZ2UvcnN5c2xvZy9yc3lzbG9nLnNlcnZpY2Ug
XAogCQkkKFRBUkdFVF9ESVIpL3Vzci9saWIvc3lzdGVtZC9zeXN0ZW0vcnN5c2xvZy5zZXJ2aWNl
Ci0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
