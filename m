Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9101AC4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 10:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1201E40292;
	Fri, 10 Nov 2023 10:45:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1201E40292
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NhfX1k7kFe0R; Fri, 10 Nov 2023 10:45:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5BEA403A2;
	Fri, 10 Nov 2023 10:45:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5BEA403A2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5049F1BF348
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 10:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2950E60D62
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 10:45:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2950E60D62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id us8dWZo6NU-r for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 10:45:11 +0000 (UTC)
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CCA4860D58
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 10:45:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCA4860D58
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2c5071165d5so25101991fa.0
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 02:45:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699613108; x=1700217908;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tow11e/AZNBjeWjINp4N8huruCf0MmRgByXr11XgNXE=;
 b=Hmtt4G9UOlaAr68H9WHlcmcE82HgZ55NtPIhCLT8lu0AQFBib5OORqRshX/bkQuNUl
 s6XoiFXNd9C2cOqNgBNvE3oSBinoLVaJmmEfY/LyaK8F4DtGWYY9X2+2oUBn+5prVpFl
 plLraOgRxXF65Ap6diikwPg5VP7NKWxtZHsfiLXwSC12qhfvvL/k5uEfGOLx2nj8U5s/
 FLKnbQUE1zwFqfQ+ZxKSi6rgQE6XqDKpAlLypbYhmSpXYUYQLRrvLvZgisWn0CnnE3cp
 oLng70jSHm8gEJ4f+Jl/8JdsPZJBBYvk/pfLu+92DUjg9xcvFeAW4EFld2AGXQXVtYeh
 ybfw==
X-Gm-Message-State: AOJu0YynsgEyfHpB+8nFDdXQuiHZ/KUgBROMPkhMZBg/Igt3FgpTYXB1
 nwIwQ61/WwWgxBSzTlI40HS0+POuVFjir7w1bG7VEg==
X-Google-Smtp-Source: AGHT+IG5ZiCazx1DfWbYS5FSE2a1htjwHl78iTE8uO1wQfDJAzzoY/74O+LA7SDS7+ulPS4AWhrodg==
X-Received: by 2002:ac2:44d8:0:b0:509:44cd:241c with SMTP id
 d24-20020ac244d8000000b0050944cd241cmr3482012lfm.32.1699613108330; 
 Fri, 10 Nov 2023 02:45:08 -0800 (PST)
Received: from nola.getinternet.no ([84.209.57.13])
 by smtp.gmail.com with ESMTPSA id
 z10-20020a19650a000000b005057830c24dsm1360134lfb.141.2023.11.10.02.45.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 02:45:07 -0800 (PST)
To: buildroot@buildroot.org
Date: Fri, 10 Nov 2023 11:45:04 +0100
Message-Id: <20231110104504.2340403-1-jonhenrik@qbee.io>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qbee.io; s=google; t=1699613108; x=1700217908; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tow11e/AZNBjeWjINp4N8huruCf0MmRgByXr11XgNXE=;
 b=RbIjJOiyPqza12zX8aeFYgivL3SXOk4oSApct2KOGWgaHE6BgKXJq4faj000mlpgFX
 5Cto9Q9KdcOCoPQOmsrrhzge9fxFshQhkAk3LZjEhZPl3cQhodL18Zl19xXu9uhJTUJ6
 yHXvpozcbmBgEGKdlWQilMrblQpmpsg7IUEpA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=qbee.io header.i=@qbee.io
 header.a=rsa-sha256 header.s=google header.b=RbIjJOiy
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
Cc: Christian Stewart <christian@aperture.us>,
 =?UTF-8?q?Jon=20Henrik=20Bj=C3=B8rnstad?= <jonhenrik@qbee.io>,
 Anisse Astier <anisse@astier.eu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBwYXRjaCBhZGQgcWJlZS1hZ2VudCwgYW4gb3BlbiBzb3VyY2UgZGV2aWNlIG1hbmFnZW1l
