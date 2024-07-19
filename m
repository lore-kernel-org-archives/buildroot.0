Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF3ECC3DA59
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 18:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3CE66078D;
	Fri, 19 Jul 2024 18:06:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sZpZvVkK1fWe; Fri, 19 Jul 2024 18:06:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F6D3607D2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F6D3607D2;
	Fri, 19 Jul 2024 18:06:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 69F461BF990
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 18:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 629FE83EC4
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 18:06:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id narmuEQMu0bB for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 18:06:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0826282126
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0826282126
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0826282126
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 18:06:41 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4266ed6c691so12971705e9.3
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 11:06:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721412400; x=1722017200;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mHPFHcSYkeKCOQPCBkmt4xaPc4FvNYhkHxRApDIgYqc=;
 b=O7EkYnHYbCoHG5qW8pED/LTPcZNlYoG6pyxHr2L7MIF/KoLli1MKy4x07uJHbZGzF3
 /hkEmHSMXjHxspQwyA+kj4y/3roah09uN7UGurzBcfu4G2yBYzqvD5E+WuYVwB8aom7h
 fVefuGy/Z1JXwo4G7NdgRIrE3nlLJNnvCnQw56eeKTlmzPCHbG+uhWqieGO9SdMW8xGl
 l7HcO6gumZFh6pyRxtNyjLDt1uDtW37LXc9y65jwx/ZBIyJfU/nwBGJgJ/chc+S96Poe
 b9TMfKI2vGsw/yD92c3EQS2WRisQ/r/B5Wnfblz7gfHUgdRmCZn9E/1KbU4WBWrUKMXh
 5d/w==
X-Gm-Message-State: AOJu0YwR1vc32iaam1gGVT7qB/lqjLR1muEFBT4+NCF9EwRkTeQlfmzp
 IHICRtgQ2ld4FoA7gVP8IafZNhiQe+R543Ei2rb2gF0A6XNkyXZE5TgiV4juIxRhPJUpg4QCa7a
 r
X-Google-Smtp-Source: AGHT+IEkC50ZdKgQqmQDZ4Z+QOZWO2INl+AcINdN/flVNWydQ7EQ6mgtPeynZ7trogOO8FX3TT7hLg==
X-Received: by 2002:a05:6000:2cb:b0:368:7943:146f with SMTP id
 ffacd0b85a97d-368794314c4mr2057161f8f.26.1721412399584; 
 Fri, 19 Jul 2024 11:06:39 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36878694ba0sm2244223f8f.61.2024.07.19.11.06.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jul 2024 11:06:38 -0700 (PDT)
Message-ID: <798cfbed-ce54-4b4a-8a63-e1e88ad842d3@mind.be>
Date: Fri, 19 Jul 2024 20:06:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
References: <20240709-tipidee-v2-0-a69a8668005e@gmx.net>
 <20240709-tipidee-v2-8-a69a8668005e@gmx.net>
 <f6fe9b7b-28e4-48e0-bac8-7aa87d787473@mind.be> <Zpp53mr6-TUO7rVD@probook>
Content-Language: en-GB
In-Reply-To: <Zpp53mr6-TUO7rVD@probook>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1721412400; x=1722017200; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mHPFHcSYkeKCOQPCBkmt4xaPc4FvNYhkHxRApDIgYqc=;
 b=bcO/VaODVMAdmUUURmg/yevxLEkIW1UlfoJYQ3P837KRVZRAM27+w6J3VSydyPhudF
 gSs3DoXbegWg+59ZFdYqpTgscmRQYzDbdJ2gX1yLx7/0RZoTu+94pzfoAISYnmMYrWDB
 YdRC2CWR0ds7tjYQG43py/hZV3kCzdeiq/rF96253lbZ2HnyQi5+gCUXyYMZrR6HZUPD
 LY/Iw8ad7eNYDFsFYl7BXuCmRFIMc/knmPQK8UU2J3TCYqgwynJy91IQDA/OBYXqdLuA
 CVfLwx8ugDhiFoaGwpYdR9bQbjG+QjiV0kBayL0yOCMNiIm0IdKHdQSZlQwBTCXSzndr
 kNaw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=bcO/VaOD
