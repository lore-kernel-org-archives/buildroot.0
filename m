Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DFD0D116EA
	for <buildroot@archiver.kernel.org>; Sat, 29 Nov 2025 19:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C53C80AE1;
	Sat, 29 Nov 2025 19:35:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jtgm6elBFY0G; Sat, 29 Nov 2025 19:35:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD125813AC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD125813AC;
	Sat, 29 Nov 2025 19:35:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D7B291A9
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 19:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE05E812AE
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 19:35:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jO14pJvFZx9A for <buildroot@buildroot.org>;
 Sat, 29 Nov 2025 19:35:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:660:530d:201::44; helo=mailgw-out1.grenoble.cnrs.fr;
 envelope-from=bonet@grenoble.cnrs.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BA49C81264
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA49C81264
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BA49C81264
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 19:35:06 +0000 (UTC)
Received: from [IPV6:2a01:e0a:12:eba0:df69:b4e7:b145:b132] (unknown
 [IPv6:2a01:e0a:12:eba0:df69:b4e7:b145:b132])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 64F62C0897;
 Sat, 29 Nov 2025 20:35:03 +0100 (CET)
Message-ID: <9e510762-e34d-41d1-9ec8-11d24a60ed84@grenoble.cnrs.fr>
Date: Sat, 29 Nov 2025 20:35:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 =?UTF-8?Q?Jos=C3=A9_Luis_Salvador_Rufo?= <salvador.joseluis@gmail.com>
Cc: buildroot@buildroot.org
References: <CAH+XeQYPBnXkXq4Fu0aBJ2UBR_U31ypza4z-1jf2Y78aWWiv-g@mail.gmail.com>
 <aSszM90msDWGlEaa@landeda>
Content-Language: en-US, fr
In-Reply-To: <aSszM90msDWGlEaa@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1764444903;
 bh=0YkJW0H517FdHulycX4mJbxra16bI6Kulj+j0xLdvBo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=FmD1ak/aaWKRqDE3t6VNLUitqeFKNsynR+dSkvn7pgJUtOH8mXV7ue8tsNLEqHH7B
 ATcVHYH1EhBZjwydOAfJW0tVpCsaRIuC8xJK9yTBRkwxcWQpAqx/09oyUzA/pca81X
 DD+EMJ6Os4ynB8Lb8WUJ9gAekzFYb0WDz6txBzq21+I90jS3X+oz0T8M/iCgv0JZqj
 sLmqMXC8ZUlK8Rzo2PC7UoyUWr9sxEf0MDfXZi6J4Lx6dkQ65Za1yM/5JncdOjIRad
 nobbFf1Y23kCx+U75ty4r2nVhxlsT65kKyBlV176jG7sJydtosZ1OmGwxDTe3JVSGZ
 6sS3Fh2D7jNTg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=FmD1ak/a
