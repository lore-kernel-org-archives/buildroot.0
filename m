Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFE9CD4F21
	for <buildroot@archiver.kernel.org>; Wed, 13 May 2026 19:37:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB65B60703;
	Wed, 13 May 2026 19:37:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ca2USLRSUFid; Wed, 13 May 2026 19:37:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1C8660705
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778701056;
	bh=tXNsldvBf12P5PiICstT8+mK2ACizIJe8l0zjax2dGs=;
	h=References:In-Reply-To:From:Date:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=rXhd4KMw/Xqc2GK1zkh54/EuKyr6dB4Dv2t1yLAA2BO9Ojm6JkuwCEpL7VyO8Fifz
	 ih9UblVTL4975MdngVffnx3MYmwrp+seMX9KXSVj79dZIXxuqXUsr6I5DcrBhn6g9K
	 cUGTe10CvVHGpU3zs9HlZoXTJ40GyfKOjZW+ZbFCdoBt16ZVj5DJNrHjyYyv2Nah+s
	 Kt1LZwZRvon2CxJpfY1P5K1q6L5AHe46gqnlta4HbYMAMlxCy2IJCnL4aRa05hkaav
	 wwLCbVcwf/JfQ47niix7KqIYTs6wpsDLUBiOobapHqcM0zHrfZBwuJ9Nhm/OOCgiMY
	 FU5BkV9tT3HYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1C8660705;
	Wed, 13 May 2026 19:37:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 57664270
 for <buildroot@buildroot.org>; Wed, 13 May 2026 19:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3980A60703
 for <buildroot@buildroot.org>; Wed, 13 May 2026 19:37:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id toyfFPmGvzzX for <buildroot@buildroot.org>;
 Wed, 13 May 2026 19:37:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32b; helo=mail-ot1-x32b.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 83A5A606F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83A5A606F0
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 83A5A606F0
 for <buildroot@buildroot.org>; Wed, 13 May 2026 19:37:34 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-7dbca22dbfeso4139531a34.1
 for <buildroot@buildroot.org>; Wed, 13 May 2026 12:37:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778701053; cv=none;
 d=google.com; s=arc-20240605;
 b=O1zhUhtPyugz0lIh998yLq4Rslk5mNHFqjZR0lo6FBq6pHo3tH9UMT8ym8jB59Luy7
 SmkVE45kZmD+XSxrSFeXHajI/1OE/DEDF+IdK6N8RjDYSuLy3U2yc80s7eWTRc9r9aFa
 6TRMlnGX002Zm0VJWLDKFRdRWOtPudmxxWwgWwLTkSVE0PwvESlXArJPwIxiO8+e5uwc
 TGzZ7f5H1yw1FRP4XTwz7s+v/KaLPM3rjAkx91ATsN+AUoYQYEpGwtUrghFho8cZEuA9
 IFEuhLbVprcN19PN7zCJPn7QVewC79Fu0M19hRa2uAAXZOC5He3Lbtq6oLWN6efnlx0r
 Fq6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=k4hv+gginROhzqhYcM4zNrp6I0ZkGEKQKM7DZunfxYg=;
 fh=t4FV3giSnaxhJeMavuQpQ8IxOnoseiSsY4+o7XDIOZQ=;
 b=IX9K04RRu062jDxg09xDnPlx5aztv/0AVlseANl6GY0C7FE1dtEREn+rsJwJcaVFmV
 Gkflr5IQcO2SRmz9ulckSWLQpmBZIlx26grJT1CWNGQMpUyOsoCDBeMnAU6GcXR/QdI8
 PJHU+d9vZEMXn6H4T9NRRlK4S3N76VHr8rwv57y+2JQnTpx8HYCwHkA9nLWXpAbojYCG
 hwIrz3RNy2zcA0CBKzhHyHggrdlc0MbBGdOYXsRndWEKAao3SyghWVssZB8iLDVmw7pa
 5Bt3pHd7smvdmQj/PJYhgd7RAWSZ6uzvpIMVLFqLFBxgGdlgPYsgr9mlmR8XRniz08Zv
 W5sw==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778701053; x=1779305853;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=k4hv+gginROhzqhYcM4zNrp6I0ZkGEKQKM7DZunfxYg=;
 b=YsaGl89Lc3JIxvcwF0RznLwhYzEI3vGScarGaIZS6qdFc4CwGzmc13smGJOiKmPnVW
 h/hqu1gBv80HCtatqgaG24mOhoXHvpDJENOEoUNmCVAeGblmmqERytPcPYfOC2az+GIH
 M0lPdGOeRMqd+JaKXHohBMpseXX3luPKynOrcBK1ajifA1jcwvLIHAyOrHxPR3Ay6kpJ
 VdI25n9jChatPVeCfnjqu7uLOdawiBUK1Ty3r6FTEQI1zuR4O2hUUw55ibDb84o5TqB7
 AGh+lNeyMjnuow+11HeyBLQfNQJP4QVfHooBozaKR/RzHjTZ5pBwwulPh91lhUH/gV+N
 MYug==
