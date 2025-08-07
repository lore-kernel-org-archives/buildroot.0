Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFCFC87FCF
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CC3F80DE8;
	Thu,  7 Aug 2025 18:24:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2yCi0__Ry3HV; Thu,  7 Aug 2025 18:24:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DC6280C48
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DC6280C48;
	Thu,  7 Aug 2025 18:24:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A1DA10A
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9ECE80363
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iH6i1iZk4Qb7 for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:24:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D458280DB4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D458280DB4
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D458280DB4
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:14 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-458bf6d69e4so12703205e9.2
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:24:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591053; x=1755195853;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ls5A8gSRS2hIskbeQ407WIfCLDRtm3tLTDH/dQ3toq8=;
 b=o+flys8czs14Y5TGHGbo5hxdmYb0CRKaWeGBw7DgOzsPTnQa5HhPpQ3znW9/T6dvCr
 bA/hWifibL5jjUwX7HiElgqO7Lh58yV/7ZZ3cOcW0FKEIODp1azAx6RYkd4s5v02JOwD
 evuKtiyX7dndAK/3fUgsEiPNh1MQwTDYwYqO6mSA0fD5Q8D/a4AG3NGsz8D3L4nQE5RR
 WN7JYTFFSXOJpwBSfgbKZuHUtXcU18EiugJ57E8lM1/XI7mvuLDIncpf+fg3OZi0RgOq
 9phMrTfzm2HXo1EhkDCRasBjTeVRWi7KVPW20zeMMTswzSbclQ/RYda5hp1VnDHzxJ/v
 wreQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2aubh4p22T3STBk9xp1FieZGoJWMlXxSvMtYKEvb1SAMnp5wRuSoJZSs6aIyMzD3PDvkLpB2MXPA=@buildroot.org
X-Gm-Message-State: AOJu0YweDqC3J85enypc1o4Tcz7genexnPLy58n/514pojLoxJbh2jLp
 JVglJN28myU+v5u1Qy5QnkKgMvBK/AhNY0RzxI0efYdo93D1Mj1tzjVkbivokBSg8yM=
X-Gm-Gg: ASbGncuj+C5T/4BnmJzuM80w+vkxzj8MVG9mJ2uDLFmguycykHyl/PTGtGyt2hKHGk3
 H2b+w5OB1KzAumtDastx0LmVrcdcbG0NwhI3CKTamsTxtxGq+X7dUgDIWr23nL4T3kQihYSOINW
 hXlm7SXTvkAMn/XN3fwREsWVVCbCZ2fS3kkmwypVgTuvUXnZai1a3G2p5HpXeB0ceVegxTdFrtz
 xdcp6NI27rAk888FR0h1RUNLbUJL4GMPpWW/VtpUXcZZAXrQ17y38eHEHFpMKeQc6HI6rV1201L
 ZaPKlrmpdNzzkl4wxZWSH6CV4c0OsNrSjp3vgrr4V3wz/gA6sArZ8OnXrq0CqIg3RmXgQy/x6H4
 jfPrDEEf7vNq4GQ==
X-Google-Smtp-Source: AGHT+IH9QvXxe8DiZItMhfVMjl8ymRjucgMdXogXvZFbRPgVXb2rSvXn3OyA6yFBxwZnYbekHCsD7w==
X-Received: by 2002:a05:600c:1554:b0:459:4441:1c07 with SMTP id
 5b1f17b1804b1-459e745cf68mr64660785e9.20.1754591052920; 
 Thu, 07 Aug 2025 11:24:12 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3b95desm27067303f8f.20.2025.08.07.11.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:24:12 -0700 (PDT)
To: =?UTF-8?q?Gero=20Schw=C3=A4ricke?= <gero.schwaericke@sevenlab.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:24:08 +0200
Message-ID: <20250807182412.724601-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250716133220.3484511-1-gero.schwaericke@sevenlab.de>
References: <20250716133220.3484511-1-gero.schwaericke@sevenlab.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591053; x=1755195853; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ls5A8gSRS2hIskbeQ407WIfCLDRtm3tLTDH/dQ3toq8=;
 b=Z1pO2m2M7ihfl38QSKqkXdtXWYbewoyDGD7BP+PacGVIAYO1Xq3+k2kwj8lSvF6m0f
 GdcmL+vqqB5bSarU0LZg/fZmq7ezUDDillIqnlj68+WYYxYfn0g1q+VZ2b71znlWgKi8
 JRfuDGOfwEjVDsDpxmHik8Nq2dd2eFXpAuX5lN/IrXcsOTsKxn1FRqCz7YB2zWF7SNsa
 4OBnYvcrM/6nxDf3m5gDCFcK6YIXpbeODvpUdzfqeNtfqReGuifzDRTnDMOZDHdSfafT
 IxqTPghxoG5+pHkZQZGjdDgWD0S7AMeSs1WlUGdELra1+QyQcjhflHSZweHszH9L81ky
 sqBw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Z1pO2m2M
