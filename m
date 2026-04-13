Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0293F34C4E
	for <buildroot@archiver.kernel.org>; Mon, 13 Apr 2026 13:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89B4283EED;
	Mon, 13 Apr 2026 13:15:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zOvBhj1kbsrE; Mon, 13 Apr 2026 13:15:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 564E083EFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776086143;
	bh=+F/snFUnxGrdbwze2R1yAyoTV/QrhwhaJoSJek+IxLM=;
	h=Date:To:Cc:From:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VjkN+F+oIJb8R5TR6wLwpmpiWn8rToUJKUJ3g414TVsNV6BkMeQG2VGD/LCcxTBIx
	 9lUyfcbUdYWa1mquvfXst4e022vOwjK6pXPDgfE4svvyziFFrZzNSoqFrSi62WH9mq
	 Iu20234nAIibttA0Z5cxJquR1DXVT6E1RRojgzAMEVqbqmyOu3P+c+g6IhALdLUzdp
	 VG5m78VMp0nCKGvOvC/JA0N8VtUQwtQnhiU+Z4oE2397hpIxgaSg8hwBi+7Y9IHW0s
	 5Vl7wfcgYzE4AlrzGIwo0COvimuYMP0jzd2kFC+HJKAtYHWpXO1gY7f+in4tINoVwo
	 VGmkCqbhPwjQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 564E083EFD;
	Mon, 13 Apr 2026 13:15:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 58315194
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 13:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D41A83EED
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 13:15:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ZrigqgecDOU for <buildroot@buildroot.org>;
 Mon, 13 Apr 2026 13:15:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=david.oberhollenzer@sigma-star.at; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E34E483EB8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E34E483EB8
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E34E483EB8
 for <buildroot@busybox.net>; Mon, 13 Apr 2026 13:15:37 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-488ad135063so42070295e9.0
 for <buildroot@busybox.net>; Mon, 13 Apr 2026 06:15:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776086136; x=1776690936;
 h=subject:from:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OPlWHqGFvPf9u/ipDyWMMJOFxnIxgOTwpvnndN+Xl44=;
 b=X2wnJUYMGncflExpA/lRaoRR/nhwhk2SZj2/LVA8IUWpmYrMYgAtkjFtglOozpGzf1
 zSUt4UshS79I1B1uD7DoyBDPb2O65Z/L5/pMn9AzDMO9C1syMM375FS+d+IlphjqZEhS
 /FowF0TrdConVYR1Bo/3mawOmgP98EPPWEXOqEJPEaaW/raQxgfZKXXME0q2H8F4NDQu
 p4QQOIdh9ei+CCAyOq+x/7pytFV5WZEszFqIi/87TmDbDyaLyKyZPxo97hCiFiSlJQTm
 smap3TorvXKPDRjbUiPZ8aITPhhvqAy2Ya7sSuIRAr8A5Ma1ZrahB4J8m1o+hyALeQk1
 na1A==
X-Forwarded-Encrypted: i=1;
 AFNElJ+rfoXImuGbDZ/ZHdLUwAoNLWSyKwJkcnAgaJ9HHzRMqWXgPVHL95ObVZOiyb3DzdBdFffJjcYq4wQ=@busybox.net
X-Gm-Message-State: AOJu0YzJj/lddVX7LAyC/UIkQcu+/m7ZdbDv18FSYjPFQD7AU21xT1y1
 wDMtuvXun5fFAFeYeMBi5DOcE6DWjWtvMMlOGGDgoJ+2WC08ccHOZBAVe3LRjwst6Po=
X-Gm-Gg: AeBDietXosJoOk7+pVOk34+YiL/XR9ECnJ30Kzze7OeXVQgBVtcvlSSMI3oVPC1sRkJ
 8BxZUl+ILL30R9xnJxieGUh2oaIwQ0OklMxMtu9Q65Vq9+VZd7xJLi5i6jYwH0/bi9rMV7pT74C
 4ufAUbN/FhcGFV5ItnjdkZg6QhtNQIezRovISGwoEhnCNmWVLlbym0/prMzz523VH7OpvzsHiDF
 juCKyuzNYhXRA5yVnyRR+G1eP8HHuPy1SilyGC+kZjiizjIT5Rl0LAEUKl2HTSfjulR8TN0Ajkn
 2JKhl+25pbQRyvcLgs2b5tKEmxCOut6ijhVwUTT6HqgY8BFcdm/k00X36rOagge09gTXOK4PpQ/
 9vemRM9oFq13YtMemzTNrlUOngAI0Lzpzwsg/5ytBej4GBRK7canX8WWVQ2Sh9G81jP51QvLBKE
 vk8Lru6VL5wDbI8zJmWszr8CB8VrvoSSIT20Q2Kb9IQmqzUA==
