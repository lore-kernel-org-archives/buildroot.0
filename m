Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB37CEFCBD4
	for <buildroot@archiver.kernel.org>; Mon, 16 Mar 2026 08:08:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA39F40FD7;
	Mon, 16 Mar 2026 08:07:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dneYXiBZD0M1; Mon, 16 Mar 2026 08:07:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D326E40FBD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773648477;
	bh=tGrbkz8MXn2rdfopj2hTYJODbLL9DoxTLUb2+lJTLDc=;
	h=Date:From:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:Cc:From;
	b=OpYcI7xIlkJ0tNczzU/SPDq6kPeKbynefGMu5bU9jSI3pcrSuyTwm8BJwSt1Y9won
	 o3yK5LnsICaMygfqwcO8D1733V2CZ01UwVOFkYb5anQf8PLDmgFbfEODYsgoSgsQva
	 TcRfs2wKz20u+ikkZB4XP9x2d2oSK+V5uD0tpscRTJICQ/JG0Imjlxtv9Un+sKIySN
	 oB/JdqiJsgM6XA/N5rONxZ1Qvw8K0kflXNgaXXs2CrEWuHEiez9vN989qXpswOdc1A
	 JePsbJuPN26CFA+s9Rou6j+2eJReY57gLchfweq29oA2gH+69DaMv1hK3tR05HxvFo
	 Z5JNUEqE3DUBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D326E40FBD;
	Mon, 16 Mar 2026 08:07:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E6809D3
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 08:07:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC547407F5
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 08:07:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hUDqE89j29C1 for <buildroot@buildroot.org>;
 Mon, 16 Mar 2026 08:07:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A4A00407EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4A00407EB
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A4A00407EB
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 08:07:55 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-43b40003d13so750971f8f.2
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 01:07:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773648473; x=1774253273;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:reply-to:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y9l/C72zgoKDzJuZ4YXx1KBqVc7MN2QqEvnKwhPEmm0=;
 b=LocH6ZiXn9WvB0NPCEizi0rPYvneBYRcoDv8Dqa8+To0bxKe3jyLiumls2dsdL3mS9
 nYwKvxm4As0+9rm2c1YvPlJ+1Jc+BjgBmy+cPJVIom1FOdTWZNRcpA3CMtwyKH/4m7/A
 aEKe8Xu/ntcd6rtXneaL9mEQ6KBHFdBkyGBNQ8o1AZfnu2NcpS7C+IptZmPeVE99merX
 McX1q7gOhE5aftc3/OTJPeclrOZJqDeWyBGIdrzE41TLrM1ZGwr0V+TnkPaIZMq9dtca
 6lRkDuuZctk3FbKJFtpoqR3Hrl81T+s/8AFKu8HvxrHHHWh/fHPk4qdtCr23vdGX7ms2
 kAeQ==
X-Gm-Message-State: AOJu0YxQYC5Pe7BT1cDjvJrleZ4Gk5kEs9fE2NPvmPKezJl3RhJrJzrS
 EOP/yxd6nazhUHAcPnD2Km4HkCVafo3eQ/3brUBzBeSkZ+n7nDbozalhpOO2X5MN
X-Gm-Gg: ATEYQzybnvnCnBVAuatspvk46AbsksjMM1HrNA/peQkxXf/4UOI3/TOMYTCAYw15ACs
 v/SuyKC1hcsuy3P81/+HZw6zgCxiK52UtAfq8s/hEjX+RCE6MkZI9zF6ujpnvG0MKunmYpHDg8N
 horGkrC0h/FmWFRM19Lwmq/WAlsDx1MsZfdhdzLoOXgAretngXKRRras/q1mG+n1ZXST4CG+gYK
 QNkn97EAuYUkyYgikd3o9dbOuewAIC1Oei0gG+MpGRnfmc9g/5NKilgaGZMx5atLW2ujjb2IME3
 hjsmq454pHKqPWUL4GwefjY/kmj9txRybLFXwr1/oFjCIzLHxP7S8um5gava9+thsKoElabmKh0
 XTtwaKWwmg2QA5jINhqTl8cIs6AchqmTVOW3SwlcoE57GIZW1rK6UxJJzbfc4eaSnKaJHfS9uF0
 YnlW6qCzBBBCVfzmHhejN3oZEaZKQutoSkC2so3kYPcSvLfZcDtAIc5vRWLxKLiQeT6fWO9Zs=
X-Received: by 2002:a05:6000:4014:b0:435:e3bd:5838 with SMTP id
 ffacd0b85a97d-43a04d8b4d7mr21168921f8f.25.1773648473032; 
 Mon, 16 Mar 2026 01:07:53 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439fe19aec5sm40450497f8f.4.2026.03.16.01.07.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2026 01:07:52 -0700 (PDT)
