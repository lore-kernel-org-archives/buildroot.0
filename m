Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C7EC30653
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 08:29:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C642840806;
	Wed,  3 Jul 2024 08:29:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IMGzm6-D01XU; Wed,  3 Jul 2024 08:29:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AF0540879
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AF0540879;
	Wed,  3 Jul 2024 08:29:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2BE001BF2EC
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 08:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 18FDA60A54
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 08:29:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZxrLOIr8EwDz for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 08:29:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=sairon@sairon.cz; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EE5C5607E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE5C5607E1
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EE5C5607E1
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 08:29:16 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-58b0dddab8cso3431727a12.0
 for <buildroot@buildroot.org>; Wed, 03 Jul 2024 01:29:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719995355; x=1720600155;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Eowaibl9qhOeOLkwH4SCtwg3okNhiDAuVib/JkcSXlE=;
 b=IL5lUJ17Y3touDUbI0730bnxCLTdX9t4v+FIMzsgcgsakUZ4pX2ptr6a03IvK8UVUw
 Q8oCcgBGxRa5b9icVLoKuqI9sP6W6AfJIkmwOMv+CnHy2+ogOV9pGaflc1TTgpr1h6Q5
 g4pCqgWd3C6dvTS7lyJ1Ea1Q+P8KAQxuZ6dendvV04f5c2hvMNKHUhnvHgYSV7PDvKat
 tCqxan5KuOco3iCeLe4Ll6AWPVpRTssywmoH7Mi9m0X+TPOyn1vv0OFtlMwRvUPva/jj
 6HIyIdFygYQQoltJq8rkjADb8LQNvNz+GmBubTD6cH8EpmgOAyKYO+13B5k2DLLgkEjc
 9mvA==
X-Gm-Message-State: AOJu0Yz5FPjCpzi4dTwdNCSRJ+bEkQOvCutyFSB1N+qlzjyCG3Rh/xXp
 acNudSo/D2l4MDC15iHIeplxXIsEqutPvOMdMIviR8MgiUeHmDs3m2YyMTpmNoJzQ/ZqE6YVV+q
 2
X-Google-Smtp-Source: AGHT+IG87rf1l0g9H+bZK/H5hN+f+h8OAIp4S+iPGDsKEEB/9C/lQ29nQy+tbjgGhTT/Wrc0rMRQyg==
X-Received: by 2002:a05:6402:11d1:b0:57d:17c3:a593 with SMTP id
 4fb4d7f45d1cf-5879f983dbdmr7198662a12.22.1719995351603; 
 Wed, 03 Jul 2024 01:29:11 -0700 (PDT)
Received: from krabice.lan (ip-89-103-66-201.bb.vodafone.cz. [89.103.66.201])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5861324f0a3sm6725115a12.35.2024.07.03.01.29.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 01:29:11 -0700 (PDT)
From: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
To: buildroot@buildroot.org
Date: Wed,  3 Jul 2024 10:28:47 +0200
Message-Id: <20240703082850.750420-2-sairon@sairon.cz>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240703082850.750420-1-sairon@sairon.cz>
References: <20240703082850.750420-1-sairon@sairon.cz>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sairon.cz; s=google; t=1719995355; x=1720600155; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Eowaibl9qhOeOLkwH4SCtwg3okNhiDAuVib/JkcSXlE=;
 b=HzPZJnRATzzVEPEA5zNfaTauipZJa+w7evfdCbxuA8eg6Vzvs3MKIF2LY2fQH3EG7m
 sr40hmK+LUwuKwS1zydr6490wcQsRlCjO9giWt/TckUQxOweNf3HtPriO17k/noLJzG3
 I5pH/GNDXi/pImnpeYyy751DaTDcTWP0CYtbNjkbNsFCsmn2mDomoRa88tJ5rB4sNInS
 tREOkXVjydRTSfaUehoyunqcZErJs8HEsf1fhLYBrAjfOS4reSCDxkDdt1EiqvPkT6tZ
 Qvjp/5/LtwIUSdPcG/gq5bViBefjeE+SphE7M3YjOOcGL04TuFQ+umHQCz3/e5U7G1JR
 pxQA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=sairon.cz
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=sairon.cz header.i=@sairon.cz header.a=rsa-sha256
 header.s=google header.b=HzPZJnRA
Subject: [Buildroot] [PATCH 1/4] package/erofs-utils: bump to 1.7.1
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

