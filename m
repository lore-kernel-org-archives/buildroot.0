Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A3FC54F54
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 12:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EFD5812D8;
	Fri, 31 Jul 2026 12:05:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FjquJKBpPwWC; Fri, 31 Jul 2026 12:05:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30BDD812F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785499531;
	bh=imcFvbY/XwdLUkmVd15lPR3UTX5y9zTBK0J1hkv+Df4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YWjckKGVvtUtQ1bCB1LsIYaViuhcr7LknCw4oi1qa7f4bfCYr0WRo3KzEEr5NSWr6
	 4D56CgFAWHgZp1T5RN2kekzD6LVURRAj6NCUuX3Byvghbgfo2Yzm7gdoGXf5UjY9Aq
	 CLGiQwuc2gdPyzX4JGNFmV27feqX5l49su7SoWXMuz6VS9zgNMLrpRS734s1ZK3WOY
	 oeLxFrOMLMQu7uv0KNu8FRe3htPE5Nvd28bmm7P/kjStr2lc3uYRDdf5tF9D7F0jf7
	 UTGOHesKLSjW4BvK+WL6t82sW878l/XQhCfMBvPKMApW2Ln7JGWt+VbOPdMNCRoaZi
	 Kho9ICC4q2Yew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30BDD812F4;
	Fri, 31 Jul 2026 12:05:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9852A27B
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7EDC240463
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rb2HtLHBsp3s for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 12:05:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 47298400DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47298400DA
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 47298400DA
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:29 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-47f92e3c14bso203783f8f.0
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 05:05:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785499527; x=1786104327;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=4NdrOSOLqjE9qrCkOEN3qNkpafkr6iL/yQXtiG8Kjn4=;
 b=qIH2wAIChpNin9/WCEJQzClW38P2Dmko3HNKT3Jq7CJJX4VnZ4ZESD3FCQt3vTFFeR
 8I8QMuljx41p6leRa1pOgdK/r56VlxwjxqsJ9dI0x0+q1NXLx0jRXPbkpzGeZnDb1sWF
 p1FmyGe+aGuujdbMHWr0Jt5rRdK9CcV3hO16BwDaKcxy55Pu8je9q49ZdsHfu+zrbxCV
 PYPLmwooQzKqFXJFT/mLp45IRRoNVPUNrJ0KgmIlrzWbeUQgl7zqTKistRrUy8pIEWtK
 uxWUVVDzEDZY/zennqHnXxbY/yWi7OqEX056OUBdkg+becP35FbBIId0gAdCVmFwjbEo
 fQ/A==
X-Forwarded-Encrypted: i=1;
 AHgh+RrrWNM+DUEcxv2vwvv8Fqhmgxl1AUqnqvPkj5c/ui0swulzYrnr4/2bWehlkFr82Uj+pWjTHrRwwYE=@buildroot.org
X-Gm-Message-State: AOJu0Yw9JjC7gSXqW+IxmVE5Gi/CfG90cPSAl1IgFt0hPQyRTRCcIUWY
 uF5Fl+GAFEOFjjvtaTpr+4w6HQW8jUJDb2HLxAYeXEpgFCP2PuY8+n+r++aoY84SUt0=
X-Gm-Gg: AR+sD10ZsKU9I2CaEdNc+D4y9cbqUsp6J6JNN+mtUFCcbthpY0zFseM/w9JFYgvEthB
 KpW4srypXiENdVN/iTsk6t1a7XL40ysz6v1lkVRwIqCzdhx5v7Z8UGx/HRY7N5qd2Ey84u3HbZf
 cCdOCOm6IecJRPyoSoRwpLTSSzyC5qcn4VYk3adOjwG096+Ohnu8xGOvclfSbQ09e2mTOpu8l6p
 uJHziRa1zPKtIV9fx9k1wZlbXH2q7uPEfBay0N7ftG3Tw4hMEo62ke5rPse2hOerMo4PdzYmxn7
 GJ6arUpH0OFuzlNfRY3rEmYuB68sdrjrXKed01sG5z8+6mbaQVXuZm5IKIIzjkMOhtaCfexX017
 kD61ypdtIxGN6bDt3ZartKVHre6++0nfzlnncxj6psc+hJQ3JUhVJtjIrAdyhCxGpwY/9XZkPq9
 V1MNCaWsBbjTpnqbIxhyLSlhqdJYIJ3mcGN1NU9Oh+ZKqoWvbuvHCSTwFZPnYDI2X6kBUbbNEdq
 B1Fl0SfF5e3JxrihhiuwN4yJA==
