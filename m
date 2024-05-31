Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D46CC25B7C
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 11:32:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 267AF41963;
	Fri, 31 May 2024 11:32:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C6VnnoL04HqI; Fri, 31 May 2024 11:32:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C75FB419B7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C75FB419B7;
	Fri, 31 May 2024 11:32:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CB9411D5166
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 11:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7328606CE
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 11:32:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yKJT54Md_SGn for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 11:32:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=gero.schwaericke@grandcentrix.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5D206606C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D206606C2
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D206606C2
 for <buildroot@buildroot.org>; Fri, 31 May 2024 11:32:18 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a66e9eac48fso132221066b.2
 for <buildroot@buildroot.org>; Fri, 31 May 2024 04:32:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717155136; x=1717759936;
 h=content-transfer-encoding:content-disposition:in-reply-to
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f4kdjHXuGeOyRzi/f5U5H64j+IgTv9oaUpkNaIp2QgY=;
 b=ijBBWUK0p65f+u8ZNPX5SkekKZukkWbfD4BgCmRt9n9bZNmpfVaNLeuj6W1LI0a+S5
 +5xIDfRtxN25r8HkQB1/R5dNwMHewZ+O1L2OiMzKY92XGO/DQlxtJI1SGS18pASV2dtq
 HAbe0EL/xvxEt8gfWIjVDDiCImXyY7P6DumvSFcQX00WweSGcTzEuqv7rSr/lJEwbVfW
 326ys+gTHzq34rpR3aVdBoVKOhjIoTSECibeXWdQfCv5ErOeKwWgfal5XiAKBqZUje7H
 MmkCm+de0ZcmCtiYPEDmTFchxpyZxGy8agNDy8kKEh2V53f9MSb/l7rhOEhar3EwPyqp
 cSwQ==
X-Gm-Message-State: AOJu0YwA6+9MoDKMwEyzbQkjr47TMXHCWRJaN10W6hfl9DiQi4VxRNRy
 FjNq5AsdN2YlHCbztiIjdUqkrj9DeOekegyJ5TfAq9IDN+GSlr0E5uiNatwf33WDjlDh8/mQ1hr
 TtE3K1at9UQstkfj8u2sAX5/W3ZCpMJ6E6NNIso3nh8FOFRVR8tNKucWY3l35Ng==
X-Google-Smtp-Source: AGHT+IG4SjMNMcALwcdhglnS6chHBqNZKFTuxG1KC3/ByXpx+DMHd9nJGaIiOTD0lNo5zFiRKDHqxA==
X-Received: by 2002:a17:906:3ac4:b0:a65:e807:3cf8 with SMTP id
 a640c23a62f3a-a6820517839mr118641866b.22.1717155135508; 
 Fri, 31 May 2024 04:32:15 -0700 (PDT)
Received: from theia ([2a02:8109:8abb:b200:f56c:121a:eadc:4470])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a67e74f061asm76218666b.78.2024.05.31.04.32.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 May 2024 04:32:15 -0700 (PDT)
Date: Fri, 31 May 2024 13:32:13 +0200
To: Bryan Brattlof <bb@ti.com>
Message-ID: <20240531113213.GA3595244@theia>
Mail-Followup-To: Bryan Brattlof <bb@ti.com>, buildroot@buildroot.org
References: <20240508-clk-fix-backport-v1-0-92b8e66fcac7@ti.com>
MIME-Version: 1.0
In-Reply-To: <20240508-clk-fix-backport-v1-0-92b8e66fcac7@ti.com>
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grandcentrix.net; s=google; t=1717155136; x=1717759936; darn=buildroot.org; 
 h=content-transfer-encoding:content-disposition:in-reply-to
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=f4kdjHXuGeOyRzi/f5U5H64j+IgTv9oaUpkNaIp2QgY=;
 b=44tAm8A8m9FPq3bem7plTObfXMCevD0cXJRMdAdbvVhd+m9GVjjvGwIN8UJFnsi7id
 NzEr1523rJ4wzERNtt4RVcgWwb7g8bZZLu5pG7LuDzEDGzDyABG3inq567rVisz4qadi
 NZ26KwmsOqiQrYmuffp6XFInMu2OkHJyLlDSuynKfAr+uAPNSlv8/Rr/VkOHFj8BqlSG
 D7TAby2ZmUQO4nsSl5jckMdQuO86qMvtlnxPKnirzJ7vxQ4sZVea6oIz7hyUudsUModl
 BAjUYO7zQ8/TgL1kL8MTYm2KXiKP2Pz+Juk4wLS1wev2Jw6ya7+LGhdMVQh1dvbsuBUN
 qHQg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grandcentrix.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grandcentrix.net header.i=@grandcentrix.net
 header.a=rsa-sha256 header.s=google header.b=44tAm8A8
