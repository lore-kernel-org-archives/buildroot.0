Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38920C61D90
	for <buildroot@archiver.kernel.org>; Tue, 21 Nov 2023 19:36:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB73981F46;
	Tue, 21 Nov 2023 19:36:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB73981F46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m428riCyYR4s; Tue, 21 Nov 2023 19:36:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2C1581F4C;
	Tue, 21 Nov 2023 19:35:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2C1581F4C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D04521BF30C
 for <buildroot@lists.busybox.net>; Tue, 21 Nov 2023 19:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2CDE414DB
 for <buildroot@lists.busybox.net>; Tue, 21 Nov 2023 19:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2CDE414DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ArcxWjYUOeCV for <buildroot@lists.busybox.net>;
 Tue, 21 Nov 2023 19:35:09 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CBFF240017
 for <buildroot@buildroot.org>; Tue, 21 Nov 2023 19:35:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBFF240017
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4083dbc43cfso25002895e9.3
 for <buildroot@buildroot.org>; Tue, 21 Nov 2023 11:35:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700595306; x=1701200106;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ODz03Pze8EjqhtaU041VtTb6R8sXSEXVlzhTc38myE0=;
 b=uJQNU/KufLy5Gd4cIiqKIP3BLIq5eyOPi6x0OI4T4R65fWGeTzeosBlh2cudiw2xm3
 LZEhtrQI5TlJW0Q56Ea3blI4GEUKNFU+XFw33mpbCZH95f2TRemsW9jC+Hd4B+kLNlm4
 /Fh0g33at2O70mnLc3FFOJjas9tnZJUNyMzNtMgR4xOuauH2dCYXAdykelUv8eAq8VwA
 FGFyFAxjGoY2oRQrFZySy7f4DKDO2qgTfXqXnkev8aEkPxzOtEom4AultzAtGhZMkh3B
 MhtiyfTJLXUcXcamOEYf8JFAwIopdkRdy2M2W2gTBaOCrr/iXdZ9rMikIN8ddlRG6cKA
 D7mw==
X-Gm-Message-State: AOJu0YxmDj9DtvrrVopNNtaSNMpGAr+D/MMWS5vfjL91ISfjd4LpRvp4
 Ipvx54gi9MdXt3LrgZAmKt2pNmn4ehj5U6gLcrY=
X-Google-Smtp-Source: AGHT+IHem7uYZAOh/9v7vqun56KvhFMXwWUJ0qejtp/YU5+hSEUDDM6K09X+Bm1COGIcFpTpz90Aww==
X-Received: by 2002:a05:600c:3c89:b0:40a:483f:f858 with SMTP id
 bg9-20020a05600c3c8900b0040a483ff858mr250674wmb.6.1700595306224; 
 Tue, 21 Nov 2023 11:35:06 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 z17-20020a1c4c11000000b0040a44179a88sm21879043wmf.42.2023.11.21.11.35.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 11:35:06 -0800 (PST)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org
Date: Tue, 21 Nov 2023 20:34:48 +0100
Message-ID: <20231121193448.1151936-5-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231121193448.1151936-1-gael.portay@rtone.fr>
References: <20231121193448.1151936-1-gael.portay@rtone.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtone.fr; s=google; t=1700595306; x=1701200106; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ODz03Pze8EjqhtaU041VtTb6R8sXSEXVlzhTc38myE0=;
 b=GGU/8HHcoo4Lfm5St2weImOivM4EJ+cG0z4Nkd77SfIeZRebkkhhYxQTUgzk8nW0w4
 Eemd9eHVmaHLJTFjwVnTvaMCCY9DfzVhc5bNHK3QSGxJdm/Dwhu4BuQijg2lRPGnnx+8
 5Vdv1otXgZzCm1KPMjNFSOpx8LP1/FDI7NCsQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=rtone.fr header.i=@rtone.fr
 header.a=rsa-sha256 header.s=google header.b=GGU/8HHc
Subject: [Buildroot] [v1 4/4] configs: add raspberrypi 5 defconfig
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
Cc: Martin Bark <martin@barkynet.com>,
 =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBjb25maWd1cmF0aW9uIGJ1aWxkcyBhbiBpbWFnZSBmb3IgdGhlIFJhc3BiZXJyeVBpIDUu
