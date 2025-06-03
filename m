Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C89C61CE7
	for <buildroot@archiver.kernel.org>; Tue,  3 Jun 2025 14:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A66204066F;
	Tue,  3 Jun 2025 14:01:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lPUqP4Nwf25u; Tue,  3 Jun 2025 14:01:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96003406F7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96003406F7;
	Tue,  3 Jun 2025 14:01:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BCFFA1F7
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 14:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41E4E8143B
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 14:01:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bc8wwmZqgTas for <buildroot@buildroot.org>;
 Tue,  3 Jun 2025 14:01:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4A11781839
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A11781839
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4A11781839
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 14:01:06 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ad56cbc7b07so862073266b.0
 for <buildroot@buildroot.org>; Tue, 03 Jun 2025 07:01:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748959263; x=1749564063;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G4Ec8k3gT2fc81M4iWz6mBf4xh7+hSXpoEVA1YNB4IA=;
 b=ELzJnXvO9Z2DCYHOHPemH7rDtVD3pLTdssNtj0CWOJ/2H1FWyNu1kW8j7FCY1RJHu1
 mpv7yFq82xCu/FEYawh6k9T/Tu1JHbBTUeI2GQDkRzhFazamW+xync7BaMn7K4JDaydy
 vtLKTjF07mtnCPMwQlRgB3es3Mv+l3+mDx0cTz9cS6tqPsro6B5WQolrrTcwwz7vEA/g
 2nHRyQVz9MUJ/8MFLzHBS9lLQa6zLVxJwxHz7GfQavqX9gqLPB3JLeUb6K4Vwy2P7e7u
 e/Z9dWWJZk8gMHnzz8rxYxk33IKG+wbrLVaJyHZ8xg6pF3GguRHhY09xHfCh7ah9I/6G
 RfrQ==
X-Gm-Message-State: AOJu0YwRhnAiCJR8SrBSfBWvIJBS1zcyPSALinszHc9I7wKEuc8i7+zg
 5A0c691Sb2iY3yABmKINXonVCp86wazTM77RI203WuhDIIQ/KIkQSw9Y/qaDeik+1/W6RTbN8MX
 nHRQqTf0=
X-Gm-Gg: ASbGncs2ZUErA/8vY9UE6Z8Oiu/34ClaAn7b/wPqscCDNG1hLAXIUfEHkADCU/IU32D
 Pi4a+ufLigZmG/cqjQ3tEKDtfhxMgrMKQtk2Oi65vZvDHjxUsWvvxr//k2tCCjsWZW0YgFk5ARR
 gmwMN3kdVPECy3rHrWUVq0TYL8Z/lBRUXlkTHurqPJKjKJfHI9/blUWu3dJyDFhCQffItfk5l5g
 t+njQuaoBclqweDYNiOBbwq3R7zvqAXNGUpW5y4nGIR8wDBE5BIAiT9MqWtbLbkyYQWR55dksl6
 yifDEs/swREjoNjpCEv5t6EvPHOB+Z5l5/2jMcXXqL8Irop7ySIs
X-Google-Smtp-Source: AGHT+IH8vZUlnkYCfZLnql/TF/ocMd7rUPcsyyfdTC/rE0BNqaK9pACG5HPqLYkxoNkaFeayhEDYyA==
X-Received: by 2002:a17:907:7212:b0:ad8:9257:5733 with SMTP id
 a640c23a62f3a-adb493cbf58mr1354686866b.20.1748959262782; 
 Tue, 03 Jun 2025 07:01:02 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ada5d7febffsm954353666b.2.2025.06.03.07.01.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 07:01:02 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 6BBEC5F839;
 Tue, 03 Jun 2025 15:01:00 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Tue,  3 Jun 2025 15:00:54 +0100
Message-ID: <20250603140100.1910123-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748959263; x=1749564063; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=G4Ec8k3gT2fc81M4iWz6mBf4xh7+hSXpoEVA1YNB4IA=;
 b=B9CiwXJHTz5pB08o3oIExDG1gCwMuBV9bvZoArRMJtwsRyLvj9lnLyzVM5Odi0aG/9
 zDpa3hfzfW42pFlfzIzOhwiLIoNJJjHrTkNmJv0o47znnlwc/y5amirnXhuLMbIv3FMG
 oPm3FbeFL44gz3Z3CKGbLxcbqWRkTSz4jEyghxCkiILxCvJfcpQ2XSImr0b45QR1y10m
 ef9rT1iU4bk+G/CtAC/cWBs/xgkJWpMWcZNm3mJN4Tv46uGlNaAhkS729AE3rsGzQa3U
 +z0BcfAumLz0t+JyjXo+3MkhCKMbB0gCcrUnuxxnhYTtDhGEvVIPdkQUjZ0Z+g+zjCOa
 5bQQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=B9CiwXJH