Subject: Re: [Buildroot] [PATCH v2] package/rauc-hawkbit-updater: fix
 missing user
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

SW4gcmVwbHkgb2Y6Cj4gU3lzdGVtZCBzdXBwb3J0IGZvciB0aGUgUkFVQyBoYXdrYml0IHVwZGF0
ZXIgd2FzIGFkZGVkIGluCj4gCj4gICA0YWE3YTRhZDhhIChwYWNrYWdlL3JhdWMtaGF3a2JpdC11
cGRhdGVyOiBhZGQgc3lzdGVtZCBvcHRpb25hbCBkZXBlbmRlbmN5LCAyMDI0LTA3LTEwKQo+IAo+
IFRoaXMgaW5zdGFsbHMgdGhlIFJBVUMgaGF3a2JpdCB1cGRhdGVyIHNlcnZpY2UsIHdoaWNoIGV4
ZWN1dGVzIGFzIHVzZXIKPiAicmF1Yy1oYXdrYml0IiBbMV0sIHdoaWNoIGRvZXNuJ3QgZXhpc3Qg
YnkgZGVmYXVsdC4KPiAKPiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL3JhdWMvcmF1Yy1oYXdrYml0
LXVwZGF0ZXIvYmxvYi8yNzExYzBlMDI3ODFlYjlkOTcyODVjODcxOTdmMWJhZmVmNzVkMGQxL3Nj
cmlwdC9yYXVjLWhhd2tiaXQtdXBkYXRlci5zZXJ2aWNlCj4gCj4gU2lnbmVkLW9mZi1ieTogR2Vy
byBTY2h3w6RyaWNrZSA8Z2Vyby5zY2h3YWVyaWNrZUBzZXZlbmxhYi5kZT4KCkFwcGxpZWQgdG8g
MjAyNS4wMi54ICYgMjAyNS4wNS54LiBUaGFua3MKCj4gLS0tCj4gQ2hhbmdlcyB2MSAtPiB2MjoK
PiAtIENoYW5nZSBwYXNzd29yZCBmaWVsZCBmcm9tICEgKGxvZ2luIGRpc2FibGVkKSB0byAqIChs
b2dpbiBub3QgYWxsb3dlZCkKPiAtLS0KPiAgcGFja2FnZS9yYXVjLWhhd2tiaXQtdXBkYXRlci9y
YXVjLWhhd2tiaXQtdXBkYXRlci5tayB8IDQgKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcmF1Yy1oYXdrYml0LXVwZGF0ZXIv
cmF1Yy1oYXdrYml0LXVwZGF0ZXIubWsgYi9wYWNrYWdlL3JhdWMtaGF3a2JpdC11cGRhdGVyL3Jh
dWMtaGF3a2JpdC11cGRhdGVyLm1rCj4gaW5kZXggZGExYzAyMGJiNi4uZTMxYTRkZWI1ZiAxMDA2
NDQKPiAtLS0gYS9wYWNrYWdlL3JhdWMtaGF3a2JpdC11cGRhdGVyL3JhdWMtaGF3a2JpdC11cGRh
dGVyLm1rCj4gKysrIGIvcGFja2FnZS9yYXVjLWhhd2tiaXQtdXBkYXRlci9yYXVjLWhhd2tiaXQt
dXBkYXRlci5tawo+IEBAIC0xNSw2ICsxNSwxMCBAQCBSQVVDX0hBV0tCSVRfVVBEQVRFUl9DRkxB
R1MgPSAkKFRBUkdFVF9DRkxBR1MpIC1zdGQ9Yzk5Cj4gIGlmZXEgKCQoQlIyX1BBQ0tBR0VfU1lT
VEVNRCkseSkKPiAgUkFVQ19IQVdLQklUX1VQREFURVJfREVQRU5ERU5DSUVTICs9IHN5c3RlbWQK
PiAgUkFVQ19IQVdLQklUX1VQREFURVJfQ09ORl9PUFRTICs9IC1Ec3lzdGVtZD1lbmFibGVkCj4g
KyMgcmF1Yy1oYXdrYml0LXVwZGF0ZXIuc2VydmljZSB1c2VzIHRoaXMgdXNlciBhbmQgZ3JvdXAK
PiArZGVmaW5lIFJBVUNfSEFXS0JJVF9VUERBVEVSX1VTRVJTCj4gKwlyYXVjLWhhd2tiaXQgLTEg
cmF1Yy1oYXdrYml0IC0xICogLSAtIC0gUkFVQyBIYXdrYml0IFVwZGF0ZXIKPiArZW5kZWYKPiAg
ZWxzZQo+ICBSQVVDX0hBV0tCSVRfVVBEQVRFUl9DT05GX09QVFMgKz0gLURzeXN0ZW1kPWRpc2Fi
bGVkCj4gIGVuZGlmCj4gLS0gCj4gMi40My4wCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
