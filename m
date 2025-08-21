Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D85CA0EEB
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6012761C8E;
	Thu, 21 Aug 2025 19:21:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ISs8VU5oCzm6; Thu, 21 Aug 2025 19:21:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C4EF61C86
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C4EF61C86;
	Thu, 21 Aug 2025 19:21:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CC281C7
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 338DD40CF0
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v4d775LZZJnW for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:21:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5D8C340B3A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D8C340B3A
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D8C340B3A
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:20 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-45a1b0c52f3so8510635e9.3
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 12:21:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755804078; x=1756408878;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Bt1M1NFKRfmTE28W+Be/2hTNK0bmARA7mgXAAtRFRc=;
 b=uN+Nx1lOE5OKaCnkAMlqCqeOGJ6G4PjcMZAYzMY+FpzElMXYc7Xi3de41o5qxctDNY
 /Ehvjc2kUtD45fOZ0Aeq0S3W8ON0XgaQHuIvHyzZkIRROyWPrI2LD4649WasadBSm7Zd
 oQKE+O7C04KpMw3uKwJlM+W71QUPnkmjX3zdd8pR4A+TsDAfnPYG4r5+tT2S0uMe15jj
 vZn3se9vqxuQm5HHw6v273xuNWRjcXcOgXCIJjPx22lbggEffInWjKsgW3techgZpaFp
 3z+T5S1pLi6ETLMqrc6CNrUtxo4/nvtg5HHEvkY2Mq/GuOEHsSRaD91bO1F/cMiV4DGR
 cLKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXY03/LqyYREbg+jV551d49mQoUSlP9K4IFumB0mVDPqpdK5Gd0eJF3HZzIc7M273gGfw4BIN2kKE=@buildroot.org
X-Gm-Message-State: AOJu0Ywa3IUHYuxZeVY7NfLxmHL+mkIzIM3+a8XJnVDbwHEEISGhFnBX
 FebYWE0VmPJkjkLy8e4ui5PT20g4nVecWgEUG/p5BItT+DfYEQszGlYY5wemiyFZHG8=
X-Gm-Gg: ASbGncsqtXrQ9kJEJktY3/gDIZ1wexS4t4b/zBmAV3Tfy7AeuUYk81PbviJnrxCMzsq
 jCFccb407Zh125/LNCZ5gU8dM6tejY+I1Sp89kup8elhQchSfgUTrY7di6cq1fhuslre8of5kId
 y9woAPhV+d1ehhSicKWCkMjiSs8Gqp+F4DpbKlh4HGHvP971p1XC5qoYculQLzS6XuaCc+kZvrK
 XFDBJHqmx7u8/tkpnOdERF9x797RbF2LI8PwGW8wy+mR7MMwW4nZURRjb14Vc5jSXjxggoo2rJa
 +omc4AICnbhYGy5qqSS94Qx12XLRGlJmruyjEMnO/Lt0Kd1WfkgF1IRmFRTC/mN8FJB+zHIvka0
 ljcf4HiACqcu26w==
X-Google-Smtp-Source: AGHT+IG1k03ZXTaNd4HSKjSRnxRCXT/BSPSbRlJXF2Z4sSVUCE4LgwpsUkbCpPUy8L9ExZZS36WXdw==
X-Received: by 2002:a05:600c:4e90:b0:450:d37d:7c with SMTP id
 5b1f17b1804b1-45b517cb8b3mr1876895e9.21.1755804078323; 
 Thu, 21 Aug 2025 12:21:18 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c396bf0f0asm7079233f8f.28.2025.08.21.12.21.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 12:21:18 -0700 (PDT)
