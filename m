Return-Path: <SRS0=Fi0H=PA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACB4AC433EF
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 20:53:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E6D760E90
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 20:53:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3E6D760E90
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0271F40250;
	Tue, 12 Oct 2021 20:53:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6s_bp_h1GCOG; Tue, 12 Oct 2021 20:53:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E04B040440;
	Tue, 12 Oct 2021 20:53:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9B9AF1BF5A0
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 20:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97F1460650
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 20:53:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pTJo2kd23XrD for <buildroot@lists.busybox.net>;
 Tue, 12 Oct 2021 20:53:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9048A605C1
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 20:53:54 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id a25so1191000edx.8
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 13:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=QqOElYpRhYBAmj01GE6S8/h8MrZbpZM2llYS6jqUn+Q=;
 b=T++tez80gTCDzxA+PpodmEKXzFUTKqGJyENJtA8yqLlckaG0PVywNNQxan/4+pOYI4
 wNnUSel49Oqxu4t76Wi9Ywob6eS9qKvt4AipOxghj1ezabyTnI130tkTQOLUGcbjGx3E
 2HMdov6K7RYpK+B9j3wEwSgxHspVoUOcMWpYXZ8n2o+estUAmK/AjOOOWiu1LYA8j/YL
 TrQCw+ljx1IL9gxuykNnbXa/lFFFBjoPRdqJOUwFmOqMVq22pg/S0S8IFR+jYx4fDaj3
 KVi3Gigpnzc+ppTqWDM56wPYrJOUU+mHyI98wThPuNtE4nBfCLUiN5hqhO1aH132aPHm
 +CPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=QqOElYpRhYBAmj01GE6S8/h8MrZbpZM2llYS6jqUn+Q=;
 b=Z2WmeoXPG9eoK5vzWAsyfvr6NDrhKuc/lMOI+60JiavZRSzdcf/4iluCKNfc02dJEq
 0iSEJz+at3mvs7XHwlwYNoPrFWX+DR+Q1oB4rrCWB7987dg/hKDJVvx882m+tz8queHr
 uH08zpH2qnaf/O0cCgdY8O8332btRQjA3XLhVFbKnbc69tuGmto7ju/licHBms7N7lh3
 SkLUh/K+Y+zY64KKzBGwFnLjiwXiNfLRrgJtY7pG38orYPi6Y6i/jcz8sl08Qi7HTFvP
 f/Z5Omcu1aOGW59RgOI8TLQbJtXkA7Md3f4qZRhMYJm+ApduxKEXbA3obKiOMDWw8ZV+
 zxig==
X-Gm-Message-State: AOAM533JglLhvpd39DKJDHzO1c85YiopjQuaAjUt82e4tJRefcbGXvJm
 4cDcq2yBIjxSjVICqQRspuRsqI6Y2aBGVMLm
X-Google-Smtp-Source: ABdhPJyfPr3qL66/8otyg0xiT/FDhPmMbWU3T+FVlr2D8/OIJcURsz1p8F/RYxekt5DAvTGDFAK7xw==
X-Received: by 2002:a17:906:4e89:: with SMTP id
 v9mr28502118eju.354.1634072032829; 
 Tue, 12 Oct 2021 13:53:52 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id se12sm5363144ejb.88.2021.10.12.13.53.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 13:53:52 -0700 (PDT)
Message-ID: <d39d6a3e-6e92-b334-a0f3-4ca240e69da2@mind.be>
Date: Tue, 12 Oct 2021 22:53:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
From: Arnout Vandecappelle <arnout@mind.be>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211006162044.2500210-1-fontaine.fabrice@gmail.com>
 <0496e3c2-8b55-c900-ab47-841268e783ab@mind.be>
