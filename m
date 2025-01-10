Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C50E7719C
	for <buildroot@archiver.kernel.org>; Fri, 10 Jan 2025 20:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC1C3412EB;
	Fri, 10 Jan 2025 20:16:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NHnnn-UB4p5k; Fri, 10 Jan 2025 20:16:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD2F7412E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD2F7412E8;
	Fri, 10 Jan 2025 20:16:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B6205942
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 20:16:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A40A541398
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 20:16:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g2idniXd1Hns for <buildroot@buildroot.org>;
 Fri, 10 Jan 2025 20:16:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 211F241396
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 211F241396
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 211F241396
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 20:16:01 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-385e06af753so1369007f8f.2
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 12:16:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736540160; x=1737144960;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S71ipVXq07erSw/yF9/ouQhV0/3+rbqUQ98exNzvoe0=;
 b=SKhq/bH0dRBLqGjwD3wgEXGPnMfqMeRjHA0UORMPCl3lo3sNNnh2fLSjAoWQ7dyfmW
 BJ6O3lS/1hXESTD/VQUl6kTG790aVYKI3L44dSLzK8AyNDvqTDjn3l59Ml885WMFxTNr
 HSpMSpadbfvmy5B4VKQd8dW6kbElr3YtI2VjykTg1PU6fpHF7YlwH2jrUARQEhNVdWuu
 WY1vA5EMBE9YY9OqtvI7UDxOOpqlCo810najLp4F2HUN0SU9UuMw06IZpzl+wKjpFsYE
 x0/c8MREYYxXeGNKaWGYp+nEVBvQNrgjx1b4OyBsBvDI4Plw50zVxVkpUMZun0y7PTlE
 reRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUM4/+VXIbgJr39c/Nw3DRyAEjknzS93BaWdodC3kA2UVANcyROpSt9WO+IkRb36YDO3YhHt3qVyfU=@buildroot.org
X-Gm-Message-State: AOJu0YwLue+dHRuCSHbL6mwNUBSMXNDS21kQr88bE1RPnTKKM0RaV57Q
 BAs74zkfs6RCE7oTscOUMSAsQy8e4CC8BTrMllnu+dazdnGhpXK2svA3Y/uPxsA=
X-Gm-Gg: ASbGncsAJOQis3GOwoa5wKH+1eh8ZgH+cvIeYf54/ivWRZUUaVbdJWBBUGPlht7j8VR
 G5lPapwlaiOCnXnAkyd/QxWQKKP6btb8VAsnh6zkT5d4bg5dBk0kvHFtQOa46hsdnykHBReFLKK
 iTo2wX4reFo2FVkW4zQg6hMnYSc6rtcFvcoXZPLHW2Zcjf1kCcf4GOLYLecyT+UITBhSW7VI3oD
 t7p0f/uetlwgsrhrFNzqtkUqcKFQ1bdiKjQpQxdGySkbWjp7QXbLY3ZXpVLV00nCpuw+Cpe/8iO
 +WdowCYXD2hE6chjFuA+cls7VEQ/YVjAFsKxxIgwuAqq7YSRe+C+aRyTHbgqsdwSfx4lZnFfNoQ
 8YWRdGRpyVpeBtVky
X-Google-Smtp-Source: AGHT+IEtjNelqC7DSOuybWFfUUGm2Teuf6f22z/O1GlTI7teTNUOfVVG1j+MqpOEZDXpvU+s/0KUrA==
X-Received: by 2002:a05:6000:4102:b0:38a:8b0a:78a6 with SMTP id
 ffacd0b85a97d-38a8b0a7a2fmr7172801f8f.41.1736540160073; 
 Fri, 10 Jan 2025 12:16:00 -0800 (PST)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4c1b05sm5308034f8f.88.2025.01.10.12.15.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jan 2025 12:15:59 -0800 (PST)
Message-ID: <17ec822f-3770-4661-9dbc-de118452629c@smile.fr>
Date: Fri, 10 Jan 2025 21:15:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: David Laight <david.laight.linux@gmail.com>,
 Romain Naour via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250108230521.1345210-1-romain.naour@smile.fr>
 <20250110130625.245ef276@pumpkin>
Content-Language: en-US
In-Reply-To: <20250110130625.245ef276@pumpkin>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1736540160; x=1737144960; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=S71ipVXq07erSw/yF9/ouQhV0/3+rbqUQ98exNzvoe0=;
 b=oPob5Ms0+2Cas1MWhzBrYwgCFlL2UElYjqGwRSaTWWcZTxQE1WmTfJvIw8+qAizxPh
 bxoxjAGZhiUtgyW/lYtt5WXnv+5UxR5eDC7xno3YK8GhM/Xtkx6ifcwlK6VmUYae34Aj
 MDu+PZYhZl8bUC5NcvloPEGQ0IoOSloV8RVEg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=oPob5Ms0
