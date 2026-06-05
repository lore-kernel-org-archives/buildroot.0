Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E60CD6E7C
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 18:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A203606C5;
	Fri,  5 Jun 2026 18:21:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7cj5bBIu1sDX; Fri,  5 Jun 2026 18:21:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52C3460A6C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780683667;
	bh=hmlHXTOQ4SGZuvodZotGCZ59Sa5YGQqA2Mx82U8YQ7A=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=tFK5Pe/VlyqfgIQcJq30F0vazDFv08JvcL5zRnll7Y92HJEbpW3w4GvH4RL33ZLow
	 YZTbMMufXcoEit2oZO5YtdI//FThh0xqC4YqqyQhBiurM3apMJ5DsjYEi5C0ChGmdU
	 0ZZBE30d4m7L4SGPNS24FCd2QZy7AJb+b+md5eRnPCPu9zBgEepWLXisKqvdDr/4Mp
	 dVApnsUgzjRFr4b5lp+csam12i6mxaVSeQ41O8iShiQDPOhbznlyRcGTIsJIIgs/zs
	 4ikyeXI959gfSZ27LOq+Tji/0IgzAXwbneF481XCvo+6w33iPEF3W+lvRVPT01nuuw
	 W3/6TjgL7apug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52C3460A6C;
	Fri,  5 Jun 2026 18:21:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DC0D4388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 18:21:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CDB8A80B53
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 18:21:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jX4J5LzYJ6iA for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 18:21:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BA89980B95
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA89980B95
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BA89980B95
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 18:21:04 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-490b2b037d2so19880275e9.3
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 11:21:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780683662; x=1781288462;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=381TSWp1iJ8IadpdKGbjWJsGab/vmgAL/yFDdTmqT0A=;
 b=BoM0bYMugDP0/BYfeDpr3Ynf+wZc2NZI1PwAhrEJi91xCDQDyftMYcpO7S0v9KcXXx
 8ZGyX+b4srz0uyThXNu50PaFI9/V28TCjh6t7S05DjFMiIlHil5JfQKW48jlca5ORDPO
 Ay96WVAdm2xxFiIyz0X0pQDrgLPi3voEEbcv5vyviuyDQcqjcpYUExzhFsbDWFkRXk1N
 Q/5HkBf7xynj/BA+/8Url2/AuYxGjGTZVCKtdnMMDBjmf/agZDxSd/HnH3r6J+dDojLE
 qULUB0qfsUkcivp+C/AXDKeK8cDpqPj997SYsrcQeYEPCDgpSzCxSV31pMfqxvA2qd9O
 NNKg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+lhWOw17rN2bwC0TuXQs83sXob7f153LWUt8z5C/NCMBaSwMQHr0uXzqqdTnk8an45r9d2rEcFMpU=@buildroot.org
X-Gm-Message-State: AOJu0YxxBrRKnhGBVe5Ed/LjKdUEajQPzrUaZK9N3kHOmcc9CSu4NH1W
 O+UzvDAghQXb0z+FKpaw/FonAd/+MvKk05H5hN4vqyB+rCrryiRx+EZ+AyHicwcqUZw=
X-Gm-Gg: Acq92OGxmM+bz5+KRploHGCJJNgY4K+Q4cmG40qWQ6e+ZJoz1XK5GtHVs/Do1VsNgzG
 o+2Z1ulGlwpuKP466K3hMkbQLEecu76d/Ts9wqENKhoPn+Ss/6D2BFV2MyoEtSKEpXhnvywc9Bm
 ksZYQgHODolRhO4ptIsOHuDc1i6GprZG/lfUHU+RrCNY9UPX+a140NwydOvjWSQ0R7pg1kj46Ej
 Od2fCScCVpK6T96vcc1lDmXH4/DVJMlRjjmqV6jbTdIxuslv6NcqLVvQFe7cL0YRvivH+Fa3B48
 0EeH/Uz5gsJgTfPZLEyu56wOlHqzUy75dsrUygyHZB6NNH5xqXoI4fT4oAbiSkCOHXQ7J3LDF57
 tMqMlMXtNUk70pTqd5IK+b+9rJgqFHG9EwtB32Erj16AmOECWbSutQu8iBJ993L+DT/NFTnk0zL
 FfQvzpdFxh4Zy4dto5ZlMNBTFc2ZIwT0a+Or0NqSRbArpmyOBDC/1KyuvapOIudM//3QskSVKL3
 P4V5+SUcvVwCxAYy74wVspA9gq9IcivzG1zikEbxQ5VNll4mpGsuNCECOPwNziUmizJbkV7JCSD
X-Received: by 2002:a05:600c:608e:b0:490:b202:4772 with SMTP id
 5b1f17b1804b1-490c25af61dmr78530815e9.2.1780683662239; 
 Fri, 05 Jun 2026 11:21:02 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc3c15cesm181981755e9.5.2026.06.05.11.21.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jun 2026 11:21:01 -0700 (PDT)
Message-ID: <b654c273-bed8-4ba2-961a-1d25a00b39f1@smile.fr>
Date: Fri, 5 Jun 2026 20:21:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>,
 Romain Naour via buildroot <buildroot@buildroot.org>
References: <20260603210920.3450528-1-romain.naour@smile.fr>
 <878q8uk9qf.fsf@dell.be.48ers.dk>
