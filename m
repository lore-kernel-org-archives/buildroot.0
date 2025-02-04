Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 085CBC02194
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 11:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A270E82AAA;
	Tue,  4 Feb 2025 11:16:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mq-ACKQRL9Jc; Tue,  4 Feb 2025 11:16:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACE2282B1E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACE2282B1E;
	Tue,  4 Feb 2025 11:16:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E365D12A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 11:16:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BFEF241571
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 11:16:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R3jIml-zTico for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 11:16:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8588241585
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8588241585
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8588241585
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 11:16:22 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5401bd6cdb4so5788712e87.2
 for <buildroot@buildroot.org>; Tue, 04 Feb 2025 03:16:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738667779; x=1739272579;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h66pxcmegw1BHajoO8l1OQU/aX9q5eyQixcPPNx6vR0=;
 b=vz4xWw9NAtT2Ib6ZSQ9BpJxS6JGGOY0XO4KKa9r0p91ZfCB4LmDhfpbUk7IeX1TyS2
 ElhAGWx0O9p6fkZl8DiBZ/WDD9X2lKOecvqqRzkaWaz5coQo3De0TCx29OhxfMvYZerZ
 0iNEQHIiQ8SgD/aIKQLJ64tngyLqhZJy+O4qFMcDrvm6s1hCBeg3zUuMIM5uNGC+p2Co
 pmC1awb391yWO66+tmTfnOhT7JZ9Sn2J+pXsL25Jcw2o74pFOwH+qSTdMpZ5Vhl52BBP
 oJqoMp3miH6d68nFRrP9S7RNpU/qnstKsGbEsxLo7StnJtwkOMfabEG4bm9Gvj+SZaS9
 5/Cg==
X-Gm-Message-State: AOJu0Yw9j9RTgtperQzKBJJ5DsK5mNbYfzq1qkcTk0MISsUsOJ23mcUk
 v9HXzruO0vQS8Ei224OWiM74ERM8scThajJJbKL2Z+deP2yHZtaWTvOtUHAmPaLmfv+v8y+Ywyd
 w
X-Gm-Gg: ASbGncsHQwyIZ+5m0dpIjTUm72eyWSWvRhviieDfWvOMzRwKgRsvtBx+xvqhi2Db+3k
 3kZuOgBPu5FEnne40VFbQdbVhH36nt11yh2N73UK0fzWVyY3KfvHtL9+zE751P4TrJcCzbyVAsE
 /NrFd6TGIh9daXacWCIvM54sIlU9YdiioEy0zQia6ROEE5LsJ1JYpvOot/8PyjpCIcjWlh7nO21
 Y9pfP4qGDssbs/NU+xj9m0ZixrPac2Ns0DFRvryX6tLVFm26IDywVmkAcisqicWBKoOiWee2khO
 VFh2iXSu+L7CoDybZKfC8IQfFZ39S3jzNna73VhB5y6FLbQ=
X-Google-Smtp-Source: AGHT+IGdCbepR6dDVW3ViYJEOaOzpBPl3ZS0LiPZ/TIMtJbu7t83hu/AK7WXB0b2WweBN9sF5MimiA==
X-Received: by 2002:a05:6512:3c85:b0:540:22e0:1f63 with SMTP id
 2adb3069b0e04-543e4be9c5dmr7522181e87.19.1738667779405; 
 Tue, 04 Feb 2025 03:16:19 -0800 (PST)
Received: from [172.16.2.111] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543ebe1030esm1599976e87.97.2025.02.04.03.16.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 03:16:17 -0800 (PST)
Message-ID: <a1d8522b-ad24-4484-93d5-afd960bcd8f0@mind.be>
Date: Tue, 4 Feb 2025 12:16:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
References: <20250111171050.2905238-1-james.hilliard1@gmail.com>
 <56a657e8-4fef-4039-836e-846d243fb715@mind.be>
 <CADvTj4ocuV3A251MtnqG-stCGiCTVjxavsTLy7+OSmmz8jTynQ@mail.gmail.com>
