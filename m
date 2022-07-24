Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C4B2C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 08:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F4024168B;
	Sun, 24 Jul 2022 08:08:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F4024168B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EKfNE2yi_h9d; Sun, 24 Jul 2022 08:08:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9102A41675;
	Sun, 24 Jul 2022 08:08:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9102A41675
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 49EB41BF2E4
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 08:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2331760D50
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 08:08:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2331760D50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PulO5sBYokLm for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 08:08:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5FCF60BC0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A5FCF60BC0
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 08:08:19 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 j29-20020a05600c1c1d00b003a2fdafdefbso4656615wms.2
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 01:08:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tq8PKWXdn704l17IfUxOlWL7Yhy+UcCpMtNXM0bGXlE=;
 b=DiiFLvyUEMqbKkoTRhuJvBqIscTVm//yq1/5sawv69jJGk6X80Y50ndGgQ/WDBSfSd
 EbrupWOlNDj1ocZmZs+hy9pTMyBnEZh2lg5JTFn7aurcdZ1I49fXdQJGxlMiIdjNTJ/J
 6yz/o0Yi2jT0Fyv5/nPoubqY+8SbQlrcZ6HSGjQiZCspSTHDedNnuzJozOci5FTAVis7
 LZ0pcYqkz9kyIGvdRdf0uRHutVoyM5MHAvjcH5c0zE2vQGEbC+jfC0iaHmkji4pH46ap
 udCbJbdkl3zMhBPcExUIbY3Yp9pgVap/U7dbFOwAasT9jKG8s/LNIJyvw8wC7ONcaYT8
 X4kA==
X-Gm-Message-State: AJIora/hQ5cutrI08IAFPWfyWlqeBO/fZT9lC9vYR+iRA6fBe5tNg5EM
 ir85JpZQ4fgu43hBPeOQE+b61Q==
X-Google-Smtp-Source: AGRyM1siJZU8bHYgJmmSlY52CaRdf0B9+KpokGVXxn1k8h4Pci2XctPIrM/w3+jHz1Z4r0hTieG+fg==
X-Received: by 2002:a1c:ed04:0:b0:3a2:b7d7:2843 with SMTP id
 l4-20020a1ced04000000b003a2b7d72843mr4960657wmh.43.1658650097631; 
 Sun, 24 Jul 2022 01:08:17 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id
 i24-20020a1c5418000000b003a3187a2d4csm14082649wmb.22.2022.07.24.01.08.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 01:08:17 -0700 (PDT)
Message-ID: <815628b4-9584-cc91-1b5a-edc1e2a01c57@smile.fr>
Date: Sun, 24 Jul 2022 10:08:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Abel Bernabeu <abel@x-silicon.com>, buildroot@buildroot.org
References: <20220723215448.2532160-1-abel@x-silicon.com>
 <20220723215448.2532160-2-abel@x-silicon.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20220723215448.2532160-2-abel@x-silicon.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=tq8PKWXdn704l17IfUxOlWL7Yhy+UcCpMtNXM0bGXlE=;
 b=jkGwqKC3jUkBEChtSkcGL54A0p0NQqThaU/E7Iz1j9siLpviph1arfLHPSkMTKQ8rh
 HBKPQffgrij8JxULtZ5WIyfRWKNv1ru4XjyCdBUHaCOHFqJGyejOmLaqk6vxrbSVCxey
 73YdBRfmGzg+JRgTqT6RoPV1Bhiq9aNVULDnSNtMnjXeW+hUdu5nrPs+cgrNFjcCnhEI
 bv1QpMeK0dgb2o8eR9w4VUYLhGS6C+ljgC7xlsccS7XOyNJGnte3iAJ+cg7ZSaEkc5Kf
 mKQNTaa3gDeq9g0UpgP8zvZJEDZT1q8QZuXRu4W9rzKohmvnInSEjPegBOp22qOCrZuc
 G8FA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=jkGwqKC3
