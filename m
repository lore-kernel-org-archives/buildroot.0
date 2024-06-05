Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED88C25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 21:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66C9081214;
	Wed,  5 Jun 2024 21:03:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YqI6UZgl_DvE; Wed,  5 Jun 2024 21:03:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 595558125A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 595558125A;
	Wed,  5 Jun 2024 21:03:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C46DC1BF5A9
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 21:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1E59811D6
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 21:03:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bjw6Q8yztoG6 for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 21:03:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 77897811AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77897811AD
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 77897811AD
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 21:03:52 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-35ef3a037a0so44850f8f.0
 for <buildroot@buildroot.org>; Wed, 05 Jun 2024 14:03:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717621431; x=1718226231;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/r0hY4RRrQAphqwBolHWJVhZ0MX8jmEc92Ca8ghBgWA=;
 b=qS6Gu5ICmNWg4GOHzjauRXYhn5s4be955Qa5hNEIo2YXCqDQj3CazgKirKp7HIWytP
 GuZX1koZ9zMs8CeI+qhapCj9HZypD44Aq/+Vg2ME79Kl7pYO77R8Brjez7Hlqf1a+jdZ
 MFKhwXRLLgw77X9nlgc0ntQ/AFVjaL3Py52KelVJ4g5dBx6G8Vmq11/CM+bXAMEJrIpw
 3Y7NgbK32zARKVKkeGyFhA15bj+OY+xXAqcsiyfhjRnGLnOsS6VvH2SnVafEBPESJhzm
 62zMtR2vW/Aapsp2bdywsW4U0ntYsW8gBtiz7G/ZVwsNW767ei6+Jbn1jJQ1a7StdiHm
 rwsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUl8dXbmZ7LaQKi0QxWXRkGk061IQUwy3CdsSwvcWn2vWNAb6i6Bkx96KrQ8MwtZ7S7TxNA6/vNjHWmyht2L1TfC2LuwfedQA==
X-Gm-Message-State: AOJu0Yywc3Flk9c4ygZPvVwXZTa+0xGheHYgzFQNeThNyZqy9PuhYQGN
 AYeFJpy+JKUuVkvlQ1jrGzYH0Wi0t4tcc5G6Kwj2YOgHvOa/KRxGGAhX7ZoiSMw=
X-Google-Smtp-Source: AGHT+IF6mR+zXObxWpMKrtHW5KAY6Y+kUWZSSbANvmLRzbOoeIY5TyLtSL51VIIrNAOeTztU0PBAmw==
X-Received: by 2002:adf:f452:0:b0:351:dd2d:f691 with SMTP id
 ffacd0b85a97d-35ef0d71e39mr592283f8f.7.1717621431013; 
 Wed, 05 Jun 2024 14:03:51 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef2b70b53sm373719f8f.50.2024.06.05.14.03.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jun 2024 14:03:50 -0700 (PDT)
