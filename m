Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D32E73158
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 11:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC32D81F36;
	Mon,  2 Feb 2026 11:20:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xi3O746PotY0; Mon,  2 Feb 2026 11:20:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B1A781F93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770031219;
	bh=Cn95g2cU8NpYdgzLOJK36T3w6YrES8m/4GfsjfyMqx4=;
	h=Date:To:References:Cc:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SurzX/7ktjCxgx4szbV8WoFSb380c/uZDdTpJkat2cnudGiGTAuoScaoyrYd1fZPR
	 q9M+lTNOzZEQccAw7H6HtgElBC3n9yPKJUaDN8F1vca1ztNdk+MmCFf2JEJ2kd7M50
	 Jxcatbbf/jM+l73BhpwGjDQouj7DXhUD+2I0TwzqOKuXvbvNKb4Q8l7fgZxWYHiwJ0
	 PIBRbIzbEX9+WFv5Wc2XjoFOxwES/eJn2K2YWn7SHaSyRS6hSjw5jiVB0XSPMF6KEa
	 eTT/SQKi3Vkhy/azrtpE8NDCrYPa/UmKJLqFnL0Sgiz2AeOjVre1xbiP0A+UQNA/dU
	 KfYp4O/60vP1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B1A781F93;
	Mon,  2 Feb 2026 11:20:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DA4921E0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 11:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7D7740A84
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 11:20:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xfqV_NgeMbDl for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 11:20:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AB20840A54
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB20840A54
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AB20840A54
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 11:20:17 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4801c2fae63so32055485e9.2
 for <buildroot@buildroot.org>; Mon, 02 Feb 2026 03:20:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770031215; x=1770636015;
 h=content-transfer-encoding:in-reply-to:cc:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YP+E7B0OBaf0feRlkw9nTMRkFOLWF4zfdREYWf8VLE8=;
 b=p97Zn8+75wyFqqDCf5yAsp379dGCPXRbQjVq8u2+UiVZm16NhTM9KNj+LQTyIaFcBX
 ekEWnKa6etbML4t3ZM2H5YTbG31qHes9dXdjkTwwBDkQ9bjP/RpoEHWPQYzgAfB3tIm/
 K1PBLaSfmESHo++RII+CyYJfEKId1NXxn+nXxlDlrM904BfBVmd2xsOyCAlUHuxFMk+O
 EMWENwOVLjY4sSvRsURQm0nSXGX+ffAZLwVyWqwjMR1B3npd5/Ym9bETXjf9KRTkgWel
 J7rduMLezOtF5fxwA79OdNfw7IQf0RvOMwN1x8Oe3pj36nUyOctvQx0MEJsXbCF0m8Pm
 rpaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUIpW1zKjkMc2B3nLW9pYWryQHrB3zb3iT3vwZSCiZA6nXH6qXPSNhYkmh2L66+PhRMcpdsaiO3QA=@buildroot.org
X-Gm-Message-State: AOJu0YwmO6wCqinCDNnXtQQMEik6LCPVH9qEye/Nbk4J/J/qZJiR3uXw
 xj4SL2Y+TbSRK/p3D41eFIDOdJKuWf40V6lSqcVudgFHwdo7k5V4oH53ixp6eWdB7LlK9Zs8sm5
 WSYcoIOY=
X-Gm-Gg: AZuq6aLBTLGAuYbRMEegZk2EMb63GPNgAiDfOEHE0LViTjcqQIUkHbm73Xw2WEs1nza
 DUKtjC5vC2sDCLA3t3Vn8W9Cq2O8EfgmCyBkdttKVqKpAgxHvo+8Pm2AzfLYEMT/U3K9KSgOI9I
 K1ShSPJTpOfrSMarr5WFwYKp36vzLb31CO7THTMFRauP6xHO0WsJVfbvUf3JDljUkMHXgh6qI++
 On2/8Y50YzPwwTCxRFfLRcfMHYobq76p2kZsFs3cYiFOlQtgi2x3Eod/IDhXbNEXwF1r2ZdACMa
 qJ7MGD0zhXxh7Is4O/CL1/Q0SW8J/ed3M69lVfoiIgfbVgmfT/Zz+oldu+eXtXUXl1o0Peo89wK
 WhelCUDSS7F3W2/P37MXoH6j4++pJEAvHYTw2iV5rRjcRYICaW9EDoMF1uo1JzuhI5xcYjdZ9Kx
 09uAW+ZcR0KPFDwpAylUBKvt1sZoANUYAKy+/7ullb3ES1EJIwezi5GGDi6nIZGKI=
X-Received: by 2002:a05:600c:628c:b0:480:2521:4d92 with SMTP id
 5b1f17b1804b1-482db47ce39mr143401935e9.24.1770031215577; 
 Mon, 02 Feb 2026 03:20:15 -0800 (PST)
Received: from [172.16.2.208] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-482e04ed4d2sm90284205e9.7.2026.02.02.03.20.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Feb 2026 03:20:15 -0800 (PST)
Message-ID: <5ad8d637-43dc-462a-97c4-69cd80e50de3@smile.fr>
Date: Mon, 2 Feb 2026 12:20:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Buildroot Notifications <buildroot.notifications@gmail.com>,
 buildroot@buildroot.org
