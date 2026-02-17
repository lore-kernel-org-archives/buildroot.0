Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EFC4E9A031
	for <buildroot@archiver.kernel.org>; Tue, 17 Feb 2026 19:46:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45CDC40091;
	Tue, 17 Feb 2026 19:46:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bs8V0Z8RFQsq; Tue, 17 Feb 2026 19:46:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16F3C4263A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771357564;
	bh=/4sJL2Jv+HNQVW8+vCsJFvzkeYy1X1FnZVEjN3KVDig=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=CqHNZrGraNGjxgw03+271Y9lTLO5RdqcujyGsf1s3Mr4nLs5LaGTESNDL6RSdNzso
	 ofMn4BXQEla5oMRmo7evTcZOy6HJTullbsumgswQsbxKo0nFsWyqROhsVOu01a16s0
	 sVgeONLkCw76GzaFgjJbthf0AKRaC24EIhOQ5A5nH/CAowDeORb3HM440dp1tnd7jx
	 RxgM+7yso+Cdbip6KtdH+ZcQ+aJjZN16IOkP9DVyj0gIxtC8IAT6D+ceK0FJv1txHp
	 j1UqHrDRDaMZetOEwwQYlXbP7pyyrgcvOI6cLLtOIrXsq4hpBRz7fY5hhMu16IujyB
	 tpN1CJdRf6f+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16F3C4263A;
	Tue, 17 Feb 2026 19:46:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 042FA270
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 19:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDFA884217
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 19:46:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8sBSjon7w60w for <buildroot@buildroot.org>;
 Tue, 17 Feb 2026 19:46:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DBE8C8420F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBE8C8420F
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DBE8C8420F
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 19:46:01 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4836e3288cdso1051965e9.0
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 11:46:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771357560; x=1771962360;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aF8UTjP4K/ls2duSo5iIjDvbikceeZf4uiSrnbZKj38=;
 b=PYYqAY9AUh4l3WP2L6qwwmQkLS+L++HZfkjSddVGktFEXQMux/gmUJj/5QLaF/Q9xs
 GTVNZaJAziD2d5ql9b3EtyjGftofK36uMuN36e+qfERd+hkkE5M7IzwQp0gM4hgZ8FtQ
 v5XQhFFtUYtJTXBKFERXA2kZ9Ojg8sBy6T6PSGrp3UtO4DxoOCcFboV+iEFa4eR8+InG
 oA7ICLzmxP8VLxMcybtzGAtHwoJhhwG16U/4fhHjJ60ID1XbAE1k5Gc0XSGX5fCKr34A
 q2OPLxzmQeCr0fLhA24K3kuoOHU8bVuGpnIymI7BKEDWWOW9jcelL4GC+lmz9+O2jPHk
 fp2Q==
X-Gm-Message-State: AOJu0Yz2ajijxUGqPR+dK7MdZNPASiAQpDjJsm+LQWMukpaY9fKfdL/k
 xLQk9jCnUAn0BlvzWaK/6CRVSFxu9X7SE/jeKMLgkc8Q2mklScDMkB0/9LLZ
X-Gm-Gg: AZuq6aIto1q50G3eVt53YwgeTEpnptIIQC1RKn4Q/wdziER1CbPz6gIUbGz2Q7WrtnQ
 kZpHminGCqkMMmrjg4E4gGeH5d3oTcYtwrlvHitaXohAg9oDJ5qooTUcrnOfG5LfH/MyMO7wAtv
 OFt7B4OjbNILGKo4zISIswe2sfWD9/vpivB89168w2KDkFeEzxH1lJp59ILd35v1+pt3CoRnyVJ
 7cRNPlPwwyzC3ak8nTXGqBRY46OxIULb/U6rUUfP9tT0egdE5ovizYIpQju1mcRJNGI873mNy8Z
 AsLepAFVlMGrafQs4z+iw6tiHpLfZ/kyi9cnufwAAsvr1Ze6cUOU6ZvgRIhzBpraEzUGriAvCnI
 a605t9BaewEuET2xcOl6+Tb/nxJUIQP33B3vPHL78Us/n86WtHl3tvpoJ+CN2bFJDIlxW/OOtYG
 TlXPU8nSQAwlZ9pqUoE69iD9z3eBpvYYFQL3dV9A==
