Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B77C5478C
	for <buildroot@archiver.kernel.org>; Fri, 23 Feb 2024 16:58:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1C6F6062D;
	Fri, 23 Feb 2024 16:58:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A8E_p-iU8nzb; Fri, 23 Feb 2024 16:58:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E33B960A62
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E33B960A62;
	Fri, 23 Feb 2024 16:58:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 019DE1BF405
 for <buildroot@lists.busybox.net>; Fri, 23 Feb 2024 16:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2CFB81FAE
 for <buildroot@lists.busybox.net>; Fri, 23 Feb 2024 16:57:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BIQ947ORPcH4 for <buildroot@lists.busybox.net>;
 Fri, 23 Feb 2024 16:57:58 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com;
 envelope-from=flavio.tapajos@newtesc.com.br; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B382181F6E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B382181F6E
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B382181F6E
 for <buildroot@buildroot.org>; Fri, 23 Feb 2024 16:57:56 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-6e48eef8be5so758987b3a.1
 for <buildroot@buildroot.org>; Fri, 23 Feb 2024 08:57:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708707476; x=1709312276;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1D6DxNlWXVywf3/ZywxW2olkNnWyen0QDjiXYxvNcOw=;
 b=e3zTjsXV4AgTaAE4aHy0nh4tbJCAeOMNEl0zLvgyPVpBRTK9YxJrhcHDnTravIvvoE
 y5kVIiwQXDvXd2jurCb12iP1tfOgllfzhJwXUG/ZnrOnk69jSb07/yESEOn/gK/fTqIr
 ZX0sKnSbO2vMa4pN6L0w7IITdA2HKB+Cq79KuPgFEZIFoW8MwSATgedLtLs7FCZ2K9nM
 EaTUK0jefiLLThX+wZPgOr/P1o5iBpVMVX+p87AebwtCxlaqYCfKbzWsQczC+JlM1HU5
 gd25CuTtqWrbeccSt8sislL5AnGQ6x9hWQ39fGueFiK4diT5xv6cdgKrZx/3qzBiBgji
 eL5Q==
X-Gm-Message-State: AOJu0YxRio3kH2CAe6X0tWmu7nIfRXbHxgMIwFGlg+L8WD0BZbVeI8fC
 Eq7Zdza/3geGp1tJuvlekzaBQPGMhH5nVTq0+nGhH9ZKWostQBnLV/5szfcQjwt/xRGvEMqIhlv
 e8BE=
X-Google-Smtp-Source: AGHT+IHik5HADGir/cAPifFqdxKtW9uUrQr1HfqWINBU6cq/gdi8x8XkWQLXMZQu0NlQsdL0x9n4Hg==
X-Received: by 2002:a05:6a00:1e0f:b0:6e4:c4f5:ef44 with SMTP id
 gx15-20020a056a001e0f00b006e4c4f5ef44mr353482pfb.34.1708707475875; 
 Fri, 23 Feb 2024 08:57:55 -0800 (PST)
Received: from alesmao.newtesc.com ([187.120.6.114])
 by smtp.gmail.com with ESMTPSA id
 n28-20020a056a000d5c00b006e477b4a16csm8080731pfv.44.2024.02.23.08.57.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Feb 2024 08:57:55 -0800 (PST)
From: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
To: buildroot@buildroot.org
Date: Fri, 23 Feb 2024 13:57:47 -0300
Message-ID: <20240223165747.1231616-1-flavio.tapajos@newtesc.com.br>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1708707476; x=1709312276;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1D6DxNlWXVywf3/ZywxW2olkNnWyen0QDjiXYxvNcOw=;
 b=ARe3/nax7f6bNWPo0obX1sEDF3qaT8sy9Van3QrWSsB1bq5/sI3H8xX6kObLKNd1V4
 EtpRYyxsi+vop4sbtOiEV0Xk7qmnTl97VcNWPezkFyhgYGqHTizGW7Fw/WxhBINaf3dQ
 rqv7HsJl4brrmoSxvghHTRWED3jRjz47Rwwmnrz+8X+e253XCGL9C8nauLcZT1eqAfSl
 ujEEPSXXn8UxdkoagN0DfoBk6zJMTceMF9znJ08z0mKd9MGll+L4nr4JDmixoFVok5c1
 eRRHGkV4dzfiAfJZH0qmLiUlyyKlj8vYn/jz1ZcG4ISHth3TwnZil55hPFVqp9OICJLW
 5nFw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=newtesc.com.br
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=ARe3/nax
Subject: [Buildroot] [PATCH 1/1] configs/asus_tinker-s_rk3288_defconfig:
 bump kernel to 6.1.79
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

bGF0ZXN0IGtlcm5lbCBMVFMgKDYuNi54KSBpcyBmYWNpbmcgcHJvYmxlbXMgd2l0aCB0aGUgc2Rj
YXJkCgpTaWduZWQtb2ZmLWJ5OiBGbMOhdmlvIFRhcGFqw7NzIDxmbGF2aW8udGFwYWpvc0BuZXd0
ZXNjLmNvbS5icj4KLS0tCiBjb25maWdzL2FzdXNfdGlua2VyLXNfcmszMjg4X2RlZmNvbmZpZyB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL2NvbmZpZ3MvYXN1c190aW5rZXItc19yazMyODhfZGVmY29uZmlnIGIvY29uZmln
cy9hc3VzX3Rpbmtlci1zX3JrMzI4OF9kZWZjb25maWcKaW5kZXggZGUwMzMzNmNiYi4uMmVkMmM0
ZjcxMiAxMDA2NDQKLS0tIGEvY29uZmlncy9hc3VzX3Rpbmtlci1zX3JrMzI4OF9kZWZjb25maWcK
KysrIGIvY29uZmlncy9hc3VzX3Rpbmtlci1zX3JrMzI4OF9kZWZjb25maWcKQEAgLTIzLDcgKzIz
LDcgQEAgQlIyX1RBUkdFVF9VQk9PVF9TUExfTkFNRT0ic3BsL3UtYm9vdC1zcGwtZHRiLmJpbiB0
cGwvdS1ib290LXRwbC5iaW4iCiAjIEtlcm5lbAogQlIyX0xJTlVYX0tFUk5FTD15CiBCUjJfTElO
VVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OPXkKLUJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJ
T05fVkFMVUU9IjYuMS43MiIKK0JSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9
IjYuMS43OSIKIEJSMl9MSU5VWF9LRVJORUxfREVGQ09ORklHPSJtdWx0aV92NyIKIEJSMl9MSU5V
WF9LRVJORUxfRFRTX1NVUFBPUlQ9eQogQlIyX0xJTlVYX0tFUk5FTF9JTlRSRUVfRFRTX05BTUU9
InJrMzI4OC10aW5rZXItcyIKLS0gCjIuNDMuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
