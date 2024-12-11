Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD4CE77180
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 13:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 570B6406AD;
	Wed, 11 Dec 2024 13:57:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EWGZLeI_7nej; Wed, 11 Dec 2024 13:57:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34287406B3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34287406B3;
	Wed, 11 Dec 2024 13:57:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A4C4ED2
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 13:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E021981992
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 13:57:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8nRdho4oHNoH for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 13:57:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::343; helo=mail-wm1-x343.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ADCE481975
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADCE481975
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ADCE481975
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 13:57:54 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-434f3d934fcso23992495e9.3
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 05:57:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733925472; x=1734530272;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a7CxnnE/qAXdCQDk37gkdHG0kv+fcZCeq9MX0f5bBYg=;
 b=jN+7N8aRLAGnFDcfgqaT6Fci/F/YMyeLYM0hVixSUXpOydHJFdHO559Hu8m5/tnjbN
 JssqzZRIMgbm5973p8XZH/NIZ5GvwGjnH+n8Dw/w6xQj92lZT5305Q5Q4vpjVLmzGwS9
 UB9U+GokOMOnj9L8cCeKCcU24yKCPe6D2RPTwUmU7fILZ/oASDbYLnAvkGAWPoWLr62Y
 xNygjqzYngSD2Py9wRlvgBwOkJo8Cc7uDDZH95D094WgFQ8yZYBXIvWfjz6cQXUw1Vhh
 Pn2aUsdd/nfShpvKGuJUadcUoSC5zPNXKvQ7G8Knvaszd5u4LBbQWpFaQTo/VXzwpTeM
 EVNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWf72eE5hZhEWbBbrG1wzCtgJbcTf6BMK6jvcuR0YscKiv0EhOWXwbMBSx3ozPM88fa3h02jA9D/Iw=@buildroot.org
X-Gm-Message-State: AOJu0YwE18Ij1+z+PMei/uB8WbNJDdx4zYhFaRmWhdGAYqqlaP0Y/Ggz
 fua+cz0u/xHBd9Ffh1HavYR6UkzPki86xLk4FK7YgPboJ0oG1feHy0INwqjMuTpVDFwxLsKLThz
 cdz3P6g==
X-Gm-Gg: ASbGncsDwFsipg4JEn13vNGP+EXUU/45JCTGPC3jjWnJm1F+w/n0j/D1+bBPXTB1cBK
 Lz505C8pRMzkaeqz0X15TWQRYM1U7SChcWNScUb+rXKZuqIhK//SKi8ZKqHtzXOlmzSeQdmh375
 5TOIucFg9Tcl8fSRebzbheKg/l8XuIrmHXrF/RLTSmCLuIBT524h71NJZgukHZbPO/bA0QELZqs
 lAxFhOFZhpGbWhyNc6a/ys61DvrWue7EU1OzPa/DyqpVIEZD+mXhMnTmbUBQRohpSfwmECm5tn8
 3T2kkcMV3fKg+zMAahvcvUuYxJDfkNEvXVj0w+MSiQ==
X-Google-Smtp-Source: AGHT+IFsRfrj5ZcI+zjPGKIWGR0qL5fXGuPQv2Ip9PcuFNuffBuIB5kM/1S5Txd0MEuXAnJn8Srj2Q==
X-Received: by 2002:a05:600c:198a:b0:431:52f5:f48d with SMTP id
 5b1f17b1804b1-4361c441f18mr25817965e9.31.1733925472612; 
 Wed, 11 Dec 2024 05:57:52 -0800 (PST)
Received: from [10.5.90.20]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-435c1833d67sm49825565e9.5.2024.12.11.05.57.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 05:57:52 -0800 (PST)
Message-ID: <dc1ed8f5-0852-4c94-9081-65c4d711049d@smile.fr>
Date: Wed, 11 Dec 2024 14:57:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20241117123839.536725-1-ju.o@free.fr>
Content-Language: fr, en-US
In-Reply-To: <20241117123839.536725-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1733925472; x=1734530272; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=a7CxnnE/qAXdCQDk37gkdHG0kv+fcZCeq9MX0f5bBYg=;
 b=BJ7K7tMPyKi5yzUy1C2T+xufFjw8gPd6ZnMju+tgkuOrgvc+jmzb3Wo9V/yTTD8qM0
 rZ9zkzgZLwvuOOGIJt2XQcAM3v/vN66+VDcR9Lw/7jEL3KVK02ACPNlIQtnsgBw3uAw/
 UFLtcyqtG19Ml1qseqgHqt0eJx+v3xRxwKMWs=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=BJ7K7tMP
