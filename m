Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E002AC3DA6E
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 06:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98B9881919;
	Wed,  3 Jan 2024 06:37:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98B9881919
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id whG8OnV1mcwy; Wed,  3 Jan 2024 06:37:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D594581A46;
	Wed,  3 Jan 2024 06:37:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D594581A46
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D4CD81BF346
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 06:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6B9760E59
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 06:37:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6B9760E59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rHzJ3xYmMbx0 for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 06:37:38 +0000 (UTC)
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 84FBC60B91
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 06:37:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84FBC60B91
Received: by mail-qt1-x832.google.com with SMTP id
 d75a77b69052e-427e59202ceso47416431cf.0
 for <buildroot@buildroot.org>; Tue, 02 Jan 2024 22:37:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704263857; x=1704868657;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XWP+i9wzArD15uI0Y1YaEV+6m1I+movg8U8iPn+ZMTY=;
 b=BPB7UTeQ96BeUFE20dgT3nZ4xq/ParagzMcste10Qs8FAvXAKGIMqclVRjbirIz0Uw
 jcwYF1c2tEl+8Tx4PDpxJOrC3ucKJOYpdlCYW94RbdzhA72Jhnl2W3+si+oxtbKs24h7
 QODe/M8+pIn0Y0K+YsTCNz22m4L0u7BD8J27YaAe8mEIC68jxQAr4L4wkgRV9Nk9evag
 2vfzr5/njfDxO8wujDp0pobpcpWcLBudagV+LExXa0762c1WYFmS/tW5Fi9LzJ/H+CZx
 N1/R2AP036u3ZpYmPgvi7rh+Y3DxcOnFCwt0skTpwfPazsMM/mvZHIBSqg7f1qy+JErN
 6haQ==
X-Gm-Message-State: AOJu0Yyql0i8iaGRcFTVCzRCyqKS+MAfXnzCqr/xEWv7BlifuT7IeAcH
 W9NcQGyGZw6hSUo7d5AXIylFtX/Rfm44YmOcLeE=
X-Google-Smtp-Source: AGHT+IFJ88mol2ICnJHWbeksE25Kd9BrzHCzW6nEpIlb677c8+y77niC/+TUQrQE3x9pmnOdlR++DLgjONS3XGrafCw=
X-Received: by 2002:a05:622a:346:b0:427:8dcb:291 with SMTP id
 r6-20020a05622a034600b004278dcb0291mr29975121qtw.12.1704263857229; Tue, 02
 Jan 2024 22:37:37 -0800 (PST)
MIME-Version: 1.0
References: <20231214091504.101102-1-james.hilliard1@gmail.com>
 <20231214091504.101102-3-james.hilliard1@gmail.com> <ZX4dxwczHBn-WgqK@landeda>
In-Reply-To: <ZX4dxwczHBn-WgqK@landeda>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 2 Jan 2024 23:37:24 -0700
Message-ID: <CADvTj4rRgiWE=jZVOtJZPks9ViRGJhERj1E-my3CeY_b-g9QjQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704263857; x=1704868657; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XWP+i9wzArD15uI0Y1YaEV+6m1I+movg8U8iPn+ZMTY=;
 b=Ex9Iv24gqD7WF4RZQG6Xv1vFnGQsH5AiI26AymnFNu3Gof1ZUzcUh8et+pFEvJl9p8
 q3374x+xz40nzWyEvsc4eOJfiSfS5GpGZkB3V+2NCHZFwU6ClgEZdikhzKsCIYved3pW
 BPXv2owz1eva9ZeTfejGSxt+U+88bXJkPTLfwYM+avJV8Ai1SNBDcG3YhUB+gEvCw4/4
 ZESGJXZKLUUxp7CA7qceAwApJQ3sB9IqoO781Jto9R6DFHdlzo+gVoo9aLh3AOHImCQH
 cAEee904iH/N5l2uD4FPfgFtcFAval55cNwFhelWy9zgoVvGX66pOq+Cb2xFHg+tMa7Q
 k0mw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Ex9Iv24g
Subject: Re: [Buildroot] [PATCH 3/4] package/python-pypika-tortoise: new
 package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU2F0LCBEZWMgMTYsIDIwMjMgYXQgMjo1OeKAr1BNIFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9y