X-Forwarded-Encrypted: i=1;
 AFNElJ86Zf0xOJR8Vih948cTySzHF9MWlwSBJxynz5UzjZxlDNyABmORSrFjZ4JPffVFek/pMXUzs5gKV6o=@buildroot.org
X-Gm-Message-State: AOJu0Yy1b3qdTzcE7ICbMtH2mJ827aUCr5KJsaWC/h/A/ahD+6K0rMqF
 Suy0nBNkJp+z44dD1sN1duLSvz0tGp69zPn1Zs4A8UuiUi6n9GdK0bzlNbin33p3c6kSPTi8JGK
 CcbyP7tziHiWmtXGDCz7lmNXJfqujaoE=
X-Gm-Gg: Acq92OE4Y1MTmVVuYCYQqw/x3AQdn/0r5j8pxujCNG0oqBVh8qw7csgi5Sphzk6D8Mg
 ZiJKS6Xbt1L7VC5w9K/+37MtZi4vFn7YNhAM1gY6Itb5c+i7eQwNwfBFhMCWcIVXQZ0/gEji1Fz
 9PALvvYx1sfi1BhWHWUtBX1t9+1rrG8h8yQ055NocnfE1p9CKaL8BEVZ9cE16xUFOlZ+N4rUz2p
 VLwNs8541BRAH9Uz0hvW8AqZ0aCmD2MqBOeKbx++1UPxOx16V8lVPueuLH5i5UmmxCG3H9L2CGo
 92bt
X-Received: by 2002:a05:6820:81c8:b0:699:a7d1:5fd5 with SMTP id
 006d021491bc7-69b78e0e06emr2697403eaf.39.1778701053354; Wed, 13 May 2026
 12:37:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260512-qemu-v11-0-0-v1-1-776ebffbb3af@anodize.com>
 <87tsscyngb.fsf@tarshish> <f40ce0c6-0441-4aa0-91a6-fe80a66b2821@gmx.de>
 <CAMWSM7jkykAM0HoAyYS4gOaGV2qpu9K5iY3E8ZR5RqKUSNOZiA@mail.gmail.com>
