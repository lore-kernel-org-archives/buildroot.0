Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CCE9C83F05
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 06:48:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5327E83EA2;
	Fri,  4 Jul 2025 06:48:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ItbpDTem5O1; Fri,  4 Jul 2025 06:48:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 727C383D5C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 727C383D5C;
	Fri,  4 Jul 2025 06:48:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A38A87AB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 953346066C
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:48:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rblsWjMlZ10Q for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 06:48:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 948B360BB0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 948B360BB0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 948B360BB0
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:48:29 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a50956e5d3so419632f8f.1
 for <buildroot@buildroot.org>; Thu, 03 Jul 2025 23:48:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751611707; x=1752216507;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yhmqqgb69cujuQjJp0MvqC9faYJnbjUHYCcjimZSzl0=;
 b=LQuGI0v2qzsYsiS5yMUpAb/dzK0apjiZW+BScilo6Nb3ClEEvzkFEK93VOEFZUKQxe
 fOPmqC44+z0/nWB521IHLxH2aGJUKiZmQXM9Pr2ulwKUu27tENaNvba+DtKBTHrwsW//
 6fesT8n2vZlvhF6gxeqqm65ZZiyuf2+K/Kq0OrF0hEHLghzdOAzA5fHgRBFBqL82RN9Y
 IyaHn2FiOzRgn2v8WjMhbPpdAHQRY2MM5FZszA9/P/LUT0TJrX8s5cDntFT6gALCUH79
 YivRFW2EFxBy+ERU8DqY1aHom8j5m6DPqo0jPg74mhB85bQPxztPXv1UU/npsntcOcTq
 q4jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUx00FDRadI9HHG3LHLI7YmUEkwkwL9GSVOS84GTAxHygnNHm66lqNO4dfgx9/qe1x2wx6h/S+H/8=@buildroot.org
X-Gm-Message-State: AOJu0YzE05b6GP7Wpg58WVhW+vDaTBOhx4cxaiJ8iGL++KdGBJZzT9x0
 tax/twEVM3ZJTl99LxZzc/HcLW0K63XhwdKK3bZzKQk38J/CIwOptq8Uie3AhunXr05fHq05z9D
 gmgGz
X-Gm-Gg: ASbGncvnTTurPlR0TrlehhSDsLYRBDqJs5KR0xNMWG0HvS6TZD6xgILCDYsRxqSICCD
 8VUAtNcFAiVIfU8mAga/3hyr6FunTs+0VFf8wjmCFV3Oe2sSSxajZANJKH7trx7QYsTIHKzwN0w
 iOrCj/bB+0IalV312VUlpo7i60hAO8Y98I1lGJ8ctL3JrVmq3zkqCpFIunyLlMN7Uf0FrqvE1GM
 rEIS5Unm0Pdcza3bK9ycEagPTkdUljq3bWodCSiGghtd7lC1zlsQyw2468vy4e/JsrcFa+5mpWH
 agNIqtVUklsF9IaARh3dCVIghxX+WgppO52Ax9/MBJ+Y7xPii58BoSbwIx5vehXXkOYn2U2e6Li
 iISi5BqR1qQ==
X-Google-Smtp-Source: AGHT+IFEGhKv79yaDkuBMCgL5F979RWeSoRF8QRFJXtzvvt6Kbygs542KYzVcy56lZ7M3G84SPDZwA==
X-Received: by 2002:adf:f792:0:b0:3a5:1241:c1a3 with SMTP id
 ffacd0b85a97d-3b4966057bdmr764836f8f.50.1751611707598; 
 Thu, 03 Jul 2025 23:48:27 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454b1634b0fsm17620425e9.17.2025.07.03.23.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 23:48:27 -0700 (PDT)
