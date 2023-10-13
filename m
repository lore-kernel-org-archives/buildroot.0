Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 931D5CDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 18:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91F3F41176;
	Fri, 13 Oct 2023 18:02:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91F3F41176
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x-J1YeG2altF; Fri, 13 Oct 2023 18:02:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C44740BFC;
	Fri, 13 Oct 2023 18:02:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C44740BFC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E556E1BF425
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 18:02:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDCFF82144
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 18:02:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDCFF82144
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gtlzTqAOs2u9 for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 18:02:06 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F6E482134
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 18:02:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F6E482134
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-405361bb9f7so24840995e9.2
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 11:02:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697220124; x=1697824924;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lwCTR2Ea3ZWd0ekFHiOYm8H+zj2nfFNIpHU43DmjBzU=;
 b=fjzlSll769Q65vmIaXL7NZvO7JMpI7iMDLf7HaHO9NPsUjXP4TwFshRlK8lHXKCcX6
 dqXEeaTkC/eVOrxW1J2FfnOF61pIX7b5pE+sg9sFZlsasnC0zEIIPPGJHeoXcIrIAGQX
 qa9UWFkIlWgPSjcTp4lkOQP4keDflqiuU86Q5rTnp4gSmZmN+zXXyGQ2zMd7MOrKcjeB
 5TRh48CUHAXxkM/QRIOAH/0SSTGZZTPDiRinZeYx5LCxIUPHlNMHsFUo3CLe8wA8eS54
 3ixB1eXU8RDB5/rkFv0Uy/vmjaAN5u69JBTforaKiuldzFKZ/daeArLdSm6/dWWlAlq/
 u0mA==
X-Gm-Message-State: AOJu0YwXfzgD1Oo6LanU9gS0s3vW6Ig1bvo9iEPOf7j6Zg9JiIJ7T01J
 nEKJQgcm0IwJAzVw/9r/Fs1hq8QSKp2sgKSMY7Ozg7U7
X-Google-Smtp-Source: AGHT+IGDikS220B2786Z7nj43fx3TqlEeFqGIa16f7KeU4sbnTbozIOV3aUmhivFpaYDQCe78kFSTg==
X-Received: by 2002:a05:600c:5120:b0:407:5b54:bb09 with SMTP id
 o32-20020a05600c512000b004075b54bb09mr8625593wms.7.1697220123815; 
 Fri, 13 Oct 2023 11:02:03 -0700 (PDT)
Received: from archlinux.. ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 i9-20020a05600c354900b0040531f5c51asm788860wmq.5.2023.10.13.11.02.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 11:02:03 -0700 (PDT)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 20:01:44 +0200
Message-ID: <20231013180145.162565-3-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231013180145.162565-1-gael.portay@rtone.fr>
References: <20231013180145.162565-1-gael.portay@rtone.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtone.fr; s=google; t=1697220124; x=1697824924; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lwCTR2Ea3ZWd0ekFHiOYm8H+zj2nfFNIpHU43DmjBzU=;
 b=Yi6T7b10HHs9QDqwr1PuJ03KxDs6B5Bli6q0yEM3wvv7Wgypiu6fR9O+9NHwPEsW+h
 AwFmROY67l0oKhIh78ucsqaLNQLomI+7HNy5UYh2RWlo9zcGpejTa0xD5z3yo/qxspyD
 4H6KYyJX5n+67XFEPkftMyVHFz0Eb0ahN4JX8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=rtone.fr header.i=@rtone.fr
 header.a=rsa-sha256 header.s=google header.b=Yi6T7b10
Subject: [Buildroot] [RFC PATCH 2/3] configs: add raspberrypi 5 64-bit
 defconfig
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
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>,
 Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBjb25maWd1cmF0aW9uIGJ1aWxkcyBhIDY0LWJpdCBpbWFnZSBmb3IgUmFzcGJlcnJ5UGkg