In-Reply-To: <CAMWSM7jkykAM0HoAyYS4gOaGV2qpu9K5iY3E8ZR5RqKUSNOZiA@mail.gmail.com>
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed, 13 May 2026 12:36:57 -0700
X-Gm-Features: AVHnY4LGW_Z01fDzwtIRGW6ux5IhZJwwi25W7ENOg3MCKxGyNeMMIbjG3VuuGAA
Message-ID: <CAMWSM7jRsjmyMR0T+W1NckSVxscwXszNdvtWj0s6uuDSt-W2Kg@mail.gmail.com>
To: Fiona Klute <fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778701053; x=1779305853; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k4hv+gginROhzqhYcM4zNrp6I0ZkGEKQKM7DZunfxYg=;
 b=GMghiFSuYpWKM0bGWqaocHnI2KYI1OPHUNlNOZzJ3IJcgRG/H7RYwBA2sWLJx+ha5Q
 c6SCK8DpZlABTTJNht6oZ4xUmsMqKUpF9qAo9fEDfWZyY7e5Dh81fxr5DXu2P49EcGBX
 FiXr9Yoj/R5trBQMtktyYwC9weraAN40LvEx01vEDVLJY0eGAbe43DOIlEouKPNg9vn4
 a/vtoz2sF3V1DHyGpSH7ab1YuUivXKyVgHkZRePZJ36rsqdMpBfS4jk5t5HDKeKwI05J
 cOvpqh/lxxtDm7RR0EMZzCHvAwpc1hnrP3Zt3BxwL+VsVLRIwiA9/SUUtb/jEWERuOxn
 8tow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=GMghiFSu