X-Received: by 2002:a05:600c:674f:b0:488:a82f:bb9b with SMTP id
 5b1f17b1804b1-488d68cb47amr194006135e9.30.1776086135605; 
 Mon, 13 Apr 2026 06:15:35 -0700 (PDT)
Received: from [10.115.255.165] ([82.150.214.1])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d592d606sm294557625e9.9.2026.04.13.06.15.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Apr 2026 06:15:35 -0700 (PDT)
Message-ID: <73da3205-694e-422a-ac73-d7bcb054aa1e@sigma-star.at>
Date: Mon, 13 Apr 2026 15:15:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: MTD Mailing List <linux-mtd@lists.infradead.org>,
 Buildroot Mailing List <buildroot@busybox.net>
Cc: Richard Weinberger <richard@nod.at>,
 "Josh Boyer (Fedora)" <mtd-utils-maintainers@fedoraproject.org>,
 "Bastian Germann (Debian)" <bage@debian.org>,
 =?UTF-8?Q?Tomasz_Pawe=C5=82_Gajc_=28OpenMandriva=29?=
 <bero+massbuild@lindev.ch>, =?UTF-8?B?0JDQu9C10LrRgdCw0L3QtNGAIChSb3NhIExp?=
 =?UTF-8?Q?nux=29?= <a.proklov@rosalinux.ru>,
 Embedded Gentoo <embedded@gentoo.org>, "Robin H. Johnson"
 <robbat2@gentoo.org>, "John (OpenWRT)" <john@phrozen.org>,
 "Michael Tross (T2 SDE)" <michael@tross.org>,
 "Oliver Schinagl (Alpine)" <oliver@schinagl.nl>,
 "Orphaned (Void Linux)" <orphan@voidlinux.org>,
 "Sergey Bolshakov (ALT Linux)" <sbolshakov@altlinux.org>,
 "Silvan Calarco (openmamba)" <silvan.calarco@mambasoft.it>,
 "Viric (nixpkgs)" <viric@viric.name>,
 "Pascal Bleser (SUSE)" <pascal.bleser@opensuse.org>,
 "Levente Polyak (Arch)" <anthraxx@archlinux.org>,
 =?UTF-8?Q?Llu=C3=ADs_Batlle_i_Rossell_=28NixOS=29?= <shaba@altlinux.org>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sigma-star.at; s=google; t=1776086136; x=1776690936; darn=busybox.net;
 h=subject:from:cc:to:content-language:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=OPlWHqGFvPf9u/ipDyWMMJOFxnIxgOTwpvnndN+Xl44=;
 b=JbHBnOTtFOht9dXngnaz9q5fiFZn+aniKfh4Rv/t/znAWlZBsq8k9VQjwcZ8rM2tuN
 zRi4gPjaK0sdBmvM/W1WhOl17yFAgwaJrHM5YOlaPV2f0SN5a3ySTFYKz94gjdRfGQEz
 2KGfAq5jzurgM65J+SV2EPrs1aPaP4T84g5BOiEhuzxMUyhxme5AvT1WB4HJBEcImHrd
 lhUQzyNNWVz0/TR+r4jGSrD5K6DQ9fqLzriHd3YjZdQDROAXitZEgDJ4T0YzxwAAfe0h
 CR7FzEWZgGuLj2R7eBOVFKqPgHNh3VDR7wUl9gXoYQ0y1khJESGHrmT/PxuBdVNwylIO
 xqOA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=sigma-star.at
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=sigma-star.at header.i=@sigma-star.at
 header.a=rsa-sha256 header.s=google header.b=JbHBnOTt
Subject: [Buildroot] [ANNOUNCE] mtd-utils-2.3.1 is released
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
Content-Type: multipart/mixed; boundary="===============7299367307937316836=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============7299367307937316836==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------tYTXEKvl90pmIykNHmdQbqum"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------tYTXEKvl90pmIykNHmdQbqum
Content-Type: multipart/mixed; boundary="------------KVZxeu7Tj0p2w6Ry0Sg4k0xw";
 protected-headers="v1"