Message-ID: <b5ab2564-5bd2-4d6b-acbf-605975aa78c3@mind.be>
Date: Wed, 5 Jun 2024 23:03:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240605154931.2893480-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240605154931.2893480-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1717621431; x=1718226231; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/r0hY4RRrQAphqwBolHWJVhZ0MX8jmEc92Ca8ghBgWA=;
 b=H5yxHFlzziQ5ufMB3/TTBYd/kZ3+CJ0jou70NT2xe64sfeIlCj/wU4CO2OsGapePdt
 9p6ZLpVR6KMzsUYzmeWxX+nOMJ27Csm6oDPOogeBuUC+kPLUZOXO++NGtj8H6kkHOTM1
 TWnr45kLHKIw1+FSU4ZxzeXDGwHK1vl0CpckvOrU9npZzr/AXKAFaQs75Ntb7etllwzj
 QjlsOhXTYr6iDMubwjWBh9+DqQsuK0xv+BQYRvIYKKb0mq+MhItwRYQlNkXyW1GoBWm4
 ag1Gqfnabqk78YrhLWCs0DDZxH2ojq35hIyQgK663MC0Uo4xOmv0DzmMZXAm/rgOruLB
 eSdg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=H5yxHFlz
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: bump to version 254.13
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Sen Hastings <sen@hastings.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwNS8wNi8yMDI0IDE3OjQ5LCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPiBEcm9wIHBhdGNo
IHdoaWNoIGlzIG5vdyB1cHN0cmVhbS4KPiAKPiBGaXhlcyBzb21lIGlzc3VlcyB3aXRoIG5ld2Vy
IGtlcm5lbCB2ZXJzaW9ucyBzbyBzaG91bGQgcHJvYmFibHkgZ28gaW4KPiBtYXN0ZXIuCj4gCj4g
aHR0cHM6Ly9naXRodWIuY29tL3N5c3RlbWQvc3lzdGVtZC1zdGFibGUvY29tbWl0L2E0Y2U0MDk1
Y2U3N2NhNWRmNjgyN2UyNGI0N2NiYWE2NzU1MTdkMzkKCiAgV2l0aCBhIGxpdHRsZSBiaXQgb2Yg
cmVzZWFyY2ggSSBjb3VsZCBmaW5kIG91dCB0aGF0IHRoaXMgaXMgZm9yIExpbnV4IDYuOSwgc28g
CkkgdXBkYXRlZCB0aGUgY29tbWl0IG1lc3NhZ2UgYWNjb3JkaW5nbHkuCgogIEFwcGxpZWQgdG8g
bWFzdGVyLCB0aGFua3MuCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgo+IC0tLQo+ICAgLi4u
cm5pbmctYWJvdXQtZW1wdHktZGlyZWN0aXZlLWFyZ3VtZW50LnBhdGNoIHwgNDUgLS0tLS0tLS0t
LS0tLS0tLS0tLQo+ICAgcGFja2FnZS9zeXN0ZW1kL3N5c3RlbWQuaGFzaCAgICAgICAgICAgICAg
ICAgIHwgIDIgKy0KPiAgIHBhY2thZ2Uvc3lzdGVtZC9zeXN0ZW1kLm1rICAgICAgICAgICAgICAg
ICAgICB8ICAyICstCj4gICAzIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNDcgZGVs
ZXRpb25zKC0pCj4gICBkZWxldGUgbW9kZSAxMDA2NDQgcGFja2FnZS9zeXN0ZW1kLzAwMDEtaW5z
dGFsbC1maXgtY29tcGlsZXItd2FybmluZy1hYm91dC1lbXB0eS1kaXJlY3RpdmUtYXJndW1lbnQu
cGF0Y2gKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9zeXN0ZW1kLzAwMDEtaW5zdGFsbC1maXgt
Y29tcGlsZXItd2FybmluZy1hYm91dC1lbXB0eS1kaXJlY3RpdmUtYXJndW1lbnQucGF0Y2ggYi9w
YWNrYWdlL3N5c3RlbWQvMDAwMS1pbnN0YWxsLWZpeC1jb21waWxlci13YXJuaW5nLWFib3V0LWVt
cHR5LWRpcmVjdGl2ZS1hcmd1bWVudC5wYXRjaAo+IGRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAo+
IGluZGV4IDk0MDhhNmRhMGUuLjAwMDAwMDAwMDAKPiAtLS0gYS9wYWNrYWdlL3N5c3RlbWQvMDAw
MS1pbnN0YWxsLWZpeC1jb21waWxlci13YXJuaW5nLWFib3V0LWVtcHR5LWRpcmVjdGl2ZS1hcmd1
bWVudC5wYXRjaAo+ICsrKyAvZGV2L251bGwKPiBAQCAtMSw0NSArMCwwIEBACj4gLUZyb20gODA0
MGZhNTVhMWNiYzM0ZGVkZTMyMDVhOTAyMDk1ZWNkMjZjMjFlMyBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKPiAtRnJvbTogTHVjYSBCb2NjYXNzaSA8Ymx1Y2FAZGViaWFuLm9yZz4KPiAtRGF0ZTog
U2F0LCAyNCBGZWIgMjAyNCAxMjowNTo0NCArMDAwMAo+IC1TdWJqZWN0OiBbUEFUQ0hdIGluc3Rh
bGw6IGZpeCBjb21waWxlciB3YXJuaW5nIGFib3V0IGVtcHR5IGRpcmVjdGl2ZSBhcmd1bWVudAo+
IC1NSU1FLVZlcnNpb246IDEuMAo+IC1Db250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9
VVRGLTgKPiAtQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAo+IC0KPiAtT24gcHBjNjRl
bCB3aXRoIGdjYyAxMy4yIG9uIFVidW50dSAyNC4wNDoKPiAtCj4gLTNzIEluIGZpbGUgaW5jbHVk
ZWQgZnJvbSAuLi9zcmMvYmFzaWMvbWFjcm8uaDozODYsCj4gLTQ4M3MgICAgICAgICAgICAgICAg
ICBmcm9tIC4uL3NyYy9iYXNpYy9hbGxvYy11dGlsLmg6MTAsCj4gLTQ4M3MgICAgICAgICAgICAg
ICAgICBmcm9tIC4uL3NyYy9zaGFyZWQvaW5zdGFsbC5jOjEyOgo+IC00ODNzIC4uL3NyYy9zaGFy
ZWQvaW5zdGFsbC5jOiBJbiBmdW5jdGlvbiDigJhpbnN0YWxsX2NoYW5nZXNfZHVtcOKAmToKPiAt
NDgzcyAuLi9zcmMvc2hhcmVkL2luc3RhbGwuYzo0MzI6NjQ6IGVycm9yOiDigJglc+KAmSBkaXJl
Y3RpdmUgYXJndW1lbnQgaXMgbnVsbCBbLVdlcnJvcj1mb3JtYXQtb3ZlcmZsb3c9XQo+IC00ODNz
ICAgNDMyIHwgICAgICAgICAgICAgICAgICAgICAgICAgZXJyID0gbG9nX2Vycm9yX2Vycm5vKGNo
YW5nZXNbaV0udHlwZSwgIkZhaWxlZCB0byAlcyB1bml0LCB1bml0ICVzIGRvZXMgbm90IGV4aXN0
LiIsCj4gLTQ4M3MgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fgo+IC00ODNzIC4uL3NyYy9zaGFyZWQvaW5zdGFsbC5jOjQzMjo3NTogbm90
ZTogZm9ybWF0IHN0cmluZyBpcyBkZWZpbmVkIGhlcmUKPiAtNDgzcyAgIDQzMiB8ICAgICAgICAg
ICAgICAgICAgICAgICAgIGVyciA9IGxvZ19lcnJvcl9lcnJubyhjaGFuZ2VzW2ldLnR5cGUsICJG
YWlsZWQgdG8gJXMgdW5pdCwgdW5pdCAlcyBkb2VzIG5vdCBleGlzdC4iLAo+IC0KPiAtVXBzdHJl
YW06IGh0dHBzOi8vZ2l0aHViLmNvbS9zeXN0ZW1kL3N5c3RlbWQvY29tbWl0LzgwNDBmYTU1YTFj
YmMzNGRlZGUzMjA1YTkwMjA5NWVjZDI2YzIxZTMKPiAtU2lnbmVkLW9mZi1ieTogRmFicmljZSBG
b250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4gLS0tLQo+IC0gc3JjL3NoYXJl
ZC9pbnN0YWxsLmMgfCA3ICsrKysrLS0KPiAtIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCj4gLQo+IC1kaWZmIC0tZ2l0IGEvc3JjL3NoYXJlZC9pbnN0YWxs
LmMgYi9zcmMvc2hhcmVkL2luc3RhbGwuYwo+IC1pbmRleCBmYWJmNWRiN2VkMmUxLi5jM2E5NGQx
OTEyMTY1IDEwMDY0NAo+IC0tLS0gYS9zcmMvc2hhcmVkL2luc3RhbGwuYwo+IC0rKysgYi9zcmMv
c2hhcmVkL2luc3RhbGwuYwo+IC1AQCAtMzQwLDkgKzM0MCwxMiBAQCB2b2lkIGluc3RhbGxfY2hh
bmdlc19kdW1wKGludCByLCBjb25zdCBjaGFyICp2ZXJiLCBjb25zdCBJbnN0YWxsQ2hhbmdlICpj
aGFuZ2VzLAo+IC0gICAgICAgICBhc3NlcnQodmVyYiB8fCByID49IDApOwo+IC0KPiAtICAgICAg
ICAgZm9yIChzaXplX3QgaSA9IDA7IGkgPCBuX2NoYW5nZXM7IGkrKykgewo+IC0tICAgICAgICAg
ICAgICAgIGlmIChjaGFuZ2VzW2ldLnR5cGUgPCAwKQo+IC0tICAgICAgICAgICAgICAgICAgICAg
ICAgYXNzZXJ0KHZlcmIpOwo+IC0gICAgICAgICAgICAgICAgIGFzc2VydChjaGFuZ2VzW2ldLnBh
dGgpOwo+IC0rICAgICAgICAgICAgICAgIC8qIFRoaXMgdHJpZXMgdG8gdGVsbCB0aGUgY29tcGls
ZXIgdGhhdCBpdCdzIHNhZmUgdG8gdXNlICd2ZXJiJyBpbiBhIHN0cmluZyBmb3JtYXQgaWYgdGhl
cmUKPiAtKyAgICAgICAgICAgICAgICAgKiB3YXMgYW4gZXJyb3IsIGJ1dCB0aGUgY29tcGlsZXIg
ZG9lc24ndCBjYXJlIGFuZCBmYWlscyBhbnl3YXksIHNvIHN0cm5hKHZlcmIpIGlzIHVzZWQKPiAt
KyAgICAgICAgICAgICAgICAgKiB0b28uICovCj4gLSsgICAgICAgICAgICAgICAgYXNzZXJ0KHZl
cmIgfHwgY2hhbmdlc1tpXS50eXBlID49IDApOwo+IC0rICAgICAgICAgICAgICAgIHZlcmIgPSBz
dHJuYSh2ZXJiKTsKPiAtCj4gLSAgICAgICAgICAgICAgICAgLyogV2hlbiBtYWtpbmcgY2hhbmdl
cyBoZXJlLCBtYWtlIHN1cmUgdG8gYWxzbyBjaGFuZ2UgaW5zdGFsbF9lcnJvcigpIGluIGRidXMt
bWFuYWdlci5jLiAqLwo+IC0KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9zeXN0ZW1kL3N5c3RlbWQu
aGFzaCBiL3BhY2thZ2Uvc3lzdGVtZC9zeXN0ZW1kLmhhc2gKPiBpbmRleCBlNTU4OGYwNmEyLi5m
OTk5ZDBkMzRlIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uvc3lzdGVtZC9zeXN0ZW1kLmhhc2gKPiAr
KysgYi9wYWNrYWdlL3N5c3RlbWQvc3lzdGVtZC5oYXNoCj4gQEAgLTEsNSArMSw1IEBACj4gICAj
IHNoYTI1NiBsb2NhbGx5IGNvbXB1dGVkCj4gLXNoYTI1NiAgM2QyMzAwM2VhODg2ZGJmZmE1YmM4
NGFkNzJjNmVkY2JkZTYyZDMyZGJkZWM1MDZlMzA4NjI0ZTFkYTUwOWNiMCAgc3lzdGVtZC0yNTQu
OS50YXIuZ3oKPiArc2hhMjU2ICAyNmFjNzNjMjEwODEzMmIxZDExZmY5MzllOGIxYmVjZTQyZjFj
MWRhMDNmZGY0YTI0MmFmNWE3Y2YzYWMzNGYxICBzeXN0ZW1kLTI1NC4xMy50YXIuZ3oKPiAgIHNo
YTI1NiAgYWIxNWZkNTI2YmQ4ZGQxOGE5ZTc3ZWJjMTM5NjU2YmY0ZDMzZTk3ZmM3MjM4Y2QxMWJm
NjBlMmI5Yjg2NjZjNiAgTElDRU5TRS5HUEwyCj4gICBzaGEyNTYgIGRjNjI2NTIwZGNkNTNhMjJm
NzI3YWYzZWU0MmM3NzBlNTZjOTdhNjRmZTNhZGIwNjM3OTlkOGFiMDMyZmU1NTEgIExJQ0VOU0Uu
TEdQTDIuMQo+ICAgc2hhMjU2ICBlNWE4NjQ1YWQ5NGFhYjI0ZTMxMmRkMGM2YmUyYWE1NDIzNmVi
OTM3NDQ4MGIxYjE0ZWE1YzYxNTk4ODc0ZmQ1ICBMSUNFTlNFUy9CU0QtMi1DbGF1c2UudHh0Cj4g
ZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc3lzdGVtZC9zeXN0ZW1kLm1rIGIvcGFja2FnZS9zeXN0ZW1k
L3N5c3RlbWQubWsKPiBpbmRleCA0ODNiMmQyNGE1Li42YjM1NTM3MjNjIDEwMDY0NAo+IC0tLSBh
L3BhY2thZ2Uvc3lzdGVtZC9zeXN0ZW1kLm1rCj4gKysrIGIvcGFja2FnZS9zeXN0ZW1kL3N5c3Rl
bWQubWsKPiBAQCAtMTksNyArMTksNyBAQAo+ICAgIyAtIERpZmYgc3lzdXNlcnMuZCB3aXRoIHRo
ZSBwcmV2aW91cyB2ZXJzaW9uCj4gICAjIC0gRGlmZiBmYWN0b3J5L2V0Yy9uc3N3aXRjaC5jb25m
IHdpdGggdGhlIHByZXZpb3VzIHZlcnNpb24KPiAgICMgICAoZGV0YWlscyBhcmUgb2Z0ZW4gc3By
aW5rbGVkIGFyb3VuZCBpbiBSRUFETUUgYW5kIG1hbnBhZ2VzKQo+IC1TWVNURU1EX1ZFUlNJT04g
PSAyNTQuOQo+ICtTWVNURU1EX1ZFUlNJT04gPSAyNTQuMTMKPiAgIFNZU1RFTURfU0lURSA9ICQo
Y2FsbCBnaXRodWIsc3lzdGVtZCxzeXN0ZW1kLXN0YWJsZSx2JChTWVNURU1EX1ZFUlNJT04pKQo+
ICAgU1lTVEVNRF9MSUNFTlNFID0gXAo+ICAgCUxHUEwtMi4xKywgXApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
