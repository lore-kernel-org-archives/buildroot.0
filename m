Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C1CE7DF13
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 17:27:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 851A18230A;
	Mon,  2 Feb 2026 17:27:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E-8zxFbOQ9pB; Mon,  2 Feb 2026 17:27:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A2888230D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770053257;
	bh=g7gAAavyhISTBCAAovIBJV0SYI4/pljH9Kt6PSLLWQo=;
	h=References:In-Reply-To:From:Date:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=X/OBMtkLiwOUWZbspEZ941F1bgrgZY2OlSnkTj43yVJCkd5LXCXmc/zVJbOsjkffw
	 ZuaAVbTvAUOEmAFfnR6r0tWmAZj8BVEj9vO2ppvOgYfYlWus5j2831/rvhYpXH90zD
	 vhGGgVbVGlmeTyi7aR7hGFKCQ+ieZMzRRVCHXhrXVXhHQxreoNScwXbIwwgJsGYbFX
	 lLMDpBgWH0xlDdSir9t1N9W15aIhjwxJ19Xk9Cn4zITOqBMsmX5wvywGEK6NVDSY7W
	 9nYqK6w8cFlKe4VojKzhBpJ/tXyMnINUiAgFrREsgLeE79ev94itrSsieuAADE/+Sq
	 IMObyip1BJlKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A2888230D;
	Mon,  2 Feb 2026 17:27:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8457223E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:27:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66EF4401D6
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:27:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G_74P9ZFs3yt for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 17:27:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e2f; helo=mail-vs1-xe2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1FB06400AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FB06400AD
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1FB06400AD
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:27:33 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id
 ada2fe7eead31-5f535ff78abso3240464137.1
 for <buildroot@buildroot.org>; Mon, 02 Feb 2026 09:27:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770053253; cv=none;
 d=google.com; s=arc-20240605;
 b=QwbBYrOPVoGmX4kOBgUtKiILJwnbDaNO5b1BM7RCCbA+zFhLLDyvpyH22w0lWljRLm
 uQNwKM/9IlxcVTylMnCWqZvW38Ns3PrYXzMaS9ejO9CFMEqSAJVRXCbI0TC78qNv0iFb
 eTshhPQgbSGz1fwTmc0Ve1rqwMUnkk6C30HMUxSJMQ/KuI4g5jvfSXnabSncNUO+4Rl3
 zIby82Ade23zFyOli53ngTJOwT+4UE7uxm5A/UDz7AKUzw2dICCSg2bdkV9iJZoD3lqI
 U/hueWyD+sciaA6K+T9/vXdUY9AS7NsczqLkfPx+qXr/pydQtWIG7u2fG5Wpc7lwA0sU
 MzKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=R8OnJh5DomRyhrTS5sOSRfhfbYMZXz9jncvEilyVG8A=;
 fh=KfJnGK9aR8kflvHd21db/Dyn6t3MT6PppPKLC+zVV+Q=;
 b=YXp/xmKLyP3AXW1x0MSnz85zUV+pVJVCl0A7WM2E4lY8JDNCi5fmtHnxPV7D8INZSe
 Yr096DNDITYIq2n3UqNpgN9hsAcOyC95WiT/SKtlaQSLllrPHve2eWzC2GgXeUV5ckCv
 qO/jqujMxsRknoTKYx1DbpzHXaaOaLLasq92tis6sFzDoDXtSsWsTZ3XFW7jBjBWGMII
 BnZVawysj2jk9h/5VbT1NQcxt3UHJ0W7d33GcN3J+t17HqZRO9/4Jx0vfR5MTcm96m36
 FOVPMPYvBUskfCcZlMx4amHPca6y9XjSBtlK/yQxvd4cqofbepXU0jWoH3SN/+CpXbWz
 sH/g==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770053253; x=1770658053;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=R8OnJh5DomRyhrTS5sOSRfhfbYMZXz9jncvEilyVG8A=;
 b=ivyjgV4ALAsTbq0UpoXbC2yhmwPih4tSWO74NupldtjG17m870orILrGXRDBqg2vHK
 49pDb8QAjM6gHiAefnDcsc+6a2de9wOH45oI4hB9+dzWOHoBCp57Nehj0LHBrSTmk5gg
 z5t2fizToX0u2H9NyoZMZa81x+gl9m6YfFQuIOL2LGRP9pDuuV42cXluljprmVwxXykw
 mi01OccM07mW4QRU6q8wda3tp83aocru0aLOAs+F4iLAFZhKiamxl/351VO/xZGNsyaM
 JtCz5dh2eLbo2fI8rIJBhrOCpo9KVVflzglpkKh5SHKVVLGAxe46fWoBjdAdokC0W9TZ
 xYhQ==