Subject: Re: [Buildroot] [PATCH next 1/1] package/octave: update _SITE to
 use BR2_GNU_MIRROR
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

SGVsbG8gSnVsaWVuLCBBbGwsCgpMZSAxNy8xMS8yMDI0IMOgIDEzOjM4LCBKdWxpZW4gT2xpdmFp
biBhIMOpY3JpdMKgOgo+IFRoZSBvY3RhdmUgcGFja2FnZSBpcyBkaXN0cmlidXRlZCBvbiB0aGUg
R05VIHByb2plY3Qgc2VydmVycy4gU2VlIFsxXQo+IGFuZCBbMl0uIEJ1aWxkcm9vdCBoYXMgdGhl
IEJSMl9HTlVfTUlSUk9SIGNvbmZpZ3VyYXRpb24gd2hpY2ggY2FuCj4gYmUgdXNlZCBmb3IgdGhh
dCBwdXJwb3NlLiBTZWUgWzNdLgo+IAo+IEZvciBjb25zaXN0ZW5jeSB3aXRoIGFsbCBvdGhlciBH
TlUgcGFja2FnZXMsIHRoaXMgY29tbWl0IHVwZGF0ZXMKPiB0aGUgX1NJVEUgdG8gdXNlIEJSMl9H
TlVfTUlSUk9SLgo+IAo+IFsxXSBodHRwczovL3d3dy5vY3RhdmUub3JnL2Rvd25sb2FkCj4gWzJd
IGh0dHBzOi8vd3d3LmdudS5vcmcvcHJlcC9mdHAuaHRtbAo+IFszXSBodHRwczovL2dpdGxhYi5j
b20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9ibG9iLzIwMjQuMDguMi9Db25maWcuaW4jTDI4
Ngo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBPbGl2YWluIDxqdS5vQGZyZWUuZnI+Cj4gLS0t
Cj4gIHBhY2thZ2Uvb2N0YXZlL29jdGF2ZS5tayB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvb2N0
YXZlL29jdGF2ZS5tayBiL3BhY2thZ2Uvb2N0YXZlL29jdGF2ZS5tawo+IGluZGV4IDJlMmZlMGY5
ODkuLjM0ZDkyODhjNzUgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9vY3RhdmUvb2N0YXZlLm1rCj4g
KysrIGIvcGFja2FnZS9vY3RhdmUvb2N0YXZlLm1rCj4gQEAgLTUsNyArNSw3IEBACj4gICMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjCj4gIAo+ICBPQ1RBVkVfVkVSU0lPTiA9IDkuMi4wCj4gLU9DVEFW
RV9TSVRFID0gaHR0cHM6Ly9mdHAuZ251Lm9yZy9nbnUvb2N0YXZlCj4gK09DVEFWRV9TSVRFID0g
JChCUjJfR05VX01JUlJPUikvb2N0YXZlCgpBY3R1YWxseSBvdXIgQlIyX0dOVV9NSVJST1IgZGVm
YXVsdCB2YWx1ZSB1c2VzIGh0dHAgImh0dHA6Ly9mdHBtaXJyb3IuZ251Lm9yZyIuClNvLCBoZXJl
IHlvdSByZXBsYWNlIGFuIGh0dHBzIHVybCBieSBodHRwIG9uZS4KCk1heWJlIGl0J3MgdGltZSB0
byB1cGRhdGUgQlIyX0dOVV9NSVJST1IgdG8gaHR0cHM/CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoK
Cj4gIE9DVEFWRV9TT1VSQ0UgPSBvY3RhdmUtJChPQ1RBVkVfVkVSU0lPTikudGFyLmx6Cj4gIE9D
VEFWRV9MSUNFTlNFID0gR1BMLTMuMCsKPiAgT0NUQVZFX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5H
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