References: <69798de3.050a0220.10c4f0.eab1@mx.google.com>
Content-Language: fr
Cc: Julien Olivain <ju.o@free.fr>
In-Reply-To: <69798de3.050a0220.10c4f0.eab1@mx.google.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1770031215; x=1770636015; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:cc:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YP+E7B0OBaf0feRlkw9nTMRkFOLWF4zfdREYWf8VLE8=;
 b=uDLxEMohSMB53KFyWkZHTMffxO9QmoTPJkO6XUm/MAIjWfgLoabVTrlEjnZ7RhWaUc
 zUimYqc67m3LHBmN9jwgEIff2MyPBXJ63PEASq7mxrI/7Mm6kei/rWqywc/bKsJ7dWn6
 lBQ/hA1nCOZYKwH5dNsZe4oYqChjivMF5cLTc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=uDLxEMoh
Subject: Re: [Buildroot] [autobuild.buildroot.org] Daily results for
 2026-01-27
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

SGVsbG8sIEFsbCwKCkxlIDI4LzAxLzIwMjYgw6AgMDU6MTcsIEJ1aWxkcm9vdCBOb3RpZmljYXRp
b25zIGEgw6ljcml0wqA6Cj4gSGVsbG8sCj4gCgo+IAo+IAo+IEdpdGxhYiBDSSByZXN1bHRzIGZv
ciAyMDI2LTAxLTI3Cj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiAKPiBEZXRh
aWwgb2YgcnVudGltZS10ZXN0IGZhaWx1cmVzIGZvciBtYXN0ZXIKPiAtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAKPiAgICAgICAgICAgICAgcnVudGltZS10ZXN0
IHwgICAgICAgICAgICAgICAgICAgICAgICBsaW5rIHRvIHRoZSBqb2IgICAgICAgICAgICAgICAg
ICAgICAgICB8IG9ycGg/Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0t
LQo+ICAgICAgICAgIFRlc3RQeXRob25QeWJpbmQgfCBodHRwczovL2dpdGxhYi5jb20vYnVpbGRy
b290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzEyODU3NDEzOTY1IHwgICAgICAKPiAuLi5QeXRob25Q
eTNNYWdpY1dvcm1ob2xlIHwgaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRy
b290Ly0vam9icy8xMjg1NzQxMzk0MSB8ICAgICAgCj4gICAgICAgICAgVGVzdFBocEx1YUx1YWpp
dCB8IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvMTI4
NTc0MTM4MTQgfCAgICAgIAo+ICAgICAgICAgICAgIFRlc3RQaHBMdWFMdWEgfCBodHRwczovL2dp
dGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzEyODU3NDEzODEyIHwgICAg
ICAKPiAgIFRlc3ROb2RlSlNNb2R1bGVIb3N0U3JjIHwgaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxk
cm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy8xMjg1NzQxMzc2NiB8ICAgICAgCj4gICBUZXN0Tm9k
ZUpTTW9kdWxlSG9zdEJpbiB8IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxk
cm9vdC8tL2pvYnMvMTI4NTc0MTM3NjUgfCAgICAgIAo+ICAgICAgICAgICBUZXN0Tm9kZUpTQmFz
aWMgfCBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzEy
ODU3NDEzNzY0IHwgICAgICAKPiAgICAgICAgICAgICAgIFRlc3RNYXJpYURCIHwgaHR0cHM6Ly9n
aXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy8xMjg1NzQxMzczNCB8ICAg
ICAgCj4gICAgICAgICAgICAgICBUZXN0Rmx1dHRlciB8IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWls
ZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvMTI4NTc0MTM0MTYgfCAgICAgIAo+ICAgICAgVGVz
dEZpcmV3YWxsZFN5c3RlbWQgfCBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWls
ZHJvb3QvLS9qb2JzLzEyODU3NDEzNDEyIHwgT1JQSCAKPiAgICAgICAgICAgICAgIFRlc3RCaXRj
b2luIHwgaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy8x
Mjg1NzQxMzM3MyB8ICAgICAgCj4gICAgICAgICAgICAgICBUZXN0QXZvY2FkbyB8IGh0dHBzOi8v
Z2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvMTI4NTc0MTMzNjQgfCBP
UlBIIAo+IAoKVGVzdCBBdm9jYWRvIGZhaWwgZm9sbG93aW5nIHRoZSBweXRob24gMy4xNCB2ZXJz
aW9uIGJ1bXAuCgpPdXIgYXZvY2FkbyB2ZXJzaW9uIGlzIHF1aXRlIG9sZCwgbmV3ZXIgdmVyc2lv
biAoMTEyKykgc2VlbXMgdG8gaGF2ZSBmaXhlZApweXRob24gMy4xNCBzdXBwb3J0OgoKaHR0cHM6
Ly9naXRodWIuY29tL2F2b2NhZG8tZnJhbWV3b3JrL2F2b2NhZG8vY29tbWl0L2MxZGU0NGZhYmMw
NDdmMTQ5ZDZhOWY3NDJhZGVjZDhlZDVjZjkzOWQKCkkganVzdCBzZW50IGEgcGF0Y2g6Cmh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2J1aWxkcm9vdC8yMDI2MDIwMjExMTkyNy4xMzYxMDQtMS1yb21h
aW4ubmFvdXJAc21pbGUuZnIvVC8jdQoKQmVzdCByZWdhcmRzLApSb21haW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
