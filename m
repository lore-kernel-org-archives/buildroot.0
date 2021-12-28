Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E6BC433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 17:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8618401C4;
	Tue, 28 Dec 2021 17:08:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XUHOrPtfEWIT; Tue, 28 Dec 2021 17:07:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B93C0401EF;
	Tue, 28 Dec 2021 17:07:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 458E31BF42E
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 17:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2DF3881394
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 17:07:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x6NfaG6iQI8n for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 17:07:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D9B0181392
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 17:07:55 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id x15so76356760edv.1
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 09:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jQdflXH9CHPGT+csodjrqqjN5Bdk6sFOwgweehRLXWI=;
 b=TlIHIM6Q9NZQ+U0+WDVjWW8c2EZCWAV6jMCG3KG424pPsEJt1E7bpNg9AUXXbZ/90b
 UP52pfttDJ/3H8IhlAojJwBnKDN2E85yNNAwRBK0Zl3LeMYdzDfVrIy2U9bCBnXqjVKP
 aJYUpVNR82IZUyo+8/D7i3BaSCkWd3NRHeYT0oc2O/OLwotyCJMS6nne/d3gNz8Jjrf1
 k9rhrTMCc0u6mAdVIqoP7EISoMWhvgu7L5zS49cZaxBOJAmZHIciPK8+5wfDN2n6aaxY
 cTtbj8uBQiSP3hGGHuKkRR5x99K2/atlkkjcYQBbvmS2P68K3+DRx3Het6Noo+zi9W04
 JCXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jQdflXH9CHPGT+csodjrqqjN5Bdk6sFOwgweehRLXWI=;
 b=WL1U6FYlpjOU3Tqodwr96WyHCTJX7zOTQGugPjoqkUVK209qdeUghtDiU+KFfJpPjt
 z4z7QHQxhuU7G0VEel0J3MANVtFBIAE5aaXPGCi4ReUzz9LXMu4/fi+U5zePSYc4/XFY
 SHRwbVxfbrV4evkPs9vSpScL93sU7WFbUsvPY1cEPbfngN6MaOtSNp3UUf+e+vqS8Fx0
 /ygYGm83+feflBJiy3q+Q/PXiIB0qm1Y/Adh7XjejNN9FBcHXnWX39H09TqgFcbAfCDc
 SfNzdnIqGG68XtxPIttlSAFTr3TP1MP1in4P4hBPIddPxR6xGqLFnOa2BzkuljOHl27B
 vBmw==
X-Gm-Message-State: AOAM531tDtFkIP3eDBYo3/uID5npdOjkaN3L6LuOIMcES7ijPAlIU+fU
 7Z5mlvU3hGsnHFyMNJ1oEDfKBW64iRHuwSXX6as=
X-Google-Smtp-Source: ABdhPJynPNlmxTetQPzJxHsiVjlAKkL3TWuuBr3lGcekwUxHQOIInar63RKVDb9GQxbEIi/wdciG2ZXxfHIO2CgQJOA=
X-Received: by 2002:a17:907:7241:: with SMTP id
 ds1mr18181093ejc.695.1640711274003; 
 Tue, 28 Dec 2021 09:07:54 -0800 (PST)
MIME-Version: 1.0
References: <20211228153345.4087026-1-fontaine.fabrice@gmail.com>
 <20211228164916.2beec0d6@windsurf>
