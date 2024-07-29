Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B541C3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 19:27:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F706810A3;
	Mon, 29 Jul 2024 19:27:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o3JjIwjJRAk9; Mon, 29 Jul 2024 19:27:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B45AA810A8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B45AA810A8;
	Mon, 29 Jul 2024 19:27:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D1E9D1BF399
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 19:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC3EC6066F
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 19:27:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pt5jWjaZ_FCZ for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 19:27:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5B8CC6065A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B8CC6065A
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5B8CC6065A
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 19:27:08 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a7a83a968ddso531362566b.0
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 12:27:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722281226; x=1722886026;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dMwK+SM1eZXz/1M/mSZvseulcowJb3lI94lQPB2Hp30=;
 b=K1Yzdxxa76SRfhxOESznvTHwRw8uFB96RK8LIaOWSdFQsVPimaAr8m7ssyQ+5zHy1p
 Sf3td8l3nhVDs4wxK8qeTKb3MwxZaYs0YevHLfpwqB2kqZjfaQo9DqFtpPslRoirecL2
 CeDZWrkUxXz9tRHZYm/r0w0n2AFVMeZaR4l6dB/n6k5XGQviFycD/xukeeQ3SHrdf7pF
 HROWPRncVcYfexM+21GjvgaVUCZph4lrFP/UnMhfF8Zko6j63UcksE14ha8z2Web6oq3
 CcKogh2oVS0FRraZXav3ir+bkqHgo8bIsZZLX7/fv/5fPCRVdZEWeRTef4B1L0pctta/
 6ctw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzqJccsUGQUEIUP0tdK5MTOBckKsVGvuyx8JR9nGCkMsb9K5M/trDTQzet3ijsjNBxTHgY88ykMzy/gmaRw7+43BBLmlzQAw==
X-Gm-Message-State: AOJu0Yywl3l+x5M/BgOORUORLsJm+FqHXZI67lOIK3FmzI9PXHUl8Pbl
 RJtXeDb+DHUg1RjtIemTd+/my12kNIrt48HSS6tp8gtf43VSO2X1MNsxafXYb2SPTU6lRke5KLJ
 AAKIACg==
X-Google-Smtp-Source: AGHT+IFybANT+m9ca1QOO+haF9xgoo0bGDJiMmP0e6bw/mhoMKyGbcPcsU4FL1yzh4zOQfSv9L9RCw==
X-Received: by 2002:a17:907:7292:b0:a7a:a212:be4e with SMTP id
 a640c23a62f3a-a7d3ff58052mr534900966b.7.1722281225411; 
 Mon, 29 Jul 2024 12:27:05 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com.
 [209.85.218.50]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad4348bsm542402666b.118.2024.07.29.12.26.57
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jul 2024 12:27:01 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a7abe5aa9d5so454644166b.1
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 12:26:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVdgnzROdt6A8O7tIPvbqkpZdmJOJ278j1Qa94+b6+VTKICQlHx8K3O6/3br3QlTfIe6JmjNVCNj0SFWA11hK2BZ8Q07R+usg==
X-Received: by 2002:a17:906:7315:b0:a7a:9f0f:ab18 with SMTP id
 a640c23a62f3a-a7d3ffa21b6mr676884366b.20.1722281217091; Mon, 29 Jul 2024
 12:26:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240727202340.1484781-1-james.hilliard1@gmail.com>
 <20240729203325.3560903e@windsurf>
In-Reply-To: <20240729203325.3560903e@windsurf>
Date: Mon, 29 Jul 2024 12:26:46 -0700
X-Gmail-Original-Message-ID: <CA+h8R2rym0T+bcy3mUUSXKxwYtNH7KuTV0oUV-7PdCQdA6L5jQ@mail.gmail.com>
Message-ID: <CA+h8R2rym0T+bcy3mUUSXKxwYtNH7KuTV0oUV-7PdCQdA6L5jQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1722281226; x=1722886026; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dMwK+SM1eZXz/1M/mSZvseulcowJb3lI94lQPB2Hp30=;
 b=YonYgSzaUQiz9goPNsQhENWorzTld3cWv0h8wT1hv2GnsbtExiIqDkNWuwXb8yr1uN
 ZZIdcx+qGh9BZYNk/+AnSuiPHYQTbrsJ/NkdmAPL1U6rEHt51gaYeg1LyKuy3GoIBQ6A
 8P41pWKJKKEVtks5L0cJ3yfrd81BgRa0KHTOyctvIvF2NrzKypTl4FHlPpj26JjCXP/u
 bks8AI0Kzds1OdE4Pa8crCJcuqH+Kga0qav1F/ZA/Fy/D5xeP4R+1DmxsA/zJv6fcihH
 msqtycDQiIXMrHrHFdEFJqqDpvR8ROF4A/J3WzgMmhbamm82kH+Cjro0dU9x2V1wKXCo
 N8sw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=YonYgSza
