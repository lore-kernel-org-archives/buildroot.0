Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB60C87FDA
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 20:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7E006108E;
	Sun, 10 Aug 2025 20:48:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id asmWs3qbsjOh; Sun, 10 Aug 2025 20:48:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C00A6108C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C00A6108C;
	Sun, 10 Aug 2025 20:48:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 33CC6154
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 20:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A83F6107F
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 20:48:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8cwGl5VDkVHW for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 20:48:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 12C8061083
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12C8061083
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 12C8061083
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 20:48:03 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-459d4d7c745so34906375e9.1
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 13:48:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754858882; x=1755463682;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jw2vfwIyad1tmGYgEQ8gBHxs9rPHQJC0qyNVCsvNnUg=;
 b=JThjhavzt1LrQEFHPyTxDqFW54mjeRpJJ/vMBP9kzLjxJXWwgmxTkLRmKqEi5kSpV2
 Fduqt0OGaFBTwNZ3RFd0oU8kc3U0wh1w4lWyVRuQf8q0KI7MJolkXDX6GqVptf3eHKBM
 qNK62v3K+inble6dyIrVJPBbVZ2wSFm7EHGYe9ORJ05yHP4A6CUlcLuypI7JsiK5YbbA
 wgduMD+GLUvFoTs2JglEo2u/z1KvCplEevK7emgapgrO6h311icQZ5VAOLy8ytCNUurK
 Y4+59mYelHtDmQOFZPYk+sbmAJuemiM1iwhSr+EJkybeBU4AwGagOVPEgX2tv6VqfiAV
 wVPQ==
X-Gm-Message-State: AOJu0YwbrpH6MT19MjXXwqHWLNzDyiZT7Yl6Kdlkz0iUXHDBquLOwKPW
 nT3juoxbgRx2FPuugJwvepQf5XUzbnlhHHPTsXb+vD7azyEYj0Fk1TTb8ZHIt1WlVoc=
X-Gm-Gg: ASbGncs7MKUQrZfvKeHXGUFktLoSDAybjZ4T4TrSYwoBcGuE16tkiPgM6OSVCy0/65P
 vDFsrhjpsLZNWO/xsasjGiAEN7WI7fZGHxdeIwoO6UV+drwCdhBBzljGZAf7BbfM+fu4OFJhUnB
 qqPjqwnmKJhgvEmelR34o9/p7PTb+vWotcEMd+hs/LrZKSpkCuDhR/P67YqZWYUnN2kG0JfQvVs
 ENp2ZKtxt0oIcOQNF7BdNgLgSAgdz8e/2H9pNP1u4hgzqgxb5A/oCka2uWUy8CjeNadunlxi/g7
 tR15A44+HhLSat57qAJnDZ2avBgsNTo9QGr2SNXC3Ibj4IhqzlP7JdX1oEMetNJRKqJXd/h6ARY
 IYKKBN5W679Dp48vN9wpDmBjQMKoWSs2a3A23smt0bX/0lobq9w9k+FvOG8toQU1t3cK9g5MOX3
 OVPDI3vYeTuH+VyX6qRqETm0N2ZCefsAcCt11d1hcxZkfbu93CnmxXLdXO4pSZ
X-Google-Smtp-Source: AGHT+IGpi+vxwhq8m7wtE4Su1UTy4EQHPOBPMmF5UXyxafnbiylrAX2KJNNs54PK+cWOgep5R49AxA==
X-Received: by 2002:a05:600c:4f41:b0:458:a847:671e with SMTP id
 5b1f17b1804b1-459f4f141b2mr68537185e9.23.1754858882031; 
 Sun, 10 Aug 2025 13:48:02 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459db3048bdsm321359075e9.29.2025.08.10.13.48.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Aug 2025 13:48:01 -0700 (PDT)
Message-ID: <7b6da85a-a733-4731-8634-af94c9556d6d@smile.fr>
Date: Sun, 10 Aug 2025 22:48:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, Daniel Sangue <daniel.sangue@sangue.ch>
References: <20250602101435.764559-1-yegorslists@googlemail.com>
 <e7f0be5f-50d8-4c63-970a-a3211702a431@smile.fr>
 <CAGm1_kuHMGo-LF4PQbuvP+=vGvH+UdagGk_7g7Cszp2+9qqMHw@mail.gmail.com>
