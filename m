Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D39EA8543
	for <buildroot@archiver.kernel.org>; Sun,  8 Mar 2026 22:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09D7D81A0D;
	Sun,  8 Mar 2026 22:25:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 35EDYZfPDjD8; Sun,  8 Mar 2026 22:25:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2536781A24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773008737;
	bh=DULeOJ08y6UG07vqdOOFOH47NNK6cgXYZ6TlPzn4Yuo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ookUUnAmk4ZK//haOvEE7mQcwrXIaWYvTBOq5uwMEWIL59gBEb4VLFFRKpX6kEktB
	 WWXjWf6bInRGov4r5LnSATofs2AWSeFYG6WIFqAaGJoxWt1fuVaGCnRHw9zr4yj2Ee
	 TxaB4ZbLW8Tjy8Xm5A4F49qwbsYjy30oLCsg7tScOWyJBCNeufa6ULhz5VXebdBcQm
	 4D1CU/NRR+vapzNJ4nJpfDVR5vxxQblBKuHYYOPbxm8zqnoCkuTKCI573iasmbwcVu
	 rKlk8uwYhOuarCfD1WZLJV1/PLy9Mbm91Ca7r/gQR6YhGhpnGhRmDn6qHvTjdBHRNU
	 w3/z9vUP8QP1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2536781A24;
	Sun,  8 Mar 2026 22:25:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 01830119
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 22:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E755981A24
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 22:25:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6kPUqOAA63bL for <buildroot@buildroot.org>;
 Sun,  8 Mar 2026 22:25:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F080781A0D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F080781A0D
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F080781A0D
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 22:25:34 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso89189355e9.1
 for <buildroot@buildroot.org>; Sun, 08 Mar 2026 15:25:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773008733; x=1773613533;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X3S4gjI6SI6A63zD4zlyDXAtBuS7pEwqgQxbkXfa5v0=;
 b=w4TJbj1jM9rvHevryXosDC7bl9qfLtMfTftqMUKv5y1YXbFs6GTWnt7b6AjT1Gj0EH
 3auZ5+5g4EkJ7MdHZfmzJFAlXdLSJTCbl8I+Jzm4Xpo7sh1n8IAP+psKSp2JMvqZiPU/
 qexT6PwKRlSM29Zz+xG7rGRSpDKklry6v14VHFROAJeNsmoa0iOCzbR7P2HMl7o98MZK
 2tiIiUqxd3l1d6XJo9GLp25J3bGUbImd8C0rttk2eiepLXFJHH1YuZyGuWe5XcO03mom
 xKstsU5slKq/ZkqkdpEhq1NzxpAY0WyrIDbV2j1Whq0C9daPj8iTQjO81GkBTvzwPj3c
 Y77A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4x3jfIu13UGL1sJejLs9bDBxY5NZY14WtriajPpp+yvYjbjWkQhYceNzUXjrsO6puoaXB2xhzxHY=@buildroot.org
X-Gm-Message-State: AOJu0YxPufpUZxHeHrKZ2AokvokOxK1FsuZOhG/TcqbYGU1M0FL9ACg4
 2U3P8aiBYUTb2hZ9XimGyzMbrxTPpu7YHS3mkRBeZF6jXK10avwIyTeQTStp45T/Ve0=
X-Gm-Gg: ATEYQzzVjHjCAyMUqUEv7mWxidf0RInBqsZfOZr72zzZkomkvrU32x667p/Gnk9WV1y
 B/P2ntf1TnwouWkoiSSzqcTqL9qAFuDwq5v31q4kGladzaFENjEvoAQUL0L6RkxuT7c4xOKe3Ol
 k4wk9IGpltsjmGkZvZYgwx4ST+h/I1/zvN0vlFGVkfDc+lAKKc6Y8UKjtH3aRF11XSTtK69wwzP
 HBsYtS7jyB8Smb6ew9VJavf8X/GZHBopY6xK62LP/vDZH5tc0tjYtSsbisGBUp2uaxxw3iQRvxg
 g8DqAv47Ss7do7yNQrVbOEJPK/o6fR9aYuadUQuCysXkpTv1m+5NpKxcAvVInYhLwtembWL58WU
 3t3yX8N8lEyebt8OqtbmuHxCLJj9DGPhbvT42x5+WgTpsFZ8NLEzsP56lvlif9/OGFqTfSKxfVx
 CprdR7xVgPSXkn6w9dNAUE4W00obt/0PH1luRbqlsgoE+ZaEY3A9s2k41haLE/rdIQZCAKdQFrd
 r3dyttjz0d/mKmCxpFRjnVdegoLjCHhEj+vxrf0vFcSraV1LQSgrCXqklGr/AZOcw==