Content-Language: en-GB
In-Reply-To: <CADvTj4ocuV3A251MtnqG-stCGiCTVjxavsTLy7+OSmmz8jTynQ@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738667779; x=1739272579; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=h66pxcmegw1BHajoO8l1OQU/aX9q5eyQixcPPNx6vR0=;
 b=eOZNwzfAIjbenUX0yIC8syzn/iPoeiJLn58cKNDuvqh5XCxJOdlqlHENg0LezT39NG
 EBL82rPXgTzj6GKPF0clXT7JN6CP19xp8vGhe1GLkfI7TcsIUVz6dmpkrgxZRHx18O2K
 lWmLGoy39X385tKptxHkTigK37ozb8en0dXHeIUOIyi0QzNO9O2A2hittu3uw09fyw9O
 hbLE6HgqzXlIwOZWKlODr4vRXUk9W9xWvswmYXFtWR8OEHDW37r2ddqVGPVlg6RfLQ7z
 Yw5WsUzVuD/uJGR93SOmRG14Gq7BNyocQVXBJYrtP/TSl++/inu0Wut9GNzJsKRsJz6U
 CHHg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=eOZNwzfA
Subject: Re: [Buildroot] [PATCH 1/1] package/python-setuptools: bump to
 version 75.8.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwMy8wMi8yMDI1IDE5OjMyLCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPiBPbiBNb24sIEZl
