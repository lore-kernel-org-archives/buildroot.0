Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA92C27C53
	for <buildroot@archiver.kernel.org>; Wed, 19 Jun 2024 20:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 19F17401FE;
	Wed, 19 Jun 2024 20:25:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vTGvbzkFDk7t; Wed, 19 Jun 2024 20:25:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB6214036F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB6214036F;
	Wed, 19 Jun 2024 20:25:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0DFD61BF846
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 20:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA9CB401FE
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 20:25:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uz6DLqRrUz_R for <buildroot@lists.busybox.net>;
 Wed, 19 Jun 2024 20:25:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D11D34036F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D11D34036F
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D11D34036F
 for <buildroot@buildroot.org>; Wed, 19 Jun 2024 20:25:39 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-42172ab4b60so2008055e9.0
 for <buildroot@buildroot.org>; Wed, 19 Jun 2024 13:25:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718828737; x=1719433537;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yTGh2HreuIdE4TMAHFrmBEwrDYFz9+mf2mMMyNNgGZ0=;
 b=CB4GeD7uL74UBraY1EPgE/TTisHdRFPxMZPy6K5H7vTa0MImlEupUt/0C1NgiMcYQs
 J+Wv8HX8fZd2lAw6+Q/LwkOs3unmkNMCgZJdjRP+tWbD/O6TlLrCPsy8ZJcrSdY0zGAa
 jvf5UY7hJ58lVpK3aAkI0TaGbEvwGz1Wxs4hnbWtWjChFh12++P9bSb3ojgj12ZbnF17
 CHkgChInM5AieqpX77KXW7KMGk7L7q+hB69ubLXs6gLOFGs+1kYklqvlh/hphLrCnSJr
 v8lGLWaT1Tz6N5jpt9bmS3g8OSpfa9fKDz4FwGqUUUy8QtX5ros6eNDHHNm64QDAe2KZ
 jnog==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhewAq4vhPJ9mjpMSh10xXf1+OBl8zVK8oEJWsFN3eeMaF69pQQrv8K6WOU09rdI7zLWd9/0N+mEeMkQhf1YBDE/y3KAXuag==
X-Gm-Message-State: AOJu0YwrBMpkCeknWqi+K6adVIOSFkPDvLPwpVtCqXC43d7yxRR2LYrC
 20DafvpTKhToeHNIMAbCYYlrZGH9nrbHu6VzxYpaPPB3l4TyFWmw5O70NynJSOFHgIIjbSch6CK
 E
X-Google-Smtp-Source: AGHT+IEhPro0UXXmS81VbRboxI5i0oqA3MvqtgE/rfbNEZ5UhojUEWBbNn6h02oJZKTb8bkLkVUCfg==
X-Received: by 2002:a05:600c:4a14:b0:421:5554:744c with SMTP id
 5b1f17b1804b1-4247517550amr25847185e9.11.1718828737280; 
 Wed, 19 Jun 2024 13:25:37 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4247d1f728asm1372575e9.48.2024.06.19.13.25.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jun 2024 13:25:36 -0700 (PDT)
Message-ID: <10907897-c3bc-48c9-9d11-b8966b58a612@mind.be>
Date: Wed, 19 Jun 2024 22:25:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: lancethepants <lancethepants@gmail.com>, buildroot@buildroot.org
References: <20240605212001.1724218-1-lancethepants@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240605212001.1724218-1-lancethepants@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1718828737; x=1719433537; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yTGh2HreuIdE4TMAHFrmBEwrDYFz9+mf2mMMyNNgGZ0=;
 b=HMTaPcmYJ1FzLBLYBNtl2nOdRAT4gu+dSX6xYxAmFoGVL6M+CzgzN9I9Zm6TgC5B4J
 1nbw35s1NyZQ6dtSvNAXn9kxIa5+XkvwYLuyHj0DoL8siQGvZYEIBU9hFihtC+SV8EHb
 u58WESZQxJ8tncHORgcyeMipF3iRM66QYoyASB30gqBDxD1CIP23/XzdDV0EyCzpfXmo
 XP/zAFeIOsrU53PTd/AnoUocEz++X6gOkbQHxky0HGHC8OcW6nDzut04rktycmvto8HM
 2GGiPwvVvWtvY9tT8NU040X+EPbZ+zwWP5Usw0/RB/5olcV5Sr30Dvj4ppwUer/hJIAu
 ZaAw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=HMTaPcmY
