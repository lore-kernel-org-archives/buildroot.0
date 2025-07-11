Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0405FC83F1A
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 16:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C68AC41138;
	Fri, 11 Jul 2025 16:44:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KJnalRbTcC1o; Fri, 11 Jul 2025 16:44:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91EB94112F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91EB94112F;
	Fri, 11 Jul 2025 16:44:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 74109199
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 16:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC86360898
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 16:44:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JQFWssi1kjdJ for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 16:44:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 12051608A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12051608A0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 12051608A0
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 16:44:17 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a6cd1a6fecso2307181f8f.3
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 09:44:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752252256; x=1752857056;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TR9UxvQ55JPMf8BZyRMn1KP078GxtzrMoXthIYZ6LMc=;
 b=DfqJfyYaWHZPlgOfZEoVoI3eBlSFhCn+6t65+30WbWFllRJ8s7V4WzZ5f5kpeabJgd
 E2+HJJQnAmMPHHiiHXvBrv/fqL6cwIONFQ3XHLhbz8H1WAiFVjZR5IAHweCcIbqZBR9/
 U/h2DVr2GON6JR3gWEADwWwiukJXPdTlnTL2TOXPlNU3uRU/Iuzd87EpoYK2Etjjak6q
 XuxuT2gTP4OHvS3fLCpXl+yqcZwxn5Mx7/sFClIfLpVUw8nHQ9fgB4/i4f9wgOSyWBeW
 XB5MEjJ9AUovLa7eACBazr+Aei+nLRbf2ToFeJAPxN/61kr0vMFslZDuaxbU5RBAD28I
 ffnw==
X-Gm-Message-State: AOJu0YzHt19sspchnvS9i2g3f74aC1IX5yZnGl9psDxFd6RHqugB8di9
 YdIpZOD4rnjyGkML/5Rm+1+eQ+Em1g+p9s5UOk2tMVdomrETgaCfNbF0BljNtqpvyWLlW2Vq/SD
 T4UA4ylI=
X-Gm-Gg: ASbGncs8gmV7I47n0eDQoG/ASD6GKR+4f8JT8ioOzrf6zX7gEQVOi0V8qRnFeaD7+JO
 d5xByn7fYtTdscnjMAmYJoZ1vz1N8ky6kwDBASDrFaNyrhtSizVRpjF7V/mslqCmqIFlqliawVY
 3oLOX7E++QeDlkegaLwp6S3YHFohQkGBg2CRykdRwLRKH9Nhb4igm2gtyeDjQS+hyfOyT5B8Iyg
 4EQKb5LADKGYYViT8DKCPGV+T5/UZkW+I3kbDf/WvV8apSv85WoTSHNx/RCRNAm8qZmnb1q1vmB
 VHt4RtgtynbAYJ3+DfOazITEVf/05OOuQnlKwyl+A+94fULPGark7tWOCb44g4MRR3zqN5e4frM
 dw1WF7JaczIo+kzp0eW+6UTxuJCUePz+MtQ==
X-Google-Smtp-Source: AGHT+IH6se4Fny22Jegts2kJgp8+Vp/S8Sld/p/Lyot2JbCEc3BcxeF9/gcjZQS6LSxTbZ6bvqIZMQ==
X-Received: by 2002:adf:9dc5:0:b0:3a5:8905:2dda with SMTP id
 ffacd0b85a97d-3b5f18962aemr3857934f8f.43.1752252255678; 
 Fri, 11 Jul 2025 09:44:15 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454cd4f398csm77787735e9.2.2025.07.11.09.44.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 09:44:13 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 32F875F81E;
 Fri, 11 Jul 2025 17:44:09 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Fri, 11 Jul 2025 17:44:05 +0100