Subject: [Buildroot] [PATCH v5 0/4] Add vkmark graphics benchmarking tool
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpOb3cgdGhhdCB0aGUgTWVzYSBiaXRzIGhhdmUgYmVlbiBtZXJnZWQgdGhlIHNlcmllcyBp
cyBjb25zaWRlcmFibHkKc2hvcnRlci4gSSd2ZSB1cC1yZXZ2ZWQgYSB2dWxrYW4taGVhZGVyL2xv
YWRlci90b29scyBsaWJyYXJ5IHdoaWNoCmFsc28gc2VlbXMgdG8gaGF2ZSBzb2x2ZWQgc29tZSBv
ZiB0aGUgY3Jvc3MgYnVpbGRpbmcgYml0cyBzbyBJIG5vCmxvbmdlciBuZWVkIHRoZSBoYWNreSBw
YXRjaC4KCkkndmUgYWxzbyBzaW1wbGlmaWVkIHRoZSBUZXN0VmtNYXJrIHRlc3Qgc28gaXQgd2ls
bCB3b3JrIHdpdGggYW4KdW4tYWNjZWxlcmF0ZWQgZGlzcGxheSBhbmQgc2ltcGx5IHRlc3Qgdmtt
YXJrIHdvcmtzLgoKRm9yIHY1CiAgLSByZWJhc2UKICAtIGRyb3AgdW5uZWVkZWQgcGF0Y2hlcwog
IC0gZHJvcCBhbHJlYWR5IG1lcmdlZCBwYXRjaGVzCiAgLSB0d2VhayB0aGUgdGVzdAoKRm9yIHY0
CiAgLSBuZXcgcGF0Y2ggdG8gdmttYXJrIHRvIHJ1biB1bmRlciBWaXJ0SU8KICAtIHNlZSBpbmRp
dmlkdWFsIHBhdGNoZXMgZm9yIG90aGVyIHVwZGF0ZXMKCkZvciB2MwogIC0gcmUtYmFzZWQgb24g
Y3VycmVudCBtYXN0ZXIKICAtIG5ldyB2dWxrYW4tc2RrIHBhY2thZ2UgKGZvciB2b2xrIGxvYWRl
cikKICAtIGJ1bXAgdnVsa2FuIHN1cHBvcnQgdG8gMS40LjMwNwogIC0gaW5jbHVkZSBpc3lzdGVt
IHBhdGNoIChtYXliZSBzcXVhc2ggd2l0aCBePykKICAtIHZrbWFyayBub3cgaGFzIGEgdGFnZ2Vk
IHJlbGVhc2UgKDIwMjUuMDEpCiAgLSBhZGRyZXNzZWQgcmV2aWV3IGNvbW1lbnRzIChzZWUgaW5k
aXZpZHVhbCBwYXRjaGVzKQoKRm9yIHYyCiAgLSBhZGRlZCBTT0ZUUElQRSBmaXhlcyAodGhlc2Ug
bmVlZCBtZXJnaW5nIGludG8gQmVybmQncyBzZXJpZXMpCiAgLSBhZGRyZXNzZWQgcmVtYWluaW5n
IGNvbW1lbnRzIGZvciBkZXBlbmRlbmNpZXMKICAtIHR3ZWFrZWQgYSBmZXcgbW9yZSBkZXBlbmRh
bmNpZXMKICAtIGFkZGVkIGEgdmttYXJrIHRlc3QKClRoZSB0ZXN0IHdvbid0IGN1cnJlbnRseSB3
b3JrIGlmIHRoZSBzeXN0ZW0gUUVNVSBkb2Vzbid0IHN1cHBvcnQgVmVudXMKd2hpY2ggcmVxdWly
ZXMgUUVNVSA5LjIuMCAocmVsZWFzZWQgMTEvMTIvMjAyNCkgYnVpbHQgd2l0aCBhbiB1cHRvCmRh
dGUgdmlyZ2xyZW5kZXJlciAoYXZhaWxhYmxlIGluIERlYmlhbiBUcml4aWUvVGVzdGluZykuIEl0
IGRvZXNuJ3QKaGF2ZSB0byBiZSBtZXJnZWQgbm93IGFuZCBjYW4gd2FpdCB1bnRpbCB0aGUgcmVz
dCBvZiB0aGUgd29ybGQgY2F0Y2hlcwp1cC4KCkkgcGxhbiB0byB1c2UgYnVpbGRyb290IGdlbmVy
YXRlZCBpbWFnZXMgZm9yIFFFTVUncyBvd24gZnVuY3Rpb25hbAp0ZXN0cyBmb3IgVmVudXMuCgpJ
J3ZlIHJ1biB0aHJvdWdoOgoKICAgdXRpbHMvZG9ja2VyLXJ1biBtYWtlIGNoZWNrLXBhY2thZ2UK
CmFuZCBldmVyeXRoaW5nIGxvb2tzIGNsZWFuLiBGdWxsIGRldGFpbHMgYWJvdXQgdGhlIGNoYW5n
ZXMgYXJlIGJlbGxvdwp0aGUgLS0tJ3MgaW4gdGhlIGluZGl2aWR1YWwgY29tbWl0cy4KCkFsZXgg
QmVubsOpZSAoNCk6CiAgcGFja2FnZS92dWxrYW4tc2RrOiBuZXcgcGFja2FnZQogIHBhY2thZ2Uv
dnVsa2FuLVtoZWFkZXJzfGxvYWRlcnx0b29sc106IGJ1bXAgdG8gMS40LjMxNiByZWxlYXNlCiAg
cGFja2FnZS92a21hcms6IGFkZCB2a21hcmsgYmVuY2htYXJraW5nIHRvb2wKICBzdXBwb3J0L3Rl
c3Rpbmc6IGFkZCB0ZXN0IGZvciB2a21hcmsgcGFja2FnZQoKIERFVkVMT1BFUlMgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAzICsKIHBhY2thZ2UvQ29uZmlnLmluICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAyICsKIHBhY2thZ2UvdmttYXJrL0NvbmZpZy5pbiAg
ICAgICAgICAgICAgICAgICAgICB8IDQ4ICsrKysrKysrKysrCiBwYWNrYWdlL3ZrbWFyay92a21h
cmsuaGFzaCAgICAgICAgICAgICAgICAgICAgfCAgMyArCiBwYWNrYWdlL3ZrbWFyay92a21hcmsu
bWsgICAgICAgICAgICAgICAgICAgICAgfCAzNCArKysrKysrKwogcGFja2FnZS92dWxrYW4taGVh
ZGVycy92dWxrYW4taGVhZGVycy5oYXNoICAgIHwgIDIgKy0KIHBhY2thZ2UvdnVsa2FuLWhlYWRl
cnMvdnVsa2FuLWhlYWRlcnMubWsgICAgICB8ICAyICstCiBwYWNrYWdlL3Z1bGthbi1sb2FkZXIv
dnVsa2FuLWxvYWRlci5oYXNoICAgICAgfCAgMiArLQogcGFja2FnZS92dWxrYW4tc2RrL0NvbmZp
Zy5pbiAgICAgICAgICAgICAgICAgIHwgIDggKysKIHBhY2thZ2UvdnVsa2FuLXNkay92dWxrYW4t
c2RrLmhhc2ggICAgICAgICAgICB8ICAzICsKIHBhY2thZ2UvdnVsa2FuLXNkay92dWxrYW4tc2Rr
Lm1rICAgICAgICAgICAgICB8IDE4ICsrKysrCiBwYWNrYWdlL3Z1bGthbi10b29scy9Db25maWcu
aW4gICAgICAgICAgICAgICAgfCAgMyArLQogcGFja2FnZS92dWxrYW4tdG9vbHMvdnVsa2FuLXRv
b2xzLmhhc2ggICAgICAgIHwgIDIgKy0KIHBhY2thZ2UvdnVsa2FuLXRvb2xzL3Z1bGthbi10b29s
cy5tayAgICAgICAgICB8ICAzICstCiBzdXBwb3J0L3Rlc3RpbmcvaW5mcmEvZW11bGF0b3IucHkg
ICAgICAgICAgICAgfCAgNCArLQogc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF92
a21hcmsucHkgIHwgODAgKysrKysrKysrKysrKysrKysrKwogLi4uL2V0Yy9wcm9maWxlLmQvMTAt
eGRnLXJ1bnRpbWUuc2ggICAgICAgICAgIHwgIDEgKwogMTcgZmlsZXMgY2hhbmdlZCwgMjExIGlu
c2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS92
a21hcmsvQ29uZmlnLmluCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS92a21hcmsvdmttYXJr
Lmhhc2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3ZrbWFyay92a21hcmsubWsKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3Z1bGthbi1zZGsvQ29uZmlnLmluCiBjcmVhdGUgbW9kZSAx
MDA2NDQgcGFja2FnZS92dWxrYW4tc2RrL3Z1bGthbi1zZGsuaGFzaAogY3JlYXRlIG1vZGUgMTAw
NjQ0IHBhY2thZ2UvdnVsa2FuLXNkay92dWxrYW4tc2RrLm1rCiBjcmVhdGUgbW9kZSAxMDA2NDQg
c3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF92a21hcmsucHkKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3ZrbWFyay9yb290ZnMt
b3ZlcmxheS9ldGMvcHJvZmlsZS5kLzEwLXhkZy1ydW50aW1lLnNoCgotLSAKMi40Ny4yCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
