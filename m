Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD643C4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 04:19:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7801581F4E;
	Sun,  3 Dec 2023 04:19:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7801581F4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OzXVCmol5Efx; Sun,  3 Dec 2023 04:19:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7C1581EFD;
	Sun,  3 Dec 2023 04:19:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7C1581EFD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 665A81BF2B9
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 04:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3FC3181EA0
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 04:19:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FC3181EA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SgFqp61BcTUW for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 04:19:08 +0000 (UTC)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 94A7D81E99
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 04:19:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94A7D81E99
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1cfabcbda7bso13796205ad.0
 for <buildroot@buildroot.org>; Sat, 02 Dec 2023 20:19:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701577147; x=1702181947;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lC8osdORBu6jmGLMt6tE68lT0b3dAFBMX9xBaZ9E1To=;
 b=wEbEoiIlgJbPCmQvETNvt3qXeC+7709sJFFBpDExfhAezdEET5iUakngtk0ognj2Ty
 Z0VgdZWUI/ArA8OxS+4N/5N89EoTb3pl33bKn8rzEappUSwtUJJMWqbbmozY8brnyW5S
 6/gSBhEfN6Xw5mqsR1DkPw1gWuDHRJZ4WvpqnTXcreIzrvcDjpBH4C/Zc7Ea9a34aO6w
 tto/LFIZbcHxaASpsEkfFZGWmHuR+NrFbRPHi8XQRnM77/sWJNdL40a58DpqrPVQFYXc
 TLyP8CSYDBpzyHwibH2a3GY0eRG+qjWEFtIHKgQ4JAicUSt0fFPJfY8V/E1sdPR9APjO
 bJVg==
X-Gm-Message-State: AOJu0Yx44u4/VhYrkSJXtxGXQClxqiiIWoY/ia3/MQmrU6O1eIEBlvqG
 /KYgzJYwIo7Qjgaw9/HtZ87A5rzzrshFSr0N4fs=
X-Google-Smtp-Source: AGHT+IE9RAwKsNGSKz+cpZT8vyFzAtWkHl0Cn0rbNCSGjso9wRQFmMmNCa9TICQWJ74c2r08YEaOgQ==
X-Received: by 2002:a17:902:eed5:b0:1d0:8f10:930e with SMTP id
 h21-20020a170902eed500b001d08f10930emr379747plb.64.1701577147085; 
 Sat, 02 Dec 2023 20:19:07 -0800 (PST)
Received: from localhost.localdomain (75-174-247-100.bsmr.qwest.net.
 [75.174.247.100]) by smtp.gmail.com with ESMTPSA id
 j15-20020a170902da8f00b001cfc6388b5dsm5874084plx.260.2023.12.02.20.19.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 20:19:06 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat,  2 Dec 2023 21:18:36 -0700
Message-ID: <20231203041841.492885-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231203041841.492885-1-adam.duskett@amarulasolutions.com>
References: <20231203041841.492885-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1701577147; x=1702181947;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lC8osdORBu6jmGLMt6tE68lT0b3dAFBMX9xBaZ9E1To=;
 b=R6tbTq3eoESko7rhqWwckYp/Sz8PMjeMP+R5V7nFs0+DsjRPmESN4a5U+r+9Op8ZC9
 bp7A0k13R78GZ0k82nYPWqbzyjiIonX5qkp+5CUzABa+sLxCY9duvUkfh9dJP0mwlS2b
 66P2opJnZc69VZXMYf+d8jqW9fDuL8DjO+8BY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=R6tbTq3e
