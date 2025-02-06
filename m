Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C9EC02196
	for <buildroot@archiver.kernel.org>; Thu,  6 Feb 2025 08:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1297661222;
	Thu,  6 Feb 2025 08:36:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pMtgFUrGVvqK; Thu,  6 Feb 2025 08:36:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B17D6124E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B17D6124E;
	Thu,  6 Feb 2025 08:36:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 738B9CF
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 08:36:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61393424A7
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 08:36:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vuRzv61UxeWt for <buildroot@buildroot.org>;
 Thu,  6 Feb 2025 08:36:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C73F9416BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C73F9416BE
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C73F9416BE
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 08:36:04 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4363dc916ceso10333115e9.0
 for <buildroot@buildroot.org>; Thu, 06 Feb 2025 00:36:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738830962; x=1739435762;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NdQqZdNsiJRJ1Ec1o63UbaHA4f1TFsFikKqzidFNCfs=;
 b=Q7FOLH7Rxs9Ck8PK9KMk235uAI0a4uy7jqDqVGarXg4ZdI8rDzHT6VBXcdcE/+E59p
 l4JJUecl3XUU8Ycaz0MNVSws8EOxqBW5PvnaaCqOpdCKfRPfSBrisHyn7pot7LWUul4A
 8W7aDL9bH6p0Dff5RZjGNMr1GbfCCXEg1ExzSzfXcRnu/l8Wbb9Qp3qBSjKeWVuEG9L6
 XoUPby+B1FRJ3B9qYn2lTasWGoNuo6d1+eudO3/LkLOWRv1KA68I+nwOsNfK7haoG+jI
 v9/l2UewqYOMlD+z4UYBhqg5yw5XIfTIPVohtgUtRVhoazSfWyIJ+Fu5WTVC1lBoCSZR
 T5uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1lHOzqUhbucz/nZDD0YvErKpBUuBK6lytJ61yS2R9dnZ2lb0CUO/yH6DSDniYDZt1EahXsMUXlb8=@buildroot.org
X-Gm-Message-State: AOJu0YyBc2koXuDPeRWSVjpNE+OEx4gFqYf7C+raY67I77iN2sLTRHxu
 V5ChWwP9T0hEvcq/eKVdNqoS0HmBwEVU2cmtjpfqCZZwGoKDQ8wyI1j5sldjaAImSIx9aLv/4Sh
 sgQY=
X-Gm-Gg: ASbGncsu5p+5RxkQZHRTr8b1k7hsh2yNIJjBuHa6s2CtAIUqiFvpWQPJj/aQJfKQtoo
 3qvBw/MZ+3S79LyiIrSNjF93syOev1vcKgPmKrNebgFQZqlOTCf0gemQl7+gfiSDDnX6oCYnOCH
 kQDrn4noOVheWqWFsutM+SdZroFwQrinwxReRCssJvOQWXJg2BNiTnUwKkoVbjBJSqebk1xH0N7
 UrlmpAuCKt1geopCiL2XWOSeLlBemv+Kk1pQbpanf2bdMpnjSEwGwcNy8n+1xSD0AfAKFInjhdq
 HvdCcqLbo4bIbvBg/AqJdetOstP70of0LD5QYAhtiMZUzQ0SLOOmJGuHUuup05/AdpEVmSR+Nvr
 Uha39UuZhtFjrs+F21cFKzb8FogZLFu/OyNduaiG9+CGIhi1sJeg=
X-Google-Smtp-Source: AGHT+IFv/W14Nw5BTnp2CdujQegXp06ANeRf69vyJZKM3+YsL/SIKnLSD8mZMFWowN5QRZtwtYXlhw==
X-Received: by 2002:a5d:5f48:0:b0:386:37f8:451c with SMTP id
 ffacd0b85a97d-38dbb20b159mr1902718f8f.1.1738830962569; 
 Thu, 06 Feb 2025 00:36:02 -0800 (PST)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dbdd3856fsm1094083f8f.28.2025.02.06.00.36.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 00:36:02 -0800 (PST)
Message-ID: <e7c06d15-5581-4a26-abfa-5a826e181108@smile.fr>
Date: Thu, 6 Feb 2025 09:36:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20250206072321.677851-1-peter@korsgaard.com>
 <20250206072321.677851-4-peter@korsgaard.com>
Content-Language: en-US
In-Reply-To: <20250206072321.677851-4-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1738830962; x=1739435762; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NdQqZdNsiJRJ1Ec1o63UbaHA4f1TFsFikKqzidFNCfs=;
 b=krL+8xu89neULYfsv+OcC7YY572Ey2G5qzknh/OrNo7dIqNeEWfmP3QkygT6ksBr/1
 G3fiX1jnL+RalFu0JCaxo3IdYtFO+AaqcECzyQ0bAOvC1Co74sgvWGoWWMXJ99Nk568p
 f0RgiupV2x4sJ//RtOf0QcnoeuleLg0bRQ91U=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=krL+8xu8
Subject: Re: [Buildroot] [PATCH 4/4] .gitlab-ci.yml: use Debian 12-based
 container image with curl / tar 1.35
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

SGVsbG8gUGV0ZXIsIEFsbCwKCkxlIDA2LzAyLzIwMjUgw6AgMDg6MjMsIFBldGVyIEtvcnNnYWFy
ZCBhIMOpY3JpdMKgOgo+IFNpZ25lZC1vZmYtYnk6IFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29y
c2dhYXJkLmNvbT4KPiAtLS0KPiAgLmdpdGxhYi1jaS55bWwgfCAyICstCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS8uZ2l0
bGFiLWNpLnltbCBiLy5naXRsYWItY2kueW1sCj4gaW5kZXggM2Q3NzE5NTY4Zi4uN2ViYTg3NmE1
NCAxMDA2NDQKPiAtLS0gYS8uZ2l0bGFiLWNpLnltbAo+ICsrKyBiLy5naXRsYWItY2kueW1sCj4g
QEAgLTEsNyArMSw3IEBACj4gICMgQ29uZmlndXJhdGlvbiBmb3IgR2l0bGFiLUNJLgo+ICAjIEJ1
aWxkcyBhcHBlYXIgb24gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290
L3BpcGVsaW5lcwo+ICAKPiAtaW1hZ2U6ICRDSV9SRUdJU1RSWS9idWlsZHJvb3Qub3JnL2J1aWxk
cm9vdC9iYXNlOjIwMjMwMjA3LjExMjMKPiAraW1hZ2U6ICRDSV9SRUdJU1RSWS9idWlsZHJvb3Qu
b3JnL2J1aWxkcm9vdC9iYXNlOjIwMjUwMjA1LjE1MTQKClRoaXMgcmVxdWlyZXMgc29tZSB0ZXN0
aW5nIHdpdGggdGhlIEJ1aWxkcm9vdCB0ZXN0c3VpdGUuIFNvbWUgdGVzdHMgbWF5IHJlcXVpcmVz
CmFuIHVwZGF0ZSBkdWUgdG8gcWVtdSB2ZXJzaW9uIGNoYW5nZS4KClNlZSB0aGlzIGNvbW1pdCBh
cyBleGFtcGxlOgoKaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0v
Y29tbWl0L2Q4NDQ3YzM4ZjUzZjk4ZTFkZjRhMjA5ZTlmNzBlNTRmOGI2MGYzNmUKCkJlc3QgcmVn
YXJkcywKUm9tYWluCgoKPiAgCj4gIHN0YWdlczoKPiAgICAtIGdlbmVyYXRlLWdpdGxhYi1jaQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