To: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 21 Aug 2025 21:21:10 +0200
Message-ID: <20250821192117.24338-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250814-python-numpy-fix-build-cyhton-v1-1-849f0bb9524d@armadeus.com>
References: <20250814-python-numpy-fix-build-cyhton-v1-1-849f0bb9524d@armadeus.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755804078; x=1756408878; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Bt1M1NFKRfmTE28W+Be/2hTNK0bmARA7mgXAAtRFRc=;
 b=E/G/5RCKikvrNHqnBsHo+TN33W7UJeTfDQmGsjPNUdPwZjY2XXQBodkIEp5HMkQqAz
 FCiXRoaoJP1iJsEV89F6du03Sho7k51p5aeNQJSXf+2hQz6SQYRsUrB83vUKYCVlhcpP
 bkvLb5bg0tgDfrc80Z2j0eFOgZi+LJZ5x/J43QyQ3fbPshaTbtQCbuN8Xr4droBxQCjP
 8fVRTsMGksuCpy5eVVPq8BqukuL58mp0zvXUaAvJ29fkla6DLGykJGxHBxcrfTZlM1Qn
 ZztbEzZDOJVEyDgmut2zjRizJp5PCYayW4ca2mjtj32LT4HjQH/K6qs+wzlYPoPmaJcf
 NHOQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=E/G/5RCK
Subject: Re: [Buildroot] [PATCH] package/python-numpy: fix build with
 python-cython >= 3.1
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