bnQgc29mdHdhcmUKZm9yIExpbnV4IGRldmljZXMuCgpTaWduZWQtb2ZmLWJ5OiBKb24gSGVucmlr
IEJqw7hybnN0YWQgPGpvbmhlbnJpa0BxYmVlLmlvPgotLS0KIERFVkVMT1BFUlMgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgMyArKysKIHBhY2thZ2UvQ29uZmlnLmluICAgICAgICAgICAgICAg
ICAgfCAgMSArCiBwYWNrYWdlL3FiZWUtYWdlbnQvQ29uZmlnLmluICAgICAgIHwgMTggKysrKysr
KysrKysrKysKIHBhY2thZ2UvcWJlZS1hZ2VudC9xYmVlLWFnZW50Lmhhc2ggfCAgMyArKysKIHBh
Y2thZ2UvcWJlZS1hZ2VudC9xYmVlLWFnZW50Lm1rICAgfCAzOSArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysKIDUgZmlsZXMgY2hhbmdlZCwgNjQgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1v
ZGUgMTAwNjQ0IHBhY2thZ2UvcWJlZS1hZ2VudC9Db25maWcuaW4KIGNyZWF0ZSBtb2RlIDEwMDY0
NCBwYWNrYWdlL3FiZWUtYWdlbnQvcWJlZS1hZ2VudC5oYXNoCiBjcmVhdGUgbW9kZSAxMDA2NDQg
cGFja2FnZS9xYmVlLWFnZW50L3FiZWUtYWdlbnQubWsKCmRpZmYgLS1naXQgYS9ERVZFTE9QRVJT
IGIvREVWRUxPUEVSUwppbmRleCBkODA5MzFlODRhLi41ZjZlODMxNzlmIDEwMDY0NAotLS0gYS9E
RVZFTE9QRVJTCisrKyBiL0RFVkVMT1BFUlMKQEAgLTE2MTYsNiArMTYxNiw5IEBAIEY6CXBhY2th
Z2Uvc2RidXNwbHVzLwogTjoJSm9uIFJpbmdsZSA8anJpbmdsZUBncmlkcG9pbnQuY29tPgogRjoJ
cGFja2FnZS9tYnBvbGwvCiAKK046CUpvbiBIZW5yaWsgQmrDuHJuc3RhZCA8am9uaGVucmlrQHFi
ZWUuaW8+CitGOglwYWNrYWdlL3FiZWUtYWdlbnQvCisKIE46CUpvbmF0aGFuIEJlbiBBdnJhaGFt
IDx5YmFAdGtvcy5jby5pbD4KIEY6CWFyY2gvQ29uZmlnLmluLnh0ZW5zYQogRjoJcGFja2FnZS9h
dXRvZnMvCmRpZmYgLS1naXQgYS9wYWNrYWdlL0NvbmZpZy5pbiBiL3BhY2thZ2UvQ29uZmlnLmlu
CmluZGV4IGRhYzUwNThiYmUuLmNiMzA5MDZhNGYgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvQ29uZmln
LmluCisrKyBiL3BhY2thZ2UvQ29uZmlnLmluCkBAIC0yNzQxLDYgKzI3NDEsNyBAQCBtZW51ICJT
eXN0ZW0gdG9vbHMiCiAJc291cmNlICJwYWNrYWdlL3Byb2NzL0NvbmZpZy5pbiIKIAlzb3VyY2Ug
InBhY2thZ2UvcHNtaXNjL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvcHdnZW4vQ29uZmln
LmluIgorCXNvdXJjZSAicGFja2FnZS9xYmVlLWFnZW50L0NvbmZpZy5pbiIKIAlzb3VyY2UgInBh
Y2thZ2UvcXVvdGEvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9xdW90YXRvb2wvQ29uZmln
LmluIgogCXNvdXJjZSAicGFja2FnZS9yYXVjL0NvbmZpZy5pbiIKZGlmZiAtLWdpdCBhL3BhY2th
Z2UvcWJlZS1hZ2VudC9Db25maWcuaW4gYi9wYWNrYWdlL3FiZWUtYWdlbnQvQ29uZmlnLmluCm5l
dyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmMzNWVhYmZmOTEKLS0tIC9kZXYv
bnVsbAorKysgYi9wYWNrYWdlL3FiZWUtYWdlbnQvQ29uZmlnLmluCkBAIC0wLDAgKzEsMTggQEAK
K2NvbmZpZyBCUjJfUEFDS0FHRV9RQkVFX0FHRU5UCisJYm9vbCAicWJlZS1hZ2VudCIKKwlkZXBl
bmRzIG9uIEJSMl9QQUNLQUdFX0hPU1RfR09fVEFSR0VUX0FSQ0hfU1VQUE9SVFMKKwlzZWxlY3Qg
QlIyX1BBQ0tBR0VfT1BFTlNTSCBpZiAhQlIyX1BBQ0tBR0VfRFJPUEJFQVJfQ0xJRU5UICMgcnVu
dGltZQorCXNlbGVjdCBCUjJfUEFDS0FHRV9JUFRBQkxFUyAjIHJ1bnRpbWUKKwlzZWxlY3QgQlIy
X1BBQ0tBR0VfQlVTWUJPWF9TSE9XX09USEVSUyAjIHJ1bnRpbWUKKwlzZWxlY3QgQlIyX1BBQ0tB
R0VfU0hBRE9XICMgcnVudGltZQorCXNlbGVjdCBCUjJfUEFDS0FHRV9CQVNIICMgcnVudGltZQor
CWhlbHAKKwkgIFFiZWUgaXMgYSBkZXZpY2UgbWFuYWdlbWVudCBwbGF0Zm9ybSB0aGF0IGNvbXBy
aXNlCisJICBvZiBhbiBvcGVuLXNvdXJjZSBhZ2VudCBhbmQgYSBob3N0ZWQgU2FhUyBiYWNrZW5k
LgorCSAgVGhpcyBjb25maWcgaW5zdGFsbHMgcHJlLWJ1aWx0IHN0YXRpYyBiaW5hcmllcyBtYWRl
CisJICB3aXRoIHRoZSBvZmZpY2lhbCBwdWJsaWMgc2lnbmluZyBrZXkgZm9yIHFiZWUuaW8uIFRo
ZQorCSAgYmluYXJpZXMgd2lsbCB3b3JrIHNlYW1sZXNzbHkgd2l0aCB0aGUgcWJlZS5pbyBkZXZp
Y2UKKwkgIG1hbmFnZW1lbnQgYmFja2VuZC4KKworCSAgaHR0cHM6Ly9naXRodWIuY29tL3FiZWUt
aW8vcWJlZS1hZ2VudAorCSAgaHR0cHM6Ly9xYmVlLmlvCmRpZmYgLS1naXQgYS9wYWNrYWdlL3Fi
ZWUtYWdlbnQvcWJlZS1hZ2VudC5oYXNoIGIvcGFja2FnZS9xYmVlLWFnZW50L3FiZWUtYWdlbnQu
aGFzaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi45MTg3NjNjNTgzCi0t
LSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9xYmVlLWFnZW50L3FiZWUtYWdlbnQuaGFzaApAQCAt
MCwwICsxLDMgQEAKKyMgTG9jYWxseSBjYWxjdWxhdGVkCitzaGEyNTYgIDM3YjkyYjMyODkwYjJl
OTU4ODRmYjEzZTM5MmU4YzkzZDk2M2I4ZTliODY4ZGZmMTc4YWI3ZGI1OGU4MTVlZTYgIHFiZWUt
YWdlbnQtMjAyMy40NC50YXIuZ3oKK3NoYTI1NiAgMDJkMDdkOTZiZTk5ZWIwNDJiMDFiYTY1MDA3
OWE0NDBjZTI2YTc4YzVlMGUxZTgwNjBjMzNhOGM5ZTIwMDQwNCAgTElDRU5TRQpkaWZmIC0tZ2l0
IGEvcGFja2FnZS9xYmVlLWFnZW50L3FiZWUtYWdlbnQubWsgYi9wYWNrYWdlL3FiZWUtYWdlbnQv
cWJlZS1hZ2VudC5tawpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5mNTY4
MzcyZTAxCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9xYmVlLWFnZW50L3FiZWUtYWdlbnQu
bWsKQEAgLTAsMCArMSwzOSBAQAorIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKKyMKKyMgcWJlZS1h
Z2VudCBwYWNrYWdlCisjCisjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIworCitRQkVFX0FHRU5UX1ZF
UlNJT04gPSAyMDIzLjQ0CitRQkVFX0FHRU5UX1NJVEUgPSAkKGNhbGwgZ2l0aHViLHFiZWUtaW8s
cWJlZS1hZ2VudCwkKFFCRUVfQUdFTlRfVkVSU0lPTikpCitRQkVFX0FHRU5UX0xJQ0VOU0UgPSBB
cGFjaGUtMi4wCitRQkVFX0FHRU5UX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCisKK1FCRUVfQUdF
TlRfQ09NTUlUX0lEID0gNTgyOTAwMzU2MjIyODYwYmZjNDA1NjdlYTM1OTk0MWM5ZDM0ZjQ5OQor
UUJFRV9BR0VOVF9QVUJMSUNfU0lHTklOR19LRVkgPSB6NW1VRmFXLTN0M1dSSWprVXIyZFZPelBn
R3czb3lSLXR6QmxJbkdmejQ0LkVKRXhMaUpleDFYN25UN3A2WFR4Tzhram1Ha3Y2aWs2MFhNenZN
ZS04N2cKKworUUJFRV9BR0VOVF9MREZMQUdTID0gLXMgLXcgXAorCS1YIGdpdGh1Yi5jb20vcWJl
ZS1pby9xYmVlLWFnZW50L2FwcC5WZXJzaW9uPSQoUUJFRV9BR0VOVF9WRVJTSU9OKSBcCisJLVgg
Z2l0aHViLmNvbS9xYmVlLWlvL3FiZWUtYWdlbnQvYXBwLkNvbW1pdD0kKFFCRUVfQUdFTlRfQ09N
TUlUX0lEKSBcCisJLVggZ2l0aHViLmNvbS9xYmVlLWlvL3FiZWUtYWdlbnQvYXBwL2JpbmFyeS5Q
dWJsaWNTaWduaW5nS2V5PSQoUUJFRV9BR0VOVF9QVUJMSUNfU0lHTklOR19LRVkpCisKK2RlZmlu
ZSBRQkVFX0FHRU5UX0lOU1RBTExfVEFSR0VUX0NNRFMKKwkkKElOU1RBTEwpIC1tIDA3NTUgJChA
RCkvYmluL3FiZWUtYWdlbnQgJChUQVJHRVRfRElSKS91c3IvYmluL3FiZWUtYWdlbnQKKwkkKElO
U1RBTEwpIC1EIC1tIDA2MDAgJChARCkvcGFja2FnZS9zaGFyZS9zc2wvY2EuY2VydCAkKFRBUkdF
VF9ESVIpL2V0Yy9xYmVlL3Bwa2V5cy9jYS5jZXJ0CitlbmRlZgorCitkZWZpbmUgUUJFRV9BR0VO
VF9JTlNUQUxMX0lOSVRfU1lTVEVNRAorCSQoSU5TVEFMTCkgLUQgLW0gMDY0NCAkKEBEKS9wYWNr
YWdlL2luaXQtc2NyaXB0cy9zeXN0ZW1kL3FiZWUtYWdlbnQuc2VydmljZSBcCisJCSQoVEFSR0VU
X0RJUikvdXNyL2xpYi9zeXN0ZW1kL3N5c3RlbS9xYmVlLWFnZW50LnNlcnZpY2UKK2VuZGVmCisK
K2RlZmluZSBRQkVFX0FHRU5UX0lOU1RBTExfSU5JVF9TWVNWCisJJChJTlNUQUxMKSAtRCAtbSA3
NTUgJChARCkvcGFja2FnZS9pbml0LXNjcmlwdHMvc3lzdmluaXQvcWJlZS1hZ2VudCBcCisJCSQo
VEFSR0VUX0RJUikvZXRjL2luaXQuZC9TOTlxYmVlLWFnZW50CitlbmRlZgorCitkZWZpbmUgUUJF
RV9BR0VOVF9MSU5VWF9DT05GSUdfRklYVVBTCisJJChjYWxsIEtDT05GSUdfRU5BQkxFX09QVCxD
T05GSUdfVFVOKQorZW5kZWYKKworJChldmFsICQoZ29sYW5nLXBhY2thZ2UpKQotLSAKMi4yNS4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