YiAzLCAyMDI1IGF0IDg6MDnigK9QTSBBcm5vdXQgVmFuZGVjYXBwZWxsZSA8YXJub3V0QG1pbmQu
YmU+IHdyb3RlOgo+Pgo+PiAgICBIaSBKYW1lcywKPj4KPj4gT24gMTEvMDEvMjAyNSAxODoxMCwg
SmFtZXMgSGlsbGlhcmQgd3JvdGU6Cj4+PiBSZWJhc2UgYWRkIGV4ZWN1dGFibGUgcGF0Y2guCj4+
Pgo+Pj4gU2lnbmVkLW9mZi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFp
bC5jb20+Cj4+Cj4+ICAgIEFmdGVyIHRoaXMgdXBkYXRlLCBJIGdldCBlcnJvcnMgbGlrZSB0aGlz
Ogo+Pgo+PiAqIEdldHRpbmcgYnVpbGQgZGVwZW5kZW5jaWVzIGZvciB3aGVlbC4uLgo+PiAvaG9t
ZS9hcm5vdXQvc3JjL2J1aWxkcm9vdC9vdXRwdXQvcGVyLXBhY2thZ2UvaG9zdC1weXRob24tc2l4
L2hvc3QvbGliL3B5dGhvbjMuMTIvc2l0ZS1wYWNrYWdlcy9zZXR1cHRvb2xzL19kaXN0dXRpbHMv
ZGlzdC5weToyNzA6Cj4+IFVzZXJXYXJuaW5nOiBVbmtub3duIGRpc3RyaWJ1dGlvbiBvcHRpb246
ICd0ZXN0c19yZXF1aXJlJwo+PiAgICAgd2FybmluZ3Mud2Fybihtc2cpCj4+IC9ob21lL2Fybm91
dC9zcmMvYnVpbGRyb290L291dHB1dC9wZXItcGFja2FnZS9ob3N0LXB5dGhvbi1zaXgvaG9zdC9s
aWIvcHl0aG9uMy4xMi9zaXRlLXBhY2thZ2VzL3NldHVwdG9vbHMvX2Rpc3R1dGlscy9kaXN0LnB5
OjI3MDoKPj4gVXNlcldhcm5pbmc6IFVua25vd24gZGlzdHJpYnV0aW9uIG9wdGlvbjogJ3B5dGhv
bl9yZXF1aXJlcycKPj4gICAgIHdhcm5pbmdzLndhcm4obXNnKQo+PiB1c2FnZTogc2V0dXAucHkg
W2dsb2JhbF9vcHRzXSBjbWQxIFtjbWQxX29wdHNdIFtjbWQyIFtjbWQyX29wdHNdIC4uLl0KPj4g
ICAgICBvcjogc2V0dXAucHkgLS1oZWxwIFtjbWQxIGNtZDIgLi4uXQo+PiAgICAgIG9yOiBzZXR1
cC5weSAtLWhlbHAtY29tbWFuZHMKPj4gICAgICBvcjogc2V0dXAucHkgY21kIC0taGVscAo+Pgo+
PiBlcnJvcjogaW52YWxpZCBjb21tYW5kICdlZ2dfaW5mbycKPj4KPj4gRVJST1IgQmFja2VuZCBz
dWJwcm9jZXNzIGV4aXRlZCB3aGVuIHRyeWluZyB0byBpbnZva2UgZ2V0X3JlcXVpcmVzX2Zvcl9i
dWlsZF93aGVlbAo+PiBtYWtlOiAqKiogW3BhY2thZ2UvcGtnLWdlbmVyaWMubWs6Mjg5Ogo+PiAv
aG9tZS9hcm5vdXQvc3JjL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvaG9zdC1weXRob24tc2l4LTEu
MTcuMC8uc3RhbXBfYnVpbHRdIEVycm9yIDEKPj4KPj4gICAgSSBhbHNvIGdvdCBpdCBmb3IgaG9z
dC1weXRob24taHR0cGxpYjIuCj4+Cj4+ICAgIE9mIGNvdXJzZSwgdGhpcyBvbmx5IGhhcHBlbnMg
bmF0aXZlbHkgKEZlZG9yYSA0MCksIG5vdCBpbiBvdXIgZG9ja2VyIGltYWdlLi4uCj4+IEkgbG9v
a2VkIGEgYml0IGF0IHdoYXQgaXMgZGlmZmVyZW50IC0gSSB0aGluayB0aGUgbWFpbiBkaWZmZXJl
bmNlIGlzIHRoYXQgbXkKPj4gRmVkb3JhIGhvc3QgaGFzIHB5dGhvbiAzLjEyIGluc3RhbGxlZCB3
aGlsZSB0aGUgVWJ1bnR1ZSBjb250YWluZXIgZG9lc24ndC4KPiAKPiBIbW0sIHRoYXQncyB3ZWly
ZCwgb3VyIGhvc3QtcHl0aG9uIHNob3VsZG4ndCBiZSBwaWNraW5nIHVwIHRoZSBidWlsZCBob3N0
Cj4gc2l0ZS1wYWNrYWdlcy4KPiAKPiBJcyB0aGVyZSBhbnl0aGluZyB3ZWlyZCB3aXRoIHRoZSBi
dWlsZCBob3N0IGVudiB2YXJpYWJsZXMgb3Igc29tZXRoaW5nPwo+IAo+IEkgdHJpZWQgb24gbXkg
dWJ1bnR1IGJ1aWxkIGhvc3Qgd2l0aCBweXRob24gMy4xMiBhcyB3ZWxsIGFuZCB3YXNuJ3QgYWJs
ZSB0bwo+IHJlcHJvZHVjZSB0aGlzIGVycm9yLgoKICBJdCdzIGNsZWFyIHRoYXQgaXQncyB3ZWly
ZCA6LSkKCiAgVG9kYXksIEkgY2FuIG5vIGxvbmdlciByZXByb2R1Y2UgdGhlIGlzc3VlIGFmdGVy
ICdtYWtlIGNsZWFuJy4gSSdtIHN1cmUgdGhhdCBJIApkaWQgZG8gYSAnbWFrZSBjbGVhbicgeWVz
dGVyZGF5IGFzIHdlbGwuIEJ1dCBJIGFsc28gY2hhbmdlZCBhIGxvdCBvZiBvdGhlciAKdGhpbmdz
IGluIHRoZSBjb25maWcgYmV0d2VlbiB0aGVuIGFuZCBub3csIHNvIGl0J3MgaW1wb3NzaWJsZSB0
byByZW1lbWJlciB3aGF0IEkgCmNoYW5nZWQuIE9oIHdlbGwsIGxldCdzIGp1c3QgaWdub3JlLgoK
ICBSZWdhcmRzLAogIEFybm91dAoKW3NuaXBdCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
