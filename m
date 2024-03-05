Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C709C54E41
	for <buildroot@archiver.kernel.org>; Tue,  5 Mar 2024 09:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E3EB40811;
	Tue,  5 Mar 2024 09:39:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VC0LgMmaBjQ9; Tue,  5 Mar 2024 09:39:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD8FC4085C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD8FC4085C;
	Tue,  5 Mar 2024 09:39:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 123C31BF25F
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 09:39:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2F18822BD
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 09:39:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1UkAa0W7XKvh for <buildroot@lists.busybox.net>;
 Tue,  5 Mar 2024 09:39:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com;
 envelope-from=jonhenrik@qbee.io; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9DC70822AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DC70822AC
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9DC70822AC
 for <buildroot@buildroot.org>; Tue,  5 Mar 2024 09:39:08 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5133bd7eb47so3489872e87.3
 for <buildroot@buildroot.org>; Tue, 05 Mar 2024 01:39:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709631546; x=1710236346;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OEaj3fZkoa1e0P7Nxrq0DA88fLX3BRhfI+RhMBDZX5M=;
 b=sqVO1S9xSJMOYFsLsPXnmK8Jjl2UyZBmHyG/mAjDDgCZkXYdHwF0cyTErb9kxwT5bg
 xyxDn8latBKLwF29xtqHMlwOxdzCP+BPlYOwK3iOiGgqAFRkoc/QJzemeZzhz8Zufpp8
 epgST6Lwh/mMo5YhluwGMb8nu2tqoTsMt/7Plhv/kZS1fFmJlqCQXFXT01a1b7L5cavC
 J5mMgSHAEBPMndZvTzfZ6j/ZiZpqj8dRTHHDhEYxbZEHnYMdYfiquyJzEIvv2JMCmrrv
 8jqao0OZm1AoNLVnQaeUFXoyj7+aQ4k0iRoZiqo1NbTh7lZd6lRtsoBKO7SyWjSuluLw
 /JVw==
X-Gm-Message-State: AOJu0Ywj7DE7t6071bcO2HF7vJxdY3BHjpEK5D8Ou/kHP9pfKLgEqSh4
 jVCc8rtqdxgjYp94YMHw0hsd9D5PTzLoZ0GEL7P5g5jx3oeEpEpww7WhEqp8gUCy8yiV24J7XuR
 tymI=
X-Google-Smtp-Source: AGHT+IGcusmdduYF2xwym0iJqgVEURf8eVsQkYslRYz3gJyTfTiC3H0NEGJxAT6I0qy/tAuvycGy5g==
X-Received: by 2002:a19:a405:0:b0:513:4bf6:9710 with SMTP id
 q5-20020a19a405000000b005134bf69710mr877562lfc.26.1709631546011; 
 Tue, 05 Mar 2024 01:39:06 -0800 (PST)
Received: from nola.getinternet.no ([84.209.57.13])
 by smtp.gmail.com with ESMTPSA id
 b25-20020a196459000000b00512b2ea0472sm2145161lfj.32.2024.03.05.01.39.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 01:39:05 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue,  5 Mar 2024 10:38:39 +0100
Message-Id: <20240305093839.3152030-2-jonhenrik@qbee.io>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240305093839.3152030-1-jonhenrik@qbee.io>
References: <20240305093839.3152030-1-jonhenrik@qbee.io>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qbee.io; s=google; t=1709631546; x=1710236346; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OEaj3fZkoa1e0P7Nxrq0DA88fLX3BRhfI+RhMBDZX5M=;
 b=B1bi25V8Vt57b8SLvIDxhv8MltgFCTALlCLx3+8o+qjMZca9wGWoPlM/2x40K/7TbC
 rtM2aJf3s3iYcAuto506CjD0w+uDcsR6Zrgu0vnv5Zryv9oocQY3WVX5w8wOdK3b8wzc
 9FLG9gn7DgDHwji/vsH3LSoL0JHFVrqsLFn2w=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=qbee.io
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=qbee.io header.i=@qbee.io header.a=rsa-sha256
 header.s=google header.b=B1bi25V8
