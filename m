Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A462C83F05
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 06:47:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D804C83DFB;
	Fri,  4 Jul 2025 06:47:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ejzasm0avk7f; Fri,  4 Jul 2025 06:47:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECFB383DE5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECFB383DE5;
	Fri,  4 Jul 2025 06:47:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D1211EB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E30740FA3
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:47:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DLvU3XP6WbGW for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 06:47:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7AC8740F8C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AC8740F8C
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7AC8740F8C
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:47:03 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-450cfb79177so3193725e9.0
 for <buildroot@buildroot.org>; Thu, 03 Jul 2025 23:47:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751611621; x=1752216421;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SNIRF5NDmjAnVyTKc3I93/4D16KFV+fg0r9oJbDLwrM=;
 b=STpxSOQOBR/eKCGAohUORXD3ika0c0bdZZdRHiWXQSJEOQVmNDE1TGvt3vaclSVKNc
 m7fVYZFLcUgYPTsSW5HUuLTIYX23Sg3HU++/uOpfevPI8v16R0SjLjJqMpaIra4gIDjo
 /DTUXEDbf+2diIf0F2B9pqN1LO4Yep7++FLGKKdj0WBQfMIgQJ5zoVgdGP1rs2au4rsh
 BeLtyHYA4UFF1bXWh+U8sisFiSbviVGYb10OAdCdRMfHeXHJ6W6z56QMtSYncyKqbnIj
 S77pPX1bCUBTABHoWT1zR+TQTYjW73NF0Q37FfF0P3yWGydCq6ZHN0MF50kT1xxUKr6c
 wWwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUA2tfGRKTcPWMNqWUJrMo99kE8yxHuuKR2Kz3vM0M17o9Jxwt/8ftrOHKaTjcWwuetf9hjxuiUQE=@buildroot.org
X-Gm-Message-State: AOJu0YzujH7amMPVaMsjRP3NCCzDxnqqURJ5swEIqpqbEIWcUa/d8+Go
 g/elVRjEGDkdHkv3awQxQ72pbzOXl70ZhyMTsS1aZQl7bKEPISnHsHQ9a6QrhUEKBQs=
X-Gm-Gg: ASbGncsSUsGBCnUk/An8Ki1XgBt9e0FKN2Aq8PHIr8Tj0nIbHVZakjloKipDx7Xmq9W
 GDCrOsXFcYrEPW6ZybV7ThKvxcaRTZIklAvbuJ1Nok0XAoubKuTHn9lY0Ng6AVFEanQWoPqOQ0+
 vWxDCRNsj/Twc1wmA6nAhR321GLTaPzB9BLr7yYzPremZu0j0hRSBjo2juAur1PV0yRwfy6DT5w
 e9aNefL269dI2CZKV4FZp6iniJU6qpvXntFxOWRImakPRCyes2bzovoVvVLZQjjuKcsVQka1tQv
 Iv2KjgniGMiIR2TB8cCxpD2irqB5w5PlhWyYf22oZQ3GY6UgjRetfphZnwA5Q5xTQu5FOSHS86V
 6fCvzY6JXdQ==
X-Google-Smtp-Source: AGHT+IFplC5QB4nDcTsNKOyKF3ArTha76ftjubLCDz3KAgeFJYP/cK227/+ItpPjxlzO3ICQmCaq/w==
X-Received: by 2002:a05:600c:4e8f:b0:450:b9c0:c7d2 with SMTP id
 5b1f17b1804b1-454b31164d6mr10604425e9.11.1751611621438; 
 Thu, 03 Jul 2025 23:47:01 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454b1628ff9sm17313005e9.11.2025.07.03.23.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 23:47:00 -0700 (PDT)
To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Jul 2025 08:46:58 +0200
Message-ID: <20250704064700.4064413-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250626111922.1851579-1-raphael.melotte@mind.be>
References: <20250626111922.1851579-1-raphael.melotte@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751611621; x=1752216421; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SNIRF5NDmjAnVyTKc3I93/4D16KFV+fg0r9oJbDLwrM=;
 b=EQHphD61nL5ETanqvKFCzU6tE542oEzduhOziY++sZw1z82tEXc+5eduspWwCYIYRO
 hejI2EF8WmszjGpWzWdDzpTSJsM9QUXmjGjIonshHeU8BPNjhCcNZkhnEPdDsRex/uTr
 sMiTXaQT/7pUUZDK4N5B51ee6H3bN5gsVPRP1k9Bkyg+85+RhyVLbkSQhwUAC5O4878g
 Vtj1tY1jqb04VKttn3my3h8xhxuSawNBMv18khsPcqNH+CcTyfRYLvGtMHD2i/eCf+LW
 PvF/5emg0KIea245SzFhbXwg1sWGYSZf+cvCieG+IhoXR34+5USgqJ0D4GU/cG5wrmu/
 6xFg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=EQHphD61
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
cGhhZWwubWVsb3R0ZUBtaW5kLmJlPgoKQXBwbGllZCB0byAyMDI1LjAyLnguIFRoYW5rcwoKPiAt
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