Message-ID: <73da3205-694e-422a-ac73-d7bcb054aa1e@sigma-star.at>
Date: Mon, 13 Apr 2026 15:15:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: MTD Mailing List <linux-mtd@lists.infradead.org>,
 Buildroot Mailing List <buildroot@busybox.net>
Cc: Richard Weinberger <richard@nod.at>,
 "Josh Boyer (Fedora)" <mtd-utils-maintainers@fedoraproject.org>,
 "Bastian Germann (Debian)" <bage@debian.org>,
 =?UTF-8?Q?Tomasz_Pawe=C5=82_Gajc_=28OpenMandriva=29?=
 <bero+massbuild@lindev.ch>, =?UTF-8?B?0JDQu9C10LrRgdCw0L3QtNGAIChSb3NhIExp?=
 =?UTF-8?Q?nux=29?= <a.proklov@rosalinux.ru>,
 Embedded Gentoo <embedded@gentoo.org>, "Robin H. Johnson"
 <robbat2@gentoo.org>, "John (OpenWRT)" <john@phrozen.org>,
 "Michael Tross (T2 SDE)" <michael@tross.org>,
 "Oliver Schinagl (Alpine)" <oliver@schinagl.nl>,
 "Orphaned (Void Linux)" <orphan@voidlinux.org>,
 "Sergey Bolshakov (ALT Linux)" <sbolshakov@altlinux.org>,
 "Silvan Calarco (openmamba)" <silvan.calarco@mambasoft.it>,
 "Viric (nixpkgs)" <viric@viric.name>,
 "Pascal Bleser (SUSE)" <pascal.bleser@opensuse.org>,
 "Levente Polyak (Arch)" <anthraxx@archlinux.org>,
 =?UTF-8?Q?Llu=C3=ADs_Batlle_i_Rossell_=28NixOS=29?= <shaba@altlinux.org>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [ANNOUNCE] mtd-utils-2.3.1 is released

--------------KVZxeu7Tj0p2w6Ry0Sg4k0xw
Content-Type: multipart/mixed; boundary="------------zR0bczfZ6cDV0xXTILPwk1su"

