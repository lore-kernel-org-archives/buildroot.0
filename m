Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 612FAC5478C
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 18:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DE2D406CD;
	Wed, 28 Feb 2024 18:15:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1DRGAxXfCDnB; Wed, 28 Feb 2024 18:15:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C43B40558
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C43B40558;
	Wed, 28 Feb 2024 18:15:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E5E331BF3D5
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 18:14:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E014A8264C
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 18:14:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QlmkwWyVlOou for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 18:14:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=sairon@sairon.cz; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DFB8280BAB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFB8280BAB
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DFB8280BAB
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 18:14:48 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-56454c695e6so88618a12.0
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 10:14:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709144087; x=1709748887;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s1zFP8iNKX3+JXcAjV6Z36cYwHjLL/CuIL6yQ5a7Ez8=;
 b=ZFqXiHwW+tkC6FdJudC/KezqKziNYW+dQG/YXFDdtKoEEqcN3pltCH1ZuLpPCD0rkx
 GHlc6vnsWGBuDVjP5YY7uch7ReTXFUFYCrwFG8FGLYvohrlLd1aophrgIxYn15+TVj/G
 FzQk8gOtif2OwOFtaJ4xUrVxu20QZsa47MHiOteNu6gF2UATbIRRp+y8Afn4kzWE2enj
 VIyIfV13i8ktAacVmeT8wF3MJ/YaN6u7C19wkffMaTpt47xo1HxPf3JgEEoKiWCo3BN0
 g7sVejbSRLIJPhmJPrtQ/HKSjCigJ7JzH3s9M2lfL5ADoPwTTTQsjS7AEw2L9lxh2FBF
 8/1A==
X-Gm-Message-State: AOJu0YxJN63nrfp+0BBEG6d/zZcUDTgrAYRJjIETqZ+3BnqkLc/ybhZM
 wzb0aS6TxaVu6u28o55pQ1cyFOtZlIovkXcMMvkoLUH2Jck8iRoQ6SQujJ98MTJ4WO0J06x7Xwm
 dCGE=
X-Google-Smtp-Source: AGHT+IGE0iqxgdVu4uou12BFUeauj44KcbWMU7Bv+od+9OpV86nTaXHn8l5uVKN/U99DN9L0NZEcrg==
X-Received: by 2002:a05:6402:3901:b0:566:78ff:b24e with SMTP id
 fe1-20020a056402390100b0056678ffb24emr181764edb.17.1709144086747; 
 Wed, 28 Feb 2024 10:14:46 -0800 (PST)
Received: from krabice.lan (ip-89-103-66-201.bb.vodafone.cz. [89.103.66.201])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a50d7d2000000b00564e4debe29sm2105658edj.78.2024.02.28.10.14.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Feb 2024 10:14:46 -0800 (PST)
From: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 19:14:08 +0100
Message-Id: <20240228181409.3756293-1-sairon@sairon.cz>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sairon.cz; s=google; t=1709144087; x=1709748887; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=s1zFP8iNKX3+JXcAjV6Z36cYwHjLL/CuIL6yQ5a7Ez8=;
 b=eeEVoyDwEwAVB5bGvh2cSaOrqjwc/INIJapMsuHYzvEyS3OVPlKkms0fNIodva38xO
 POjgzM8olKQzFqOLAax5eZboUV9Xg3jIgw6L7TIQAgfaGVarAXLoK1+/YZVWlrvON1kb
 b+MSd//mYzI1t8md+Hl4S+T9pIjc4TxjswlvZE+j2ZFgQ+fRjprrawZbVDwIhpjrLQBF
 LWsnAAe7q1JNeTsRkYWDMNOUGDuTU8bxND3d0bmSAKBLxrfKmTBDYzD+gMh8JPEJFBlY
 BAJ01/d7Nxmbau5zeh+qwp47Muxq9kLMduuoPFDqlCLJJ9Wc3prmMZVO48NH3zSv4vVE
 cvRA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=sairon.cz
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=sairon.cz header.i=@sairon.cz header.a=rsa-sha256
 header.s=google header.b=eeEVoyDw