Content-Language: fr
In-Reply-To: <878q8uk9qf.fsf@dell.be.48ers.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1780683662; x=1781288462; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=381TSWp1iJ8IadpdKGbjWJsGab/vmgAL/yFDdTmqT0A=;
 b=njMOvaS6JC4xB3KpMJNEwa5D3DCqOdtx7AkbxxUAuJ5QFJ6n0g3jA2U/h7su+esu/J
 mC9Cy/6WCV4RSljbKG3buqTFrr+qjCZ4H9rtAFWTyQZteGaVIwowglENV+avcovrgW99
 x7qJx/0ySkKqFfS+VB/iRGYcRO2N+FW62Vpi0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=njMOvaS6
Subject: Re: [Buildroot] [PATCH] support/testing: TestJailhouse: revert to
 gcc 14 based toolchain
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

SGVsbG8gUGV0ZXIsIEFsbCwKCkxlIDA0LzA2LzIwMjYgw6AgMTA6MDksIFBldGVyIEtvcnNnYWFy
ZCBhIMOpY3JpdMKgOgo+Pj4+Pj4gIlJvbWFpbiIgPT0gUm9tYWluIE5hb3VyIHZpYSBidWlsZHJv
b3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cml0ZXM6Cj4gCj4gID4gVGhlIGphaWxob3Vz
ZSBydW50aW1lIHRlc3QgZG9lc24ndCBidWlsZCBzaW5jZSB0aGUgbGFzdCBBUk0gYWFyY2g2NAo+
ICA+IHRvb2xjaGFpbiB2ZXJzaW9uIGJ1bXAgWzFdLiBUaGlzIG5ldyBnY2MgMTUgY29tcGlsZXIg
dXNlIGEgbmV3IEMKPiAgPiBzdGFuZGFyZCBieSBkZWZhdWx0IChjMjMpIGJ1dCBzaW5jZSB0aGUg
amFpbGhvdXNlIGJ1aWxkIHN5c3RlbQo+ICA+IGRvZXNuJ3Qgc3BlY2lmeSBhbnkgdmVyc2lvbnMg
b2YgdGhlIEMgc3RhbmRhcmQsIHNvIGl0IGRvZXNuJ3QgYnVpbGQKPiAgPiB3aXRoIGdjYyAxNS4K
PiAKPiAgPiBBcyByZXBvcnRlZCBieSBKb2huIEVybmJlcmcgb24gdGhlIG1haWxpbmcgbGlzdCBb
Ml0sIGphaWxob3VzZSBnaXQKPiAgPiByZXBvc2l0b3J5IGhhcyBub3Qgc2VlbiBhbnkgYWN0aXZp
dHkgc2luY2UgMjAyMy4KPiAKPiAgPiBBcyBhIHNob3J0IHRlcm0gc29sdXRpb24gKGFuZCBldmVu
dHVhbHkgcmVtb3ZlIHRoZSBwYWNrYWdlKSwgcmV2ZXJ0Cj4gID4gdG8gdGhlIHByZXZpb3VzIEFS
TSBhYXJjaDY0IHRvb2xjaGFpbiB1c2VkIGJ5IHRoaXMgdGVzdC4KPiAKPiAgPiBXaGlsZSBhdCBp
dCBkaXNhYmxlIGphaWxob3VzZSBwYWNrYWdlIGZvciBnY2MgMTUgYW5kIG5ld2VyLgo+IAo+ICA+
IEZpeGVzOgo+ICA+IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8t
L2pvYnMvMTQ2MjI4NDM0NjMKPiAKPiAgPiBbMV0gOGQ0MTNkNjE3OTI3MjQ4NzdiZmQ4ODZmZTNi
YTUxOWZiNTI1OTU2Ngo+ICA+IFsyXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9idWlsZHJvb3Qv
MjAyNjA2MDEyMDQ3MzUuODg4OTY3LTgtakBqLWVybmJlcmcuc2UvCj4gCj4gID4gU2lnbmVkLW9m
Zi1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+Cj4gCj4gQWx0ZXJuYXRp
dmVseSB3ZSBjb3VsZCBncmFiIHRoZSBHQ0MtMTUgcGF0Y2ggZnJvbSB0aGUgTlhQIGZvcms6Cj4g
Cj4gaHR0cHM6Ly9naXRodWIuY29tL254cC1pbXgvaW14LWphaWxob3VzZS9jb21taXQvMmJlNzc5
M2NhNjU4MDE1NDcwZmUwZDYwYzBjOTczZTEyY2U2OGQ3MyNkaWZmLTEyMDRlZDNjOTVkNzFlZTZh
OTUwZjVkMjc3ZGI4N2ZiM2NmOTIwOWQ1NmQ2MGZmNGIxZGY5ZjI5OTRiYWQyOTYKPiAKPiBUaGUg
cGF0Y2ggbG9va3Mgc2Vuc2libGUgdG8gbWUsIGV4Y2VwdCB0aGF0IHRoZSBjaGVjayBmb3IgQzIz
IHN1cHBvcnQKPiBzaG91bGQgcHJvYmFibHkgYmU6Cj4gCj4gI2lmIF9fU1REQ19WRVJTSU9OX18g
PCAyMDIzMTFMCj4gCj4gaW5zdGVhZCBvZjoKPiAKPiAjaWYgX19HTlVDX18gPCAxNQo+IAo+IAo+
IEJ1dCBsb25nZXIgdGVybSB3ZSBzaG91bGQgaW5kZWVkIGdldCByaWQgb2YgamFpbGhvdXNlIGlm
IGl0IGlzIG5vIGxvbmdlcgo+IG1haW50YWluZWQuCgpPay4gVGhlIGZpeCBmb3IgZ2NjLTE1IHNl
ZW1zIHBhcnQgb2YgYSB0d28gcGF0Y2hlcyBzZXJpZXMuIEkgYmFja3BvcnRlZCBib3RoLgoKQmVz
dCByZWdhcmRzLApSb21haW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