To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Jul 2025 08:48:17 +0200
Message-ID: <20250704064826.4065748-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250626111922.1851579-1-raphael.melotte@mind.be>
References: <20250626111922.1851579-1-raphael.melotte@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751611707; x=1752216507; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yhmqqgb69cujuQjJp0MvqC9faYJnbjUHYCcjimZSzl0=;
 b=QrgAjbQM8kwfHWAj4vszATtA/qaX7hO+3GT2wRHTHiF8M3f60nf0exLFB9oNwl9TAL
 rbIVJS88OiwoKvya3G3tAq3a4qKbsQeNrIhP9vvO+9INF6/+jnivupi/itpZ32z8Bw60
 zbptFgVGpmfRqFeAv9Omo3BswtZsyYPZZQUiSoCwRE76OH37dX9/x6I6D3sNoyvJDi7M
 LWmuh1PMhFR8akqKvM7wIudHXmYyTDfxNQpJ1X/6LlJseA6KXop1cq6lIh0/dVKZNYX2
 7coa61YWk9Hfg0cgceiEXgNf6nM1jsMjhMYjaXgYPGz2mGkLukf3F2bQiUsLf+A4ihZq
 gNgA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QrgAjbQM
Subject: Re: [Buildroot] [PATCH 1/3] package/gumbo-parser: update upstream
 repository
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gRGV2ZWxvcG1lbnQgb24gR29vZ2xlJ3MgR2l0SHViIHJlcG9zaXRvcnkg
aGFzIHN0b3BwZWQgYSBsb25nIHRpbWUgYWdvLgo+IEEgZm9yayBleGlzdHMgb24gQ29kZWJlcmcs
IGFuZCBtdWx0aXBsZSBkaXN0cmlidXRpb25zIChGZWRvcmEsIEFyY2gKPiBMaW51eCwgLi4uKSBh
cmUgYWxyZWFkeSB1c2luZyBpdCAoc2VlIFsxXSkuCj4gCj4gVXBkYXRlIHRoZSBzb3VyY2UgVVJM
IHRvIHVzZSB0aGUgbmV3IHVwc3RyZWFtIGxvY2F0aW9uLgo+IAo+IFRoZSBuZXcgdXBzdHJlYW0g
aGFzIGEgZGlmZmVyZW50IGhhc2ggZm9yIHRoZSAwLjEwLjEgdGFyYmFsbCwgc28KPiB1cGRhdGUg
aXQgYXMgd2VsbC4KPiAKPiBbMV06IGh0dHBzOi8vcmVwb2xvZ3kub3JnL3Byb2plY3QvZ3VtYm8t
cGFyc2VyL3ZlcnNpb25zCj4gCj4gU2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJh
cGhhZWwubWVsb3R0ZUBtaW5kLmJlPgoKQXBwbGllZCB0byAyMDI1LjA1LnguIFRoYW5rcwoKPiAt
LS0KPiAgcGFja2FnZS9ndW1iby1wYXJzZXIvQ29uZmlnLmluICAgICAgICAgfCAyICstCj4gIHBh
Y2thZ2UvZ3VtYm8tcGFyc2VyL2d1bWJvLXBhcnNlci5oYXNoIHwgMiArLQo+ICBwYWNrYWdlL2d1
bWJvLXBhcnNlci9ndW1iby1wYXJzZXIubWsgICB8IDMgKystCj4gIDMgZmlsZXMgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L2d1bWJvLXBhcnNlci9Db25maWcuaW4gYi9wYWNrYWdlL2d1bWJvLXBhcnNlci9Db25maWcuaW4K
PiBpbmRleCAwNGJiMjI5NGJiLi43ZWJjNDM5NDEzIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvZ3Vt
Ym8tcGFyc2VyL0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UvZ3VtYm8tcGFyc2VyL0NvbmZpZy5p
bgo+IEBAIC03LDQgKzcsNCBAQCBjb25maWcgQlIyX1BBQ0tBR0VfR1VNQk9fUEFSU0VSCj4gIAkg
IG90aGVyIHRvb2xzIGFuZCBsaWJyYXJpZXMgc3VjaCBhcyBsaW50ZXJzLCB2YWxpZGF0b3JzLAo+
ICAJICB0ZW1wbGF0aW5nIGxhbmd1YWdlcywgYW5kIHJlZmFjdG9yaW5nIGFuZCBhbmFseXNpcyB0
b29scy4KPiAgCj4gLQkgIGh0dHBzOi8vZ2l0aHViLmNvbS9nb29nbGUvZ3VtYm8tcGFyc2VyCj4g
KwkgIGh0dHBzOi8vY29kZWJlcmcub3JnL2d1bWJvLXBhcnNlci9ndW1iby1wYXJzZXIvCj4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvZ3VtYm8tcGFyc2VyL2d1bWJvLXBhcnNlci5oYXNoIGIvcGFja2Fn
ZS9ndW1iby1wYXJzZXIvZ3VtYm8tcGFyc2VyLmhhc2gKPiBpbmRleCBjNGFmMzMwNzJjLi5lZTQx
ZjE2N2E3IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvZ3VtYm8tcGFyc2VyL2d1bWJvLXBhcnNlci5o
YXNoCj4gKysrIGIvcGFja2FnZS9ndW1iby1wYXJzZXIvZ3VtYm8tcGFyc2VyLmhhc2gKPiBAQCAt
MSw1ICsxLDUgQEAKPiAgIyBMb2NhbGx5IGNvbXB1dGVkOgo+IC1zaGEyNTYgIDI4NDYzMDUzZDQ0
YTVkZmJjNGI3N2JjZjQ5YzhjZWUxMTkzMzhmZmE2MzZjYzE3ZmMzMzc4NDIxZDcxNGVmYWQgIGd1
bWJvLXBhcnNlci0wLjEwLjEudGFyLmd6Cj4gK3NoYTI1NiAgZDRmZDE1OGQ5OThhYjgzMDJmYTIz
YmIwMTExOWI0MzRiYmZhZjcxMzliNTlmOWM3NDUzMGE3MDMxNzZjYjIxMyAgdjAuMTAuMS50YXIu
Z3oKPiAgCj4gICMgSGFzaCBmb3IgbGljZW5zZSBmaWxlczoKPiAgc2hhMjU2ICBjNzFkMjM5ZGY5
MTcyNmZjNTE5YzZlYjcyZDMxOGVjNjU4MjA2MjcyMzJiMmY3OTYyMTllODdkY2YzNWQwYWI0ICBD
T1BZSU5HCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ3VtYm8tcGFyc2VyL2d1bWJvLXBhcnNlci5t
ayBiL3BhY2thZ2UvZ3VtYm8tcGFyc2VyL2d1bWJvLXBhcnNlci5tawo+IGluZGV4IDhjOTMzMGFl
NzAuLjc2ZmNjODc2YzUgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9ndW1iby1wYXJzZXIvZ3VtYm8t
cGFyc2VyLm1rCj4gKysrIGIvcGFja2FnZS9ndW1iby1wYXJzZXIvZ3VtYm8tcGFyc2VyLm1rCj4g
QEAgLTUsNyArNSw4IEBACj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gIAo+ICBHVU1CT19Q
QVJTRVJfVkVSU0lPTiA9IDAuMTAuMQo+IC1HVU1CT19QQVJTRVJfU0lURSA9ICQoY2FsbCBnaXRo
dWIsZ29vZ2xlLGd1bWJvLXBhcnNlcix2JChHVU1CT19QQVJTRVJfVkVSU0lPTikpCj4gK0dVTUJP
X1BBUlNFUl9TSVRFID0gaHR0cHM6Ly9jb2RlYmVyZy5vcmcvZ3VtYm8tcGFyc2VyL2d1bWJvLXBh
cnNlci9hcmNoaXZlCj4gK0dVTUJPX1BBUlNFUl9TT1VSQ0UgPSB2JChHVU1CT19QQVJTRVJfVkVS
U0lPTikudGFyLmd6Cj4gIEdVTUJPX1BBUlNFUl9MSUNFTlNFID0gQXBhY2hlLTIuMAo+ICBHVU1C
T19QQVJTRVJfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcKPiAgR1VNQk9fUEFSU0VSX0lOU1RBTExf
U1RBR0lORyA9IFlFUwo+IC0tIAo+IDIuNDkuMAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