Message-ID: <20250711164407.799041-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250711164407.799041-1-alex.bennee@linaro.org>
References: <20250711164407.799041-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752252256; x=1752857056; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TR9UxvQ55JPMf8BZyRMn1KP078GxtzrMoXthIYZ6LMc=;
 b=in3Kah0+WujqvZWQEvA2TJSQkirKGbN23sez+W2lHaoR7FFNtZXEW92yGjBQ+0TYvk
 Fv7n5CA+FuuKUQdWdehPTjraFAV5wCQwemxEmkPrgVhNwykucK/Ys9In4jPyUXcFuHN6
 uq18lUbqd7dcxT6Eac1jP37kUAqGQnN6s0EDCnK3xbBEZX52sufNZTcltDyqDFu97q/v
 KuQJ4q0CpiU9bTJHEWDzHtNdG32bwxlXtKJMpfd8lxqw7WNDMFeaStFoh6bb6Pl0glCw
 0OsuKGw/FQsMbyyovZak4bxzXJYVHrMGuubWyaKNOe3RzyCES0MCpuZE5awV79sRBjMk
 xVFQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=in3Kah0+
Subject: [Buildroot] [RFC PATCH v2 7/7] support/testing: add test for
 kvm-unit-tests
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Tm93IHdlIGhhdmUgdXBkYXRlZCBrdm0tdW5pdC10ZXN0cyB3ZSBzaG91bGQgZGVmZW5kIGl0IHdp
dGggYSB0ZXN0LiBUbwpzdXBwb3J0IHRoYXQgZW5hYmxlIEtWTSBpbiB0aGUgcWVtdSBrZXJuZWwg
Y29uZmlnIGFuZCBib290IGFuIGltYWdlCndoZXJlIHdlIGNhbiBydW4gdGhlIGJhc2ljIHRlc3Rz
LgoKU2lnbmVkLW9mZi1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgot
LS0KIGJvYXJkL3FlbXUvYWFyY2g2NC12aXJ0L2xpbnV4LmNvbmZpZyAgICAgIHwgIDIgKwogc3Vw
cG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9rdm0ucHkgfCA0NyArKysrKysrKysrKysr
KysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA0OSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9rdm0ucHkKCmRpZmYg
LS1naXQgYS9ib2FyZC9xZW11L2FhcmNoNjQtdmlydC9saW51eC5jb25maWcgYi9ib2FyZC9xZW11
L2FhcmNoNjQtdmlydC9saW51eC5jb25maWcKaW5kZXggOTcxYjlmY2Y4Ni4uOWQxOTM0YzY0OCAx
MDA2NDQKLS0tIGEvYm9hcmQvcWVtdS9hYXJjaDY0LXZpcnQvbGludXguY29uZmlnCisrKyBiL2Jv
YXJkL3FlbXUvYWFyY2g2NC12aXJ0L2xpbnV4LmNvbmZpZwpAQCAtNzQsMyArNzQsNSBAQCBDT05G
SUdfVklSVElPX0ZTPXkKIENPTkZJR19PVkVSTEFZX0ZTPXkKIENPTkZJR19UTVBGUz15CiBDT05G
SUdfVE1QRlNfUE9TSVhfQUNMPXkKK0NPTkZJR19WSVJUVUFMSVpBVElPTj15CitDT05GSUdfS1ZN
PXkKZGlmZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3Rfa3ZtLnB5
IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9rdm0ucHkKbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uZGE1ZWJmYjFiNwotLS0gL2Rldi9udWxsCisrKyBi
L3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3Rfa3ZtLnB5CkBAIC0wLDAgKzEsNDcg
QEAKK2ltcG9ydCBvcworaW1wb3J0IGluZnJhLmJhc2V0ZXN0CisKK0tWTV9USU1FT1VUID0gMTIw
CisKKworY2xhc3MgVGVzdEtWTShpbmZyYS5iYXNldGVzdC5CUlRlc3QpOgorICAgIGNvbmZpZyA9
IFwKKyAgICAgICAgIiIiCisgICAgICAgIEJSMl9hYXJjaDY0PXkKKyAgICAgICAgQlIyX2NvcnRl
eF9hNzI9eQorICAgICAgICBCUjJfVE9PTENIQUlOX0VYVEVSTkFMPXkKKyAgICAgICAgQlIyX1RP
T0xDSEFJTl9FWFRFUk5BTF9MSUJDX1VUSUxTX0NPUFk9eQorICAgICAgICBCUjJfT1BUSU1JWkVf
Uz15CisgICAgICAgIEJSMl9UQVJHRVRfUk9PVEZTX0NQSU89eQorICAgICAgICBCUjJfTElOVVhf
S0VSTkVMPXkKKyAgICAgICAgQlIyX0xJTlVYX0tFUk5FTF9VU0VfQ1VTVE9NX0NPTkZJRz15Cisg
ICAgICAgIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX0NPTkZJR19GSUxFPSJib2FyZC9xZW11L2Fh
cmNoNjQtdmlydC9saW51eC5jb25maWciCisgICAgICAgIEJSMl9QQUNLQUdFX0JVU1lCT1hfU0hP
V19PVEhFUlM9eQorICAgICAgICBCUjJfUEFDS0FHRV9LVk1fVU5JVF9URVNUUz15CisgICAgICAg
ICMgQlIyX1BBQ0tBR0VfUUVNVV9TWVNURU1fVENHIGlzIG5vdCBzZXQKKyAgICAgICAgIyBCUjJf
UEFDS0FHRV9RRU1VX0JMT0JTIGlzIG5vdCBzZXQKKyAgICAgICAgQlIyX1RBUkdFVF9ST09URlNf
RVhUMj15CisgICAgICAgICIiIgorCisgICAgZGVmIHRlc3RfcnVuKHNlbGYpOgorICAgICAgICBr
ZXJuID0gb3MucGF0aC5qb2luKHNlbGYuYnVpbGRkaXIsICJpbWFnZXMiLCAiSW1hZ2UiKQorICAg
ICAgICBpbWcgPSBvcy5wYXRoLmpvaW4oc2VsZi5idWlsZGRpciwgImltYWdlcyIsICJyb290ZnMu
ZXh0MiIpCisKKyAgICAgICAgcWVtdV9vcHRzID0gWyItTSIsICJ2aXJ0LGdpYy12ZXJzaW9uPTMs
dmlydHVhbGl6YXRpb249b24iLAorICAgICAgICAgICAgICAgICAgICAgIi1jcHUiLCAiY29ydGV4
LWE3MiIsCisgICAgICAgICAgICAgICAgICAgICAiLXNtcCIsICIyIiwKKyAgICAgICAgICAgICAg
ICAgICAgICItbSIsICI1MTJNIiwKKyAgICAgICAgICAgICAgICAgICAgICItZHJpdmUiLCBmImZp
bGU9e2ltZ30saWY9dmlydGlvLGZvcm1hdD1yYXciLCAiLXNuYXBzaG90Il0KKworICAgICAgICBz
ZWxmLmVtdWxhdG9yLmJvb3QoYXJjaD0iYWFyY2g2NCIsCisgICAgICAgICAgICAgICAgICAgICAg
ICAgICBrZXJuZWw9a2VybiwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgIGtlcm5lbF9jbWRs
aW5lPVsicm9vdD0vZGV2L3ZkYSBjb25zb2xlPXR0eUFNQTAiXSwKKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgIG9wdGlvbnM9cWVtdV9vcHRzKQorCisgICAgICAgIHNlbGYuZW11bGF0b3IubG9n
aW4oKQorCisgICAgICAgICMgUnVuIHRoZSBzZWxmdGVzdHMKKyAgICAgICAgc2VsZi5hc3NlcnRS
dW5PaygiL3Vzci9zaGFyZS9rdm0tdW5pdC10ZXN0cy9zZWxmdGVzdC1zZXR1cCIpCisgICAgICAg
IHNlbGYuYXNzZXJ0UnVuT2soIi91c3Ivc2hhcmUva3ZtLXVuaXQtdGVzdHMvc2VsZnRlc3Qtc21w
IikKKyAgICAgICAgc2VsZi5hc3NlcnRSdW5PaygiL3Vzci9zaGFyZS9rdm0tdW5pdC10ZXN0cy9z
ZWxmdGVzdC12ZWN0b3JzLWtlcm5lbCIpCisgICAgICAgIHNlbGYuYXNzZXJ0UnVuT2soIi91c3Iv
c2hhcmUva3ZtLXVuaXQtdGVzdHMvc2VsZnRlc3QtdmVjdG9ycy11c2VyIikKLS0gCjIuNDcuMgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