X-Received: by 2002:a05:600c:3b87:b0:475:ddad:c3a9 with SMTP id
 5b1f17b1804b1-48378da53a2mr212410385e9.13.1771357559397; 
 Tue, 17 Feb 2026 11:45:59 -0800 (PST)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796abd259sm38778833f8f.24.2026.02.17.11.45.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Feb 2026 11:45:58 -0800 (PST)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Feb 2026 20:43:59 +0100
Message-ID: <20260217194556.4808-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771357560; x=1771962360; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aF8UTjP4K/ls2duSo5iIjDvbikceeZf4uiSrnbZKj38=;
 b=kngB3VBFRjKPxUmxkJg54kmhC7VVEu6mdwmyaIViqA5rdOdrYv6gDwY4H1pECyG2KG
 4hWRTlHiHO9UsTEa+KGHhEXQWubJo0T3lX/eMkldDyOfsX18D4Qqlvf/mq2oweVnPtS3
 xSC8jhtQRp/qpV/MJsUVzB/5ZkkDV0/Q6IjfncmDdbE7NYlN84ES2QY48dfeqBqbxlus
 4TpBjzQxYUAyXzs+oYCc3Bij4WZoOR1+501w86B39RA3DpcaYAWWQCtd3k8PIbpd8+gS
 /6kLjkR+XROwPflfa5pOBB1kZvClp0GZ4FaUcH7pd8uDI6j30Ofi368vOrzWLj2ozjEU
 iK4g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=kngB3VBF
