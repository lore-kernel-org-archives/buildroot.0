Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDDEC77B7C
	for <buildroot@archiver.kernel.org>; Wed,  2 Jul 2025 14:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93ADB60E9B;
	Wed,  2 Jul 2025 14:31:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ZSCQvP5tMgi; Wed,  2 Jul 2025 14:31:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C557160BE3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C557160BE3;
	Wed,  2 Jul 2025 14:31:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BC20196
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 14:31:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 712DB60BE3
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 14:31:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X2xE5eqC4dKq for <buildroot@buildroot.org>;
 Wed,  2 Jul 2025 14:31:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D69DF60B75
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D69DF60B75
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D69DF60B75
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 14:31:08 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a4fd1ba177so4531341f8f.0
 for <buildroot@buildroot.org>; Wed, 02 Jul 2025 07:31:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751466667; x=1752071467;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qJhUrJGB3HCY7QXzlpL7NbwWN53AV9Zraa8tcnilz+U=;
 b=DniwGdaWtScecky3DYsin+GpdRFo7mkSuxzacu3bZS5j6xOiChL/7QYaJObWNX6x3A
 UlMAfqFwJzFOW03750yTuCtcqygMxh8yNqFUTG3sbEACUNUlLNeCwYu+hkYrZC9vXv3M
 VIHrwltveh4M5PCGxuGrxfsKG4oyd66KB/eJ8loDBN5NtV+AGlvyv6YM3D76wvZPgxDH
 eTHA3PdvniGF1Y/n3SZhNYViozsAUMc3iRRRCLFwrFza0by1ZEVipvz/q/vtmD3TZZcK
 nqENzBUNXOH8Q3smlZ3RYCWjSL99JfopIHTXb2QLPeWLOH6bz7s2SZ+6+M77yOTGc0YN
 o+YQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqORnex1W8oi9QJGc6wbeR4rQGUEvtxrv7BvezGlTEOY5TjL9IaCJhPltMwcqMXgBGNdMuN2bEcro=@buildroot.org
X-Gm-Message-State: AOJu0Yzy9OduizjdJ84/Biopq5jj/pC2FqMP9Co9j2lUV3pGv1gVa4jA
 L/Bp+5lwmmc57IVNsMyr9MFnT5xZ5EeBn/DShYFfpDMNpBUgxKpTCqOgN57MqqtfrV7CfKdd53O
 9+j25
X-Gm-Gg: ASbGncs0+1DrKRvKuZnWYjV6nTdmrpQqIK90eKMoYzxkVsMMYS7vlVWAtT45J3BqNYQ
 yk7/Mda9jHgVAlQZtdUil/V7AEb1wPLqTGY5O5xRrOxP2j3UDagPYL51tJmCFMaigTBCK3aV5xX
 6+SjIfTd+JyVldWiLoohgIUybp/Nm0qUguowA2CeHFcXLjFEnGz9R/2bxLa2jjEM3NqLLLyS2VW
 jyUu0wIUxl74EX+9nb8/anCDAzWuZXKdAqIMc3MpPlwB4QClkyb3kDskKDIWxMffVCHgeWnRi+h
 LxxqAxmFSv+JioCOFtzExB1s5l2EQY72SHNYi87conJcmZucbDDb0NVb7hnhM4pFLA7D0fSwfk0
 oDRRHROZ2OvWNYUfBf4V1DKjZKLx8AWhUAfHuDSxYWoYyUZW0ty2Jxdgbtx2h
X-Google-Smtp-Source: AGHT+IG6zgBOOc/QVZH1Tx/VDAhflIEMSBr9ugAG0PT0e4XANGXQJzsEpXxHJ6F/bIjf2DtcRrBrqg==
X-Received: by 2002:a05:6000:2503:b0:3a3:7117:1bba with SMTP id
 ffacd0b85a97d-3b1f9545e11mr2942232f8f.24.1751466666216; 
 Wed, 02 Jul 2025 07:31:06 -0700 (PDT)
Received: from [10.5.90.80]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c80bb28sm15874612f8f.43.2025.07.02.07.31.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 07:31:05 -0700 (PDT)
Message-ID: <2a0be4f6-f9c9-406e-9b2a-3861ff1e37df@smile.fr>
Date: Wed, 2 Jul 2025 16:31:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Knight <git@jdknight.me>, buildroot@buildroot.org
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
References: <20250701185642.2173-1-git@jdknight.me>
Content-Language: fr, en-US
In-Reply-To: <20250701185642.2173-1-git@jdknight.me>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1751466667; x=1752071467; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qJhUrJGB3HCY7QXzlpL7NbwWN53AV9Zraa8tcnilz+U=;
 b=IWouPk15VqNmY1MgALjx5MUvCa8ipad0D26FCZpP+/+UYSlI5PrBpUMMxBCmO694fs
 epzovuG9chl76x6q6eBvBuzP44qxCUBogldmO3EDGT+FKTnSONLxYOUYgYeeuYDrrwRB
 7bIZm5qQgXsBL1+DQrEpociCRit8k1lPgU/rM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=IWouPk15
