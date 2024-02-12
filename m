Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32A3C4829A
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 02:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 356E440118;
	Mon, 12 Feb 2024 02:13:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1FfXFZAy_mDY; Mon, 12 Feb 2024 02:13:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCB0540BDD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CCB0540BDD;
	Mon, 12 Feb 2024 02:13:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 04CA31BF420
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 02:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E55F7840D2
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 02:13:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yX0H8Y7uAbJC for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 02:13:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1130; helo=mail-yw1-x1130.google.com;
 envelope-from=abiliojr@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C1A66840D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1A66840D1
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C1A66840D1
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 02:13:09 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-604aaf2d047so27858207b3.0
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 18:13:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707703988; x=1708308788;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wiNdBhPmcHGXDhX9/zNsR39SSeoKQJuC0vA3h97ZgCA=;
 b=P494npLHXdetQk1jAXK74veE/37pboRWkC/uLU1rBGVpdsSaYnBXwU4GxZqAmErsQC
 LGzBO2Bi0y+HWLoiSrHnvOMUwZ/prV0Mtqe9Xda4Y53EgZ+KIrOwY9B4PRi2Wu0wlEmP
 Wq6i8qWkXyNPyIJrIdheMfSDRV9sA2t7D4A9bqgeGqbwq7mhQySJL5Q3sSccJjIDDbiX
 URNtKgXAmSvU9MP8AyV0Nq5pYTwETJPVqTpSHBdMVfad03Oc7Pfiujsu4uguQMhugW5Z
 g2eilvggOaBnP5mlmzRHpxy2F0eFOqsCjZxnnazZN2+IfaICfCuyhdEMsX05lDi8Wb25
 pzBA==
X-Gm-Message-State: AOJu0YyG2qtHz1kLDUpkffE+/laRSz3oohWEj7i8XZUljY/d0j/GP/+x
 4E2D3g674JmGODc7WNMGE4Ixzd0fkGgzQgQhXL8xHJQiKLv+jORj3mi1MYcwbss=
X-Google-Smtp-Source: AGHT+IGTFOv7ajGaN7Oj91yyNX4YliXwai7Rnzztq02pK1c896bBkvNPCwlHPy+q2mD9D+JcUu9BYw==
X-Received: by 2002:a81:92d2:0:b0:602:d17a:7cb8 with SMTP id
 j201-20020a8192d2000000b00602d17a7cb8mr4564033ywg.11.1707703988588; 
 Sun, 11 Feb 2024 18:13:08 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWBV/XK2J2hyxNlMI3jeksAwXyUuCTfasGAi810OC2FuuysBnacw+IgGUcc9PoihUhLXlPgIEcjLAVPeTniNaMLNDpvERG4JbfE6TAbVh6TKfanF8UedM/ScooY
Received: from thinkpad.lan ([2600:1700:3eca:ac1f:a11a:f043:3678:9ceb])
 by smtp.gmail.com with ESMTPSA id
 r71-20020a0de84a000000b006049b905176sm998816ywe.39.2024.02.11.18.13.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Feb 2024 18:13:07 -0800 (PST)
From: Abilio Marques <abiliojr@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 18:12:53 -0800
Message-ID: <20240212021255.246556-1-abiliojr@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707703988; x=1708308788; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wiNdBhPmcHGXDhX9/zNsR39SSeoKQJuC0vA3h97ZgCA=;
 b=io85M3HduTwupq8XyosvuBOQBBbhNpFpAQ2V1s7+Rn1bbpBvxYwm9MmAa6Amntzk9v
 Z7XOPJRw5gpOEHXEB3nog9EDq5GhCzOFXXwmq4EYlhoX887Ato15jizYPR9iaHxLls47
 RHolOZ+WGRJBfClAXH0PIJek7wrN/KK88Rb8a2N73DgwmeCYr8Zb9mxAXUqfXiY25sHC
 OCvyoPBMZL+Ui5IM0F9VlzsN6Ah/vZctABZ5SPE1CbV2gm6bHvtn4WMza29MbYPu55MR
 OGYn6KVkxm8fGjVfpZjjK5TBspxwmpe1SfC8Ta7FPky6XF+rMG4uoq7TOWnCW7lPDDyz
 okrg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=io85M3Hd
