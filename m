Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80339C25B10
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 10:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2891F832FF;
	Mon, 13 May 2024 10:55:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WXeS8ycL-41R; Mon, 13 May 2024 10:55:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1D488329E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1D488329E;
	Mon, 13 May 2024 10:55:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DEECC1BF3B0
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 10:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7A82415D6
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 10:55:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 77IKh7Dw9NP3 for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 10:55:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 41E6F415C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41E6F415C1
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 41E6F415C1
 for <buildroot@buildroot.org>; Mon, 13 May 2024 10:55:49 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2e576057c2bso26406181fa.1
 for <buildroot@buildroot.org>; Mon, 13 May 2024 03:55:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715597747; x=1716202547;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=96j1M0UMAfUzZoXRkzMdtjhiw2ROlsy5GpgIveI9D+Q=;
 b=aEsfx5/ibVgQGbbFvUHZGPgS7jhCvYInJL7rzFzLXp+dqeJekaFAVGf0Gz7lIpq8ge
 yJPLWetSvD+nIztL44fkJp4uz43f6HDwMREQW0KLFyZRsHojF5ebwTi1XD2yO0CE+mrX
 /gFg2PEx1mXM6V3Be/nOHSPypGVut7URGMTQoDJ/HWCNxd/XMCcKbxeR0OfWoVd3FED6
 jMqMh33M97jSWo+8w0YEAeB3STGqqecuOO/j3Flzrg58gH338wwYypCqLtOR2UdCjssP
 ZUqne6VjvJsdr0gC6hVAKFLUIlwq09VPMqViBV5jtKB+lqgPB9szTb2QgkGl7oGk4G2h
 5hwQ==
X-Gm-Message-State: AOJu0YxQrf9XbQqXT3gjG9L8k3QuO//iPzniaa06BkF4Q5ol5irooTSS
 U2jL7hJ1y2+RwHHqs5ezgcOQgjCtV0kcR//AtzWRNNh4X99B+j3ebsV1s0awxUXNRX98tgfl2WT
 neVGTmcdBpxCYiUrP0yag8mu6q05ayw==
X-Google-Smtp-Source: AGHT+IFzn+mlzbQ7FYV/HLBVOhrYdpRyz82II/JWdRLm0Y6NQIrFRXUEAefu3pHuksJ7XxgCV+fNw3sZ1qxg1daEFLU=
X-Received: by 2002:a2e:b0db:0:b0:2e5:566:c752 with SMTP id
 38308e7fff4ca-2e52039dc2fmr76834671fa.48.1715597746548; Mon, 13 May 2024
 03:55:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240310182439.441668-1-fontaine.fabrice@gmail.com>
 <20240510225353.43655bcb@windsurf>
In-Reply-To: <20240510225353.43655bcb@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 13 May 2024 12:55:34 +0200
Message-ID: <CAPi7W82M+y82NEq9g5srEcQ6cpE88JUMMq2K7yimaCPYVb8kZw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715597747; x=1716202547; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=96j1M0UMAfUzZoXRkzMdtjhiw2ROlsy5GpgIveI9D+Q=;
 b=PWulr1M6oiP/158TG/nsnim/AvnRnzuANF1AKmcLswATzdqeu4L8m+T+ljgwAZxGvL
 GjO5kxeQMhXHljafYa5EHLKbT0h3o97nnjNydiYu5C/L+BB7DAz78H6WYK7b2yh4Nu1Z
 TUtLYRr+Ch5EYRPwTTdDKihVvtnH91UMghAWkfuSLLKXa99fS3jQJKcrEOMoqhlvjnNQ
 TACShZmyn/jC0086yWoqMcq6JIKGsrf8SHYQmrMMZykwgOm9L/d0ueYCcDTJc6l0xwAV
 HVVqH3GzdKFLgEmHUJrNmkunkNIJ3nYzdPVjGGCtBAKxOsTSMoVrn7+eg3uZGnspqGcc
 +4AQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=PWulr1M6
