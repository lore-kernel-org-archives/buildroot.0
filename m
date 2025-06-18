Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0985DC71157
	for <buildroot@archiver.kernel.org>; Wed, 18 Jun 2025 14:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD4EE80F8E;
	Wed, 18 Jun 2025 14:28:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S8sDRZAc0CcL; Wed, 18 Jun 2025 14:28:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB4CD80F7F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB4CD80F7F;
	Wed, 18 Jun 2025 14:28:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C48F151
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 14:28:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E517409B0
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 14:28:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FL12E-c9yh1J for <buildroot@buildroot.org>;
 Wed, 18 Jun 2025 14:28:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9457840915
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9457840915
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9457840915
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 14:28:43 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a4fea34e07so4003073f8f.1
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 07:28:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750256921; x=1750861721;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B+Rn57NEEweilEovw6NrGwbO95FnZe3uqbWTKYqqZLM=;
 b=gVbtjbwo33LapWNCKRllXTDlVtSl3drmtetxH1QWeQCjUnp7YS9W5zneIm5/kA4lCP
 aiSnrgSJS+oN31l6X1Fv3F7xQ+UExpWm0XhM5WjjfjhGHE7ffuJbzIjm5/vBlPoOHaY2
 9YxvDsYo7fm0mq9zKCpHdnedPplrbP+KZKvTQRDa2TAfKvEahDoCZZF17fU2/CLyY3qY
 CckHBKl52+AzIzQJqyJUkSCiX0XTQuMOU2K+At8ErqjpMlcJTd7oW5riUF83zh4IXD14
 cy8k0ZbOiQ0skqiekndN+IOKr1sdwFtgDttbuqr6hbZghZ6MrbAuqTYyUR72WCdEUUOV
 9PgQ==
X-Gm-Message-State: AOJu0YxSYjuiol30diGPDA/1BLdHjZGnP6+g9OHV+OwS6zRVmHyNK8Ap
 qCSKofunlEo+9/oecd2S+IRobbQSYe6YrdCnqjOEUC+LOsIYYgVq9m5ms7JCHcIZ5nKEQrKpEPx
 iB3u3eDc=
X-Gm-Gg: ASbGnct5dbE6WKAX4vUaTAzNHpbjLLfZe0jXjSLLfPDcC3tfcPilvIthGc/SV2Pax/r
 zW/WPnkYxBikxWVYsYxA6DsAlubZLHBlf1K8PsrMyV4/9KoLZyLqMvK+PfbUi4hi8mvuEQHnD2w
 J6nBiW0pfd48Tm1TO6uC5l/yB+HKK/YAJzQK67BMSB4Iump/wwJjqdjPM5lYdtPlIBpMpH3ia4K
 2Be5QxSk/ugtozKXcpDHFS9vJ097XWBucPwzmSj4ZqUS9sINwTcmDHLwZ1tyrHFMqZm+HPHnHlI
 EpjlFpL4quJI2A1lQG/usHHUQ3ChHh0I8dSQzrzGAiRr2jfXhgxi8KNefybznRumWlEBhq6QXQ=
 =
X-Google-Smtp-Source: AGHT+IHTRASGU2DSvGy6214ALQLHbwcy8jYmJSz9W5DBUFZ/W/Ino9SLXkr2GM4e/SoKCU19YxW1og==
X-Received: by 2002:a05:6000:4024:b0:3a4:edf5:b942 with SMTP id
 ffacd0b85a97d-3a572e586f1mr14599214f8f.57.1750256921235; 
 Wed, 18 Jun 2025 07:28:41 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a577e928f7sm13580101f8f.64.2025.06.18.07.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 07:28:28 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 08F995F89B;
 Wed, 18 Jun 2025 15:28:26 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Wed, 18 Jun 2025 15:28:21 +0100
