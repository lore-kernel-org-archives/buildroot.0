Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C050DC369AB
	for <buildroot@archiver.kernel.org>; Thu, 24 Apr 2025 10:25:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7094483AE4;
	Thu, 24 Apr 2025 10:25:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GXLMBtcS7SGe; Thu, 24 Apr 2025 10:25:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B475983AE5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B475983AE5;
	Thu, 24 Apr 2025 10:25:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 98B46EC
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 10:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B359405BF
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 10:25:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a8E1l_UtrIpb for <buildroot@buildroot.org>;
 Thu, 24 Apr 2025 10:25:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1D2D04012A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D2D04012A
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1D2D04012A
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 10:25:08 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-39ee682e0ddso515971f8f.1
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 03:25:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745490307; x=1746095107;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uT+ckNvh22Im0a25mAQwK3u8x8df8MNKRbRGiRXYTfQ=;
 b=HSo7TMQX8YXPPwPM2/fL5GBIU9vsO8X2DhCO/GTh/8FpnuPLdCj+nXfgtGNpsmdE0g
 KvApS8Ra3Op0eUo9+3QzdyUkTyvGVwrYIBrjmm6oc8sDKBpkHdlJpWuSKyPHmPYPNDZL
 bVmfPphyIik7VQuAUQMtjZIgxzgflOmIDHgWTvOhKIvNqXfGCNhWyuzRW0dWT10+JwXt
 NtGlACBG/3gw1yUxj//JwcKGBvlxV1gHOEH8YpyYTE4PYrEEomeIiasaZx7VYqu2OcR8
 i/OiQgp1ATZNmMu7O4ezw5xf97teRFz6emrCVrKt47B5dssSKJe2d0fYtIBS9bMA5ZwJ
 h0kQ==
X-Gm-Message-State: AOJu0YynxdUPTBgebofdSW/lnrnwVIs20tb63w81qBGMwvtYZ9k4Orze
 y40mclLvIVWuR6+cFsttF+tehF6JnD9Jwq4SAhYsKCWurkKGj1B//dW2f5hJoLCMFeCP6Cri6E4
 qRO4=
X-Gm-Gg: ASbGncvnVT8ClpAny4HIZVfXhGU28MrY87bM1qDxgZErJmG0C809h8L0ToqSmmLu3m3
 Ng1Z6gNAF9FcKm7kt+0dTOVCP4WwAl838TkF3Cy+excE32gP5+hqB3g7e71Qg0/r5h9mMBK78c+
 8DIFVqsFlxJFNswx1Mm5QG3cNV2yAuGKDXV8+SUUr38wvOSnPf6wBvYzj8oJ2LUvqPgBSP3jzTK
 RZ/adVlSdXuh/tqHtn1tfvjtx2/mSxPbLZbxFG6/jmfeC0ACPh1brL0C8xtR3L2jGiy2DMwy/WK
 foJDOV1wZKIu5WmaUFov0M8hcX4DlConvY2IPpy+AxsdNFajCBrFEwTUp5Pjk/Ixpg6i5ILWph6
 grtQHC7v/mGO2keS63xBgtdXdc7U=
X-Google-Smtp-Source: AGHT+IHS+FjuTXGGoSbyM3zbeasMnmdGRB9WWltKJUiCAxV5LQTppW0DuZxzfps2B6ROBbMFJZ3qnA==
X-Received: by 2002:a05:6000:228a:b0:39a:c6c1:3408 with SMTP id
 ffacd0b85a97d-3a06cfa2eeamr1419149f8f.37.1745490306818; 
 Thu, 24 Apr 2025 03:25:06 -0700 (PDT)
