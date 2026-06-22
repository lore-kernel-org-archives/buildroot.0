Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86474CD98F2
	for <buildroot@archiver.kernel.org>; Mon, 22 Jun 2026 22:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3539560659;
	Mon, 22 Jun 2026 22:02:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8RRd3bofkjXL; Mon, 22 Jun 2026 22:02:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FBC96069D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782165753;
	bh=vlLjsCUMeqE6OJYQEw63YerPJI2CVdylQpD0gW7hxeg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TNnzGyVyjvb4XhkC8a3xj/P1G0ngb7wPRifU1EbdQ8zyKLaOxRXdaAWPwcq3tQRn6
	 FdRF7TYKPgsB8UFu2GR4eXGOvSv21UN4uKviq2ICtCzlDMi2+7fgtJRj201wTRIx98
	 hm50Cszh3mL4ZJ9EFiyZpOOtBAk4yHwIQVvNRLehuASMkLVNCd1RbppL8sY+SmBXOB
	 AszXLKE6hrOvGX0ucXX4AHfLhbPVivP6vVnuH2hM5uVcELOew/5U1D7Hhwn0O1ZnLQ
	 4QlskdSYjbuMmYT2J9LIopmGOkcrUIOLsKDPCkpK26RCAkVz0jTM6wLKaua+Z6F/pe
	 dG+9AFu7sMhgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FBC96069D;
	Mon, 22 Jun 2026 22:02:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EB892256
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 22:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC30280F71
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 22:02:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qq1m6po2Afpz for <buildroot@buildroot.org>;
 Mon, 22 Jun 2026 22:02:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8049C80F68
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8049C80F68
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8049C80F68
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 22:02:31 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-490b9318997so33806955e9.2
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 15:02:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782165749; x=1782770549;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tyNPLUthNBAR86RzRQsfCa1UrEVjyiqSNqZtqLULo90=;
 b=c4sPq7ndi+mQ2exXrUtJit/wZeyKc/FUG3CEujnnscWg94+tZEQ3q9czjyIhYFlYJA
 p45T8vTjD4LIUScj3jz+FOyeCRkzp3nAcvixJ+M1eWenjThpSSHK9Upnl4eJQfM1+wJp
 /U+zRUNseDaubGjlmx4gNzGWqd6f5c2gXDAVSYqrdC6kSgPCmO/2/C/orLcLjc2yBx2a
 xHErRRMk9F8RK/ZLMZRyKdnHnoVmtZ0KSmCHn+7otIW4j1O5KxB8xj1hRNrmPZCmXGpZ
 K4NUY63MBrJXKMX91RrvxFI1pVNJMGne7c6yEXiMEBnRyMTPm4yW6QMG0Tf0WD+zY2Oi
 mokw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/Jw7DrUL5/pPUryPWC+kyhGyRXv8b4GAi8LWKt7KYfslmgnKC2O2hbifKnObpTCFqJ5UjfLMOU39M=@buildroot.org
X-Gm-Message-State: AOJu0YyeafgG5VgFlrznvsdHpNP8Olw+so/20mMsFBS49bFEazt8TIVT
 sOcvy+ksFKpIStT0T3IjxCoBjgKdURdlx9pVe0f19yTMH/HK6bQ0lWt/+HUudGD9Xew=
X-Gm-Gg: AfdE7ckgvNDyLBTEU3PDpm2jQ+jxVlMlCcdurZ5v463t8Aq0lH+ux40vn7ws/IAgbQL
 p4ijGJVPcqgEbal/87BMcnQ+DkKCqXb6CHCsTmDubwBKZdgV+A+yzRZoVn2WCFzP+doxA2t9cFB
 HI3Fr9Nj7Fl9ZG5ruesGCWEEO3cpFEciTPsXe6+mS5bOKoK3y1UBFemfFJDhzMRsTBcoYa+MmB/
 61Px/Jq/WFWvA8d2C2tE8hfTvh0VA73H4nw782vyR+YZkO4j7f03u1/C3O3F1jbxEEENLQiToj/
 BRA0kM70aoZOLk+ur38iOxeELAkvrl9R6mHOF5HmpX3uvkKT3T8eYmTJwd0IsTorTg1oqKQ/41/
 alVPBM3KyU8LlLlF6jA2mwnDimXHuX9I6XDjU+gx01QQ45JSabA1kphV0szscVe7cpTALpDBxPA
 at57srdzeN9wXol0q/c/wytm/D5giyKQKu1u4kgdwdQX+qSH4NFZpLMjdqwvPOH9Pc+qOYjU4xH
 hGMn3gVQlu/w9mVqMoxUZPbjTxuK28ssal8XKV5wTdrSnxzesaGKQA=