Subject: Re: [Buildroot] [PATCH v3 1/1] package/tailscale: new package
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Anisse Astier <anisse@astier.eu>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhvbWFzLCBKYW1lcywKCk9uIE1vbiwgSnVsIDI5LCAyMDI0IGF0IDExOjMz4oCvQU0gVGhvbWFz
IFBldGF6em9uaQo8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBIZWxs
byBKYW1lcywKPgo+IE9uIFNhdCwgMjcgSnVsIDIwMjQgMTQ6MjM6NDAgLTA2MDAKPiBKYW1lcyBI
aWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiA+IFNpZ25lZC1v
ZmYtYnk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgo+ID4gLS0t
Cj4gPiBDaGFuZ2VzIHYyIC0+IHYzOgo+ID4gICAtIHNldCByZXF1aXJlZCBDT05GSUdfVFVOIGtl
cm5lbCBjb25maWcgb3B0aW9uCj4gPiBDaGFuZ2VzIHYxIC0+IHYyOgo+ID4gICAtIGRvbid0IHNl
dCBHT1BST1hZCj4gPiAtLS0KPiA+ICBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAgICB8
ICAxICsKPiA+ICBwYWNrYWdlL3RhaWxzY2FsZS9Db25maWcuaW4gICAgICB8ICA4ICsrKysrKysr
Cj4gPiAgcGFja2FnZS90YWlsc2NhbGUvdGFpbHNjYWxlLmhhc2ggfCAgMyArKysKPiA+ICBwYWNr
YWdlL3RhaWxzY2FsZS90YWlsc2NhbGUubWsgICB8IDIyICsrKysrKysrKysrKysrKysrKysrKysK
PiA+ICA0IGZpbGVzIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKykKPiA+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgcGFja2FnZS90YWlsc2NhbGUvQ29uZmlnLmluCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IHBhY2thZ2UvdGFpbHNjYWxlL3RhaWxzY2FsZS5oYXNoCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IHBhY2thZ2UvdGFpbHNjYWxlL3RhaWxzY2FsZS5tawo+Cj4gVGhhbmtzIEphbWVzIGZvciB0aGlz
IG5ldyBwYWNrYWdlLiBJIHRyaWVkIGJ1aWxkaW5nIGl0LCBidXQgaXQgZmFpbHMKPiBkdXJpbmcg
dGhlIGRvd25sb2FkIHdpdGg6Cj4KPiB2ZXJpZnlpbmcgZnlicmlrLmlvL2NyZG9jQHYwLjYuMzog
Y2hlY2tzdW0gbWlzbWF0Y2gKPiAgICAgICAgIGRvd25sb2FkZWQ6IGgxOkF3aSt2K1VSdGo1RHZQ
cjBMTGRWclcyTm45L0cxWTdhR3BVUEcxSUFURTQ9Cj4gICAgICAgICBnby5zdW06ICAgICBoMTpq
Tk5BVklOdTh1cDV2ckxhMGpyVjd6N0hTbHlIRi82bE5PckF0clh3WWxJPQo+Cj4gQ291bGQgeW91
IGhhdmUgYSBsb29rIGludG8gdGhpcz8KClRoaXMgd2FzIHNvbHZlZCBhbHJlYWR5IG9uIFRhaWxz
Y2FsZSBtYXN0ZXIgYnJhbmNoOgoKaHR0cHM6Ly9naXRodWIuY29tL3RhaWxzY2FsZS90YWlsc2Nh
bGUvaXNzdWVzLzEyODU5I2lzc3VlY29tbWVudC0yMjM5MTU3NTYzCgpJdCB3YXMgZml4ZWQgaW4g
dGhpcyBjb21taXQ6CgpodHRwczovL2dpdGh1Yi5jb20vdGFpbHNjYWxlL3RhaWxzY2FsZS9jb21t
aXQvMGY1N2I5MzQwYjE0NDlkZTgxMWE5ZGFjZDA5OGE3NjkxOTJjNDM0NAoKSSBkb24ndCBzZWUg
YSByZWxlYXNlIHlldCB3aXRoIHRoaXMgY29tbWl0LiBXZSBjb3VsZCBlaXRoZXIgdGFrZSB0aGUK
bGF0ZXN0IG1hc3RlciBjb21taXQgaGFzaCBmb3Igbm93IG9yIGFwcGx5IGEgcGF0Y2ggd2l0aCB0
aGlzIGNvbW1pdC4KCj4gQWxzbywgY291bGQgeW91IG1ha2Ugc3VyZSB0byBhZGQgdGhlIGVudHJ5
IGluIHRoZSBERVZFTE9QRVJTIGZpbGU/CgpZb3UgY291bGQgYWRkIG1lIHRvIHRoYXQgbGlzdCBh
cyB3ZWxsIGlmIHlvdSBsaWtlLgoKQmVzdCByZWdhcmRzLApDaHJpc3RpYW4gU3Rld2FydApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
