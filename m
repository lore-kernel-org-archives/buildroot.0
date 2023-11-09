Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3E5C4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 08:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 177C7410D5;
	Thu,  9 Nov 2023 08:09:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 177C7410D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K9e-8S2yDvNk; Thu,  9 Nov 2023 08:09:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35CEC4099F;
	Thu,  9 Nov 2023 08:09:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35CEC4099F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1012A1BF475
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 08:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB15B40140
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 08:09:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB15B40140
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iMf9R4pXUWT6 for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 08:09:26 +0000 (UTC)
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C344400DC
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 08:09:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C344400DC
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2c5071165d5so7301561fa.0
 for <buildroot@buildroot.org>; Thu, 09 Nov 2023 00:09:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699517364; x=1700122164;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1UaFBx/wEUaDkyKLn6BIvDPqR/2ga4wZ1TmOGahUUJU=;
 b=QEalToTStHm6DAIRn6XU7pBwPTOGp0MJ3RaOwdgHUvJd+7OwTFlyPGDBEmlw0oXOks
 q0E/knV69sePOzVbqXA4/sA7RsQ1USfC2DPOVyOVsalvc11w4UPtgPZ1L9bqekzBx1Ps
 HIGh0JaK5zuH2qCO7WyGw/cM9tax6liMNiJrR3mhpUpLmnEbJQu+/Ge4wVpEDt03RX60
 Y1dgadCOv5O4F5JJ5Gh6H10joixjJoSStqkdyp0d8EJnxn6+so5Lvwk4QbztybRhs4Qp
 mgoDM5SbTNjX/RFvAN62oF/rk0PvYPx7zErak/u5uwVTJ8w19bg6O/FsFzMk9HrAhHE9
 C6Ng==
X-Gm-Message-State: AOJu0YwpKtCf2CByVja7Au71Ut+6kdERVQPi+0g77T+LaeFoB/up+GSU
 lxWyCk0BtTEjnSWUlKKaOI9xNK2bx7H7xUELhs8=
X-Google-Smtp-Source: AGHT+IE8afeniJnmiDbC8laVVmct9VVa1ema1L8jOxOw5ihB86TRtUlieEEkyNxNFhtUWbtnCoCU7A==
X-Received: by 2002:a2e:98c7:0:b0:2c6:f3fd:7f0 with SMTP id
 s7-20020a2e98c7000000b002c6f3fd07f0mr3472405ljj.19.1699517363833; 
 Thu, 09 Nov 2023 00:09:23 -0800 (PST)
Received: from nola.getinternet.no ([84.209.57.13])
 by smtp.gmail.com with ESMTPSA id
 n24-20020a2e8798000000b002c5120c7036sm2086360lji.128.2023.11.09.00.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 00:09:23 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu,  9 Nov 2023 09:09:19 +0100