--------------zR0bczfZ6cDV0xXTILPwk1su
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCm10ZC11dGlscy0yLjMuMSBpcyByZWxlYXNlZC4NCg0KVGFyYmFsbDogICAgICAg
ICAgICAgICBmdHA6Ly9mdHAuaW5mcmFkZWFkLm9yZy9wdWIvbXRkLXV0aWxzL210ZC11dGls
cy0yLjMuMS50YXIuYnoyDQpUYXJiYWxsIGdwZyBzaWduYXR1cmU6IGZ0cDovL2Z0cC5pbmZy
YWRlYWQub3JnL3B1Yi9tdGQtdXRpbHMvbXRkLXV0aWxzLTIuMy4xLnRhci5iejIuYXNjDQpT
aWduZWQgZ2l0IHRhZzogICAgICAgIGdpdDovL2dpdC5pbmZyYWRlYWQub3JnL210ZC11dGls
cy5naXQgdjIuMy4xDQoNCg0KQWx0ZXJuYXRpdmVseSBhbHNvIG1pcnJvcmVkIGhlcmU6DQoN
ClRhcmJhbGw6ICAgICAgICAgICAgICAgaHR0cHM6Ly9pbmZyYXJvb3QuYXQvcHViL210ZC9t
dGQtdXRpbHMtMi4zLjEudGFyLmJ6Mg0KVGFyYmFsbCBncGcgc2lnbmF0dXJlOiBodHRwczov
L2luZnJhcm9vdC5hdC9wdWIvbXRkL210ZC11dGlscy0yLjMuMS50YXIuYnoyLmFzYw0KU2ln
bmVkIGdpdCB0YWc6ICAgICAgICBodHRwczovL2dpdC5pbmZyYXJvb3QuYXQvbXRkLXV0aWxz
LmdpdCB2Mi4zLjENCg0KDQpUaGlzIHJlbGVhc2UgbWFpbmx5IGNvbnRhaW5zIGEgbnVtYmVy
IG9mIG9kZCBmaXhlcyB0aGF0IGhhdmUgYWNjdW11bGF0ZWQgb3Zlcg0KdGhlIGxhc3QgeWVh
ci4NCg0KDQpDaGFuZ2VzIGZyb20gMi4zLjAgdG8gMi4zLjE6DQoNCkZpeGVzOg0KICAtIHVi
aWZzLXV0aWxzOiBsaW5rIGxpYm1pc3NpbmcuYSBpbiBjYXNlIGV4ZWNpbmZvLmggaXNuJ3Qg
cHJlc2VudA0KICAtIHViaWZzLXV0aWxzOiBjb21tb246IGZpeCBtZW1vcnkgbGVhayBpbiBk
ZXZ0YWJsZS5jDQogIC0gQnJva2VuIGNoZWNrIGZvciBHQ0MgY29tcGlsZXIgdmVyc2lvbnMN
CiAgLSB1Ymlmcy11dGlsczogbWlzc2luZyBoZWFkZXIgZmlsZSBpbmNsdWRlcw0KICAtIHVi
aWZzLXV0aWxzOiB0ZXN0czogbWlzc2luZyBmaWxlcyBpbiByZWxlYXNlIHRhcmJhbGwNCiAg
LSBtdGQtdGVzdHM6IGZsYXNoX3NwZWVkOiByZWFsbHkgc2tpcCBkZXN0cnVjdGl2ZSB0ZXN0
cw0KICAtIG10ZC10ZXN0czogZmxhc2hfc3BlZWQ6IHdyb25nIGVycm9yIG1lc3NhZ2UgaW4g
cmVhZF9lcmFzZWJsb2NrKCkNCiAgLSBzZXJ2ZV9pbWFnZTogZml4IF9QT1NJWF9DX1NPVVJD
RSBkZWZpbmUNCiAgLSB1YmlhdHRhY2g6IGZpeCB3b3JkaW5nIGluIHVzYWdlIGV4YW1wbGUN
CiAgLSBmc2NrLnViaWZzOiBkb24ndCB1c2UgcG9pbnRlcnMgdGhhdCByZWZlcmVuY2Ugb3V0
LW9mLXNjb3BlIHZhcmlhYmxlcw0KICAtIGZzY2sudWJpZnM6IGZpeCBwbGF0Zm9ybSBkZXBl
bmRhbnQgYGlub190YCBhbmQgYGxvZmZfdGAgZm9ybWF0dGluZw0KICAtIGRvY2ZkaXNrLmM6
IGZpeCBwb3RlbnRpYWwgYXJpdGhtZXRpYyBvdmVyZmxvd3MgaW4gcGFydGl0aW9uIHNpemUN
CiAgLSBqaXR0ZXJ0ZXN0OiByZWplY3Qgb3ZlcmxvbmcgZmlsZSBuYW1lcw0KDQpDaGFuZ2Vz
Og0KICAtIHViaXJzdm9sOiByZXNpemUgdXNpbmcgYWxsIGF2YWlsYWJsZSBmcmVlIHNwYWNl
IGlmIHNpemUgaXMgc3BlY2lmaWVkIGFzIDANCg0KDQpSYXcgc2hvcnQgbG9nIHNpbmNlIHRo
ZSAyLjMuMCByZWxlYXNlOg0KDQpBbnRvbiBNb3J5YWtvdiAoMyk6DQogICAgICAgbWlzYy11
dGlsczogZG9jZmRpc2suYzogZml4IHBvdGVudGlhbCBpbnRlZ2VyIHVuZGVyZmxvdyBpbiBw
YXJ0aXRpb24gc2l6ZSBjYWxjdWxhdGlvbg0KICAgICAgIG1pc2MtdXRpbHM6IGRvY2ZkaXNr
LmM6IHZhbGlkYXRlIHBhcnRpdGlvbiBzaXplIHRvIHByZXZlbnQgYXJpdGhtZXRpYyBvdmVy
Zmxvdw0KICAgICAgIHViaWZzLXV0aWxzOiBjb21tb246IGZpeCBtZW1vcnkgbGVhayBpbiBk
ZXZ0YWJsZS5jDQoNCkF2aXYgRGF1bSAoMSk6DQogICAgICAgbXRkLXV0aWxzOiB0ZXN0czog
aml0dGVydGVzdDogcmVqZWN0IG92ZXJsb25nIGZpbGUgbmFtZXMNCg0KRGF2aWQgT2Jlcmhv
bGxlbnplciAoMik6DQogICAgICAgVXBkYXRlIENIQU5HRUxPRy5tZA0KICAgICAgIFJlbGVh
c2UgbXRkLXV0aWxzLTIuMy4xDQoNCkZhYmlvIEVzdGV2YW0gKDMpOg0KICAgICAgIHViaWZz
LXV0aWxzOiB1Ymlmcy5oOiBJbmNsdWRlIDxmY250bC5oPg0KICAgICAgIHViaWZzLXV0aWxz
OiBqb3VybmFsOiBJbmNsdWRlIDxzeXMvc3RhdC5oPg0KICAgICAgIHViaWZzLXV0aWxzOiBl
eHRyYWN0X2ZpbGVzOiBJbmNsdWRlIDxsaW51eC9saW1pdHMuaD4NCg0KR2Fib3IgSnVob3Mg
KDIpOg0KICAgICAgIG10ZC10ZXN0czogZmxhc2hfc3BlZWQ6IHJlYWxseSBza2lwIGRlc3Ry
dWN0aXZlIHRlc3RzDQogICAgICAgbXRkLXRlc3RzOiBmbGFzaF9zcGVlZDogZml4IGVycm9y
IG1lc3NhZ2UgaW4gcmVhZF9lcmFzZWJsb2NrKCkNCg0KS2hlbSBSYWogKDEpOg0KICAgICAg
IEltcHJvdmUgY2hlY2sgZm9yIEdDQyBjb21waWxlciB2ZXJzaW9uDQoNCktvbnN0YW50aW4g
TWVueWFldiAoMSk6DQogICAgICAgdWJpLXV0aWxzOiB1Ymlyc3ZvbDogcmVzaXplIHZvbHVt
ZSB1c2luZyBhbGwgYXZhaWxhYmxlIGZyZWUgc3BhY2UNCg0KTWljaGFlbCBPbGJyaWNoICgx
KToNCiAgICAgICB0ZXN0czogYWRkIHRlc3RfREFUQSB0byBFWFRSQV9ESVNUDQoNCk1vaGFt
bWFkIFJhaGltaSAoMSk6DQogICAgICAgdWJpYXR0YWNoOiBmaXggd29yZGluZyBpbiB1c2Fn
ZSBleGFtcGxlDQoNClJvc2VuIFBlbmV2ICgxKToNCiAgICAgICBtdGQtdXRpbHM6IHNlcnZl
X2ltYWdlOiBmaXggX1BPU0lYX0NfU09VUkNFDQoNClJvc3MgQnVydG9uICgxKToNCiAgICAg
ICB1Ymlmcy11dGlsczogbGluayBsaWJtaXNzaW5nLmEgaW4gY2FzZSBleGVjaW5mby5oIGlz
bid0IHByZXNlbnQNCg0KWXV0YSBIYXlhbWEgKDIpOg0KICAgICAgIGZzY2sudWJpZnM6IGRv
bid0IHVzZSBwb2ludGVycyB0aGF0IHJlZmVyZW5jZSBvdXQtb2Ytc2NvcGUgdmFyaWFibGVz
DQogICAgICAgZnNjay51YmlmczogZml4IHBsYXRmb3JtIGRlcGVuZGFudCBpbm9fdCBhbmQg
bG9mZl90IGZvcm1hdHRpbmcNCg0KUmVnYXJkcywNCg0KRGF2aWQNCg==
--------------zR0bczfZ6cDV0xXTILPwk1su
Content-Type: application/pgp-keys; name="OpenPGP_0xBCE5DC3C741A02D1.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBCE5DC3C741A02D1.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFZyf0YBCADHyKhABhxthCC9n48pvsuk5p3IEdYXMs8Apenh1N/Z4cViAz/d
/nSCZ+FGFX/PSubEzq8AilZLejchAltaORCvA1Y6FgTlpcdJ6gHDfStDbJL/vk5N
8aL7YNF7VfjTRntBtKbhKcrG05nbdNjIioAm04pt9rx5mV5KMbf22/FdZpOSSsC6
/N7b/cFH9+fx8kwi4pNFuJwrBkWRuQ7rEtCoSpd22t+Vh9qA7kymW9gWY405258j
nN65jBO7ElqU2CCuGRPg6uryAHV3RVCB9j9AE3HLacQReFtt5ylyydSQbaK4K9as
nd7U2/C11vIuuciXCppX4bPap/pMnGpzw0UNABEBAAHNN0RhdmlkIE9iZXJob2xs
ZW56ZXIgPGRhdmlkLm9iZXJob2xsZW56ZXJAc2lnbWEtc3Rhci5hdD7CwHcEEwEI
ACEFAlZyf0YCGwMFCwkIBwIGFQgJCgsCBBYCAwECHgECF4AACgkQvOXcPHQaAtFu
EAgArXOhaoaVvCMVCa5N25Q/+Q6K1wrVpPmkH89yhQqCmfM6f+2VM5MGFDPfaSJ3
5fBDH0iwBQwlXIb7NSXWtzdXX9rMvJkJqv45TgeKtJApf/sRhmcN+clrwzP8oZQb
xkP1YWzoVwo4lOb3Kv7aY9yeCjqNbdJJ57NpvYOUrzrCpGkrDPBBQOvKF3wbq3oU
/o3dT23NDeQ20jXgquJf/PCw6WCzRxqg58wH02MdMDQe8vByzVig2bM2e7DErtt+
hPK/Dmdsqgns+Z+SrQcOvRa3GMAHAuHB0u2LhYO6NyaNCgzdgutorilYcq7FEKr8
XqwOnfVmZdCW3qGKmLbn6qMEdM7ATQRWcn9GAQgAvugF8cFjv2Zs4BBb44SnxGaw
BySC1bMRas/MjA9EMHUAx/StcecQmxnl6BzEyGpr+TRnXIzcb5xI8SxitBDU5MLv
wsHgNvpYp9fscd4kWP7oMir9ta3Q8SvT4OLbO4FZBGaURzGPak8JmjMMtOoOBh4m
eOjz6GrJe9UIGxT94aB01w7YohfBANzK8xyk4ykKC5Op4XgaaMKOEQUah7wajcoj
YSlvgOiXqEisMHlRDAW6sXL2sEM7TIpvYhy9txMLllpkYb0Pu1BvUpY/unsybWKA
FyiTmeiY+nEveUvqX6Ef7BWdClBeCk2UaRvtcoLd22VxMlKTniHQcNMOXlRRawAR
AQABwsBfBBgBCAAJBQJWcn9GAhsMAAoJELzl3Dx0GgLRPtcH/jD6rn2+VIKgrHdt
3ao3Abpu2fqYfwbIyPAtpXOddDptVq+0A/2arXT1Y8+jNSZpbAg8K+bLaEAcSUEj
viKMpfI7ppTUBuGKrpgc5xsiUpKkJCb7oB1ZraIBNBPtPPVUhbwLie4uW/LVt+8r
BKz3W9KEDOsT0ZCG/pW8Ld+EpDR9l0fmqoVHaw8PhLAtez+B7HS7Hv7iJPDtX85k
FYpud8kIPENXVn9EjZudyMWgZb2LhYlcavNcszgR7In6ift5SNySojCOfAV0iKZb
8QUXWktLleY8kQ8jltOsSRTuO4PDfzvtCQDixUw4tQ7WLwDTqyUpot0oG03vtSG4
LIRCdxI=3D
=3DjujX
-----END PGP PUBLIC KEY BLOCK-----

