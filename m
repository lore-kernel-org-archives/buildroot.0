Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E66CAC5A0
	for <buildroot@archiver.kernel.org>; Sat, 20 Sep 2025 12:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7D2640C5D;
	Sat, 20 Sep 2025 12:01:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sP90YmaHbEdS; Sat, 20 Sep 2025 12:01:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19C0640B60
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19C0640B60;
	Sat, 20 Sep 2025 12:01:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 967A8E7
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 12:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CC8940B57
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 12:01:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YQuNumtYIFul for <buildroot@buildroot.org>;
 Sat, 20 Sep 2025 12:01:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2FAFC40B3C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FAFC40B3C
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2FAFC40B3C
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 12:01:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id C5CB219F57B;
 Sat, 20 Sep 2025 14:01:18 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 20 Sep 2025 14:01:18 +0200
MIME-Version: 1.0
Date: Sat, 20 Sep 2025 14:01:18 +0200
To: Scott Fan <fancp2007@gmail.com>
Cc: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org, Romain
 Naour <romain.naour@gmail.com>
In-Reply-To: <CAFkzVZYb2T-mJzzh3RRjGydnQx6UGVLNh8MXJOxOVX330nskuw@mail.gmail.com>
References: <20250919081032.1132163-1-fancp2007@gmail.com>
 <ab3a31ee-f76c-4e94-8a66-3cf00805f3a8@smile.fr>
 <CAFkzVZYb2T-mJzzh3RRjGydnQx6UGVLNh8MXJOxOVX330nskuw@mail.gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <f4a77b72db8e765ebd404830ac3ab4c2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758369682;
 bh=nduc6IHlqxIVnEd2nKLb+vpMFiaayUJuCWAj4JvEPFg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RWx8vWn/AS/PsfDpEXc9Rk7bTj8TKKVVTfErQ/7wS08SQI9TTwERqBdSi0v8wnyFQ
 NpKylKvHhSuYEBhUAnP0Nc31DBFEkubprMfhiFLJCzDox886T+cFmTnwvxOkBYcEax
 j8OJERj3DefuIvljypPgjMzf5Xw4qZQwNzEWQ319bNwLuib9i8ZwZa7NHOKN7fQiuo
 eaixZ+Z2e80gFvijhwTvvD9F6rj23E4Bbz/kE2+Bp0/mR1IxFjTt0hgwn1HVOUn5zW
 x3hMnFwuozttSAcXd4bbYqzAxp3uSaj3xqQ7K4eGNSCAhjPWibcfOcewQ9Bh2M5fL9
 uZfNhnDbKNv2Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=RWx8vWn/