Message-Id: <20231109080919.530366-1-jonhenrik@qbee.io>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qbee.io; s=google; t=1699517364; x=1700122164; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1UaFBx/wEUaDkyKLn6BIvDPqR/2ga4wZ1TmOGahUUJU=;
 b=N/WrIqtPPVgUUH2tJ0PvMCMjFZzu7+KTQB5FoFdEYR1okjblOuzPO4lmMhLIBom7vt
 uqMTwAhgeR0amYW3MjmiVqKyA1po1apz1DRHN2D6/N5hkFDoJwqFMlYRwx5Nel5vN7Hw
 DsPLeTCifX1X1u3eJfP+5jV8EVv5FKZKLv9No=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=qbee.io header.i=@qbee.io
 header.a=rsa-sha256 header.s=google header.b=N/WrIqtP
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBwYXRjaCBhZGQgcWJlZS1hZ2VudCwgYW4gb3BlbiBzb3VyY2UgZGV2aWNlIG1hbmFnZW1l
bnQgc29mdHdhcmUKZm9yIExpbnV4IGRldmljZXMuCgpTaWduZWQtb2ZmLWJ5OiBKb24gSGVucmlr
IEJqw7hybnN0YWQgPGpvbmhlbnJpa0BxYmVlLmlvPgotLS0KIHBhY2thZ2UvQ29uZmlnLmluICAg
ICAgICAgICAgICAgICAgfCAgMSArCiBwYWNrYWdlL3FiZWUtYWdlbnQvQ29uZmlnLmluICAgICAg
IHwgMTYgKysrKysrKysrKysKIHBhY2thZ2UvcWJlZS1hZ2VudC9xYmVlLWFnZW50Lmhhc2ggfCAg
MyArKwogcGFja2FnZS9xYmVlLWFnZW50L3FiZWUtYWdlbnQubWsgICB8IDQ1ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKwogNCBmaWxlcyBjaGFuZ2VkLCA2NSBpbnNlcnRpb25zKCspCiBj
cmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9xYmVlLWFnZW50L0NvbmZpZy5pbgogY3JlYXRlIG1v
ZGUgMTAwNjQ0IHBhY2thZ2UvcWJlZS1hZ2VudC9xYmVlLWFnZW50Lmhhc2gKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBwYWNrYWdlL3FiZWUtYWdlbnQvcWJlZS1hZ2VudC5tawoKZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvQ29uZmlnLmluIGIvcGFja2FnZS9Db25maWcuaW4KaW5kZXggY2U0NmQzMGZlZC4uMWZl
ZjM2NWMzNSAxMDA2NDQKLS0tIGEvcGFja2FnZS9Db25maWcuaW4KKysrIGIvcGFja2FnZS9Db25m
aWcuaW4KQEAgLTI3NDEsNiArMjc0MSw3IEBAIG1lbnUgIlN5c3RlbSB0b29scyIKIAlzb3VyY2Ug
InBhY2thZ2UvcHJvY3MvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9wc21pc2MvQ29uZmln
LmluIgogCXNvdXJjZSAicGFja2FnZS9wd2dlbi9Db25maWcuaW4iCisgIHNvdXJjZSAicGFja2Fn
ZS9xYmVlLWFnZW50L0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvcXVvdGEvQ29uZmlnLmlu
IgogCXNvdXJjZSAicGFja2FnZS9xdW90YXRvb2wvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2Fn
ZS9yYXVjL0NvbmZpZy5pbiIKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcWJlZS1hZ2VudC9Db25maWcu
aW4gYi9wYWNrYWdlL3FiZWUtYWdlbnQvQ29uZmlnLmluCm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IDAwMDAwMDAwMDAuLjljYzdmNWM4OGYKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL3Fi
ZWUtYWdlbnQvQ29uZmlnLmluCkBAIC0wLDAgKzEsMTYgQEAKK2NvbmZpZyBCUjJfUEFDS0FHRV9R
QkVFX0FHRU5UCisJYm9vbCAicWJlZS1hZ2VudCIKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfT1BFTlNT
SCBpZiAhQlIyX1BBQ0tBR0VfRFJPUEJFQVJfQ0xJRU5UICAjIHJ1bnRpbWUKKwlzZWxlY3QgQlIy
X1BBQ0tBR0VfSVBUQUJMRVMgICMgcnVudGltZQorCXNlbGVjdCBCUjJfUEFDS0FHRV9CVVNZQk9Y
X1NIT1dfT1RIRVJTICAjIHJ1bnRpbWUKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfU0hBRE9XICAjIHJ1
bnRpbWUKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfQkFTSCAgIyBydW50aW1lCisJaGVscAorCSAgUWJl
ZSBpcyBhIGRldmljZSBtYW5hZ2VtZW50IHBsYXRmb3JtIHRoYXQgY29tcHJpc2UKKwkgIG9mIGFu
IG9wZW4tc291cmNlIGFnZW50IGFuZCBhIGhvc3RlZCBTYWFTIGJhY2tlbmQuCisJICBUaGlzIGNv
bmZpZyBpbnN0YWxscyBwcmUtYnVpbHQgc3RhdGljIGJpbmFyaWVzIG1hZGUKKwkgIHdpdGggdGhl
IG9mZmljaWFsIHB1YmxpYyBzaWduaW5nIGtleSBmb3IgcWJlZS5pby4gVGhlCisJICBiaW5hcmll
cyB3aWxsIHdvcmsgc2VhbWxlc3NseSB3aXRoIHRoZSBxYmVlLmlvIGRldmljZQorCSAgbWFuYWdl
bWVudCBiYWNrZW5kLgorCSAgaHR0cHM6Ly9naXRodWIuY29tL3FiZWUtaW8vcWJlZS1hZ2VudAor
CSAgaHR0cHM6Ly9xYmVlLmlvCmRpZmYgLS1naXQgYS9wYWNrYWdlL3FiZWUtYWdlbnQvcWJlZS1h
Z2VudC5oYXNoIGIvcGFja2FnZS9xYmVlLWFnZW50L3FiZWUtYWdlbnQuaGFzaApuZXcgZmlsZSBt
b2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5lM2E4MTI5OGUwCi0tLSAvZGV2L251bGwKKysr
IGIvcGFja2FnZS9xYmVlLWFnZW50L3FiZWUtYWdlbnQuaGFzaApAQCAtMCwwICsxLDMgQEAKK21k
NSAgNmU0ZGM3MzIzYjk5ZDhjNWE5ODFiN2IyYzVkYTRmNjYgIHFiZWUtYWdlbnQtMjAyMy40NC50
YXIuZ3oKK3NoYTEgIGEwZDAyYzExODBmZDk3MjI4ZjIzODU5YThkZWE5MWZlODFhMzE2MjYgIHFi
ZWUtYWdlbnQtMjAyMy40NC50YXIuZ3oKK3NoYTI1NiAgZWRjZjMxOWM0Y2UxN2U5ODQ0ZGY1OThm
YTc5NmFhODczMDNhMWJmMjM4Mjk5ZGJlZWI0MWM5NGZmNWRlNWUxZCAgcWJlZS1hZ2VudC0yMDIz
LjQ0LnRhci5negpkaWZmIC0tZ2l0IGEvcGFja2FnZS9xYmVlLWFnZW50L3FiZWUtYWdlbnQubWsg
Yi9wYWNrYWdlL3FiZWUtYWdlbnQvcWJlZS1hZ2VudC5tawpuZXcgZmlsZSBtb2RlIDEwMDY0NApp
bmRleCAwMDAwMDAwMDAwLi40ZTI2MWQ2YmY0Ci0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9x
YmVlLWFnZW50L3FiZWUtYWdlbnQubWsKQEAgLTAsMCArMSw0NSBAQAorIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMKKyMKKyMgcWJlZS1hZ2VudCBwYWNrYWdlCisjCisjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIworCitRQkVFX0FHRU5UX1ZFUlNJT04gPSAyMDIzLjQ0CisjUUJFRV9BR0VOVF9TT1VSQ0Ug
PSBxYmVlLWFnZW50LSQoUUJFRV9BR0VOVF9WRVJTSU9OKS50YXIuZ3oKK1FCRUVfQUdFTlRfU0lU
RSA9IGh0dHBzOi8vY2RuLnFiZWUuaW8vc29mdHdhcmUvcWJlZS1hZ2VudC8kKFFCRUVfQUdFTlRf
VkVSU0lPTikvYmluYXJpZXMKK1FCRUVfQUdFTlRfTElDRU5TRSA9IEFwYWNoZS0yLjAKKworaWZl
cSAoJChCUjJfYXJtKSx5KQorUUJFRV9BR0VOVF9HT0FSQ0ggPSBhcm0KK2Vsc2UgaWZlcSAoJChC
UjJfYWFyY2g2NCkseSkKK1FCRUVfQUdFTlRfR09BUkNIID0gYXJtNjQKK2Vsc2UgaWZlcSAoJChC
UjJfaTM4NikseSkKK1FCRUVfQUdFTlRfR09BUkNIID0gMzg2CitlbHNlIGlmZXEgKCQoQlIyX3g4
Nl82NCkseSkKK1FCRUVfQUdFTlRfR09BUkNIID0gYW1kNjQKK2VuZGlmCisKK2RlZmluZSBRQkVF
X0FHRU5UX0JVSUxEX0NNRFMKK2VuZGVmCisKK2RlZmluZSBRQkVFX0FHRU5UX0lOU1RBTExfVEFS
R0VUX0NNRFMKKwkkKElOU1RBTEwpIC1tIDA3NTUgJChARCkvcWJlZS1hZ2VudC0kKFFCRUVfQUdF
TlRfVkVSU0lPTikvcWJlZS1hZ2VudC0kKFFCRUVfQUdFTlRfR09BUkNIKSAkKFRBUkdFVF9ESVIp
L3Vzci9iaW4vcWJlZS1hZ2VudAorCSQoSU5TVEFMTCkgLWQgLW0gMDcwMCAkKFRBUkdFVF9ESVIp
L2V0Yy9xYmVlL3Bwa2V5cworCSQoSU5TVEFMTCkgLW0gMDYwMCAkKEBEKS9xYmVlLWFnZW50LSQo
UUJFRV9BR0VOVF9WRVJTSU9OKS9zaGFyZS9zc2wvY2EuY2VydCAkKFRBUkdFVF9ESVIpL2V0Yy9x
YmVlL3Bwa2V5cy9jYS5jZXJ0CitlbmRlZgorCitkZWZpbmUgUUJFRV9BR0VOVF9JTlNUQUxMX0lO
SVRfU1lTVEVNRAorCSQoSU5TVEFMTCkgLUQgLW0gMDY0NCAkKEBEKS9xYmVlLWFnZW50LSQoUUJF
RV9BR0VOVF9WRVJTSU9OKS9pbml0LXNjcmlwdHMvc3lzdGVtZC9xYmVlLWFnZW50LnNlcnZpY2Ug
XAorCSAgJChUQVJHRVRfRElSKS91c3IvbGliL3N5c3RlbWQvc3lzdGVtL3FiZWUtYWdlbnQuc2Vy
dmljZQorZW5kZWYKKworZGVmaW5lIFFCRUVfQUdFTlRfSU5TVEFMTF9JTklUX1NZU1YKKwkkKElO
U1RBTEwpIC1EIC1tIDc1NSAkKEBEKS9xYmVlLWFnZW50LSQoUUJFRV9BR0VOVF9WRVJTSU9OKS9p
bml0LXNjcmlwdHMvc3lzdmluaXQvcWJlZS1hZ2VudCBcCisJICAkKFRBUkdFVF9ESVIpL2V0Yy9p
bml0LmQvUzk5cWJlZS1hZ2VudAorZW5kZWYKKworZGVmaW5lIFFCRUVfQUdFTlRfTElOVVhfQ09O
RklHX0ZJWFVQUworCSQoY2FsbCBLQ09ORklHX0VOQUJMRV9PUFQsQ09ORklHX1RVTikKK2VuZGVm
CisKKyQoZXZhbCAkKGdlbmVyaWMtcGFja2FnZSkpCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
