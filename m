Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F2DCAC598
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 13:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E845281D70;
	Tue, 16 Sep 2025 13:51:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KHR59GXocJbq; Tue, 16 Sep 2025 13:51:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD6F281854
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD6F281854;
	Tue, 16 Sep 2025 13:51:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C35622F
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 13:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E38CF400E0
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 13:51:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YO-XCobqAQPT for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 13:51:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 28A7B401EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28A7B401EC
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 28A7B401EC
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 13:51:46 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-45cb5e5e71eso34373745e9.2
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 06:51:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758030704; x=1758635504;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QH0VBiLTOnb0/cno/wcp7WEVziPR1CRZhupCeZ+QWUM=;
 b=hvzM/1tXITvEkQNqdnH9pMxbYI+5Syyd2mEbn0TxrMSuOpl9y0vuLmFZm/x/Qw/3+N
 Ts+peXNh1ByQ9epZxFm5sa/XTpDxwJ3N9EjmZ5vuN4CcCZGtBy1NLib+QN3ewtloLl01
 uQe9kuQJlJRAgT5/u0XyrwpM7L8O7TqikFGHYpxAY2xCSWQVfRBzxlpxsGA0cVVFaCjj
 gu2O8wkd8Xv9pSajQZlMVbI8LI8wxwUAdGfY+EAqaa5zP7MkY/8JeaQETv3fL2LnCnlY
 5vNidsqFSrVCCI7HlX8u0eKHMx4PkKu6uSbKszDjzIf0inWW/AGPtkNhXjGQV3eeNxbt
 bXhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbOIZiDgsS2gIaLoryxggYGDYac3BCwPQqQKyBWIFQFCYkZvwUkf+B/FAprOi22ulfgKs2PsloUgo=@buildroot.org
X-Gm-Message-State: AOJu0Yz5sXzuAOYqTwcrMwQlRzt3GBNv93kdCgZlffkJ0X8IAz2Aj7kD
 s3yAJ3dn1eFVpF+irS5rJLUyKiYOX7IbFQvIOQKZuIl2wpTesXJaiSYt19axspUEBo4Vs7SUr4K
 wo+E6NSM=
X-Gm-Gg: ASbGncuEFfdKIMBH3F7rw97QFE7YocUjn3yhvBz/OVo8bPIuJhoDmO7uv4ylHCikM0l
 nDxOuc5nW3riCXzNL+/4GhiZo5GS+EMBvt+tIj5C/dTRBbNZAqwFioqEb/uh+Rmeu6k0NQBkFCX
 zcg8CIA2mfwSa2phFB5EY9JL+fIys2cCpEvBsfENnBzk6N030/5J4rU/TtDTkno3MQF9xkux8PR
 vBhiNRwYnq3Rm90JHzx9qy38ikN0hBtN6HPpsei4msehVJHALYEJXV4nN4C/caKRSzIrJIS++d9
 YfyuA0aMd9+KSxACMZ0NvJUDRCpPr5TaQk7XqkhRPoT7XW+nKIpCI1b1V/KZI76uOYe/++XZB8G
 H5FHS4NDOyrZRgSk=
X-Google-Smtp-Source: AGHT+IHcIX42jTGvep/N3RvUumiPyE2ppbuzbn88FsGXmVqx/Psigpj7s7N+IIjmh2ov2JWZd85BVw==
X-Received: by 2002:a05:600c:630e:b0:45d:da25:595d with SMTP id
 5b1f17b1804b1-45f211f8835mr143631925e9.22.1758030704083; 
 Tue, 16 Sep 2025 06:51:44 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e032a0522sm222006125e9.0.2025.09.16.06.51.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 06:51:43 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Tue, 16 Sep 2025 15:51:41 +0200
Message-ID: <20250916135142.978443-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250916093105.525147-1-peter@korsgaard.com>
References: <20250916093105.525147-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758030704; x=1758635504; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QH0VBiLTOnb0/cno/wcp7WEVziPR1CRZhupCeZ+QWUM=;
 b=Md1+mf/52kNEKzutUBUx32nERys9NC5ket7OcP1ewpsnEW4O6UL8xdLF0w5RlcXHGa
 f0xCzoAboAZpsoEhSps1kWcbi4Od44KrJUsggYOY1mMxaeDx8cS79wGEXt8whsdVE90W
 rM1wWKpGLjeqp/LlaOL+6Et/49tXpCiAwIdVf2UBrOuygj2HKcnzrqBLdo19b95fb9gx
 gIV4BRnzZxTI9SGBZOTfJzift+UQXE6zmcHL/dPnnpiqYvvyUo3F7A30FhbnJUtPumle
 gxO+wK0XBIGmJ/N/nQXPtZTdRwWzApmJ7+3qQBG8GfS/hL6/1NGB2j0qa3bf8TFGru42
 0oYA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Md1+mf/5