Subject: [Buildroot] [PATCH 1/1] package/qbee-agent: new package
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
From: =?utf-8?q?Jon_Henrik_Bj=C3=B8rnstad_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Jon=20Henrik=20Bj=C3=B8rnstad?= <jonhenrik@qbee.io>
Cc: =?UTF-8?q?Jon=20Henrik=20Bj=C3=B8rnstad?= <jonhenrik@qbee.io>,
 Christian Stewart <christian@aperture.us>, Anisse Astier <anisse@astier.eu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBwYXRjaCBhZGQgcWJlZS1hZ2VudCwgYW4gb3BlbiBzb3VyY2UgZGV2aWNlIG1hbmFnZW1l
bnQgc29mdHdhcmUKZm9yIExpbnV4IGRldmljZXMuCgpTaWduZWQtb2ZmLWJ5OiBKb24gSGVucmlr
IEJqw7hybnN0YWQgPGpvbmhlbnJpa0BxYmVlLmlvPgotLS0KIERFVkVMT1BFUlMgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgMyArKysKIHBhY2thZ2UvQ29uZmlnLmluICAgICAgICAgICAgICAg
ICAgfCAgMSArCiBwYWNrYWdlL3FiZWUtYWdlbnQvQ29uZmlnLmluICAgICAgIHwgMTcgKysrKysr
KysrKysrKysrCiBwYWNrYWdlL3FiZWUtYWdlbnQvcWJlZS1hZ2VudC5oYXNoIHwgIDMgKysrCiBw
YWNrYWdlL3FiZWUtYWdlbnQvcWJlZS1hZ2VudC5tayAgIHwgMzUgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrCiA1IGZpbGVzIGNoYW5nZWQsIDU5IGluc2VydGlvbnMoKykKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBwYWNrYWdlL3FiZWUtYWdlbnQvQ29uZmlnLmluCiBjcmVhdGUgbW9kZSAxMDA2
NDQgcGFja2FnZS9xYmVlLWFnZW50L3FiZWUtYWdlbnQuaGFzaAogY3JlYXRlIG1vZGUgMTAwNjQ0
IHBhY2thZ2UvcWJlZS1hZ2VudC9xYmVlLWFnZW50Lm1rCgpkaWZmIC0tZ2l0IGEvREVWRUxPUEVS
UyBiL0RFVkVMT1BFUlMKaW5kZXggMGJmZTkxZjA2NC4uMTFmYjI0Yjc4ZSAxMDA2NDQKLS0tIGEv
REVWRUxPUEVSUworKysgYi9ERVZFTE9QRVJTCkBAIC0xNjMxLDYgKzE2MzEsOSBAQCBGOglwYWNr
YWdlL3NkYnVzcGx1cy8KIE46CUpvbiBSaW5nbGUgPGpyaW5nbGVAZ3JpZHBvaW50LmNvbT4KIEY6
CXBhY2thZ2UvbWJwb2xsLwogCitOOglKb24gSGVucmlrIEJqw7hybnN0YWQgPGpvbmhlbnJpa0Bx
YmVlLmlvPgorRjoJcGFja2FnZS9xYmVlLWFnZW50LworCiBOOglKb25hdGhhbiBCZW4gQXZyYWhh
bSA8eWJhQHRrb3MuY28uaWw+CiBGOglhcmNoL0NvbmZpZy5pbi54dGVuc2EKIEY6CXBhY2thZ2Uv
YXV0b2ZzLwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9Db25maWcuaW4gYi9wYWNrYWdlL0NvbmZpZy5p
bgppbmRleCAzMzAzOTMzMWY3Li5mYzVmZmM0ZGJhIDEwMDY0NAotLS0gYS9wYWNrYWdlL0NvbmZp
Zy5pbgorKysgYi9wYWNrYWdlL0NvbmZpZy5pbgpAQCAtMjc4MCw2ICsyNzgwLDcgQEAgbWVudSAi
U3lzdGVtIHRvb2xzIgogCXNvdXJjZSAicGFja2FnZS9wcm9jcy9Db25maWcuaW4iCiAJc291cmNl
ICJwYWNrYWdlL3BzbWlzYy9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL3B3Z2VuL0NvbmZp
Zy5pbiIKKwlzb3VyY2UgInBhY2thZ2UvcWJlZS1hZ2VudC9Db25maWcuaW4iCiAJc291cmNlICJw
YWNrYWdlL3F1b3RhL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvcXVvdGF0b29sL0NvbmZp
Zy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvcmF1Yy9Db25maWcuaW4iCmRpZmYgLS1naXQgYS9wYWNr
YWdlL3FiZWUtYWdlbnQvQ29uZmlnLmluIGIvcGFja2FnZS9xYmVlLWFnZW50L0NvbmZpZy5pbgpu
ZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi4wMmUzNTgyN2VmCi0tLSAvZGV2
L251bGwKKysrIGIvcGFja2FnZS9xYmVlLWFnZW50L0NvbmZpZy5pbgpAQCAtMCwwICsxLDE3IEBA
Citjb25maWcgQlIyX1BBQ0tBR0VfUUJFRV9BR0VOVAorCWJvb2wgInFiZWUtYWdlbnQiCisJZGVw
ZW5kcyBvbiBCUjJfUEFDS0FHRV9IT1NUX0dPX1RBUkdFVF9BUkNIX1NVUFBPUlRTCisJc2VsZWN0
IEJSMl9QQUNLQUdFX0lQVEFCTEVTICMgcnVudGltZQorCXNlbGVjdCBCUjJfUEFDS0FHRV9CVVNZ
Qk9YX1NIT1dfT1RIRVJTICMgcnVudGltZQorCXNlbGVjdCBCUjJfUEFDS0FHRV9TSEFET1cgIyBy
dW50aW1lCisJc2VsZWN0IEJSMl9QQUNLQUdFX0JBU0ggIyBydW50aW1lCisJaGVscAorCSAgUWJl
ZSBpcyBhIGRldmljZSBtYW5hZ2VtZW50IHBsYXRmb3JtIHRoYXQgY29tcHJpc2UKKwkgIG9mIGFu
IG9wZW4tc291cmNlIGFnZW50IGFuZCBhIGhvc3RlZCBTYWFTIGJhY2tlbmQuCisJICBUaGlzIGNv
bmZpZyBpbnN0YWxscyBwcmUtYnVpbHQgc3RhdGljIGJpbmFyaWVzIG1hZGUKKwkgIHdpdGggdGhl
IG9mZmljaWFsIHB1YmxpYyBzaWduaW5nIGtleSBmb3IgcWJlZS5pby4gVGhlCisJICBiaW5hcmll
cyB3aWxsIHdvcmsgc2VhbWxlc3NseSB3aXRoIHRoZSBxYmVlLmlvIGRldmljZQorCSAgbWFuYWdl
bWVudCBiYWNrZW5kLgorCisJICBodHRwczovL2dpdGh1Yi5jb20vcWJlZS1pby9xYmVlLWFnZW50
CisJICBodHRwczovL3FiZWUuaW8KZGlmZiAtLWdpdCBhL3BhY2thZ2UvcWJlZS1hZ2VudC9xYmVl
LWFnZW50Lmhhc2ggYi9wYWNrYWdlL3FiZWUtYWdlbnQvcWJlZS1hZ2VudC5oYXNoCm5ldyBmaWxl
IG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjFjNmEzNjFmZjYKLS0tIC9kZXYvbnVsbAor
KysgYi9wYWNrYWdlL3FiZWUtYWdlbnQvcWJlZS1hZ2VudC5oYXNoCkBAIC0wLDAgKzEsMyBAQAor
IyBMb2NhbGx5IGNhbGN1bGF0ZWQKK3NoYTI1NiAgYjFiNWE2ZDRlMThmYmQ4NTM2ZDA1NjE2YzYz
MmYxMGVmMzA5ZDI2MDM2YTE5YzVjZTI4ZDA2MzVjNDVkOGNhYiAgcWJlZS1hZ2VudC0yMDI0LjA5
LnRhci5negorc2hhMjU2ICAwMmQwN2Q5NmJlOTllYjA0MmIwMWJhNjUwMDc5YTQ0MGNlMjZhNzhj
NWUwZTFlODA2MGMzM2E4YzllMjAwNDA0ICBMSUNFTlNFCmRpZmYgLS1naXQgYS9wYWNrYWdlL3Fi
ZWUtYWdlbnQvcWJlZS1hZ2VudC5tayBiL3BhY2thZ2UvcWJlZS1hZ2VudC9xYmVlLWFnZW50Lm1r
Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjY2MDM3MTk1YzEKLS0tIC9k
ZXYvbnVsbAorKysgYi9wYWNrYWdlL3FiZWUtYWdlbnQvcWJlZS1hZ2VudC5tawpAQCAtMCwwICsx
LDM1IEBACisjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIworIworIyBxYmVlLWFnZW50IHBhY2thZ2UK
KyMKKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCisKK1FCRUVfQUdFTlRfVkVSU0lPTiA9IDIwMjQu
MDkKK1FCRUVfQUdFTlRfU0lURSA9ICQoY2FsbCBnaXRodWIscWJlZS1pbyxxYmVlLWFnZW50LCQo
UUJFRV9BR0VOVF9WRVJTSU9OKSkKK1FCRUVfQUdFTlRfTElDRU5TRSA9IEFwYWNoZS0yLjAKK1FC
RUVfQUdFTlRfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKKworUUJFRV9BR0VOVF9DT01NSVRfSUQg
PSBjMzBkNDNiOGU2NGNmZWY5NjBjZWU5NDc1YjU4YWUwODNlNGFkMjQ2CisKK1FCRUVfQUdFTlRf
R09NT0QgPSBnby5xYmVlLmlvL2FnZW50CisKK1FCRUVfQUdFTlRfTERGTEFHUyA9IC1zIC13IFwK
KwktWCAkKFFCRUVfQUdFTlRfR09NT0QpL2FwcC5WZXJzaW9uPSQoUUJFRV9BR0VOVF9WRVJTSU9O
KSBcCisJLVggJChRQkVFX0FHRU5UX0dPTU9EKS9hcHAuQ29tbWl0PSQoUUJFRV9BR0VOVF9DT01N
SVRfSUQpCisKK2RlZmluZSBRQkVFX0FHRU5UX0lOU1RBTExfVEFSR0VUX0NNRFMKKwkkKElOU1RB
TEwpIC1tIDA3NTUgJChARCkvYmluL3FiZWUtYWdlbnQgJChUQVJHRVRfRElSKS91c3IvYmluL3Fi
ZWUtYWdlbnQKKwkkKElOU1RBTEwpIC1EIC1tIDA2MDAgJChARCkvcGFja2FnZS9zaGFyZS9zc2wv
Y2EuY2VydCAkKFRBUkdFVF9ESVIpL2V0Yy9xYmVlL3Bwa2V5cy9jYS5jZXJ0CitlbmRlZgorCitk
ZWZpbmUgUUJFRV9BR0VOVF9JTlNUQUxMX0lOSVRfU1lTVEVNRAorCSQoSU5TVEFMTCkgLUQgLW0g
MDY0NCAkKEBEKS9wYWNrYWdlL2luaXQtc2NyaXB0cy9zeXN0ZW1kL3FiZWUtYWdlbnQuc2Vydmlj
ZSBcCisJCSQoVEFSR0VUX0RJUikvdXNyL2xpYi9zeXN0ZW1kL3N5c3RlbS9xYmVlLWFnZW50LnNl
cnZpY2UKK2VuZGVmCisKK2RlZmluZSBRQkVFX0FHRU5UX0lOU1RBTExfSU5JVF9TWVNWCisJJChJ
TlNUQUxMKSAtRCAtbSA3NTUgJChARCkvcGFja2FnZS9pbml0LXNjcmlwdHMvc3lzdmluaXQvcWJl
ZS1hZ2VudCBcCisJCSQoVEFSR0VUX0RJUikvZXRjL2luaXQuZC9TOTlxYmVlLWFnZW50CitlbmRl
ZgorCiskKGV2YWwgJChnb2xhbmctcGFja2FnZSkpCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