X-Received: by 2002:a05:600c:19c8:b0:492:4cc7:de73 with SMTP id
 5b1f17b1804b1-4924cc7df3dmr173845135e9.31.1782165748287; 
 Mon, 22 Jun 2026 15:02:28 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-466648c5397sm32446866f8f.13.2026.06.22.15.02.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2026 15:02:27 -0700 (PDT)
Message-ID: <128c9a84-b29d-4155-aed0-7b697d9f8516@smile.fr>
Date: Tue, 23 Jun 2026 00:02:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
References: <20260619063054.2870792-1-bernd@kuhls.net>
 <20260619063054.2870792-2-bernd@kuhls.net>
Content-Language: fr
In-Reply-To: <20260619063054.2870792-2-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1782165749; x=1782770549; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tyNPLUthNBAR86RzRQsfCa1UrEVjyiqSNqZtqLULo90=;
 b=l90TRfuzbgQJL7meA4K672827GulC0PEW960PCUXCAyWW0TElmSg9EKasiD3EPVq5T
 071eyPnAb35w7ZyJ1Mp7/MQ8FBLeZuEQW7qbXOMsTsBc3uqnTFmQvXkEteE5+S56bdxz
 aElNN5nk9oWnDh0qWjlbyd7TGP5DSRcUp2d30=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=l90TRfuz
Subject: Re: [Buildroot] [PATCH 2/2] package/{mesa3d,
 mesa3d-headers}: bump version to 26.1.3
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

