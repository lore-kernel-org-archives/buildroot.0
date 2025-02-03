Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D025FC02196
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 17:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6968E81E98;
	Mon,  3 Feb 2025 17:24:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EKN57ZKwTPMK; Mon,  3 Feb 2025 17:24:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AA1781E63
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AA1781E63;
	Mon,  3 Feb 2025 17:24:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C191B185
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 17:24:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DDD481E96
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 17:24:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FgQu3gzQ9I5o for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 17:24:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=gael.portay+rtone@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3451481E63
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3451481E63
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3451481E63
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 17:24:38 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-436381876e2so6214875e9.1
 for <buildroot@buildroot.org>; Mon, 03 Feb 2025 09:24:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738603476; x=1739208276;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5x26D4cEj5gQSJiGWea9mY11lw4J55cv7YJQxNsb09s=;
 b=c0XRr8ElzYTrsQxEktrNCTKLMCB2HFshofL66YzRVJyhxsHl4M6SwvZl9WDLLs1mwr
 +U/L4t5gQFyVyxwgSem1d10FiOZu8SvAyl4/Df0Zy10pVPDilcQtTz7d41qYuVD+F3OQ
 YMKQccz30NU3xGu6DtwiCUhg68O08MdULiZJ9IiUkZ6l/zfcapqXwXUMk2bmFqZTGYFP
 AgPHZ+xmlRA4acWGIlJEBg65zNSkFzAUBvWmk1K4BROjuLp7LQac0vxgAhVG+KEPGVGA
 lHum6c9r5CxfFN5raLJRKqLwyvuXNdI+6AmC2ScyuVPaNROt11mlFzr5l8n8Wb/lhBzA
 fWbA==
X-Gm-Message-State: AOJu0YxUrbccc+Fsku0EJn+QfqVQ+NfoQVnAJpUX94uGg35aEY+jYNc4
 OZRxUhRPVch/JCA6ZdNKECGEk06QzY+tL2z5M++KBHcz9QX1NB9WXlQMJ+qahLfjtg==
X-Gm-Gg: ASbGnctVdo1QI5digX2XwTXOqeXzi6YXYAcCOyAvB68tfw5Up4KLfH+HJGu2+u7YU1h
 4FykZxaOGbhz+pv28brqxq3sChbXh8VFC/FcBQf3FD6yHS70QvWtMNZVSONijrN59TazcYQwuzK
 xVqDzL37cRZdl2vtY4z3+76TgWhCxl5fYhVSXhbxgWy/OTp3IbgnLlIGRqjiDbJrsFAaIHclSKn
 PXOjwrPws08dDpcGpWKR4/RCDxVJRGZas4awWzfm9H+7ehPGEQ/1k2XVHEAHAPLhLs3B7XRqei9
 6N/e5hgoqIu2/tP1wsJYxEe77SSZdMTncUPuMQpX/mfgzvyK6ymABh+Sbq/QGSYwM9ViEn8iQw=
 =
X-Google-Smtp-Source: AGHT+IFjS9q+DsNxVUb9b6X3gtXbboFE4h31419bdlIa9F1GPZQkWyhk+BF8ORI2BT+RjxyH7LPqbQ==
X-Received: by 2002:a05:600c:4f54:b0:436:90d4:9db with SMTP id
 5b1f17b1804b1-438e17dad71mr71103615e9.2.1738603475366; 
 Mon, 03 Feb 2025 09:24:35 -0800 (PST)
