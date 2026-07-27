Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9ACFC531D0
	for <buildroot@archiver.kernel.org>; Mon, 27 Jul 2026 12:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7095E80CA7;
	Mon, 27 Jul 2026 12:50:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bh2fOzw07iV1; Mon, 27 Jul 2026 12:50:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7674980CCA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785156648;
	bh=4SKE8s2Fiu6g40TzFwGRDxastnKBK4J3nMSlSxSslDU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gaXDptCYEEg0UUvLfyzczkD8VFXLqxwYa6KcbGjm0xg06Gx7MLx9lxiySWYCup7rf
	 Y/p6JrD5Lo1WML6OxHpscrxVA2ztjCaZPk7d20klBZAzMaT78zn2gZWogJTP3GBaac
	 JwGlwS+ZhtfEM+LoB34ug1wk6nz7RqdFM/e1Ns6m91Qw4mV1Y688IDhtr+Rglsq0sL
	 w2TW2wnHBLZ9R0pgLWyC4re/IKbmFPwn/EwZpyGymvIZUn2UPVZ7gx2098uNzZuTuc
	 zqusfI90f0Bibkjs264s/gQBMMJd3CcrJHTDCPXBKW9DtC9ElOWjdqHxlKaN1+hEb+
	 ubS7MKxbFwyDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7674980CCA;
	Mon, 27 Jul 2026 12:50:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 06F044C4
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 12:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E020E80CCA
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 12:50:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ho_MfFtZGlzb for <buildroot@buildroot.org>;
 Mon, 27 Jul 2026 12:50:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C928980CA7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C928980CA7
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C928980CA7
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 12:50:45 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-495437bb891so24951185e9.1
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 05:50:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785156643; x=1785761443;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=URq5PtZMGxi6DcIBLSOvoIrEJSxOxXzeSef80dXugDQ=;
 b=nhGGzGQmiDCgwjt8dz/zttzuFpxZbWqLLTRsM/gMpwHY8usL3G+e9JBYtmN0ANzqoQ
 ge2NES7vnl0KtEHQB40HCxZ4F2TRlLiXLPSEt5o6Bqx81XX62UNhMcDu/6y0uRkIGbkx
 Z87qMPRr1ZZxm1u5WsQcQ4lxdHvQIh133RJVDzg+8XCNbjYO2mejfzJUifdFGJxjo9Gu
 n5Iu/zSNf+LCTCUbrVIEHXiwUedXOh+7j9DIclnbojQWK1eKv5+dbGL+EamxYOo8hWxa
 Msvdn6AaU4m3W4btyK0i+dgamfpdEMe0EwZ5+RzEY8vaNl6Sh8BC0TQ3UOLFB/7AqVPQ
 7lzw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpP8Aoss42d9K+Lemm16VqiwsyYPxDznau6rhqoPahpx42VzZGTHVwg1zODlVOJqGvQmSmtgMP3Q+E=@buildroot.org
X-Gm-Message-State: AOJu0Yxf6+EfgdZIjx6p/4m6zYMRmK5QTZRH1vxsD59JgWzyfcUuk75L
 amW9hpjIdC7+oBuNjhSckCOvf5YdieMgkeQ0O1sJ9jEUy/NzQ+P8VgskVU7FjSWkm8i8fyK+45c
 L2Dtr
X-Gm-Gg: AR+sD12wShRROWVshkAaGNp3mHTPK/pzaOolHlSLvuUs8ntkq3ZaQtWW/R8b0izmAHL
 0c4rI70E1qnBFJ8ETIFDNJrAI+F//9qjJclgxgCiX0sa7qWLH6B8iEcsOrdQflDr344Gn4GfhmR
 QB32XDQEC79l8LWwyaOk2NQCGhzdZAHy2SC9zVn0SfXL3vh0Ha/viUOlSe8+D8Lu2uFxsysyU6m
 oRaHfV1DC6y0B5N12fCRMfbQMqS983eH5M2W6A1UgGknIEsTMTTyU1yQeAs+RJmgLo/CCgL2OSk
 wP1B0S20+bDPdXUHNwyxXOHKKlsANLhLvVQbJ5Jw7MUKy+szmE7bKgprIvCRIiAtl17WmBVIUKV
 xei+nUzblsPxUHHJ8hWS6lh8vejBt+1hVx5Sa2Dw3HPeJIHWTHgALOu+qblF/0nGZMAmEGPOTG3
 KJuk/W17BX6g0uH7Vze8i6vLH3fhuJwbnbFEmyo1Isu2TQZCryrg==