Date: Mon, 16 Mar 2026 09:07:50 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Message-ID: <20260316080750.GA288451@pevik>
References: <20260203224414.192218-1-petr.vorel@gmail.com>
 <20260203224414.192218-2-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260203224414.192218-2-petr.vorel@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773648473; x=1774253273; darn=buildroot.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:reply-to:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y9l/C72zgoKDzJuZ4YXx1KBqVc7MN2QqEvnKwhPEmm0=;
 b=Z23vH9Tv2iz5i58ViGB/oGlF+9LIhQjDg67+VvMBLZnQSdG5VTGB01Y5Nnwet6yawS
 ANAe5qAmHTTs+sG51ZQa7mKf/8kX0gLH/MBN49rR8bd7WI9g9d4yet4YB3+82tfzgw9F
 NGCDDDKTqWYAeQzJZOep3kVwvb0XJGzIN84WA7hDpHRragAKSBoxG5uk9jJWJ0tQe5uP
 Pc7wycB3XExhLhK0JXwZ7riWpLkJzj9WwNal9KKxrM2uFJz7uaUvV/1BGfLyzo6CiDW8
 cgPLo1ZmC+vCCxVZem3Jw/ap6cymSC5rNiAKRQBiCIwX7/u1sjUSiWJ4uLOiD5Vm8ajG
 Dhxw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Z23vH9Tv