X-Gm-Message-State: AOJu0YzJydSoRSmkXytpn2b+7ubaS9Qks+zG0RQ20oAGme5gG3W6E8cH
 SzbV4zVbMwECw7mcPIfZkR9CpUPpS9wEZQfoatU/dvvcsqt16sWXSBbNX4g91NIvtPYcVmTCEY7
 sWy5xhYArhZm8zd0zxG/vD9trbHO4+fM=
X-Gm-Gg: AZuq6aKMH3BXDGUVqxrtmlm1EmL37zjlON69J2W6CBduIAuhPDnxZSEs1RZsShxJ10q
 QFPmjJ9/vY9SvPsAKA3ovz0dB+PaLvy4j7+yELPzcBismqTTiAl1Ol+SWFwFJr43YqSbRXC5gZH
 eqabGrHsvzK5lig7Md2xr44T7CrRpaFN33dZF9mO/RvfQawUKF6BJqR2mz3Xz+Xi/+zZTWo/QSJ
 x9UvD75jQ+/0UiRX8EgKPedndcPArK3kQuSFUzWBCzbf5i25sbVjF8B3+Apmw5lN0WC9Ic8AV4y
 45gQH0X4F/xLYujFDShRTcrJ3gtI5Ze5zrAAFJznYTsZgriIUEo2DIElgw==
X-Received: by 2002:a05:6102:418d:b0:5f1:b865:aaa4 with SMTP id
 ada2fe7eead31-5f8e25b2372mr4585999137.21.1770053252591; Mon, 02 Feb 2026
 09:27:32 -0800 (PST)
MIME-Version: 1.0
References: <20260202150143.3996204-1-buildroot@bubu1.eu>
 <20260202150143.3996204-2-buildroot@bubu1.eu>
In-Reply-To: <20260202150143.3996204-2-buildroot@bubu1.eu>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 2 Feb 2026 10:27:19 -0700
X-Gm-Features: AZwV_Qi2fUWQ6FIKBEufU_7_9Mmpi5xRPTE9Ur0AonUM-33kv-CdFSHgXia6P4k
Message-ID: <CADvTj4qKJ05RgzwhQ=Ado-e=q8mb02wrXsUu43scugyE+OcEQg@mail.gmail.com>
To: Marcus Hoffmann <buildroot@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770053253; x=1770658053; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R8OnJh5DomRyhrTS5sOSRfhfbYMZXz9jncvEilyVG8A=;
 b=nPrQpcIUYCc3w2qAWOmW/oBOYo8fby37Ak/hOb7lAAB4MkUBzz+M8wauT7ijiGd+1m
 +gdD+s4X24MdKXd5I12z/XP+TYqXjsgjezYDJqVk5+uqPAI4lyWnCfEkzn53vKLN8ucN
 iEqTWFMNEje2AaIWsPtm1mI3IoOW8+WNi+2fx3GKkpuPCKdxVRUHHGQaxcqCpMymq3nS
 kIM0j7BwIj0RYz2I9CPQNWyxKW/BfM1rQ2Gz+onerJS+hvGvOuNEHaqdBFHPfktg9Cgs
 w5iQx8Awkon9TeM8jgsTqInNoEY6gqLWNxk5BYqW9VUBLUQL3Gee9Usu+jU4tki0QXTh
 ATDQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=nPrQpcIU