X-Received: by 2002:a05:600c:3b08:b0:494:1f7:8057 with SMTP id
 5b1f17b1804b1-496b5b3af32mr100837275e9.1.1785156643378; 
 Mon, 27 Jul 2026 05:50:43 -0700 (PDT)
Received: from mindpad (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4957d41ed1bsm204706865e9.2.2026.07.27.05.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2026 05:50:41 -0700 (PDT)
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Cc: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fiona Klute <fiona.klute@gmx.de>
Date: Mon, 27 Jul 2026 14:50:40 +0200
Message-ID: <20260727125040.380483-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <a00e615b-c2b2-42d9-b525-8852fc0d74a4@grenoble.cnrs.fr>
References: <a00e615b-c2b2-42d9-b525-8852fc0d74a4@grenoble.cnrs.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1785156643; x=1785761443; darn=buildroot.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=URq5PtZMGxi6DcIBLSOvoIrEJSxOxXzeSef80dXugDQ=;
 b=GTAERkOWXlh0cpZYvzn84Xyn52LXYjQKimx7Y0oAV4RAUKYswRg64LRS6ZT1JY8Z3h
 /86/FUxwluLb6TENWHMYxP7ch/V6tRJdCM7PxJU0hUSSV35MEa1daYTEMoNA6iDN7ROB
 j38/VMTCts+gCAu4dwQAj19ZAq/uk2qeHOUpp1+DWq+L4Hl4JWsrbKMAy2QqUMGTPSyI
 cnBEi0jGj0jto0oJjk+PUS9vY9sGoUFMwLoFWpUkAc4juQVsp0wjZmzMR6K4rBkLfC1d
 b2MPCxiYuUBZNt09UqAAByw/gd6w6zbouX+4osdK/g5kzX0eIlSC0hzzlfS/OxlwdrZV
 hBug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GTAERkOW
Subject: Re: [Buildroot] [PATCH 1/1] docs/manual: update 'releases' to
 reflect LTS changes
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

SGkgRWRnYXIsCgpJbiByZXBseSBvZjoKPiBPbiAyMDI2LTA3LTI3LCBUaG9tYXMgUGVyYWxlIHdy
b3RlOgo+ID4gV2l0aCB0aGUgcmVsZWFzZSBvZiAyMDI1LjAyLCBMVFMgcmVsZWFzZXMgYXJlIG5v
dyBtYWRlIGV2ZXJ5IHR3byB5ZWFycwo+ID4gd2l0aCBhIDMteWVhciBzdXBwb3J0Lgo+ID4gCj4g
PiBUaGlzIHJlZmxlY3QgdGhlIHRhYmxlIHNob3dlZCBhdCBodHRwczovL2x0cy5idWlsZHJvb3Qu
b3JnLyNyZWxlYXNlcy4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFBlcmFsZSA8dGhv
bWFzLnBlcmFsZUBtaW5kLmJlPgo+ID4gLS0tCj4gPiAgZG9jcy9tYW51YWwvcmVsZWFzZS1lbmdp
bmVlcmluZy5hZG9jIHwgMjIgKysrKysrKysrKysrLS0tLS0tLS0tLQo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAxMiBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdp
dCBhL2RvY3MvbWFudWFsL3JlbGVhc2UtZW5naW5lZXJpbmcuYWRvYyBiL2RvY3MvbWFudWFsL3Jl
bGVhc2UtZW5naW5lZXJpbmcuYWRvYwo+ID4gaW5kZXggMGNmMzgxODNmOS4uZTIwMmU3MDg2OCAx
MDA2NDQKPiA+IC0tLSBhL2RvY3MvbWFudWFsL3JlbGVhc2UtZW5naW5lZXJpbmcuYWRvYwo+ID4g
KysrIGIvZG9jcy9tYW51YWwvcmVsZWFzZS1lbmdpbmVlcmluZy5hZG9jCj4gPiBAQCAtNSwxOSAr
NSwyMSBAQAo+ID4gID09IFJlbGVhc2UgRW5naW5lZXJpbmcKPiA+ICA9PT0gUmVsZWFzZXMKPiA+
ICAKPiA+IC1UaGUgQnVpbGRyb290IHByb2plY3QgbWFrZXMgcXVhcnRlcmx5IHJlbGVhc2VzIHdp
dGggbW9udGhseSBidWdmaXgKPiA+IC1yZWxlYXNlcy4gIFRoZSBmaXJzdCByZWxlYXNlIG9mIGVh
Y2ggeWVhciBpcyBhIGxvbmcgdGVybSBzdXBwb3J0Cj4gPiAtcmVsZWFzZSwgTFRTLgo+ID4gK1Ro
ZSBCdWlsZHJvb3QgcHJvamVjdCBtYWtlcyBxdWFydGVybHkgcmVsZWFzZXMgd2l0aCBtb250aGx5
IGJ1Z2ZpeCByZWxlYXNlcy4KPiA+ICtTdGFydGluZyB3aXRoIDIwMjUuMDIsIGxvbmctdGVybSBz
dGFibGUgKExUUykgcmVsZWFzZXMgYXJlIG1hZGUgZXZlcnkgdHdvIHllYXJzCj4gCj4gQ29udmVu
dGlvbmFsbHksIOKAnExUU+KAnSBzdGFuZHMgZm9yIOKAnExvbmctVGVybSBTdXBwb3J04oCdLiBU
aGUgTFRTIHBhZ2VbMV0KPiBvbiB0aGUgQnVpbGRyb290IFdlYiBzaXRlIGhhcyB0aGUgd29yZGlu
Z3M6Cj4gCj4gICogbG9uZy10ZXJtIHN1cHBvcnQKPiAgKiBMb25nLXRlcm0gc3VzdGFpbmFiaWxp
dHkKPiAgKiBsb25nLXRlcm0gc3RhYmxlCj4gCj4gYnV0IG9ubHkgdGhlIGZpcnN0IG9uZSBzZWVt
cyBjb21tb25seSBhYmJyZXZpYXRlZCBhcyDigJxMVFPigJ0uCj4gCj4gV2hhdCBhYm91dCBiZWlu
ZyBtb3JlIGV4cGxpY2l0LCBsaWtlIOKAnFN0YXJ0aW5nIHdpdGggMjAyNS4wMiwgdGhlIGZpcnN0
Cj4gcmVsZWFzZSBvZiBldmVyeSBvZGQtbnVtYmVyZWQgeWVhciBpcyBbYW4gTFRTXeKAnT8KCklu
ZGVlZCB0aGlzIGxvb2sgYmV0dGVyLgoKPiA+ICthbmQgc3VwcG9ydGVkIGZvciB0aHJlZSB5ZWFy
cy4KPiA+ICAKPiA+IC0gLSBRdWFydGVybHkgcmVsZWFzZXM6IDIwMjAuMDIsIDIwMjAuMDUsIDIw
MjAuMDgsIGFuZCAyMDIwLjExCj4gPiAtIC0gQnVnZml4IHJlbGVhc2VzOiAyMDIwLjAyLjEsIDIw
MjAuMDIuMiwgLi4uCj4gPiAtIC0gTFRTIHJlbGVhc2VzOiAyMDIwLjAyLCAyMDIxLjAyLCAuLi4K
PiA+ICsgLSBMVFMgcmVsZWFzZXM6IDIwMjUuMDIsIDIwMjcuMDIsIDIwMjkuMDIgLi4uCj4gPiAr
IC0gU3RhYmxlIHJlbGVhc2VzOiAyMDI1LjA1LCAyMDI1LjA4LCAyMDI1LjExIGFuZCAyMDI2LjAy
LCAuLi4KPiAKPiBJIHdvdWxkIGF2b2lkIOKAnGFuZOKAnSwgd2hpY2ggaW1wbGllcyB0aGF0IHdo
YXQgY29tZXMgaXMgdGhlIGxhc3QgZWxlbWVudAo+IGluIHRoZSBsaXN0LCBzb21ld2hhdCBjb250
cmFkaWN0aW5nIHRoZSBlbGxpcHNpcyB0aGF0IGZvbGxvd3MuCgpZZXMsIEknbSBnb25uYSBkcm9w
IHRoYXQgJ2FuZCcgCgo+IE5vdGUgdGhhdCwgaW4gdGhlIHByZXZpb3VzIHZlcnNpb24gb2YgdGhp
cyBwYWdlLCBpdCBpcyBjbGVhciB0aGF0Cj4g4oCcTFRTIHJlbGVhc2Vz4oCdIGFyZSBhIHN1YnNl
dCBvZiDigJxzdGFibGUgcmVsZWFzZXPigJ0uIFdpdGggdGhpcyBjaGFuZ2UsIGl0Cj4gbG9va3Mg
bW9yZSBsaWtlIG5vbi1vdmVybGFwcGluZyBjYXRlZ29yaWVzLiBJZiB0aGlzIGlzIGludGVuZGVk
LCBtYXliZQo+IHRoZSDigJxzdGFibGXigJ0gY2F0ZWdvcnkgY291bGQgYmUgcmVuYW1lZCDigJxp
bnRlcmltIHJlbGVhc2Vz4oCdLiBUaGlzIGhhcyBhbgo+IGltcGxpY2F0aW9uIGZvciB0aGUgbmV4
dCBzZW50ZW5jZS4KCkluZGVlZCwgaW1vIHRoZSBwcmV2aW91cyBjYXRlZ29yaXphdGlvbiBpbnRv
IHN0YWJsZSAtIGx0cyBhcyBhIHN1YnNldCBtYWRlIGl0Cm1vcmUgY29uZnVzaW5nIHRvIG1lIGFu
ZCBjbGVhcmx5IG1ha2luZyB0aGUgZGlmZmVyZW5jZSBleHBsYWluIHRoZSBkaWZmZXJlbmNlCmxp
ZmVjeWNsZSBiZXR0ZXIuCgpJIHdvdWxkbid0IHJlbmFtZSBpdCB0aG91Z2ggYXMgcGVvcGxlIGFy
ZSBhbHJlYWR5IHVzaW5nIHRoaXMgbmFtaW5nIGNvbnZlbnRpb24uCgpEaWQgaXQgbWFrZSBtb3Jl
IHNlbnNlIHRvIHlvdSB0byBjb25zaWRlciBMVFMgYXMgYSBzdWJzZXQgb2Ygc3RhYmxlID8KCj4g
PiArIC0gQnVnZml4IHJlbGVhc2VzOiAyMDI1LjAyLjEsIDIwMjUuMDIuMiwgLi4uCj4gPiAgCj4g
PiAtUmVsZWFzZXMgYXJlIHN1cHBvcnRlZCB1bnRpbCB0aGUgZmlyc3QgYnVnZml4IHJlbGVhc2Ug
b2YgdGhlIG5leHQKPiA+IC1yZWxlYXNlLCBlLmcuLCAyMDIwLjA1LnggaXMgRU9MIHdoZW4gMjAy
MC4wOC4xIGlzIHJlbGVhc2VkLgo+ID4gK1N0YWJsZSByZWxlYXNlcyBhcmUgc3VwcG9ydGVkIHVu
dGlsIHRoZSBuZXh0IHJlbGVhc2UsIGUuZy4sIDIwMjUuMDUueCBpcyBFT0wKPiA+ICt3aGVuIDIw
MjUuMDggaXMgcmVsZWFzZWQuCj4gCj4gSWYg4oCcTFRTIHJlbGVhc2Vz4oCdIGlzIGEgc3Vic2V0
IG9mIOKAnHN0YWJsZSByZWxlYXNlc+KAnSwgdGhlbiB0aGlzIGlzCj4gaW5jb3JyZWN0OiBpdCBz
aG91bGQgYmUg4oCcTm9uLUxUUyBzdGFibGUgcmVsZWFzZXMgYXJlIHN1cHBvcnRlZC4uLuKAnS4K
PiAKPiBSZWdhcmRzLAo+IAo+IEVkZ2FyLgo+IAo+IFsxXSBodHRwczovL2J1aWxkcm9vdC5vcmcv
bHRzLmh0bWwKPiAKPiA+ICAKPiA+IC1MVFMgcmVsZWFzZXMgYXJlIHN1cHBvcnRlZCB1bnRpbCB0
aGUgZmlyc3QgYnVnZml4IHJlbGVhc2Ugb2YgdGhlIG5leHQKPiA+IC1MVFMsIGUuZy4sIDIwMjAu
MDIueCBpcyBzdXBwb3J0ZWQgdW50aWwgMjAyMS4wMi4xIGlzIHJlbGVhc2VkLgo+ID4gK0xUUyBy
ZWxlYXNlcyBhcmUgc3VwcG9ydGVkIGZvciB0aHJlZSB5ZWFycywgd2l0aCBhIG9uZS15ZWFyIG92
ZXJsYXAgd2l0aCB0aGUKPiA+ICtuZXh0IExUUyByZWxlYXNlLCBlLmcuLCAyMDI1LjAyLnggaXMg
RU9MIHdoZW4gMjAyOC4wMiBpcyByZWxlYXNlZC4KPiA+ICsKPiA+ICtTZWUgdGhlIHRhYmxlIGF0
IGh0dHBzOi8vbHRzLmJ1aWxkcm9vdC5vcmcvI3JlbGVhc2VzW2x0cy5idWlsZHJvb3Qub3JnXS4K
PiA+ICAKPiA+ICA9PT0gRGV2ZWxvcG1lbnQKPiA+ICAKClRoYW5rcyBmb3IgdGhlIGNvbW1lbnRz
ICEKUEVSQUxFIFRob21hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
