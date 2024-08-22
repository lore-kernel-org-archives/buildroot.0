Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BBDEC3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 13:02:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9F1860E0F;
	Thu, 22 Aug 2024 13:02:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PRvu1s9bI3DH; Thu, 22 Aug 2024 13:02:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D0A960DE5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D0A960DE5;
	Thu, 22 Aug 2024 13:02:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C6C9B1BF3DF
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 13:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4AEB60B25
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 13:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4-APl1H852h9 for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 13:02:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B578560641
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B578560641
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B578560641
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 13:02:26 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5a10835487fso1358699a12.1
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 06:02:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724331744; x=1724936544;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vdE90vPPELMWmZA+/181r2H3Fe258AT5Qte2Dd7Gr2U=;
 b=g2a4COMteWVcnq/B35BxjWR+towfZD2IwaklSO/XH5rtnk0wC9+XcmB5gieOWrTUJU
 DCcsOGUUcr6jEaHMHEVRsHNOZT0192ca3aNcUOncUGBZedzIkfSngAQbqjoPBXWU9qhq
 NIDuwWZ+9w7sxgoqb3ANV78xwCGC5JibDkZeNi2F0jji8nz/LRhuykrQbNYnMLYbU4q/
 OkPumVQ/Lc3zdXkLcpg7zJl5x9rlvmBZQ+HFKd8DqOb8oBCQC8VfR7/HCz2+TssQE1r9
 p2NdxOGiQu055jj4sm1+gerY1duSKfGWSSULJSfT10AcbSfWdkVwfQRjBBXVdEtCPfMg
 B7Pg==
X-Gm-Message-State: AOJu0YyS65+klBkvEOg2kFvtymM4bc/IXRhuRZci9RESDufY6IapaxPg
 T+2BaKTMBhPuRPyxEILz7tnULY0U4yTup+FcdMbzSrpPPs2Sb8wlJydTdCeMCY1DqySmSFddqrr
 d
X-Google-Smtp-Source: AGHT+IFaEmFeREOkL3t0c9JzTJdwMFw0iITOCaxgyTWvP1RIZ3vG6k0FcEXZ82/I91LUFxZmFjSo+w==
X-Received: by 2002:a17:907:e690:b0:a7a:abd8:77ae with SMTP id
 a640c23a62f3a-a866f0fd2e5mr465643166b.7.1724331743633; 
 Thu, 22 Aug 2024 06:02:23 -0700 (PDT)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f220324sm118753766b.44.2024.08.22.06.02.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 06:02:23 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 651FA5F94B;
 Thu, 22 Aug 2024 14:02:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Thu, 22 Aug 2024 14:02:19 +0100
Message-Id: <20240822130220.4135741-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822130220.4135741-1-alex.bennee@linaro.org>
References: <20240822130220.4135741-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724331744; x=1724936544; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vdE90vPPELMWmZA+/181r2H3Fe258AT5Qte2Dd7Gr2U=;
 b=Po6ea4DCVA351kW/C8AxgxfEhMJG6kly+28akm5kQb7+lU+3iiOdAUc7oiyBPcfrLs
 yj+YVmvf7Wf8IbMxojKHu9au0f0svStU/N6nR6k9+GjO79pZFjC3iMpz5tfDZ67kGy09
 36QCejpbCKJ4cTeqIbsC8+rfyMRoR7EEaFELHEQsvFm7xsa1WkIpFpIF+xFvfi0q2SdC
 ldXA95z9jLuzd4dc0Jmxr8faZwk5PoTuMgxPlZGkF3WOIgJtViJ+R5u3HXgP5y2eXtBa
 InepTuItcRcHjgyBFbtlWZ9+SmFc43Jmpvz/V51exTD+JaNngEmr16kf/MJU0YiK6l03
 6yVw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Po6ea4DC