Subject: Re: [Buildroot] [PATCH v2 8/8] tipidee: new package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxOS8wNy8yMDI0IDE2OjM2LCBKLiBOZXVzY2jDpGZlciB3cm90ZToKPiBPbiBTdW4sIEp1
bCAxNCwgMjAyNCBhdCAxMDoyMjozMFBNICswMjAwLCBBcm5vdXQgVmFuZGVjYXBwZWxsZSB3cm90
ZToKPj4KPj4KPj4gT24gMDkvMDcvMjAyNCAwMDo0NSwgSi4gTmV1c2Now6RmZXIgdmlhIGJ1aWxk
cm9vdCB3cm90ZToKPj4+IFNpZ25lZC1vZmYtYnk6IEouIE5ldXNjaMOkZmVyIDxqLm5ldXNjaGFl
ZmVyQGdteC5uZXQ+Cj4+Cj4+ICAgQXBwbGllZCBzZXJpZXMgdG8gbWFzdGVyLCB0aGFua3MuIFRo
ZSByZXN0IHdlbnQgaW4gdW5jaGFuZ2VkLCBidXQgaW4gdGhpcwo+PiBvbmUsIEkgbWFkZSBxdWl0
ZSBhIGZldyBjaGFuZ2VzOgo+Pgo+PiAgICAgICAtIFJlbW92ZSBCUjJfUEFDS0FHRV9USVBJREVF
X0NPTkZJR1VSQVRJT04sIHVzZSBlbXB0eSB2YWx1ZSBvZgo+PiAgICAgICAgIEJSMl9QQUNLQUdF
X1RJUElERUVfQ09ORklHX0ZJTEUgdG8gZmxhZyBmYWxzZS4KPj4gICAgICAgLSBSZW5hbWUgQlIy
X1BBQ0tBR0VfVElQSURFRV9DT05GSUdVUkFUSU9OX0ZJTEUgdG8KPj4gICAgICAgICBCUjJfUEFD
S0FHRV9USVBJREVFX0NPTkZJR19GSUxFLgo+PiAgICAgICAtIERlZmF1bHQgQlIyX1BBQ0tBR0Vf
VElQSURFRV9DT05GSUdfRklMRSB0byBlbXB0eS4KPiAKPiBVbmZvcnR1bmF0ZWx5LCB0aGlzIGFw
cHJvYWNoIGNhdXNlcyBhdXRvYnVpbGQgZmFpbHVyZXMgYmVjYXVzZQo+IHRpcGlkZWUtY29uZmln
IGNhbm5vdCB3b3JrIHdpdGhvdXQgYSBmaWxlOgo+IAo+IAlodHRwOi8vYXV0b2J1aWxkLmJ1aWxk
cm9vdC5vcmcvP3JlYXNvbj10aXBpZGVlLTAuMC41LjAKPiAKPiBXaGF0J3MgYSBnb29kIHdheSB0
byBmaXggdGhpcz8KCiAgT29wcywgdGhhdCdzIG15IGJhZCwgSSBzaG91bGQgaGF2ZSBxc3RyaXAn
ZWQgYmVmb3JlIHRoZSBjb25kaXRpb24uIEkgZGlyZWN0bHkgCnB1c2hlZCB0aGUgZml4IGJlbG93
LgoKICBSZWdhcmRzLAogIEFybm91dAoKICAgICBjb21taXQgMjdlN2IwYmYxNGNmMjMyMWUyYWFl
NjRlNDkwNjcxZjVjZmEyMjgxZCAoSEVBRCAtPiBtYXN0ZXIpCiAgICAgQXV0aG9yOiBBcm5vdXQg
VmFuZGVjYXBwZWxsZSAoRXNzZW5zaXVtL01pbmQpIDxhcm5vdXRAbWluZC5iZT4KICAgICBEYXRl
OiAgIEZyaSBKdWwgMTkgMjA6MDM6NTMgMjAyNAoKICAgICBwYWNrYWdlL3RpcGlkZWU6IGZpeCBp
bnN0YWxsIHdpdGhvdXQgY29uZmlnIGZpbGUKCiAgICAgV2hlbiB0aGUgdGlwaWRlZSBwYWNrYWdl
IHdhcyBhZGRlZCBpbiBjb21taXQKICAgICAxN2RlYWY2MGY2NmZjMDhhNzk2MjMzOTIwYTEwNGU1
MjMzYjUwMWUwLCB0aGUgY29tbWl0dGVyIHJlZmFjdG9yZWQgaXQgc28KICAgICBubyBzZXBhcmF0
ZSBib29sZWFuIG9wdGlvbiBpcyByZXF1aXJlZCB0byBlbmFibGUgdGhlIGNvbmZpZyBmaWxlLgog
ICAgIEhvd2V2ZXIsIGluIGRvaW5nIHNvLCB0aGUgY2FzZSB3aGVyZSB0aGUgY29uZmlnIGZpbGUg
aXMgZW1wdHkgd2FzIG5vdAogICAgIGNvcnJlY3RseSBoYW5kbGVkOiBCUjJfUEFDS0FHRV9USVBJ
REVFX0NPTkZJR19GSUxFIGlzIG5ldmVyIGVtcHR5CiAgICAgYmVjYXVzZSBldmVuIHdpdGggdGhl
IGVtcHR5IHN0cmluZyBpdCBjb250YWlucyAiIi4KCiAgICAgRm94IGJ5IHFzdHJpcCdpbmcgYmVm
b3JlIGNoZWNraW5nIGZvciBlbXB0eS4KCiAgICAgU2lnbmVkLW9mZi1ieTogQXJub3V0IFZhbmRl
Y2FwcGVsbGUgPGFybm91dEBtaW5kLmJlPgoKICAgICBkaWZmIC0tZ2l0IGEvcGFja2FnZS90aXBp
ZGVlL3RpcGlkZWUubWsgYi9wYWNrYWdlL3RpcGlkZWUvdGlwaWRlZS5tawogICAgIGluZGV4IDFl
MTU3ODJhYTQuLjkxNWI0Zjg0YmQgMTAwNjQ0CiAgICAgLS0tIGEvcGFja2FnZS90aXBpZGVlL3Rp
cGlkZWUubWsKICAgICArKysgYi9wYWNrYWdlL3RpcGlkZWUvdGlwaWRlZS5tawogICAgIEBAIC0z
MywxMiArMzMsMTMgQEAgZGVmaW5lIFRJUElERUVfSU5TVEFMTF9UQVJHRVRfQ01EUwogICAgICAg
ICAgICAgcm0gLWYgJChUQVJHRVRfRElSKS9saWJleGVjL3RpcGlkZWUtY29uZmlnLXByZXByb2Nl
c3MKICAgICAgZW5kZWYKCiAgICAgLWlmbmVxICgkKEJSMl9QQUNLQUdFX1RJUElERUVfQ09ORklH
X0ZJTEUpLCkKICAgICArVElQSURFRV9DT05GSUdfRklMRSA9ICQoY2FsbCBxc3RyaXAsICQoQlIy
X1BBQ0tBR0VfVElQSURFRV9DT05GSUdfRklMRSkpCiAgICAgK2lmbmVxICgkKFRJUElERUVfQ09O
RklHX0ZJTEUpLCkKICAgICAgVElQSURFRV9ERVBFTkRFTkNJRVMgKz0gaG9zdC10aXBpZGVlCgog
ICAgICBkZWZpbmUgVElQSURFRV9JTlNUQUxMX0NPTkZJRwogICAgICAgICAgICAgJChIT1NUX0RJ
UikvYmluL3RpcGlkZWUtY29uZmlnIFwKICAgICAtICAgICAgICAgICAgICAgIC1pICQoY2FsbCBx
c3RyaXAsICQoQlIyX1BBQ0tBR0VfVElQSURFRV9DT05GSUdfRklMRSkpIFwKICAgICArICAgICAg
ICAgICAgICAgLWkgIiQoVElQSURFRV9DT05GSUdfRklMRSkiIFwKICAgICAgICAgICAgICAgICAg
ICAgLW8gJChUQVJHRVRfRElSKS9ldGMvdGlwaWRlZS5jb25mLmNkYgogICAgICBlbmRlZgogICAg
ICBUSVBJREVFX1BPU1RfSU5TVEFMTF9UQVJHRVRfSE9PS1MgKz0gVElQSURFRV9JTlNUQUxMX0NP
TkZJRwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
