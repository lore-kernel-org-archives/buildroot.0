Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF547C48BF3
	for <buildroot@archiver.kernel.org>; Fri, 16 Feb 2024 21:15:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 974C342234;
	Fri, 16 Feb 2024 21:15:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4oQQWi4c_f1x; Fri, 16 Feb 2024 21:15:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE09F42222
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE09F42222;
	Fri, 16 Feb 2024 21:15:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7E4FB1BF287
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 21:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59F18421AA
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 21:15:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id drlRqvzg4q_t for <buildroot@lists.busybox.net>;
 Fri, 16 Feb 2024 21:15:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 667D941E62
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 667D941E62
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 667D941E62
 for <buildroot@buildroot.org>; Fri, 16 Feb 2024 21:15:22 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4124907f6fcso7307365e9.1
 for <buildroot@buildroot.org>; Fri, 16 Feb 2024 13:15:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708118120; x=1708722920;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zR0IEZfdXevffNUQ3owYjUmpyYTDZLUFAfnjkpQbYH8=;
 b=DI+jBnkvxm3PI2zk+Y5bbEHdNohQ4f8xoY2Lxhw7MwLDrZUHS/vt6viHVMnR5XzB4L
 TzSrQVJqnE4IqdvG3XgrSOB515CojRfXspijmru9bPn5hFppfDf4ILiEVmdcY6Wc5THD
 DVSNydAg0Xf1WUUgcMlmG0JZFk94IC7kvgkxtPo/j8NLDitMcJCcvLwzruPU0jGHjTIh
 39D1oqP0qO+5otwSrVTJ0CJQCtc3DLZdqDW33z76gmo1aVql5MMSNVU7/Uw8u/ersRhk
 cTIZTwALRXw357KL6hu1oJD0WIiDE3543V4Thq91FtT6BwXhBlosZI5Zo2rrre8qw/HB
 vfPA==
X-Gm-Message-State: AOJu0YyCPsJWtqAmMkZ4d0cMdXF63YXQqaFqg7nH+fCRatIXb9TlbKTZ
 wJeTjsUh2r3Z1bIrVKYSe5qeBwM+Bhd4DD6TI9A7r/bZ+XRWZqMbDA5z5KerDxQP0mFD/0wJ3C/
 /2vI=
X-Google-Smtp-Source: AGHT+IEjLbogQjTMS8m8s+ytLyy4q9FUG7J6wWlBxtG9WXlkqxEzNwN9im0ryIfwfpJxriy9Xo4ZQg==
X-Received: by 2002:a05:600c:4f83:b0:411:ddc2:28b2 with SMTP id
 n3-20020a05600c4f8300b00411ddc228b2mr4720570wmq.27.1708118120474; 
 Fri, 16 Feb 2024 13:15:20 -0800 (PST)
Received: from junian.fritz.box (94.105.103.7.dyn.edpnet.net. [94.105.103.7])
 by smtp.gmail.com with ESMTPSA id
 v11-20020a05600c444b00b00410d7e55e5asm3451234wmn.3.2024.02.16.13.15.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 13:15:19 -0800 (PST)
To: buildroot@buildroot.org
Date: Fri, 16 Feb 2024 22:13:41 +0100
Message-Id: <20240216211344.1807353-4-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240216211344.1807353-1-raphael.melotte@mind.be>
References: <20240216211344.1807353-1-raphael.melotte@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1708118120; x=1708722920; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zR0IEZfdXevffNUQ3owYjUmpyYTDZLUFAfnjkpQbYH8=;
 b=T9bb7xb43pAnH7minHCjHvnHg1fKINzVv6/+9mQdq2IWHbQGZ9dhr3EMLrR7I/zd5E
 4dSepsT1MVe+KkqN3VbCSbejlohQH+UHnOZ1YltOAFDzdlontAPhdlP8wlBYUgX+8Je7
 iIrP6BDJr71ws2RJehRFoFz1wS8oCstH8KqfYP/SWyBNikValMw3C3B4zoE0a+oA4GlQ
 4sZK2IS8DAir1ZwsyuXcbVAYAIq1mVnom4cjFZZmp3SAvDBzCHYR9AflRzmiIP6my+Ui
 btAqbspBM+u035Yih3x03WlhRbJHXLe8Ji4QwE22fSgz0ZErwHSbYpMJog0cabtR3MQe
 dNmQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=T9bb7xb4
