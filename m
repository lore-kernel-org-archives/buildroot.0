Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D295EE77173
	for <buildroot@archiver.kernel.org>; Fri,  6 Dec 2024 14:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77FB180FFE;
	Fri,  6 Dec 2024 14:31:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xMBzbh6YXDgS; Fri,  6 Dec 2024 14:31:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CC44808A5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CC44808A5;
	Fri,  6 Dec 2024 14:31:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 26402ED0
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 14:31:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 132F6407D7
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 14:31:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KFQVeMk13bOg for <buildroot@buildroot.org>;
 Fri,  6 Dec 2024 14:31:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com;
 envelope-from=lancethepants@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B3DCA40790
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3DCA40790
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B3DCA40790
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 14:31:32 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-7e6cbf6cd1dso1226695a12.3
 for <buildroot@buildroot.org>; Fri, 06 Dec 2024 06:31:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733495492; x=1734100292;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8dBx0p0onDSLdBwhidqNmwfXg2cErZsY1FWrreTWH4M=;
 b=c3ptbdv0T9iZFnYmuvGiZEPvpQVq6F+jdpmps8mNe7/9v8ePDGZ+tCi/uWK2Vd2Xpz
 +XKbJ3CjhnAxv4vlmITvrMj+XLuS9zxtMiDrms16jr1FOgm5di6a//sgZ9/D8c52jGrV
 iWOF0KlvFNlVXsEupptnulOYEfAaWFGtuL0Udh4qtGjW3626v/xdGm4v4KB0FQIp/oUJ
 BEmqx76taNQ/Gs9mGr5P263wsTZMTIn75P7uFuBVabegIJHYUZVSIjZVrAjbi4YhZgZg
 MZLb92GEz4XCXb2j2HBKMHqq8JcEHd9piEBpiB65pCKpUlrIX+zs7JZTYOtRZhG+/ck8
 ypxQ==
X-Gm-Message-State: AOJu0YwQtKW7+PvzHYjzTfzebOoHTVcLgmWmSYKFC4UtWaM/rAku7j4Q
 1AlpWzm71Q87tuRoPg78oJez6IgeH8zLW2fM7UfvjnLTNGGgNX3ubEoymA==
X-Gm-Gg: ASbGncuaxZZFDLsEtmVCRlJrr3yTeXilaAtdxousnUEyskn94Q/JBdxvdHP/6Hfq10D
 xxYaKXPAKz9aw1/MIU/cCsq7UG6rqeAyaL9Q/aVrGro8H5wjs1YwrGOusupkRJ+uAbM1vwSnAuA
 vnFNZgBdcvzxLKrzHEiVoQcLkNxN+vwTfwF9DBnJxzVFz4J1dedS97WlMZgiGjHPNf/tWUL3fuH
 5C27+HHZVyY8yEJJStSOZgIw5P95jlUa32uiwggj4LCAsMUkjJ9yg3QqiWrqec=
X-Google-Smtp-Source: AGHT+IEBQvURdc0ycM2LSnJQr3BGvO3/gwZ8ErQoxSM3XcrqZ75m5u6hay+0W8KHpSWpqj+kzAp/+w==
X-Received: by 2002:a05:6a21:6da8:b0:1db:d980:440e with SMTP id
 adf61e73a8af0-1e1870b9946mr5800778637.14.1733495491645; 
 Fri, 06 Dec 2024 06:31:31 -0800 (PST)
