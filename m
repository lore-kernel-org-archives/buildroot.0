Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00984C3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 02:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36CCD404A9;
	Mon, 12 Aug 2024 02:23:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Prgqg-Lek0he; Mon, 12 Aug 2024 02:23:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1092404A4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1092404A4;
	Mon, 12 Aug 2024 02:23:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5F5391BF2EF
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 02:23:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D37C606F6
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 02:23:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4nKzFeQuHkED for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 02:23:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2d; helo=mail-oo1-xc2d.google.com;
 envelope-from=lancethepants@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C9955606F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9955606F0
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C9955606F0
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 02:23:35 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 006d021491bc7-5d5ed6f51cfso2646963eaf.0
 for <buildroot@buildroot.org>; Sun, 11 Aug 2024 19:23:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723429414; x=1724034214;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wFK4WE1JRHh7yDY5jXzXpUKpLOMj893VUaMwm3+g7fA=;
 b=YvqskJ4jhtgNYsSgw7HJpS7LCokxEnrPNxcFE6dORNyYXvkriAARUjq3mUq4voO3Cl
 4vh94Yzkb+mXqs3rqNcXVjfychF4B8kRa8OslJvUfr873gQsV2fF0yaHLGrIWsfkt5Sl
 DVt2yQXwDKqKtitlOYVK+7OJxSmIsSrB0AedzUPZfmIBHqpysH+HAVQhGH5+BPDOnTDH
 9k6ZFB0slGg6GGmayKFHqRabKaG5i28QtvtUdRk5mjt3do8f8GtyRVkFqNkYo442h6xF
 Y9Hn5no/y+964KhavvqTqxwCp48vS6CN8cAVgjW/ahSmpo0sAXAgzQyK6+BHflxQ0PnB
 pq8w==
X-Gm-Message-State: AOJu0YywukpVP/Gj1yfHStiB0ABBV7HvHu39IhbZY2dAxPELLT1BFK3U
 T2ax3Vo4M3/uJepCZ55MQVHbXgh29wylPAn7AAXR4G3bHm4Q40epiVjY+Ai2
X-Google-Smtp-Source: AGHT+IGvXHctEeK5/6FijULpG/f5ILBbFC5ERc2QN7BPUA/7fRhlUvWkPFZWVV9KF9c5rAuwXcPGlQ==
X-Received: by 2002:a05:6358:12a6:b0:1ac:f2bb:8aa6 with SMTP id
 e5c5f4694b2df-1b17713bdc3mr1229845055d.21.1723429413346; 
 Sun, 11 Aug 2024 19:23:33 -0700 (PDT)
