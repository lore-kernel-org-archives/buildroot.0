Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA91C25B74
	for <buildroot@archiver.kernel.org>; Thu, 16 May 2024 20:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1164983A5A;
	Thu, 16 May 2024 20:38:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W4s-gn5VV39U; Thu, 16 May 2024 20:38:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 163F783BFB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 163F783BFB;
	Thu, 16 May 2024 20:38:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8D4011BF488
 for <buildroot@lists.busybox.net>; Thu, 16 May 2024 20:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 874EF61289
 for <buildroot@lists.busybox.net>; Thu, 16 May 2024 20:38:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xy2VxgiDZgQY for <buildroot@lists.busybox.net>;
 Thu, 16 May 2024 20:38:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CAF3161286
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAF3161286
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CAF3161286
 for <buildroot@buildroot.org>; Thu, 16 May 2024 20:38:16 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2e0a34b2899so17529071fa.3
 for <buildroot@buildroot.org>; Thu, 16 May 2024 13:38:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715891895; x=1716496695;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uWb9QxTaFqBm4Q+/f+ZjZcvHMuGIcOEgKqnownM62Xc=;
 b=lmTbIsuJ1EsAh1K9vY7h/KwfEAxl5nbsbUhnPYu9GHW1zQz4rRW3r24GILl8AwWnzR
 088DWbpIvluGoO0gCZkMhIjDN/S4IeJXrHY7xCULb4IbyzGtG72JF5pSQN+CGJxxxKwe
 wsDDK6rKAoyLsN7G230FofVUVBhxwua+RnehjiUn3MhftdXhVF6gRa4ul3XAgbSWPjbE
 2XeDy/T38XhhptmIlpv0G3qf4dGb1T6etiwu6p48LcO806/j7bPR13cP9QjQy3YyhfaZ
 9qRnwEFPq7/ax0oRP4738nrfxaU7BAMDVwzLmAUl9Bxpz3aZGdMXiTm6ixGpHl51AOqP
 V0eA==
X-Gm-Message-State: AOJu0YyZkaj9196oYI3BVEoR00VZIIbu196NFJgnAzbXr5ALf/lYi+SB
 aMS2bw9YTLNNcmisj6Bnfl33OeaCkBingh/jiRKJRQUBJRx8MYnQrJY0CnKT12CKk9Pgb2r+Nvt
 4JuhUULhmqrtO2yUMlX4BSEIdZLb6Tg==
X-Google-Smtp-Source: AGHT+IG9LM/NhquwS/KBo2mmJhC0dPSxjeEI+Cm2RpZVgU1PAnt5Pq+59Yl+WvCboRUDzjxpNwUK3zdZj2AjbUZvxyo=
X-Received: by 2002:a2e:a98d:0:b0:2dd:cb34:ddbc with SMTP id
 38308e7fff4ca-2e5205c8fc4mr224310611fa.48.1715891894377; Thu, 16 May 2024
 13:38:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240516163245.641115-1-fontaine.fabrice@gmail.com>
 <20240516212558.035e6aed@fedora>
In-Reply-To: <20240516212558.035e6aed@fedora>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 16 May 2024 22:38:02 +0200
Message-ID: <CAPi7W82JFSf9FFB1-RqdLNcbAOKS2A9KGo6Epef4z6ng6xE8aw@mail.gmail.com>
To: Thomas Huth <huth@tuxfamily.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715891895; x=1716496695; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uWb9QxTaFqBm4Q+/f+ZjZcvHMuGIcOEgKqnownM62Xc=;
 b=TuAxYYo/HYOyqPFGjm4QA7uMKWbQMt8XoMakHqnABqY8603W3q2+SPj1L39pNP4n9V
 kXDJZ8J/q938xargB62z2gfTQlN/eggkjAYqCG6L8L+kxc1hDT/UU2v/oK2Cjamn52wc
 r2OnkJFYMT+97DmpFEV8jgQ5TJytrUZebDQ82s+wz0uhOfa0LQVAgmS2A5aOImdLFo4g
 +2uOJPsSRyYcdS7ICbxj7HbT1emX4yBxZ4nrpdLbwCoR1dVmZd0nz7U6YDOW+gSkQUxK
 mVGH1tIvbu2zfh8iH05v7MMepjhxRKrtBmouBxZWX4ETDBmg9xLkPOgS1V6fvBs8xzuP
 RdZA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TuAxYYo/
Subject: Re: [Buildroot] [PATCH 1/1] package/frotz: fix build with gcc 14
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgamV1LiAxNiBtYWkgMjAyNCDDoCAyMToyNiwgVGhvbWFzIEh1dGggPGh1dGhAdHV4ZmFtaWx5
Lm9yZz4gYSDDqWNyaXQgOgo+Cj4gQW0gVGh1LCAxNiBNYXkgMjAyNCAxODozMjo0NSArMDIwMAo+
IHNjaHJpZWIgRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Ogo+
Cj4gPiBEcm9wIC1zdGQ9Yzk5IGZyb20gQ0ZMQUdTIHRvIGF2b2lkIHRoZSBmb2xsb3dpbmcgYnVp
bGQgZmFpbHVyZSB3aXRoIGdjYwo+ID4gMTQ6Cj4gPgo+ID4gZmFzdG1lbS5jOiBJbiBmdW5jdGlv
biAnel9yZXN0b3JlJzoKPiA+IGZhc3RtZW0uYzo4NDI6MzY6IGVycm9yOiBpbXBsaWNpdCBkZWNs
YXJhdGlvbiBvZiBmdW5jdGlvbiAnc3RyZHVwJzsgZGlkIHlvdSBtZWFuICdzdHJjbXAnPyBbLVdp
bXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KPiA+ICAgODQyIHwgICAgICAgICAgICAgICAg
IGZfc2V0dXAuYXV4X25hbWUgPSBzdHJkdXAoZGVmYXVsdF9uYW1lKTsKPiA+ICAgICAgIHwgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn4KPiA+ICAgICAgIHwgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJjbXAKPgo+IEknbSBwcmV0dHkgc3VyZSB0
aGVyZSB3YXMgb3JpZ2luYWxseSB3YXMgYSByZWFzb24gZm9yIHVzaW5nIC1zdGQ9Yzk5IGhlcmUK
PiAuLi4gY291bGQgd2UgbWF5YmUgdXNlIC1zdGQ9Z251OTkgaW5zdGVhZCBvZiByZW1vdmluZyBp
dD8KClN1cmUsIEknbGwgbGV0IHlvdSB0ZXN0IGl0IGFuZCBzZW5kIGEgdjIgOy0pCgo+Cj4gIFRo
b21hcwoKQmVzdCBSZWdhcmRzLAoKRmFicmljZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