Subject: Re: [Buildroot] [PATCH 2/2] package/python-requests: depend on
 system certificates instead of python-certifi
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
Cc: Marcus Hoffmann <bubu@bubu1.eu>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBGZWIgMiwgMjAyNiBhdCA4OjAx4oCvQU0gTWFyY3VzIEhvZmZtYW5uIDxidWlsZHJv
b3RAYnVidTEuZXU+IHdyb3RlOgo+Cj4gQWRkIHBhdGNoIGZyb20gYXJjaGxpbnV4IGRpc3RyaWJ1
dGlvblsxXSB0aGF0IHJlZmVyZW5jZXMgc3lzdGVtCj4gY2VydGlmaWNhdGUgc3RvcmUgaW5zdGVh
ZCBvZiB1c2luZyB0aGUgcHl0aG9uIGNlcnRpZmkgcGFja2FnZS4KPgo+IEFzIGEgdXNlciBvZiB0
aGUgcmVxdWVzdHMgcGFja2FnZSwgSSdkIGV4cGVjdCB0aGlzIHRvIHVzZSB0aGUgc3lzdGVtCj4g
Y2VydGlmaWNhdGUgc3RvcmUgYW5kIG5vdCBwdWxsIGluIGFub3RoZXIgY2VydGlmaWNhdGUgc3Rv
cmUgdGhhdCBtdXN0IGJlCj4ga2VwdCB1cC10by1kYXRlIHNlcGFyYXRlbHkgKGFuZCBpcyBjdXJy
ZW50bHkgb3V0ZGF0ZWQgaW4gYnVpbGRyb290KS4KCkkgZ2VuZXJhbGx5IGRvIHRyeSB0byBrZWVw
IHRoZSBweXRob24gY2VydGlmaSBwYWNrYWdlIHVwIHRvIGRhdGUgYXMKSSB0aGluayBxdWl0ZSBh
IGZldyBkaWZmZXJlbnQgcHl0aG9uIHBhY2thZ2VzIHVzZSBpdCBmb3IgY2VydGlmaWNhdGVzLgoK
Pgo+IFRoZSBmaWxlIHRoYXQgaXMgcGF0Y2hlZCBleHBsaWNpdGx5IG1lbnRpb25zIHRoYXQgYXMg
YW4gb3B0aW9uIGZvcgo+IGRpc3RyaWJ1dGlvbnMuIFRoaXMgYXBwcm9hY2ggaXMgdGFrZW4gYnkg
RmVkb3JhWzJdIGFuZCBBcmNobGludXggYnV0IG5vdAo+IGJ5IG90aGVyIGRpc3RyaWJ1dGlvbnMg
KGFscGluZSwgb3BlbmVtYmVkZGVkLCBkZWJpYW4sIG5peCwgZ3VpeCkuCgpJJ20gYSBiaXQgc2tl
cHRpY2FsIHRoaXMgaXMgYSBnb29kIGlkZWEsIG1vc3RseSBiZWNhdXNlIG90aGVyIHB5dGhvbgpw
YWNrYWdlcyB1c2luZyBjZXJ0aWZpIHdvdWxkIHRoZW4gYmVoYXZlIGRpZmZlcmVudGx5IGZyb20g
cmVxdWVzdHMuCgpJdCdzIGtpbmQgb2Ygc3ViamVjdGl2ZSBob3dldmVyIHNvIEknbSBub3Qgc3Vy
ZSB3aGF0J3MgYWN0dWFsbHkgYmVzdC4KCj4KPiBbMV0gaHR0cHM6Ly9naXRsYWIuYXJjaGxpbnV4
Lm9yZy9hcmNobGludXgvcGFja2FnaW5nL3BhY2thZ2VzL3B5dGhvbi1yZXF1ZXN0cy8tL2Jsb2Iv
bWFpbi9jZXJ0cy5wYXRjaD9yZWZfdHlwZT1oZWFkcwo+IFsyXSBodHRwczovL2tvamkuZmVkb3Jh
cHJvamVjdC5vcmcva29qaS9maWxlaW5mbz9ycG1JRD00MzMwMjc0NSZmaWxlbmFtZT1zeXN0ZW0t
Y2VydHMucGF0Y2gKPgo+IFNpZ25lZC1vZmYtYnk6IE1hcmN1cyBIb2ZmbWFubiA8YnVpbGRyb290
QGJ1YnUxLmV1Pgo+IC0tLQo+ICAuLi4vMDAwMS11c2Utc3lzdGVtZC1jZXJ0LWJ1bmRsZS5wYXRj
aCAgICAgICAgICB8IDE3ICsrKysrKysrKysrKysrKysrCj4gIHBhY2thZ2UvcHl0aG9uLXJlcXVl
c3RzL0NvbmZpZy5pbiAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgLi4uL3Rlc3RzL3BhY2thZ2Uv
dGVzdF9weXRob25fcmVxdWVzdHMucHkgICAgICAgfCAxNCArKysrKysrKy0tLS0tLQo+ICAzIGZp
bGVzIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBwYWNrYWdlL3B5dGhvbi1yZXF1ZXN0cy8wMDAxLXVzZS1zeXN0ZW1kLWNlcnQt
YnVuZGxlLnBhdGNoCj4KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tcmVxdWVzdHMvMDAw
MS11c2Utc3lzdGVtZC1jZXJ0LWJ1bmRsZS5wYXRjaCBiL3BhY2thZ2UvcHl0aG9uLXJlcXVlc3Rz
LzAwMDEtdXNlLXN5c3RlbWQtY2VydC1idW5kbGUucGF0Y2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0
NAo+IGluZGV4IDAwMDAwMDAwMDAuLjNjMTIzZTUyYjEKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIv
cGFja2FnZS9weXRob24tcmVxdWVzdHMvMDAwMS11c2Utc3lzdGVtZC1jZXJ0LWJ1bmRsZS5wYXRj
aAo+IEBAIC0wLDAgKzEsMTcgQEAKPiArLS0tCj4gK1NpZ25lZC1vZmYtYnk6IE1hcmN1cyBIb2Zm
bWFubiA8YnVpbGRyb290QGJ1YnUxLmV1Pgo+ICtVcHN0cmVhbTogTi9BLCBzdXBwb3NlZCB0byBi
ZSBwYXRjaGVkIGRvd25zdHJlYW0KPiArZGlmZiAtLWdpdCBhL3NyYy9yZXF1ZXN0cy9jZXJ0cy5w
eSBiL3NyYy9yZXF1ZXN0cy9jZXJ0cy5weQo+ICtpbmRleCBiZTQyMmMzZS4uOWJmZTFjODAgMTAw
NjQ0Cj4gKy0tLSBhL3NyYy9yZXF1ZXN0cy9jZXJ0cy5weQo+ICsrKysgYi9zcmMvcmVxdWVzdHMv
Y2VydHMucHkKPiArQEAgLTExLDcgKzExLDggQEAgSWYgeW91IGFyZSBwYWNrYWdpbmcgUmVxdWVz
dHMsIGUuZy4sIGZvciBhIExpbnV4IGRpc3RyaWJ1dGlvbiBvciBhIG1hbmFnZWQKPiArIGVudmly
b25tZW50LCB5b3UgY2FuIGNoYW5nZSB0aGUgZGVmaW5pdGlvbiBvZiB3aGVyZSgpIHRvIHJldHVy
biBhIHNlcGFyYXRlbHkKPiArIHBhY2thZ2VkIENBIGJ1bmRsZS4KPiArICIiIgo+ICstZnJvbSBj
ZXJ0aWZpIGltcG9ydCB3aGVyZQo+ICsrZGVmIHdoZXJlKCk6Cj4gKysgICAgcmV0dXJuICIvZXRj
L3NzbC9jZXJ0cy9jYS1jZXJ0aWZpY2F0ZXMuY3J0Igo+ICsKPiArIGlmIF9fbmFtZV9fID09ICJf
X21haW5fXyI6Cj4gKyAgICAgcHJpbnQod2hlcmUoKSkKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9w
eXRob24tcmVxdWVzdHMvQ29uZmlnLmluIGIvcGFja2FnZS9weXRob24tcmVxdWVzdHMvQ29uZmln
LmluCj4gaW5kZXggOTI5Yjk5NjU3Yy4uZTJlMzI5NzQ5ZSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdl
L3B5dGhvbi1yZXF1ZXN0cy9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL3B5dGhvbi1yZXF1ZXN0
cy9Db25maWcuaW4KPiBAQCAtMSw2ICsxLDYgQEAKPiAgY29uZmlnIEJSMl9QQUNLQUdFX1BZVEhP
Tl9SRVFVRVNUUwo+ICAgICAgICAgYm9vbCAicHl0aG9uLXJlcXVlc3RzIgo+IC0gICAgICAgc2Vs
ZWN0IEJSMl9QQUNLQUdFX1BZVEhPTl9DRVJUSUZJICMgcnVudGltZQo+ICsgICAgICAgc2VsZWN0
IEJSMl9QQUNLQUdFX0NBX0NFUlRJRklDQVRFUyAjIHJ1bnRpbWUKPiAgICAgICAgIHNlbGVjdCBC
UjJfUEFDS0FHRV9QWVRIT05fQ0hBUlNFVF9OT1JNQUxJWkVSICMgcnVudGltZQo+ICAgICAgICAg
c2VsZWN0IEJSMl9QQUNLQUdFX1BZVEhPTl9JRE5BICMgcnVudGltZQo+ICAgICAgICAgc2VsZWN0
IEJSMl9QQUNLQUdFX1BZVEhPTl9VUkxMSUIzICMgcnVudGltZQo+IGRpZmYgLS1naXQgYS9zdXBw
b3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5dGhvbl9yZXF1ZXN0cy5weSBiL3N1cHBv
cnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX3JlcXVlc3RzLnB5Cj4gaW5kZXgg
NDhmOTEwMTM5Yi4uMzMzOTI4MzliMCAxMDA2NDQKPiAtLS0gYS9zdXBwb3J0L3Rlc3RpbmcvdGVz
dHMvcGFja2FnZS90ZXN0X3B5dGhvbl9yZXF1ZXN0cy5weQo+ICsrKyBiL3N1cHBvcnQvdGVzdGlu
Zy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX3JlcXVlc3RzLnB5Cj4gQEAgLTQsMTggKzQsMjAg
QEAgZnJvbSB0ZXN0cy5wYWNrYWdlLnRlc3RfcHl0aG9uIGltcG9ydCBUZXN0UHl0aG9uUGFja2Fn
ZUJhc2UKPgo+ICBjbGFzcyBUZXN0UHl0aG9uUHkzUmVxdWVzdHMoVGVzdFB5dGhvblBhY2thZ2VC
YXNlKToKPiAgICAgIF9fdGVzdF9fID0gVHJ1ZQo+IC0gICAgY29uZmlnID0gVGVzdFB5dGhvblBh
Y2thZ2VCYXNlLmNvbmZpZyArIFwKPiAtICAgICAgICAiIiIKPiArICAgIGNvbmZpZyA9ICgKPiAr
ICAgICAgICBUZXN0UHl0aG9uUGFja2FnZUJhc2UuY29uZmlnCj4gKyAgICAgICAgKyAiIiIKPiAg
ICAgICAgICBCUjJfU1lTVEVNX0RIQ1A9ImV0aDAiCj4gICAgICAgICAgQlIyX1BBQ0tBR0VfUFlU
SE9OMz15Cj4gICAgICAgICAgQlIyX1BBQ0tBR0VfUFlUSE9OX1JFUVVFU1RTPXkKPiAgICAgICAg
ICAiIiIKPiArICAgICkKPiAgICAgIHNhbXBsZV9zY3JpcHRzID0gWyJ0ZXN0cy9wYWNrYWdlL3Nh
bXBsZV9weXRob25fcmVxdWVzdHMucHkiXQo+IC0gICAgdGltZW91dD0xNQo+ICsgICAgdGltZW91
dCA9IDE1Cj4KPiAgICAgIGRlZiBsb2dpbihzZWxmKToKPiAgICAgICAgICBjcGlvX2ZpbGUgPSBv
cy5wYXRoLmpvaW4oc2VsZi5idWlsZGRpciwgImltYWdlcyIsICJyb290ZnMuY3BpbyIpCj4gLSAg
ICAgICAgc2VsZi5lbXVsYXRvci5ib290KGFyY2g9ImFybXY3IiwKPiAtICAgICAgICAgICAgICAg
ICAgICAgICAgICAga2VybmVsPSJidWlsdGluIiwKPiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgb3B0aW9ucz1bIi1pbml0cmQiLCBjcGlvX2ZpbGVdKQo+ICsgICAgICAgIHNlbGYuZW11bGF0
b3IuYm9vdCgKPiArICAgICAgICAgICAgYXJjaD0iYXJtdjciLCBrZXJuZWw9ImJ1aWx0aW4iLCBv
cHRpb25zPVsiLWluaXRyZCIsIGNwaW9fZmlsZV0KPiArICAgICAgICApCj4gICAgICAgICAgc2Vs
Zi5lbXVsYXRvci5sb2dpbigpCj4gLS0KPiAyLjUyLjAKPgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