Subject: Re: [Buildroot] Compilation Issue with Commit
 793ebd5d28095c8df45a0d183d273d8a84b3f0a4
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
From: Edgar Bonet via buildroot <buildroot@buildroot.org>
Reply-To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8hCgpPbiAyMDI1LTExLTI5LCBKb3PDqSBMdWlzIFNhbHZhZG9yIFJ1Zm8gd3JvdGU6Cj4g
VGhlIGNvbW1pdCA3OTNlYmQ1ZDI4MDk1YzhkZjQ1YTBkMTgzZDI3M2Q4YTg0YjNmMGE0IGJyb2tl
IG15IGNvbXBpbGF0aW9uLgo+IEFuIEFJIHN1Z2dlc3RlZCB0aGF0IHRoZSBwcm9ibGVtIGlzIGJl
Y2F1c2UgdGhlIHNjcmlwdAo+IGBzdXBwb3J0L3NjcmlwdHMvY2hlY2stbWVyZ2VkYCByZXF1aXJl
cyB0aGUgZm9sbG93aW5nIGNoYW5nZToKPiAKPiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC9zY3JpcHRz
L2NoZWNrLW1lcmdlZCBiL3N1cHBvcnQvc2NyaXB0cy9jaGVjay1tZXJnZWQKPiBpbmRleCA0NDdh
YmZkODE1Li4yM2ZkYWFjMmM4IDEwMDc1NQo+IC0tLSBhL3N1cHBvcnQvc2NyaXB0cy9jaGVjay1t
ZXJnZWQKPiArKysgYi9zdXBwb3J0L3NjcmlwdHMvY2hlY2stbWVyZ2VkCj4gQEAgLTQ3LDYgKzQ3
LDggQEAgd2hpbGUgZ2V0b3B0cyAidDp1YiIgT1BUOyBkbwo+ICAgICAgICAgZXNhYwo+ICBkb25l
Cj4gCj4gK3NoaWZ0ICQoKE9QVElORC0xKSkKPiArCj4gIGlmIFsgIiR7dHlwZX0iID0gInNrZWxl
dG9uIiBdOyB0aGVuCj4gICAgICAgICBzdHJpY3Q9dHJ1ZQo+ICBlbHNlCj4gCj4gQWZ0ZXIgYXBw
bHlpbmcgdGhpcyBjaGFuZ2UsIG15IGNvbXBpbGF0aW9uIHdvcmtzIGFnYWluLCBpbiB0aGUgc2Ft
ZQo+IHdheSBhcyByZXZlcnRpbmcgY29tbWl0IDc5M2ViZDVkMjgwOTVjOGRmNDVhMGQxODNkMjcz
ZDhhODRiM2YwYTQuCj4gSSBoYXZlbuKAmXQgY2hlY2tlZCB0aGUgcmVhc29uIGZvciB0aGlzIGBz
aGlmdGAgbXlzZWxmLgoKWWFubiBFLiBNb3JpbiByZXBsaWVkOgo+IERpZCB5b3UgdW5kZXJzdGFu
ZCB3aHkgdGhlIHN1Z2dlc3RlZCBjaGFuZ2UgaXMgY29ycmVjdD8KCkkgdG9vayBhIHF1aWNrIGxv
b2sgYXQgdGhlIGNvbW1pdCBpbiBxdWVzdGlvbiAoNzkzZWJkNWQyODA5CiJzdXBwb3J0L3Njcmlw
dHMvY2hlY2stbWVyZ2VkOiB1c2UgZ2V0b3B0cyBpbnN0ZWFkIG9mIGdldG9wdCIpLiBNeQp1bmRl
cnN0YW5kaW5nIGlzIHRoYXQ6CgogIOKAoiBCZWZvcmUgdGhhdCBjb21taXQsIHRoZSBvcHRpb25z
LXBhcnNpbmcgbG9vcCAoYHdoaWxlIDo7IGRvYCwgbGluZXMKICAgIDQ0IHRocm91Z2ggNjMpIGNv
bnN1bWVkICh3aXRoIGBzaGlmdGApIHRoZSBvcHRpb25zIGFuZCBsZWZ0IHRoZQogICAgb3RoZXIg
YXJndW1lbnRzIGluICRALiBUaG9zZSBleHRyYSBhcmd1bWVudHMgKHRoZSByb290IGRpcmVjdG9y
aWVzCiAgICB0byBjaGVjaykgd2hlcmUgdGhlbiBjb25zdW1lZCBieSB0aGUgYGZvciByb290OyBk
b2AgbG9vcCBsaW5lcyAxMjUKICAgIHRocm91Z2ggMTQ0LgoKICDigKIgU2luY2UgdGhhdCBjb21t
aXQsIHRoZSBvcHRpb25zLXBhcnNpbmcgbG9vcCBkb2VzIG5vdCBjb25zdW1lIHRoZQogICAgb3B0
aW9ucyBpdCBmaW5kcy4gVGhlIGBmb3Igcm9vdDsgZG9gIGxvb3Agb3ZlciB0aGUgcm9vdCBkaXJl
Y3RvcmllcywKICAgIGhvd2V2ZXIsIGhhcyBub3QgYmVlbiBjaGFuZ2VkLiBUaGlzIGxvb3Agd2ls
bCB0aGVuIGludGVycHJldCB0aGUKICAgIG9wdGlvbnMgYXMgZXh0cmEgcm9vdCBkaXJlY3Rvcmll
cyB0byBjaGVjay4KCkBKb3PDqSBMdWlzIFNhbHZhZG9yIFJ1Zm86IEkgaG9wZSB0aGlzIGNhbiBo
ZWxwIHlvdSB3cml0ZSBhIG1vcmUKYXBwcm9wcmlhdGUgY29tbWl0IG1lc3NhZ2UuCgpSZWdhcmRz
LAoKRWRnYXIuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
