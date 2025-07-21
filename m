Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0948C83F25
	for <buildroot@archiver.kernel.org>; Mon, 21 Jul 2025 15:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC775427F7;
	Mon, 21 Jul 2025 15:48:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xG-D1Vawd_ka; Mon, 21 Jul 2025 15:48:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF133427C4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF133427C4;
	Mon, 21 Jul 2025 15:48:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D4ED0127
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 15:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C632560E52
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 15:48:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J4bm8cwei0Ih for <buildroot@buildroot.org>;
 Mon, 21 Jul 2025 15:48:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E576D61402
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E576D61402
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E576D61402
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 15:48:22 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-612b67dcb89so6217416a12.1
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 08:48:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753112900; x=1753717700;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TR9UxvQ55JPMf8BZyRMn1KP078GxtzrMoXthIYZ6LMc=;
 b=py+oN+dYWGomfpNgIfZLokgRUbg64LI55ZVkGFMBTDu05Z9Nw3dcER9mJu1rwhxg1R
 cpxbJOUi/Mt6yKzlxzUhDVC0iLi4KErcYXR7IZCJ4S/yRjnD55/kFWq6MIYAqObNSlCE
 yA7rHE1NVQdDKigHhaV69Cjkz8cwhwYQHzQAmoNB9qP/ovnKN4WnfOOquvHyd4oIA9Lj
 6M2n0gSlK1VKWk71qZeK0q02qQNHqtl3js6rJMAZZtLyh8CbaQRNDkfK9A6EIoZmHgiT
 TxdY2RXiU5krd+cHuRMG4rq8hXaOZG5jwAbn1lo3SGDwhC1+mL1uPn5QwBcNPBRzyEhS
 gDgA==
X-Gm-Message-State: AOJu0YzHx+7oPGEPkGysJC7gj5q5PjCToYoD0b8J/aFRiO5tyoQ63Pzc
 Gp/wUC5Qaj3fI8Z/ng062oISi3uS+RXIu5qgQcOBi+HKm6ZoV5opF+a3UJKuaKIlWE35zhlvjQ+
 C6qFn
X-Gm-Gg: ASbGncs7yeS0DKqPSFIhdG5yyltnVErmH0gBrG25/xsJq6aLGFqAWbSphEvlNFA9mTI
 XAfAiVduV0FyonSBI8fyDTJxckxyYa/HbrQiLBeTFC4z0Nx/C3Po82irIJy/J6UCYRUKNTI3I9L
 ZeFDmO5bZFpnxfAvKnwYG7dIsLVENs6X6zYA2bkY2oxNoH/rG8LKNsdN3h93OJXVIuvVgpkIOis
 rBG59jw8XzbigVeNovwsBW7dG7oYC0uG6bQLLnQpnqBF+vhnflOoHpAVEum5qx5b5p6td32X6W8
 oVesraMMAxEnTn7IMOFyxiGSUehwLZ6wZc5FgsgSVZZWaXgzi+28FZKSw9uOnw+rVzc5VB1bPEP
 IZlPeA/KBCjYjtXE35lz6iRM=
X-Google-Smtp-Source: AGHT+IGZ4zcOXudonZVJ3iUvttMrdNN1xb/zd+WzTo/NA37W6VErbMeddsCk2bK/iHb5XOC4F43Jog==
X-Received: by 2002:a17:907:a603:b0:ae3:f16a:c165 with SMTP id
 a640c23a62f3a-ae9ce0b92eamr2064343266b.31.1753112900098; 
 Mon, 21 Jul 2025 08:48:20 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aec6ca30d2esm697067366b.86.2025.07.21.08.48.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 08:48:19 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B53225F8BD;
 Mon, 21 Jul 2025 16:48:14 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Mon, 21 Jul 2025 16:48:08 +0100
Message-ID: <20250721154812.787883-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250721154812.787883-1-alex.bennee@linaro.org>
References: <20250721154812.787883-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753112900; x=1753717700; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TR9UxvQ55JPMf8BZyRMn1KP078GxtzrMoXthIYZ6LMc=;
 b=YzoX0ME125XEjecupgwB8ejtWh2xdnUyDy2C/O8vYox/X4uRn318og1cHTf6yKaDNY
 zA5N+kqMiImwEIn92jao4Yahkr09pr6vFNsjSnWPfPFgzYE/G7Qvek2I2uRoAJfkl1iK
 gLqSQeEKgZmOkDxts9rIqXaoCB/WHze8T/KJ8cjDSBxIQ8hhHL1mvprSgVvb/AaNqQEx
 VuD6OA3xLWxJJmt07TmnbiduhOpXkStmJ8dCATMLDxQDicy+kr4RTF0DIiXIogyW3JzN
 iAoKDOacNBybJdjQFHlIf52Z/6uqUNFuMUZwbRozLlRTpFRMIvcSfiyUib5rT0wAmR0A
 30MA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=YzoX0ME1
Subject: [Buildroot] [PATCH v3 7/9] support/testing: add test for
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