Received: from [192.168.10.71] ([199.119.84.5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-710e5a43fb6sm3049066b3a.140.2024.08.11.19.23.32
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Aug 2024 19:23:32 -0700 (PDT)
Message-ID: <6d542350-ab1d-4a45-9986-cdc51a51b66e@gmail.com>
Date: Sun, 11 Aug 2024 20:23:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
References: <ZrYHmDKI5LAwlA5a@waldemar-brodkorb.de>
From: Lance Fredrickson <lancethepants@gmail.com>
Autocrypt: addr=lancethepants@gmail.com; keydata=
 xjMEYXonzxYJKwYBBAHaRw8BAQdAarNDvmvbhGq/APN1zdGTpi6kPzps2qgQvmGOA10v/cDN
 K0xhbmNlIEZyZWRyaWNrc29uIDxsYW5jZXRoZXBhbnRzQGdtYWlsLmNvbT7CkQQTFggAORYh
 BEL55oGrzdK3LE+GnEk/TYZKRbHIBQJheifPBQkFo5qAAhsDBQsJCAcCBhUICQoLAgUWAgMB
 AAAKCRBJP02GSkWxyJz7AQDJJ6JRlv/941HI2wfF0wHXfaQMlxswxREAs1oNYGMJEwD+PV8F
 ET9rM95hft350hoxE+eQXj8Qqs5RQBbqNbFY5QnOOARheifPEgorBgEEAZdVAQUBAQdAgF6v
 nztQf05OavT+K/KZLg9MBYGFTcF+Q90IgHpC2l4DAQgHwn4EGBYIACYWIQRC+eaBq83StyxP
 hpxJP02GSkWxyAUCYXonzwUJBaOagAIbDAAKCRBJP02GSkWxyPZoAQD8/ZBL6cYlHB8oFDxe
 Y1Ia+Wofr0qk7kmw1yWjweyx2gD/VhdRXzKCSLXg6mDDqEzo1hcUztKmZ+L67IswDhVhVwI=
In-Reply-To: <ZrYHmDKI5LAwlA5a@waldemar-brodkorb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723429414; x=1724034214; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wFK4WE1JRHh7yDY5jXzXpUKpLOMj893VUaMwm3+g7fA=;
 b=MkSoEWYLbIlrIN9rLQJWWKcqomOjfq1I18WuD3+ug5gM9MxZ8LFfuD+FC4jvymKB8c
 EyRRPtnpQC4tg1r1uXb1PlRhR/4m3x7FRXl2xh60ZB7bca3LwfVWVBv36IGC6tCeeOCP
 WkkKDvTAuz5XO9YJa0aMyXjNnamqzKKEknEdvsM4D5m5MIBdn9lEDOp28fa4eX3QYFCw
 VnLaUZNNCgVm1NiBaA6NZ6NceXT5Bc1F/sxHFLJS7AfG5jdkzkbrIEqU56yYpnIibdmd
 JQfrJAPIaVmqJO5JfLK7eb/J7i/g6QEOn7zgZIe3Mu+GmKJFdW8SnxqeFu80h2fJtZHM
 VpqQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MkSoEWYL
Subject: Re: [Buildroot] [PATCH] package/ffmpeg: fix gcc 14.x compile issue
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SXQgbG9va3MgbGlrZSBpbiBmZm1wZWcgNi4xLjIgdGhleSBpbnRyb2R1Y2VkIGEgY2hhbmdlIGlu
IGNvbW1pdCAKOWU2NzRiMzE2MDZjODA1ZGQzMWI0YmI3NTQzNjRhNzJhNTg3NzIzOCB0aGF0IHRy
aWVzIHRvIGRldGVjdCBtdXNsIHdpdGggCm1hY3JvICJfX211c2xfXyIsIHdoaWNoIGZvciB0aG9z
ZSBub3QgZmFtaWxpYXIgd2l0aCBtdXNsLMKgIGRvZXMgbm90IGFuZCAKd2lsbCBuZXZlciBleGlz
dC7CoCBUaGlzIGlzIHN0aWxsIHByZXNlbnQgaW4gbWFzdGVyLCBzbyBwcmVzdW1hYmx5wqAgaW4g
CnRoZSBsYXRlc3QgNy4wIHJlbGVhc2UgYXMgd2VsbC4gSSBzdWJtaXR0ZWQgdGhlIGZvbGxvd2lu
ZyBidWcgcmVwb3J0IHRvIAp0aGVtLgpodHRwczovL2ZmbXBlZy5vcmcvcGlwZXJtYWlsL2ZmbXBl
Zy1kZXZlbC8yMDI0LUF1Z3VzdC8zMzIyMjUuaHRtbAoKVGhlIGVycm9yIGxvb2tzIGxpa2UKbGli
YXZkZXZpY2UvdjRsMi5jOjEzNzoxNzogZXJyb3I6IGFzc2lnbm1lbnQgdG8g4oCYaW50ICgqKShp
bnQswqAgbG9uZyAKdW5zaWduZWQgaW50LCAuLi4p4oCZIGZyb20gaW5jb21wYXRpYmxlIHBvaW50
ZXIgdHlwZSDigJhpbnQgKCopKGludCwgaW50LCAKLi4uKeKAmSBbLVdpbmNvbXBhdGlibGUtcG9p
bnRlci10eXBlc10KIMKgIDEzNyB8wqDCoMKgwqAgcy0+aW9jdGxfZsKgID0gcHJlZml4ICMjIGlv
Y3RsO8KgwqDCoMKgwqAgXAoKU28gSSBiZWxpZXZlIGFueW9uZSB1c2luZyBtdXNsIHdpbGwgZW5j
b3VudGVyIHRoaXMgYnVpbGQgZXJyb3IuCgp0aGFua3MsCkxhbmNlIEZyZWRyaWNrc29uCgpPbiA4
LzkvMjAyNCA2OjEyIEFNLCBXYWxkZW1hciBCcm9ka29yYiB3cm90ZToKPiBGaXhlczoKPiAgIC0g
aHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvYTA0L2EwNDBjYmM5OTFkYTE0
YzY4MzAyMDYyY2U5NjEyMWIxZTU1YzY5MGUKPgo+IFNpZ25lZC1vZmYtYnk6IFdhbGRlbWFyIEJy
b2Rrb3JiIDx3YnhAb3BlbmFkay5vcmc+Cj4gLS0tCj4gICAuLi5heS1kdmQtVXNlLWNvcnJlY3Qt
cG9pbnRlci10eXBlcy1vbi0ucGF0Y2ggfCA1MiArKysrKysrKysrKysrKysrKysrCj4gICAxIGZp
bGUgY2hhbmdlZCwgNTIgaW5zZXJ0aW9ucygrKQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2th
Z2UvZmZtcGVnLzAwMDYtYXZjb2RlYy1wY20tYmx1cmF5LWR2ZC1Vc2UtY29ycmVjdC1wb2ludGVy
LXR5cGVzLW9uLS5wYXRjaAo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZmZtcGVnLzAwMDYtYXZj
b2RlYy1wY20tYmx1cmF5LWR2ZC1Vc2UtY29ycmVjdC1wb2ludGVyLXR5cGVzLW9uLS5wYXRjaCBi
L3BhY2thZ2UvZmZtcGVnLzAwMDYtYXZjb2RlYy1wY20tYmx1cmF5LWR2ZC1Vc2UtY29ycmVjdC1w
b2ludGVyLXR5cGVzLW9uLS5wYXRjaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAw
MDAwMDAwMC4uYTc3YTBjZjVlYwo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL2ZmbXBl
Zy8wMDA2LWF2Y29kZWMtcGNtLWJsdXJheS1kdmQtVXNlLWNvcnJlY3QtcG9pbnRlci10eXBlcy1v
bi0ucGF0Y2gKPiBAQCAtMCwwICsxLDUyIEBACj4gK0Zyb20gMzQ3YTcwZjEwMWJlMjhmOGQ3OGU4
ZmQ2MmZmYzNhNzgzMjRmNDllOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiArRnJvbTogQW5k
cmVhcyBSaGVpbmhhcmR0IDxhbmRyZWFzLnJoZWluaGFyZHRAb3V0bG9vay5jb20+Cj4gK0RhdGU6
IFRodSwgMjggTWFyIDIwMjQgMDU6MzU6MzYgKzAxMDAKPiArU3ViamVjdDogW1BBVENIXSBhdmNv
ZGVjL3BjbS1ibHVyYXkvZHZkOiBVc2UgY29ycmVjdCBwb2ludGVyIHR5cGVzIG9uIEJFCj4gKwo+
ICtTaWduZWQtb2ZmLWJ5OiBBbmRyZWFzIFJoZWluaGFyZHQgPGFuZHJlYXMucmhlaW5oYXJkdEBv
dXRsb29rLmNvbT4KPiArU2lnbmVkLW9mZi1ieTogV2FsZGVtYXIgQnJvZGtvcmIgPHdieEBvcGVu
YWRrLm9yZz4KPiArVXBzdHJlYW06IGh0dHBzOi8vZ2l0LmZmbXBlZy5vcmcvZ2l0d2ViL2ZmbXBl
Zy5naXQvY29tbWl0LzM0N2E3MGYxMDFiZTI4ZjhkNzhlOGZkNjJmZmMzYTc4MzI0ZjQ5ZTkKPiAr
LS0tCj4gKyBsaWJhdmNvZGVjL3BjbS1ibHVyYXkuYyB8IDUgKysrLS0KPiArIGxpYmF2Y29kZWMv
cGNtLWR2ZC5jICAgIHwgMiArLQo+ICsgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCj4gKwo+ICtkaWZmIC0tZ2l0IGEvbGliYXZjb2RlYy9wY20tYmx1cmF5
LmMgYi9saWJhdmNvZGVjL3BjbS1ibHVyYXkuYwo+ICtpbmRleCBmNjU2MDk1MTRhLi4yMzUwMjBk
NzhmIDEwMDY0NAo+ICstLS0gYS9saWJhdmNvZGVjL3BjbS1ibHVyYXkuYwo+ICsrKysgYi9saWJh
dmNvZGVjL3BjbS1ibHVyYXkuYwo+ICtAQCAtMTY3LDcgKzE2Nyw3IEBAIHN0YXRpYyBpbnQgcGNt
X2JsdXJheV9kZWNvZGVfZnJhbWUoQVZDb2RlY0NvbnRleHQgKmF2Y3R4LCBBVkZyYW1lICpmcmFt
ZSwKPiArICAgICAgICAgICAgIHNhbXBsZXMgKj0gbnVtX3NvdXJjZV9jaGFubmVsczsKPiArICAg
ICAgICAgICAgIGlmIChBVl9TQU1QTEVfRk1UX1MxNiA9PSBhdmN0eC0+c2FtcGxlX2ZtdCkgewo+
ICsgI2lmIEhBVkVfQklHRU5ESUFOCj4gKy0gICAgICAgICAgICAgICAgYnl0ZXN0cmVhbTJfZ2V0
X2J1ZmZlcigmZ2IsIGRzdDE2LCBidWZfc2l6ZSk7Cj4gKysgICAgICAgICAgICAgICAgYnl0ZXN0
cmVhbTJfZ2V0X2J1ZmZlcigmZ2IsICh1aW50OF90Kilkc3QxNiwgYnVmX3NpemUpOwo+ICsgI2Vs
c2UKPiArICAgICAgICAgICAgICAgICBkbyB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICpkc3Qx
NisrID0gYnl0ZXN0cmVhbTJfZ2V0X2JlMTZ1KCZnYik7Cj4gK0BAIC0xODcsNyArMTg3LDggQEAg
c3RhdGljIGludCBwY21fYmx1cmF5X2RlY29kZV9mcmFtZShBVkNvZGVjQ29udGV4dCAqYXZjdHgs
IEFWRnJhbWUgKmZyYW1lLAo+ICsgICAgICAgICAgICAgaWYgKEFWX1NBTVBMRV9GTVRfUzE2ID09
IGF2Y3R4LT5zYW1wbGVfZm10KSB7Cj4gKyAgICAgICAgICAgICAgICAgZG8gewo+ICsgI2lmIEhB
VkVfQklHRU5ESUFOCj4gKy0gICAgICAgICAgICAgICAgICAgIGJ5dGVzdHJlYW0yX2dldF9idWZm
ZXIoJmdiLCBkc3QxNiwgYXZjdHgtPmNoX2xheW91dC5uYl9jaGFubmVscyAqIDIpOwo+ICsrICAg
ICAgICAgICAgICAgICAgICBieXRlc3RyZWFtMl9nZXRfYnVmZmVyKCZnYiwgKHVpbnQ4X3QqKWRz
dDE2LAo+ICsrICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGF2Y3R4
LT5jaF9sYXlvdXQubmJfY2hhbm5lbHMgKiAyKTsKPiArICAgICAgICAgICAgICAgICAgICAgZHN0
MTYgKz0gYXZjdHgtPmNoX2xheW91dC5uYl9jaGFubmVsczsKPiArICNlbHNlCj4gKyAgICAgICAg
ICAgICAgICAgICAgIGNoYW5uZWwgPSBhdmN0eC0+Y2hfbGF5b3V0Lm5iX2NoYW5uZWxzOwo+ICtk
aWZmIC0tZ2l0IGEvbGliYXZjb2RlYy9wY20tZHZkLmMgYi9saWJhdmNvZGVjL3BjbS1kdmQuYwo+
ICtpbmRleCA0MTliMmExMzhmLi4zMTk3NDZjNjJlIDEwMDY0NAo+ICstLS0gYS9saWJhdmNvZGVj
L3BjbS1kdmQuYwo+ICsrKysgYi9saWJhdmNvZGVjL3BjbS1kdmQuYwo+ICtAQCAtMTU3LDcgKzE1
Nyw3IEBAIHN0YXRpYyB2b2lkICpwY21fZHZkX2RlY29kZV9zYW1wbGVzKEFWQ29kZWNDb250ZXh0
ICphdmN0eCwgY29uc3QgdWludDhfdCAqc3JjLAo+ICsgICAgIHN3aXRjaCAoYXZjdHgtPmJpdHNf
cGVyX2NvZGVkX3NhbXBsZSkgewo+ICsgICAgIGNhc2UgMTY6IHsKPiArICNpZiBIQVZFX0JJR0VO
RElBTgo+ICstICAgICAgICBieXRlc3RyZWFtMl9nZXRfYnVmZmVyKCZnYiwgZHN0MTYsIGJsb2Nr
cyAqIHMtPmJsb2NrX3NpemUpOwo+ICsrICAgICAgICBieXRlc3RyZWFtMl9nZXRfYnVmZmVyKCZn
YiwgKHVpbnQ4X3QqKWRzdDE2LCBibG9ja3MgKiBzLT5ibG9ja19zaXplKTsKPiArICAgICAgICAg
ZHN0MTYgKz0gYmxvY2tzICogcy0+YmxvY2tfc2l6ZSAvIDI7Cj4gKyAjZWxzZQo+ICsgICAgICAg
ICBpbnQgc2FtcGxlcyA9IGJsb2NrcyAqIGF2Y3R4LT5jaF9sYXlvdXQubmJfY2hhbm5lbHM7Cj4g
Ky0tCj4gKzIuMzkuMgo+ICsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