Organization: Essensium/Mind
In-Reply-To: <0496e3c2-8b55-c900-ab47-841268e783ab@mind.be>
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-autotools: fix autoreconf
 with autoconf >= 2.70
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDEyLzEwLzIwMjEgMjI6NTMsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+Cj4KPiBP
biAwNi8xMC8yMDIxIDE4OjIwLCBGYWJyaWNlIEZvbnRhaW5lIHdyb3RlOgo+PiBUaGUgZm9sbG93
aW5nIGJ1aWxkIGZhaWx1cmUgaXMgcmFpc2VkIHNpbmNlIGJ1bXAgb2YgYXV0b2NvbmYgdG8gdmVy
c2lvbgo+PiAyLjcxIGluIGNvbW1pdCBlY2Q1NGI2NWMxZjk5OGE3Y2NkOTFmN2M1MjNlNGZmMzhj
NDc4MWRhIGFuZAo+PiBodHRwOi8vZ2l0LnNhdmFubmFoLmdudS5vcmcvZ2l0d2ViLz9wPWF1dG9j
b25mLmdpdDthPWNvbW1pdDtoPWRkODgwYTBhNmRlNTYwMmNkZDQwYjc3MGVkNmIwODNiMzRhYTA3
Njg6IAo+Pgo+Pgo+PiBDYW4ndCBleGVjICJndGtkb2NpemUiOiBObyBzdWNoIGZpbGUgb3IgZGly
ZWN0b3J5IGF0IAo+PiAvaG9tZS9idWlsZHJvb3QvYXV0b2J1aWxkL2luc3RhbmNlLTEvb3V0cHV0
LTEvaG9zdC9zaGFyZS9hdXRvY29uZi9BdXRvbTR0ZS9GaWxlVXRpbHMucG0gCj4+IGxpbmUgMjkz
Lgo+PiBhdXRvcmVjb25mOiBlcnJvcjogZ3RrZG9jaXplIGZhaWxlZCB3aXRoIGV4aXQgc3RhdHVz
OiAyCj4+Cj4+IFRoaXMgZmFpbHVyZSBpcyByYWlzZWQgYmVjYXVzZSBhdXRvcmVjb25mIHJ1bnMg
Z3RrZG9jaXplIGlmIGNvbmZpZ3VyZS5hYwo+PiBjb250YWlucyBHVEtfRE9DX0NIRUNLLCBzbyBz
ZXQgR1RLRE9DSVpFIHRvIHRydWUgaW4gcGtnLWF1dG90b29scyB0byBmaXgKPj4gdGhpcyBpc3N1
ZSBmb3IgYWxsIGFmZmVjdGVkIHBhY2thZ2VzIChpLmUuIGhvc3QtbGliZ3RrMywgbGlidGFzbjEs
Cj4+IHJhcHRvciwgZXRjLikuIEluZGVlZCwgZ3RrLWRvYyBpcyBhbHJlYWR5IGZvcmNlZnVsbHkg
ZGlzYWJsZWQgaW4KPj4gcGtnLWF1dG90b29scyB0aHJvdWdoIC0tZGlzYWJsZS1ndGstZG9jIGNv
bmZpZ3VyZSBmbGFnLgo+Pgo+PiBGaXhlczoKPj4gwqAgLSAKPj4gaHR0cDovL2F1dG9idWlsZC5i
dWlsZHJvb3Qub3JnL3Jlc3VsdHMvY2U5NzQyODFhY2RkNjcyOTMyN2YyMDgzYjI0ZjYyNDg1Zjli
MWUxYQo+PiDCoCAtIAo+PiBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy8y
M2RkOTkzYmU0ZGNkNzkzN2Q0OGVlZjQ1MjE2OTBiZjMwMTIzOTc5Cj4+IMKgIC0gCj4+IGh0dHA6
Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzL2JjZjQ4OWNjZDQxMTk3YjU3YjM5MzEy
YjM2OTkyMTQ2N2YyOTU0MzEKPj4KPj4gU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8
Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4KPiDCoEkgaGF2ZSBpbnN0ZWFkIGFwcGxpZWQg
WzFdLCB3aGljaCBwdXRzIGl0IGluIEFVVE9SRUNPTkYgaXRzZWxmLiBJIHRoaW5rIAo+IHRoYXQn
cyBhIG1vcmUgYXBwcm9wcmlhdGUgcGxhY2Ugc2luY2UgaXQgYWxzbyBoYXMgQVVUUE9JTlQ9L2Jp
bi90cnVlIGFscmVhZHkuCj4KPiDCoFJlZ2FyZHMsCj4gwqBBcm5vdXQKClsxXSAKaHR0cHM6Ly9w
YXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC9WSTFQMTkwTUIwNDkz
RjZCN0MzQ0E1RTUzRjBBN0I5MDQ5RkI1OUBWSTFQMTkwTUIwNDkzLkVVUlAxOTAuUFJPRC5PVVRM
T09LLkNPTS8KCgo+Cj4+IC0tLQo+PiDCoCBwYWNrYWdlL3BrZy1hdXRvdG9vbHMubWsgfCAyICst
Cj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pgo+
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9wa2ctYXV0b3Rvb2xzLm1rIGIvcGFja2FnZS9wa2ctYXV0
b3Rvb2xzLm1rCj4+IGluZGV4IGRhYTY4OGRhYjYuLjc3MjBkNmZmZTcgMTAwNjQ0Cj4+IC0tLSBh
L3BhY2thZ2UvcGtnLWF1dG90b29scy5tawo+PiArKysgYi9wYWNrYWdlL3BrZy1hdXRvdG9vbHMu
bWsKPj4gQEAgLTEwMCw3ICsxMDAsNyBAQCBlbmRlZgo+PiDCoCAjCj4+IMKgIGRlZmluZSBBVVRP
UkVDT05GX0hPT0sKPj4gwqDCoMKgwqDCoCBAJChjYWxsIE1FU1NBR0UsIkF1dG9yZWNvbmZpZ3Vy
aW5nIikKPj4gLcKgwqDCoCAkKFEpY2QgJCgkKFBLRylfU1JDRElSKSAmJiAkKCQoUEtHKV9BVVRP
UkVDT05GX0VOVikgJChBVVRPUkVDT05GKSAKPj4gJCgkKFBLRylfQVVUT1JFQ09ORl9PUFRTKQo+
PiArwqDCoMKgICQoUSljZCAkKCQoUEtHKV9TUkNESVIpICYmIEdUS0RPQ0laRT0idHJ1ZSIgJCgk
KFBLRylfQVVUT1JFQ09ORl9FTlYpIAo+PiAkKEFVVE9SRUNPTkYpICQoJChQS0cpX0FVVE9SRUNP
TkZfT1BUUykKPj4gwqAgZW5kZWYKPj4gIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPj4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