CgpTaWduZWQtb2ZmLWJ5OiBHYcOrbCBQT1JUQVkgPGdhZWwucG9ydGF5QHJ0b25lLmZyPgotLS0K
IGJvYXJkL3Jhc3BiZXJyeXBpL2NtZGxpbmVfNS50eHQgfCAgMSArCiBib2FyZC9yYXNwYmVycnlw
aS9jb25maWdfNS50eHQgIHwgMjQgKysrKysrKysrKysrKysrKysrKysKIGJvYXJkL3Jhc3BiZXJy
eXBpL3JlYWRtZS50eHQgICAgfCAgOCArKysrKystCiBib2FyZC9yYXNwYmVycnlwaTUgICAgICAg
ICAgICAgIHwgIDEgKwogY29uZmlncy9yYXNwYmVycnlwaTVfZGVmY29uZmlnICB8IDM5ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKwogNSBmaWxlcyBjaGFuZ2VkLCA3MiBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgYm9hcmQvcmFzcGJlcnJ5
cGkvY21kbGluZV81LnR4dAogY3JlYXRlIG1vZGUgMTAwNjQ0IGJvYXJkL3Jhc3BiZXJyeXBpL2Nv
bmZpZ181LnR4dAogY3JlYXRlIG1vZGUgMTIwMDAwIGJvYXJkL3Jhc3BiZXJyeXBpNQogY3JlYXRl
IG1vZGUgMTAwNjQ0IGNvbmZpZ3MvcmFzcGJlcnJ5cGk1X2RlZmNvbmZpZwoKZGlmZiAtLWdpdCBh
L2JvYXJkL3Jhc3BiZXJyeXBpL2NtZGxpbmVfNS50eHQgYi9ib2FyZC9yYXNwYmVycnlwaS9jbWRs
aW5lXzUudHh0Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmFjNDU3MzUz
ZTIKLS0tIC9kZXYvbnVsbAorKysgYi9ib2FyZC9yYXNwYmVycnlwaS9jbWRsaW5lXzUudHh0CkBA
IC0wLDAgKzEgQEAKK3Jvb3Q9L2Rldi9tbWNibGswcDIgcm9vdHdhaXQgY29uc29sZT10dHkxIGNv
bnNvbGU9dHR5QU1BMTAsMTE1MjAwCmRpZmYgLS1naXQgYS9ib2FyZC9yYXNwYmVycnlwaS9jb25m
aWdfNS50eHQgYi9ib2FyZC9yYXNwYmVycnlwaS9jb25maWdfNS50eHQKbmV3IGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uZDI1YzI5NTU4ZAotLS0gL2Rldi9udWxsCisrKyBiL2Jv
YXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ181LnR4dApAQCAtMCwwICsxLDI0IEBACisjIFBsZWFzZSBu
b3RlIHRoYXQgdGhpcyBpcyBvbmx5IGEgc2FtcGxlLCB3ZSByZWNvbW1lbmQgeW91IHRvIGNoYW5n
ZSBpdCB0byBmaXQKKyMgeW91ciBuZWVkcy4KKyMgWW91IHNob3VsZCBvdmVycmlkZSB0aGlzIGZp
bGUgdXNpbmcgQlIyX1BBQ0tBR0VfUlBJX0ZJUk1XQVJFX0NPTkZJR19GSUxFLgorIyBTZWUgaHR0
cDovL2J1aWxkcm9vdC5vcmcvbWFudWFsLmh0bWwjcm9vdGZzLWN1c3RvbQorIyBhbmQgaHR0cDov
L2VsaW51eC5vcmcvUlBpY29uZmlnIGZvciBhIGRlc2NyaXB0aW9uIG9mIGNvbmZpZy50eHQgc3lu
dGF4CisKK2tlcm5lbD1JbWFnZQorCisjIFRvIHVzZSBhbiBleHRlcm5hbCBpbml0cmFtZnMgZmls
ZQorI2luaXRyYW1mcyByb290ZnMuY3Bpby5negorCisjIERpc2FibGUgb3ZlcnNjYW4gYXNzdW1p
bmcgdGhlIGRpc3BsYXkgc3VwcG9ydHMgZGlzcGxheWluZyB0aGUgZnVsbCByZXNvbHV0aW9uCisj
IElmIHRoZSB0ZXh0IHNob3duIG9uIHRoZSBzY3JlZW4gZGlzYXBwZWFycyBvZmYgdGhlIGVkZ2Us
IGNvbW1lbnQgdGhpcyBvdXQKK2Rpc2FibGVfb3ZlcnNjYW49MQorCisjIEhvdyBtdWNoIG1lbW9y
eSBpbiBNQiB0byBhc3NpZ24gdG8gdGhlIEdQVSBvbiBQaSBtb2RlbHMgaGF2aW5nCisjIDI1Niwg
NTEyIG9yIDEwMjQgTUIgdG90YWwgbWVtb3J5CitncHVfbWVtXzI1Nj0xMDAKK2dwdV9tZW1fNTEy
PTEwMAorZ3B1X21lbV8xMDI0PTEwMAorCitkdG92ZXJsYXk9dmM0LWttcy12M2QtcGk1CitkdG92
ZXJsYXk9aW14MjE5CisjZHRvdmVybGF5PW92NTY0NwpkaWZmIC0tZ2l0IGEvYm9hcmQvcmFzcGJl
cnJ5cGkvcmVhZG1lLnR4dCBiL2JvYXJkL3Jhc3BiZXJyeXBpL3JlYWRtZS50eHQKaW5kZXggYzgx
ZmQ4MDFhZS4uNGJkZDdiM2U4YyAxMDA2NDQKLS0tIGEvYm9hcmQvcmFzcGJlcnJ5cGkvcmVhZG1l
LnR4dAorKysgYi9ib2FyZC9yYXNwYmVycnlwaS9yZWFkbWUudHh0CkBAIC0xMCw2ICsxMCw3IEBA
IFRoZXNlIGluc3RydWN0aW9ucyBhcHBseSB0byBhbGwgbW9kZWxzIG9mIHRoZSBSYXNwYmVycnkg
UGk6CiAgIC0gdGhlIG1vZGVsIEIzIChha2EgUmFzcGJlcnJ5IFBpIDMpLgogICAtIHRoZSBtb2Rl
bCBCNCAoYWthIFJhc3BiZXJyeSBQaSA0KS4KICAgLSB0aGUgbW9kZWwgQ000IChha2EgUmFzcGJl
cnJ5IFBpIENvbXB1dGUgTW9kdWxlIDQgYW5kIElPIEJvYXJkKS4KKyAgLSB0aGUgbW9kZWwgQjUg
KGFrYSBSYXNwYmVycnkgUGkgNSkuCiAKIEhvdyB0byBidWlsZCBpdAogPT09PT09PT09PT09PT09
CkBAIC0xNyw3ICsxOCw3IEBAIEhvdyB0byBidWlsZCBpdAogQ29uZmlndXJlIEJ1aWxkcm9vdAog
LS0tLS0tLS0tLS0tLS0tLS0tLQogCi1UaGVyZSBhcmUgdHdvIFJhc3BiZXJyeVBpIGRlZmNvbmZp
ZyBmaWxlcyBpbiBCdWlsZHJvb3QsIG9uZSBmb3IgZWFjaAorVGhlcmUgYXJlIHNlcnZlcmFsIFJh
c3BiZXJyeVBpIGRlZmNvbmZpZyBmaWxlcyBpbiBCdWlsZHJvb3QsIG9uZSBmb3IgZWFjaAogbWFq
b3IgdmFyaWFudCwgd2hpY2ggeW91IHNob3VsZCBiYXNlIHlvdXIgd29yayBvbjoKIAogRm9yIG1v
ZGVscyBBLCBCLCBBKyBvciBCKzoKQEAgLTYwLDYgKzYxLDEwIEBAIG9yIGZvciBDTTQgKG9uIElP
IEJvYXJkIC0gNjQgYml0KToKIAogICAkIG1ha2UgcmFzcGJlcnJ5cGljbTRpb182NF9kZWZjb25m
aWcKIAorRm9yIG1vZGVsIDUgQiAoNjQgYml0KToKKworICAkIG1ha2UgcmFzcGJlcnJ5cGk1XzY0
X2RlZmNvbmZpZworCiBCdWlsZCB0aGUgcm9vdGZzCiAtLS0tLS0tLS0tLS0tLS0tCiAKQEAgLTkw
LDYgKzk1LDcgQEAgQWZ0ZXIgYnVpbGRpbmcsIHlvdSBzaG91bGQgb2J0YWluIHRoaXMgdHJlZToK
ICAgICArLS0gYmNtMjcxMC1ycGktY20zLmR0YiAgICAgICAgIFsxXQogICAgICstLSBiY20yNzEx
LXJwaS00LWIuZHRiICAgICAgICAgWzFdCiAgICAgKy0tIGJjbTI3MTEtcnBpLWNtNC5kdGIgICAg
ICAgICBbMV0KKyAgICArLS0gYmNtMjcxMi1ycGktNS1iLmR0YiAgICAgICAgIFsxXQogICAgICst
LSBiY20yODM3LXJwaS0zLWIuZHRiICAgICAgICAgWzFdCiAgICAgKy0tIGJvb3QudmZhdAogICAg
ICstLSByb290ZnMuZXh0NApkaWZmIC0tZ2l0IGEvYm9hcmQvcmFzcGJlcnJ5cGk1IGIvYm9hcmQv
cmFzcGJlcnJ5cGk1Cm5ldyBmaWxlIG1vZGUgMTIwMDAwCmluZGV4IDAwMDAwMDAwMDAuLmZjZGFm
YzgxZWQKLS0tIC9kZXYvbnVsbAorKysgYi9ib2FyZC9yYXNwYmVycnlwaTUKQEAgLTAsMCArMSBA
QAorcmFzcGJlcnJ5cGkKXCBObyBuZXdsaW5lIGF0IGVuZCBvZiBmaWxlCmRpZmYgLS1naXQgYS9j
b25maWdzL3Jhc3BiZXJyeXBpNV9kZWZjb25maWcgYi9jb25maWdzL3Jhc3BiZXJyeXBpNV9kZWZj
b25maWcKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uMzkxZGY5Njk2YQot
LS0gL2Rldi9udWxsCisrKyBiL2NvbmZpZ3MvcmFzcGJlcnJ5cGk1X2RlZmNvbmZpZwpAQCAtMCww
ICsxLDM5IEBACitCUjJfYWFyY2g2ND15CitCUjJfY29ydGV4X2E3Nl9hNTU9eQorQlIyX0FSTV9G
UFVfVkZQVjQ9eQorQlIyX0FSTTY0X1BBR0VfU0laRV8xNks9eQorCitCUjJfVE9PTENIQUlOX0JV
SUxEUk9PVF9DWFg9eQorCitCUjJfU1lTVEVNX0RIQ1A9ImV0aDAiCisKKyMgTGludXggaGVhZGVy
cyBzYW1lIGFzIGtlcm5lbCwgYSA2LjEgc2VyaWVzCitCUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hF
QURFUlNfQ1VTVE9NXzZfMT15CisKK0JSMl9MSU5VWF9LRVJORUw9eQorQlIyX0xJTlVYX0tFUk5F
TF9DVVNUT01fVEFSQkFMTD15CitCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9UQVJCQUxMX0xPQ0FU
SU9OPSIkKGNhbGwgZ2l0aHViLHJhc3BiZXJyeXBpLGxpbnV4LGZlYjRlYTUxZTc3YWYwOWMxYTRj
N2MzZTVkZDMzMjM3NzUwZjk1Y2QpL2xpbnV4LWZlYjRlYTUxZTc3YWYwOWMxYTRjN2MzZTVkZDMz
MjM3NzUwZjk1Y2QudGFyLmd6IgorQlIyX0xJTlVYX0tFUk5FTF9ERUZDT05GSUc9ImJjbTI3MTIi
CisKKyMgQnVpbGQgdGhlIERUQiBmcm9tIHRoZSBrZXJuZWwgc291cmNlcworQlIyX0xJTlVYX0tF
Uk5FTF9EVFNfU1VQUE9SVD15CitCUjJfTElOVVhfS0VSTkVMX0lOVFJFRV9EVFNfTkFNRT0iYnJv
YWRjb20vYmNtMjcxMi1ycGktNS1iIgorCitCUjJfTElOVVhfS0VSTkVMX05FRURTX0hPU1RfT1BF
TlNTTD15CisKK0JSMl9QQUNLQUdFX1JQSV9GSVJNV0FSRT15CitCUjJfUEFDS0FHRV9SUElfRklS
TVdBUkVfQ09ORklHX0ZJTEU9ImJvYXJkL3Jhc3BiZXJyeXBpNS9jb25maWdfNS50eHQiCitCUjJf
UEFDS0FHRV9SUElfRklSTVdBUkVfQ01ETElORV9GSUxFPSJib2FyZC9yYXNwYmVycnlwaTUvY21k
bGluZV81LnR4dCIKKworIyBSZXF1aXJlZCB0b29scyB0byBjcmVhdGUgdGhlIFNEIGltYWdlCitC
UjJfUEFDS0FHRV9IT1NUX0RPU0ZTVE9PTFM9eQorQlIyX1BBQ0tBR0VfSE9TVF9HRU5JTUFHRT15
CitCUjJfUEFDS0FHRV9IT1NUX01UT09MUz15CisKKyMgRmlsZXN5c3RlbSAvIGltYWdlCitCUjJf
VEFSR0VUX1JPT1RGU19FWFQyPXkKK0JSMl9UQVJHRVRfUk9PVEZTX0VYVDJfND15CitCUjJfVEFS
R0VUX1JPT1RGU19FWFQyX1NJWkU9IjEyME0iCisjIEJSMl9UQVJHRVRfUk9PVEZTX1RBUiBpcyBu
b3Qgc2V0CitCUjJfUk9PVEZTX1BPU1RfQlVJTERfU0NSSVBUPSJib2FyZC9yYXNwYmVycnlwaTUv
cG9zdC1idWlsZC5zaCIKK0JSMl9ST09URlNfUE9TVF9JTUFHRV9TQ1JJUFQ9ImJvYXJkL3Jhc3Bi
ZXJyeXBpNS9wb3N0LWltYWdlLnNoIgotLSAKMi40Mi4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