X-Received: by 2002:a05:600c:4f55:b0:485:3c66:e230 with SMTP id
 5b1f17b1804b1-4853c66e4eamr10040465e9.29.1773008732769; 
 Sun, 08 Mar 2026 15:25:32 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae4b860sm22887666f8f.36.2026.03.08.15.25.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Mar 2026 15:25:32 -0700 (PDT)
Message-ID: <4746bc12-a68d-45a7-8011-346eb9b7dade@smile.fr>
Date: Sun, 8 Mar 2026 23:25:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Joseph Kogut <joseph@anodize.com>, buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Romain Naour <romain.naour@gmail.com>,
 Joseph Kogut <joseph.kogut@gmail.com>, Adam Ford <aford173@gmail.com>,
 Steve deRosier <derosier@cal-sierra.com>
References: <20260227-mesa3d-amdgpu-virtio-v1-0-3e6d10d4eaef@anodize.com>
 <20260227-mesa3d-amdgpu-virtio-v1-3-3e6d10d4eaef@anodize.com>
Content-Language: fr, en-US
In-Reply-To: <20260227-mesa3d-amdgpu-virtio-v1-3-3e6d10d4eaef@anodize.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1773008733; x=1773613533; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=X3S4gjI6SI6A63zD4zlyDXAtBuS7pEwqgQxbkXfa5v0=;
 b=lTOplf8QjvsGFZoGd83gSIam5i7DWOhJbKb++RBonhXqRbwxIa5lWOIMCXsmSKl557
 2wUOYmmQMTUUZ59VYygKIfGg5RSlPi1Q02B+n4Kc0zxtSpZ0HcIUGB/ykcTaHwk7DrBA
 YHvHqw3Gqmsre9Y4tjsDG5mz8pnzqAPAPb2p0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=lTOplf8Q