Subject: [Buildroot] [v2, 1/1] package/nnn: bump version to 5.2
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
Cc: Alexander Shirokov <shirokovalexs@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q2hhbmdlbG9nOiBodHRwczovL2dpdGh1Yi5jb20vamFydW4vbm5uL2Jsb2IvdjUuMi9DSEFOR0VM
T0cKClRoaXMgY29tbWl0IGFsc28gYnJpbmdzIHNvbWUgaW1wcm92ZW1lbnRzOgoKMS4gQWRkcyBs
aWJhdG9taWMgYXMgdGhlIGxpYnJhcnkgaXMgcmVxdWlyZWQgc2luY2UgY29tbWl0CjdjZTQ5MTNi
YzM5YmMzYjM0YTBlMmMzZGU3MTUzZmIwOWQ0ODkxNTIuCgoyLiBBZGRzIGRlcGVuZGVuY3kgb24g
QlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEUyB0byBwcmV2ZW50IGZhaWx1cmVzCmluIHRlc3QtcGtn
LgoKMy4gUmVwbGFjZXMgYSBzeW1ib2wgaW4gQ29uZmlnLmluIHRvIG1ha2UgdGhlIGZpbGUgQVND
SUktb25seS4KClNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBTaGlyb2tvdiA8c2hpcm9rb3ZhbGV4
c0BnbWFpbC5jb20+Ci0tLQogcGFja2FnZS9ubm4vQ29uZmlnLmluIHwgNCArKystCiBwYWNrYWdl
L25ubi9ubm4uaGFzaCAgfCA0ICsrLS0KIHBhY2thZ2Uvbm5uL25ubi5tayAgICB8IDggKysrKyst
LS0KIDMgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9wYWNrYWdlL25ubi9Db25maWcuaW4gYi9wYWNrYWdlL25ubi9Db25maWcuaW4K
aW5kZXggNjRjZmE4ZTBhNS4uZWI0MDk2NzdhMCAxMDA2NDQKLS0tIGEvcGFja2FnZS9ubm4vQ29u
ZmlnLmluCisrKyBiL3BhY2thZ2Uvbm5uL0NvbmZpZy5pbgpAQCAtMSw5ICsxLDExIEBACiBjb25m
aWcgQlIyX1BBQ0tBR0VfTk5OCiAJYm9vbCAibm5uIgogCWRlcGVuZHMgb24gQlIyX1VTRV9NTVUg
IyBmb3JrCisJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hBU19BVE9NSUMKKwlkZXBlbmRzIG9u
IEJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFMKIAkjIEJ1aWxkaW5nIG5ubiB3aXRob3V0IHdpZGVj
aGFyL1VURiBzdXBwb3J0IGlzIHRoZW9yZXRpY2FsbHkKIAkjIHBvc3NpYmxlLCBidXQgaW4gcHJh
Y3RpY2UgaXQgbGVhZHMgdG8gdW5zdGFibGUgYnVpbGRzLgotCSMgVGhhdOKAmXMgd2h5IHRoZSBX
Q0hBUiBkZXBlbmRlbmN5IGlzIGhlcmUuCisJIyBUaGF0J3Mgd2h5IHRoZSBXQ0hBUiBkZXBlbmRl
bmN5IGlzIGhlcmUuCiAJZGVwZW5kcyBvbiBCUjJfVVNFX1dDSEFSCiAJc2VsZWN0IEJSMl9QQUNL
QUdFX05DVVJTRVMKIAlzZWxlY3QgQlIyX1BBQ0tBR0VfTkNVUlNFU19XQ0hBUgpkaWZmIC0tZ2l0
IGEvcGFja2FnZS9ubm4vbm5uLmhhc2ggYi9wYWNrYWdlL25ubi9ubm4uaGFzaAppbmRleCA2NzBh
NTkxYWZiLi4wZDZmMTYzNWI2IDEwMDY0NAotLS0gYS9wYWNrYWdlL25ubi9ubm4uaGFzaAorKysg
Yi9wYWNrYWdlL25ubi9ubm4uaGFzaApAQCAtMSwzICsxLDMgQEAKICMgTG9jYWxseSBjb21wdXRl
ZAotc2hhMjU2ICA5ZmFhZmYxZTNmNWEyZmQzZWQ1NzBhODNmNmZiM2JhZjBiZmM2ZWJkNmE5YWJh
YzE2MjAzZDA1N2FjM2ZmZmUzICBubm4tNS4xLnRhci5negotc2hhMjU2ICA4MjlmNDg1ZGM0ZjJm
NTFjMjQ3MWIzNmE5OWUyMmYxNWZmMjE0OTY2ZTE2YjcyY2Q3OTc2OGIyMzM4YjQxMzJiICBMSUNF
TlNFCitzaGEyNTYgIGYxNjZlZGE1MDkzYWM4ZGNmOGNiYmM2MjI0MTIzYTMyYzUzY2YzN2I4MmM1
YzFjYjQ4ZTJlMjMzNTI3NTQwMzAgIG5ubi01LjIudGFyLmd6CitzaGEyNTYgIDIwOTIzOGU5ZWZm
Mzk5N2E0ZTQzMTc2ZGFkZjdlNDFlNzFmMDc3ODRkMWE2YzhkODkzODA3Nzc5NzZmNWUyZGMgIExJ
Q0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvbm5uL25ubi5tayBiL3BhY2thZ2Uvbm5uL25ubi5t
awppbmRleCBhY2JkMGNlMzE0Li43Mjk0MDAzZmJmIDEwMDY0NAotLS0gYS9wYWNrYWdlL25ubi9u
bm4ubWsKKysrIGIvcGFja2FnZS9ubm4vbm5uLm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMKIAotTk5OX1ZFUlNJT04gPSA1LjEKK05OTl9WRVJTSU9OID0gNS4y
CiBOTk5fTElDRU5TRSA9IEJTRC0yLUNsYXVzZQogTk5OX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNF
CiBOTk5fU0lURSA9ICQoY2FsbCBnaXRodWIsamFydW4sbm5uLHYkKE5OTl9WRVJTSU9OKSkKQEAg
LTE1LDEwICsxNSwxMiBAQCBOTk5fTUFLRV9GTEFHUyA9IFwKIAlDRkxBR1NfT1BUSU1JWkFUSU9O
PSBcCiAJUFJFRklYPS91c3IKIAorIyBNdXN0IGJlIHBhc3NlZCBpbiBlbnYgc28gaXQgY2FuIGJl
IGFwcGVuZGVkIHRvIGJ5IHRoZSBNYWtlZmlsZQorTk5OX01BS0VfRU5WICs9IExETElCUz0iLWxh
dG9taWMiCisKIGlmZXEgKCQoQlIyX1RPT0xDSEFJTl9VU0VTX0dMSUJDKSwpCiBOTk5fREVQRU5E
RU5DSUVTICs9IG11c2wtZnRzCi0jIE11c3QgYmUgcGFzc2VkIGluIGVudiBzbyBpdCBjYW4gYmUg
YXBwZW5kZWQgdG8gYnkgdGhlIE1ha2VmaWxlCi1OTk5fTUFLRV9FTlYgKz0gTERMSUJTPSItbGZ0
cyIKK05OTl9NQUtFX0VOViArPSBMRExJQlM9Ii1sZnRzIC1sYXRvbWljIgogZW5kaWYKIAogaWZl
cSAoJChCUjJfUEFDS0FHRV9SRUFETElORSkseSkKLS0gCjIuNTMuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
