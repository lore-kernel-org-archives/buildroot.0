Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E86C7EE31
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 19:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 456646126F;
	Thu, 26 Jun 2025 19:55:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K-WbiTQyoeHj; Thu, 26 Jun 2025 19:55:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8471A61255
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8471A61255;
	Thu, 26 Jun 2025 19:55:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 166D410A
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:55:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 081744195E
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:55:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cFsxyF4JJbdM for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 19:55:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 201974195D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 201974195D
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 201974195D
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:55:43 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-45363645a8eso10327245e9.1
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 12:55:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750967742; x=1751572542;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aRri2hfl5Wq5NRrd9mCH1R88q5tpTQUmgqc/lK3VYSk=;
 b=Av6UM5tg1/fi/+zCt0ovn3DCKqzTnKt3lrwQtXz39L+w+z1802ZilySHoIRHwjmdeC
 8sJrrCFyvdOJIRQKtmIPdHz2qeq3NU4+pSIZmqSzog2+18ztwEQDZPTi9phRwl7Ayaaf
 ikpwKA4upJJQqsU8K+MKJEPgNcUgXB5aZH8KS58cuVB6nSTuBNcUWtayEXiEYT3rhYLo
 d8K4BrGsI7z0gnXXCXzFggI+sNhHC4TsAl5c6Yl/Wrk2TVAnm3+CT8wEpducsonrcaeL
 WGVMTUv4oSzqn0BVefBaWjSmBmBjpAVGmYuo1663VSyleeYwirjyfeUP+lCnPJS6i5pk
 FydQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXp0W7/dxU4JAXxm7DqlUpqrhYMbIy90e3LmIC2441R+GWNc7Tt2me43N2t0f+7pQYt2/OPPFH+JcY=@buildroot.org
X-Gm-Message-State: AOJu0YyXSTTVH7CMWbxpFReFcJOJRm4vzgb8EDDb+GoI9GXuNGW8oJCG
 VeF4GSY9F5h3yPEp99CvDXK9GakLWYIASlSkMl1O2nK6xSpuR5arYw32nDR/zNFCEy2k0bv/O+v
 4vBGN
X-Gm-Gg: ASbGnct28cM8YFvSxnYWs9Vthv9VrB+1ljIdYQMQp2SqZN6Q73HuEH77rCbmFbVZbvY
 xPllxE2h6J8AzZ4kTVdDNRjrQalzyi6G+OhDKtIbkH/GQxofT5B4ihrzLIcQpzL0BAP9gQkuUN0
 C9OHCsbm60VuQUX9HOWP/pgEVlW1Quru3T7siWR1dSKBfJClJYR5BajYrLTocp4LkyeCYsaqC7K
 lLgIjIbDFOyi5GFY4fPe0dd05S0mSAJ2++RBhtMJ+OT8f0L7hCIAEy3Kyqs/+R8PnAsEQA9ubeK
 /Ksr+3w2BYQO4z9ZUn2DNT8Mi9FuYqSGcZPq4/kwHftpoaL3tVLMouGz8fu4iITeV23+397VbMv
 v7cEfxOR4dxjIBze9M6G1yUZLHHO03Q2n
X-Google-Smtp-Source: AGHT+IGotHWzWNIKQxNdsjcigsnK/M80XJzMT9vunKnFb/SNGUEffh8TBsDODqOdPr4lngwa/MqQag==
X-Received: by 2002:a05:6000:2a87:b0:391:3aaf:1d5f with SMTP id
 ffacd0b85a97d-3a9008552e3mr618850f8f.52.1750967742061; 
 Thu, 26 Jun 2025 12:55:42 -0700 (PDT)