Subject: Re: [Buildroot] [PATCH] package/cjson: security bump to version
 1.7.19
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

SGkgUGV0ZXIsCgpJbiByZXBseSBvZjoKPiBGaXhlcyB0aGUgZm9sbG93aW5nIHNlY3VyaXR5IGlz
c3VlOgo+IAo+IENWRS0yMDI1LTU3MDUyOiBjSlNPTiAxLjUuMCB0aHJvdWdoIDEuNy4xOCBhbGxv
d3Mgb3V0LW9mLWJvdW5kcyBhY2Nlc3MgdmlhCj4gdGhlIGRlY29kZV9hcnJheV9pbmRleF9mcm9t
X3BvaW50ZXIgZnVuY3Rpb24gaW4gY0pTT05fVXRpbHMuYywgYWxsb3dpbmcKPiByZW1vdGUgYXR0
YWNrZXJzIHRvIGJ5cGFzcyBhcnJheSBib3VuZHMgY2hlY2tpbmcgYW5kIGFjY2VzcyByZXN0cmlj
dGVkIGRhdGEKPiB2aWEgbWFsZm9ybWVkIEpTT04gcG9pbnRlciBzdHJpbmdzIGNvbnRhaW5pbmcg
YWxwaGFudW1lcmljIGNoYXJhY3RlcnMKPiAKPiBodHRwczovL252ZC5uaXN0Lmdvdi92dWxuL2Rl
dGFpbC9DVkUtMjAyNS01NzA1Mgo+IGh0dHBzOi8veC0wci5jb20vcG9zdHMvY0pTT04tQXJyYXkt
SW5kZXgtUGFyc2luZy1WdWxuZXJhYmlsaXR5Cj4gaHR0cHM6Ly9naXRodWIuY29tL0RhdmVHYW1i
bGUvY0pTT04vY29tbWl0Lzc0ZTFmZjQ5OTRhYTQxMzkxMjY5NjdmNmQyODliNjc1YjRiMzZmZWYK
PiBodHRwczovL2dpdGh1Yi5jb20vRGF2ZUdhbWJsZS9jSlNPTi9yZWxlYXNlcy90YWcvdjEuNy4x
OQo+IAo+IFNpZ25lZC1vZmYtYnk6IFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNv
bT4KCkkgc2VlIHRoZSBDUEUgcmVwb3J0ZWQgb24gTlZEIGZvciB0aGlzIENWRSBpcyB0aGUgZm9s
bG93aW5nCmNwZToyLjM6YTpkYXZlZ2FtYmxlOmNqc29uOjEuNy4xODoqOio6KjoqOio6KjoqIHdo
aWxlIHRoZSBvbmUgcHJlc2VudCBpbgpCdWlsZHJvb3QgaXMgY3BlOjIuMzphOmNqc29uX3Byb2pl
Y3Q6Y2pzb246MS43LjE4Oio6KjoqOio6KjoqOiouCgpJcyAnY2pzb25fcHJvamVjdDpjanNvbicg
c3RpbGwgaW4gdXNlID8KClJlZ2FyZHMsClBFUkFMRSBUaG9tYXMKCj4gLS0tCj4gIHBhY2thZ2Uv
Y2pzb24vMDAwMS1tYWtlX2NvbXBhdGlibGVfd2l0aF9jbWFrZV80LjAucGF0Y2ggfCA0ICsrKy0K
PiAgcGFja2FnZS9janNvbi9janNvbi5oYXNoICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8IDIgKy0KPiAgcGFja2FnZS9janNvbi9janNvbi5tayAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8IDIgKy0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvY2pzb24vMDAwMS1tYWtlX2Nv
bXBhdGlibGVfd2l0aF9jbWFrZV80LjAucGF0Y2ggYi9wYWNrYWdlL2Nqc29uLzAwMDEtbWFrZV9j
b21wYXRpYmxlX3dpdGhfY21ha2VfNC4wLnBhdGNoCj4gaW5kZXggMWZlNWNkNDNlZi4uNjg0Nzcz
ZTRkYSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2Nqc29uLzAwMDEtbWFrZV9jb21wYXRpYmxlX3dp
dGhfY21ha2VfNC4wLnBhdGNoCj4gKysrIGIvcGFja2FnZS9janNvbi8wMDAxLW1ha2VfY29tcGF0
aWJsZV93aXRoX2NtYWtlXzQuMC5wYXRjaAo+IEBAIC0xNiw2ICsxNiw4IEBAIENNYWtlIEVycm9y
IGF0IENNYWtlTGlzdHMudHh0OjIgKGNtYWtlX21pbmltdW1fcmVxdWlyZWQpOgo+ICBUaGlzIGNo
YW5nZSByYWlzZXMgdGhlIG1pbmltdW0gcmVxdWlyZWQgQ01ha2UgdmVyc2lvbiB0byAzLjUgYW5k
IHRodXMgbWFrZXMgdGhlIHByb2plY3QgY29tcGF0aWJsZSB3aXRoIENNYWtlIDQuMAo+ICAKPiAg
U2lnbmVkLW9mZi1ieTogQmVub8OudCBNb25pbiA8YmVub2l0Lm1vbmluQGJvb3RsaW4uY29tPgo+
ICtTaWduZWQtb2ZmLWJ5OiBQZXRlciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+Cj4g
K1BldGVyOiB1cGRhdGUgZm9yIDEuNy4xOQo+ICBVcHN0cmVhbTogaHR0cHM6Ly9naXRodWIuY29t
L0RhdmVHYW1ibGUvY0pTT04vcHVsbC85MzUKPiAgLS0tCj4gICBDTWFrZUxpc3RzLnR4dCB8IDIg
Ky0KPiBAQCAtMzEsNCArMzMsNCBAQCBpbmRleCAzNmE2Y2I1Ny4uOTQyOGRhNTggMTAwNjQ0Cj4g
ICtjbWFrZV9taW5pbXVtX3JlcXVpcmVkKFZFUlNJT04gMy41KQo+ICAgCj4gICBwcm9qZWN0KGNK
U09OCj4gLSAgICAgVkVSU0lPTiAxLjcuMTgKPiArICAgICBWRVJTSU9OIDEuNy4xOQo+IGRpZmYg
LS1naXQgYS9wYWNrYWdlL2Nqc29uL2Nqc29uLmhhc2ggYi9wYWNrYWdlL2Nqc29uL2Nqc29uLmhh
c2gKPiBpbmRleCBlMDdhZTBmN2JmLi5hODc2ZmZhZmU4IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uv
Y2pzb24vY2pzb24uaGFzaAo+ICsrKyBiL3BhY2thZ2UvY2pzb24vY2pzb24uaGFzaAo+IEBAIC0x
LDMgKzEsMyBAQAo+ICAjIExvY2FsbHkgY29tcHV0ZWQ6Cj4gLXNoYTI1NiAgM2FhODA2ODQ0YTAz
NDQyYzAwNzY5YjgzZTk5OTcwYmU3MGZiZWYwMzczNWZmODk4ZjQ4MTFkZDAzYjlmNWVlNSAgY2pz
b24tMS43LjE4LnRhci5nego+ICtzaGEyNTYgIDdmYTYxNmUzMDQ2ZWRmYTdhMjhhMzJkNWY5ZWFj
ZmQyM2Y5MjkwMGZlMWY4Y2NkOTg4YzE2NjJmMzA0NTQ1NjIgIGNqc29uLTEuNy4xOS50YXIuZ3oK
PiAgc2hhMjU2ICBhMzZkZGEyMDdjMzZkYjU4MTg3MjljNTRlN2FkNGU4YjBjNmZiYTg0NzQ5MWJh
NjRmMzcyYzFhMjAzN2I2ZDVjICBMSUNFTlNFCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvY2pzb24v
Y2pzb24ubWsgYi9wYWNrYWdlL2Nqc29uL2Nqc29uLm1rCj4gaW5kZXggMzUzMDRlYzYxOC4uZTAz
MjA3NzBjYiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2Nqc29uL2Nqc29uLm1rCj4gKysrIGIvcGFj
a2FnZS9janNvbi9janNvbi5tawo+IEBAIC00LDcgKzQsNyBAQAo+ICAjCj4gICMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjCj4gIAo+IC1DSlNPTl9WRVJTSU9OID0gMS43LjE4Cj4gK0NKU09OX1ZFUlNJ
T04gPSAxLjcuMTkKPiAgQ0pTT05fU0lURSA9ICQoY2FsbCBnaXRodWIsRGF2ZUdhbWJsZSxjanNv
bix2JChDSlNPTl9WRVJTSU9OKSkKPiAgQ0pTT05fSU5TVEFMTF9TVEFHSU5HID0gWUVTCj4gIENK
U09OX0xJQ0VOU0UgPSBNSVQKPiAtLSAKPiAyLjM5LjUKPiAKPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