Subject: Re: [Buildroot] [PATCH] package/qemu: bump to version 10.1.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgU2NvdHQsIFJvbWFpbiwKCk9uIDE5LzA5LzIwMjUgMTc6MzAsIFNjb3R0IEZhbiB3cm90ZToK
PiBIZWxsbyBSb21haW4sCj4gCj4gT25seSBxZW11X2xvb25nYXJjaDY0X3ZpcnRfZWZpX2RlZmNv
bmZpZyBhbmQKPiBxZW11X3Jpc2N2NjRfdmlydF9lZmlfZGVmY29uZmlnIHdlcmUgdGVzdGVkIG9u
IG15IGxhcHRvcC4KPiAKPiBIb3dldmVyLCBJIGZvcmdvdCB0byBjaGVjayB0aGUgaGFzaGVzIG9m
IHRoZSBDT1BZSU5HIGFuZCBDT1BZSU5HLkxJQiAKPiBmaWxlcy4KCkFmdGVyIGZpeGluZyB0aG9z
ZSBsaWNlbnNlIGhhc2hlcy4uLgoKPiBTY290dCBGYW4KPiAKPiBPbiBGcmksIFNlcCAxOSwgMjAy
NSBhdCA2OjM34oCvUE0gUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+IAo+IHdy
b3RlOgo+PiAKPj4gSGVsbG8gU2NvdHQsIEFsbCwKPj4gCj4+IExlIDE5LzA5LzIwMjUgw6AgMTA6
MTAsIFNjb3R0IEZhbiBhIMOpY3JpdCA6Cj4+ID4gQ2hhbmdlcyBsb2c6Cj4+ID4gaHR0cHM6Ly93
aWtpLnFlbXUub3JnL0NoYW5nZUxvZy8xMC4xCj4+IAo+PiBUaGFua3MgZm9yIHRoaXMgcGF0Y2gh
Cj4+IAo+PiBIb3cgZGlkIHlvdSB0ZXN0IGl0Pwo+PiAKPj4gUWVtdSBpcyB1c2VkIGJ5IG91ciBH
aXRsYWItQ0kgdGVzdGluZyBmb3IgYWxtb3N0IGFsbCBhcmNoaXRlY3R1cmVzIAo+PiBzdXBwb3J0
ZWQgYnkKPj4gQnVpbGRyb290LiBTbyBhbnkgdmVyc2lvbiBidW1wIGNhbiBjYXVzZSBzb21lIGlz
c3VlLgo+PiAKPj4gSWYgcG9zc2libGUgY2FuIHlvdSB0ZXN0cyBhdCBsZWFzdCBlYWNoIHFlbXUg
ZGVmY29uZmlncyAoc2VlIHByZXZpb3VzIAo+PiB2ZXJzaW9uIGJ1bXApOgo+PiAKPj4gICAgIFFl
bXUgZGVmY29uZmlncyB3ZXJlIHJ1bnRpbWUgdGVzdGVkIG9uIEdpdGxhYi1DSToKPj4gICAgIGh0
dHBzOi8vZ2l0bGFiLmNvbS9rdWJ1OTMvYnVpbGRyb290Ly0vcGlwZWxpbmVzLzE4MDU2NzI2ODUK
Pj4gCj4+ICAgICBxZW11X3MzOTB4X2RlZmNvbmZpZywgcWVtdV9hcm1fdmV4cHJlc3NfdHpfZGVm
Y29uZmlnLAo+PiAgICAgcWVtdV9hYXJjaDY0X2ViYnJfZGVmY29uZmlnIHdlcmUgdGVzdGVkIGxv
Y2FsbHkuCj4+IAo+PiAgICAgUnVudGltZSB0ZXN0cyB1c2luZyBob3N0LXFlbXUgd2VyZSBsb2Nh
bGx5IHRlc3RlZDoKPj4gICAgIFRlc3RYdmlzb3IsIFRlc3RGd3RzLCBUZXN0RWRrMiwgVGVzdEdy
dWJBQXJjaDY0RUZJLgoKLi4uYW5kIGNoZWNraW5nIHRoYXQgYWxsIHRob3NlIHRlc3RzIGFyZSBw
YXNzaW5nLCBJIGFwcGxpZWQgdGhpcwpwYXRjaCB0byBtYXN0ZXIuIFNlZToKaHR0cHM6Ly9naXRs
YWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0LzM1ZjcyNzlhZDM1NWFiMDc2
MDU4OGYzYmM4NTA4OTVkYjJhMjA1MjEKCj4+IAo+PiBJJ20gZmluZSBpZiB5b3UgdGVzdGVkIGlm
IG9ubHkgb24gb25lIHRlc3QgY2FzZS4KPj4gSW4gdGhpcyBjYXNlLCB3ZSB3aWxsIG5lZWQgdG8g
cGVyZm9ybSBhZGRpdGlvbmFsIHRlc3RpbmcgYmVmb3JlIAo+PiBtZXJnaW5nIHRoZQo+PiB2ZXJz
aW9uIGJ1bXAuCj4+IAo+PiBCZXN0IHJlZ2FyZHMsCj4+IFJvbWFpbgo+PiAKPj4gCj4+ID4KPj4g
PiBTaWduZWQtb2ZmLWJ5OiBTY290dCBGYW4gPGZhbmNwMjAwN0BnbWFpbC5jb20+CgpCZXN0IHJl
Z2FyZHMsCgpKdWxpZW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