aW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPgo+IEphbWVzLCBBbGwsCj4KPiBPbiAyMDIzLTEyLTE0
IDAyOjE1IC0wNzAwLCBKYW1lcyBIaWxsaWFyZCBzcGFrZSB0aHVzbHk6Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPiA+IC0tLQo+
IFstLVNOSVAtLV0KPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1weXBpa2EtdG9ydG9p
c2UvcHl0aG9uLXB5cGlrYS10b3J0b2lzZS5tayBiL3BhY2thZ2UvcHl0aG9uLXB5cGlrYS10b3J0
b2lzZS9weXRob24tcHlwaWthLXRvcnRvaXNlLm1rCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+
ID4gaW5kZXggMDAwMDAwMDAwMC4uODRhYTE5Y2ZiYgo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysr
IGIvcGFja2FnZS9weXRob24tcHlwaWthLXRvcnRvaXNlL3B5dGhvbi1weXBpa2EtdG9ydG9pc2Uu
bWsKPiA+IEBAIC0wLDAgKzEsMTUgQEAKPiA+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ID4g
KyMKPiA+ICsjIHB5dGhvbi1weXBpa2EtdG9ydG9pc2UKPiA+ICsjCj4gPiArIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMKPiA+ICsKPiA+ICtQWVRIT05fUFlQSUtBX1RPUlRPSVNFX1ZFUlNJT04gPSAw
LjEuNgo+ID4gK1BZVEhPTl9QWVBJS0FfVE9SVE9JU0VfU09VUkNFID0gcHlwaWthLXRvcnRvaXNl
LSQoUFlUSE9OX1BZUElLQV9UT1JUT0lTRV9WRVJTSU9OKS50YXIuZ3oKPiA+ICtQWVRIT05fUFlQ
SUtBX1RPUlRPSVNFX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2Fn
ZXMvODYvNTUvMWJmZDQxNTBmNjY0ZDJlMDdiMzZjOGY0NDIxNzhjYzFmNzE3YmI5YWU2Y2FlMjBm
MjFlODUxYzIwOGM2Cj4gPiArUFlUSE9OX1BZUElLQV9UT1JUT0lTRV9TRVRVUF9UWVBFID0gcGVw
NTE3Cj4gPiArUFlUSE9OX1BZUElLQV9UT1JUT0lTRV9MSUNFTlNFID0gQXBhY2hlLTIuMAo+ID4g
K1BZVEhPTl9QWVBJS0FfVE9SVE9JU0VfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKPiA+ICtQWVRI
T05fUFlQSUtBX1RPUlRPSVNFX0RFUEVOREVOQ0lFUyA9IGhvc3QtcHl0aG9uLXBvZXRyeS1jb3Jl
Cj4KPiBTaG91bGRuJ3Qgd2Ugc3RhcnQgaGFuZGxpbmcgYWxsIHRoZSB2YXJpb3VzIGJhY2tlbmRz
IGFzIHNldHVwIHR5cGVzLAo+IGluc3RlYWQ/CgpZZWFoLCBJJ3ZlIGJlZW4gcGxhbm5pbmcgdG8g
ZG8gdGhhdCBvbmNlIGFsbCBvdXIgcHl0aG9uIGJ1aWxkIGJhY2tlbmRzIGFyZQpwZXA1MTcgYmFz
ZWQod2UncmUgcHJldHR5IGNsb3NlKSBhbG9uZyB3aXRoIGFkZGluZyBhIGhhdGNoIHNldHVwIHR5
cGUuCgo+Cj4gRm9yIGV4YW1wbGUsIHdlIGFscmVhZHkgaGFuZGxlIGZsaXQgYW5kIG1hdHVyaW4g
YXMgc2V0dXAgdHlwZXMsIHNvIHdoeQo+IGRvbid0IHdlIGRvIHRoZSBzYW1lIGZvciBwb2V0cnk/
CgpXZWxsIHdlIHNob3VsZCBwcm9iYWJseSBtaWdyYXRlIHNldHVwdG9vbHMgdG8gcGVwNTE3IGZp
cnN0IGFzIGFkZGluZyBwb2V0cnkKc3VwcG9ydCB3aWxsIGNvbmZsaWN0IHdpdGggdGhhdCBwYXRj
aC4KCkkgd2FzIGFsc28gcGxhbm5pbmcgdG8gcmVtb3ZlIGRpc3R1dGlscyBhZnRlciBzZXR1cHRv
b2xzIGlzIG1pZ3JhdGVkIHdoaWNoCnNob3VsZCBiZSB0aGUgbGFzdCBub24tcGVwNTE3IHB5dGhv
biBidWlsZCBiYWNrZW5kIHdlIHN1cHBvcnQuCgpodHRwczovL3BhdGNod29yay5vemxhYnMub3Jn
L3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjMxMTI2MTgwODQwLjIwODE5NDUtNS1qYW1lcy5o
aWxsaWFyZDFAZ21haWwuY29tLwoKPgo+IFJlZ2FyZHMsCj4gWWFubiBFLiBNT1JJTi4KPgo+ID4g
KyQoZXZhbCAkKHB5dGhvbi1wYWNrYWdlKSkKPiA+IC0tCj4gPiAyLjM0LjEKPiA+Cj4gPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gYnVpbGRyb290
IG1haWxpbmcgbGlzdAo+ID4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiA+IGh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+Cj4gLS0KPiAuLS0t
LS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0t
LS0tLS0tLS0tLS0tLS0tLS0tLgo+IHwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVk
ZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8Cj4gfCArMzMgNjYy
IDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAg
ICAgICAgICAgICAgIHwKPiB8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06
ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAo+IHwgaHR0cDovL3ltb3Jp
bi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNw
aXJhY3kuICB8Cj4gJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0t
LS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
