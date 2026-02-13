Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC134EF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:37:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDD44613EB;
	Fri, 13 Feb 2026 19:37:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W6HpwWf1ySzA; Fri, 13 Feb 2026 19:37:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A7A0615B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011431;
	bh=pxa361FG891vmk19p2/eAydboLdQTT7F/L08jXUQPKE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=T5yJY4W50+z9LvIVKN9mCw02MMO7+6MlaQkyV6idsaP4XLMR2TJYepNUg9T6Xa3Ea
	 uZLfyqsvfYQt+rqvti5GaLo2sUtCbJYCNqN6j51HQdyV8mcAYDf+V0xZQd21YoaHKM
	 9VrapUEME6s2np4uGUUm/XGOnfW6V3D/+HbPLO9/0cBgFll/Z46AYpbWAb+NO5NAZn
	 DawqlKab/rVKoUsi3XbqcLKiF7iQGWWC+ydCz701iGLXC9MSObVba/0Ed9ceZ/INUV
	 PxHJ4MHQwcw1fUfZkRdnI6LOe0L4x2A5YpB5dJV9m2+FRE8uXpBIyxt7n5Od2KVaUD
	 n0uCkJ5FCin+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A7A0615B0;
	Fri, 13 Feb 2026 19:37:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 76818EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F69041E1D
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rbM9WH7ygL1V for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:36:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::441; helo=mail-wr1-x441.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5C6A541F02
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C6A541F02
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5C6A541F02
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:42 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id
 ffacd0b85a97d-43767807cf3so903085f8f.1
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:36:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011400; x=1771616200;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1nBqMzZUJm3RY6B0eBMsJQb0wQ0QrNYvVJx2AJzKKeo=;
 b=qiQodJIpTbVjn1rGk+S8+YzZCScQBTtz+rxQIzjnaE77tx08/UXa2eMyZhMAesoP/l
 WFEvQsyQP2nj1hlQ5r8AuorXfWjPNhj4mFmcw+DIP+77C/d+PKJESDVz9xCAb+kHSNuS
 IBXgap50uDaxz0zNmHJv4i55bLLUTvw2pBqeyodXtADqXsF2BHOuL5lg6KoQhb7hfzjP
 7p2uoHfKMt8N3WDvJ/MNMfyyB81yF23awshf5Zn+h3tP1FFyBmZBtpfk/weFeJffUPot
 ZvDHGknAWJAdcf/wWhT5AwvScmyx+unviXHEtfnP3zJ2fJnMmd76Nqx+yqwfhiwWycJU
 2OLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDKyTqLS05fTJ8ALxOjxd6m1H3JtKbH6FHjEQ1/xeET45B9/UxxG/UnOZVE6RVU3Fo0DYaZpg+wz8=@buildroot.org
X-Gm-Message-State: AOJu0YyfSZ8mM8M8uCB8zTY5sp028W8SuHjcoOdMChjTyL8EBWB90jfX
 DQN3dsIVea0QjQD0va4uucpLSQcTDQhiUIjd8DHAeGCIs2MeFGeEfPKkKe3zwa5V61o=
X-Gm-Gg: AZuq6aIpV6E6dYmUmOydkMtG2MerqpZO1HdbJoY5yYdyYLWE5L2A9J6ZhW1q5GOLJOR
 wFv4q+Whh9SbxyyGIEqZrbVwFbRZ0Nsb6ck6exoUET3sc8Hxli31NEat8OJVUAJMI7XoGn8yg65
 w0TeSteh0oiT7UcpA9CfdbkDp3XzLuR2xTY6TCkXMRrH+1gWnPyJ3671/dd794zafl6PqjbXTCP
 m13JROnAYF9VQ+WZA/8hLFs6rGlSxkBIgjc9q6xZ74byEpO1FqzWIPEEb3u+11HBtTvAvsojsLT
 o+3yFJV8eOVEwi+L7d8qKPCzLfC2JNlOfEicLPRYjtZDm1ScCKmIu8u9YRtr6sD3IoS7jfpHAu7
 o2E4oNcdPnN0JV53WawjnvuobPXGaJ+CakCGpkUK0ZCKoBN+ZkX1ZF9+evcwZCnsqF5mxY8nJLC
 NX51tDcgl71IjhPWM=
X-Received: by 2002:a05:6000:4202:b0:435:e061:9e10 with SMTP id
 ffacd0b85a97d-4379db25e55mr1178377f8f.12.1771011399710; 
 Fri, 13 Feb 2026 11:36:39 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a5ac87sm8473165f8f.3.2026.02.13.11.36.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:36:39 -0800 (PST)
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:36:38 +0100
Message-ID: <20260213193638.37730-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20250911212752.266940-3-alex.bennee@linaro.org>
References: <20250911212752.266940-3-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011400; x=1771616200; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1nBqMzZUJm3RY6B0eBMsJQb0wQ0QrNYvVJx2AJzKKeo=;
 b=N3211Z/ZOpwWyyKVnPWY4j2o1qS+za9c8Z21mhgHs20SKDcply8G95E13eSTdvXJOa
 QPE/VUSrVu35VQP0wzu1PXGeJx9ez5nuyI4yr9B4rzL+OsE24u16xk3uStgZSJmhnA2l
 kGDuHfwJe8XB+c+8l8+lL8IDvg2noHio4+EVJpu2PUaIELT72m2yasx33if4HgXaI/b+
 Qeg5v5iLzFJaYdeuyKH4PfcVU1pl+Aw32KASsneWlhu5dCOleR3U8EidGaaQQN15r9lp
 r5B52bQK4crVDcER50JJqo8uy0nHsP06I/ubNOh0vfcJdGDxDYDnWJsO+KcGbU4y2PTI
 9lzQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=N3211Z/Z