Subject: Re: [Buildroot] [PATCH 2/2] arch/riscv: Added support for RISC-V
 vector extension on the architecture menu.
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Mark Corbin <mark@dibsco.co.uk>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQWJlbCwKCkxlIDIzLzA3LzIwMjIgw6AgMjM6NTQsIEFiZWwgQmVybmFiZXUgYSDDqWNy
aXTCoDoKPiBUaGlzIG5ldyBzZXR0aW5nIHdpbGwgYWxsb3cgdG8gdGVzdCBuZXcgdG9vbGNoYWlu
cyBhbHJlYWR5IGF2YWlsYWJsZQo+IHRoYXQgc3VwcG9ydCB0aGUgdmVjdG9yIGV4dGVuc2lvbiAo
bW9yZSBwYXRjaGVzIGNvbWluZyBzb29uKS4KCkl0IHNlZW1zIHRoYXQgaXMgdGhlIHNhbWUgc2Vy
aWVzIGFzIHYxOgoKaHR0cDovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290
L2xpc3QvP3Nlcmllcz0zMDc4NDgmc3RhdGU9KgoKU2VlIDIyLjUuNS4gIlBhdGNoIHJldmlzaW9u
IGNoYW5nZWxvZyIgc2VjdGlvbiBmb3IgaGVscC4KCmh0dHBzOi8vbmlnaHRseS5idWlsZHJvb3Qu
b3JnL21hbnVhbC5odG1sI3N1Ym1pdHRpbmctcGF0Y2hlcwoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBB
YmVsIEJlcm5hYmV1IDxhYmVsQHgtc2lsaWNvbi5jb20+Cj4gLS0tCj4gIGFyY2gvQ29uZmlnLmlu
LnJpc2N2IHwgNyArKysrKysrCj4gIGFyY2gvYXJjaC5tay5yaXNjdiAgIHwgNCArKysrCj4gIDIg
ZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL0Nv
bmZpZy5pbi5yaXNjdiBiL2FyY2gvQ29uZmlnLmluLnJpc2N2Cj4gaW5kZXggMjg4ZWQ4MzNlYi4u
ZTRkYzkzNmNmOCAxMDA2NDQKPiAtLS0gYS9hcmNoL0NvbmZpZy5pbi5yaXNjdgo+ICsrKyBiL2Fy
Y2gvQ29uZmlnLmluLnJpc2N2Cj4gQEAgLTE4LDYgKzE4LDkgQEAgY29uZmlnIEJSMl9SSVNDVl9J
U0FfUlZECj4gIGNvbmZpZyBCUjJfUklTQ1ZfSVNBX1JWQwo+ICAJYm9vbAo+ICAKPiArY29uZmln
IEJSMl9SSVNDVl9JU0FfUlZWCj4gKwlib29sCj4gKwo+ICBjaG9pY2UKPiAgCXByb21wdCAiVGFy
Z2V0IEFyY2hpdGVjdHVyZSBWYXJpYW50Igo+ICAJZGVmYXVsdCBCUjJfcmlzY3ZfZwo+IEBAIC02
Myw2ICs2NiwxMCBAQCBjb25maWcgQlIyX1JJU0NWX0lTQV9DVVNUT01fUlZECj4gIGNvbmZpZyBC
UjJfUklTQ1ZfSVNBX0NVU1RPTV9SVkMKPiAgCWJvb2wgIkNvbXByZXNzZWQgSW5zdHJ1Y3Rpb25z
IChDKSIKPiAgCXNlbGVjdCBCUjJfUklTQ1ZfSVNBX1JWQwo+ICsKPiArY29uZmlnIEJSMl9SSVND
Vl9JU0FfQ1VTVE9NX1JWVgoKVGhpcyBvcHRpb24gbXVzdCBkZXBlbmRzIG9uIGdjYy0xMi4KCkJl
c3QgcmVnYXJkcywKUm9tYWluCgo+ICsJYm9vbCAiVmVjdG9yIEluc3RydWN0aW9ucyAoVikiCj4g
KwlzZWxlY3QgQlIyX1JJU0NWX0lTQV9SVlYKPiAgZW5kaWYKPiAgCj4gIGNob2ljZQo+IGRpZmYg
LS1naXQgYS9hcmNoL2FyY2gubWsucmlzY3YgYi9hcmNoL2FyY2gubWsucmlzY3YKPiBpbmRleCBm
M2JmMmIzNDY3Li4wN2E5NGFhNmE0IDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJjaC5tay5yaXNjdgo+
ICsrKyBiL2FyY2gvYXJjaC5tay5yaXNjdgo+IEBAIC0yNiw1ICsyNiw5IEBAIGVuZGlmCj4gIGlm
ZXEgKCQoQlIyX1JJU0NWX0lTQV9SVkMpLHkpCj4gIEdDQ19UQVJHRVRfQVJDSCA6PSAkKEdDQ19U
QVJHRVRfQVJDSCljCj4gIGVuZGlmCj4gK2lmZXEgKCQoQlIyX1JJU0NWX0lTQV9SVlYpLHkpCj4g
K0dDQ19UQVJHRVRfQVJDSCA6PSAkKEdDQ19UQVJHRVRfQVJDSCl2Cj4gK2VuZGlmCj4gKwo+ICAK
PiAgZW5kaWYKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