Received: from archlinux.. (220.211-78-194.adsl-static.isp.belgacom.be.
 [194.78.211.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e244eb0dsm163752435e9.27.2025.02.03.09.24.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 09:24:34 -0800 (PST)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  3 Feb 2025 18:23:42 +0100
Message-ID: <20250203172342.2831824-1-gael.portay+rtone@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738603476; x=1739208276; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=5x26D4cEj5gQSJiGWea9mY11lw4J55cv7YJQxNsb09s=;
 b=Jrkfo+dS+3qY/7FCEa1b72n6ibow6fkHtxSfQOs/TAObuKnTU9iZyWL8eAU+H6qldl
 6rRb4YAtu4wk46Bpv9IrSbPEjuf/o7ijyy2Vv9FO7yJaP2Nk5OSLalQ5HkwQZLRyPB7M
 sYICV6WCrsRdZD69KEY0zOLi9m0LI057S9r+FKZ4EGof1E1FHS1xHxsmVkm6Hi0G3H7v
 zLaDmxhY+hGOWgNCTczz1ZvdedPLi+TlPSvNpch3V6OeaoLj68P29+3CtuyU51yKqY6z
 3p7RnKQnX/0evO3f1ZZ0PHuDYAJpAdGIX6Idnw2I/G2dwq3zhUzGYY2Rqr4Nvs0RS7kA
 72Bw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Jrkfo+dS
Subject: [Buildroot] [PATCH v4 1/1] configs/raspberrypizero2w_64: new
 defconfig
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
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>,
 Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBjb25maWd1cmF0aW9uIGJ1aWxkcyBhbiBpbWFnZSBmb3IgdGhlIFJhc3BiZXJyeSBQaSBa
ZXJvIDIgVwooNjQtYml0KS4KClNpZ25lZC1vZmYtYnk6IEdhw6tsIFBPUlRBWSA8Z2FlbC5wb3J0
YXkrcnRvbmVAZ21haWwuY29tPgotLS0KSGVsbG8sCgpUaGlzIHBhdGNoIHNlcmllIGFkZHMgdGhl
IGRlZmNvbmZpZyB0byBidWlsZCBhbiBpbWFnZSBmb3IgdGhlIFJhc3BiZXJyeQpQaSBaZXJvIDIg
VyAoNjQtYml0KS4KClRoZSBmaXJzdCBwYXRjaCBhZGRzIG15c2VsZiBhcyBkZXZlbG9wZXIgZm9y
IGV2ZXJ5IHJhc3BiZXJyeXBpCmRlZmNvbmZpZ3MuCgpUaGUgc2Vjb25kIGFuZCBsYXN0IHBhdGNo
IGFkZHMgdGhlIGRlZmNvbmZpZy4KCiAgICAjIHVuYW1lIC1hCiAgICBMaW51eCBidWlsZHJvb3Qg
Ni42LjI4LXY4ICMxIFNNUCBQUkVFTVBUIE1vbiBGZWIgIDMgMTg6MDY6MjYgQ0VUIDIwMjUgYWFy
Y2g2NCBHTlUvTGludXgKICAgICMgY2F0IC9zeXMvZmlybXdhcmUvZGV2aWNldHJlZS9iYXNlL2Nv
bXBhdGlibGUgCiAgICByYXNwYmVycnlwaSxtb2RlbC16ZXJvLTItd2JyY20sYmNtMjgzNyMgCgpD
aGFuZ2VzIHNpbmNlIHYxOgogLSBBZGQgcGF0Y2ggdG8gcmVtb3ZlIHVubmVjZXNzYXJ5IHN5bWxp
bmtzCiAtIEFkZCBwYXRjaCB0byBhZGQgbXlzZWxmIGFzIGRldmVsb3BlciBmb3IgZXZlcnkgcmFz
cGJlcnJ5cGkKIC0gUmVtb3ZlIG1lcmdlZCBwYXRjaCByZXdvcmRpbmcgY29uc29sZSBjb21tZW50
CiAtIFJldGl0bGUgY29tbWl0IG1lc3NhZ2UgY29ycmVjdGx5CgpDaGFuZ2VzIHNpbmNlIHYyOgog
LSBSZW1vdmUgcGF0Y2ggdG8gcmVtb3ZlIGFjdHVhbGx5IHVzZWQgc3ltbGlua3MKIC0gVXNlIHJh
c3BlcnJ5cGl6ZXJvMnctNjQgc3ltbGluayBpbiBkZWZjb25maWcKIC0gUmVnZW5lcmF0ZSBkZWZj
b25maWcgdG8gcmVtb3ZlIGFubm90YXRpb25zCgpDaGFuZ2VzIHNpbmNlIHYzOgogLSBSZW1vdmUg
bWVyZ2VkIHBhdGNoIGFkZGluZyBteXNlbGYgYXMgZGV2ZWxvcGVyIGZvciBldmVyeSByYXNwYmVy
cnlwaQogLSBBZGQgbm90ZSBpbiB0aGUgZG9jdW1lbnRhdGlvbgogLSBVc2UgZXh0ZXJuYWwgQm9v
dGxpbiBnbGliYyBzdGFibGUgdG9vbGNoYWluCgpSZWdhcmRzLApHYcOrbCBQT1JUQVkgKDIpOgog
IERFVkVMT1BFUlM6IGFkZCBteXNlbGYgYXMgZGV2ZWxvcGVyIGZvciByYXNwYmVycnlwaQogIGNv
bmZpZ3MvcmFzcGJlcnJ5cGl6ZXJvMndfNjQ6IG5ldyBkZWZjb25maWcKCiBib2FyZC9yYXNwYmVy
cnlwaS9jb25maWdfemVybzJ3XzY0Yml0LnR4dCB8IDI5ICsrKysrKysrKysrKysrKysrKysrCiBi
b2FyZC9yYXNwYmVycnlwaS9yZWFkbWUudHh0ICAgICAgICAgICAgICB8ICA0ICsrKwogYm9hcmQv
cmFzcGJlcnJ5cGl6ZXJvMnctNjQgICAgICAgICAgICAgICAgfCAgMSArCiBjb25maWdzL3Jhc3Bi
ZXJyeXBpemVybzJ3XzY0X2RlZmNvbmZpZyAgICB8IDMyICsrKysrKysrKysrKysrKysrKysrKysr
CiA0IGZpbGVzIGNoYW5nZWQsIDY2IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBi
b2FyZC9yYXNwYmVycnlwaS9jb25maWdfemVybzJ3XzY0Yml0LnR4dAogY3JlYXRlIG1vZGUgMTIw
MDAwIGJvYXJkL3Jhc3BiZXJyeXBpemVybzJ3LTY0CiBjcmVhdGUgbW9kZSAxMDA2NDQgY29uZmln
cy9yYXNwYmVycnlwaXplcm8yd182NF9kZWZjb25maWcKCmRpZmYgLS1naXQgYS9ib2FyZC9yYXNw
YmVycnlwaS9jb25maWdfemVybzJ3XzY0Yml0LnR4dCBiL2JvYXJkL3Jhc3BiZXJyeXBpL2NvbmZp
Z196ZXJvMndfNjRiaXQudHh0Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAu
LmJiZDhiNjkzNjMKLS0tIC9kZXYvbnVsbAorKysgYi9ib2FyZC9yYXNwYmVycnlwaS9jb25maWdf
emVybzJ3XzY0Yml0LnR4dApAQCAtMCwwICsxLDI5IEBACisjIFBsZWFzZSBub3RlIHRoYXQgdGhp
cyBpcyBvbmx5IGEgc2FtcGxlLCB3ZSByZWNvbW1lbmQgeW91IHRvIGNoYW5nZSBpdCB0byBmaXQK
KyMgeW91ciBuZWVkcy4KKyMgWW91IHNob3VsZCBvdmVycmlkZSB0aGlzIGZpbGUgdXNpbmcgQlIy
X1BBQ0tBR0VfUlBJX0ZJUk1XQVJFX0NPTkZJR19GSUxFLgorIyBTZWUgaHR0cDovL2J1aWxkcm9v
dC5vcmcvbWFudWFsLmh0bWwjcm9vdGZzLWN1c3RvbQorIyBhbmQgaHR0cDovL2VsaW51eC5vcmcv
UlBpY29uZmlnIGZvciBhIGRlc2NyaXB0aW9uIG9mIGNvbmZpZy50eHQgc3ludGF4CisKK3N0YXJ0
X2ZpbGU9c3RhcnQuZWxmCitmaXh1cF9maWxlPWZpeHVwLmRhdAorCitrZXJuZWw9SW1hZ2UKKwor
IyBUbyB1c2UgYW4gZXh0ZXJuYWwgaW5pdHJhbWZzIGZpbGUKKyNpbml0cmFtZnMgcm9vdGZzLmNw
aW8uZ3oKKworIyBEaXNhYmxlIG92ZXJzY2FuIGFzc3VtaW5nIHRoZSBkaXNwbGF5IHN1cHBvcnRz
IGRpc3BsYXlpbmcgdGhlIGZ1bGwgcmVzb2x1dGlvbgorIyBJZiB0aGUgdGV4dCBzaG93biBvbiB0
aGUgc2NyZWVuIGRpc2FwcGVhcnMgb2ZmIHRoZSBlZGdlLCBjb21tZW50IHRoaXMgb3V0CitkaXNh
YmxlX292ZXJzY2FuPTEKKworIyBIb3cgbXVjaCBtZW1vcnkgaW4gTUIgdG8gYXNzaWduIHRvIHRo
ZSBHUFUgb24gUGkgbW9kZWxzIGhhdmluZworIyAyNTYsIDUxMiBvciAxMDI0IE1CIHRvdGFsIG1l
bW9yeQorZ3B1X21lbV8yNTY9MTAwCitncHVfbWVtXzUxMj0xMDAKK2dwdV9tZW1fMTAyND0xMDAK
KworIyBFbmFibGUgVUFSVDAgZm9yIHNlcmlhbCBjb25zb2xlIG9uIHR0eUFNQTAKK2R0b3Zlcmxh
eT1taW5pdWFydC1idAorCisjIGVuYWJsZSA2NGJpdHMgc3VwcG9ydAorYXJtXzY0Yml0PTEKZGlm
ZiAtLWdpdCBhL2JvYXJkL3Jhc3BiZXJyeXBpL3JlYWRtZS50eHQgYi9ib2FyZC9yYXNwYmVycnlw
aS9yZWFkbWUudHh0CmluZGV4IDgxY2Q4MWE3ZjMuLjY0ZjBlMmEyNmYgMTAwNjQ0Ci0tLSBhL2Jv
YXJkL3Jhc3BiZXJyeXBpL3JlYWRtZS50eHQKKysrIGIvYm9hcmQvcmFzcGJlcnJ5cGkvcmVhZG1l
LnR4dApAQCAtMzcsNiArMzcsMTAgQEAgRm9yIG1vZGVsIFplcm8gMiBXIChtb2RlbCBCMyBpbiBz
bWFsbGVyIGZvcm0gZmFjdG9yKToKIAogICAkIG1ha2UgcmFzcGJlcnJ5cGl6ZXJvMndfZGVmY29u
ZmlnCiAKK0ZvciBtb2RlbCBaZXJvIDIgVyAobW9kZWwgQjMgaW4gc21hbGxlciBmb3JtIGZhY3Rv
ciwgNjQtYml0KToKKworICAkIG1ha2UgcmFzcGJlcnJ5cGl6ZXJvMndfNjRfZGVmY29uZmlnCisK
IEZvciBtb2RlbCAyIEI6CiAKICAgJCBtYWtlIHJhc3BiZXJyeXBpMl9kZWZjb25maWcKZGlmZiAt
LWdpdCBhL2JvYXJkL3Jhc3BiZXJyeXBpemVybzJ3LTY0IGIvYm9hcmQvcmFzcGJlcnJ5cGl6ZXJv
MnctNjQKbmV3IGZpbGUgbW9kZSAxMjAwMDAKaW5kZXggMDAwMDAwMDAwMC4uZmNkYWZjODFlZAot
LS0gL2Rldi9udWxsCisrKyBiL2JvYXJkL3Jhc3BiZXJyeXBpemVybzJ3LTY0CkBAIC0wLDAgKzEg
QEAKK3Jhc3BiZXJyeXBpClwgTm8gbmV3bGluZSBhdCBlbmQgb2YgZmlsZQpkaWZmIC0tZ2l0IGEv
Y29uZmlncy9yYXNwYmVycnlwaXplcm8yd182NF9kZWZjb25maWcgYi9jb25maWdzL3Jhc3BiZXJy
eXBpemVybzJ3XzY0X2RlZmNvbmZpZwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAw
MDAwLi5kY2I4NDcyNjcxCi0tLSAvZGV2L251bGwKKysrIGIvY29uZmlncy9yYXNwYmVycnlwaXpl
cm8yd182NF9kZWZjb25maWcKQEAgLTAsMCArMSwzMiBAQAorQlIyX2FhcmNoNjQ9eQorQlIyX0FS
TV9GUFVfVkZQVjQ9eQorQlIyX1RPT0xDSEFJTl9FWFRFUk5BTD15CitCUjJfVE9PTENIQUlOX0VY
VEVSTkFMX0JPT1RMSU49eQorQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9CT09UTElOX0FBUkNINjRf
R0xJQkNfU1RBQkxFPXkKK0JSMl9HTE9CQUxfUEFUQ0hfRElSPSJib2FyZC9yYXNwYmVycnlwaS9w
YXRjaGVzIgorQlIyX0RPV05MT0FEX0ZPUkNFX0NIRUNLX0hBU0hFUz15CitCUjJfUk9PVEZTX1BP
U1RfQlVJTERfU0NSSVBUPSJib2FyZC9yYXNwYmVycnlwaXplcm8ydy02NC9wb3N0LWJ1aWxkLnNo
IgorQlIyX1JPT1RGU19QT1NUX0lNQUdFX1NDUklQVD0iYm9hcmQvcmFzcGJlcnJ5cGl6ZXJvMnct
NjQvcG9zdC1pbWFnZS5zaCIKK0JSMl9MSU5VWF9LRVJORUw9eQorQlIyX0xJTlVYX0tFUk5FTF9D
VVNUT01fVEFSQkFMTD15CitCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9UQVJCQUxMX0xPQ0FUSU9O
PSIkKGNhbGwgZ2l0aHViLHJhc3BiZXJyeXBpLGxpbnV4LDU3NmNjMTBlMWVkNTBhOWVhY2ZmYzdh
MDVjNzk2MDUxZDczNDNlYTQpL2xpbnV4LTU3NmNjMTBlMWVkNTBhOWVhY2ZmYzdhMDVjNzk2MDUx
ZDczNDNlYTQudGFyLmd6IgorQlIyX0xJTlVYX0tFUk5FTF9ERUZDT05GSUc9ImJjbXJwaTMiCitC
UjJfTElOVVhfS0VSTkVMX0RUU19TVVBQT1JUPXkKK0JSMl9MSU5VWF9LRVJORUxfSU5UUkVFX0RU
U19OQU1FPSJicm9hZGNvbS9iY20yNzEwLXJwaS16ZXJvLTItdyIKK0JSMl9MSU5VWF9LRVJORUxf
TkVFRFNfSE9TVF9PUEVOU1NMPXkKK0JSMl9QQUNLQUdFX0JVU1lCT1hfU0hPV19PVEhFUlM9eQor
QlIyX1BBQ0tBR0VfWFo9eQorQlIyX1BBQ0tBR0VfUlBJX0ZJUk1XQVJFPXkKK0JSMl9QQUNLQUdF
X1JQSV9GSVJNV0FSRV9CT09UQ09ERV9CSU49eQorQlIyX1BBQ0tBR0VfUlBJX0ZJUk1XQVJFX1ZB
UklBTlRfUEk9eQorQlIyX1BBQ0tBR0VfUlBJX0ZJUk1XQVJFX0NPTkZJR19GSUxFPSJib2FyZC9y
YXNwYmVycnlwaXplcm8ydy02NC9jb25maWdfemVybzJ3XzY0Yml0LnR4dCIKK0JSMl9QQUNLQUdF
X0tNT0Q9eQorQlIyX1BBQ0tBR0VfS01PRF9UT09MUz15CitCUjJfVEFSR0VUX1JPT1RGU19FWFQy
PXkKK0JSMl9UQVJHRVRfUk9PVEZTX0VYVDJfND15CitCUjJfVEFSR0VUX1JPT1RGU19FWFQyX1NJ
WkU9IjEyME0iCisjIEJSMl9UQVJHRVRfUk9PVEZTX1RBUiBpcyBub3Qgc2V0CitCUjJfUEFDS0FH
RV9IT1NUX0RPU0ZTVE9PTFM9eQorQlIyX1BBQ0tBR0VfSE9TVF9HRU5JTUFHRT15CitCUjJfUEFD
S0FHRV9IT1NUX0tNT0RfWFo9eQorQlIyX1BBQ0tBR0VfSE9TVF9NVE9PTFM9eQotLSAKMi40OC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