Subject: [Buildroot] [PATCH 3/5] package/mupdf: fix building shared libraries
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: james.hilliard1@gmail.com,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QnkgZGVmYXVsdCBtdXBkZiBnZW5lcmF0ZXMgc3RhdGljIGxpYnJhcmllcywgc2hhcmVkIGxpYnJh
cmllcyBtdXN0IGJlCmVuYWJsZWQgZXhwbGljaXRlbHkuCgpUaGUgTWFrZWZpbGUgZG9lc24ndCBt
YWtlIGl0IHBvc3NpYmxlIHRvIGJ1aWxkIGJvdGggc3RhdGljIGFuZCBzaGFyZWQKbGlicywgc28g
YWRkIGEgJ2RlcGVuZHMgb24nIGFjY29yZGluZ2x5LgoKU2lnbmVkLW9mZi1ieTogUmFwaGHDq2wg
TcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJlPgotLS0KIHBhY2thZ2UvbXVwZGYvQ29u
ZmlnLmluIHwgNCArKysrCiBwYWNrYWdlL211cGRmL211cGRmLm1rICB8IDUgKysrKysKIDIgZmls
ZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9tdXBkZi9D
b25maWcuaW4gYi9wYWNrYWdlL211cGRmL0NvbmZpZy5pbgppbmRleCBjZjk3NzExMTYwLi4wOTJl
MWQ4YWM2IDEwMDY0NAotLS0gYS9wYWNrYWdlL211cGRmL0NvbmZpZy5pbgorKysgYi9wYWNrYWdl
L211cGRmL0NvbmZpZy5pbgpAQCAtMSw5ICsxLDEzIEBACitjb21tZW50ICJNdVBERiBjYW4gYnVp
bGQgc3RhdGljIG9yIHNoYXJlZCBsaWJzLCBidXQgbm90IGJvdGggYXQgdGhlIHNhbWUgdGltZS4i
CisJZGVwZW5kcyBvbiBCUjJfU0hBUkVEX1NUQVRJQ19MSUJTCisKIGNvbmZpZyBCUjJfUEFDS0FH
RV9NVVBERgogCWJvb2wgIm11cGRmIgogCWRlcGVuZHMgb24gQlIyX0lOU1RBTExfTElCU1REQ1BQ
ICMgaGFyZmJ1enoKIAlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEFTX1NZTkNfNCAjIGhhcmZi
dXp6CiAJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF80XzkgIyBoYXJmYnV6
egogCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfWE9SRzcKKwlkZXBlbmRzIG9uICFCUjJfU0hBUkVE
X1NUQVRJQ19MSUJTCiAJc2VsZWN0IEJSMl9QQUNLQUdFX0ZSRUVUWVBFCiAJc2VsZWN0IEJSMl9Q
QUNLQUdFX0dVTUJPX1BBUlNFUgogCXNlbGVjdCBCUjJfUEFDS0FHRV9IQVJGQlVaWgpkaWZmIC0t
Z2l0IGEvcGFja2FnZS9tdXBkZi9tdXBkZi5tayBiL3BhY2thZ2UvbXVwZGYvbXVwZGYubWsKaW5k
ZXggMDg4OTRkNzk4MC4uZDIxMDU0OTdiZSAxMDA2NDQKLS0tIGEvcGFja2FnZS9tdXBkZi9tdXBk
Zi5taworKysgYi9wYWNrYWdlL211cGRmL211cGRmLm1rCkBAIC01MCw2ICs1MCwxMSBAQCBNVVBE
Rl9NQUtFX09QVFMgPSBcCiAJSEFWRV9PQkpDT1BZPW5vIFwKIAlwcmVmaXg9Ii91c3IiCiAKKyMg
VGhlIGRlZmF1bHQgaW4gTXVQREYgaXMgc3RhdGljIGxpYnMKK2lmZXEgKCQoQlIyX1NIQVJFRF9M
SUJTKSx5KQorTVVQREZfTUFLRV9PUFRTICs9IHNoYXJlZD15ZXMKK2VuZGlmCisKIGlmZXEgKCQo
QlIyX1BBQ0tBR0VfTElCRlJFRUdMVVQpLHkpCiBNVVBERl9ERVBFTkRFTkNJRVMgKz0gbGliZnJl
ZWdsdXQKIGVsc2UKLS0gCjIuMzcuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