X-Received: by 2002:a5d:5e8b:0:b0:47f:8c73:aa7c with SMTP id
 ffacd0b85a97d-47fd2b70c95mr3953748f8f.52.1785499527263; 
 Fri, 31 Jul 2026 05:05:27 -0700 (PDT)
Received: from mindpad (213.219.161.200.adsl.dyn.edpnet.net. [213.219.161.200])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd45a0d7csm3876277f8f.35.2026.07.31.05.05.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2026 05:05:27 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 31 Jul 2026 14:05:19 +0200
Message-ID: <20260731120525.3593-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260721175941.76461-1-bernd@kuhls.net>
References: <20260721175941.76461-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1785499527; x=1786104327; darn=buildroot.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=4NdrOSOLqjE9qrCkOEN3qNkpafkr6iL/yQXtiG8Kjn4=;
 b=D/V6zkvhqDWVzE7icFnVbygVyDI5q8bzSou2GnQsFjb8qjCJTW6UyJ/lmEQ8GGJJER
 YVgzie+/JHiNzgemPyL/p5EuQo9kZ8GaiDp9HhZgxsS767krvVQQD6EDR6rJbiNwnKRM
 hMNZlzjA/Hz7y9iURApU9wbNEj6x/oyWFIrLOOf5eGCzRC/mC7lq0vJ3w5pa/mgcSKDp
 uE8gXCi2T35V3iv3yLIcLBONE2+wY2QiQ9Mt11t8jbSwnVXIMod4bKuMU/QqZa/i52Eg
 Xc6h70ez0oAB6kKwMBo5lMrJc+rH8p5376Hc9KsUbxBiVNiWUNiSFxOBRSUYGQisfhHY
 M6Mg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=D/V6zkvh
Subject: Re: [Buildroot] [PATCH 1/1] package/dropbear: security bump version
 to 2026.93
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

