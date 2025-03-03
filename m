Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C66C282CD
	for <buildroot@archiver.kernel.org>; Mon,  3 Mar 2025 16:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49D03606F5;
	Mon,  3 Mar 2025 16:16:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8efngHyYr7qZ; Mon,  3 Mar 2025 16:16:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E61B60763
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E61B60763;
	Mon,  3 Mar 2025 16:16:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 38787944
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 16:16:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 235F46077F
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 16:16:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hGaErTQo0UlC for <buildroot@buildroot.org>;
 Mon,  3 Mar 2025 16:16:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3D65560607
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D65560607
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3D65560607
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 16:16:01 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43995b907cfso29657065e9.3
 for <buildroot@buildroot.org>; Mon, 03 Mar 2025 08:16:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741018559; x=1741623359;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H6oC23/YxjkP0f4EbqLhR6EYvDlSWRZ4bkp+mEfC0uw=;
 b=EtbPN0rroE/J59AnFB644fq/9pmPQf0WxFBmTIcxPuOa5TzabvPXi/Hq4g2qeG04Dg
 NvHZqFWwzgDHPa3nV+CEttqkPC4CJ2t3umxOT16zHrHpjD+ueksrJKSZOHwsaFtrX0Jn
 8uaWiA9tL61ojlHVn8/VUams6eyIYIsOT9ViEWg21fEnwL/LDbnxYhHNnTYFGWwImB+1
 gRmT+2S2n+PXPeVI6bN9PZ7iwNOqcIgRfCQWlhfHPt/bfCNyoq9aptojv24yot4H9wC1
 I4jHheE1S2079zqfcbBzjvlikmqKITkNtm4QIE7uytQvUEas5btObHr8Td7SHxC1pxfW
 7mHw==
X-Gm-Message-State: AOJu0Yy3CypopviiJRCi2aOQSNuvHjJ0U+LJa3p7ozCkjdGQ2ojQPYIE
 OZX122xMgMuUpWXZUwvkXvbj+u39GxImUi/2cF6RKDRaBd/5xFyP4WSAgHEffDDCm11vWFWh97W
 xuQw=
X-Gm-Gg: ASbGncslG8EcY+x1E7DHutOpFhuDF1h1qx9pVFJRArVjFL83AbBbvKJcwo72sC7ZFY2
 SuijwlaGWqYcn74yY9/8SZgYF7LjXBOkRB2PhP4v+mKTsZmcljWaRMlRSC1U0FemnQu5BIgUN3z
 1lNRGu+mGLjK5LquA7hwCgxAYm0k/ZIgK+fB6S1isBVsdRVHzLqBsPT08xRDjwT2/2F4YuroQ8V
 E4WZAGlsVTdJRAkqy4QprrngHPFbh5bmAuGW50FNRoX5+lmXUB6eemcnx1SORpppjUwp2RgQNB5
 icTWIDEOhj1PXK5SenkI11yCA7ULC6DH1/zwWn8+HAed4JM=
X-Google-Smtp-Source: AGHT+IE8EbapTW7KUG/DBi+39X4/MEQqRX1WJZ15D+r9Qf17cQcXpp+EWDEFTRhbnY4klbAS2zr+vA==
X-Received: by 2002:a05:600c:4e93:b0:43b:c878:1466 with SMTP id
 5b1f17b1804b1-43bc8781546mr17780675e9.8.1741018558881; 
 Mon, 03 Mar 2025 08:15:58 -0800 (PST)
