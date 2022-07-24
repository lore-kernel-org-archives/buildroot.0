Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F2E1C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 09:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B955E416A5;
	Sun, 24 Jul 2022 09:25:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B955E416A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 025ZaD6bTnOR; Sun, 24 Jul 2022 09:25:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31EB24168C;
	Sun, 24 Jul 2022 09:25:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31EB24168C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3CF7F1BF2B9
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 09:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 24F4A60B56
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 09:25:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24F4A60B56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dqsh7hPLHQst for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 09:25:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B28160B4F
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2B28160B4F
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 09:25:44 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id g2so3958287wru.3
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 02:25:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=eTt9Q+t8jl8J5FJc18Kd/aHr7hHyDyttdbFGO7MjSH0=;
 b=dAS/8aj/Wga480v412ZNjeKnfJTYd1qpQlcH3UJHfbVT1KHGa6JK/8565kZ+Dup6p4
 8pCxOQoN98LUFrzC4cEMKn4TCrbnFfTSRn4CmUSApsfhd1ryGSDTeRvSSHZp18wFCZfE
 YpYRnX6CmMu7ZgwPbQOLi07zBZxaeeoacF+SvrNpGz/7LshPC19BawrgDSv7YofhBsFD
 RmLZKY1fxYmdmY0fYdYt1Ka0ez9N/FEeONGUXeGMdPuHlfSzxVsmflkMUpVfu/pPhFb/
 L7IifH1I1il2ohLxKnpmULemRkNZGHoaJWaSa2eikgHBZZPR2VQ/EUHQ6ZtW+IT/gf1J
 +i5g==
X-Gm-Message-State: AJIora9Iw0JxiJEV6GsjB9sOHyHfSB7AOZ++OXgImMEORwCdSL1e9WF/
 iw0s2exBulapGjCeUsoxEZF3z8aX/fJDYA==
X-Google-Smtp-Source: AGRyM1saEN7Hsoegd9yfpms+sYjR4yg3suBJG2E2UXrk6QZA+8HQ2nt6mPJCOHbBLN3Yksg8tuOSAw==
X-Received: by 2002:adf:f8c8:0:b0:21e:6d0e:422b with SMTP id
 f8-20020adff8c8000000b0021e6d0e422bmr4916330wrq.359.1658654742166; 
 Sun, 24 Jul 2022 02:25:42 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 l7-20020a05600c4f0700b003a310fe1d75sm15715927wmq.38.2022.07.24.02.25.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 02:25:41 -0700 (PDT)
Message-ID: <02068fad-6ee9-0809-a570-be3efa8f4aea@mind.be>
Date: Sun, 24 Jul 2022 11:25:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Romain Naour <romain.naour@smile.fr>, Abel Bernabeu <abel@x-silicon.com>, 
 buildroot@buildroot.org
References: <20220723215448.2532160-1-abel@x-silicon.com>
 <20220723215448.2532160-2-abel@x-silicon.com>
 <815628b4-9584-cc91-1b5a-edc1e2a01c57@smile.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <815628b4-9584-cc91-1b5a-edc1e2a01c57@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=eTt9Q+t8jl8J5FJc18Kd/aHr7hHyDyttdbFGO7MjSH0=;
 b=JCDUqpJZUgveeBe0qD+chpTiGQ9YjCRTE6qb0roo/HcGG5XfZCMJPpyKtd+TxudXAU
 EjQ7OjLAq0bddCPSUlSpzcSgxK93QLo4ub+xZSn+h7Lg7KIwqwbMgdI4MyyGCCIwQxbX
 3eitXGGeMqnbSGJq7ccYxIul65gDS52Y/Q3PmpIcXWctxDVR/rNw+Q1uykV+RK2YqD5f
 5J3yRxPILsg56LsL4abLYoftsAYoaPrS4KRzL9RIpRml2711Tah1zDPY7LZnSyYzbZl+
 zF9pktlO/z1KvyyoqkgIcvsQMazKOTOs1dF52PxbSm1SMPEk/4XV5SgjkmGLogSCCwF4
 VrmQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JCDUqpJZ
