Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF08C87FCB
	for <buildroot@archiver.kernel.org>; Tue,  5 Aug 2025 15:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D977141C10;
	Tue,  5 Aug 2025 15:18:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YzBJxyspwDlF; Tue,  5 Aug 2025 15:18:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D0F241BE3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D0F241BE3;
	Tue,  5 Aug 2025 15:18:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A64CB12C
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 15:18:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A34F241BEA
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 15:18:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MUfLS6ArvHjO for <buildroot@buildroot.org>;
 Tue,  5 Aug 2025 15:18:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EB8A841BE3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB8A841BE3
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EB8A841BE3
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 15:18:24 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-459e0a249d6so7356165e9.2
 for <buildroot@buildroot.org>; Tue, 05 Aug 2025 08:18:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754407102; x=1755011902;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TR9UxvQ55JPMf8BZyRMn1KP078GxtzrMoXthIYZ6LMc=;
 b=oPV0IO6aFHQWxwO3ovc9YeU5o2lQAWHPWO6Xr7KMI3Zk7RjQ2/mY6cvAPbzonH2Rjx
 JFNNYqibleSpL4dH0BFpa0uDLbTI+AeFpcaGY3VbxkK4knVW91nefvs4zWUObF2N1YJz
 jhEoNdBdm9jVO9SPDQebvC3Dk4l2n4hmCqzlbvHIXiE3GQ/qndxJltUq+b/q34GX3hgY
 HftiBKHduBzDGGGyrH8db3WRs7gs2gO9FI0SaXzRN5hwJIVTIX6w0AYw2shwJlcOymyK
 H5Ty+a9WVi4zQUbdC0ES6Q/XmCrXsSmV1RHEBGtY7bCDLvgG7C87wdbBHGEacSYE82iq
 NqpQ==
X-Gm-Message-State: AOJu0YxdSfSYUhqHplDP/xgIzkFAnTBieYUM97ISnfotzb5ceOCfuu5h
 2JC4slywpqK/TcQcOQrKvs0FdwNtQbLchydT96yChXA1afvzThLmEJOuWmqbpMfE0o8fx3knISH
 5nZ4K
X-Gm-Gg: ASbGncteXRJ+8cbEdm33bqw6FENQC9JOE4XpWQDbm8Mh9pP9LeUVjvEC1yUSog5eT4w
 aVEow6RmUf5C3LzC/gDrUagXz3k6Uya9O4BxzFOqfXPTXybM2jNNgawB5a7npt1q2QL9ebTFoFG
 9AUSYfyT9D6ZYZHVtI17kMDAjRvez9PPtX31eHwVC248cvZMiB/6uQH22nExlE2wxaqZufyZVuV
 EzwtYtLKE6Rwg+sIUqZNv3QNDg5WPbeQHbeAreJ5nJsG5XNyRxT4/YqFSH3A7ErDij33M443/xf
 KAgWKRyEDK3qcLKVPRsmhKq8ua0wEUW5dOSe94SVJw8+s3Rm4ZDeCm2K9lnDHyZoTFweYMJHsww
 EtvwGlk0ia0BR5KmonB82mKw=
X-Google-Smtp-Source: AGHT+IF4wTVkxVSo20+DGQxbweTG4DhB6xVPGYR/Y6nmHD3E76w5RR/NsqMIjcKsw3IqMWxnnODagg==
X-Received: by 2002:a05:600c:354a:b0:459:d6a6:792 with SMTP id
 5b1f17b1804b1-459d6a60a64mr66339425e9.29.1754407102198; 
 Tue, 05 Aug 2025 08:18:22 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e586ad64sm7941275e9.20.2025.08.05.08.18.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 08:18:19 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 214105F7E9;
 Tue, 05 Aug 2025 16:18:16 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Tue,  5 Aug 2025 16:18:09 +0100
Message-ID: <20250805151814.1114414-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250805151814.1114414-1-alex.bennee@linaro.org>
References: <20250805151814.1114414-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754407102; x=1755011902; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TR9UxvQ55JPMf8BZyRMn1KP078GxtzrMoXthIYZ6LMc=;
 b=ERB8NN5F4DvXPqGcntpOZGQcJeKvaxv25zzS5zjOZZZ4wOa8p0asIe71SeDtUUjBEd
 60VjCw4NqAsF21O3KMuQImdSo06Qpwhh4BFQtBDo5iWdF//u1BiKT2r94GFnk+zUECnI
 ipu58wxAjuMXULg17ZQOujRPAJZTIp/rO6e+9UtTpOHLeG4k8k8p8I62R0xqxzKseGrr
 slWVtm2NRDQSieiFMKn84v9wPwNU4VAe2nzsudgaKx5dfPvXDTHJTndgGUF7audL83vd
 gQ4xei5EBAh1DaSrfWSVhKbPAFiPm5DWAXtACESj95b3RHP0vnNLyUdwzrbIWz8/OUd+
 dD4A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=ERB8NN5F
Subject: [Buildroot] [PATCH v4 7/9] support/testing: add test for
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