Subject: Re: [Buildroot] [PATCH 1/1] utils/check-package: handle missing
 files
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

SGVsbG8gSmFtZXMsIEFsbCwKCkxlIDAxLzA3LzIwMjUgw6AgMjA6NTYsIEphbWVzIEtuaWdodCBh
IMOpY3JpdMKgOgo+IFdoZW4gcnVubmluZyBjaGVjay1wYWNrYWdlIGJlZm9yZSBjb21wbGV0aW5n
IGNvbW1pdHMgZm9yIGEgY2hhbmdlLCBpZgo+IGFueSBmaWxlcyBhcmUgc2V0dXAgZm9yIHJlbW92
YWwsIGNoZWNrLXBhY2thZ2Ugd2lsbCB0aHJvdwo+IEZpbGVOb3RGb3VuZEVycm9yIGV4Y2VwdGlv
bnMgaW5zdGVhZCBvZiBnZW5lcmF0aW5nIGEgd2FybmluZyBzdGF0ZS4gRm9yCj4gZXhhbXBsZToK
PiAKPiAgJCB1dGlscy9kb2NrZXItcnVuIG1ha2UgY2hlY2stcGFja2FnZQo+ICBUcmFjZWJhY2sg
KG1vc3QgcmVjZW50IGNhbGwgbGFzdCk6Cj4gICAgLi4uCj4gIEZpbGVOb3RGb3VuZEVycm9yOiBb
RXJybm8gMl0gTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeTogJ3BhY2thZ2UvLi4uLzAwMDEtc29t
ZS1yZW1vdmVkLXBhdGNoLnBhdGNoJwo+ICBtYWtlOiAqKiogW01ha2VmaWxlOjEyNjQ6IGNoZWNr
LXBhY2thZ2VdIEVycm9yIDEKCkluZGVlZCwgaXQncyBkdWUgdG8gYGdpdCBscy10cmVlIC1yIC0t
bmFtZS1vbmx5IEhFQURgIGJlaW5nIHVzZWQgYnkKY2hlY2stcGFja2FnZSBNYWtlIHRhcmdldDoK
Ci4vdXRpbHMvY2hlY2stcGFja2FnZSBgZ2l0IGxzLXRyZWUgLXIgLS1uYW1lLW9ubHkgSEVBRGAg
XAoJLS1pZ25vcmUtbGlzdD0kKFRPUERJUikvLmNoZWNrcGFja2FnZWlnbm9yZQoKCldoZW4gd29y
a2luZyBvbiBhIHNwZWNpZmljIHBhY2thZ2UsIHdlIGNvdWxkIHVzZSBjaGVjay1wYWNrYWdlIGRp
cmVjdGx5IHdpdGhvdXQKZXJyb3I6CgpnaXQgcm0gYm9vdC9zeXNsaW51eC8wMDE3LVJlcGxhY2Ut
YnVpbHRpbi1zdHJsZW4tdGhhdC1hcHBlYXJzLXRvLWdldC1vcHRpbWl6ZWQucGF0Y2gKCi4vdXRp
bHMvY2hlY2stcGFja2FnZSAgYm9vdC9zeXNsaW51eC8qCgpXaGlsZSBydW5uaW5nIGNoZWNrLXBh
Y2thZ2UgYmVmb3JlIGNvbXBsZXRpbmcgY29tbWl0cyBmb3IgYSBjaGFuZ2UgaXMgcHJvYmFibHkK
bm90IGEgZ29vZCBwcmFjdGljZSwgdGhyb3dpbmcgRmlsZU5vdEZvdW5kRXJyb3IgZXhjZXB0aW9u
IGlzIG5vdCBuaWNlIDopCgpSZXZpZXdlZC1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJA
c21pbGUuZnI+CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4gVGhpcyBjb21taXQgd2lsbCBu
b3cgY2F0Y2ggRmlsZU5vdEZvdW5kRXJyb3IgYW5kIHBvcHVsYXRlIGEgd2FybmluZwo+IG1lc3Nh
Z2U6Cj4gCj4gICQgdXRpbHMvZG9ja2VyLXJ1biBtYWtlIGNoZWNrLXBhY2thZ2UKPiAgcGFja2Fn
ZS8uLi4vMDAwMS1zb21lLXJlbW92ZWQtcGF0Y2gucGF0Y2g6IG1pc3Npbmc7IHVuc3RhZ2VkIGZp
bGUgcmVtb3ZhbD8KPiAgcGFja2FnZS8uLi4vMDAwMi1hbm90aGVyLXJlbW92ZWQtcGF0Y2gucGF0
Y2g6IG1pc3Npbmc7IHVuc3RhZ2VkIGZpbGUgcmVtb3ZhbD8KPiAgNDI3ODQzIGxpbmVzIHByb2Nl
c3NlZAo+ICAzIHdhcm5pbmdzIGdlbmVyYXRlZAo+ICBtYWtlOiAqKiogW01ha2VmaWxlOjEyNjQ6
IGNoZWNrLXBhY2thZ2VdIEVycm9yIDEKPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBLbmlnaHQg
PGdpdEBqZGtuaWdodC5tZT4KPiAtLS0KPiAgdXRpbHMvY2hlY2stcGFja2FnZSB8IDI5ICsrKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25z
KCspLCAxMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdXRpbHMvY2hlY2stcGFja2Fn
ZSBiL3V0aWxzL2NoZWNrLXBhY2thZ2UKPiBpbmRleCBhNWVjYzJlZWQ4Li44NzgxZDIxZDhmIDEw
MDc1NQo+IC0tLSBhL3V0aWxzL2NoZWNrLXBhY2thZ2UKPiArKysgYi91dGlscy9jaGVjay1wYWNr
YWdlCj4gQEAgLTI1NywxOCArMjU3LDIzIEBAIGRlZiBjaGVja19maWxlX3VzaW5nX2xpYihmbmFt
ZSk6Cj4gICAgICAgICAgbndhcm5pbmdzICs9IHdhcm4KPiAgCj4gICAgICBsYXN0bGluZSA9ICIi
Cj4gLSAgICB3aXRoIG9wZW4oZm5hbWUsICJyIiwgZXJyb3JzPSJzdXJyb2dhdGVlc2NhcGUiKSBh
cyBmOgo+IC0gICAgICAgIGZvciBsaW5lbm8sIHRleHQgaW4gZW51bWVyYXRlKGYpOgo+IC0gICAg
ICAgICAgICBubGluZXMgKz0gMQo+IC0gICAgICAgICAgICBmb3IgbmFtZSwgY2YgaW4gb2JqZWN0
czoKPiAtICAgICAgICAgICAgICAgIGlmIGNmLmRpc2FibGUuc2VhcmNoKGxhc3RsaW5lKToKPiAt
ICAgICAgICAgICAgICAgICAgICBjb250aW51ZQo+IC0gICAgICAgICAgICAgICAgbGluZV9zdHMg
PSBjZi5jaGVja19saW5lKGxpbmVubyArIDEsIHRleHQpCj4gLSAgICAgICAgICAgICAgICB3YXJu
LCBmYWlsID0gcHJpbnRfd2FybmluZ3MobGluZV9zdHMsIG5hbWUgaW4geGZhaWwpCj4gLSAgICAg
ICAgICAgICAgICBpZiBmYWlsID4gMDoKPiAtICAgICAgICAgICAgICAgICAgICBmYWlsZWQuYWRk
KG5hbWUpCj4gLSAgICAgICAgICAgICAgICBud2FybmluZ3MgKz0gd2Fybgo+IC0gICAgICAgICAg
ICBsYXN0bGluZSA9IHRleHQKPiArICAgIHRyeToKPiArICAgICAgICB3aXRoIG9wZW4oZm5hbWUs
ICJyIiwgZXJyb3JzPSJzdXJyb2dhdGVlc2NhcGUiKSBhcyBmOgo+ICsgICAgICAgICAgICBmb3Ig
bGluZW5vLCB0ZXh0IGluIGVudW1lcmF0ZShmKToKPiArICAgICAgICAgICAgICAgIG5saW5lcyAr
PSAxCj4gKyAgICAgICAgICAgICAgICBmb3IgbmFtZSwgY2YgaW4gb2JqZWN0czoKPiArICAgICAg
ICAgICAgICAgICAgICBpZiBjZi5kaXNhYmxlLnNlYXJjaChsYXN0bGluZSk6Cj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgIGNvbnRpbnVlCj4gKyAgICAgICAgICAgICAgICAgICAgbGluZV9zdHMg
PSBjZi5jaGVja19saW5lKGxpbmVubyArIDEsIHRleHQpCj4gKyAgICAgICAgICAgICAgICAgICAg
d2FybiwgZmFpbCA9IHByaW50X3dhcm5pbmdzKGxpbmVfc3RzLCBuYW1lIGluIHhmYWlsKQo+ICsg
ICAgICAgICAgICAgICAgICAgIGlmIGZhaWwgPiAwOgo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICBmYWlsZWQuYWRkKG5hbWUpCj4gKyAgICAgICAgICAgICAgICAgICAgbndhcm5pbmdzICs9IHdh
cm4KPiArICAgICAgICAgICAgICAgIGxhc3RsaW5lID0gdGV4dAo+ICsgICAgZXhjZXB0IEZpbGVO
b3RGb3VuZEVycm9yOgo+ICsgICAgICAgIHByaW50KGYie2ZuYW1lfTogbWlzc2luZzsgdW5zdGFn
ZWQgZmlsZSByZW1vdmFsPyIpCj4gKyAgICAgICAgbndhcm5pbmdzICs9IDEKPiArICAgICAgICBy
ZXR1cm4gbndhcm5pbmdzLCBubGluZXMKPiAgCj4gICAgICBmb3IgbmFtZSwgY2YgaW4gb2JqZWN0
czoKPiAgICAgICAgICB3YXJuLCBmYWlsID0gcHJpbnRfd2FybmluZ3MoY2YuYWZ0ZXIoKSwgbmFt
ZSBpbiB4ZmFpbCkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