Message-ID: <20250618142825.758131-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250618142825.758131-1-alex.bennee@linaro.org>
References: <20250618142825.758131-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750256921; x=1750861721; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B+Rn57NEEweilEovw6NrGwbO95FnZe3uqbWTKYqqZLM=;
 b=Gp7We2T7v7WVarbhKwA6hBUGIPYGRdySDp+x6JBaJn1c6CStr7cWSp42C7TgsQiEnM
 bwImYhAx4cgOfuV3+Cf2yplVasfaMtAk5DH6Y24etMCD5aH+FdZcsSaqTF6d9GEb9Ycs
 Itjf9lOotZJd3+odEXgk9+NOT1EBTl1grr5VwpNqLq81v+Vo4DApGlaUg5/Ydkiw0dO1
 Mf1IhLn0J7vC4aQhzVVhFeJFjKDuCY4+9t6450EuK0s7K4PkgB90y8/xai/DL3+Tg0Qt
 ErubaM0i39bgQpMnjlDmV1bpQHdg90Xcb8exWQs6Bj46AUgUMCapAOpcxi8Kz4VlvHh4
 cg+A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=Gp7We2T7
Subject: [Buildroot] [PATCH v7 2/4] package/vulkan-[headers|loader|tools]:
 bump to 1.4.317 release
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

