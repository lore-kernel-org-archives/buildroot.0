Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F44EEB564
	for <buildroot@archiver.kernel.org>; Sat,  9 Sep 2023 06:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6814C820EE;
	Sat,  9 Sep 2023 06:40:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6814C820EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yNIHvF43YNYh; Sat,  9 Sep 2023 06:40:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1BC482083;
	Sat,  9 Sep 2023 06:40:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1BC482083
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5F9491BF846
 for <buildroot@lists.busybox.net>; Sat,  9 Sep 2023 06:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4589160BD1
 for <buildroot@lists.busybox.net>; Sat,  9 Sep 2023 06:40:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4589160BD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QZx9A1dgo2J1 for <buildroot@lists.busybox.net>;
 Sat,  9 Sep 2023 06:40:53 +0000 (UTC)
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 69B4B607B4
 for <buildroot@buildroot.org>; Sat,  9 Sep 2023 06:40:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69B4B607B4
Received: by mail-qt1-x830.google.com with SMTP id
 d75a77b69052e-414d37bd1e9so20112351cf.3
 for <buildroot@buildroot.org>; Fri, 08 Sep 2023 23:40:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694241652; x=1694846452;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BllrR5NSo+hfY3LgOQuMav86hPh931flN7ukzzf/9UA=;
 b=kGGTZp1APLuOSp1iuhinqCBp9o6wpM6WuCEnYyl6fCDy8CxcJzq8OoY1H4O2AQV2Qa
 HGbihdQWLQh7sFwpo/0SPRl+tr2u0Kl/TourmpVoa2peosRCQDoY0XaX51etD4/LmzJE
 hZsqoA4VnibeoaAf/j5oxTqOXWRedbjkwyYuNABdq+InoS2Z9eacMJ0wjBIzg041hyG5
 Zv1kYyG7vBr/sEsz05uOFhdETVtZ7vID875j/JuDFapuWFCpBbPB/bU0iVWcXr+heVSQ
 iD2pGWaIhHS8USZNATX+oXa6luLHfYdvKnSrrrbwMtvCE0Cb1cNdFhI7hiGsa6ThbkfF
 pHzA==
X-Gm-Message-State: AOJu0YweZeo5EHsyXik+5l/e+XiOJpy2uB0IFnBxZ9S6sWgzkcgjkX76
 IqW0tgp9yNghAVi4a9SVO4ZueaHIFfMUo0cBlq0=
X-Google-Smtp-Source: AGHT+IFNCXN5unq0dOeGGVZUi40CqNid7ijPqkG7G7kc8UXgNmEh+7uTCl0uZ9reN3DKhUPwbA/KUz+JSIdibMzIQNc=
X-Received: by 2002:a05:622a:296:b0:403:ca55:6ac5 with SMTP id
 z22-20020a05622a029600b00403ca556ac5mr5426506qtw.18.1694241652028; Fri, 08
 Sep 2023 23:40:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230908192714.2716398-1-james.hilliard1@gmail.com>
 <20230908214620.0d515173@windsurf>
 <CADvTj4qEN2LesjKx3Ct20xgETaVUpzoVSMfG+3Y+FVF601X05w@mail.gmail.com>
 <20230909083131.12269b20@windsurf>
In-Reply-To: <20230909083131.12269b20@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 9 Sep 2023 00:40:39 -0600
Message-ID: <CADvTj4po4Yro4bGXucxCRoSdyYQ70aFn=RHRRHtzk7nA5EO-yA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694241652; x=1694846452; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BllrR5NSo+hfY3LgOQuMav86hPh931flN7ukzzf/9UA=;
 b=cDMKFmJc3IoSeiB8lR5t748WJ4Wq/0N8oSCXWOKQNK06+0+pvxu1wtVH+lXznKX9Ij
 YfpTqbXwPI8OHUTlg/thv6+Oac/arLfmCZCBPOYT7eJksGLhauPvH130xhok+Q1V6/p6
 cWg+t5TXNHgV0c2lDHn6bIWoRGaKoFSW/pG6+iGHfINmfAUMkWWZaQ9+pLXIFS81QJzx
 uekMhNW/tMCr+Yf9hJfFCV+35D8JC6aQ5iTKoOdUot5CSCUj0XHuZlnc4b6zIUEKcGn7
 PZbRIzUnEaH+aETQVIlX3zvbkj9K6I4yfIHmwrqoraURigvIWH+yWFcUlgyCEFqTLQz4
 ueDg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=cDMKFmJc
Subject: Re: [Buildroot] [PATCH 1/1] package/cog: bump to version 0.18.0
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
Cc: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU2F0LCBTZXAgOSwgMjAyMyBhdCAxMjozMeKAr0FNIFRob21hcyBQZXRhenpvbmkKPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCA4IFNlcCAyMDIzIDE0
OjU4OjIzIC0wNjAwCj4gSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+
IHdyb3RlOgo+Cj4gPiA+IFNob3VsZG4ndCB0aGlzIGhhdmUgYmVlbiBjaGFuZ2VkIHRvIC1Ec291
cDI9ZGlzYWJsZWQgYXMgcGFydCBvZiBjb21taXQKPiA+ID4gZGZmNjcxNzBmNzM5NTllNjgyNmVj
M2U4N2U4OTI3NDdmOGQzYTVmYiwgd2hpY2ggY2hhbmdlZCB3cGV3ZWJraXQgdG8KPiA+ID4gdXNl
IGxpYnNvdXAzIGluc3RlYWQgb2YgbGlic291cDIgPwo+ID4KPiA+IFRoZXJlIHdlcmUgYnVpbGQg
ZXJyb3JzLCB0aGUgdmVyc2lvbiBidW1wIHNlZW1zIHRvIGJlIHJlcXVpcmVkIHRvIHVzZSBsaWJz
b3VwMy4KPgo+IENvdWxkIHlvdSBwcm92aWRlIHRoZSBmYWlsaW5nIGRlZmNvbmZpZywgYW5kIHZl
cmlmeSBpbmRlZWQgdGhhdCB3aXRoCj4gLURzb3VwMj1kaXNhYmxlZCBpdCBkb2Vzbid0IHdvcmss
IHdpdGhvdXQgdGhlIHZlcnNpb24gYnVtcD8gV2Ugd2FudAo+IGp1c3RpZmljYXRpb25zIHRoYXQg
YXJlIG1vcmUgY29udmluY2luZyB0aGFuICJzZWVtcyB0byBiZSByZXF1aXJlZCIuCgpJIGhhZCB0
cmllZCB1c2luZyAtRHNvdXAyPWRpc2FibGVkIGJlZm9yZSBJIHNlbnQgdGhlIHVwZGF0ZSBhbHJl
YWR5LgoKSSBoaXQgYSBtaXNzaW5nIHN5bWJvbHMgaXNzdWUgcmVsYXRlZCB0byB0aGlzIHdoaWNo
IHdhcyBvbmx5IGFkZGVkIGluCnZlcnNpb24gMC4xNy4xOgpodHRwczovL2dpdGh1Yi5jb20vSWdh
bGlhL2NvZy9jb21taXQvYzdiZGI5Y2QzOTkxYjI5YWJlOWY0NTc0Njg1NDY3Zjc5ZDhmZWQzNApo
dHRwczovL2dpdGh1Yi5jb20vSWdhbGlhL2NvZy9wdWxsLzUyMgoKPgo+IFRoYW5rcyEKPgo+IFRo
b21hcwo+IC0tCj4gVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgo+
IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCj4gaHR0
cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