Subject: [Buildroot] [PATCH 3/4] board/qemu: add post-build script to
 aarch64_virt_defconfig
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBpcyBpbiBhaWQgb2Ygc3VwcG9ydGluZyBnZXR0eSBvbiBmYmNvbi4KClNpZ25lZC1vZmYt
Ynk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4KLS0tCiBib2FyZC9xZW11
L3Bvc3QtYnVpbGQuc2ggICAgICAgICAgICB8IDE2ICsrKysrKysrKysrKysrKysKIGNvbmZpZ3Mv
cWVtdV9hYXJjaDY0X3ZpcnRfZGVmY29uZmlnIHwgIDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAxNyBp
bnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA3NTUgYm9hcmQvcWVtdS9wb3N0LWJ1aWxkLnNo
CgpkaWZmIC0tZ2l0IGEvYm9hcmQvcWVtdS9wb3N0LWJ1aWxkLnNoIGIvYm9hcmQvcWVtdS9wb3N0
LWJ1aWxkLnNoCm5ldyBmaWxlIG1vZGUgMTAwNzU1CmluZGV4IDAwMDAwMDAwMDAuLjczMDI2ZTU5
MjIKLS0tIC9kZXYvbnVsbAorKysgYi9ib2FyZC9xZW11L3Bvc3QtYnVpbGQuc2gKQEAgLTAsMCAr
MSwxNiBAQAorIyEvYmluL3NoCisKK3NldCAtdQorc2V0IC1lCisKKyMgQWRkIGEgY29uc29sZSBv
biB0dHkxCitpZiBbIC1lICR7VEFSR0VUX0RJUn0vZXRjL2luaXR0YWIgXTsgdGhlbgorICAgIGdy
ZXAgLXFFICdedHR5MTo6JyAke1RBUkdFVF9ESVJ9L2V0Yy9pbml0dGFiIHx8IFwKKwlzZWQgLWkg
Jy9HRU5FUklDX1NFUklBTC9hXAordHR5MTo6cmVzcGF3bjovc2Jpbi9nZXR0eSAtTCAgdHR5MSAw
IHZ0MTAwICMgSERNSSBjb25zb2xlJyAke1RBUkdFVF9ESVJ9L2V0Yy9pbml0dGFiCisjIHN5c3Rl
bWQgZG9lc24ndCB1c2UgL2V0Yy9pbml0dGFiLCBlbmFibGUgZ2V0dHkudHR5MS5zZXJ2aWNlIGlu
c3RlYWQKK2VsaWYgWyAtZCAke1RBUkdFVF9ESVJ9L2V0Yy9zeXN0ZW1kIF07IHRoZW4KKyAgICBt
a2RpciAtcCAiJHtUQVJHRVRfRElSfS9ldGMvc3lzdGVtZC9zeXN0ZW0vZ2V0dHkudGFyZ2V0Lndh
bnRzIgorICAgIGxuIC1zZiAvbGliL3N5c3RlbWQvc3lzdGVtL2dldHR5QC5zZXJ2aWNlIFwKKyAg
ICAgICAiJHtUQVJHRVRfRElSfS9ldGMvc3lzdGVtZC9zeXN0ZW0vZ2V0dHkudGFyZ2V0LndhbnRz
L2dldHR5QHR0eTEuc2VydmljZSIKK2ZpCmRpZmYgLS1naXQgYS9jb25maWdzL3FlbXVfYWFyY2g2
NF92aXJ0X2RlZmNvbmZpZyBiL2NvbmZpZ3MvcWVtdV9hYXJjaDY0X3ZpcnRfZGVmY29uZmlnCmlu
ZGV4IDMwZWNmMDRjYWMuLjQ1ZjdmYzc1ZWIgMTAwNjQ0Ci0tLSBhL2NvbmZpZ3MvcWVtdV9hYXJj
aDY0X3ZpcnRfZGVmY29uZmlnCisrKyBiL2NvbmZpZ3MvcWVtdV9hYXJjaDY0X3ZpcnRfZGVmY29u
ZmlnCkBAIC0xNSw2ICsxNSw3IEBAIEJSMl9UQVJHRVRfUk9PVEZTX0VYVDJfND15CiAjIEJSMl9U
QVJHRVRfUk9PVEZTX1RBUiBpcyBub3Qgc2V0CiAKICMgSW1hZ2UKK0JSMl9ST09URlNfUE9TVF9C
VUlMRF9TQ1JJUFQ9ImJvYXJkL3FlbXUvcG9zdC1idWlsZC5zaCIKIEJSMl9ST09URlNfUE9TVF9J
TUFHRV9TQ1JJUFQ9ImJvYXJkL3FlbXUvcG9zdC1pbWFnZS5zaCIKIEJSMl9ST09URlNfUE9TVF9T
Q1JJUFRfQVJHUz0iJChCUjJfREVGQ09ORklHKSIKIAotLSAKMi4zOS4yCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