Subject: Re: [Buildroot] [PATCH 3/4] package/mesa3d: add freedreno vulkan
 driver config
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSm9zZXBoLAoKTGUgMjgvMDIvMjAyNiDDoCAwMDoxNCwgSm9zZXBoIEtvZ3V0IGEgw6lj
cml0wqA6Cj4gU2lnbmVkLW9mZi1ieTogSm9zZXBoIEtvZ3V0IDxqb3NlcGhAYW5vZGl6ZS5jb20+
Cj4gLS0tCj4gVGVzdGVkIHdpdGg6Cj4gICBCUjJfUEFDS0FHRV9NRVNBM0Q9eQo+ICAgQlIyX1BB
Q0tBR0VfTUVTQTNEX1ZVTEtBTl9EUklWRVJfRlJFRURSRU5PPXkKPiAgIEJSMl9QQUNLQUdFX01F
U0EzRF9IT1NUX05BVElWRV9DT05URVhUX0RSSVZFUl9GUkVFRFJFTk89eQo+IAo+ICQgdXRpbHMv
dGVzdC1wa2cgLXAgbWVzYTNkIC1jIG1lc2EtZnJlZWRyZW5vLXZkcm0uY29uZmlnIC1hCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBhcm0tYWFyY2g2NCBbIDEvMzJdOiBPSwo+ICAgICAg
ICAgICAgICAgIGJvb3RsaW4tYWFyY2g2NC1nbGliYy1vbGQgWyAyLzMyXTogU0tJUFBFRAo+ICAg
ICAgICAgICAgICAgICAgICBib290bGluLWFhcmNoNjQtZ2xpYmMgWyAzLzMyXTogT0sKPiAgICAg
ICAgICAgICAgICBib290bGluLWFyY2xlLWhzMzgtdWNsaWJjIFsgNC8zMl06IE9LCj4gICAgICAg
ICAgICAgICAgICAgICBib290bGluLWFybXY1LXVjbGliYyBbIDUvMzJdOiBPSwo+ICAgICAgICAg
ICAgICAgICAgICAgIGJvb3RsaW4tYXJtdjctZ2xpYmMgWyA2LzMyXTogT0sKPiAgICAgICAgICAg
ICAgICAgICAgICAgYm9vdGxpbi1hcm12Ny1tdXNsIFsgNy8zMl06IE9LCj4gICAgICAgICAgICAg
ICAgICAgIGJvb3RsaW4tYXJtdjdtLXVjbGliYyBbIDgvMzJdOiBTS0lQUEVECj4gICAgICAgICAg
ICAgICAgIGJvb3RsaW4tbTY4ay01MjA4LXVjbGliYyBbIDkvMzJdOiBTS0lQUEVECj4gICAgICAg
ICAgICAgICAgYm9vdGxpbi1tNjhrLTY4MDQwLXVjbGliYyBbMTAvMzJdOiBPSwo+ICAgICAgICAg
ICAgICBib290bGluLW1pY3JvYmxhemVlbC11Y2xpYmMgWzExLzMyXTogU0tJUFBFRAo+ICAgICAg
ICAgICAgICAgICAgIGJvb3RsaW4tbWlwczY0ZWwtZ2xpYmMgWzEyLzMyXTogT0sKPiAgICAgICAg
ICAgICAgICAgICAgYm9vdGxpbi1taXBzZWwtdWNsaWJjIFsxMy8zMl06IFNLSVBQRUQKPiAgICAg
ICAgICAgICAgICAgYm9vdGxpbi1taXBzZWwzMnI2LWdsaWJjIFsxNC8zMl06IFNLSVBQRUQKPiAg
ICAgICAgICAgICAgICAgIGJvb3RsaW4tb3BlbnJpc2MtdWNsaWJjIFsxNS8zMl06IFNLSVBQRUQK
PiAgICAgICAgICAgIGJvb3RsaW4tcG93ZXJwYy1lNTAwbWMtdWNsaWJjIFsxNi8zMl06IFNLSVBQ
RUQKPiAgICAgICAgIGJvb3RsaW4tcG93ZXJwYzY0bGUtcG93ZXI4LWdsaWJjIFsxNy8zMl06IFNL
SVBQRUQKPiAgICAgICAgICAgICAgICAgICAgYm9vdGxpbi1yaXNjdjMyLWdsaWJjIFsxOC8zMl06
IFNLSVBQRUQKPiAgICAgICAgICAgICAgICAgICAgYm9vdGxpbi1yaXNjdjY0LWdsaWJjIFsxOS8z
Ml06IFNLSVBQRUQKPiAgICAgICAgICAgICAgICAgICAgIGJvb3RsaW4tcmlzY3Y2NC1tdXNsIFsy
MC8zMl06IFNLSVBQRUQKPiAgICAgICAgICAgICAgICAgIGJvb3RsaW4tczM5MHgtejEzLWdsaWJj
IFsyMS8zMl06IFNLSVBQRUQKPiAgICAgICAgICAgICAgICAgICAgICAgYm9vdGxpbi1zaDQtdWNs
aWJjIFsyMi8zMl06IFNLSVBQRUQKPiAgICAgICAgICAgICAgICAgICAgIGJvb3RsaW4tc3BhcmMt
dWNsaWJjIFsyMy8zMl06IFNLSVBQRUQKPiAgICAgICAgICAgICAgICAgICAgYm9vdGxpbi1zcGFy
YzY0LWdsaWJjIFsyNC8zMl06IFNLSVBQRUQKPiAgICAgICAgICAgICAgICAgICAgIGJvb3RsaW4t
eDg2LTY0LWdsaWJjIFsyNS8zMl06IFNLSVBQRUQKPiAgICAgICAgICAgICAgICAgICAgICBib290
bGluLXg4Ni02NC1tdXNsIFsyNi8zMl06IFNLSVBQRUQKPiAgICAgICAgICAgICAgICAgICAgYm9v
dGxpbi14ODYtNjQtdWNsaWJjIFsyNy8zMl06IFNLSVBQRUQKPiAgICAgICAgICAgICAgICAgICAg
Ym9vdGxpbi14ODYtaTY4Ni1tdXNsIFsyOC8zMl06IFNLSVBQRUQKPiAgICAgICAgICAgICAgICAg
ICAgYm9vdGxpbi14dGVuc2EtdWNsaWJjIFsyOS8zMl06IFNLSVBQRUQKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgYnItYXJtLWJhc2ljIFszMC8zMl06IFNLSVBQRUQKPiAgICAgICAgICAg
ICAgICAgICAgIGJyLWFybS1mdWxsLW5vdGhyZWFkIFszMS8zMl06IFNLSVBQRUQKPiAgICAgICAg
ICAgICAgICAgICAgICAgYnItYXJtLWZ1bGwtc3RhdGljIFszMi8zMl06IFNLSVBQRUQKPiAzMiBi
dWlsZHMsIDI0IHNraXBwZWQsIDAgYnVpbGQgZmFpbGVkLCAwIGxlZ2FsLWluZm8gZmFpbGVkLCAw
IHNob3ctaW5mbyBmYWlsZWQKPiAKPiAgcGFja2FnZS9tZXNhM2QvQ29uZmlnLmluIHwgMTAgKysr
KysrKysrLQo+ICBwYWNrYWdlL21lc2EzZC9tZXNhM2QubWsgfCAgMyArKy0KPiAgMiBmaWxlcyBj
aGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL21lc2EzZC9Db25maWcuaW4gYi9wYWNrYWdlL21lc2EzZC9Db25maWcuaW4KPiBp
bmRleCBiNWFhZWM1ZTFjLi5lOGMyYzg0NzNjIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbWVzYTNk
L0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UvbWVzYTNkL0NvbmZpZy5pbgo+IEBAIC0zNTAsNiAr
MzUwLDEzIEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9NRVNBM0RfVlVMS0FOX0RSSVZFUl9CUk9BRENP
TQo+ICAJaGVscAo+ICAJICBWdWxrYW4gYnJvYWRjb20gZHJpdmVyLgo+ICAKPiArY29uZmlnIEJS
Ml9QQUNLQUdFX01FU0EzRF9WVUxLQU5fRFJJVkVSX0ZSRUVEUkVOTwo+ICsJYm9vbCAiVnVsa2Fu
IGZyZWVkcmVubyBkcml2ZXIgKHR1cm5pcCkiCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfTUVTQTNE
X0hPU1RfTkFUSVZFX0NPTlRFWFRfU1VQUE9SVEVEX0RSSVZFUgo+ICsJc2VsZWN0IEJSMl9QQUNL
QUdFX01FU0EzRF9WVUxLQU5fRFJJVkVSCj4gKwloZWxwCj4gKwkgIFZ1bGthbiBmcmVlZHJlbm8g
ZHJpdmVyLgo+ICsKPiAgY29uZmlnIEJSMl9QQUNLQUdFX01FU0EzRF9WVUxLQU5fRFJJVkVSX0lN
QUdJTkFUSU9OCj4gIAlib29sICJWdWxrYW4gaW1hZ2luYXRpb24gZHJpdmVyIgo+ICAJZGVwZW5k
cyBvbiBCUjJfYXJtIHx8IEJSMl9hYXJjaDY0Cj4gQEAgLTQyNSw3ICs0MzIsOCBAQCBjb25maWcg
QlIyX1BBQ0tBR0VfTUVTQTNEX0hPU1RfTkFUSVZFX0NPTlRFWFRfRFJJVkVSX0FNREdQVQo+ICAK
PiAgY29uZmlnIEJSMl9QQUNLQUdFX01FU0EzRF9IT1NUX05BVElWRV9DT05URVhUX0RSSVZFUl9G
UkVFRFJFTk8KPiAgCWJvb2wgImZyZWVkcmVuby12aXJ0aW8iCj4gLQlkZXBlbmRzIG9uIEJSMl9Q
QUNLQUdFX01FU0EzRF9HQUxMSVVNX0RSSVZFUl9GUkVFRFJFTk8KPiArCWRlcGVuZHMgb24gQlIy
X1BBQ0tBR0VfTUVTQTNEX0dBTExJVU1fRFJJVkVSX0ZSRUVEUkVOTyB8fCBcCj4gKwkJQlIyX1BB
Q0tBR0VfTUVTQTNEX1ZVTEtBTl9EUklWRVJfRlJFRURSRU5PCj4gIAloZWxwCj4gIAkgIEVuYWJs
ZSBWaXJ0SU8gc3VwcG9ydCBmb3IgZnJlZWRyZW5vIG5hdGl2ZSBjb250ZXh0cwo+ICAJICB1c2Vk
IGJ5IHRoZSBmcmVlZHJlbm8gKE9wZW5HTCkgYW5kIHR1cm5pcCAoVnVsa2FuKQo+IGRpZmYgLS1n
aXQgYS9wYWNrYWdlL21lc2EzZC9tZXNhM2QubWsgYi9wYWNrYWdlL21lc2EzZC9tZXNhM2QubWsK
PiBpbmRleCBlNmY0NGFkNzNjLi4wYTQxZDg0NDQ2IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbWVz
YTNkL21lc2EzZC5tawo+ICsrKyBiL3BhY2thZ2UvbWVzYTNkL21lc2EzZC5tawo+IEBAIC0xMzAs
NiArMTMwLDcgQEAgTUVTQTNEX0dBTExJVU1fRFJJVkVSUy0kKEJSMl9QQUNLQUdFX01FU0EzRF9H
QUxMSVVNX0RSSVZFUl9aSU5LKSAgICAgKz0gemluawo+ICAjIFZ1bGthbiBEcml2ZXJzCj4gIE1F
U0EzRF9WVUxLQU5fRFJJVkVSUy0kKEJSMl9QQUNLQUdFX01FU0EzRF9WVUxLQU5fRFJJVkVSX0FN
RCkgKz0gYW1kCj4gIE1FU0EzRF9WVUxLQU5fRFJJVkVSUy0kKEJSMl9QQUNLQUdFX01FU0EzRF9W
VUxLQU5fRFJJVkVSX0JST0FEQ09NKSArPSBicm9hZGNvbQo+ICtNRVNBM0RfVlVMS0FOX0RSSVZF
UlMtJChCUjJfUEFDS0FHRV9NRVNBM0RfVlVMS0FOX0RSSVZFUl9GUkVFRFJFTk8pICs9IGZyZWVk
cmVubwo+ICBNRVNBM0RfVlVMS0FOX0RSSVZFUlMtJChCUjJfUEFDS0FHRV9NRVNBM0RfVlVMS0FO
X0RSSVZFUl9JTUFHSU5BVElPTikgKz0gaW1hZ2luYXRpb24KPiAgTUVTQTNEX1ZVTEtBTl9EUklW
RVJTLSQoQlIyX1BBQ0tBR0VfTUVTQTNEX1ZVTEtBTl9EUklWRVJfSU5URUwpICAgKz0gaW50ZWwK
PiAgTUVTQTNEX1ZVTEtBTl9EUklWRVJTLSQoQlIyX1BBQ0tBR0VfTUVTQTNEX1ZVTEtBTl9EUklW
RVJfUEFORlJPU1QpICs9IHBhbmZyb3N0Cj4gQEAgLTE1Nyw3ICsxNTgsNyBAQCBlbHNlCj4gIE1F
U0EzRF9DT05GX09QVFMgKz0gLURhbWRncHUtdmlydGlvPWZhbHNlCj4gIGVuZGlmCj4gIAo+IC1p
ZmVxICgkKEJSMl9QQUNLQUdFX01FU0EzRF9HQUxMSVVNX0RSSVZFUl9GUkVFRFJFTk8pLHkpCj4g
K2lmbmVxICgkKEJSMl9QQUNLQUdFX01FU0EzRF9HQUxMSVVNX0RSSVZFUl9GUkVFRFJFTk8pJChC
UjJfUEFDS0FHRV9NRVNBM0RfVlVMS0FOX0RSSVZFUl9GUkVFRFJFTk8pLCkKCldoYXQgaWYgb25s
eSBCUjJfUEFDS0FHRV9NRVNBM0RfVlVMS0FOX0RSSVZFUl9GUkVFRFJFTk8gaXMgc2V0ID8KCk1F
U0EzRF9HQUxMSVVNX0RSSVZFUl9GUkVFRFJFTk9fS01EUyBjYW4gYmUgc2V0IHdpdGhvdXQKQlIy
X1BBQ0tBR0VfTUVTQTNEX0dBTExJVU1fRFJJVkVSX0ZSRUVEUkVOTyBlbmFibGVkLgoKTWF5YmUg
TUVTQTNEX0dBTExJVU1fRFJJVkVSX0ZSRUVEUkVOT19LTURTIG5lZWRzIHRvIGJlIHJlbmFtZWQg
PwoKU29tZXRoaW5nIGxpa2UgTUVTQTNEX0ZSRUVEUkVOT19LTURTPyAod2l0aG91dCAiR2FsbGl1
bSB3b3JkKS4KCktNRFMgc3RhbmQgZm9yICJrZXJuZWwtbW9kZSBkcml2ZXJzIiBmb3IgZnJlZWRy
ZW5vIGdhbGxpdW0gYW5kIHZ1bGthbiBkcml2ZXIKCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAg
TUVTQTNEX0dBTExJVU1fRFJJVkVSX0ZSRUVEUkVOT19LTURTID0gbXNtCj4gIGlmZXEgKCQoQlIy
X1BBQ0tBR0VfTUVTQTNEX0hPU1RfTkFUSVZFX0NPTlRFWFRfRFJJVkVSX0ZSRUVEUkVOTykseSkK
PiAgTUVTQTNEX0dBTExJVU1fRFJJVkVSX0ZSRUVEUkVOT19LTURTICs9IHZpcnRpbwo+IAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
