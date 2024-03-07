Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9807EC54798
	for <buildroot@archiver.kernel.org>; Thu,  7 Mar 2024 17:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F2DB40717;
	Thu,  7 Mar 2024 17:18:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6vCJCgGMiEDt; Thu,  7 Mar 2024 17:18:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7D8B418E7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7D8B418E7;
	Thu,  7 Mar 2024 17:18:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D56341BF396
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 17:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C1691418E7
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 17:18:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q0wIAjlEI_pZ for <buildroot@lists.busybox.net>;
 Thu,  7 Mar 2024 17:18:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 86F3740717
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86F3740717
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 86F3740717
 for <buildroot@buildroot.org>; Thu,  7 Mar 2024 17:18:38 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2d228a132acso14834381fa.0
 for <buildroot@buildroot.org>; Thu, 07 Mar 2024 09:18:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709831916; x=1710436716;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NJUQLY8sYjd1iJM87Z6nqKmWdJe2OYke59nOApqI7YU=;
 b=CPcfpagLgMyMbRL0hGxMvb8bGLemd2O4Jl56YTJxlJUW5bEDyH92WD9j3tr8xnXgrx
 3HvVNUwnY2uW+Vf4nxSLqqXET1R4x7mwmpEv+B2a3mTA6Gu3XSENliEId3Bl2dSAnl4v
 qJN3oeUn2pQICUCGmbjwuLnOlfzz3evmOP+Txb1fjl9d8OfPX40HUXSeuWM6Ol13O3pP
 XBehLN0x3PpfeswV9o/DnPIcj9FIE80oaw3OcY/LwaDWp21Ruv9KpETySLUGJkJQ1wls
 Gmlt7i20uvGexE3kF+X2KbHQNTc3/Ga9wYLz5mQXK9ShmnhP5bgzEvD1qZCFTraSvqR4
 QsPA==
X-Gm-Message-State: AOJu0YxMZrWrC9chvKAGrOdfsa+oGLI1qFLDHdk2cUqfz9Dno+HEDBxV
 qXJ+c6o+o2gXHnvc3U5ih93AYYeOMZJ/RgDprf9q55EvuW9d6770OHjLgjiynAmqTCSob1ixXBI
 OnWXMIMTXMhMNl2umDsFGgnJpl4c=
X-Google-Smtp-Source: AGHT+IFtR9f7q0Xmw5aA0bzJXxbxsgslSULUbMXomq+DLSzY72cbaySzBHuJelSIMNqxGa54NN/gP0RxHO85T3XTBwE=
X-Received: by 2002:a2e:8756:0:b0:2d3:ffec:7836 with SMTP id
 q22-20020a2e8756000000b002d3ffec7836mr2337103ljj.10.1709831915858; Thu, 07
 Mar 2024 09:18:35 -0800 (PST)
MIME-Version: 1.0
References: <20240307122806.102726-1-fontaine.fabrice@gmail.com>
 <20240307134916.32738b5e@windsurf>
In-Reply-To: <20240307134916.32738b5e@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 7 Mar 2024 18:18:24 +0100
Message-ID: <CAPi7W803mjZL9-rRu2wdcG=5t=D1wtDJET2S_SHfjCc_uvViVA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709831916; x=1710436716; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NJUQLY8sYjd1iJM87Z6nqKmWdJe2OYke59nOApqI7YU=;
 b=ONcrdDpQ03Qy0g0G1a7cu3WBbjBChP3aXGmN5kNUYwoXTnMdqVcNVNZ5hxd9jnTAVv
 JwokjiI38Z0jRjDYR4/AhRr/2I8f0fQ+zYTFDp3uxDLxYRk0iFXHvauprmckfF8pioqB
 uVVaVnfmmSvPTvp5lK9lhOL9VcCqBnY8dM5kM5RYyQLuzkwsIElfTrkXfGDbPbJF7t6O
 Td8/faIbN/YRyQwFpk79t09+8KlEw4Im36Fam+qKIfznHZ1JCYbPAAO7Fan38Pvfe7if
 pDpqcOncDJyxf9wZX1Z2yarzlQI54P4O1ip3IYCIER0Z598v4ideF1QgriSjRXApZHMK
 FhwQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ONcrdDpQ