SGVsbG8gQmVybmQsIEFsbCwKCkxlIDE5LzA2LzIwMjYgw6AgMDg6MzAsIEJlcm5kIEt1aGxzIGEg
w6ljcml0wqA6Cj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvbWVzYS1h
bm5vdW5jZS8yMDI2LUp1bmUvMDAwODU1Lmh0bWwKClNlcmllcyBhcHBsaWVkIHRvIG1hc3Rlciwg
dGhhbmtzLgoKQmVzdCByZWdhcmRzLApSb21haW4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCZXJuZCBL
dWhscyA8YmVybmRAa3VobHMubmV0Pgo+IC0tLQo+IFNlcmllcyBwYXNzZWQgR2l0bGFiIHBpcGVs
aW5lOgo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9ia3VobHMvYnVpbGRyb290Ly0vY29tbWl0cy8zNmZm
M2QyNjA1ZWIzY2U2NDkxN2I4OWE1NGU5NjUyMDQ0ODRhMTBiCj4gCj4gIHBhY2thZ2UvbWVzYTNk
LWhlYWRlcnMvbWVzYTNkLWhlYWRlcnMubWsgfCAyICstCj4gIHBhY2thZ2UvbWVzYTNkL21lc2Ez
ZC5oYXNoICAgICAgICAgICAgICAgfCA2ICsrKy0tLQo+ICBwYWNrYWdlL21lc2EzZC9tZXNhM2Qu
bWsgICAgICAgICAgICAgICAgIHwgMiArLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9u
cygrKSwgNSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9tZXNhM2QtaGVh
ZGVycy9tZXNhM2QtaGVhZGVycy5tayBiL3BhY2thZ2UvbWVzYTNkLWhlYWRlcnMvbWVzYTNkLWhl
YWRlcnMubWsKPiBpbmRleCAzYzZmMmVlMWYyLi45NzgxYTEzNTdjIDEwMDY0NAo+IC0tLSBhL3Bh
Y2thZ2UvbWVzYTNkLWhlYWRlcnMvbWVzYTNkLWhlYWRlcnMubWsKPiArKysgYi9wYWNrYWdlL21l
c2EzZC1oZWFkZXJzL21lc2EzZC1oZWFkZXJzLm1rCj4gQEAgLTEyLDcgKzEyLDcgQEAgZW5kaWYK
PiAgCj4gICMgTm90IHBvc3NpYmxlIHRvIGRpcmVjdGx5IHJlZmVyIHRvIG1lc2EzZCB2YXJpYWJs
ZXMsIGJlY2F1c2Ugb2YKPiAgIyBmaXJzdC9zZWNvbmQgZXhwYW5zaW9uIHRyaWNrZXJ5Li4uCj4g
LU1FU0EzRF9IRUFERVJTX1ZFUlNJT04gPSAyNi4xLjIKPiArTUVTQTNEX0hFQURFUlNfVkVSU0lP
TiA9IDI2LjEuMwo+ICBNRVNBM0RfSEVBREVSU19TT1VSQ0UgPSBtZXNhLSQoTUVTQTNEX0hFQURF
UlNfVkVSU0lPTikudGFyLnh6Cj4gIE1FU0EzRF9IRUFERVJTX1NJVEUgPSBodHRwczovL2FyY2hp
dmUubWVzYTNkLm9yZwo+ICBNRVNBM0RfSEVBREVSU19ETF9TVUJESVIgPSBtZXNhM2QKPiBkaWZm
IC0tZ2l0IGEvcGFja2FnZS9tZXNhM2QvbWVzYTNkLmhhc2ggYi9wYWNrYWdlL21lc2EzZC9tZXNh
M2QuaGFzaAo+IGluZGV4IGRlYjdlYTdmN2IuLmFiYzA1Mjc5MDcgMTAwNjQ0Cj4gLS0tIGEvcGFj
a2FnZS9tZXNhM2QvbWVzYTNkLmhhc2gKPiArKysgYi9wYWNrYWdlL21lc2EzZC9tZXNhM2QuaGFz
aAo+IEBAIC0xLDYgKzEsNiBAQAo+IC0jIEZyb20gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvYXJjaGl2ZXMvbWVzYS1hbm5vdW5jZS8yMDI2LUp1bmUvMDAwODUzLmh0bWwKPiAtc2hhMjU2
ICBiYWMyYmNhOTEyMTg5N2EyYjgxNjJlNzk2MzZiNTBhYzk5OGZjYTc5OWM4ZTZjZjkxNGVkZDg1
OTYyYmFiZGYwICBtZXNhLTI2LjEuMi50YXIueHoKPiAtc2hhNTEyICAwOGU3YjYzNTdjMjdiZjZl
MTNmNTllNmZiMGY4NGI3M2VjMjVjMmQxYTAxY2QwOWZmY2MzNWFiMjYzZjI3OGYxMGYzYmQzNmZk
ZTQxOWY2MGU3OGU3ODFhYmNiMzE1YTQzMmQwZDVjZWIzYmFiMGJjYTI2YjhhMmEzOTc1OGUwMyAg
bWVzYS0yNi4xLjIudGFyLnh6Cj4gKyMgRnJvbSBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9hcmNoaXZlcy9tZXNhLWFubm91bmNlLzIwMjYtSnVuZS8wMDA4NTUuaHRtbAo+ICtzaGEyNTYg
IDc3MjUwMDRlNzI0YjM0YzZkNGZiYWY1YzQ4ZmM2YzYyMjNhYTlmMjc0MWQ2ZDc3ODJjNjk5YjA0
OTM1NmZjNDUgIG1lc2EtMjYuMS4zLnRhci54ego+ICtzaGE1MTIgIDZkZDQ1MmU4YzdmMmU3ZTlh
MjY3MzNmNTNkZDBkYWY0ZGY4MjRmODJkZTNkMzdjMTcxNTgxODU0ZGQ0MTlmNTE5ZTEwNDIxMmFh
Y2RmOGJkZjk0MDQyYTg0NWQ5YmE1YzQ1YTE2MDVkN2NiYTFkYzQ5MTU3MGE5ZTcyYTkxZjgzICBt
ZXNhLTI2LjEuMy50YXIueHoKPiAgIyBMaWNlbnNlCj4gIHNoYTI1NiAgMGQxYTA0NzJlY2M4MTgz
MGU3NWMyMGQ1OWIwZWEwMjg0MWUzZGIyMTI1NWUwZWJhZDk3YWI2ODJjNTRkNjYxNSAgZG9jcy9s
aWNlbnNlLnJzdAo+ICBzaGEyNTYgIDMyM2M1ODdkMGNjZjEwZTM3NmY4YmY5YTdmMzFmYjRjYTYw
NzgxMDUxOTRiNDJlMGIxZTBlZTJiYzliZGU3MWYgIGxpY2Vuc2VzL01JVAo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL21lc2EzZC9tZXNhM2QubWsgYi9wYWNrYWdlL21lc2EzZC9tZXNhM2QubWsKPiBp
bmRleCAyMzY0NGNkN2Y1Li40ZTdhNTI0MGM3IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbWVzYTNk
L21lc2EzZC5tawo+ICsrKyBiL3BhY2thZ2UvbWVzYTNkL21lc2EzZC5tawo+IEBAIC01LDcgKzUs
NyBAQAo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAKPiAgIyBXaGVuIHVwZGF0aW5nIHRo
ZSB2ZXJzaW9uLCBwbGVhc2UgYWxzbyB1cGRhdGUgbWVzYTNkLWhlYWRlcnMKPiAtTUVTQTNEX1ZF
UlNJT04gPSAyNi4xLjIKPiArTUVTQTNEX1ZFUlNJT04gPSAyNi4xLjMKPiAgTUVTQTNEX1NPVVJD
RSA9IG1lc2EtJChNRVNBM0RfVkVSU0lPTikudGFyLnh6Cj4gIE1FU0EzRF9TSVRFID0gaHR0cHM6
Ly9hcmNoaXZlLm1lc2EzZC5vcmcKPiAgTUVTQTNEX0xJQ0VOU0UgPSBNSVQsIFNHSSwgS2hyb25v
cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