Subject: [Buildroot] [PATCH] package/nfs-utils: only install fsidd binary
 and unit file with enabled nfsd
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
Cc: Petr Vorel <petr.vorel@gmail.com>,
 =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VW5pdCBmaWxlIGZvciB0aGUgRlNJRCBkYWVtb24gZGVwZW5kcyBvbiB0aGUgbmZzLXNlcnZlci5z
ZXJ2aWNlLCB3aGljaCBpcwpyZW1vdmVkIHdpdGhvdXQgQlIyX1BBQ0tBR0VfTkZTX1VUSUxTX1JQ
Q19ORlNEIGVuYWJsZWQuIEFsc28gZG9uJ3QgaW5zdGFsbAp0aGUgZnNpZGQgc2VydmljZSBiaW5h
cnkgd2l0aG91dCBuZnNkIGVuYWJsZWQuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gxIxlcm3DoWsgPHNh
aXJvbkBzYWlyb24uY3o+Ci0tLQogcGFja2FnZS9uZnMtdXRpbHMvbmZzLXV0aWxzLm1rIHwgMyAr
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9wYWNrYWdlL25mcy11dGlscy9uZnMtdXRpbHMubWsgYi9wYWNrYWdlL25mcy11dGls
cy9uZnMtdXRpbHMubWsKaW5kZXggNGYyYjQxYzc4Mi4uYjc1N2UzZTUxZCAxMDA2NDQKLS0tIGEv
cGFja2FnZS9uZnMtdXRpbHMvbmZzLXV0aWxzLm1rCisrKyBiL3BhY2thZ2UvbmZzLXV0aWxzL25m
cy11dGlscy5tawpAQCAtNDIsNyArNDIsOCBAQCBORlNfVVRJTFNfVEFSR0VUU18kKEJSMl9QQUNL
QUdFX05GU19VVElMU19SUENERUJVRykgKz0gdXNyL3NiaW4vcnBjZGVidWcKIE5GU19VVElMU19U
QVJHRVRTXyQoQlIyX1BBQ0tBR0VfTkZTX1VUSUxTX1JQQ19MT0NLRCkgKz0gdXNyL3NiaW4vcnBj
LmxvY2tkCiBORlNfVVRJTFNfVEFSR0VUU18kKEJSMl9QQUNLQUdFX05GU19VVElMU19SUENfUlFV
T1RBRCkgKz0gdXNyL3NiaW4vcnBjLnJxdW90YWQKIE5GU19VVElMU19UQVJHRVRTXyQoQlIyX1BB
Q0tBR0VfTkZTX1VUSUxTX1JQQ19ORlNEKSArPSB1c3Ivc2Jpbi9leHBvcnRmcyBcCi0JdXNyL3Ni
aW4vcnBjLm1vdW50ZCB1c3Ivc2Jpbi9ycGMubmZzZCB1c3IvbGliL3N5c3RlbWQvc3lzdGVtL25m
cy1zZXJ2ZXIuc2VydmljZQorCXVzci9zYmluL3JwYy5tb3VudGQgdXNyL3NiaW4vcnBjLm5mc2Qg
dXNyL2xpYi9zeXN0ZW1kL3N5c3RlbS9uZnMtc2VydmVyLnNlcnZpY2UgXAorCXVzci9zYmluL2Zz
aWRkIHVzci9saWIvc3lzdGVtZC9zeXN0ZW0vZnNpZGQuc2VydmljZQogCiBpZmVxICgkKEJSMl9Q
QUNLQUdFX05GU19VVElMU19ORlNWNCkseSkKIE5GU19VVElMU19DT05GX09QVFMgKz0gLS1lbmFi
bGUtbmZzdjQgLS1lbmFibGUtbmZzdjQxCi0tIAoyLjM0LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
