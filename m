Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78AA4C001E0
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 23:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF6AE813D8;
	Tue,  8 Aug 2023 23:38:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF6AE813D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SoEn1OJCYARr; Tue,  8 Aug 2023 23:38:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D92D81411;
	Tue,  8 Aug 2023 23:38:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D92D81411
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 860F81BF84C
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 23:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B1F2400D2
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 23:38:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B1F2400D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mtEG5osaQQn4 for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 23:38:34 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1A0914087F
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 23:38:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A0914087F
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-99cce6f7de2so454384766b.3
 for <buildroot@buildroot.org>; Tue, 08 Aug 2023 16:38:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691537911; x=1692142711;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mCqzsH4nE/8E3kriSS1JQTpFkHBcCFPsjJdmkvWlEVU=;
 b=k6PqLtE4yJCWra6Gn+QUai3v3T2BroYTaKiLTm78DHetlmrUVtHF7oY4CeZNGZRp5h
 /CndwFkQ0MnryyoC4sjBeBZhwXxMWHNiVdJia/nHBEUJZLGbzvtA0ocDBP+lthGy5ira
 OgCsxDu5HHcAJGhTQepLa0JF6B5+M07dvfi95yc5QVqj0Ja+O55xWNdG8JLmGRibwjsN
 OgBdXh58lCtrtm9UIRr/+ecMwFqX5spZq34V2q6i+ar6C6MdVqFG0ApXq8MWRJiuK88b
 1mCWKatARBxRorDrebhH8eqgKUKznxSzyuw1QvTN+sQT2ohC7/A4YFb3pyCCf30nt4dF
 6Ixg==
X-Gm-Message-State: AOJu0YwdJF07Zhhov8YZvcB+6JxV2Flrta+cHJTDW1oMQfqBdcHnjRR0
 dmxPaGHi5ThGY7Obl4M40ceFRpbu8PXS5g==
X-Google-Smtp-Source: AGHT+IGq0tAQYevdyxETv+ryAWQLwp7/KTHKqXztQ4cfrX6UH1HoxR7BuCxxdu1RZtJHq7yEIZ5Gyw==
X-Received: by 2002:a17:907:7848:b0:99b:627b:e962 with SMTP id
 lb8-20020a170907784800b0099b627be962mr823620ejc.47.1691537911403; 
 Tue, 08 Aug 2023 16:38:31 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com.
 [209.85.208.48]) by smtp.gmail.com with ESMTPSA id
 o18-20020a1709062e9200b0099cb0a7098dsm6036207eji.19.2023.08.08.16.38.30
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Aug 2023 16:38:30 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-52307552b03so8502217a12.0
 for <buildroot@buildroot.org>; Tue, 08 Aug 2023 16:38:30 -0700 (PDT)
X-Received: by 2002:a17:906:539a:b0:99b:dd1d:64ba with SMTP id
 g26-20020a170906539a00b0099bdd1d64bamr865078ejo.50.1691537910635; Tue, 08 Aug
 2023 16:38:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230622160212.2063472-1-dannenberg@ti.com>
 <20230622160212.2063472-3-dannenberg@ti.com>
In-Reply-To: <20230622160212.2063472-3-dannenberg@ti.com>
From: Bryce Johnson <bryce@redpinelabs.com>
Date: Tue, 8 Aug 2023 16:38:18 -0700
X-Gmail-Original-Message-ID: <CADXxVSKn3-kg_-CEJaDPhvAA4vB8n22M+88m+eUO4ruOo32r1A@mail.gmail.com>
Message-ID: <CADXxVSKn3-kg_-CEJaDPhvAA4vB8n22M+88m+eUO4ruOo32r1A@mail.gmail.com>
To: Andreas Dannenberg <dannenberg@ti.com>
Subject: Re: [Buildroot] [PATCH v9 02/11] boot/ti-k3-image-gen: new package
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
Cc: Bryan Brattlof <bb@ti.com>, Andrew Davis <afd@ti.com>,
 Julien Olivain <ju.o@free.fr>, Xuanhao Shi <x-shi@ti.com>,
 buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQW5kcmVhcyBhbmQgYWxsLAoKCk9uIFRodSwgSnVuIDIyLCAyMDIzIGF0IDk6MDXigK9BTSBB