Subject: [Buildroot] [PATCH v2 1/1] package/micropython: add support for
 manifest.py in the configuration
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
Cc: Chris Packham <judge.packham@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Abilio Marques <abiliojr@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TWljcm9weXRob24gY2FuIGVtYmVkIHBhY2thZ2VzIGFuIG1vZHVsZXMgYXMgZnJvemVuIGJ5dGVj
b2RlLiBXaGF0IGNvZGUKZ2V0cyBidWlsdCB0aGlzIHdheSBjYW4gYmUgZGVmaW5lZCBieSBtZWFu
cyBvZiBhICJtYW5pZmVzdC5weSIgZmlsZS4KClRoaXMgY29tbWl0IGV4cG9zZXMgdGhlIHZhcmlh
YmxlIEZST1pFTl9NQU5JRkVTVCB0byBCdWlsZHJvb3QgdXNlcnMKdGhyb3VnaCBhIG5ldyB2YXJp
YWJsZSBjYWxsZWQgQlIyX1BBQ0tBR0VfTUlDUk9QWVRIT05fTUFOSUZFU1QuCgpQbGVhc2UgY2hl
Y2sgTWljcm9weXRob24ncyBkb2N1bWVudGF0aW9uIGZvciBtb3JlIGluZm9ybWF0aW9uOgpodHRw
czovL2RvY3MubWljcm9weXRob24ub3JnL2VuL2xhdGVzdC9yZWZlcmVuY2UvbWFuaWZlc3QuaHRt
bAoKV2Ugb25seSBzdXBwb3J0IGZyZWV6aW5nIG9mIG1vZHVsZXMgZnJvbSBtaWNyb3B5dGhvbi1s
aWIuIEZyZWV6aW5nCmFyYml0cmFyeSBtb2R1bGVzIHdvdWxkIHJlcXVpcmUgc29tZSBoYW5kbGlu
ZyBvZiBhYnNvdWx0ZSBwYXRocywgYW5kCmEgZ3VhcmFudGVlIHRoYXQgdGhlIGZpbGVzIGJlIGF2
YWlsYWJsZSBiZWZvcmUgbWljcm9weXRob24gaXMgYnVpbHQsCndoaWNoIGlzIGNvbnNpZGVyZWQg
YSBiaXQgdG9vIGNvbXBsZXg7IGFuIGludGVyZXN0ZWQgcGFydHkgY2FuCnByb3ZpZGUgc3VjaCBz
dXBwb3J0IGluIHRoZSBmdXR1cmUuCgpTaWduZWQtb2ZmLWJ5OiBBYmlsaW8gTWFycXVlcyA8YWJp
bGlvanJAZ21haWwuY29tPgotLS0KIHBhY2thZ2UvbWljcm9weXRob24vQ29uZmlnLmluICAgICAg
fCAxNyArKysrKysrKysrKysrKysrKwogcGFja2FnZS9taWNyb3B5dGhvbi9taWNyb3B5dGhvbi5t
ayB8ICA1ICsrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9wYWNrYWdlL21pY3JvcHl0aG9uL0NvbmZpZy5pbiBiL3BhY2thZ2UvbWljcm9weXRob24v
Q29uZmlnLmluCmluZGV4IDI2YTAwYmFhYjAuLjZiOTljZmQyZmYgMTAwNjQ0Ci0tLSBhL3BhY2th
Z2UvbWljcm9weXRob24vQ29uZmlnLmluCisrKyBiL3BhY2thZ2UvbWljcm9weXRob24vQ29uZmln
LmluCkBAIC0xNyw2ICsxNywyMyBAQCBjb25maWcgQlIyX1BBQ0tBR0VfTUlDUk9QWVRIT05fTElC
CiAJaGVscAogCSAgQ29yZSBQeXRob24gbGlicmFyaWVzIHBvcnRlZCB0byBNaWNyb1B5dGhvbi4K
IAorY29uZmlnIEJSMl9QQUNLQUdFX01JQ1JPUFlUSE9OX01BTklGRVNUCisJc3RyaW5nICJQYXRo
IHRvIGEgbWFuaWZlc3QucHkgZmlsZSIKKwloZWxwCisJICBNaWNyb1B5dGhvbiBhbGxvd3MgUHl0
aG9uIGNvZGUgdG8gYmUg4oCcZnJvemVu4oCdIGFzIGJ5dGVjb2RlCisJICBpbnRvIGl0cyBiaW5h
cnksIGFzIGFuIGFsdGVybmF0aXZlIHRvIGxvYWRpbmcgY29kZSBmcm9tCisJICB0aGUgZmlsZXN5
c3RlbS4gCisKKwkgIEEgbGlzdCBvZiAiZnJvemVuIiBtb2R1bGVzIGNhbiBiZSBwcm92aWRlZCB1
c2luZyBhICJtYW5pZmVzdC5weSIKKwkgIGZpbGUuIFlvdSBjYW4gc2V0IHRoZSBwYXRoIHRvIHN1
Y2ggZmlsZSB1c2luZyB0aGlzIHZhcmlhYmxlLgorCisJICBTZWUgTWljcm9QeXRob24ncyBkb2N1
bWVudGF0aW9uIGZvciBtb3JlIGluZm9ybWF0aW9uIG9uIGhvdyB0bworCSAgdXNlIHRoZSBmaWxl
LgorCisJICBOb3RlOiBpbiBCdWlsZHJvb3QsIG9ubHkgbW9kdWxlcyBwcm92aWRlZCB3aXRoIG1p
Y3JvcHl0aG9uLWxpYgorICAgICAgY2FuIGJlIGZyb3plbiB3aXRoIGEgbWFuaWZlc3Q7IGZyZWV6
aW5nIGFyYml0cmFyeSBmaWxlcyBpcworCSAgY3VycmVudGx5IG5vdCBzdXBwb3J0ZWQuCisKIGVu
ZGlmICMgQlIyX1BBQ0tBR0VfTUlDUk9QWVRIT04KIAogY29tbWVudCAibWljcm9weXRob24gbmVl
ZHMgYSB0b29sY2hhaW4gdy8gdGhyZWFkcywgZHluYW1pYyBsaWJyYXJ5IgpkaWZmIC0tZ2l0IGEv
cGFja2FnZS9taWNyb3B5dGhvbi9taWNyb3B5dGhvbi5tayBiL3BhY2thZ2UvbWljcm9weXRob24v
bWljcm9weXRob24ubWsKaW5kZXggMTI1YTBlZGNmYi4uNWEyYzEzNjU0NyAxMDA2NDQKLS0tIGEv
cGFja2FnZS9taWNyb3B5dGhvbi9taWNyb3B5dGhvbi5taworKysgYi9wYWNrYWdlL21pY3JvcHl0
aG9uL21pY3JvcHl0aG9uLm1rCkBAIC00Myw2ICs0MywxMSBAQCBlbHNlCiBNSUNST1BZVEhPTl9N
QUtFX09QVFMgKz0gTUlDUk9QWV9QWV9GRkk9MAogZW5kaWYKIAoraWZuZXEgKCQoQlIyX1BBQ0tB
R0VfTUlDUk9QWVRIT05fTUFOSUZFU1QpLCIiKQorTUlDUk9QWVRIT05fTUFLRV9PUFRTICs9IFwK
KwlGUk9aRU5fTUFOSUZFU1Q9JChCUjJfUEFDS0FHRV9NSUNST1BZVEhPTl9NQU5JRkVTVCkKK2Vu
ZGlmCisKIGRlZmluZSBNSUNST1BZVEhPTl9CVUlMRF9DTURTCiAJJChUQVJHRVRfTUFLRV9FTlYp
ICQoTUFLRSkgLUMgJChARCkvbXB5LWNyb3NzCiAJJChUQVJHRVRfTUFLRV9FTlYpICQoTUFLRSkg
LUMgJChARCkvcG9ydHMvdW5peCBcCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