Received: from localhost.localdomain (94.105.118.175.dyn.edpnet.net.
 [94.105.118.175]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c80b5a3sm732253f8f.40.2025.06.26.12.55.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 12:55:41 -0700 (PDT)
To: Joseph Kogut <joseph.kogut@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 26 Jun 2025 21:55:06 +0200
Message-ID: <20250626195533.16044-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618-virglrenderer-upstream-v1-1-57525ac8406e@gmail.com>
References: <20250618-virglrenderer-upstream-v1-1-57525ac8406e@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750967742; x=1751572542; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aRri2hfl5Wq5NRrd9mCH1R88q5tpTQUmgqc/lK3VYSk=;
 b=JmvbH3RLjv9Llm5pXeYgSu5kUJC0uNMZtKg8poBTpiKRF5AsDTGJCJP4CFi8Ej91Kk
 l57kVTxV/5bxndITcKrL8tkXm2x/TNufXY7+q69yZbtrR6zG4nbZjPAPtVY/+ZBnINWs
 ZBkc3GWkzrxEKek5Z6PsQAnruCJXk6Cn8oFI2bs3A6ympqNdqxFJoyiFjyQW7Lt501yT
 O6yb6izp+HcXXmg+aOlZ3yzaCJ3DxzTNOl7BIrXGDyum5/nSXAXQrb5Tsu3lSZZhHdFt
 rAb4XXT+E9jLwR0lyVjFmkfunfkQxLGZiqSpFSCOGf4lwA7H+Y64aKv4gZcN6JMc1OsF
 j9Cw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JmvbH3RL
Subject: Re: [Buildroot] [PATCH 1/3] package/python-glslang: bump to version
 15.3.0
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gU2VlIGNoYW5nZWxvZyBodHRwczovL2dpdGh1Yi5jb20vS2hyb25vc0dy
b3VwL2dsc2xhbmcvYmxvYi9tYWluL0NIQU5HRVMubWQKPiAKPiBGaXhlcyBidWlsZCBpc3N1ZTog
ZXJyb3I6IOKAmHVpbnQzMl904oCZIGhhcyBub3QgYmVlbiBkZWNsYXJlZCwgZW5jb3VudGVyZWQK
PiBvbiBHQ0MgdjE1LCBjYXVzZWQgYnkgY3N0ZGludCBub3QgYmVpbmcgaW1wbGljaXRseSBpbmNs
dWRlZC4KPiAKPiBodHRwczovL2J1Z3MuZ2VudG9vLm9yZy85MzcyNjEKPiAKPiBTaWduZWQtb2Zm
LWJ5OiBKb3NlcGggS29ndXQgPGpvc2VwaC5rb2d1dEBnbWFpbC5jb20+CgpBcHBsaWVkIHRvIDIw
MjUuMDUueC4gVGhhbmtzCgo+IC0tLQo+ICBwYWNrYWdlL3B5dGhvbi1nbHNsYW5nL3B5dGhvbi1n
bHNsYW5nLmhhc2ggfCAyICstCj4gIHBhY2thZ2UvcHl0aG9uLWdsc2xhbmcvcHl0aG9uLWdsc2xh
bmcubWsgICB8IDUgKysrKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLWdsc2xhbmcvcHl0
aG9uLWdsc2xhbmcuaGFzaCBiL3BhY2thZ2UvcHl0aG9uLWdsc2xhbmcvcHl0aG9uLWdsc2xhbmcu
aGFzaAo+IGluZGV4IGRmOTEyNzkzOWVmOWQ2MmRjM2E1ZWFmY2Q3MDAwYzRlY2FjMjY4NjYuLjA0
ZWM1MzEzYTBjNDdiNGJhNzJlNGNhYzczYTk5NjE0ZWM2ZTMxZGIgMTAwNjQ0Cj4gLS0tIGEvcGFj
a2FnZS9weXRob24tZ2xzbGFuZy9weXRob24tZ2xzbGFuZy5oYXNoCj4gKysrIGIvcGFja2FnZS9w
eXRob24tZ2xzbGFuZy9weXRob24tZ2xzbGFuZy5oYXNoCj4gQEAgLTEsMyArMSwzIEBACj4gICMg
TG9jYWxseSBjYWxjdWxhdGVkCj4gLXNoYTI1NiAgNTkyYzk4YWViMDNiM2U4MTU5N2RkYWY4MzYz
M2M0ZTYzMDY4ZDE0YjE4YTc2NmZkMTEwMzNiYWQ3MzEyNzE2MiAgcHl0aG9uLWdsc2xhbmctMTEu
MTMuMC50YXIuZ3oKPiArc2hhMjU2ICBjNmMyMWZlMTg3M2MzN2U2MzlhNmE5YWM3MmQ4NTdhYjYz
YTViZTY4OTNhNTg5ZjM0ZTA5YTZjNzU3MTc0MjAxICBweXRob24tZ2xzbGFuZy0xNS4zLjAudGFy
Lmd6Cj4gIHNoYTI1NiAgYWRiNzgzZTczNGU5MDZkMWY0NmRiNWRmMjk5OTFkYmRlODRiZGIwY2Vh
YjUwMmFjMmZlYmI0NGZlM2MyYjVmNCAgTElDRU5TRS50eHQKPiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9weXRob24tZ2xzbGFuZy9weXRob24tZ2xzbGFuZy5tayBiL3BhY2thZ2UvcHl0aG9uLWdsc2xh
bmcvcHl0aG9uLWdsc2xhbmcubWsKPiBpbmRleCA5NGY0ODBlMzBhMWJjY2MzMmYwZDAyZTFmMDBl
ZTQ4OWE5MTkwNGNiLi41OTQ0ZWJkYjJjMThhYzk0OGU0Mjk1ZWFiODg2YmI0NmNlNGRmYWUzIDEw
MDY0NAo+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLWdsc2xhbmcvcHl0aG9uLWdsc2xhbmcubWsKPiAr
KysgYi9wYWNrYWdlL3B5dGhvbi1nbHNsYW5nL3B5dGhvbi1nbHNsYW5nLm1rCj4gQEAgLTQsMTAg
KzQsMTMgQEAKPiAgIwo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAKPiAtUFlUSE9OX0dM
U0xBTkdfVkVSU0lPTiA9IDExLjEzLjAKPiArUFlUSE9OX0dMU0xBTkdfVkVSU0lPTiA9IDE1LjMu
MAo+ICBQWVRIT05fR0xTTEFOR19TSVRFID0gJChjYWxsIGdpdGh1YixLaHJvbm9zR3JvdXAsZ2xz
bGFuZywkKFBZVEhPTl9HTFNMQU5HX1ZFUlNJT04pKQo+ICBQWVRIT05fR0xTTEFOR19MSUNFTlNF
ID0gQlNELTMtQ2xhdXNlCj4gIFBZVEhPTl9HTFNMQU5HX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNF
LnR4dAo+ICBQWVRIT05fR0xTTEFOR19ERVBFTkRFTkNJRVMgPSBob3N0LXB5dGhvbjMKPiArSE9T
VF9QWVRIT05fR0xTTEFOR19ERVBFTkRFTkNJRVMgKz0gaG9zdC1zcGlydi10b29scwo+ICsKPiAr
SE9TVF9QWVRIT05fR0xTTEFOR19DT05GX09QVFMgKz0gLURBTExPV19FWFRFUk5BTF9TUElSVl9U
T09MUz0xCj4gIAo+ICAkKGV2YWwgJChob3N0LWNtYWtlLXBhY2thZ2UpKQo+IAo+IC0tIAo+IDIu
NTAuMAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
