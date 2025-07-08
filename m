Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C5D4C8303C
	for <buildroot@archiver.kernel.org>; Tue,  8 Jul 2025 08:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BD52407FB;
	Tue,  8 Jul 2025 08:35:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u3mtvH8FAOhW; Tue,  8 Jul 2025 08:35:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADE3940690
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADE3940690;
	Tue,  8 Jul 2025 08:35:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BFD191BF
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 08:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A04AC406F0
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 08:35:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wn8Vj3tO6Gjm for <buildroot@buildroot.org>;
 Tue,  8 Jul 2025 08:35:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A91FC40690
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A91FC40690
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A91FC40690
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 08:35:54 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ae0c4945c76so632819166b.3
 for <buildroot@buildroot.org>; Tue, 08 Jul 2025 01:35:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751963752; x=1752568552;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N5XL7uknrgfLiid0ri9LeBcu+F1SK+KTu6QVFTWKndA=;
 b=M8tpzjwzXo5+NRybl9eyderyxnNhkneMABFMp9IrlEKPBUhsrMxb29fhsQQ4AbmtTY
 7ZE1Od+DJZNE743d+zNMsZaYGgeYTHWvdd+Ow/c2BFAKtY9WKcaG3LFQdunYPSW+xWmh
 ueiIQqWNfbBh+qOaA4p7U7iTIcOgavCOKTJmzT2yCXfP/c4FWP1Dt7YKYVF1N1iDg0gs
 IJupBAREy2Q+xSJ475G2GBadRVXPyU+o71k/AXc+BauxKT2INp/3MXY6/GkXPTtHNqzh
 UdIn+aW5NjLvPaMlSfRKgSXj70HwlVMcD36CjS55MQx4v7SAO+pcg0gJRPo3lZGvh8+e
 zDrA==
X-Gm-Message-State: AOJu0YwpgLTfNrVYAT4h9V0XZArWX9QD6QtoWjPB/73G3T/4RkgoXEIU
 sIPMZEYBsICQlMyQjIPaYObGYWa82VLeuRqa/qAk0t3LeS+YXCeMb6+jO+yedg==
X-Gm-Gg: ASbGncsbTkVz+CQ6DxnwTIO+E120/428Ei3S0hOYUwENrKK43++ovD4pmuCyLJ/tLw8
 0aCr6mtGrjS380NOlfEAOHF1md0BYFHQVgUzZZ8882oTfGvk/aTSybT8oQED0mcCKpbIUnN3lEK
 2ZOrB0DReIDuCF8an0caXV0RKN0acPim7WiPuY23kvWT94wmvdCVzpWR2dFC6Wbvcd5Z8Iog5Qe
 nMijemb3kgkJn/UGV5DjsZbgOXfNMjtxaB2UsQ9gE3g8bY8yXOL5p3APeryaZXdOQgPmNGhHnqT
 g4Q49YI709lepYFsC+NQlDjPNxnPB51DOC6LnlN3kePUzre/kHyf9Cu6gMADJvrlibCAeZBPpeI
 E9W0QULdlFVciKKXr9XxE3HSsGNHIsjDOnh9XsAoSu3w=
X-Google-Smtp-Source: AGHT+IFt6o84LKv9PLVa41gfn9pZqjd8WZcGCLZM6vKkxsj02gbZO36n25lmp8zNb9I1qaSdADVxVg==
X-Received: by 2002:a17:907:edc2:b0:add:ed0d:a581 with SMTP id
 a640c23a62f3a-ae3fe487a2bmr1679136266b.17.1751963751722; 
 Tue, 08 Jul 2025 01:35:51 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae41057da49sm621081166b.61.2025.07.08.01.35.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jul 2025 01:35:50 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue,  8 Jul 2025 10:35:42 +0200