Subject: Re: [Buildroot] [PATCH 1/1] boot/syslinux: fix build with GCC 14.x
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ICBIaSBMYW5jZSwKCk9uIDA1LzA2LzIwMjQgMjM6MjAsIGxhbmNldGhlcGFudHMgd3JvdGU6Cj4g
QWRkIG1pc3Npbmcgc3RkaW8uaCBpbmNsdWRlLiBXaXRob3V0IGl0IHJlc3VsdHMgaW4gdGhlIGZv
bGxvd2luZyBlcnJvciB1bmRlciBHQ0MgMTQueAo+IAo+IC4uLy4uLy4uL2NvbTMyL2xpYi9zeXNs
aW51eC9kZWJ1Zy5jOiBJbiBmdW5jdGlvbiDigJhzeXNsaW51eF9kZWJ1Z+KAmToKPiAuLi8uLi8u
Li9jb20zMi9saWIvc3lzbGludXgvZGVidWcuYzo5MTo1OiBlcnJvcjogaW1wbGljaXQgZGVjbGFy
YXRpb24gb2YgZnVuY3Rpb24g4oCYcHJpbnRm4oCZIFstV2ltcGxpY2l0LWZ1bmN0aW9uLWRlY2xh
cmF0aW9uXQo+ICAgICA5MSB8ICAgICBwcmludGYoIkR5bmFtaWMgZGVidWcgdW5hdmFpbGFibGVc
biIpOwo+IAo+IFNpZ25lZC1vZmYtYnk6IExhbmNlIEZyZWRyaWNrc29uIDxsYW5jZXRoZXBhbnRz
QGdtYWlsLmNvbT4KPiAtLS0KPiAgIC4uLi8wMDIwLXB1bGwtaW4tc3RkaW8taC1mb3ItZ2NjMTQu
cGF0Y2ggICAgICB8IDI1ICsrKysrKysrKysrKysrKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAy
NSBpbnNlcnRpb25zKCspCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgYm9vdC9zeXNsaW51eC8wMDIw
LXB1bGwtaW4tc3RkaW8taC1mb3ItZ2NjMTQucGF0Y2gKPiAKPiBkaWZmIC0tZ2l0IGEvYm9vdC9z
eXNsaW51eC8wMDIwLXB1bGwtaW4tc3RkaW8taC1mb3ItZ2NjMTQucGF0Y2ggYi9ib290L3N5c2xp
bnV4LzAwMjAtcHVsbC1pbi1zdGRpby1oLWZvci1nY2MxNC5wYXRjaAo+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uNjcxMWM3YWE3OAo+IC0tLSAvZGV2L251bGwKPiAr
KysgYi9ib290L3N5c2xpbnV4LzAwMjAtcHVsbC1pbi1zdGRpby1oLWZvci1nY2MxNC5wYXRjaAo+
IEBAIC0wLDAgKzEsMjUgQEAKPiArRnJvbSBkZmEyNzA1MTAwYTg5M2JjMDE3ZDIzNDA2ZGFhOWEz
ODNmYmMzYzk1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ICtGcm9tOiBsYW5jZXRoZXBhbnRz
IDxsYW5jZXRoZXBhbnRzQGdtYWlsLmNvbT4KPiArRGF0ZTogV2VkLCA1IEp1biAyMDI0IDE0OjMx
OjM4IC0wNjAwCj4gK1N1YmplY3Q6IFtQQVRDSF0gY29tMzIvbGliL3N5c2xpbnV4L2RlYnVnLmM6
IGFkZCBtaXNzaW5nIHN0ZGlvLmggaW5jbHVkZS4KPiArCj4gK0ZpeGVzIGJ1aWxkaW5nIHdpdGgg
R0NDIDE0LngKCiAgQXMgY2hlY2stcGFja2FnZSByZXBvcnRzLCB0aGUgcGF0Y2ggaXMgbWlzc2lu
ZyBhIFNpZ25lZC1vZmYtYnkgKHRvIGluZGljYXRlIAp0aGF0IHlvdSBhcmUgYWxsb3dlZCB0byBj
b250cmlidXRlIGl0IHVuZGVyIHRoZSBzeXNsaW51eCBsaWNlbnNlKSBhbmQgYW4gClVwc3RyZWFt
OiBpbmRpY2F0b3IuIFdlIGV4cGVjdCB5b3UgdG8gc3VibWl0IHRoZSBwYXRjaCB1cHN0cmVhbSBi
ZWZvcmUgeW91IApzdWJtaXQgaXQgdG8gYnVpbGRyb290LgoKICBSZWdhcmRzLAogIEFybm91dAoK
PiArLS0tCj4gKyBjb20zMi9saWIvc3lzbGludXgvZGVidWcuYyB8IDEgKwo+ICsgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gKwo+ICtkaWZmIC0tZ2l0IGEvY29tMzIvbGliL3N5c2xp
bnV4L2RlYnVnLmMgYi9jb20zMi9saWIvc3lzbGludXgvZGVidWcuYwo+ICtpbmRleCBkOWFiODYz
Zi4uZThmNTNkNTcgMTAwNjQ0Cj4gKy0tLSBhL2NvbTMyL2xpYi9zeXNsaW51eC9kZWJ1Zy5jCj4g
KysrKyBiL2NvbTMyL2xpYi9zeXNsaW51eC9kZWJ1Zy5jCj4gK0BAIC0xLDYgKzEsNyBAQAo+ICsg
I2luY2x1ZGUgPGxpbnV4L2xpc3QuaD4KPiArICNpbmNsdWRlIDxzdHJpbmcuaD4KPiArICNpbmNs
dWRlIDxzdGRib29sLmg+Cj4gKysjaW5jbHVkZSA8c3RkaW8uaD4KPiArCj4gKyAjaWZkZWYgRFlO
QU1JQ19ERUJVRwo+ICsKPiArLS0KPiArMi4zOS4yCj4gKwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