Subject: Re: [Buildroot] [PATCH 2/2] package/ltp-testsuite: bump version to
 20260130
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgYWxsLAoKPiBTaWduZWQtb2ZmLWJ5OiBQZXRyIFZvcmVsIDxwZXRyLnZvcmVsQGdtYWlsLmNv
bT4KPiAtLS0KPiBIaSBhbGwsCgo+IHRoZXJlIGFyZSBzaWxsIHNvbWUgZmFpbHVyZXM6CnMvc2ls
bC9zdGlsbC8KCj4gKiBici1hcm0tYmFzaWMgWzI4LzM1XTogRkFJTEVECj4gZmNudGwzMS5jOjEy
MjoyMjogZXJyb3I6IOKAmEZfR0VUT1dOX0VY4oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0
aGlzIGZ1bmN0aW9uKTsgZGlkIHlvdSBtZWFuIOKAmEZfR0VUT1dO4oCZPwo+ICAgMTIyIHwgIFRF
U1QoZmNudGwodGVzdF9mZCwgRl9HRVRPV05fRVgsICZvcmlnX293bl9leCkpOwo+IGZjbnRsMzEu
YzoxODI6MjI6IGVycm9yOiDigJhGX1NFVE9XTl9FWOKAmSB1bmRlY2xhcmVkIChmaXJzdCB1c2Ug
aW4gdGhpcyBmdW5jdGlvbik7IGRpZCB5b3UgbWVhbiDigJhGX1NFVE9XTuKAmT8KPiAgIFRFU1Qo
ZmNudGwodGVzdF9mZCwgRl9TRVRPV05fRVgsICZvcmlnX293bl9leCkpOwoKPiBUaGUgY29uZmln
IGhhdmU6Cj4gQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9IRUFERVJTXzVfOT15Cj4gQlIyX1RPT0xD
SEFJTl9FWFRFUk5BTF9DVVNUT01fVUNMSUJDPXkKCj4gSSB3YXMgdGhpbmtpbmcgYWJvdXQgc29t
ZXRoaW5nIGxpa2U6Cj4gCWRlcGVuZHMgb24gIUJSMl9UT09MQ0hBSU5fVVNFU19VQ0xJQkMgfHwg
QlIyX1RPT0xDSEFJTl9IRUFERVJTX0FUX0xFQVNUXz9fPwoKPiBidXQgaXQncyBub3QgYWJvdXQg
a2VybmVsIGhlYWRlcnMgKGluY2x1ZGUvdWFwaS9hc20tZ2VuZXJpYy9mY250bC5oCj4gY29udGFp
bnMgYm90aCBGX0dFVE9XTl9FWCBhbmQgRl9TRVRPV05fRVggaW4gMi42KSwgYnV0IG1vcmUgYWJv
dXQgdGhlCj4gZmFjdCB0aGF0IHVDbGliYy1uZyB2ZXJzaW9uIGluIHRoZSB0b29sY2hhaW4gaXMg
MS4wLjM2LCBidXQgPGZjbnRsLmg+Cj4gcmVxdWlyZXMgbmV3ZXIgdUNsaWJjLW5nLCBhcyBpdCB3
YXMgYWRkZWQgaW4gdjEuMC40NToKPiA5ODU3NmFiOGQgKCJmY250bC5oOiBkZWNsYXJlIGZfb3du
ZXJfZXggZm9yIGFsbCBhcmNoaXRlY3R1cmVzIikKCj4gSG93IHRvIGV4cHJlc3MgdGhpcyBkZXBl
bmRlbmN5IGluIEJ1aWxkcm9vdD8KPiBBbHNvLCBJIGNvdWxkIGZpeCBpdCBpbiBMVFAgdXBzdHJl
YW0gaWYgeW91IHRoaW5rIDEuMC4zNiBpcyBzdGlsbCBuZXcKPiBlbm91Z2ggYW5kIHRoZXJlIGFy
ZSB1c2VycyB3aG8gYWN0dWFsbHkgdXNlIExUUCB3aXRoIHRoZXNlIG9sZGVyCj4gdG9vbGNoYWlu
cy4KCkdlbnRseSBwaW5nIGFib3V0IHRoaXMuCgpLaW5kIHJlZ2FyZHMsClBldHIKCj4gS2luZCBy
ZWdhcmRzLAo+IFBldHIKCj4gIHBhY2thZ2UvbHRwLXRlc3RzdWl0ZS9sdHAtdGVzdHN1aXRlLmhh
c2ggfCA0ICsrLS0KPiAgcGFja2FnZS9sdHAtdGVzdHN1aXRlL2x0cC10ZXN0c3VpdGUubWsgICB8
IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
Cgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2x0cC10ZXN0c3VpdGUvbHRwLXRlc3RzdWl0ZS5oYXNo
IGIvcGFja2FnZS9sdHAtdGVzdHN1aXRlL2x0cC10ZXN0c3VpdGUuaGFzaAo+IGluZGV4IGI5NmUx
ZjQ2ZmEuLmUxODYxYWU0ZTQgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9sdHAtdGVzdHN1aXRlL2x0
cC10ZXN0c3VpdGUuaGFzaAo+ICsrKyBiL3BhY2thZ2UvbHRwLXRlc3RzdWl0ZS9sdHAtdGVzdHN1
aXRlLmhhc2gKPiBAQCAtMSw0ICsxLDQgQEAKPiAtIyBGcm9tOiBodHRwczovL2dpdGh1Yi5jb20v
bGludXgtdGVzdC1wcm9qZWN0L2x0cC9yZWxlYXNlcy9kb3dubG9hZC8yMDI1MDkzMC9sdHAtZnVs
bC0yMDI1MDkzMC50YXIueHouc2hhMjU2Cj4gLXNoYTI1NiAgMDQ4ZmE0ZDY5ZGRiZThhOTRhYTE1
ZGE5YmRjODU3MTNhYjA3YTBhYmJjM2RlMmI4YmRkOTc1NzY0NGFlZjFlNCAgbHRwLWZ1bGwtMjAy
NTA5MzAudGFyLnh6Cj4gKyMgRnJvbTogaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4LXRlc3QtcHJv
amVjdC9sdHAvcmVsZWFzZXMvZG93bmxvYWQvMjAyNjAxMzAvbHRwLWZ1bGwtMjAyNjAxMzAudGFy
Lnh6LnNoYTI1Ngo+ICtzaGEyNTYgIDVlZmZjOWQzZWIzZjVjZDQ1ZDQ3ZThhYzNkNzhmNTljYjhm
M2Y3M2M4NTk4YTJmMTgyZWY1YjQwZGRmZmYzMTEgIGx0cC1mdWxsLTIwMjYwMTMwLnRhci54ego+
ICAjIExvY2FsbHkgY29tcHV0ZWQKPiAgc2hhMjU2ICA4MTc3Zjk3NTEzMjEzNTI2ZGYyY2Y2MTg0
ZDhmZjk4NmM2NzVhZmI1MTRkNGU2OGE0MDQwMTA1MjFiODgwNjQzICBDT1BZSU5HCj4gZGlmZiAt
LWdpdCBhL3BhY2thZ2UvbHRwLXRlc3RzdWl0ZS9sdHAtdGVzdHN1aXRlLm1rIGIvcGFja2FnZS9s
dHAtdGVzdHN1aXRlL2x0cC10ZXN0c3VpdGUubWsKPiBpbmRleCAxMmRiOGYyZDNiLi4yZTQ3Njdi
MWE1IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbHRwLXRlc3RzdWl0ZS9sdHAtdGVzdHN1aXRlLm1r
Cj4gKysrIGIvcGFja2FnZS9sdHAtdGVzdHN1aXRlL2x0cC10ZXN0c3VpdGUubWsKPiBAQCAtNCw3
ICs0LDcgQEAKCgoKPiAtTFRQX1RFU1RTVUlURV9WRVJTSU9OID0gMjAyNTA5MzAKPiArTFRQX1RF
U1RTVUlURV9WRVJTSU9OID0gMjAyNjAxMzAKPiAgTFRQX1RFU1RTVUlURV9TT1VSQ0UgPSBsdHAt
ZnVsbC0kKExUUF9URVNUU1VJVEVfVkVSU0lPTikudGFyLnh6Cj4gIExUUF9URVNUU1VJVEVfU0lU
RSA9IGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eC10ZXN0LXByb2plY3QvbHRwL3JlbGVhc2VzL2Rv
d25sb2FkLyQoTFRQX1RFU1RTVUlURV9WRVJTSU9OKQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