Message-Id: <20250708083542.770131-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1751963752; x=1752568552; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=N5XL7uknrgfLiid0ri9LeBcu+F1SK+KTu6QVFTWKndA=;
 b=elhz+xuUgY4qXvOA2Vx0UUCU+s//I52Wj6g4YGguFois/f9Cw8CSIkwlEMmZLLQ8xi
 ggiwPpR6V7LwOkZqQC7rVhHhqlUEyhWChjPVJ1w0lkmi1wP51f6vcPRbwWJZvx+0Tuyz
 3RFPfvzDNg6SLZwA+Hpi1JPmzhTQwyYnixP42q0wOx1UnaIglU3NRCxXP9q+4DLM4J5R
 3449NMKntf8Exuq8Y3yGSpiAucuhGH0qu9y5h59hBG3iz0mSR7Igk+mzwyt1F7RzxX/q
 v9s4oRAgu//hdPpkk9tEJhXldPAbW91YJw6XZnJhPZL+V/8RfUru1kH/GjIMwCwF/iGF
 YjSA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=elhz+xuU
Subject: [Buildroot] [PATCH] package/libxmlrpc: fix boolean definitions
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: ju.o@free.fr, "Alvaro G . M" <alvaro.gamez@hazent.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogWWVnb3IgWWVmcmVtb3YgPHllZ29yc2xpc3RzQGdvb2dsZW1haWwuY29tPgoKRG9uJ3Qg
ZGVmaW5lIGJvb2xlYW4gbWFjcm9zIGZvciBDMjMgc3RhbmRhcmQgYXMgdGhleSBhcmUgaW1wbGVt
ZW50ZWQKYXMga2V5d29yZHMuCgpGaXhlcyB0aGUgZm9sbG93aW5nIGVycm9yOgoKbWFrZVsyXTog
RW50ZXJpbmcgZGlyZWN0b3J5CicvaG9tZS91c2VyL0RvY3VtZW50cy92ZXJzaW9uZWQvb3NzL3ht
bHJwYy1jL2xpYi91dGlsJwpnY2MgLWMgLUROREVCVUcgLXB0aHJlYWQgLVdhbGwgLVcgLVduby11
bmluaXRpYWxpemVkIC1XdW5kZWYKLVduby11bmtub3duLXByYWdtYXMgLVdtaXNzaW5nLWRlY2xh
cmF0aW9ucyAtV3N0cmljdC1wcm90b3R5cGVzCi1XbWlzc2luZy1wcm90b3R5cGVzIC1XaW1wbGlj
aXQgLWZuby1jb21tb24gLWcgLU8zCi1Jc3JjZGlyL2xpYi91dGlsL2luY2x1ZGUKLUkvaG9tZS91
c2VyL0RvY3VtZW50cy92ZXJzaW9uZWQvb3NzL3htbHJwYy1jICAgY2FzcHJpbnRmLmMKSW4gZmls
ZSBpbmNsdWRlZCBmcm9tIGNhc3ByaW50Zi5jOjk6CnNyY2Rpci9saWIvdXRpbC9pbmNsdWRlL2Jv
b2wuaDoxMzo1OiBlcnJvcjogY2Fubm90IHVzZSBrZXl3b3JkIOKAmGZhbHNl4oCZCmFzIGVudW1l
cmF0aW9uIGNvbnN0YW50CiAgIDEzIHwgICAgIGZhbHNlID0gMCwKICAgICAgfCAgICAgXn5+fn4K
c3JjZGlyL2xpYi91dGlsL2luY2x1ZGUvYm9vbC5oOjEzOjU6IG5vdGU6IOKAmGZhbHNl4oCZIGlz
IGEga2V5d29yZCB3aXRoCuKAmC1zdGQ9YzIz4oCZIG9ud2FyZHMKc3JjZGlyL2xpYi91dGlsL2lu
Y2x1ZGUvYm9vbC5oOjE1OjM6IGVycm9yOiBleHBlY3RlZCDigJg74oCZLCBpZGVudGlmaWVyCm9y
IOKAmCjigJkgYmVmb3JlIOKAmGJvb2zigJkKICAgMTUgfCB9IGJvb2w7CiAgICAgIHwgICBefn5+
CnNyY2Rpci9saWIvdXRpbC9pbmNsdWRlL2Jvb2wuaDoxNTozOiB3YXJuaW5nOiB1c2VsZXNzIHR5
cGUgbmFtZSBpbgplbXB0eSBkZWNsYXJhdGlvbgoKVXBzdHJlYW06IHRoZSBwYXRjaCBjb21lcyBm
cm9tIHRoZSBtYWludGFpbmVyIGJ1dCBpdCBpcyBub3QgbWVyZ2VkIHlldAoKU2lnbmVkLW9mZi1i
eTogWWVnb3IgWWVmcmVtb3YgPHllZ29yc2xpc3RzQGdvb2dsZW1haWwuY29tPgotLS0KIC4uLi8w
MDAxLUZpeC1ib29sZWFuLWRlZmluaXRpb25zLnBhdGNoICAgICAgICB8IDI1ICsrKysrKysrKysr
KysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAx
MDA2NDQgcGFja2FnZS9saWJ4bWxycGMvMDAwMS1GaXgtYm9vbGVhbi1kZWZpbml0aW9ucy5wYXRj
aAoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlieG1scnBjLzAwMDEtRml4LWJvb2xlYW4tZGVmaW5p
dGlvbnMucGF0Y2ggYi9wYWNrYWdlL2xpYnhtbHJwYy8wMDAxLUZpeC1ib29sZWFuLWRlZmluaXRp
b25zLnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjZlOWJiM2Zk
NjcKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL2xpYnhtbHJwYy8wMDAxLUZpeC1ib29sZWFu
LWRlZmluaXRpb25zLnBhdGNoCkBAIC0wLDAgKzEsMjUgQEAKK0luZGV4OiBsaWIvdXRpbC9pbmNs
dWRlL2Jvb2wuaAorPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PQorRG9uJ3QgZGVmaW5lIGJvb2xlYW4gbWFjcm9zIGZvciBD
MjMgc3RhbmRhcmQgYXMgdGhleSBhcmUgaW1wbGVtZW50ZWQKK2FzIGtleXdvcmRzLgorCitVcHN0
cmVhbTogdGhlIHBhdGNoIGNvbWVzIGZyb20gdGhlIG1haW50YWluZXIgYnV0IGl0IGlzIG5vdCBt
ZXJnZWQgeWV0CisKK1NpZ25lZC1vZmYtYnk6IFllZ29yIFllZnJlbW92IDx5ZWdvcnNsaXN0c0Bn
b29nbGVtYWlsLmNvbT4KKworZGlmZiAtLWdpdCBhL2xpYi91dGlsL2luY2x1ZGUvYm9vbC5oIGIv
bGliL3V0aWwvaW5jbHVkZS9ib29sLmgKKy0tLSBhL2xpYi91dGlsL2luY2x1ZGUvYm9vbC5oCShy
ZXZpc2lvbiAzMzE2KQorKysrIGIvbGliL3V0aWwvaW5jbHVkZS9ib29sLmgJKHdvcmtpbmcgY29w
eSkKK0BAIC01LDcgKzUsMTEgQEAKKyAgICBjb2xsaXNpb24uCisgKi8KKyAKKy0jaWZuZGVmIF9f
Y3BsdXNwbHVzCisrI2lmZGVmIF9fY3BsdXNwbHVzCisrLyogYm9vbCBoYXMgYWx3YXlzIGJlZW4g
cGFydCBvZiB0aGUgQysrIGxhbmd1YWdlICovCisrI2VsaWYgX19TVERDX1ZFUlNJT05fXyA+PSAy
MDIzMTFMCisrLyogYm9vbCBpcyBwYXJ0IG9mIHRoZSBDMjMgc3RhbmRhcmQgKi8KKysjZWxzZQor
IC8qIEF0IGxlYXN0IHRoZSBHTlUgY29tcGlsZXIgZGVmaW5lcyBfX2Jvb2xfdHJ1ZV9mYWxzZV9h
cmVfZGVmaW5lZCAqLworICNpZm5kZWYgX19ib29sX3RydWVfZmFsc2VfYXJlX2RlZmluZWQKKyAj
ZGVmaW5lIF9fYm9vbF90cnVlX2ZhbHNlX2FyZV9kZWZpbmVkCi0tIAoyLjM0LjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