U2lnbmVkLW9mZi1ieTogSmFuIMSMZXJtw6FrIDxzYWlyb25Ac2Fpcm9uLmN6PgotLS0KIHBhY2th
Z2UvZXJvZnMtdXRpbHMvZXJvZnMtdXRpbHMuaGFzaCB8IDIgKy0KIHBhY2thZ2UvZXJvZnMtdXRp
bHMvZXJvZnMtdXRpbHMubWsgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZXJvZnMtdXRpbHMvZXJv
ZnMtdXRpbHMuaGFzaCBiL3BhY2thZ2UvZXJvZnMtdXRpbHMvZXJvZnMtdXRpbHMuaGFzaAppbmRl
eCBhMDNhMGQ1YTdkLi4wNjNkMzg0NTExIDEwMDY0NAotLS0gYS9wYWNrYWdlL2Vyb2ZzLXV0aWxz
L2Vyb2ZzLXV0aWxzLmhhc2gKKysrIGIvcGFja2FnZS9lcm9mcy11dGlscy9lcm9mcy11dGlscy5o
YXNoCkBAIC0xLDUgKzEsNSBAQAogIyBMb2NhbGx5IGNvbXB1dGVkCi1zaGEyNTYgIDIzMTBmYTQz
NzdiNTY2YmY5NDNlOGVlZjk5MmRiMzk5MGY3NTk1MjhkNTk3M2U3MDBlZmUzZTRjYjExNWVjMjMg
IGVyb2ZzLXV0aWxzLTEuNS50YXIuZ3oKK3NoYTI1NiAgMTk2MDgzZDYzZTVlMjMxZmI1Nzk5ZTdj
ZTg2YTk0NGJiY2E1NjRkYWFiY2UzZGU5MjI1YThhY2E5ZGNhZmYxNSAgZXJvZnMtdXRpbHMtMS43
LjEudGFyLmd6CiBzaGEyNTYgIDBkZjA0MmRlMjliNDQ4ODczNTVkYjg2Yzc5NzA4YTQ0ODljZTZl
NjY2NmY2ZTMzYWQwMjA0MDI5M2YwOWU2YTIgIENPUFlJTkcKIHNoYTI1NiAgYTQwMGY4NWRkMDZk
MjMwZjFiMzA4Y2RlNDI5MGE1M2YzNDViNmUzMjBhMzc2Yjc5MDRiMzFjNTFjMmZkNGIxYSAgTElD
RU5TRVMvQXBhY2hlLTIuMAogc2hhMjU2ICBmZWVlM2IzMTU3ZGNkZjc4ZDRmNTBlZGVmYmQ1ZGQ3
YWRmOGI2ZDUyYzExYmZhYWE3NDZhODVhMzczMjU2NzEzICBMSUNFTlNFUy9HUEwtMi4wCmRpZmYg
LS1naXQgYS9wYWNrYWdlL2Vyb2ZzLXV0aWxzL2Vyb2ZzLXV0aWxzLm1rIGIvcGFja2FnZS9lcm9m
cy11dGlscy9lcm9mcy11dGlscy5tawppbmRleCBkZjRjNjUyZDMwLi4wYWVkOTliYTc2IDEwMDY0
NAotLS0gYS9wYWNrYWdlL2Vyb2ZzLXV0aWxzL2Vyb2ZzLXV0aWxzLm1rCisrKyBiL3BhY2thZ2Uv
ZXJvZnMtdXRpbHMvZXJvZnMtdXRpbHMubWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIwogCi1FUk9GU19VVElMU19WRVJTSU9OID0gMS41CitFUk9GU19VVElMU19W
RVJTSU9OID0gMS43LjEKIEVST0ZTX1VUSUxTX1NJVEUgPSBodHRwczovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC94aWFuZy9lcm9mcy11dGlscy5naXQvc25hcHNob3QK
IEVST0ZTX1VUSUxTX0xJQ0VOU0UgPSBHUEwtMi4wKywgR1BMLTIuMCsgb3IgQXBhY2hlLTIuMCAo
bGliZXJvZnMpCiBFUk9GU19VVElMU19MSUNFTlNFX0ZJTEVTID0gQ09QWUlORyBMSUNFTlNFUy9B
cGFjaGUtMi4wIExJQ0VOU0VTL0dQTC0yLjAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