VXBkYXRlIHRvIHRoZSBjdXJyZW50IHJlbGVhc2UuIFdlIG5vdyBuZWVkIHRoZSByZWNlbnRseSBh
ZGRlZAp2dWxrYW4tc2RrIHRvIGhhdmUgYWNjZXNzIHRvIHRoZSB2b2xrIGxvYWRlci4gVXBkYXRl
IHRoZSBkZXBlbmRzCmNvbW1lbnRzIGFwcHJvcHJpYXRlbHkuCgpTaWduZWQtb2ZmLWJ5OiBBbGV4
IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+CgotLS0KdjcKICAtIGRlcGVuZHMgb24g
IUJSMl9TVEFUSUNfTElCUyAjIHZ1bGthbi1sb2FkZXIsIHZ1bGthbi1zZGsKdjUKICAtIDEuNC4z
MTYgLT4gMS40LjMxNwp2NAogIC0gMS40LjMwNiAtPiAxLjQuMzE2CiAgLSBkb2Vzbid0IHNlZW0g
dG8gbmVlZCBpc3lzdGVtIHBhdGNoIG5vdwp2MwogIC0gZml4IHVwIGNvbW1lbnQsIHByb3Blcmx5
IHNlbGVjdCB0aGUgU0RLIHBhY2thZ2UKLS0tCiBwYWNrYWdlL3Z1bGthbi1oZWFkZXJzL3Z1bGth
bi1oZWFkZXJzLmhhc2ggfCAyICstCiBwYWNrYWdlL3Z1bGthbi1oZWFkZXJzL3Z1bGthbi1oZWFk
ZXJzLm1rICAgfCAyICstCiBwYWNrYWdlL3Z1bGthbi1sb2FkZXIvdnVsa2FuLWxvYWRlci5oYXNo
ICAgfCAyICstCiBwYWNrYWdlL3Z1bGthbi10b29scy9Db25maWcuaW4gICAgICAgICAgICAgfCA1
ICsrKy0tCiBwYWNrYWdlL3Z1bGthbi10b29scy92dWxrYW4tdG9vbHMuaGFzaCAgICAgfCAyICst
CiBwYWNrYWdlL3Z1bGthbi10b29scy92dWxrYW4tdG9vbHMubWsgICAgICAgfCAzICsrLQogNiBm
aWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvcGFja2FnZS92dWxrYW4taGVhZGVycy92dWxrYW4taGVhZGVycy5oYXNoIGIvcGFja2FnZS92
dWxrYW4taGVhZGVycy92dWxrYW4taGVhZGVycy5oYXNoCmluZGV4IGIzOGJmY2ZmNDcuLjI4NjYz
OWI1NzkgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvdnVsa2FuLWhlYWRlcnMvdnVsa2FuLWhlYWRlcnMu
aGFzaAorKysgYi9wYWNrYWdlL3Z1bGthbi1oZWFkZXJzL3Z1bGthbi1oZWFkZXJzLmhhc2gKQEAg
LTEsMyArMSwzIEBACiAjIExvY2FsbHkgY2FsY3VsYXRlZAotc2hhMjU2ICAzMTdlNDY3YTVmYjJl
YWE2YTE4Yjk4NGVjNzBmZGJmYWNjZDkzNTk1YTNlNmY0YmNjZWNhN2QzZmFiMjgwNTA1ICB2dWxr
YW4taGVhZGVycy0xLjMuMjYyLnRhci5negorc2hhMjU2ICA3ODY2NTk1OWQxMGIwOTA2MWQ4YzNl
MjFkYjhiZjNlOGI2OTllMmQzZDUzMmZjZTg1MGEzMjMxMmRiYTcyMjhiICB2dWxrYW4taGVhZGVy
cy0xLjQuMzE3LnRhci5negogc2hhMjU2ICBhYzI0ZTVlYTkyMGU0MzE4ZTRkMDJjNDA4NmFlNTFm
NTNjZmIwM2ZlZWQwNmMxOGRmMTAxOWU3YWRhMWVjN2JjICBMSUNFTlNFLm1kCmRpZmYgLS1naXQg
YS9wYWNrYWdlL3Z1bGthbi1oZWFkZXJzL3Z1bGthbi1oZWFkZXJzLm1rIGIvcGFja2FnZS92dWxr
YW4taGVhZGVycy92dWxrYW4taGVhZGVycy5tawppbmRleCAyMGIyNDgzNjRkLi41MmQ1YjU2MDg2
IDEwMDY0NAotLS0gYS9wYWNrYWdlL3Z1bGthbi1oZWFkZXJzL3Z1bGthbi1oZWFkZXJzLm1rCisr
KyBiL3BhY2thZ2UvdnVsa2FuLWhlYWRlcnMvdnVsa2FuLWhlYWRlcnMubWsKQEAgLTYsNyArNiw3
IEBACiAKICMgTm90ZTogY2hhbmdpbmcgdGhpcyB2ZXJzaW9uIHdpbGwgYWxzbyBhZmZlY3QgdnVs
a2FuLWxvYWRlciBhbmQKICMgdnVsa2FuLXRvb2xzLCBzbyBwbGVhc2UgdXBkYXRlIHRob3NlIHBh
Y2thZ2VzIGFzIHdlbGwuCi1WVUxLQU5fSEVBREVSU19WRVJTSU9OID0gMS4zLjI2MgorVlVMS0FO
X0hFQURFUlNfVkVSU0lPTiA9IDEuNC4zMTcKIFZVTEtBTl9IRUFERVJTX1NJVEUgPSAkKGNhbGwg
Z2l0aHViLEtocm9ub3NHcm91cCxWdWxrYW4tSGVhZGVycyx2JChWVUxLQU5fSEVBREVSU19WRVJT
SU9OKSkKIFZVTEtBTl9IRUFERVJTX0xJQ0VOU0UgPSBBcGFjaGUtMi4wLCBNSVQKIFZVTEtBTl9I
RUFERVJTX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFLm1kCmRpZmYgLS1naXQgYS9wYWNrYWdlL3Z1
bGthbi1sb2FkZXIvdnVsa2FuLWxvYWRlci5oYXNoIGIvcGFja2FnZS92dWxrYW4tbG9hZGVyL3Z1
bGthbi1sb2FkZXIuaGFzaAppbmRleCBlMDllY2RhOGE5Li41YmZjMDJmNWM4IDEwMDY0NAotLS0g
YS9wYWNrYWdlL3Z1bGthbi1sb2FkZXIvdnVsa2FuLWxvYWRlci5oYXNoCisrKyBiL3BhY2thZ2Uv
dnVsa2FuLWxvYWRlci92dWxrYW4tbG9hZGVyLmhhc2gKQEAgLTEsMyArMSwzIEBACiAjIExvY2Fs
bHkgY2FsY3VsYXRlZAotc2hhMjU2ICAzYmJhYTVlZTY0MDU4YTg5OTQ5ZWI3NzdkZTY2Y2U5NGJm
ZTMxNDE4OTI1MTQxNzJjZmM5NDUxYzc1NjgwMmQ1ICB2dWxrYW4tbG9hZGVyLTEuMy4yNjIudGFy
Lmd6CitzaGEyNTYgIGU0ZTE4NTg1ZmU5MDJlZTA0ZTg2YzFjZGIyOTk2YjY4NmJmZmVmMmNhYjAy
Y2I2MDc5MjIxZmU2OWRmMDVhZjggIHZ1bGthbi1sb2FkZXItMS40LjMxNy50YXIuZ3oKIHNoYTI1
NiAgNDNjMGEzN2U2YTBmYTdmZjNjODQzYjNlYzVhNGZhYzg0YjcxMjU1OGRkYWMxMDNmYmQ0YzE2
NDk2NjJhOWVjZSAgTElDRU5TRS50eHQKZGlmZiAtLWdpdCBhL3BhY2thZ2UvdnVsa2FuLXRvb2xz
L0NvbmZpZy5pbiBiL3BhY2thZ2UvdnVsa2FuLXRvb2xzL0NvbmZpZy5pbgppbmRleCA1NGZhNTM5
ZGFiLi5iMDA3ZTVkYmExIDEwMDY0NAotLS0gYS9wYWNrYWdlL3Z1bGthbi10b29scy9Db25maWcu
aW4KKysrIGIvcGFja2FnZS92dWxrYW4tdG9vbHMvQ29uZmlnLmluCkBAIC0xLDE3ICsxLDE4IEBA
CiBjb25maWcgQlIyX1BBQ0tBR0VfVlVMS0FOX1RPT0xTCiAJYm9vbCAidnVsa2FuLXRvb2xzIgog
CWRlcGVuZHMgb24gQlIyX0lOU1RBTExfTElCU1REQ1BQICMgdnVsa2FuLWxvYWRlcgotCWRlcGVu
ZHMgb24gIUJSMl9TVEFUSUNfTElCUyAjIHZ1bGxhbi1sb2FkZXIKKwlkZXBlbmRzIG9uICFCUjJf
U1RBVElDX0xJQlMgIyB2dWxrYW4tbG9hZGVyLCB2dWxrYW4tc2RrCiAJZGVwZW5kcyBvbiBCUjJf
VE9PTENIQUlOX0dDQ19BVF9MRUFTVF80XzkgIyBDKysxMQogCWRlcGVuZHMgb24gQlIyX1RPT0xD
SEFJTl9IQVNfVEhSRUFEUyAjIHZ1bGthbi1sb2FkZXIKIAlzZWxlY3QgQlIyX1BBQ0tBR0VfVlVM
S0FOX0hFQURFUlMKIAlzZWxlY3QgQlIyX1BBQ0tBR0VfVlVMS0FOX0xPQURFUgorCXNlbGVjdCBC
UjJfUEFDS0FHRV9WVUxLQU5fU0RLCiAKIAloZWxwCiAJICBUaGUgS2hyb25vcyBvZmZpY2lhbCBW
dWxrYW4gVG9vbHMgYW5kIFV0aWxpdGllcy4KIAogCSAgaHR0cHM6Ly9naXRodWIuY29tL0tocm9u
b3NHcm91cC9WdWxrYW4tVG9vbHMKIAotY29tbWVudCAidnVsa2FuLXRvb2xzIG5lZWRzIGEgdG9v
bGNoYWluIHcvIEMrKywgZHluYW1pYyBsaWJyYXJ5LCB0aHJlYWRzLCBnY2MgPj0gNC45IgorY29t
bWVudCAidnVsa2FuLXRvb2xzIG5lZWRzIGEgdG9vbGNoYWluIHcvIEMrKywgZHluYW1pYyBsaWJy
YXJ5LCB0aHJlYWRzLCBnY2MgPj0gNC45LCB2dWxrYW4tc2RrIgogCWRlcGVuZHMgb24gIUJSMl9J
TlNUQUxMX0xJQlNURENQUCB8fCBCUjJfU1RBVElDX0xJQlMgfHwgXAogCQkhQlIyX1RPT0xDSEFJ
Tl9IQVNfVEhSRUFEUyB8fCAhQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfNF85CmRpZmYgLS1n
aXQgYS9wYWNrYWdlL3Z1bGthbi10b29scy92dWxrYW4tdG9vbHMuaGFzaCBiL3BhY2thZ2UvdnVs
a2FuLXRvb2xzL3Z1bGthbi10b29scy5oYXNoCmluZGV4IDI0YzA2OTc3ODQuLjUwNDE3NzM3OWIg
MTAwNjQ0Ci0tLSBhL3BhY2thZ2UvdnVsa2FuLXRvb2xzL3Z1bGthbi10b29scy5oYXNoCisrKyBi
L3BhY2thZ2UvdnVsa2FuLXRvb2xzL3Z1bGthbi10b29scy5oYXNoCkBAIC0xLDMgKzEsMyBAQAog
IyBMb2NhbGx5IGNhbGN1bGF0ZWQKLXNoYTI1NiAgOGM3N2QwMjY5NGQwNTE2YWUyYmEzZjM3MTg3
NDU2NDdlODdlNzg4ZWY5M2ZhYWJiMmUzNjc0ZmYzMjYwODAxMCAgdnVsa2FuLXRvb2xzLTEuMy4y
NjIudGFyLmd6CitzaGEyNTYgIDQ1ODYzMDlhYjViMmE5NTg0ZmRlNjJmZDg1YjBlZjViYjk4YjRj
ZGJjYTljYjFiYTNhMmI0OTc4ZGMyZjM1NWMgIHZ1bGthbi10b29scy0xLjQuMzE3LnRhci5negog
c2hhMjU2ICBjZmM3NzQ5Yjk2ZjYzYmQzMWMzYzQyYjVjNDcxYmY3NTY4MTQwNTNlODQ3YzEwZjNl
YjAwMzQxN2JjNTIzZDMwICBMSUNFTlNFLnR4dApkaWZmIC0tZ2l0IGEvcGFja2FnZS92dWxrYW4t
dG9vbHMvdnVsa2FuLXRvb2xzLm1rIGIvcGFja2FnZS92dWxrYW4tdG9vbHMvdnVsa2FuLXRvb2xz
Lm1rCmluZGV4IDlmNWJmNDZiNzkuLjlkZWVkYTYwODYgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvdnVs
a2FuLXRvb2xzL3Z1bGthbi10b29scy5taworKysgYi9wYWNrYWdlL3Z1bGthbi10b29scy92dWxr
YW4tdG9vbHMubWsKQEAgLTExLDcgKzExLDggQEAgVlVMS0FOX1RPT0xTX0xJQ0VOU0VfRklMRVMg
PSBMSUNFTlNFLnR4dAogCiBWVUxLQU5fVE9PTFNfREVQRU5ERU5DSUVTID0gXAogCXZ1bGthbi1o
ZWFkZXJzIFwKLQl2dWxrYW4tbG9hZGVyCisJdnVsa2FuLWxvYWRlciBcCisJdnVsa2FuLXNkawog
CiBWVUxLQU5fVE9PTFNfQ09ORl9PUFRTICs9IFwKIAktREJVSUxEX0NVQkU9T0ZGIFwKLS0gCjIu
NDcuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