Received: from draig.lan ([185.126.160.109]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43b694524c6sm170676115e9.0.2025.03.03.08.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 08:15:58 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 9D5C75F938;
 Mon,  3 Mar 2025 16:15:57 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Mon,  3 Mar 2025 16:15:51 +0000
Message-Id: <20250303161557.571619-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741018559; x=1741623359; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=H6oC23/YxjkP0f4EbqLhR6EYvDlSWRZ4bkp+mEfC0uw=;
 b=VzwkcZxsJKHR0Nl0zLAiUpyG+T1BsHHzuObMsBDAGjJEO9zWgUTxnLa7Jl8mqjrcTU
 xM3U8l3PUtrAGV4t+v6BLSroa0iNofISDObnUpGHO1IMUNBFzvi0bdq2/7OfkWbFRuqw
 /P+rFipMdh2yLLIvvvajJygtcsbBRshRRpkKWbhLEh5BH9fWpC/AFzm43C+EJ/Yl5tBd
 JRRPxnuzlTgZXxThoulcM91/c29IkkXBRRm0H295L7PXiIGJMsC76QxgF+SeIAElBkTF
 iBbhjHnsbbPOUQIZjLg1SCwBpZdGMM0ke2aq4UGRZhGO1TtzZ7dZrd4VKTGg1/iMddCS
 XaIQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=VzwkcZxs
Subject: [Buildroot] [PATCH v4 0/6] Add vkmark graphics benchmarking tool
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

SGksCgpUaGlzIGlzIGEgbmV3IHZlcnNpb24gYWZ0ZXIgYXBwbHlpbmcgdGhlIHJldmlldyBjb21t
ZW50cyBmcm9tIHYzLiBBcwppdCBuZWVkcyBhIG5ld2VyIE1lc2EgaXQgbmVlZHMgdG8gYmUgYmFz
ZWQgb24gQmVybmQncyBzZXJpZXM6CgogIFN1YmplY3Q6IFtCdWlsZHJvb3RdIFtQQVRDSCB2MiAx
LzVdIHBhY2thZ2UvbGliZHJtOiBhZGQgaG9zdCB2YXJpYW50CiAgTWVzc2FnZS1JZDogPDIwMjUw
MjIxMTY0NDIyLjQ3MDYwLTEtYmVybmRAa3VobHMubmV0PgogIERhdGU6IEZyaSwgMjEgRmViIDIw
MjUgMTc6NDQ6MTggKzAxMDAKICBGcm9tOiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgoK
Rm9yIGNvbnZlbmllbmNlIHlvdSBjYW4gZmluZCBteSBjdXJyZW50IHdvcmtpbmcgYnJhbmNoIGF0
OgoKICBodHRwczovL2dpdGxhYi5jb20vc3RzcXVhZC9idWlsZHJvb3QvLS90cmVlL2FkZC12aXJ0
aW8tdnVsa2FuLXZrbWFyaz9yZWZfdHlwZT1oZWFkcwoKd2hpY2ggaW5jbHVkZXMgQmVybmQncyBz
ZXJpZXMgYW5kIGlzIGJhc2VkIG9uIG1hc3RlcjoKCiAgYTAzMWI1MTYzNyAqIG9yaWdpbi9tYXN0
ZXIgMjAyNS4wMi1yYzEgVXBkYXRlIGZvciAyMDI1LjAyLXJjMQoKRm9yIHY0CiAgLSBuZXcgcGF0
Y2ggdG8gdmttYXJrIHRvIHJ1biB1bmRlciBWaXJ0SU8KICAtIHNlZSBpbmRpdmlkdWFsIHBhdGNo
ZXMgZm9yIG90aGVyIHVwZGF0ZXMKCkZvciB2MwogIC0gcmUtYmFzZWQgb24gY3VycmVudCBtYXN0
ZXIKICAtIG5ldyB2dWxrYW4tc2RrIHBhY2thZ2UgKGZvciB2b2xrIGxvYWRlcikKICAtIGJ1bXAg
dnVsa2FuIHN1cHBvcnQgdG8gMS40LjMwNwogIC0gaW5jbHVkZSBpc3lzdGVtIHBhdGNoIChtYXli
ZSBzcXVhc2ggd2l0aCBePykKICAtIHZrbWFyayBub3cgaGFzIGEgdGFnZ2VkIHJlbGVhc2UgKDIw
MjUuMDEpCiAgLSBhZGRyZXNzZWQgcmV2aWV3IGNvbW1lbnRzIChzZWUgaW5kaXZpZHVhbCBwYXRj
aGVzKQoKRm9yIHYyCiAgLSBhZGRlZCBTT0ZUUElQRSBmaXhlcyAodGhlc2UgbmVlZCBtZXJnaW5n
IGludG8gQmVybmQncyBzZXJpZXMpCiAgLSBhZGRyZXNzZWQgcmVtYWluaW5nIGNvbW1lbnRzIGZv
ciBkZXBlbmRlbmNpZXMKICAtIHR3ZWFrZWQgYSBmZXcgbW9yZSBkZXBlbmRhbmNpZXMKICAtIGFk
ZGVkIGEgdmttYXJrIHRlc3QKClRoZSB0ZXN0IHdvbid0IGN1cnJlbnRseSB3b3JrIGlmIHRoZSBz
eXN0ZW0gUUVNVSBkb2Vzbid0IHN1cHBvcnQgVmVudXMKd2hpY2ggcmVxdWlyZXMgUUVNVSA5LjIu
MCAocmVsZWFzZWQgMTEvMTIvMjAyNCkgYnVpbHQgd2l0aCBhbiB1cHRvCmRhdGUgdmlyZ2xyZW5k
ZXJlciAoYXZhaWxhYmxlIGluIERlYmlhbiBUcml4aWUvVGVzdGluZykuIEl0IGRvZXNuJ3QKaGF2
ZSB0byBiZSBtZXJnZWQgbm93IGFuZCBjYW4gd2FpdCB1bnRpbCB0aGUgcmVzdCBvZiB0aGUgd29y
bGQgY2F0Y2hlcwp1cC4KCkkgcGxhbiB0byB1c2UgYnVpbGRyb290IGdlbmVyYXRlZCBpbWFnZXMg
Zm9yIFFFTVUncyBvd24gZnVuY3Rpb25hbAp0ZXN0cyBmb3IgVmVudXMuCgpJJ3ZlIHJ1biB0aHJv
dWdoOgoKICAgdXRpbHMvZG9ja2VyLXJ1biBtYWtlIGNoZWNrLXBhY2thZ2UKCmFuZCBldmVyeXRo
aW5nIGxvb2tzIGNsZWFuLiBGdWxsIGRldGFpbHMgYWJvdXQgdGhlIGNoYW5nZXMgYXJlIGJlbGxv
dwp0aGUgLS0tJ3MgaW4gdGhlIGluZGl2aWR1YWwgY29tbWl0cy4KCkFsZXggQmVubsOpZSAoNik6
CiAgdGVzdGluZzogZHJvcCB1bm5lZWRlZCB2Z2Evdm5jIHN0YW56YXMgZnJvbSBRRU1VIGludm9j
YXRpb24KICBwYWNrYWdlL3Z1bGthbi1zZGs6IG5ldyBwYWNrYWdlCiAgcGFja2FnZS92dWxrYW4t
W2hlYWRlcnN8bG9hZGVyfHRvb2xzXTogYnVtcCB0byAxLjQuMzA3IHJlbGVhc2UKICBwYWNrYWdl
L3Z1bGthbi10b29sczogc3VwcHJlc3MgaXN5c3RlbSBiZWluZyBwYXNzZWQKICBwYWNrYWdlL3Zr
bWFyazogYWRkIHZrbWFyayBiZW5jaG1hcmtpbmcgdG9vbAogIHN1cHBvcnQvdGVzdGluZzogYWRk
IHRlc3QgZm9yIHZrbWFyayBwYWNrYWdlCgogREVWRUxPUEVSUyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDMgKwogcGFja2FnZS9Db25maWcuaW4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDIgKwogLi4uLWhhbmRsZS1WdWxrYW4tZXJyb3JzLWR1cmluZy1wcm9i
aW5nLnBhdGNoIHwgNzcgKysrKysrKysrKysrKysrKysrKwogcGFja2FnZS92a21hcmsvQ29uZmln
LmluICAgICAgICAgICAgICAgICAgICAgIHwgNDggKysrKysrKysrKysrCiBwYWNrYWdlL3ZrbWFy
ay92a21hcmsuaGFzaCAgICAgICAgICAgICAgICAgICAgfCAgMyArCiBwYWNrYWdlL3ZrbWFyay92
a21hcmsubWsgICAgICAgICAgICAgICAgICAgICAgfCAzNCArKysrKysrKwogcGFja2FnZS92dWxr
YW4taGVhZGVycy92dWxrYW4taGVhZGVycy5oYXNoICAgIHwgIDIgKy0KIHBhY2thZ2UvdnVsa2Fu
LWhlYWRlcnMvdnVsa2FuLWhlYWRlcnMubWsgICAgICB8ICAyICstCiBwYWNrYWdlL3Z1bGthbi1s
b2FkZXIvdnVsa2FuLWxvYWRlci5oYXNoICAgICAgfCAgMiArLQogcGFja2FnZS92dWxrYW4tc2Rr
L0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgIHwgIDggKysKIHBhY2thZ2UvdnVsa2FuLXNkay92
dWxrYW4tc2RrLmhhc2ggICAgICAgICAgICB8ICAzICsKIHBhY2thZ2UvdnVsa2FuLXNkay92dWxr
YW4tc2RrLm1rICAgICAgICAgICAgICB8IDE4ICsrKysrCiAuLi5hbmluZm8tc3VwcHJlc3MtaXN5
c3RlbS1iZWluZy1wYXNzZWQucGF0Y2ggfCA1NyArKysrKysrKysrKysrKwogcGFja2FnZS92dWxr
YW4tdG9vbHMvQ29uZmlnLmluICAgICAgICAgICAgICAgIHwgIDMgKy0KIHBhY2thZ2UvdnVsa2Fu
LXRvb2xzL3Z1bGthbi10b29scy5oYXNoICAgICAgICB8ICAyICstCiBwYWNrYWdlL3Z1bGthbi10
b29scy92dWxrYW4tdG9vbHMubWsgICAgICAgICAgfCAgMyArLQogc3VwcG9ydC90ZXN0aW5nL2lu
ZnJhL2VtdWxhdG9yLnB5ICAgICAgICAgICAgIHwgIDQgKy0KIHN1cHBvcnQvdGVzdGluZy90ZXN0
cy9wYWNrYWdlL3Rlc3RfZmx1dHRlci5weSB8ICAyIC0KIHN1cHBvcnQvdGVzdGluZy90ZXN0cy9w
YWNrYWdlL3Rlc3RfdmttYXJrLnB5ICB8IDc0ICsrKysrKysrKysrKysrKysrKwogLi4uL2V0Yy9w
cm9maWxlLmQvMTAteGRnLXJ1bnRpbWUuc2ggICAgICAgICAgIHwgIDEgKwogMjAgZmlsZXMgY2hh
bmdlZCwgMzM5IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2
NDQgcGFja2FnZS92a21hcmsvMDAwMS1kaXNwbGF5LVByb3Blcmx5LWhhbmRsZS1WdWxrYW4tZXJy
b3JzLWR1cmluZy1wcm9iaW5nLnBhdGNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS92a21h
cmsvQ29uZmlnLmluCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS92a21hcmsvdmttYXJrLmhh
c2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3ZrbWFyay92a21hcmsubWsKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBwYWNrYWdlL3Z1bGthbi1zZGsvQ29uZmlnLmluCiBjcmVhdGUgbW9kZSAxMDA2
NDQgcGFja2FnZS92dWxrYW4tc2RrL3Z1bGthbi1zZGsuaGFzaAogY3JlYXRlIG1vZGUgMTAwNjQ0
IHBhY2thZ2UvdnVsa2FuLXNkay92dWxrYW4tc2RrLm1rCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFj
a2FnZS92dWxrYW4tdG9vbHMvMDAwMS12dWxrYW5pbmZvLXN1cHByZXNzLWlzeXN0ZW0tYmVpbmct
cGFzc2VkLnBhdGNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3Bh
Y2thZ2UvdGVzdF92a21hcmsucHkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBzdXBwb3J0L3Rlc3Rpbmcv
dGVzdHMvcGFja2FnZS90ZXN0X3ZrbWFyay9yb290ZnMtb3ZlcmxheS9ldGMvcHJvZmlsZS5kLzEw
LXhkZy1ydW50aW1lLnNoCgotLSAKMi4zOS41CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