bmRyZWFzIERhbm5lbmJlcmcgdmlhIGJ1aWxkcm9vdAo8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+
IHdyb3RlOgo+Cj4gRnJvbTogWHVhbmhhbyBTaGkgPHgtc2hpQHRpLmNvbT4KPgo+IFRoaXMgaXMg
dGhlIGltYWdlIGdlbmVyYXRvciB0aGF0IGJ1aWxkcyB0aGUgaW5pdGlhbCBib290IGJpbmFyeSwK
PiB0aWJvb3QzLmJpbiwgZm9yIHRoZSBSNSBjb3JlIG9uIFRJJ3MgSzMgZmFtaWx5IG9mIGRldmlj
ZXMuCj4gVGhpcyByZXF1aXJlcyB0aGUgUjUgU1BMIG91dHB1dCBmcm9tIHRoZSB0aS1rMy1yNS1s
b2FkZXIgcGFja2FnZS4KPgo+IGh0dHBzOi8vZ2l0LnRpLmNvbS9jZ2l0L2szLWltYWdlLWdlbi9r
My1pbWFnZS1nZW4KCkkgd2FzIGFibGUgdG8gYnVpbGQgd2l0aCB5b3VyIHBhdGNoc2V0IGZvciBh
bTYyeF9za19kZWZjb25maWcgYXMKaW5jbHVkZWQuICBJIGF0dGVtcHRlZCB0byBkbyBhIHJlcHJv
ZHVjaWJsZSBhbmQgcGVyX3BhY2thZ2UgcGFyYWxsZWwKYnVpbGQgYW5kIHJhbiBpbnRvIGFuIGVy
cm9yLiAgV2UgdGVuZCB0byB1c2UgdGhhdCBmb3IgYnVpbGRzIGJlY2F1c2UKaXQgaXMgc2lnbmlm
aWNhbnRseSBmYXN0ZXIgYnVpbGQgdGltZXMgZXNwZWNpYWxseSBvbiBhIGRlZGljYXRlZApzZXJ2
ZXIuCgpBZGRpbmcgdG8gdGhlIGRlZmNvbmZpZzoKQlIyX1JFUFJPRFVDSUJMRT15CkJSMl9QRVJf
UEFDS0FHRV9ESVJFQ1RPUklFUz15CgogYW5kIEkgd2FzIHJ1bm5pbmcgaW4gdG8gdGhlIGJlbG93
IGVycm9yOgoKPj4+IHRpLWszLWltYWdlLWdlbiAwOC4wNi4wMC4wMDcgSW5zdGFsbGluZyB0byBp
bWFnZXMgZGlyZWN0b3J5CmNwIC9idWlsZF9kYXRhL2pvaG5zb25iL2J1aWxkcm9vdF90aS9vdXRw
dXQvYnVpbGQvdGktazMtaW1hZ2UtZ2VuLTA4LjA2LjAwLjAwNy90aWJvb3QzLmJpbgovYnVpbGRf
ZGF0YS9qb2huc29uYi9idWlsZHJvb3RfdGkvb3V0cHV0L2ltYWdlcwpbMTkvMzBdIENvbXBpbGlu
ZyBDIG9iamVjdApzcmMvbGlid2F5bGFuZC1zZXJ2ZXIuc28uMC4yMS4wLnAvd2F5bGFuZC1zaG0u
Yy5vbWFrZVs1XTogTGVhdmluZwpkaXJlY3RvcnkgJy9idWlsZF9kYXRhL2pvaG5zb25iL2J1aWxk
cm9vdF90aS9vdXRwdXQvYnVpbGQvdXRpbC1saW51eC1saWJzLTIuMzgnCm1ha2VbNF06IExlYXZp
bmcgZGlyZWN0b3J5CicvYnVpbGRfZGF0YS9qb2huc29uYi9idWlsZHJvb3RfdGkvb3V0cHV0L2J1
aWxkL3V0aWwtbGludXgtbGlicy0yLjM4JwptYWtlWzNdOiBMZWF2aW5nIGRpcmVjdG9yeQonL2J1
aWxkX2RhdGEvam9obnNvbmIvYnVpbGRyb290X3RpL291dHB1dC9idWlsZC91dGlsLWxpbnV4LWxp
YnMtMi4zOCcKbWFrZVsyXTogTGVhdmluZyBkaXJlY3RvcnkKJy9idWlsZF9kYXRhL2pvaG5zb25i
L2J1aWxkcm9vdF90aS9vdXRwdXQvYnVpbGQvdXRpbC1saW51eC1saWJzLTIuMzgnCm1ha2VbMV06
IExlYXZpbmcgZGlyZWN0b3J5CicvYnVpbGRfZGF0YS9qb2huc29uYi9idWlsZHJvb3RfdGkvb3V0
cHV0L2J1aWxkL3V0aWwtbGludXgtbGlicy0yLjM4JwpjcDogY2Fubm90IHN0YXQKJy9idWlsZF9k
YXRhL2pvaG5zb25iL2J1aWxkcm9vdF90aS9vdXRwdXQvYnVpbGQvdGktazMtaW1hZ2UtZ2VuLTA4
LjA2LjAwLjAwNy90aWJvb3QzLmJpbic6Ck5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKcGFja2Fn
ZS9wa2ctZ2VuZXJpYy5tazozNzE6IHJlY2lwZSBmb3IgdGFyZ2V0CicvYnVpbGRfZGF0YS9qb2hu
c29uYi9idWlsZHJvb3RfdGkvb3V0cHV0L2J1aWxkL3RpLWszLWltYWdlLWdlbi0wOC4wNi4wMC4w
MDcvLnN0YW1wX2ltYWdlc19pbnN0YWxsZWQnCmZhaWxlZAptYWtlOiAqKiogWy9idWlsZF9kYXRh
L2pvaG5zb25iL2J1aWxkcm9vdF90aS9vdXRwdXQvYnVpbGQvdGktazMtaW1hZ2UtZ2VuLTA4LjA2
LjAwLjAwNy8uc3RhbXBfaW1hZ2VzX2luc3RhbGxlZF0KRXJyb3IgMQptYWtlOiAqKiogV2FpdGlu
ZyBmb3IgdW5maW5pc2hlZCBqb2JzLi4uLgoKCgpJIGNhbiBzZWUgdGhhdCBmaWxlIGxvY2F0ZWQg
dGhlcmU6CmxzIC1hbCAvYnVpbGRfZGF0YS9qb2huc29uYi9idWlsZHJvb3RfdGkvb3V0cHV0L2J1
aWxkL3RpLWszLWltYWdlLWdlbi0wOC4wNi4wMC4wMDcvdGlib290My5iaW4KbHJ3eHJ3eHJ3eCAx
IGpvaG5zb25iIHVzZXJzIDEwMyBBdWcgIDggMTg6MTgKL2J1aWxkX2RhdGEvam9obnNvbmIvYnVp
bGRyb290X3RpL291dHB1dC9idWlsZC90aS1rMy1pbWFnZS1nZW4tMDguMDYuMDAuMDA3L3RpYm9v
dDMuYmluCi0+IC9idWlsZF9kYXRhL2pvaG5zb25iL2J1aWxkcm9vdF90aS9vdXRwdXQvYnVpbGQv
dGktazMtaW1hZ2UtZ2VuLTA4LjA2LjAwLjAwNy90aWJvb3QzLWFtNjJ4LWhzLWZzLWV2bS5iaW4K
Ck1pZ2h0IGJlIHNvbWV0aGluZyBvdXQgb2Ygb3JkZXIgb3IgYSBtaXNzaW5nIGRlcGVuZGVuY3ku
ICBJIGRpZG4ndCBkaWcKaW50byBpdCB0b28gZmFyLCBidXQgSSB0aG91Z2h0IEkgd291bGQgbGV0
IHlvdSBrbm93LgoKQnJ5Y2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