Subject: Re: [Buildroot] [PATCH RESEND] package/qemu: bump to version 11.0.0
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
Cc: Joseph Kogut <joseph@anodize.com>, Romain Naour <romain.naour@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiBXZWQsIE1heSAxMywgMjAyNiBhdCA5OjM44oCvQU0gSm9zZXBoIEtvZ3V0IDxq
b3NlcGgua29ndXRAZ21haWwuY29tPiB3cm90ZToKPgo+IEFzIEkgYWRkZWQgYWJvdmUsIHRoaXMg
cGF0Y2ggbWlzc2VkIHVwZGF0aW5nIENvbmZpZy5pbi5ob3N0LCBzbyBJJ2xsCj4gdXBkYXRlIHRo
ZSBjb21taXQgbG9nIHRvIG1vcmUgdGhvcm91Z2hseSBkb2N1bWVudCB0aGlzIGNoYW5nZSBiZWZv
cmUKPiByZXN1Ym1pdHRpbmcuCj4KCkl0IHNlZW1zIEkgYWN0dWFsbHkgY29uZnVzZWQgbXlzZWxm
LiBGdW5jdGlvbmFsbHksIHRoZSBzdWJtaXR0ZWQgcGF0Y2gKaXMgZmluZSAoYXMgZmFyIGFzIDMy
LWJpdCBzdXBwb3J0IGdvZXMsIHNlZSBiZWxvdyksIENvbmZpZy5pbi5ob3N0CmRvZXNuJ3QgbmVl
ZCB1cGRhdGVkIGZvciB0aGUgMzItYml0IGRyb3AsIGFzIHRoZSBBUkNIX1NVUFBPUlRTIGNvbmZp
Z3MKc3BlY2lmeSBjb21wYXRpYmxlICp0YXJnZXRzKiwgcmF0aGVyIHRoYW4gdGhlIGhvc3QgYXJj
aGl0ZWN0dXJlLgpSdW5uaW5nIHV0aWxzL3Rlc3QtcGtnIHdpdGggdGhlIGJlbG93IGNvbmZpZzoK
CgpCUjJfUEFDS0FHRV9IT1NUX1FFTVU9eQpCUjJfUEFDS0FHRV9IT1NUX1FFTVVfU1lTVEVNX01P
REU9eQpCUjJfUEFDS0FHRV9IT1NUX1BZVEhPTjM9eQpCUjJfUEFDS0FHRV9IT1NUX1BZVEhPTjNf
U1NMPXkKCgokIHV0aWxzL3Rlc3QtcGtnIC1wIGhvc3QtcWVtdSAtYyBob3N0LXFlbXUuY29uZmln
IC1hCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYXJtLWFhcmNoNjQgWyAxLzMyXTogT0sK
ICAgICAgICAgICAgICBib290bGluLWFhcmNoNjQtZ2xpYmMtb2xkIFsgMi8zMl06IE9LCiAgICAg
ICAgICAgICAgICAgIGJvb3RsaW4tYWFyY2g2NC1nbGliYyBbIDMvMzJdOiBPSwogICAgICAgICAg
ICAgIGJvb3RsaW4tYXJjbGUtaHMzOC11Y2xpYmMgWyA0LzMyXTogU0tJUFBFRAogICAgICAgICAg
ICAgICAgICAgYm9vdGxpbi1hcm12NS11Y2xpYmMgWyA1LzMyXTogT0sKICAgICAgICAgICAgICAg
ICAgICBib290bGluLWFybXY3LWdsaWJjIFsgNi8zMl06IE9LCiAgICAgICAgICAgICAgICAgICAg
IGJvb3RsaW4tYXJtdjctbXVzbCBbIDcvMzJdOiBPSwogICAgICAgICAgICAgICAgICBib290bGlu
LWFybXY3bS11Y2xpYmMgWyA4LzMyXTogT0sKICAgICAgICAgICAgICAgYm9vdGxpbi1tNjhrLTUy
MDgtdWNsaWJjIFsgOS8zMl06IE9LCiAgICAgICAgICAgICAgYm9vdGxpbi1tNjhrLTY4MDQwLXVj
bGliYyBbMTAvMzJdOiBPSwogICAgICAgICAgICBib290bGluLW1pY3JvYmxhemVlbC11Y2xpYmMg
WzExLzMyXTogRkFJTEVECiAgICAgICAgICAgICAgICAgYm9vdGxpbi1taXBzNjRlbC1nbGliYyBb
MTIvMzJdOiBPSwogICAgICAgICAgICAgICAgICBib290bGluLW1pcHNlbC11Y2xpYmMgWzEzLzMy
XTogT0sKICAgICAgICAgICAgICAgYm9vdGxpbi1taXBzZWwzMnI2LWdsaWJjIFsxNC8zMl06IE9L
CiAgICAgICAgICAgICAgICBib290bGluLW9wZW5yaXNjLXVjbGliYyBbMTUvMzJdOiBPSwogICAg
ICAgICAgYm9vdGxpbi1wb3dlcnBjLWU1MDBtYy11Y2xpYmMgWzE2LzMyXTogT0sKICAgICAgIGJv
b3RsaW4tcG93ZXJwYzY0bGUtcG93ZXI4LWdsaWJjIFsxNy8zMl06IE9LCiAgICAgICAgICAgICAg
ICAgIGJvb3RsaW4tcmlzY3YzMi1nbGliYyBbMTgvMzJdOiBPSwogICAgICAgICAgICAgICAgICBi
b290bGluLXJpc2N2NjQtZ2xpYmMgWzE5LzMyXTogT0sKICAgICAgICAgICAgICAgICAgIGJvb3Rs
aW4tcmlzY3Y2NC1tdXNsIFsyMC8zMl06IE9LCiAgICAgICAgICAgICAgICBib290bGluLXMzOTB4
LXoxMy1nbGliYyBbMjEvMzJdOiBPSwogICAgICAgICAgICAgICAgICAgICBib290bGluLXNoNC11
Y2xpYmMgWzIyLzMyXTogT0sKICAgICAgICAgICAgICAgICAgIGJvb3RsaW4tc3BhcmMtdWNsaWJj
IFsyMy8zMl06IE9LCiAgICAgICAgICAgICAgICAgIGJvb3RsaW4tc3BhcmM2NC1nbGliYyBbMjQv
MzJdOiBPSwogICAgICAgICAgICAgICAgICAgYm9vdGxpbi14ODYtNjQtZ2xpYmMgWzI1LzMyXTog
T0sKICAgICAgICAgICAgICAgICAgICBib290bGluLXg4Ni02NC1tdXNsIFsyNi8zMl06IE9LCiAg
ICAgICAgICAgICAgICAgIGJvb3RsaW4teDg2LTY0LXVjbGliYyBbMjcvMzJdOiBPSwogICAgICAg
ICAgICAgICAgICBib290bGluLXg4Ni1pNjg2LW11c2wgWzI4LzMyXTogT0sKICAgICAgICAgICAg
ICAgICAgYm9vdGxpbi14dGVuc2EtdWNsaWJjIFsyOS8zMl06IE9LCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGJyLWFybS1iYXNpYyBbMzAvMzJdOiBPSwogICAgICAgICAgICAgICAgICAgYnIt
YXJtLWZ1bGwtbm90aHJlYWQgWzMxLzMyXTogT0sKICAgICAgICAgICAgICAgICAgICAgYnItYXJt
LWZ1bGwtc3RhdGljIFszMi8zMl06IE9LCjMyIGJ1aWxkcywgMSBza2lwcGVkLCAxIGJ1aWxkIGZh
aWxlZCwgMCBsZWdhbC1pbmZvIGZhaWxlZCwgMCBzaG93LWluZm8gZmFpbGVkCgoKVGhlIGJ1aWxk
IGxvZyBmb3IgdGhlIG9uZSBmYWlsaW5nIGJ1aWxkIHNob3dzOgogICAgIEVSUk9SOiBVbmtub3du
IHRhcmdldCBuYW1lICdtaWNyb2JsYXplZWwtc29mdG1tdScKCkNoZWNraW5nIHRoZSBxZW11IGNv
bmZpZ3VyZSBzY3JpcHQsIGl0IGxvb2tzIGxpa2UgbWljcm9ibGF6ZS1zb2Z0bW11CmlzIHN1cHBv
cnRlZCwgYnV0IHRoZSBtaWNyb2JsYXplZWwtc29mdG1tdSB0YXJnZXQgd2FzIGRyb3BwZWQuIFRo
ZQpoaXN0b3J5IHNob3dzIHdoeS4KCgpjb21taXQgNDZhMjVhZTNmMGU3NWUyMzBjMDZlMjE0MzU4
NTBiMWNkMWM0NGYwNwpBdXRob3I6IFRob21hcyBIdXRoIDx0aHV0aEByZWRoYXQuY29tPgpEYXRl
OiAgIFRodSBGZWIgMjYgMDk6NDY6MDYgMjAyNiArMDEwMAoKICAgUmVtb3ZlIHRoZSBxZW11LXN5
c3RlbS1taWNyb2JsYXplZWwgdGFyZ2V0IGZyb20gdGhlIGJ1aWxkCgogICBJdCdzIGJlZW4gZGVw
cmVjYXRlZCBzaW5jZSB0d28gcmVsZWFzZXMsIHNvIGl0IHNob3VsZCBiZSBmaW5lIHRvCiAgIHJl
bW92ZSB0aGlzIG5vdy4gVXNlcnMgY2FuIHVzZSB0aGUgcWVtdS1zeXN0ZW0tbWljcm9ibGF6ZSBi
aW5hcnkKICAgaW5zdGVhZCB0aGF0IGNhbiBoYW5kbGUgYm90aCBlbmRpYW5uZXNzZXMgbm93LgoK
ICAgUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9y
Zz4KICAgU2lnbmVkLW9mZi1ieTogVGhvbWFzIEh1dGggPHRodXRoQHJlZGhhdC5jb20+CiAgIE1l
c3NhZ2UtSUQ6IDwyMDI2MDIyNjA4NDYwOC4xMTI1MS01LXRodXRoQHJlZGhhdC5jb20+CgoKVGhp
cyBjb21taXQgd2FzIGludHJvZHVjZWQgaW4gdjExLjAuMCwgYW5kIHRoaXMgZG9lcyBuZWVkIGZp
eGVkLCBzbwpJJ2xsIGdvIGFoZWFkIGFuZCByZXN1Ym1pdCB3aXRoIHRoYXQuCgpCZXN0IHJlZ2Fy
ZHMsCkpvc2VwaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