--------------zR0bczfZ6cDV0xXTILPwk1su--

--------------KVZxeu7Tj0p2w6Ry0Sg4k0xw--

--------------tYTXEKvl90pmIykNHmdQbqum
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEEwY/cjyeWErqzVubvOXcPHQaAtEFAmnc7HUFAwAAAAAACgkQvOXcPHQaAtFd
1gf/dMBWVmvIgAJiJeqO5Pjs09PyPDasaB09oTysQazgNmDi/cyfjU3NwRIwKo/P1KsIkQGmvtHS
NU7wq1Z3re4oT/8/moHv6p2TaTJkwFmGer8hcoU5QenYx8MIQqU57ZvEEWgnnUK19qL+FcapAJrn
gNB+ctyrnvg/vLXURcJhCQRCSZUtIg9q0weIspUKV0beJNGpSBjz7h31Q4r3eOkmQdTOed8ODVSR
gXobhUpSTJ30y1NNVNAtKduFGqjq6/ZZUbwWxQ86AnJFMLlL23QOdBg6cTPdLTQ9ieePq5hBwMSa
bNBdz3gbji+QEniQBUIjBjo/nWJztnNFu3ARdrZCbw==
=/bl5
-----END PGP SIGNATURE-----

--------------tYTXEKvl90pmIykNHmdQbqum--

--===============7299367307937316836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7299367307937316836==--
