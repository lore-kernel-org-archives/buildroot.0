Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E0BCCD183
	for <buildroot@archiver.kernel.org>; Mon, 13 Oct 2025 20:15:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6202E80BB8;
	Mon, 13 Oct 2025 20:15:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hkhl4BfxjTWT; Mon, 13 Oct 2025 20:15:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C0FE80B8D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C0FE80B8D;
	Mon, 13 Oct 2025 20:15:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DA27D1C9
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 20:15:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D64B9607DE
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 20:15:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YSAapE3Ecoj0 for <buildroot@buildroot.org>;
 Mon, 13 Oct 2025 20:15:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AA531607DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA531607DC
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA531607DC
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 20:15:24 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-46e52279279so32937655e9.3
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 13:15:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760386522; x=1760991322;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W3N7HIBTbmV4crwcinWDlmCEC0pYVfKPq5DQaqgexjc=;
 b=EOJUnz3amI80AULzlsFpjGQXHGSQWBDc3Hrr3gbzvr3wuA4It5JdwDMVdj6Q3UtyMY
 aDhhYbZy5U4tvbPwR9O/EiqSy/yoAGob6gPXuoI39tnujPgufzCkSQGfDaJ+c2WyAEwP
 mxJS6CasHjV27Z1HUjICOahXqo6FiXLRvq5J6ludl4s4rKuEuaNH/6BMpThn0Z0wdQCg
 4b8wW7hz8UWPf6bAW3hXcPAJIecUYXAgaRWmcjLJkTaVS6QETs99URrqJZrrF8Pxw6p5
 wpodr1acu7oBgtrc3OaojW13YtcJkt7Bdfx3vrWehYhO6uEeThXttWG2vPnWNgLFMTpK
 ImMQ==
X-Gm-Message-State: AOJu0YzVLJV9A+uJzN4181P9M3S3tW4cMhC5UguYS0Qjv17ifLHVK097
 MkgTPLX9cuRtUcRyJlVPwoB3nn3XXDbyFiks3zJYGohvVtCL38b9GmAce27UKzfuundGmq8njsn
 /+yE7R+w=
X-Gm-Gg: ASbGncvXxk7Hlhs9Sg/JZcoj47xL8ooI/0pvlwWIHHNw+VfPTESWQb6wYK4yzOg7Svm
 7OLWU2nxRAzD0KFclal/KN2OMFRuNgAflnOdl2abhfs7fwxXbaZThSSW8lRKQRg7rsgL/yq5JpL
 rCXer/sjx60/D4WtiX+FHndeaIlElPOWSVWSFM6mpdnNH72k7YP7HsAkAMKaRR3ahXOL2Q9vzaZ
 RAu263hX8Pnfl0d4Jq8j1MHDYlcYOF08YwQPZGsTqEAgjNftazNNR34bTIVuQdzo/IvXlStoqaE
 zOqbYO2xTX8v0NlZjW3x2Ph+REDC6jWTxIL5wJI7hz+hsYeKIELtlfjfUcJdZKFXfZx20rIuRPT
 FC2jgBu1PY8UI9sCtgH6LoeMBVxJIms+8AkZi/Sn7XVVKeZdJiFV5uPi/qGC8PM2jWR5Zx7lqOl
 oprw==
X-Google-Smtp-Source: AGHT+IH4HnU3ayzW/h502HrntD5o9+uonfGXKPfCQ8RVqgqJR5Pk1Zp8Nh/Gt92JqLz5KUskKp6DTw==
X-Received: by 2002:a05:600c:8b38:b0:45c:4470:271c with SMTP id
 5b1f17b1804b1-46fa9af3682mr165428565e9.18.1760386522440; 
 Mon, 13 Oct 2025 13:15:22 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.42.9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5e8141sm19769704f8f.48.2025.10.13.13.15.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Oct 2025 13:15:22 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 13 Oct 2025 22:15:18 +0200
Message-ID: <20251013201518.3832459-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1760386522; x=1760991322;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=W3N7HIBTbmV4crwcinWDlmCEC0pYVfKPq5DQaqgexjc=;
 b=EpofGc4Rk7xM7qcc76tLKZ71NQAMgaYscl3MSvb0Y/SbyEfswGDlBLWCkqDrwS4N8P
 UT6UPJa3sK32++u9f8EPT1Nbxm2syn06QV258KKqbwNdOr6+Vzsutw9x3i4fCRPBnx8/
 cu1+NGF0p835s/KqUkPk/CPGKjhbeDe6wpn4g=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=EpofGc4R