Received: from [10.0.0.72] ([76.8.199.226]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7fd1568f26asm3097924a12.9.2024.12.06.06.31.31
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Dec 2024 06:31:31 -0800 (PST)
Message-ID: <7b139544-134b-4775-9070-ffd0dbd66438@gmail.com>
Date: Fri, 6 Dec 2024 07:31:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20241107134342.4306-1-tianyuanhao3@163.com>
 <20241107134342.4306-2-tianyuanhao3@163.com>
 <544b4ef9-04bd-43e5-8655-23556a740f7b@mind.be>
 <6e2e67e6.2701.193949deeb9.Coremail.tianyuanhao3@163.com>
Content-Language: en-US
From: Lance Fredrickson <lancethepants@gmail.com>
In-Reply-To: <6e2e67e6.2701.193949deeb9.Coremail.tianyuanhao3@163.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733495492; x=1734100292; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8dBx0p0onDSLdBwhidqNmwfXg2cErZsY1FWrreTWH4M=;
 b=fbSG0B6fv3HdtrQKcTDyiPQKpUNjvCNTgQ7HyhOWG37z4/zvI9zpa3IKMQ5n12ncAw
 4zBlEH5avGqZnR/yqfzl1nT5rSp+X+qyX6K4fMJf6cqeqJCoYetNxZxLnl7Pv5ITp6GE
 VTowe/CM4ZTXJIR8RyB7JG+LjF4hmwRyxIWvAULQ3AhxFbUFgrcLSCszgq8bJ6Tc7TBk
 6d7xkOUVNUs7GA0MDnEzeCBMPHLg9NIJJ5IM33IJNTcEyhgsQiVGEQo37NU2+iSaKKCk
 mdDLcTSmbhVXs0y3QT9RTzCMZsVU5CI2gT9IdidzsUtEoVwhghvRCuJbmTXZcXY3iGXB
 Cb2w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fbSG0B6f
Subject: Re: [Buildroot] [PATCH v2 2/2] package/gnutls: fix configure options
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gMjAyNC4xMS1yYzMgSSBhbSBub3cgZ2V0dGluZyB0aGlzIGVycm9yIHRoYXQgd2FzIG5vdCBw
cmVzZW50IGluIAoyMDI0LjExLXJjMi4KCkluIGZpbGUgaW5jbHVkZWQgZnJvbSBkbHdyYXAvYnJv
dGxpZW5jLmM6MTI6CmRsd3JhcC9icm90bGllbmMuaDoxMToxMDogZmF0YWwgZXJyb3I6IGJyb3Rs
aS9lbmNvZGUuaDogTm8gc3VjaCBmaWxlIG9yIApkaXJlY3RvcnkKIMKgwqAgMTEgfCAjaW5jbHVk
ZSA8YnJvdGxpL2VuY29kZS5oPgogwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgIF5+fn5+
fn5+fn5+fn5+fn5+CmNvbXBpbGF0aW9uIHRlcm1pbmF0ZWQuCkluIGZpbGUgaW5jbHVkZWQgZnJv
bSBkbHdyYXAvYnJvdGxpZGVjLmM6MTI6CmRsd3JhcC9icm90bGlkZWMuaDoxMToxMDogZmF0YWwg
ZXJyb3I6IGJyb3RsaS9kZWNvZGUuaDogTm8gc3VjaCBmaWxlIG9yIApkaXJlY3RvcnkKIMKgwqAg
MTEgfCAjaW5jbHVkZSA8YnJvdGxpL2RlY29kZS5oPgogwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKg
wqDCoMKgIF5+fn5+fn5+fn5+fn5+fn5+CmNvbXBpbGF0aW9uIHRlcm1pbmF0ZWQuCgpMb29rcyBm
cm9tIGRpc2N1c3Npb24gdGhhdCBhIGRpZmZlcmVudCBwYXRjaCBpcyBuZWVkZWQgb3IgcGF0Y2gg
Mi8yIApuZWVkcyByZXZlcnRlZCBzaW5jZSAxLzIgaXMgc2xhdGVkIGZvciBuZXh0LgoKTGFuY2UK
CgpPbiAxMi80LzIwMjQgNzoxOSBQTSwgVElBTiBZdWFuaGFvIHdyb3RlOgo+IEF0IDIwMjQtMTIt
MDUgMDU6NTE6MzgsICJBcm5vdXQgVmFuZGVjYXBwZWxsZSIgPGFybm91dEBtaW5kLmJlPiB3cm90
ZToKPj4gT24gMDcvMTEvMjAyNCAxNDo0MywgVElBTiBZdWFuaGFvIHdyb3RlOgo+Pj4gVHdvIGNv
bmZpZ3VyZSBvcHRpb24gbmFtZXMgaGF2ZSBiZWVuIGNoYW5nZWQgc2luY2UgdmVyc2lvbiAzLjcu
NSBbMV06Cj4+Pgo+Pj4+IE9sZDogLS13aXRob3V0LWxpYmJyb3RsaSAtLXdpdGhvdXQtbGlienN0
ZCAoYWxzbyAtLXdpdGgtKikKPj4+PiBOZXc6IC0td2l0aG91dC1icm90bGkgLS13aXRob3V0LXpz
dGQgKGFsc28gLS13aXRoLSopCj4+PiBGaXhlczoKPj4+Cj4+PiAgICAgY29uZmlndXJlOiBXQVJO
SU5HOiB1bnJlY29nbml6ZWQgb3B0aW9uczogWy4uLl0gLS13aXRob3V0LWxpYmJyb3RsaSwgLS13
aXRob3V0LWxpYnpzdGQKPj4+Cj4+PiBbMV06IGh0dHBzOi8vZ2l0bGFiLmNvbS9nbnV0bHMvZ251
dGxzLy0vY29tbWl0LzZiNzk0ZTQ5ZDFhMTRlNDNmOWUwODAyM2Y5NTgzNjQ3MTJjM2M4OWEKPj4+
Cj4+PiBTaWduZWQtb2ZmLWJ5OiBUSUFOIFl1YW5oYW8gPHRpYW55dWFuaGFvM0AxNjMuY29tPgo+
Pj4gQ2M6IEFybm91dCBWYW5kZWNhcHBlbGxlIChFc3NlbnNpdW0vTWluZCkgPGFybm91dEBtaW5k
LmJlPgo+PiAgIFNpbmNlIHRoaXMgaXMgYSBmaXgsIEkgYXBwbGllZCB0byBtYXN0ZXIsIHRoYW5r
cy4KPj4KPj4gICBQYXRjaCAxLzIgaXMgZm9yIG5leHQsIG5vdCBtYXN0ZXIuIEkgZGlkbid0IGFw
cGx5IHRoYXQgb25lIHlldC4KPiBUaGlzIHBhdGNoIG11c3QgYmUgYXBwbGllZCBhZnRlciBnbnV0
bHMgMy44LjgsIG90aGVyd2lzZSBhbm90aGVyIHBhdGNoIGlzIHJlcXVpcmVkLAo+IHNlZSBodHRw
Oi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyNDEwMDkx
MTM0MTAuNTA3Ny0xLXRpYW55dWFuaGFvM0AxNjMuY29tLwo+Cj4gU28gSSBzdWdnZXN0IGFwcGx5
aW5nIGl0IGluIHRoZSBuZXh0IGJyYW5jaC4KPgo+IFJlZ2FyZHMsCj4gWXVhbmhhbwo+Cj4+ICAg
UmVnYXJkcywKPj4gICBBcm5vdXQKPj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