Subject: Re: [Buildroot] [PATCH 0/2] board/ti: manually backport Linux patch
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
From: =?utf-8?q?Gero_Schw=C3=A4ricke_via_buildroot?= <buildroot@buildroot.org>
Reply-To: Gero =?utf-8?Q?Schw=C3=A4ricke?= <gero.schwaericke@grandcentrix.net>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQnJ5YW4sCgp0aGFua3MgZm9yIHRoZSBwYXRjaDogSSBpbmRlZWQgaGFkIHRoaXMgaXNzdWUg
d2l0aCB0aGUgbG9nIHNwYW0gYW5kIHRoZQpwYXRjaCBmaXhlZCBpdC4KClRlc3RlZC1ieTogR2Vy
byBTY2h3w6RyaWNrZSA8Z2Vyby5zY2h3YWVyaWNrZUBncmFuZGNlbnRyaXgubmV0PgoKSG93ZXZl
ciwgSSB0aGluayB0aGlzIHBhdGNoIG1pZ2h0IGJlIGEgYml0IHRvbyBjaHVybi15IHRvIGJlIG1l
cmdlZDogVGhlCjYuOCBrZXJuZWwgaXMgYWxyZWFkeSBFT0wgWzFdIGFuZCBpdCdzIG1lcmdlZCBp
biA2LjkgWzJdLiBJIHN1Z2dlc3Qgd2UKaW5zdGVhZCBidW1wIHRoZSBrZXJuZWwgdmVyc2lvbiBp
biB0aV9hbTYyeF9za19kZWZjb25maWcgYW5kCnRpX2FtNjR4X3NrX2RlZmNvbmZpZyBvbmNlIDYu
OSBpcyBpbiBidWlsZHJvb3QuCgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgta2Vy
bmVsLWFubm91bmNlLzIwMjQwNTMwMDgxMDQzLnJlbGVhc2UtNi44LjEyQGtkaXN0LmxpbnV4Lmtl
cm5lbC5vcmcvVC8KWzJdIGdpdCB0YWcgLS1jb250YWlucyAiOi9jbGs6IGtleXN0b25lOiBzY2kt
Y2xrOiBBZGRpbmcgc3VwcG9ydCBmb3Igbm9uIGNvbnRpZ3VvdXMgY2xvY2tzIgogICAgdjYuMTAt
cmMxCiAgICB2Ni45CiAgICB2Ni45LXJjMQogICAgdjYuOS1yYzIKICAgIHY2LjktcmMzCiAgICB2
Ni45LXJjNAogICAgdjYuOS1yYzUKICAgIHY2LjktcmM2CiAgICB2Ni45LXJjNwoKQmVzdCwKR2Vy
bwoKT24gVGh1LCBNYXkgMDksIDIwMjQgYXQgMDk6NDk6MjZBTSAtMDUwMCwgQnJ5YW4gQnJhdHRs
b2YgdmlhIGJ1aWxkcm9vdCB3cm90ZToKPiBIZWxsbyBldmVyeW9uZSwgCj4gCj4gVGhpcyBzaG9y
dCBzZXJpZXMgYmFja3BvcnRzIGEga2VybmVsIGNsb2NrIGRyaXZlciBmaXggdG8gcmVkdWNlIGEg
ZmFpciAKPiBhbW91bnQgb2YgbG9nIHNwYW0gd2hlbiB1c2luZyBuZXdlciBETSBhbmQgRE1TQyBm
aXJtd2FyZXMgdXNlZCBpbiBhbGwKPiBUSSdzIEszIGRldmljZXMuIFRoZSBmaXggaXMgYWxyZWFk
eSBtZXJnZWQgYW5kIGluIHRoZSB2Ni45LXJjWCBjeWNsZXMgCj4gdGhvdWdoIHdoaWxlIHdlIHdh
aXQgZm9yIHRoZSB2Ni45IGtlcm5lbCByZWxlYXNlLCBiYWNrcG9ydCB0aGlzIGZpeC4KPiAKPiBU
aGFuayB5b3UgZm9yIHJldmlld2luZwo+IH5Ccnlhbgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJyeWFu
IEJyYXR0bG9mIDxiYkB0aS5jb20+Cj4gLS0tCj4gQnJ5YW4gQnJhdHRsb2YgKDIpOgo+ICAgICAg
IGJvYXJkL3RpL2FtNjR4LXNrL3BhdGNoZXMvbGludXg6IGJhY2twb3J0IGxpbnV4IGNsb2NrIGZp
eAo+ICAgICAgIGJvYXJkL3RpL2FtNjJ4LXNrL3BhdGNoZXMvbGludXg6IGJhY2twb3J0IGxpbnV4
IGNsb2NrIGZpeAo+IAo+ICAuLi5lLXNjaS1jbGstQWRkaW5nLXN1cHBvcnQtZm9yLW5vbi1jb250
aWd1by5wYXRjaCB8IDc0ICsrKysrKysrKysrKysrKysrKysrKysKPiAgLi4uZS1zY2ktY2xrLUFk
ZGluZy1zdXBwb3J0LWZvci1ub24tY29udGlndW8ucGF0Y2ggfCA3NCArKysrKysrKysrKysrKysr
KysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTQ4IGluc2VydGlvbnMoKykKPiAtLS0KPiBiYXNl
LWNvbW1pdDogYzM3ZTk4ZjQ4NmUxZjkyMDFkMGZmOTFkOWU4MTY2ODQ5YWU0MjJhYwo+IGNoYW5n
ZS1pZDogMjAyNDA1MDgtY2xrLWZpeC1iYWNrcG9ydC0xZTYyNTI4ZjBmMzMKPiAKPiBCZXN0IHJl
Z2FyZHMsCj4gLS0gCj4gQnJ5YW4gQnJhdHRsb2YgPGJiQHRpLmNvbT4KPiAKPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCgoKCuKAk+KAk+KAkwoKCmdyYW5k
Y2VudHJpeCBHbWJIIHwgQSBWb2RhZm9uZSBDb21wYW55wqDCt8KgSG9sem1hcmt0IDHCoMK3wqA1
MDY3NiAKKkNvbG9nbmUqwqB8wqBQaG9lbml4c2Vlc3RyYXNzZSAxOMKgwrfCoDQ0MjYzICpEb3J0
bXVuZCrCoMK3wqBHZXJtYW55CnzCoGluIAo8aHR0cHM6Ly93d3cubGlua2VkaW4uY29tL2NvbXBh
bnkvZ3JhbmRjZW50cml4PiB8IHBob25lOiArNDktMjIxLTY3Ny04NjAtMCAKfMKgZW1haWw6IGhl
bGxvQGdyYW5kY2VudHJpeC5uZXQgPG1haWx0bzpoZWxsb0BncmFuZGNlbnRyaXgubmV0PgoKCmdy
YW5kY2VudHJpeCBjYXJlcyBhYm91dMKgcHJpdmFjeSAKPGh0dHBzOi8vZ3JhbmRjZW50cml4Lm5l
dC9kZS9wYWdlcy9wcml2YWN5bWFpbC8+CgpBbXRzZ2VyaWNodCBLw7ZsbiB8IEhSQiDCoAo3MDEx
OSB8IEdlc2Now6RmdHNmw7xocmVyOiBNLiBLcsO2bWVyLMKgIFIuIEjDpG5lbCB8IFVTdC4tSWRO
ci46IERFMjY2MzMzOTY5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