Subject: Re: [Buildroot] [PATCH 2/2] arch/riscv: Added support for RISC-V
 vector extension on the architecture menu.
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Mark Corbin <mark@dibsco.co.uk>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyNC8wNy8yMDIyIDEwOjA4LCBSb21haW4gTmFvdXIgd3JvdGU6Cj4gSGVsbG8gQWJlbCwK
PiAKPiBMZSAyMy8wNy8yMDIyIMOgIDIzOjU0LCBBYmVsIEJlcm5hYmV1IGEgw6ljcml0wqA6Cj4+
IFRoaXMgbmV3IHNldHRpbmcgd2lsbCBhbGxvdyB0byB0ZXN0IG5ldyB0b29sY2hhaW5zIGFscmVh
ZHkgYXZhaWxhYmxlCj4+IHRoYXQgc3VwcG9ydCB0aGUgdmVjdG9yIGV4dGVuc2lvbiAobW9yZSBw
YXRjaGVzIGNvbWluZyBzb29uKS4KPiAKPiBJdCBzZWVtcyB0aGF0IGlzIHRoZSBzYW1lIHNlcmll
cyBhcyB2MToKPiAKPiBodHRwOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJv
b3QvbGlzdC8/c2VyaWVzPTMwNzg0OCZzdGF0ZT0qCj4gCj4gU2VlIDIyLjUuNS4gIlBhdGNoIHJl
dmlzaW9uIGNoYW5nZWxvZyIgc2VjdGlvbiBmb3IgaGVscC4KPiAKPiBodHRwczovL25pZ2h0bHku
YnVpbGRyb290Lm9yZy9tYW51YWwuaHRtbCNzdWJtaXR0aW5nLXBhdGNoZXMKPiAKPj4KPj4gU2ln
bmVkLW9mZi1ieTogQWJlbCBCZXJuYWJldSA8YWJlbEB4LXNpbGljb24uY29tPgo+PiAtLS0KPj4g
ICBhcmNoL0NvbmZpZy5pbi5yaXNjdiB8IDcgKysrKysrKwo+PiAgIGFyY2gvYXJjaC5tay5yaXNj
diAgIHwgNCArKysrCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspCj4+Cj4+
IGRpZmYgLS1naXQgYS9hcmNoL0NvbmZpZy5pbi5yaXNjdiBiL2FyY2gvQ29uZmlnLmluLnJpc2N2
Cj4+IGluZGV4IDI4OGVkODMzZWIuLmU0ZGM5MzZjZjggMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvQ29u
ZmlnLmluLnJpc2N2Cj4+ICsrKyBiL2FyY2gvQ29uZmlnLmluLnJpc2N2Cj4+IEBAIC0xOCw2ICsx
OCw5IEBAIGNvbmZpZyBCUjJfUklTQ1ZfSVNBX1JWRAo+PiAgIGNvbmZpZyBCUjJfUklTQ1ZfSVNB
X1JWQwo+PiAgIAlib29sCj4+ICAgCj4+ICtjb25maWcgQlIyX1JJU0NWX0lTQV9SVlYKPj4gKwli
b29sCj4+ICsKPj4gICBjaG9pY2UKPj4gICAJcHJvbXB0ICJUYXJnZXQgQXJjaGl0ZWN0dXJlIFZh
cmlhbnQiCj4+ICAgCWRlZmF1bHQgQlIyX3Jpc2N2X2cKPj4gQEAgLTYzLDYgKzY2LDEwIEBAIGNv
bmZpZyBCUjJfUklTQ1ZfSVNBX0NVU1RPTV9SVkQKPj4gICBjb25maWcgQlIyX1JJU0NWX0lTQV9D
VVNUT01fUlZDCj4+ICAgCWJvb2wgIkNvbXByZXNzZWQgSW5zdHJ1Y3Rpb25zIChDKSIKPj4gICAJ
c2VsZWN0IEJSMl9SSVNDVl9JU0FfUlZDCj4+ICsKPj4gK2NvbmZpZyBCUjJfUklTQ1ZfSVNBX0NV
U1RPTV9SVlYKPiAKPiBUaGlzIG9wdGlvbiBtdXN0IGRlcGVuZHMgb24gZ2NjLTEyLgoKICBObywg
aXQncyB0aGUgb3RoZXIgd2F5IHJvdW5kOiBpdCBzaG91bGQgZm9yY2UgR0NDIDEyLCBieSBzZWxl
Y3RpbmcgCkJSMl9BUkNIX05FRURTX0dDQ19BVF9MRUFTVF8xMi4KCiAgUmVnYXJkcywKICBBcm5v
dXQKCj4gCj4gQmVzdCByZWdhcmRzLAo+IFJvbWFpbgo+IAo+PiArCWJvb2wgIlZlY3RvciBJbnN0
cnVjdGlvbnMgKFYpIgo+PiArCXNlbGVjdCBCUjJfUklTQ1ZfSVNBX1JWVgo+PiAgIGVuZGlmCj4+
ICAgCj4+ICAgY2hvaWNlCj4+IGRpZmYgLS1naXQgYS9hcmNoL2FyY2gubWsucmlzY3YgYi9hcmNo
L2FyY2gubWsucmlzY3YKPj4gaW5kZXggZjNiZjJiMzQ2Ny4uMDdhOTRhYTZhNCAxMDA2NDQKPj4g
LS0tIGEvYXJjaC9hcmNoLm1rLnJpc2N2Cj4+ICsrKyBiL2FyY2gvYXJjaC5tay5yaXNjdgo+PiBA
QCAtMjYsNSArMjYsOSBAQCBlbmRpZgo+PiAgIGlmZXEgKCQoQlIyX1JJU0NWX0lTQV9SVkMpLHkp
Cj4+ICAgR0NDX1RBUkdFVF9BUkNIIDo9ICQoR0NDX1RBUkdFVF9BUkNIKWMKPj4gICBlbmRpZgo+
PiAraWZlcSAoJChCUjJfUklTQ1ZfSVNBX1JWVikseSkKPj4gK0dDQ19UQVJHRVRfQVJDSCA6PSAk
KEdDQ19UQVJHRVRfQVJDSCl2Cj4+ICtlbmRpZgo+PiArCj4+ICAgCj4+ICAgZW5kaWYKPiAKPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