Subject: Re: [Buildroot] [PATCH 1/1] toolchain/Config.in: enable libatomic
 with BR2_BINFMT_FLAT
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpMZSBqZXUuIDcgbWFycyAyMDI0IMOgIDEzOjQ5LCBUaG9tYXMgUGV0YXp6b25pCjx0
aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiBhIMOpY3JpdCA6Cj4KPiBIZWxsbyBGYWJyaWNl
LAo+Cj4gT24gVGh1LCAgNyBNYXIgMjAyNCAxMzoyODowNiArMDEwMAo+IEZhYnJpY2UgRm9udGFp
bmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPiB3cm90ZToKPgo+ID4gRW5hYmxlIGxpYmF0
b21pYyB3aXRoIEJSMl9CSU5GTVRfRkxBVCB0byBhdm9pZCB0aGUgZm9sbG93aW5nIGJ1aWxkCj4g
PiBmYWlsdXJlIHdpdGggbGlib3BlbnNzbCBhbmQKPiA+IEJSMl9UT09MQ0hBSU5fRVhURVJOQUxf
Qk9PVExJTl9BUk1WN01fVUNMSUJDX1NUQUJMRToKPiA+Cj4gPiAvaG9tZS9idWlsZHJvb3QvYXV0
b2J1aWxkL3J1bi9pbnN0YW5jZS0yL291dHB1dC0xL2hvc3Qvb3B0L2V4dC10b29sY2hhaW4vYXJt
LWJ1aWxkcm9vdC11Y2xpbnV4LXVjbGliY2dudWVhYmkvYmluL2xkLnJlYWw6IC4vbGliY3J5cHRv
LmEobGliY3J5cHRvLWxpYi10aHJlYWRzX3B0aHJlYWQubyk6IGluIGZ1bmN0aW9uIGBDUllQVE9f
YXRvbWljX29yJzoKPiA+IHRocmVhZHNfcHRocmVhZC5jOigudGV4dCsweGZhKTogdW5kZWZpbmVk
IHJlZmVyZW5jZSB0byBgX19hdG9taWNfaXNfbG9ja19mcmVlJwo+ID4KPiA+IEluZGVlZCwgYm9v
dGxpbiBhcm12N20gaXMgYW4gdWNsaWJjIHRvb2xjaGFpbiBjb21waWxlZCB3aXRoIGF0b21pYwo+
ID4gc3VwcG9ydCB0aHJvdWdoIGxpYmF0b21pYwo+ID4KPiA+IFRoaXMgYnVpbGQgZmFpbHVyZSBp
cyBwcm9iYWJseSByYWlzZWQgc2luY2UgYWN0aXZhdGlvbiBvZiB0aHJlYWRzIGluCj4gPiBzdGF0
aWMgYnVpbGRzIGJ5IGNvbW1pdCBlYTNlNjAyMjliYzU2NDdlNTg3Njg1MDIzZGU0NzUyNzZlMjg1
ODRkCj4gPgo+ID4gRml4ZXM6Cj4gPiAgLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcv
cmVzdWx0cy9kMjVlODk4Zjk3MTViZjZhMjEyODQ4MDczNjFhNTc3MzVhN2EyZTFkCj4gPiAgLSBo
dHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy9lMzdlZDVhZDZiYTQxZDYxMGJm
ZmU5YzIzNGY2OTllMjAzZWY1MDY5Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250
YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4KPiBUaGFua3MgZm9yIHRoZSBwYXRj
aC4gRG8gd2Uga25vdyBzaW5jZSB3aGVuIHRoZXJlIGlzIHN1cHBvcnQgZm9yCj4gbGliYXRvbWlj
IGZvciBwbGF0Zm9ybXMgdGhhdCB1c2UgdGhlIEZMQVQgYmluYXJ5IGZvcm1hdD8gSXMgdGhpcwo+
IHNwZWNpZmljIHRvIEFSTS9GTEFULCBvciBhcHBsaWNhYmxlIHRvIGFsbCBjb25maWd1cmF0aW9u
cyB0aGF0IHVzZSB0aGUKPiBGTEFUIGJpbmFyeSBmb3JtYXQ/CgpOb3BlLCBJIGRvbid0IGtub3cu
IEkgZGlkbid0IGZpbmQgYW55IGNsdWUgaW4gdWNsaWJjLW5nIGdpdGh1YiBoaXN0b3J5LgoKPgo+
IFRob21hcwo+IC0tCj4gVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxp
bgo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCj4g
aHR0cHM6Ly9ib290bGluLmNvbQoKQmVzdCBSZWdhcmRzLAoKRmFicmljZQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