Received: from mind2.local.ess-mail.com (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a06d4be673sm1587087f8f.23.2025.04.24.03.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 03:25:06 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Romain Naour <romain.naour@gmail.com>
Date: Thu, 24 Apr 2025 10:24:32 +0000
Message-Id: <20250424102435.963312-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1745490307; x=1746095107; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uT+ckNvh22Im0a25mAQwK3u8x8df8MNKRbRGiRXYTfQ=;
 b=QsaPasB4TEPfQfl8A+oOjgZadVLcsKRh6bWKKqMp24UPcCMH7N48dP+Ov36PMZln4n
 IXU/NIlMGo2J3R1DX067IOMw12prY1wlnPIRHTpTOjeA+qxshWiDAgMuwv5hAdZ4/fis
 bIQND6WbgazjKmD6MEcfOeU2MQhVDiZP1xWSiAHWZjUHMZjN3yNhFQJkNZ5oGEhdfEyc
 8i6eA+7PSzfLqJcEyoBXJOGwcToh/zSy5D26e00fOGxsqiHkwWGjy78llnUgh77Fq4S9
 3gVGlcdtf9dcFaWXeadAxpbcs/UDb0vwZ+owjS4J8SBur6zznHk5NGHPofykKdA4yhpl
 FPWg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=QsaPasB4
Subject: [Buildroot] [PATCH 1/1] package/bcc: bump to version 0.34.0
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UmVsZWFzZSBub3RlczogaHR0cHM6Ly9naXRodWIuY29tL2lvdmlzb3IvYmNjL3JlbGVhc2VzL3Rh
Zy92MC4zNC4wCgpUaGUgJ3Rlc3RzLnBhY2thZ2UudGVzdF9iY2MnIHRlc3Qocykgd2VyZSBydW4g
YW5kIHBhc3NlZC4KClNpZ25lZC1vZmYtYnk6IFJhcGhhw6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1l
bG90dGVAbWluZC5iZT4KLS0tCiBwYWNrYWdlL2JjYy9iY2MuaGFzaCB8IDIgKy0KIHBhY2thZ2Uv
YmNjL2JjYy5tayAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9iY2MvYmNjLmhhc2ggYi9wYWNrYWdl
L2JjYy9iY2MuaGFzaAppbmRleCA3ZWQxNjRlZGEwLi5lMDUzZDdjMzY3IDEwMDY0NAotLS0gYS9w
YWNrYWdlL2JjYy9iY2MuaGFzaAorKysgYi9wYWNrYWdlL2JjYy9iY2MuaGFzaApAQCAtMSwzICsx
LDMgQEAKICMgbG9jYWxseSBjYWxjdWxhdGVkCi1zaGEyNTYgIDU2NDFiMWRiMGI5ZWM2MGE2YWZk
NjdiNDYwN2M3OTBmNDllNTgwYzIwNzYzOGJiNGViY2VhMjgwNWM2ZjM3M2IgIGJjYy12MC4zMS4w
LWdpdDQudGFyLmd6CitzaGEyNTYgIDU4ZTYzNGI4ZGNkZGYxZjhmMzU4ZTZlNGU1MTgyYWQ1Nzk5
OWMzYWIxN2NjOTEzZTBiZjg2YWYxNTcwODk1NDQgIGJjYy12MC4zNC4wLWdpdDQudGFyLmd6CiBz
aGEyNTYgIGI0MDkzMGJiY2Y4MDc0NGM4NmM0NmExMmJjOWRhMDU2NjQxZDcyMjcxNmMzNzhmNTY1
OWI5ZTU1NWVmODMzZTEgIExJQ0VOU0UudHh0CmRpZmYgLS1naXQgYS9wYWNrYWdlL2JjYy9iY2Mu
bWsgYi9wYWNrYWdlL2JjYy9iY2MubWsKaW5kZXggZDVkNzJhYTljMC4uZjMzZmJjYmQzOCAxMDA2
NDQKLS0tIGEvcGFja2FnZS9iY2MvYmNjLm1rCisrKyBiL3BhY2thZ2UvYmNjL2JjYy5tawpAQCAt
NCw3ICs0LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLUJDQ19WRVJTSU9OID0g
djAuMzEuMAorQkNDX1ZFUlNJT04gPSB2MC4zNC4wCiBCQ0NfU0lURSA9IGh0dHBzOi8vZ2l0aHVi
LmNvbS9pb3Zpc29yL2JjYwogQkNDX1NJVEVfTUVUSE9EID0gZ2l0CiBCQ0NfR0lUX1NVQk1PRFVM
RVMgPSBZRVMKLS0gCjIuMzQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