SW4gcmVwbHkgb2Y6Cj4gaHR0cHM6Ly9tYXR0LnVjYy5hc24uYXUvZHJvcGJlYXIvQ0hBTkdFUwo+
IAo+IC0gU2VjdXJpdHk6IEZpeCBhIHVzZS1hZnRlci1mcmVlIGluIFgxMSBmb3J3YXJkaW5nIHRo
YXQgY291bGQgcG9zc2libHkgbGVhZAo+ICAgdG8gbWVtb3J5IGNvcnJ1cHRpb24uIFRoaXMgaXMg
dnVsbmVyYWJsZSB0byBhdXRoZW50aWNhdGVkIHVzZXJzIGlmIFgxMQo+ICAgZm9yd2FyZGluZyBp
cyBlbmFibGVkLiBCeSBkZWZhdWx0IFgxMSBmb3J3YXJkaW5nIGlzIG5vdCBidWlsdC4KPiAgIElu
IDIwMjYuODkgdGhlIHNlcnZlciBpcyBydW5uaW5nIGFzIHRoZSBhdXRoZW50aWNhdGVkIHVzZXIg
Zm9yIFgxMQo+ICAgZm9yd2FyZGluZywgaW4gZWFybGllciB2ZXJzaW9ucyBpdCBydW5zIGFzIHJv
b3QuCj4gICBUaGlzIHJlbW92ZXMgWDExICJzaW5nbGUgY29ubmVjdGlvbiIgd2hpY2ggaGFzIHBy
b2JhYmx5IG5ldmVyIGJlZW4gdXNlZC4KPiAgIFJlcG9ydGVkIGJ5IEBwZXRlci1wZQo+ICAgaHR0
cHM6Ly9naXRodWIuY29tL21rai9kcm9wYmVhci9jb21taXQvODgyZjgzODA2ZDVlMTMzMDM3Y2Qy
OGU5NTRhODc4OTg0ZWY3YjljNAo+IAo+IEFkZGVkIHBhdGNoIHRvIGZpeCBidWlsZCBlcnJvcnMg
d2hpY2ggd291bGQgYmUgaW50cm9kdWNlZCBieSB0aGlzIGJ1bXA6Cj4gaHR0cHM6Ly9naXRodWIu
Y29tL21rai9kcm9wYmVhci9jb21taXQvODZiYWE2NmZjOTM0YmI1NWE5MTFlYWNlYzI4ZDkzZDg2
ZmIwZTZmOAo+IAo+IFNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+
CgpBcHBsaWVkIHRvIDIwMjUuMDIueCAmIDIwMjYuMDUueC4gVGhhbmtzCgo+IC0tLQo+IEdpdGxh
YiBwaXBlbGluZXMgcGFzc2VkOgo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9ia3VobHMvYnVpbGRyb290
Ly0vY29tbWl0cy9kOGVkYTA4NWIyZTdjZjc2ZTU4OWYwNTIwMzRmY2FkOTBjN2U3ZDdmCj4gYWZ0
ZXIgaW5jbHVkaW5nCj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxk
cm9vdC9wYXRjaC8yMDI2MDYwNzEzMDIxOS4xMzUwMTI4LTgtamVhbm1pY2hlbC5oYXV0Ym9pc0B5
b3NlbGkub3JnLwo+IHRvIGZpeCBhbiBvbGQgbTY4ayBidWlsZCBlcnJvci4KPiAKPiAgLi4uLzAw
MDEtc2NwLWZpeC1idWlsZC13aXRoLWdjYy0xNC54LnBhdGNoICAgIHwgNDAgKysrKysrKysrKysr
KysrKysrKwo+ICBwYWNrYWdlL2Ryb3BiZWFyL2Ryb3BiZWFyLmhhc2ggICAgICAgICAgICAgICAg
fCAgMiArLQo+ICBwYWNrYWdlL2Ryb3BiZWFyL2Ryb3BiZWFyLm1rICAgICAgICAgICAgICAgICAg
fCAgMiArLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDQyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2Ryb3BiZWFyLzAwMDEtc2NwLWZpeC1i
dWlsZC13aXRoLWdjYy0xNC54LnBhdGNoCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZHJvcGJl
YXIvMDAwMS1zY3AtZml4LWJ1aWxkLXdpdGgtZ2NjLTE0LngucGF0Y2ggYi9wYWNrYWdlL2Ryb3Bi
ZWFyLzAwMDEtc2NwLWZpeC1idWlsZC13aXRoLWdjYy0xNC54LnBhdGNoCj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi4wYzJiNWNiZGI1Cj4gLS0tIC9kZXYvbnVsbAo+
ICsrKyBiL3BhY2thZ2UvZHJvcGJlYXIvMDAwMS1zY3AtZml4LWJ1aWxkLXdpdGgtZ2NjLTE0Lngu
cGF0Y2gKPiBAQCAtMCwwICsxLDQwIEBACj4gK0Zyb20gMGM2NzM3MjI1NzU3NWY2ZWM1OTM2NGFi
YTVjYTU3OWMxMjZiNzY3OCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiArRnJvbTogVm94ZWwg
PHZveGVsQGFuZHJlZXYubXNrLnJ1Pgo+ICtEYXRlOiBUdWUsIDIxIEp1bCAyMDI2IDE5OjI4OjAw
ICswMjAwCj4gK1N1YmplY3Q6IFtQQVRDSF0gc2NwOiBmaXggYnVpbGQgd2l0aCBnY2MgPj0gMTQu
eAo+ICtNSU1FLVZlcnNpb246IDEuMAo+ICtDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJz
ZXQ9VVRGLTgKPiArQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAo+ICsKPiArRml4ZXMg
YnVpbGQgZXJyb3JzIHNlZW4gd2l0aCBnY2MgMTQueDoKPiArCj4gK3NyYy9zY3AuYzogSW4gZnVu
Y3Rpb24g4oCYc2lua+KAmToKPiArc3JjL3NjcC5jOjEyMTQ6MzI6IGVycm9yOiBpbXBsaWNpdCBk
ZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJhhc2NpaV9pc2RpZ2l04oCZCj4gKyBbLVdpbXBsaWNp
dC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KPiArCj4gK3NyYy9zY3AuYzogSW4gZnVuY3Rpb24g4oCY
b2tuYW1l4oCZOgo+ICtzcmMvc2NwLmM6MTUwMToyMjogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0
aW9uIG9mIGZ1bmN0aW9uIOKAmGFzY2lpX2lzYWxwaGHigJkKPiArIFstV2ltcGxpY2l0LWZ1bmN0
aW9uLWRlY2xhcmF0aW9uXQo+ICsKPiArVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHViLmNvbS9ta2ov
ZHJvcGJlYXIvcHVsbC80NzQKPiArCj4gK1NpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJu
ZEBrdWhscy5uZXQ+Cj4gKy0tLQo+ICsgc3JjL3NjcC5jIHwgMSArCj4gKyAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKykKPiArCj4gK2RpZmYgLS1naXQgYS9zcmMvc2NwLmMgYi9zcmMvc2Nw
LmMKPiAraW5kZXggZDcyNjZmZGQuLjYzM2I0ZGJhIDEwMDY0NAo+ICstLS0gYS9zcmMvc2NwLmMK
PiArKysrIGIvc3JjL3NjcC5jCj4gK0BAIC04MSw2ICs4MSw3IEBACj4gKyAjaW5jbHVkZSAiY29t
cGF0LmgiCj4gKyAjaW5jbHVkZSAic2NwbWlzYy5oIgo+ICsgI2luY2x1ZGUgInByb2dyZXNzbWV0
ZXIuaCIKPiArKyNpbmNsdWRlICJkYnV0aWwuaCIKPiArIAo+ICsgdm9pZCBid2xpbWl0KGludCk7
Cj4gKyAKPiArLS0gCj4gKzIuNDcuMwo+ICsKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9kcm9wYmVh
ci9kcm9wYmVhci5oYXNoIGIvcGFja2FnZS9kcm9wYmVhci9kcm9wYmVhci5oYXNoCj4gaW5kZXgg
OWRmODFlYTRiNS4uMjUzODEzMjQ2MyAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2Ryb3BiZWFyL2Ry
b3BiZWFyLmhhc2gKPiArKysgYi9wYWNrYWdlL2Ryb3BiZWFyL2Ryb3BiZWFyLmhhc2gKPiBAQCAt
MSw1ICsxLDUgQEAKPiAgIyBGcm9tIGh0dHBzOi8vbWF0dC51Y2MuYXNuLmF1L2Ryb3BiZWFyL3Jl
bGVhc2VzL1NIQTI1NlNVTS5hc2MKPiAtc2hhMjU2ICA5MWRjYjUyMzRkZThkZWE2OGRkODJjNTU0
MTFjOWZjOTg2YjQ1N2FiNTgzNzJhNzgwZWU4YTg3MDQxOWMyZjdlICBkcm9wYmVhci0yMDI2Ljky
LnRhci5iejIKPiArc2hhMjU2ICAzMTBhNjA4Nzk1Mjg5N2MxODJlZmJlMTYwODhmYTBjNGQwN2M0
NjdlODUwYTIyNjk5NDcyMTM3Mjc4ZmFiZjA5ICBkcm9wYmVhci0yMDI2LjkzLnRhci5iejIKPiAg
Cj4gICMgTGljZW5zZSBmaWxlLCBsb2NhbGx5IGNvbXB1dGVkCj4gIHNoYTI1NiAgYTk5Y2U2NTdk
NzkwYjc2MWMxMzJlZTdlMGRlMThlZGI0MzdhZTYzNjFlNTM2ZDk5MWM2YTEyZjM2ZTc3MDQ0NSAg
TElDRU5TRQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2Ryb3BiZWFyL2Ryb3BiZWFyLm1rIGIvcGFj
a2FnZS9kcm9wYmVhci9kcm9wYmVhci5tawo+IGluZGV4IDkwNDExN2I5MDYuLmU4OGQxZGJkZjEg
MTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9kcm9wYmVhci9kcm9wYmVhci5tawo+ICsrKyBiL3BhY2th
Z2UvZHJvcGJlYXIvZHJvcGJlYXIubWsKPiBAQCAtNCw3ICs0LDcgQEAKPiAgIwo+ICAjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIwo+ICAKPiAtRFJPUEJFQVJfVkVSU0lPTiA9IDIwMjYuOTIKPiArRFJP
UEJFQVJfVkVSU0lPTiA9IDIwMjYuOTMKPiAgRFJPUEJFQVJfU0lURSA9IGh0dHBzOi8vbWF0dC51
Y2MuYXNuLmF1L2Ryb3BiZWFyL3JlbGVhc2VzCj4gIERST1BCRUFSX1NPVVJDRSA9IGRyb3BiZWFy
LSQoRFJPUEJFQVJfVkVSU0lPTikudGFyLmJ6Mgo+ICBEUk9QQkVBUl9MSUNFTlNFID0gTUlULCBC
U0QtMi1DbGF1c2UsIFB1YmxpYyBkb21haW4KPiAtLSAKPiAyLjQ3LjMKPiAKPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
