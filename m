Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3231FC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 02:32:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 262316103B
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 02:32:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 262316103B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E6A8402CA;
	Mon, 27 Sep 2021 02:32:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id psK_aMOgUeIo; Mon, 27 Sep 2021 02:32:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0864F402CE;
	Mon, 27 Sep 2021 02:32:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3AA661BF34F
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 02:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2AA2081ADE
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 02:32:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=jms.id.au
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fYGZvc3-8hjm for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 02:32:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 13D3181AAB
 for <buildroot@busybox.net>; Mon, 27 Sep 2021 02:32:07 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id q81so31559319qke.5
 for <buildroot@busybox.net>; Sun, 26 Sep 2021 19:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JTt4D9VoNsiXDMwYMVZDeT/Y7fHsx24vPaFnJtO3z88=;
 b=Puh9x/v0SFOx5HtfNST5j4BJev5pMv3V249eGZYOjLNTZhxLnPEUOiy6WONXsfJ79Y
 jedFD0QtLTi2ENZxkENRlyATiC/+BZGKaNXhQAeCF+yn8K/4dIeTClzZrft3zq4r9FT+
 tQMtfh5g4Kqhc3e2iZIy+dIZLFIa6RajdO+Ng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JTt4D9VoNsiXDMwYMVZDeT/Y7fHsx24vPaFnJtO3z88=;
 b=NLwSJW6qQB5oPwQEqVaMNwmWDE8AESbTWKG2KjxozJ/8fXMJ/yWULFsO1eIzjRR2lz
 wWfHikecOh/BhuxA1zgcZyIOuRohHRGdSLg2RKY/2wyEJBFzmpdADkJ25CTqLG1cbe4f
 /+/657cMTdFrHh65YHkTc+1d0TFfCiXi0VZSwSCBwWnfREBrni9hbZQl8mjEri6b3kgm
 aIrTzH/abAtUr0h9aAqWOgSswRJHjPYqhXXDMWqfW1XDcE9s2lxbBGPSZ6ASRgTVhPMA
 sMu9FiyCnM3maGPCgcDwEGutHQUxkQk6CCg+8tb8EBc+N59DDwRCV3AFhAnoYafk+KCe
 EA9Q==
X-Gm-Message-State: AOAM530X0HNAEtpt5BaF3gfMMbedEDZPj5EwL/DO8HUyqedReraXj9Ve
 uW9nexlcNQJe9OOtthRThmF+ytfs2f6uz+E00vI=
X-Google-Smtp-Source: ABdhPJz3PkR+5+ab262NJrDlLecTNrEJsGbGhRBJEOdGrkBttKVjZXPFWZP09LmGe+/4CUvmmvqEVk9x3qU8r5OUGqQ=
X-Received: by 2002:a37:4c5:: with SMTP id 188mr22267883qke.291.1632709925632; 
 Sun, 26 Sep 2021 19:32:05 -0700 (PDT)
MIME-Version: 1.0
References: <877dfyrwao.fsf@dell.be.48ers.dk>
 <30117DCC-D442-43F5-8388-384C8EE48769@benettiengineering.com>
 <8735qlswc0.fsf@dell.be.48ers.dk>
In-Reply-To: <8735qlswc0.fsf@dell.be.48ers.dk>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 27 Sep 2021 02:31:53 +0000
Message-ID: <CACPK8XeWmhxOoXT0XUHkjgygnvvA0Rr0bMRCR-2UVPDz3gEKcg@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Subject: Re: [Buildroot] What's wrong with patchwork
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
Cc: buildroot@busybox.net, Stephen Rothwell <sfr@canb.auug.org.au>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jeremy Kerr <jk@ozlabs.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCAzIFNlcHQgMjAyMSBhdCAxMjowMCwgUGV0ZXIgS29yc2dhYXJkIDxwZXRlckBrb3Jz
Z2FhcmQuY29tPiB3cm90ZToKPiAgPiBNYXliZSBvdGhlciBwYXRjaGVzIGhhdmUgYmVlbiBsb3N0
IG9uIHBhdGNod29yay4gSSBkb27igJl0IGtub3cgaWYKPiAgPiBwYXRjaHdvcmsgd29ya3MgaW4g
cG9sbGluZyBvciB0cmlnZ2VyaW5nLgo+Cj4gVGhlIHdheSBpdCB3b3JrcyBpcyB0aGF0IHBhdGNo
d29yayBpcyBzdWJzY3JpYmVkIHRvIHRoZSBsaXN0IGFuZCBsb29rcwo+IGZvciBwYXRjaGVzIGlu
IHRoZSBtYWlscy4gSWYgaXQgZGlkbid0IHJlY2VpdmUgdGhlIG1haWwgd2l0aCB0aGUgcGF0Y2gK
PiB0aGVuIGl0IHdpbGwgbm90IHNob3cgdXAuCj4KPiBTb3JyeSBmb3IgdGhlIHRyb3VibGUuCgpJ
dCBsb29rcyBsaWtlIHRoZSBsaXN0LWlkIGNoYW5nZWQgYWdhaW4gb3ZlciB0aGUgd2Vla2VuZC4g
SXQgaXMgbm93OgoKIGJ1aWxkcm9vdC5idWlsZHJvb3Qub3JnCgpodHRwczovL2xvcmUua2VybmVs
Lm9yZy9idWlsZHJvb3QvMjAyMTA5MjYyMTI1NTYuOTE1MjMxLTEtZm9udGFpbmUuZmFicmljZUBn
bWFpbC5jb20vcmF3CgpKZXJlbXksIEkgdGhpbmsgcGF0Y2h3b3JrIG5lZWRzIHRvIGJlIHVwZGF0
ZWQgYWdhaW4uCgpDaGVlcnMsCgpKb2VsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
