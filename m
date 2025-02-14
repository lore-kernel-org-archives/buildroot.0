Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5121C02198
	for <buildroot@archiver.kernel.org>; Fri, 14 Feb 2025 11:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED13941526;
	Fri, 14 Feb 2025 11:10:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6jy0nraeIEJw; Fri, 14 Feb 2025 11:10:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D7774144E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D7774144E;
	Fri, 14 Feb 2025 11:10:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EACB9C2
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 11:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E62E34130F
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 11:10:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PC9aV5jjfid3 for <buildroot@buildroot.org>;
 Fri, 14 Feb 2025 11:10:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 695DA40D6C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 695DA40D6C
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 695DA40D6C
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 11:10:48 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5de6e26d4e4so3631041a12.1
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 03:10:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739531446; x=1740136246;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sJ3tBSZlfu7/HKvq/MizoM6D8JBCh3RkvWV0PJMPUEQ=;
 b=F1Dy05oWjlQVWN2cfdajH0oGQpUXdM8QEeSJgr1mVr20pPOQzhRZjOg9sMPqrW057B
 3D6t11IjA9SYbecyIEhtQyCCoSmFJVHz6s5o8M8dVFmmhRuMyj/otbn4RL1PCA6sM6rw
 4o1Nt77lqk5qNiGueFRAJ3NTBEfG6tuRWOsDkxvfKUf8gVbZlHTwWNm54KNenbzr318b
 OUCKYuCUB7th91q7sUDoJvcySBOMd4aJewAaq/tFFlqIoqUpxyCbsGG4hCf1cNSVcyJL
 64nJniW3U1PcvD2/ClryLplKHr4/NzJCGGKWeCe8VDix9evJOMgYz4BkpYrSdipnZLqF
 7jqw==
X-Gm-Message-State: AOJu0YzL8//wac9HEDLAfoy9r8JI7P66rltvIFrkQ8o+gBf8XpqBgs5T
 AI3wyOpEMyDMaZymnErhCLx1gK/Go/aWu6Xrf/kmYYMqMVJsI2fmXOD0qXatczbiDeyCxMCqEqx
 pLOY=
X-Gm-Gg: ASbGnctMQzRHlPHrN5IUzP6QIfbasboslgvyocEl8PaR+7F0fp8LQsD45qCJpE2GlWT
 z6CwsfnL0cocyqrb7AKRnn0lG2Kmm8SZioe7nlWIzMTWfsqZxTY0y2VefBvIj/OXqfcLZrxkpt7
 D08z3mmhTaNPMsnOWAmfFCk0dcFzLDPjBP7wXze933zyYRCEh3AsvO2PhHHZeSKRe97P0vFrvCN
 1mb8t7+HB3xSj6sLmjvcnglyzuG+5RiXyEOY6YnBqCKVORHzSGiJRwNA41AiTVvE5IB6eFF3wdi
 YW1y9Q/EBtJiRLrB/w==
X-Google-Smtp-Source: AGHT+IGn4DEx94fUPkhE0Y8OB23hi/cufsJdBG2PLkDI6aylIhqJQz0lpgIwjT6VJnzva/Is08Ecag==
X-Received: by 2002:a17:906:c144:b0:ab3:4c32:aa6c with SMTP id
 a640c23a62f3a-ab7f339c969mr990303966b.20.1739531445640; 
 Fri, 14 Feb 2025 03:10:45 -0800 (PST)