Subject: [Buildroot] [PATCH 1/1] package/ifupdown: bump to version 0.8.44
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkaW5nIFBLR0xJQkRJUiB0byBDRkxBR1Mgd2FzIG5lY2Vzc2FyeSB0byBmaXggdGhlIGZvbGxv
d2luZyBlcnJvcgpyYWlzZWQgZHVyaW5nIHRoZSBjb21waWxhdGlvbiBvZiB0aGUgbmV3IHZlcnNp
b246CgpleGVjdXRlLmM6IEluIGZ1bmN0aW9uIOKAmHNldF9lbnZpcm9u4oCZOgpleGVjdXRlLmM6
MTA3OjQ4OiBlcnJvcjog4oCYUEtHTElCRElS4oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0
aGlzIGZ1bmN0aW9uKQogIDEwNyB8ICAgICAgICAgKnBwY2grKyA9IHNldGxvY2FsZW52KCIlcz0l
cyIsICJQQVRIIiwgUEtHTElCRElSICI6L3Vzci9sb2NhbC9zYmluOi91c3IvbG9jYWwvYmluOi91
c3Ivc2JpbjovdXNyL2Jpbjovc2JpbjovYmluIik7CiAgICAgIHwgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn4KZXhlY3V0ZS5jOjEwNzo0ODog
bm90ZTogZWFjaCB1bmRlY2xhcmVkIGlkZW50aWZpZXIgaXMgcmVwb3J0ZWQgb25seSBvbmNlIGZv
ciBlYWNoIGZ1bmN0aW9uIGl0IGFwcGVhcnMgaW4KZXhlY3V0ZS5jOjEwNzo1NzogZXJyb3I6IGV4
cGVjdGVkIOKAmCnigJkgYmVmb3JlIHN0cmluZyBjb25zdGFudAogIDEwNyB8ICAgICAgICAgKnBw
Y2grKyA9IHNldGxvY2FsZW52KCIlcz0lcyIsICJQQVRIIiwgUEtHTElCRElSICI6L3Vzci9sb2Nh
bC9zYmluOi91c3IvbG9jYWwvYmluOi91c3Ivc2JpbjovdXNyL2Jpbjovc2JpbjovYmluIik7CgpU
aGlzIFBLR0xJQkRJUiBkZWZpbmUgd2FzIGFkZGVkIHVwc3RyZWFtIGluIGNvbW1pdCBbMV0gaW4g
dGhlIE1ha2VmaWxlCmRlZmF1bHQgQ0ZMQUdTLCBidXQgc2luY2UgQnVpbGRyb290IHJlZGVmaW5l
cyB0aG9zZSBpdCBuZWVkcyB0byBiZSBhZGRlZApiYWNrLgoKUmVsZWFzZSBub3RlcyBzaW5jZSAw
LjguNDE6Cmh0dHBzOi8vc2Fsc2EuZGViaWFuLm9yZy9kZWJpYW4vaWZ1cGRvd24vLS9ibG9iL21h
c3Rlci9kZWJpYW4vY2hhbmdlbG9nI0wxCgpbMV0gaHR0cHM6Ly9zYWxzYS5kZWJpYW4ub3JnL2Rl
Ymlhbi9pZnVwZG93bi8tL2NvbW1pdC8xZWVlN2EzMDQwZWI3YmEyOTVjNDRiZWRkYmZiNDRhYmYz
NDJjYTJjClNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFy
dWxhc29sdXRpb25zLmNvbT4KLS0tCiBwYWNrYWdlL2lmdXBkb3duL2lmdXBkb3duLmhhc2ggfCA0
ICsrLS0KIHBhY2thZ2UvaWZ1cGRvd24vaWZ1cGRvd24ubWsgICB8IDYgKysrLS0tCiAyIGZpbGVz
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9w
YWNrYWdlL2lmdXBkb3duL2lmdXBkb3duLmhhc2ggYi9wYWNrYWdlL2lmdXBkb3duL2lmdXBkb3du
Lmhhc2gKaW5kZXggZjVjMmQyZDM0YzRmLi42NDEyY2Y5ZDkwYTMgMTAwNjQ0Ci0tLSBhL3BhY2th
Z2UvaWZ1cGRvd24vaWZ1cGRvd24uaGFzaAorKysgYi9wYWNrYWdlL2lmdXBkb3duL2lmdXBkb3du
Lmhhc2gKQEAgLTEsNCArMSw0IEBACi0jIEZyb20gaHR0cDovL3NuYXBzaG90LmRlYmlhbi5vcmcv
YXJjaGl2ZS9kZWJpYW4vMjAyMzAyMjJUMjA1NjE1Wi9wb29sL21haW4vaS9pZnVwZG93bi9pZnVw
ZG93bl8wLjguNDEuZHNjCi1zaGEyNTYgIDIyMmM1YmVmMzEzYTllNzFkOWJlNGI5NDZjNzNjODYw
NmM5OGY5ZTAyMjkxNTMxOTFkOWM2ZDhmYjliMzU5OWMgIGlmdXBkb3duXzAuOC40MS50YXIueHoK
KyMgRnJvbSBodHRwOi8vc25hcHNob3QuZGViaWFuLm9yZy9hcmNoaXZlL2RlYmlhbi8yMDI0MDkx
N1QxNDQ1MjBaL3Bvb2wvbWFpbi9pL2lmdXBkb3duL2lmdXBkb3duXzAuOC40NC5kc2MKK3NoYTI1
NiAgNjEyMWExOTcwMmUyZTg2YjhmM2FhYWM5MGQ0ODZhZThkNTU3NDc3Zjc2OTcxOGYzZWI4Mzg5
NDViNjk3YmNhZCAgaWZ1cGRvd25fMC44LjQ0LnRhci54egogIyBMb2NhbGx5IGNvbXB1dGVkCiBz
aGEyNTYgIDMyYjEwNjJmN2RhODQ5NjdlNzAxOWQwMWFiODA1OTM1Y2FhN2FiNzMyMWE3Y2VkMGUz
MGViZTc1ZTVkZjE2NzAgIENPUFlJTkcKZGlmZiAtLWdpdCBhL3BhY2thZ2UvaWZ1cGRvd24vaWZ1
cGRvd24ubWsgYi9wYWNrYWdlL2lmdXBkb3duL2lmdXBkb3duLm1rCmluZGV4IDE0YzM2ZGIwZGJj
Ni4uMzk1ZTQ2MjA4Mjk0IDEwMDY0NAotLS0gYS9wYWNrYWdlL2lmdXBkb3duL2lmdXBkb3duLm1r
CisrKyBiL3BhY2thZ2UvaWZ1cGRvd24vaWZ1cGRvd24ubWsKQEAgLTQsMTYgKzQsMTYgQEAKICMK
ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLUlGVVBET1dOX1ZFUlNJT04gPSAwLjguNDEKK0lG
VVBET1dOX1ZFUlNJT04gPSAwLjguNDQKIElGVVBET1dOX1NPVVJDRSA9IGlmdXBkb3duXyQoSUZV
UERPV05fVkVSU0lPTikudGFyLnh6Ci1JRlVQRE9XTl9TSVRFID0gaHR0cDovL3NuYXBzaG90LmRl
Ymlhbi5vcmcvYXJjaGl2ZS9kZWJpYW4vMjAyMzAyMjJUMjA1NjE1Wi9wb29sL21haW4vaS9pZnVw
ZG93bgorSUZVUERPV05fU0lURSA9IGh0dHA6Ly9zbmFwc2hvdC5kZWJpYW4ub3JnL2FyY2hpdmUv
ZGViaWFuLzIwMjQwOTE3VDE0NDUyMFovcG9vbC9tYWluL2kvaWZ1cGRvd24KIElGVVBET1dOX0xJ
Q0VOU0UgPSBHUEwtMi4wKwogSUZVUERPV05fTElDRU5TRV9GSUxFUyA9IENPUFlJTkcKIElGVVBE
T1dOX0NQRV9JRF9WRU5ET1IgPSBkZWJpYW4KIAogZGVmaW5lIElGVVBET1dOX0JVSUxEX0NNRFMK
IAkkKFRBUkdFVF9NQUtFX0VOVikgJChNQUtFKSAkKFRBUkdFVF9DT05GSUdVUkVfT1BUUykgXAot
CQlDRkxBR1M9IiQoVEFSR0VUX0NGTEFHUykgLXN0ZD1nbnU5OSAtRCdJRlVQRE9XTl9WRVJTSU9O
PVwiJChJRlVQRE9XTl9WRVJTSU9OKVwiJyIgXAorCQlDRkxBR1M9IiQoVEFSR0VUX0NGTEFHUykg
LXN0ZD1nbnU5OSAtRCdQS0dMSUJESVI9XCIvbGliL2lmdXBkb3duXCInIC1EJ0lGVVBET1dOX1ZF
UlNJT049XCIkKElGVVBET1dOX1ZFUlNJT04pXCInIiBcCiAJCUFSQ0g9bGludXggXAogCQktQyAk
KEBEKQogZW5kZWYKLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