NS4KClNpZ25lZC1vZmYtYnk6IEdhw6tsIFBPUlRBWSA8Z2FlbC5wb3J0YXlAcnRvbmUuZnI+Ci0t
LQogYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnXzVfNjRiaXQudHh0IHwgMzAgKysrKysrKysrKysr
KysrKysrKysrKwogYm9hcmQvcmFzcGJlcnJ5cGkvcmVhZG1lLnR4dCAgICAgICAgIHwgIDEgKwog
Ym9hcmQvcmFzcGJlcnJ5cGk1LTY0ICAgICAgICAgICAgICAgIHwgIDEgKwogY29uZmlncy9yYXNw
YmVycnlwaTVfNjRfZGVmY29uZmlnICAgIHwgMzggKysrKysrKysrKysrKysrKysrKysrKysrKysr
KwogNCBmaWxlcyBjaGFuZ2VkLCA3MCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQg
Ym9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnXzVfNjRiaXQudHh0CiBjcmVhdGUgbW9kZSAxMjAwMDAg
Ym9hcmQvcmFzcGJlcnJ5cGk1LTY0CiBjcmVhdGUgbW9kZSAxMDA2NDQgY29uZmlncy9yYXNwYmVy
cnlwaTVfNjRfZGVmY29uZmlnCgpkaWZmIC0tZ2l0IGEvYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmln
XzVfNjRiaXQudHh0IGIvYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnXzVfNjRiaXQudHh0Cm5ldyBm
aWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjA1MTFmMmM0MDAKLS0tIC9kZXYvbnVs
bAorKysgYi9ib2FyZC9yYXNwYmVycnlwaS9jb25maWdfNV82NGJpdC50eHQKQEAgLTAsMCArMSwz
MCBAQAorIyBQbGVhc2Ugbm90ZSB0aGF0IHRoaXMgaXMgb25seSBhIHNhbXBsZSwgd2UgcmVjb21t
ZW5kIHlvdSB0byBjaGFuZ2UgaXQgdG8gZml0CisjIHlvdXIgbmVlZHMuCisjIFlvdSBzaG91bGQg
b3ZlcnJpZGUgdGhpcyBmaWxlIHVzaW5nIEJSMl9QQUNLQUdFX1JQSV9GSVJNV0FSRV9DT05GSUdf
RklMRS4KKyMgU2VlIGh0dHA6Ly9idWlsZHJvb3Qub3JnL21hbnVhbC5odG1sI3Jvb3Rmcy1jdXN0
b20KKyMgYW5kIGh0dHA6Ly9lbGludXgub3JnL1JQaWNvbmZpZyBmb3IgYSBkZXNjcmlwdGlvbiBv
ZiBjb25maWcudHh0IHN5bnRheAorCitzdGFydF9maWxlPXN0YXJ0NC5lbGYKK2ZpeHVwX2ZpbGU9
Zml4dXA0LmRhdAorCitrZXJuZWw9SW1hZ2UKKworIyBUbyB1c2UgYW4gZXh0ZXJuYWwgaW5pdHJh
bWZzIGZpbGUKKyNpbml0cmFtZnMgcm9vdGZzLmNwaW8uZ3oKKworIyBEaXNhYmxlIG92ZXJzY2Fu
IGFzc3VtaW5nIHRoZSBkaXNwbGF5IHN1cHBvcnRzIGRpc3BsYXlpbmcgdGhlIGZ1bGwgcmVzb2x1
dGlvbgorIyBJZiB0aGUgdGV4dCBzaG93biBvbiB0aGUgc2NyZWVuIGRpc2FwcGVhcnMgb2ZmIHRo
ZSBlZGdlLCBjb21tZW50IHRoaXMgb3V0CitkaXNhYmxlX292ZXJzY2FuPTEKKworIyBIb3cgbXVj
aCBtZW1vcnkgaW4gTUIgdG8gYXNzaWduIHRvIHRoZSBHUFUgb24gUGkgbW9kZWxzIGhhdmluZwor
IyAyNTYsIDUxMiBvciAxMDI0IE1CIHRvdGFsIG1lbW9yeQorZ3B1X21lbV8yNTY9MTAwCitncHVf
bWVtXzUxMj0xMDAKK2dwdV9tZW1fMTAyND0xMDAKKworZHRvdmVybGF5PXZjNC1rbXMtdjNkLXBp
NQorZHRvdmVybGF5PWlteDIxOQorI2R0b3ZlcmxheT1vdjU2NDcKKworIyBlbmFibGUgNjRiaXRz
IHN1cHBvcnQKK2FybV82NGJpdD0xCmRpZmYgLS1naXQgYS9ib2FyZC9yYXNwYmVycnlwaS9yZWFk
bWUudHh0IGIvYm9hcmQvcmFzcGJlcnJ5cGkvcmVhZG1lLnR4dAppbmRleCBjODFmZDgwMWFlLi5m
MmFmNTAyMjUxIDEwMDY0NAotLS0gYS9ib2FyZC9yYXNwYmVycnlwaS9yZWFkbWUudHh0CisrKyBi
L2JvYXJkL3Jhc3BiZXJyeXBpL3JlYWRtZS50eHQKQEAgLTkwLDYgKzkwLDcgQEAgQWZ0ZXIgYnVp
bGRpbmcsIHlvdSBzaG91bGQgb2J0YWluIHRoaXMgdHJlZToKICAgICArLS0gYmNtMjcxMC1ycGkt
Y20zLmR0YiAgICAgICAgIFsxXQogICAgICstLSBiY20yNzExLXJwaS00LWIuZHRiICAgICAgICAg
WzFdCiAgICAgKy0tIGJjbTI3MTEtcnBpLWNtNC5kdGIgICAgICAgICBbMV0KKyAgICArLS0gYmNt
MjcxMi1ycGktNS1iLmR0YiAgICAgICAgIFsxXQogICAgICstLSBiY20yODM3LXJwaS0zLWIuZHRi
ICAgICAgICAgWzFdCiAgICAgKy0tIGJvb3QudmZhdAogICAgICstLSByb290ZnMuZXh0NApkaWZm
IC0tZ2l0IGEvYm9hcmQvcmFzcGJlcnJ5cGk1LTY0IGIvYm9hcmQvcmFzcGJlcnJ5cGk1LTY0Cm5l
dyBmaWxlIG1vZGUgMTIwMDAwCmluZGV4IDAwMDAwMDAwMDAuLmZjZGFmYzgxZWQKLS0tIC9kZXYv
bnVsbAorKysgYi9ib2FyZC9yYXNwYmVycnlwaTUtNjQKQEAgLTAsMCArMSBAQAorcmFzcGJlcnJ5
cGkKXCBObyBuZXdsaW5lIGF0IGVuZCBvZiBmaWxlCmRpZmYgLS1naXQgYS9jb25maWdzL3Jhc3Bi
ZXJyeXBpNV82NF9kZWZjb25maWcgYi9jb25maWdzL3Jhc3BiZXJyeXBpNV82NF9kZWZjb25maWcK
bmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uNzE3MDgyZjIxNQotLS0gL2Rl
di9udWxsCisrKyBiL2NvbmZpZ3MvcmFzcGJlcnJ5cGk1XzY0X2RlZmNvbmZpZwpAQCAtMCwwICsx
LDM4IEBACitCUjJfYWFyY2g2ND15CitCUjJfY29ydGV4X2E3Nl9hNTU9eQorQlIyX0FSTV9GUFVf
VkZQVjQ9eQorCitCUjJfVE9PTENIQUlOX0JVSUxEUk9PVF9DWFg9eQorCitCUjJfU1lTVEVNX0RI
Q1A9ImV0aDAiCisKKyMgTGludXggaGVhZGVycyBzYW1lIGFzIGtlcm5lbCwgYSA2LjEgc2VyaWVz
CitCUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9NXzZfMT15CisKK0JSMl9MSU5V
WF9LRVJORUw9eQorQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVEFSQkFMTD15CitCUjJfTElOVVhf
S0VSTkVMX0NVU1RPTV9UQVJCQUxMX0xPQ0FUSU9OPSIkKGNhbGwgZ2l0aHViLHJhc3BiZXJyeXBp
LGxpbnV4LGZlYjRlYTUxZTc3YWYwOWMxYTRjN2MzZTVkZDMzMjM3NzUwZjk1Y2QpL2xpbnV4LWZl
YjRlYTUxZTc3YWYwOWMxYTRjN2MzZTVkZDMzMjM3NzUwZjk1Y2QudGFyLmd6IgorQlIyX0xJTlVY
X0tFUk5FTF9ERUZDT05GSUc9ImJjbTI3MTIiCisKKyMgQnVpbGQgdGhlIERUQiBmcm9tIHRoZSBr
ZXJuZWwgc291cmNlcworQlIyX0xJTlVYX0tFUk5FTF9EVFNfU1VQUE9SVD15CitCUjJfTElOVVhf
S0VSTkVMX0lOVFJFRV9EVFNfTkFNRT0iYnJvYWRjb20vYmNtMjcxMi1ycGktNS1iIgorCitCUjJf
TElOVVhfS0VSTkVMX05FRURTX0hPU1RfT1BFTlNTTD15CisKK0JSMl9QQUNLQUdFX1JQSV9GSVJN
V0FSRT15CitCUjJfUEFDS0FHRV9SUElfRklSTVdBUkVfVkFSSUFOVF9QSTQ9eQorQlIyX1BBQ0tB
R0VfUlBJX0ZJUk1XQVJFX0NPTkZJR19GSUxFPSJib2FyZC9yYXNwYmVycnlwaTUtNjQvY29uZmln
XzVfNjRiaXQudHh0IgorCisjIFJlcXVpcmVkIHRvb2xzIHRvIGNyZWF0ZSB0aGUgU0QgaW1hZ2UK
K0JSMl9QQUNLQUdFX0hPU1RfRE9TRlNUT09MUz15CitCUjJfUEFDS0FHRV9IT1NUX0dFTklNQUdF
PXkKK0JSMl9QQUNLQUdFX0hPU1RfTVRPT0xTPXkKKworIyBGaWxlc3lzdGVtIC8gaW1hZ2UKK0JS
Ml9UQVJHRVRfUk9PVEZTX0VYVDI9eQorQlIyX1RBUkdFVF9ST09URlNfRVhUMl80PXkKK0JSMl9U
QVJHRVRfUk9PVEZTX0VYVDJfU0laRT0iMTIwTSIKKyMgQlIyX1RBUkdFVF9ST09URlNfVEFSIGlz
IG5vdCBzZXQKK0JSMl9ST09URlNfUE9TVF9CVUlMRF9TQ1JJUFQ9ImJvYXJkL3Jhc3BiZXJyeXBp
NS02NC9wb3N0LWJ1aWxkLnNoIgorQlIyX1JPT1RGU19QT1NUX0lNQUdFX1NDUklQVD0iYm9hcmQv
cmFzcGJlcnJ5cGk1LTY0L3Bvc3QtaW1hZ2Uuc2giCi0tIAoyLjQyLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