SW4gcmVwbHkgb2Y6Cj4gU2luY2UgY29tbWl0IGI1MzZjYWFlYzBkOCAoInBhY2thZ2UvcHl0aG9u
LWN5dGhvbjogYnVtcCB0byB2ZXJzaW9uCj4gMy4xLjIiKSwgcHl0aG9uLW51bXB5IGZhaWxzIHRv
IGJ1aWxkOgo+IAo+IEVycm9yIGNvbXBpbGluZyBDeXRob24gZmlsZToKPiAtLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAuLi4KPiAg
ICAgICAgICAgICAgICAgbnAuaXNzdWJkdHlwZShjb3YuZHR5cGUsIG5wLmNvbXBsZXhmbG9hdGlu
ZykpOgo+ICAgICAgICAgICAgIHJhaXNlIFR5cGVFcnJvcigibWVhbiBhbmQgY292IG11c3Qgbm90
IGJlIGNvbXBsZXgiKQo+ICAgICAgICAgaWYgc2l6ZSBpcyBOb25lOgo+ICAgICAgICAgICAgIHNo
YXBlID0gW10KPiAgICAgICAgIGVsaWYgaXNpbnN0YW5jZShzaXplLCAoaW50LCBsb25nLCBucC5p
bnRlZ2VyKSk6Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgo+IC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+
IG51bXB5L3JhbmRvbS9fZ2VuZXJhdG9yLnB5eDozNzYwOjM2OiB1bmRlY2xhcmVkIG5hbWUgbm90
IGJ1aWx0aW46IGxvbmcKPiAKPiBCYWNrcG9ydCB1cHN0cmVhbSBwYXRjaCB0byBmaXggdGhhdCBi
dWlsZCBmYWlsdXJlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxz
ZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNvbT4KCkFwcGxpZWQgdG8gMjAyNS4wMi54ICYg
MjAyNS4wNS54LiBUaGFua3MKCj4gLS0tCj4gQmFja3BvcnQgdG86IDIwMjUuMDUueCwgMjAyNS4w
Mi54Cj4gLS0tCj4gIC4uLi8wMDAxLU1OVC1kby1ub3QtdXNlLWxvbmctdHlwZS5wYXRjaCAgICAg
ICAgICAgIHwgMzQgKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMzQg
aW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1udW1weS8wMDAx
LU1OVC1kby1ub3QtdXNlLWxvbmctdHlwZS5wYXRjaCBiL3BhY2thZ2UvcHl0aG9uLW51bXB5LzAw
MDEtTU5ULWRvLW5vdC11c2UtbG9uZy10eXBlLnBhdGNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQK
PiBpbmRleCAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwLi5kODEzYTRk
NTFiMjY5MGQ1NzQ1NGZjMGQ0NzA5MGY2YmI0NzUxODgxCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBi
L3BhY2thZ2UvcHl0aG9uLW51bXB5LzAwMDEtTU5ULWRvLW5vdC11c2UtbG9uZy10eXBlLnBhdGNo
Cj4gQEAgLTAsMCArMSwzNCBAQAo+ICtGcm9tIDZkYzJmZDMxZjhhNWE0ZWY1MDJjYjc3MzRmMDA0
ZjViY2U5NGU2NzEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gK0Zyb206IFRob21hcyBBIENh
c3dlbGwgPHRjYXN3ZWxsQGdtYWlsLmNvbT4KPiArRGF0ZTogU2F0LCAxOCBOb3YgMjAyMyAxNjo0
Njo1MiAtMDUwMAo+ICtTdWJqZWN0OiBbUEFUQ0hdIE1OVDogZG8gbm90IHVzZSBgbG9uZ2AgdHlw
ZQo+ICtNSU1FLVZlcnNpb246IDEuMAo+ICtDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJz
ZXQ9VVRGLTgKPiArQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAo+ICsKPiArUmVtb3Zl
ZCBhcyB0eXBlIGF0IGxhbmd1YWdlIGxldmVsIDMgaW4gZWQ3ZTk1OTEyYjZlZDdkMjBlMTkwZmJm
MWFlY2I5ZjJhOTk3ZDQ3OQo+ICtpbiBjeXRob24KPiArCj4gK1Vwc3RyZWFtOiBodHRwczovL2dp
dGh1Yi5jb20vbnVtcHkvbnVtcHkvY29tbWl0LzZkYzJmZDMxZjhhNWE0ZWY1MDJjYjc3MzRmMDA0
ZjViY2U5NGU2NzEKPiArCj4gK1NpZ25lZC1vZmYtYnk6IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxz
ZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNvbT4KPiArLS0tCj4gKyBudW1weS9yYW5kb20v
X2dlbmVyYXRvci5weXggfCAyICstCj4gKyAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKPiArCj4gK2RpZmYgLS1naXQgYS9udW1weS9yYW5kb20vX2dlbmVyYXRv
ci5weXggYi9udW1weS9yYW5kb20vX2dlbmVyYXRvci5weXgKPiAraW5kZXggZDA2N2U3OTVlYjVj
Li5hZTQ4MWQ2OWQ2OTYgMTAwNjQ0Cj4gKy0tLSBhL251bXB5L3JhbmRvbS9fZ2VuZXJhdG9yLnB5
eAo+ICsrKysgYi9udW1weS9yYW5kb20vX2dlbmVyYXRvci5weXgKPiArQEAgLTM3NTcsNyArMzc1
Nyw3IEBAIGRlZiBtdWx0aXZhcmlhdGVfbm9ybWFsKHNlbGYsIG1lYW4sIGNvdiwgc2l6ZT1Ob25l
LCBjaGVja192YWxpZD0nd2FybicsCj4gKyAKPiArICAgICAgICAgaWYgc2l6ZSBpcyBOb25lOgo+
ICsgICAgICAgICAgICAgc2hhcGUgPSBbXQo+ICstICAgICAgICBlbGlmIGlzaW5zdGFuY2Uoc2l6
ZSwgKGludCwgbG9uZywgbnAuaW50ZWdlcikpOgo+ICsrICAgICAgICBlbGlmIGlzaW5zdGFuY2Uo
c2l6ZSwgKGludCwgbnAuaW50ZWdlcikpOgo+ICsgICAgICAgICAgICAgc2hhcGUgPSBbc2l6ZV0K
PiArICAgICAgICAgZWxzZToKPiArICAgICAgICAgICAgIHNoYXBlID0gc2l6ZQo+ICstLSAKPiAr
Mi40OS4xCj4gKwo+IAo+IC0tLQo+IGJhc2UtY29tbWl0OiBhNjJlZDYzZGNlOWE4OTJiNWM0OTQy
ZTBjMmZjMmMzMTBjNjJjY2Y2Cj4gY2hhbmdlLWlkOiAyMDI1MDgxNC1weXRob24tbnVtcHktZml4
LWJ1aWxkLWN5aHRvbi1kYzEzZGNkNGEzZTgKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gLS0gCj4gU8Op
YmFzdGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lAYXJtYWRldXMuY29tPgo+IAo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRy
b290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