In-Reply-To: <20211228164916.2beec0d6@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 28 Dec 2021 18:07:03 +0100
Message-ID: <CAPi7W80OfGF3AhM2h6mjtsUjLEnYEV4gteJ12GFq4edNysEV5A@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/mbedtls3: new package
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgbWFyLiAyOCBkw6ljLiAyMDIxIMOgIDE2OjQ5LCBUaG9tYXMgUGV0YXp6b25pCjx0aG9tYXMu
cGV0YXp6b25pQGJvb3RsaW4uY29tPiBhIMOpY3JpdCA6Cj4KPiBPbiBUdWUsIDI4IERlYyAyMDIx
IDE2OjMzOjQ0ICswMTAwCj4gRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gPiBtYmVkdGxzIDMueCBpcyBpbmNvbXBhdGlibGUgd2l0aCBtYmVk
dGxzIDIueDoKPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9BUk1tYmVkL21iZWR0bHMvYmxvYi9kZXZl
bG9wbWVudC9kb2NzLzMuMC1taWdyYXRpb24tZ3VpZGUubWQKPiA+Cj4gPiBtYmVkdGxzMyB3YXMg
Y3JlYXRlZCBmcm9tIG1iZWR0bHMgcGFja2FnZSB3aXRoIHRoZSBmb2xsb3dpbmcgY2hhbmdlczoK
PiA+ICAtIGxpY2Vuc2UgZmlsZSBpcyBub3cgTElDRU5TRQo+ID4gIC0gemxpYiBjb21wcmVzc2lv
biBpcyBub3QgYXZhaWxhYmxlIGFueW1vcmUKPiA+ICAtIGNvbmZpZy5oIHJlbmFtZWQgdG8gbWJl
ZHRsc19jb25maWcuaAo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZv
bnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+Cj4gQW4gaW1wb3J0YW50IChhbmQgdW5mb3J0dW5h
dGUgcG9pbnQpIGlzIHRoYXQgYXBwYXJlbnRseSBtYmVkdGxzMyBjYW5ub3QKPiBiZSBpbnN0YWxs
ZWQgc2lkZS1ieS1zaWRlIHdpdGggbWJlZHRscy4gQXQgbGVhc3QgdGhhdCdzIHdoYXQgeW91cgo+
ICJkZXBlbmRzIG9uICFCUjJfUEFDS0FHRV9NQkVEVExTIiBzZWVtcyB0byBoaW50LgpJbmRlZWQs
IGJvdGggdmVyc2lvbnMgaW5zdGFsbCB0aGVpciBoZWFkZXJzIGluIGluY2x1ZGUvbWJlZHRscy4K
Pgo+IFRoaXMgaXMgYSBtYWpvciBhbm5veWFuY2UsIGFuZCBJJ20gbm90IHN1cmUgaG93IExpbnV4
IGRpc3RyaWJ1dGlvbnMKPiB3aWxsIGhhbmRsZSB0aGlzIG1pZ3JhdGlvbiBpZiB0aGV5IGNhbm5v
dCBoYXZlIG1iZWR0bHMgMi54IGFuZCBtYmVkdGxzCj4gMy54IGluc3RhbGxlZCBzaWRlIGJ5IHNp
ZGUuCjMuMCB3YXMgcmVsZWFzZWQgaW4gSnVseS4KVG8gbXkga25vd2xlZGdlLCBoaWF3YXRoYSBp
cyBvbmUgb2YgdGhlIGZpcnN0IHBhY2thZ2UgdGhhdCB1c2VzIHRoaXMKbmV3IEFQSSBhbmQgYnVp
bGRyb290IHdpbGwgcHJvYmFibHkgYmUgb25lIG9mIHRoZSBmaXJzdCBidWlsZCBzeXN0ZW0KdGhh
dCB3aWxsIHByb3ZpZGUgbWJlZHRzMy4KSU1ITywgYmVpbmcgdW5hYmxlIHRvIGluc3RhbGwgYm90
aCB2ZXJzaW9ucyBzaWRlIGJ5IHNpZGUgaXMgcHJldHR5CmNvbW1vbjogd2UgaGFkIHRoZSBzYW1l
IGlzc3VlIHdpdGggbGlidXBucCAxLjYueCBhbmQgbGlidXBucCAxLjgueC4KQ29uY2VybmluZyBs
aWJ1cG5wLCB3ZSBldmVuIGhhZCB0byByZXZlcnQgdGhlIHBvc3NpYmlsaXR5IHRvIGluc3RhbGwK
Ym90aCB2ZXJzaW9ucyBzaWRlIGJ5IHNpZGUgYmVjYXVzZSBpdCB3YXMgYSAiYnVyZGVuIHRvIHBy
b2dyYW1zCmxpbmtpbmcgYWdhaW5zdCBsaWJ1cG5wIjoKaHR0cHM6Ly9naXRodWIuY29tL3B1cG5w
L3B1cG5wL2NvbW1pdC8wN2Y1MDRjNjFiZDllNGQ5M2ViM2QzNzNmZmM4NTI3Y2FmZTBiOWFmCj4K
PiBIYXZlIHlvdSB0YWxrZWQgd2l0aCBtYmVkdGxzIHVwc3RyZWFtIGFib3V0IHRoaXM/IEl0IHNl
ZW1zIHJlYWxseSBvZGQKPiB0aGF0IHRoZXkgZGlkbid0IHBsYW4gdGhpcyBwb3NzaWJpbGl0eS4K
Pgo+IFRoYW5rcyEKPgo+IFRob21hcwo+IC0tCj4gVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIg
YW5kIENFTywgQm9vdGxpbgo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcg
YW5kIHRyYWluaW5nCj4gaHR0cHM6Ly9ib290bGluLmNvbQpCZXN0IFJlZ2FyZHMsCgpGYWJyaWNl
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