Subject: Re: [Buildroot] [PATCH v5 2/9] package/kvm-unit-tests: assume
 AArch64 supports KVM
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

SW4gcmVwbHkgb2Y6Cj4gQWx0aG91Z2ggaXQgaXMgcG9zc2libGUgdG8gY29uZmlndXJlIGFuIEFB
cmNoNjQgQ1BVIHdpdGhvdXQgc3VwcG9ydAo+IGZvciBFTDIgaW4gcHJhY3RpY2UgYWxsIHRoZSBj
b21tb24gQUFyY2g2NCBoYXZlIHN1cHBvcnRlZAo+IHZpcnR1YWxpc2F0aW9uIGZyb20gdGhlIHN0
YXJ0Lgo+IAo+IElmIHdlIHJlYWxseSB3YW50ZWQgdG8gYmUgc3RyaWN0IHdlIGNvdWxkIGJsYWNr
bGlzdCBrbm93biBub24tRUwyIENQVXMKPiBidXQgQUZBSUNUIGFsbCB0aGUgY3VycmVudCBvbmVz
IGluIHRoZSBjb25maWcgaGF2ZSBFTDIuCj4gCj4gSSBzaG91bGQgYWxzbyBub3RlIEtWTSBvbiBB
cm0gaXMgZGVwcmVjYXRlZCBhbmQgd2FzIHJlbW92ZWQgZnJvbSB0aGUKPiBrZXJuZWwgaW4gdjYu
MTAuCj4gCj4gUmV2aWV3ZWQtYnk6IEplc3NlIFRhdWJlIDxqZXNzZUByaXZvc2luYy5jb20+Cj4g
UmV2aWV3ZWQtYnk6IFRob21hcyBIdXRoIDxodXRoQHR1eGZhbWlseS5vcmc+Cj4gU2lnbmVkLW9m
Zi1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgo+IAoKQXBwbGllZCB0
byAyMDI1LjExLnguIFRoYW5rcwoKPiAtLS0KPiB2Mgo+ICAgLSBsZWF2ZSBCUjJfY29ydGV4X2E3
NiBhbmQgQlIyX2NvcnRleF9hNzZfYTU1IGluIHBsYWNlIGFzIGNhbiBiZQo+ICAgdXNlZCB3aXRo
IGFybTMyCj4gdjMKPiAgIC0gci1iCj4gdjQKPiAgIC0gcmViYXNlIGZpeGVzCj4gLS0tCj4gIHBh
Y2thZ2Uva3ZtLXVuaXQtdGVzdHMvQ29uZmlnLmluIHwgOCArKysrLS0tLQo+ICAxIGZpbGUgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9w
YWNrYWdlL2t2bS11bml0LXRlc3RzL0NvbmZpZy5pbiBiL3BhY2thZ2Uva3ZtLXVuaXQtdGVzdHMv
Q29uZmlnLmluCj4gaW5kZXggMGQ2NmEwOGRkNy4uNzUzODM2MWRmNCAxMDA2NDQKPiAtLS0gYS9w
YWNrYWdlL2t2bS11bml0LXRlc3RzL0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2Uva3ZtLXVuaXQt
dGVzdHMvQ29uZmlnLmluCj4gQEAgLTEsMTMgKzEsMTMgQEAKPiAgY29uZmlnIEJSMl9QQUNLQUdF
X0tWTV9VTklUX1RFU1RTX0FSQ0hfU1VQUE9SVFMKPiAgCWJvb2wKPiAgCSMgT24gQVJNLCBpdCBu
ZWVkcyB2aXJ0dWFsaXphdGlvbiBleHRlbnNpb25zIGFuZCBsaXR0bGUgZW5kaWFuIENQVXMKPiAt
CWRlZmF1bHQgeSBpZiAoQlIyX2FybSB8fCBCUjJfYWFyY2g2NCkgJiYgXAo+ICsJZGVmYXVsdCB5
IGlmIEJSMl9hcm0gJiYgXAo+ICAJCShCUjJfY29ydGV4X2E3IHx8IEJSMl9jb3J0ZXhfYTEyIHx8
IFwKPiAgCQlCUjJfY29ydGV4X2ExNSB8fCBCUjJfY29ydGV4X2ExNV9hNyB8fCBcCj4gIAkJQlIy
X2NvcnRleF9hMTcgfHwgQlIyX2NvcnRleF9hMTdfYTcgfHwgXAo+IC0JCUJSMl9jb3J0ZXhfYTU1
IHx8IEJSMl9jb3J0ZXhfYTc1IHx8IFwKPiAtCQlCUjJfY29ydGV4X2E3NV9hNTUgfHwgQlIyX2Nv
cnRleF9hNzYgfHwgXAo+IC0JCUJSMl9jb3J0ZXhfYTc2X2E1NSkKPiArCQlCUjJfY29ydGV4X2E3
NiB8fCBCUjJfY29ydGV4X2E3Nl9hNTUgKQo+ICsJIyBGb3IgQUFyY2g2NCB3ZSBjYW4gYXNzdW1l
IGFsbCB2OC4wKyBzdXBwb3J0IHZpcnR1YWxpemF0aW9uCj4gKwlkZWZhdWx0IHkgaWYgQlIyX2Fh
cmNoNjQKPiAgCWRlZmF1bHQgeSBpZiBCUjJfcmlzY3YKPiAgCWRlZmF1bHQgeSBpZiBCUjJfaTM4
NiB8fCBCUjJfeDg2XzY0Cj4gIAlkZWZhdWx0IHkgaWYgQlIyX3Bvd2VycGM2NCB8fCBCUjJfcG93
ZXJwYzY0bGUKPiAtLSAKPiAyLjQ3LjMKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