Received: from draig.lan ([185.126.160.109]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba53259546sm324537666b.64.2025.02.14.03.10.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 03:10:44 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 26F235F7DF;
 Fri, 14 Feb 2025 11:10:44 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Fri, 14 Feb 2025 11:10:36 +0000
Message-Id: <20250214111044.4096837-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739531446; x=1740136246; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sJ3tBSZlfu7/HKvq/MizoM6D8JBCh3RkvWV0PJMPUEQ=;
 b=THSvvhPdC0cJ9SkJxFISKL3LoBO/TAc+8OmzaniTJ4S4VlKyNWsMWQuwB5Oj+KwKB6
 WAwiaS4Z4Mxdq9ji1ttDl7ekwNvm6dZJeby/KcDN4ApEUrLIWoA742lyPxpcUL+s+6Yi
 wO6C/g0NCcaw31sBuvSm5XpQfCnjJIgklWbKMvVBqlFhcUtQfuy413zjrFwEpl5+WUiL
 81sw48y5Q0ZI7boa8ji3d6GQgIDvfQ2drRDBLXBk2kQ9r1q74LLkypv5okuIugGB6z4V
 qwfAaNvwjt16T1c5hk1Hr7Ohrew1iMJmfSTeA6oFXL6RkjRDviAyZEGtiPffIKyY9Ld4
 mhgg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=THSvvhPd
Subject: [Buildroot] [PATCH v3 0/7] Add vkmark graphics benchmarking tool
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

SGksCgpUaGlzIGlzIGEgcmVzcGluIG9mIHRoZSB2MiBJIHNlbnQgYXQgdGhlIGVuZCBvZiBsYXN0
IHllYXIuIEkndmUKaW5jbHVkZWQgQmVybmQncyBtZXNhIHZlcnNpb24gYnVtcCBmb3IgY29udmVu
aWVuY2UgYXMgaXQgaXMgYWN0dWFsbHkKbmVlZGVkIGZvciB0aGUgVmVudXMvVmlydElPIGRyaXZl
ciBzdXBwb3J0IG1lcmdlZCBpbjoKCiAgZWYzNTQyNjRjZCAocGFja2FnZS9tZXNhM2Q6IGFkZCBv
cHRpb24gdG8gZW5hYmxlIFZJUlRJTyB2dWxrYW4gZHJpdmVyKQoKRm9yIHYzCiAgLSByZS1iYXNl
ZCBvbiBjdXJyZW50IG1hc3RlcgogIC0gbmV3IHZ1bGthbi1zZGsgcGFja2FnZSAoZm9yIHZvbGsg
bG9hZGVyKQogIC0gYnVtcCB2dWxrYW4gc3VwcG9ydCB0byAxLjQuMzA3CiAgLSBpbmNsdWRlIGlz
eXN0ZW0gcGF0Y2ggKG1heWJlIHNxdWFzaCB3aXRoIF4/KQogIC0gdmttYXJrIG5vdyBoYXMgYSB0
YWdnZWQgcmVsZWFzZSAoMjAyNS4wMSkKICAtIGFkZHJlc3NlZCByZXZpZXcgY29tbWVudHMgKHNl
ZSBpbmRpdmlkdWFsIHBhdGNoZXMpCgpGb3IgdjIKICAtIGFkZGVkIFNPRlRQSVBFIGZpeGVzICh0
aGVzZSBuZWVkIG1lcmdpbmcgaW50byBCZXJuZCdzIHNlcmllcykKICAtIGFkZHJlc3NlZCByZW1h
aW5pbmcgY29tbWVudHMgZm9yIGRlcGVuZGVuY2llcwogIC0gdHdlYWtlZCBhIGZldyBtb3JlIGRl
cGVuZGFuY2llcwogIC0gYWRkZWQgYSB2a21hcmsgdGVzdAoKVGhlIHRlc3Qgd29uJ3QgY3VycmVu
dGx5IHdvcmsgaWYgdGhlIHN5c3RlbSBRRU1VIGRvZXNuJ3Qgc3VwcG9ydCBWZW51cwp3aGljaCBy
ZXF1aXJlcyBRRU1VIDkuMi4wIChyZWxlYXNlZCAxMS8xMi8yMDI0KSBidWlsdCB3aXRoIGFuIHVw
dG8KZGF0ZSB2aXJnbHJlbmRlcmVyIChhdmFpbGFibGUgaW4gRGViaWFuIFRyaXhpZS9UZXN0aW5n
KS4gSXQgZG9lc24ndApoYXZlIHRvIGJlIG1lcmdlZCBub3cgYW5kIGNhbiB3YWl0IHVudGlsIHRo
ZSByZXN0IG9mIHRoZSB3b3JsZCBjYXRjaGVzCnVwLgoKSSBwbGFuIHRvIHVzZSBidWlsZHJvb3Qg
Z2VuZXJhdGVkIGltYWdlcyBmb3IgUUVNVSdzIG93biBmdW5jdGlvbmFsCnRlc3RzIGZvciBWZW51
cy4KCkkndmUgcnVuIHRocm91Z2g6CgogICB1dGlscy9kb2NrZXItcnVuIG1ha2UgY2hlY2stcGFj
a2FnZQoKYW5kIGV2ZXJ5dGhpbmcgbG9va3MgY2xlYW4uIEZ1bGwgZGV0YWlscyBhYm91dCB0aGUg
Y2hhbmdlcyBhcmUgYmVsbG93CnRoZSAtLS0ncyBpbiB0aGUgaW5kaXZpZHVhbCBjb21taXRzLgoK
QWxleCBCZW5uw6llICg2KToKICB0ZXN0aW5nOiBkcm9wIHVubmVlZGVkIHZnYS92bmMgc3Rhbnph
cyBmcm9tIFFFTVUgaW52b2NhdGlvbgogIHBhY2thZ2UvdnVsa2FuLXNkazogbmV3IHBhY2thZ2UK
ICBwYWNrYWdlL3Z1bGthbi1baGVhZGVyc3xsb2FkZXJ8dG9vbHNdOiBidW1wIHRvIDEuNC4zMDcg
cmVsZWFzZQogIHBhY2thZ2UvdnVsa2FuLXRvb2xzOiBzdXBwcmVzcyBpc3lzdGVtIGJlaW5nIHBh
c3NlZAogIHBhY2thZ2UvdmttYXJrOiBhZGQgdmttYXJrIGJlbmNobWFya2luZyB0b29sCiAgc3Vw
cG9ydC90ZXN0aW5nOiBhZGQgdGVzdCBmb3IgdmttYXJrIHBhY2thZ2UKCkJlcm5kIEt1aGxzICgx
KToKICBwYWNrYWdlL3ttZXNhM2QsIG1lc2EzZC1oZWFkZXJzfTogYnVtcCB2ZXJzaW9uIHRvIDI0
LjMuNAoKIENvbmZpZy5pbi5sZWdhY3kgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA3
ICsrCiBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMyAr
CiBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArCiBw
YWNrYWdlL21lc2EzZC1oZWFkZXJzL21lc2EzZC1oZWFkZXJzLm1rICAgICAgfCAgMiArLQogLi4u
dGlvbi10by1kaXNhYmxlLW9wdGlvbmFsLW5lb24tc3VwcG9yLnBhdGNoIHwgMTggKystLS0KIHBh
Y2thZ2UvbWVzYTNkL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICB8IDMyICsrKysrKy0t
CiBwYWNrYWdlL21lc2EzZC9tZXNhM2QuaGFzaCAgICAgICAgICAgICAgICAgICAgfCAgNiArLQog
cGFja2FnZS9tZXNhM2QvbWVzYTNkLm1rICAgICAgICAgICAgICAgICAgICAgIHwgNTggKysrKysr
KysrKystLS0tCiBwYWNrYWdlL3ZrbWFyay9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgICAg
fCA0OCArKysrKysrKysrKysKIHBhY2thZ2UvdmttYXJrL3ZrbWFyay5oYXNoICAgICAgICAgICAg
ICAgICAgICB8ICAzICsKIHBhY2thZ2UvdmttYXJrL3ZrbWFyay5tayAgICAgICAgICAgICAgICAg
ICAgICB8IDM0ICsrKysrKysrKwogcGFja2FnZS92dWxrYW4taGVhZGVycy92dWxrYW4taGVhZGVy
cy5oYXNoICAgIHwgIDIgKy0KIHBhY2thZ2UvdnVsa2FuLWhlYWRlcnMvdnVsa2FuLWhlYWRlcnMu
bWsgICAgICB8ICAyICstCiBwYWNrYWdlL3Z1bGthbi1sb2FkZXIvdnVsa2FuLWxvYWRlci5oYXNo
ICAgICAgfCAgMiArLQogcGFja2FnZS92dWxrYW4tc2RrL0NvbmZpZy5pbiAgICAgICAgICAgICAg
ICAgIHwgIDggKysKIHBhY2thZ2UvdnVsa2FuLXNkay92dWxrYW4tc2RrLmhhc2ggICAgICAgICAg
ICB8ICAzICsKIHBhY2thZ2UvdnVsa2FuLXNkay92dWxrYW4tc2RrLm1rICAgICAgICAgICAgICB8
IDE4ICsrKysrCiAuLi5hbmluZm8tc3VwcHJlc3MtaXN5c3RlbS1iZWluZy1wYXNzZWQucGF0Y2gg
fCA1NyArKysrKysrKysrKysrKwogcGFja2FnZS92dWxrYW4tdG9vbHMvdnVsa2FuLXRvb2xzLmhh
c2ggICAgICAgIHwgIDIgKy0KIHBhY2thZ2UvdnVsa2FuLXRvb2xzL3Z1bGthbi10b29scy5tayAg
ICAgICAgICB8ICAzICstCiBzdXBwb3J0L3Rlc3RpbmcvaW5mcmEvZW11bGF0b3IucHkgICAgICAg
ICAgICAgfCAgNCArLQogc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9mbHV0dGVy
LnB5IHwgIDQgKy0KIC4uLi90ZXN0cy9wYWNrYWdlL3Rlc3RfZ2xzbHNhbmRib3hfcGxheWVyLnB5
ICB8ICAyICstCiBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X2dseGluZm8ucHkg
fCAgMiArLQogc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9rbXNjdWJlLnB5IHwg
IDIgKy0KIC4uLi90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX3B5cXQ1LnB5ICAgICAgICB8ICAy
ICstCiBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3ZrbWFyay5weSAgfCA3NCAr
KysrKysrKysrKysrKysrKysrCiAuLi4vZXRjL3Byb2ZpbGUuZC8xMC14ZGctcnVudGltZS5zaCAg
ICAgICAgICAgfCAgMSArCiBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3dlc3Rv
bi5weSAgfCAgMiArLQogMjkgZmlsZXMgY2hhbmdlZCwgMzU2IGluc2VydGlvbnMoKyksIDQ3IGRl
bGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvdmttYXJrL0NvbmZpZy5pbgog
Y3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvdmttYXJrL3ZrbWFyay5oYXNoCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgcGFja2FnZS92a21hcmsvdmttYXJrLm1rCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFj
a2FnZS92dWxrYW4tc2RrL0NvbmZpZy5pbgogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvdnVs
a2FuLXNkay92dWxrYW4tc2RrLmhhc2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3Z1bGth
bi1zZGsvdnVsa2FuLXNkay5tawogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvdnVsa2FuLXRv
b2xzLzAwMDEtdnVsa2FuaW5mby1zdXBwcmVzcy1pc3lzdGVtLWJlaW5nLXBhc3NlZC5wYXRjaAog
Y3JlYXRlIG1vZGUgMTAwNjQ0IHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3Rfdmtt
YXJrLnB5CiBjcmVhdGUgbW9kZSAxMDA2NDQgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uv
dGVzdF92a21hcmsvcm9vdGZzLW92ZXJsYXkvZXRjL3Byb2ZpbGUuZC8xMC14ZGctcnVudGltZS5z
aAoKLS0gCjIuMzkuNQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
