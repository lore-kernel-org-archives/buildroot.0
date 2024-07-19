Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C596C3DA5D
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 03:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20128401CE;
	Fri, 19 Jul 2024 03:37:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id faUHDylVml13; Fri, 19 Jul 2024 03:37:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8ADA40266
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8ADA40266;
	Fri, 19 Jul 2024 03:37:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 168D61BF315
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 03:37:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10B9A40329
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 03:37:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bkWoXoqm2ZQK for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 03:37:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e33; helo=mail-vs1-xe33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D954040146
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D954040146
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [IPv6:2607:f8b0:4864:20::e33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D954040146
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 03:37:24 +0000 (UTC)
Received: by mail-vs1-xe33.google.com with SMTP id
 ada2fe7eead31-48ffd139a9cso519729137.0
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 20:37:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721360243; x=1721965043;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ob8xpRUx4OeE9MWEPGcVe2BxPt4+NJnf6UjeyHAi0RE=;
 b=Yl4a4NG7Bs6lblhUyhB4UMNni007XPM+6IPWz5X/WyISe5RnuGttXHcjR1mPdyViha
 i2nOjHyA+osx5FYLQzY69y43pmj89YLg16d+blaMoQ8EWkdSAnFr7x2gzvR4+8ig6q1K
 yxXik8tm/lvoGs13IMP9p5GdYeIZnvPM6BpzbBhBT5KE2oJEMTrIjdZrAymB7SeHhzEM
 d20f1JruTz767N1E2Pcecc1mZX9cIlZimxnJ+/J80m+MNCJuE4scz15DjdGin+kHSBt3
 UjqjKJbWy4wA88f7WMIuDhX81sQmI5/+TH0auYgFh9fRE2bXafTos/a+jzv5ygAdwJFC
 doDg==
X-Gm-Message-State: AOJu0YzeLaHTsyzcXyiJy9UQmyDFz+b5bPN2Njef+gsuG4ueHKEzmJ1p
 hXHUG/YueznWuTm87jkDXIor4tJ8WNbw4ZJJd27+800qNwxW8zh63MccOjrEZmrL/hWaqlOOXOo
 9S3D6RRn21xJPfKhGF4wIkNYY61Ld+AJZ
X-Google-Smtp-Source: AGHT+IGmAn8zzfyOvS+NMvdMuv78x1kL7+DbDtHCDlsPqJYjEehy+0WsQG3TdDVPxx2ZXTJhwy7O0Y6cPTmOd9vj1no=
X-Received: by 2002:a05:6102:5715:b0:48f:e6e0:7c04 with SMTP id
 ada2fe7eead31-491595f1bc9mr9258516137.0.1721360243262; Thu, 18 Jul 2024
 20:37:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240719030537.3156999-1-james.hilliard1@gmail.com>
 <CA+h8R2qXX_Xw0CseHvZ25JQF6H_AouHuFSf0xwkcQEdfqfF8JQ@mail.gmail.com>
In-Reply-To: <CA+h8R2qXX_Xw0CseHvZ25JQF6H_AouHuFSf0xwkcQEdfqfF8JQ@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 18 Jul 2024 21:37:11 -0600
Message-ID: <CADvTj4qLgVGHf9fx9GaRLn1HAbhDh8+tWtsWtaOZ4ynQZB7+xg@mail.gmail.com>
To: Christian Stewart <christian@aperture.us>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721360243; x=1721965043; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ob8xpRUx4OeE9MWEPGcVe2BxPt4+NJnf6UjeyHAi0RE=;
 b=S31qFOGMaPgUucNrnpG7P6fEFUV0r1UPcwZztqZAK/Qp5XK736k85xTE5w+cuXMH7W
 veFi/6YYHpBxNHhGoZG4A7/yAWYsNSIFeiGn+ArNpvh4PpKX/J0LQEEjF7cl3PcM882j
 JMyOe3AA51+OnWjWDqbMIsMeBMFu3iDj8AiD/6i/Jcqx18fCpexpTDQLomIj3Yy2prJQ
 Uy5ewSpA6H++07x2yIfKzJbILNk3rOUx8Ao0H9Bxz3k3saz2iRLmUGAP7MMdxiSXRXx0
 /gvcehbwUMKrm1TMfHcJjfglWtXWnXww0Bhy7gjl3YrI5AGLDJQR07ODq91UdgyVyGBs
 SG5A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=S31qFOGM
Subject: Re: [Buildroot] [PATCH 1/2] package/pkg-golang.mk: allow packages
 to override download GOPROXY
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
Cc: Anisse Astier <anisse@astier.eu>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCBKdWwgMTgsIDIwMjQgYXQgOToyNuKAr1BNIENocmlzdGlhbiBTdGV3YXJ0IDxjaHJp
c3RpYW5AYXBlcnR1cmUudXM+IHdyb3RlOgo+Cj4gSGkgSmFtZXMsCj4KPiBPbiBUaHUsIEp1bCAx
OCwgMjAyNCBhdCA4OjA14oCvUE0gSmFtZXMgSGlsbGlhcmQKPiA8amFtZXMuaGlsbGlhcmQxQGdt
YWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gU29tZSBwYWNrYWdlcyBsaWtlIHRoZSB1cGNvbWluZyB0
YWlsc2NhbGUgcGFja2FnZSBuZWVkIHRvIHNldCBHT1BST1hZCj4gPiB0byBnZXQgdGhlIGNvcnJl
Y3QgZGVwZW5kZW5jaWVzLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEphbWVzIEhpbGxpYXJkIDxq
YW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgo+Cj4KPiBJIGFtIGNvbmZ1c2VkLCB3aHkgZG9lcyB0
aGUgdGFpbHNjYWxlIHBhY2thZ2UgbmVlZCB0aGlzPwo+Cj4gSWYgR09QUk9YWSBpcyBzZXQgdG8g
ZGlyZWN0IGl0IHNob3VsZCBnbyB0byB0aGUgZ28gbW9kdWxlIHNlcnZlci4KPgo+IFdoZW4gSSBi
dWlsZCB0YWlsc2NhbGUgZnJvbSBzb3VyY2Ugd2l0aCBHT1BST1hZPWRpcmVjdCBpdCB3b3JrcyBm
aW5lOgo+Cj4gZ2l0IGNsb25lIGh0dHBzOi8vZ2l0aHViLmNvbS90YWlsc2NhbGUvdGFpbHNjYWxl
Cj4gY2QgdGFpbHNjYWxlCj4gZXhwb3J0IEdPUFJPWFk9ZGlyZWN0Cj4gZ28gbW9kIHZlbmRvcgo+
ICMgd29ya3MKCldlaXJkLCBkb2Vzbid0IHdvcmsgZm9yIG1lLCBJIGdldDoKdmVyaWZ5aW5nIGZ5
YnJpay5pby9jcmRvY0B2MC42LjM6IGNoZWNrc3VtIG1pc21hdGNoCiAgICBkb3dubG9hZGVkOiBo
MTpBd2krditVUnRqNUR2UHIwTExkVnJXMk5uOS9HMVk3YUdwVVBHMUlBVEU0PQogICAgZ28uc3Vt
OiAgICAgaDE6ak5OQVZJTnU4dXA1dnJMYTBqclY3ejdIU2x5SEYvNmxOT3JBdHJYd1lsST0KClNF
Q1VSSVRZIEVSUk9SClRoaXMgZG93bmxvYWQgZG9lcyBOT1QgbWF0Y2ggYW4gZWFybGllciBkb3du
bG9hZCByZWNvcmRlZCBpbiBnby5zdW0uClRoZSBiaXRzIG1heSBoYXZlIGJlZW4gcmVwbGFjZWQg
b24gdGhlIG9yaWdpbiBzZXJ2ZXIsIG9yIGFuIGF0dGFja2VyIG1heQpoYXZlIGludGVyY2VwdGVk
IHRoZSBkb3dubG9hZCBhdHRlbXB0LgoKRm9yIG1vcmUgaW5mb3JtYXRpb24sIHNlZSAnZ28gaGVs
cCBtb2R1bGUtYXV0aCcuCgo+Cj4gQWNjb3JkaW5nIHRvIHRoZSBHbyBzcGVjLCBpdCBzaG91bGQg
YWx3YXlzIGJlIHBvc3NpYmxlIHRvIGRvd25sb2FkCj4gd2l0aCBkaXJlY3QgYWx3YXlzLgo+Cj4g
SSB3b3VsZCBzdHJvbmdseSByZWNvbW1lbmQgbm90IG92ZXJyaWRpbmcgdGhpcyBwZXItcGFja2Fn
ZS4KPgo+IEJlc3QgcmVnYXJkcywKPiBDaHJpc3RpYW4gU3Rld2FydApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