Subject: [Buildroot] [PATCH 3/6] package/google-breakpad: fix building on
 newer systems
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Pascal Huerst <pascal.huerst@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBlcnJvciB3aGVuIGJ1aWxkaW5nIGFnYWluc3QgRmVkb3JhIDM5
OgrigJh1aW50cHRyX3TigJkgaXMgZGVmaW5lZCBpbiBoZWFkZXIg4oCYPGNzdGRpbnQ+4oCZOyBk
aWQgeW91IGZvcmdldCB0bwrigJgjaW5jbHVkZSA8Y3N0ZGludD7igJk/CgpTaWduZWQtb2ZmLWJ5
OiBBZGFtIER1c2tldHQgPGFkYW0uZHVza2V0dEBhbWFydWxhc29sdXRpb25zLmNvbT4KLS0tCiAu
Li5hZGQtY3N0ZGludC10by1taW5pZHVtcF9kZXNjcmlwdG9yLmgucGF0Y2ggfCAzMiArKysrKysr
KysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1v
ZGUgMTAwNjQ0IHBhY2thZ2UvZ29vZ2xlLWJyZWFrcGFkLzAwMDEtYWRkLWNzdGRpbnQtdG8tbWlu
aWR1bXBfZGVzY3JpcHRvci5oLnBhdGNoCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9nb29nbGUtYnJl
YWtwYWQvMDAwMS1hZGQtY3N0ZGludC10by1taW5pZHVtcF9kZXNjcmlwdG9yLmgucGF0Y2ggYi9w
YWNrYWdlL2dvb2dsZS1icmVha3BhZC8wMDAxLWFkZC1jc3RkaW50LXRvLW1pbmlkdW1wX2Rlc2Ny
aXB0b3IuaC5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5mMTNi
ZGRjM2JiCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9nb29nbGUtYnJlYWtwYWQvMDAwMS1h
ZGQtY3N0ZGludC10by1taW5pZHVtcF9kZXNjcmlwdG9yLmgucGF0Y2gKQEAgLTAsMCArMSwzMiBA
QAorRnJvbSBkZDdhNmIyOGU3NWU3NjVkNDVjZTdlY2FiMjEwNjBlODQ1ZGQ0MDg4IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbTogQWRhbSBEdXNrZXR0IDxhZGFtLmR1c2tldHRAYW1hcnVs
YXNvbHV0aW9ucy5jb20+CitEYXRlOiBGcmksIDEgRGVjIDIwMjMgMTA6MzQ6MjEgLTA3MDAKK1N1
YmplY3Q6IFtQQVRDSF0gYWRkIGNzdGRpbnQgdG8gbWluaWR1bXBfZGVzY3JpcHRvci5oCisKK0Zp
eGVzIGJ1aWxkcyBvbiBuZXdlciBzeXN0ZW1zIGFuZCByZXNvbHZlcyB0aGUgZm9sbG93aW5nIGVy
cm9yOgorCivigJh1aW50cHRyX3TigJkgaXMgZGVmaW5lZCBpbiBoZWFkZXIg4oCYPGNzdGRpbnQ+
4oCZOyBkaWQgeW91IGZvcmdldCB0bwor4oCYI2luY2x1ZGUgPGNzdGRpbnQ+4oCZPworCitVcHN0
cmVhbTogTm90IHN1Ym1pdHRlZC4gRml4ZWQgaW4gbGF0ZXIgdmVyc2lvbnMuCisKK1NpZ25lZC1v
ZmYtYnk6IEFkYW0gRHVza2V0dCA8YWRhbS5kdXNrZXR0QGFtYXJ1bGFzb2x1dGlvbnMuY29tPgor
LS0tCisgc3JjL2NsaWVudC9saW51eC9oYW5kbGVyL21pbmlkdW1wX2Rlc2NyaXB0b3IuaCB8IDEg
KworIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQorCitkaWZmIC0tZ2l0IGEvc3JjL2Ns
aWVudC9saW51eC9oYW5kbGVyL21pbmlkdW1wX2Rlc2NyaXB0b3IuaCBiL3NyYy9jbGllbnQvbGlu
dXgvaGFuZGxlci9taW5pZHVtcF9kZXNjcmlwdG9yLmgKK2luZGV4IGM3ZTRmMmIuLjg1ZThjNGIg
MTAwNjQ0CistLS0gYS9zcmMvY2xpZW50L2xpbnV4L2hhbmRsZXIvbWluaWR1bXBfZGVzY3JpcHRv
ci5oCisrKysgYi9zcmMvY2xpZW50L2xpbnV4L2hhbmRsZXIvbWluaWR1bXBfZGVzY3JpcHRvci5o
CitAQCAtMzAsNiArMzAsNyBAQAorICNpZm5kZWYgQ0xJRU5UX0xJTlVYX0hBTkRMRVJfTUlOSURV
TVBfREVTQ1JJUFRPUl9IXworICNkZWZpbmUgQ0xJRU5UX0xJTlVYX0hBTkRMRVJfTUlOSURVTVBf
REVTQ1JJUFRPUl9IXworIAorKyNpbmNsdWRlIDxjc3RkaW50PgorICNpbmNsdWRlIDxhc3NlcnQu
aD4KKyAjaW5jbHVkZSA8c3lzL3R5cGVzLmg+CisgCistLSAKKzIuNDMuMAorCi0tIAoyLjQzLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