Subject: Re: [Buildroot] [PATCH 01/12] support/config-fragments: remove
 nios2 toolchain
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpMZSAxMC8wMS8yMDI1IMOgIDE0OjA2LCBEYXZpZCBMYWlnaHQgYSDDqWNyaXTCoDoK
PiBPbiBUaHUsICA5IEphbiAyMDI1IDAwOjA1OjEwICswMTAwCj4gUm9tYWluIE5hb3VyIHZpYSBi
dWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90ZToKPiAKPj4gVGhlIG5pb3My
IGFyY2hpdGVjdHVyZSB3YXMgZGVwcmVjYXRlZCBpbiBnY2MtMTQgYW5kIGhhcyBiZWVuIHJlbW92
ZWQKPj4gaW4gdGhlIHVwY29taW5nIGdjYy0xNSBbMV1bMl0uCj4+Cj4+IE91ciBsYXN0IGFuZCBv
bmx5IG5pb3MyIGRlZmNvbmZpZyAicWVtdV9uaW9zMl8xMG01MF9kZWZjb25maWciIHdhcwo+PiBy
ZW1vdmVkIGluIDIwMjQuMTEgZHVlIHRvIG5pb3MyIHJlbW92YWwgZnJvbSBRZW11IDkuMS4wIFsz
XS4KPiAuLi4KPiAKPiBJbnRlcmVzdGluZywgSSd2ZSBub3Qgc2VlbiBhbiBpbmRpY2F0aW9uIHRo
YXQgbmlvczIgc3VwcG9ydCBpcyBiZWluZyByZW1vdmVkCj4gZnJvbSB0aGUgTGludXgga2VybmVs
LgoKV2l0aG91dCBhIGNvbXBpbGVyLCBpdCdzIG1hdHRlciBvZiB0aW1lIEkgZ3Vlc3MuCgo+IE5v
dCB0aGF0IEkndmUgZXZlciBjb25zaWRlcmVkIHJ1bm5pbmcgTGludXggb24gbmlvczIgYSBzYW5l
IGlkZWEuCj4gKEJldHRlciB0byBnZXQgYW4gZnBnYSB3aXRoIGEgJ3Byb3BlcicgY3B1IGluIGl0
LikKPiAKPiBJIGtub3cgSW50ZWwgZGVwcmVjYXRlZCBuaW9zMiBpbiBxdWFydHVzIDIzLjA0IChz
dWdnZXN0aW5nIHRoYXQgUklTQy1WIHdhcyBhCj4gc3VpdGFibGUgYWx0ZXJuYXRpdmUpLCBidXQg
SSBzdXNwZWN0IHRoYXQgc29tZSBtYWpvciB0ZWxjbyBoYXJkd2FyZSBzdXBwbGllcwo+IG9iamVj
dGVkIChJIGJlbGlldmUgdGhleSB1c2UgYSBsb3Qgb2YgbmlvczIgZm9yIGVtYmVkZGVkIGNvbnRy
b2wgY29kZSBpbgo+IG1vYmlsZSBiYXNlIHN0YXRpb25zIC0gdGhleSdsbCBiZSBydW5uaW5nIHdp
dGggYSBmZXcga0Igb2YgY29kZSBhbmQgZGF0YSkuCj4gV2UgY2VydGFpbmx5IGZvdW5kIGl0IHBv
c3NpYmxlIHRvIGdldCBhIGZyZWUgbmlvczIgbGljZW5jZSBmb3Igb3VyIGZwZ2EgYnVpbGRzCj4g
KGFmdGVyIGJlaW5nIHRvbGQgZWFybGllciBpdCB3YXNuJ3QgcG9zc2libGUgdG8gZ2V0IG9uZSku
CgpTdGlsbCwgd2UgZG9uJ3QgaGF2ZSBhbnkgbmlvczIgZGVmY29uZmlnIGxlZnQgaW4gQnVpbGRy
b290IHRyZWUsIHRoZSBsYXN0IChhbmQKb25seSkgb25lIHdhcyBxZW11X25pb3MyXzEwbTUwLgoK
PiAKPiBJbiBhbnkgY2FzZSBJIHNwZW50IGEgZmV3IHdlZWtzIHdyaXRpbmcgYSBjb21wYXRpYmxl
IGNwdSB3ZSBjYW4gdXNlIGZvcgo+IG91ciBlbWJlZGRlZCBoYXJkd2FyZS4KPiAoV2UgYWxzbyB1
c2UgdGhlIGZpcnN0IGdjYyB0aGF0IHN1cHBvcnRlZCBpdCAtIGdvb2QgZW5vdWdoIGZvciB0aGUg
Y29kZQo+IHdlIGhhdmUsIGVzcGVjaWFsbHkgYWZ0ZXIgc29tZSBsb2NhbCBwYXRjaGVzLikKCkkg
YmVsaWV2ZSwgaXQgZG9lc24ndCBwcmV2ZW50IG5pb3MyIHJlbW92YWwuCgpCZXN0IHJlZ2FyZHMs
ClJvbWFpbgoKCj4gCj4gCURhdmlkCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