Content-Language: fr, en-US
In-Reply-To: <CAGm1_kuHMGo-LF4PQbuvP+=vGvH+UdagGk_7g7Cszp2+9qqMHw@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754858882; x=1755463682; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jw2vfwIyad1tmGYgEQ8gBHxs9rPHQJC0qyNVCsvNnUg=;
 b=u8Lv6gJfnzAMeiE2qEH3teqX16PDxLkgJiGzZN/i+mbAEGm2D/SGz2mlLCzAv9bLWY
 lujgrEG6cDo4SjowAZE55zUq5XXTjrdTngh7Qek6O670d/1oGWMr4plISAllPFMFZKMi
 Cfdc690ETNRy0u4Z7IY6++wxPu0acKTdzf+Yo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=u8Lv6gJf
Subject: Re: [Buildroot] [PATCH] package/libftdi1: fix static building
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

SGVsbG8gWWVnb3IsCgpMZSAxMC8wOC8yMDI1IMOgIDIyOjQyLCBZZWdvciBZZWZyZW1vdiBhIMOp
Y3JpdMKgOgo+IEhpIFJvbWFpbiwKPiAKPiBPbiBTdW4sIEF1ZyAxMCwgMjAyNSBhdCA4OjQy4oCv
UE0gUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+IHdyb3RlOgo+Pgo+PiBIZWxs
byBZZWdvciwgQWxsLAo+Pgo+PiBMZSAwMi8wNi8yMDI1IMOgIDEyOjE0LCB5ZWdvcnNsaXN0c0Bn
b29nbGVtYWlsLmNvbSBhIMOpY3JpdCA6Cj4+PiBGcm9tOiBZZWdvciBZZWZyZW1vdiA8eWVnb3Jz
bGlzdHNAZ29vZ2xlbWFpbC5jb20+Cj4+Pgo+Pj4gUmVzdG9yZSB0aGUgZm9sbG93aW5nIHBhdGNo
LCBhcyB0aGUgdXBzdHJlYW0gc3RpbGwgY2Fubm90IHByb2R1Y2Ugc3RhdGljCj4+PiBvbmx5IGxp
YnJhcmllczoKPj4+Cj4+PiAwMDAxLWNtYWtlLXVzZS10aGUtc3RhbmRhcmQtQ01ha2UtZmxhZy10
by1kcml2ZS10aGUtc2hhcmUucGF0Y2gKPj4+Cj4+PiBGaXhlczoKPj4+Cj4+PiBodHRwczovL2F1
dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvMDc3NDRiNjdiNTNkMmIyNWU3OGUwZjYxYjUx
MWEzNDI2NzdlMmFiYi8KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBZZWdvciBZZWZyZW1vdiA8eWVn
b3JzbGlzdHNAZ29vZ2xlbWFpbC5jb20+Cj4+PiAtLS0KPj4+ICAuLi5hbmRhcmQtQ01ha2UtZmxh
Zy10by1kcml2ZS10aGUtc2hhcmUucGF0Y2ggfCA5MyArKysrKysrKysrKysrKysrKysrCj4+PiAg
MSBmaWxlIGNoYW5nZWQsIDkzIGluc2VydGlvbnMoKykKPj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
cGFja2FnZS9saWJmdGRpMS8wMDAxLWNtYWtlLXVzZS10aGUtc3RhbmRhcmQtQ01ha2UtZmxhZy10
by1kcml2ZS10aGUtc2hhcmUucGF0Y2gKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJm
dGRpMS8wMDAxLWNtYWtlLXVzZS10aGUtc3RhbmRhcmQtQ01ha2UtZmxhZy10by1kcml2ZS10aGUt
c2hhcmUucGF0Y2ggYi9wYWNrYWdlL2xpYmZ0ZGkxLzAwMDEtY21ha2UtdXNlLXRoZS1zdGFuZGFy
ZC1DTWFrZS1mbGFnLXRvLWRyaXZlLXRoZS1zaGFyZS5wYXRjaAo+Pj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQKPj4+IGluZGV4IDAwMDAwMDAwMDAuLjg1NjU4N2I3YTYKPj4+IC0tLSAvZGV2L251bGwK
Pj4+ICsrKyBiL3BhY2thZ2UvbGliZnRkaTEvMDAwMS1jbWFrZS11c2UtdGhlLXN0YW5kYXJkLUNN
YWtlLWZsYWctdG8tZHJpdmUtdGhlLXNoYXJlLnBhdGNoCj4+PiBAQCAtMCwwICsxLDkzIEBACj4+
PiArRnJvbSBiMGVhNTc3M2M5MGUzNjY1NGRhMzc1NjJhMDNlNjJkOWE2NjU3NWJmIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQo+Pj4gK0Zyb206IFNhbXVlbCBNYXJ0aW4gPHMubWFydGluNDlAZ21h
aWwuY29tPgo+Pj4gK0RhdGU6IFN1biwgMjUgSmFuIDIwMTUgMDk6NDU6MDQgKzAxMDAKPj4+ICtT
dWJqZWN0OiBbUEFUQ0hdIGNtYWtlOiB1c2UgdGhlIHN0YW5kYXJkIENNYWtlIGZsYWcgdG8gZHJp
dmUgdGhlIHNoYXJlZCBvYmplY3QKPj4+ICsgYnVpbGQKPj4+ICsKPj4+ICtSZW1vdmUgdGhlIFNU
QVRJQ0xJQlMgQ01ha2Ugb3B0aW9uIChhbmQgdGhlIGNvZGUgaGFuZGxpbmcgaXQpIGFuZCBsZXQK
Pj4+ICt0aGUgc3RhbmRhcmQgQ01ha2UgZmxhZ3MgZHJpdmUgdGhlIHNoYXJlZCBvYmplY3QgYnVp
bGQuCj4+PiArCj4+PiArU2lnbmVkLW9mZi1ieTogU2FtdWVsIE1hcnRpbiA8cy5tYXJ0aW40OUBn
bWFpbC5jb20+Cj4+PiArW0ZhYnJpY2U6IHVwZGF0ZSBmb3IgMS41XQo+Pj4gK1NpZ25lZC1vZmYt
Ynk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+Pgo+PiBj
aGVjay1wYWNrYWdlIHdhcm4gZHVlIHRvIG1pc3NpbmcgVXBzdHJlYW06IHRhZy4KPj4KPj4gV0FS
TklORzoKPj4gcGFja2FnZS9saWJmdGRpMS8wMDAxLWNtYWtlLXVzZS10aGUtc3RhbmRhcmQtQ01h
a2UtZmxhZy10by1kcml2ZS10aGUtc2hhcmUucGF0Y2g6MDoKPj4gbWlzc2luZyBVcHN0cmVhbSBp
biB0aGUgaGVhZGVyCj4+Cj4+IFdoYXQncyB0aGUgdXBzdHJlYW0gc3RhdHVzIG9mIHRoaXMgcGF0
Y2g/IG5vdCBhcHBsaWNhYmxlPwo+IAo+IFVwc3RyZWFtIGhhcyBub3cgYSBwcm9wZXIgc29sdXRp
b24gWzFdIGFuZCBJIGFtIHdhaXRpbmcgZm9yIGEgcmVsZWFzZS4KPiBTbywgd2UgY2FuIGRyb3Ag
dGhlIHBhdGNoIGZvciBub3cuCgpOaWNlLCB0aGFua3MgZm9yIHRoZSBmZWVkLWJhY2shCgpJJ2xs
IG1hcmsgdGhpcyBwYXRjaCBhcyAic3VwZXJzZWRlZCIgc2luY2Ugd2UgYXJlIGV4cGVjdGluZyBh
biB1cGNvbWluZyByZWxlYXNlLgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IFsxXSBodHRw
Oi8vZGV2ZWxvcGVyLmludHJhMm5ldC5jb20vZ2l0Lz9wPWxpYmZ0ZGk7YT1jb21taXQ7aD0yYTk5
MjMwNmMwYWNmOTM4YjI5ZmEwY2Q1ZmJjMTYwZTI0NDI0MjA5Cj4gCj4gWWVnb3IKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