Subject: Re: [Buildroot] [PATCH 1/1] package/openblas: fix build without MMU
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
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpMZSB2ZW4uIDEwIG1haSAyMDI0IMOgIDIyOjUzLCBUaG9tYXMgUGV0YXp6b25pCjx0
aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiBhIMOpY3JpdCA6Cj4KPiBPbiBTdW4sIDEwIE1h
ciAyMDI0IDE5OjI0OjM5ICswMTAwCj4gRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmlj
ZUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiBGaXggdGhlIGZvbGxvd2luZyBidWlsZCBmYWlsdXJl
IHdpdGhvdXQgTU1VOgo+ID4KPiA+IC9ob21lL2J1aWxkcm9vdC9hdXRvYnVpbGQvaW5zdGFuY2Ut
MS9vdXRwdXQtMS9ob3N0L3Jpc2N2NjQtYnVpbGRyb290LWxpbnV4LXVjbGliYy9iaW4vbGQucmVh
bDogdGVzdF9mb3JrLm86IGluIGZ1bmN0aW9uIGAuTDYnOgo+ID4gdGVzdF9mb3JrLmM6KC50ZXh0
KzB4MTIwKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgZm9yaycKPiA+Cj4gPiBhdXRvYnVpbGRl
ciBmYWlsdXJlIGlzIHJhaXNlZCBzaW5jZSB0aGUgYWRkaXRpb24gb2YgUklTQy1WIHN1cHBvcnQg
YnkKPiA+IGNvbW1pdCBjNzg5YmNkZGYwZmIxNzU4MGJlZjBjZGM0NWI1MzM0YTkwZWNkZjEzCj4g
Pgo+ID4gRml4ZXM6Cj4gPiAgLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0
cy9iOWQwOTdhZTA3N2YyY2I0MGZjNjBkZTk0YmYyNTQyMzYzNmFmMDA1Cj4gPgo+ID4gU2lnbmVk
LW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4g
PiAtLS0KPiA+ICAuLi5kaW5nLWFnYWluc3QtYW4tdUNsaWJjLXRoYXQtZG9lcy1ub3QucGF0Y2gg
fCAyOCArKysrKysrKysrKysrKysrKysrCj4gPiAgLi4uLXVjbGliYy10aGF0LWRvZXMtbm90LWlt
cGxlbWVudC1mb3JrLnBhdGNoIHwgMjggKysrKysrKysrKysrKysrKysrKwo+ID4gIDIgZmlsZXMg
Y2hhbmdlZCwgNTYgaW5zZXJ0aW9ucygrKQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdl
L29wZW5ibGFzLzAwMDItU2tpcC10aGUtZm9yay10ZXN0LXdoZW4tYnVpbGRpbmctYWdhaW5zdC1h
bi11Q2xpYmMtdGhhdC1kb2VzLW5vdC5wYXRjaAo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNr
YWdlL29wZW5ibGFzLzAwMDMtU2tpcC10ZXN0LXdoZW4tYnVpbGRpbmctd2l0aC1hLXVjbGliYy10
aGF0LWRvZXMtbm90LWltcGxlbWVudC1mb3JrLnBhdGNoCj4KPiBJdCBzZWVtcyBsaWtlIGZvbGxv
d2luZyB0aGUgYnVtcCBpbgo+IDU5YjQ4YjVjZmYwNTdmMjQyOWIxMTQzZDZmNTBjMzlkOTNjYThl
ZjMsIHRoZXNlIHBhdGNoZXMgYXJlIG5vIGxvbmdlcgo+IG5lZWRlZC4gQ291bGQgeW91IGNvbmZp
cm0/IEF0IGxlYXN0IHBhdGNoIDAwMDIgbm8gbG9uZ2VyIGFwcGxpZXMuCgpZZXMsIEkgY29uZmly
bSB0aGF0IGJvdGggcGF0Y2hlcyBhcmUgaW5jbHVkZWQgaW4gdmVyc2lvbiAwLjMuMjcuCgo+Cj4g
VGhhbmtzLAo+Cj4gVGhvbWFzCj4gLS0KPiBUaG9tYXMgUGV0YXp6b25pLCBDVE8sIEJvb3RsaW4K
PiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCj4gaHR0cHM6Ly9ib290bGlu
LmNvbQoKQmVzdCBSZWdhcmRzLAoKRmFicmljZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
