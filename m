Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69439EB64DA
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 19:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D046E40B93;
	Mon, 10 Jul 2023 19:55:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D046E40B93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pFUxjQNK6UmM; Mon, 10 Jul 2023 19:55:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3173D40A65;
	Mon, 10 Jul 2023 19:55:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3173D40A65
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3DAA91BF3A1
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 19:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14F48404EE
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 19:55:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14F48404EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nLH7G9Gw65vA for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 19:55:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCED8404ED
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BCED8404ED
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 19:55:19 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-1b45fe36cd9so1835182fac.2
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 12:55:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689018918; x=1691610918;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VDnLFllEhrDQl0mj+weV8El7j0d43SgOAmqS0Fbzg4I=;
 b=PVtVAW2DxP1dBwvaZjCNLRjKONIIF6qOxzbpTfAEDRb78A7AeTc3Q7AF+EmjhsCnRz
 5apCreszXxUGiIf3VwlRO0fg5+gJggnxOaf0s+SBJFZMnRczTyVWKmvgeNtm9GSZNbHc
 dD1kAbecniR5Ng/LZY/Qi5xeMb3tfCtbIEzjFAXHrVhUEVLgZyyoPNBBaJBBtG1WsVVv
 fUnjodWPwDHghpud1XZix+3lt3m1SaWFCDMK4Q05H7ZNJ/l9V9ESzqkBsVwvTTSn4mUb
 fdpZfEwBfb6FVuWWRina6XjKfFOFk/M2PmHO6pU7M29kLk6/lzytayxD0R5+OXVIrmVs
 R75g==
X-Gm-Message-State: ABy/qLb49q/Lnpmtp8IRUEB50xu+2jEtHcLupQIYNM3I1kM7M8FaLFDU
 ATkiNKSWQ8UusYRb9DDjm8QcOnPUtBnhEus+bAo=
X-Google-Smtp-Source: APBJJlHTmLrbPPVQHU1I8hHXxk5bwcSCcR9vTbtti3hiKhGSJJIMS3IkcG6QemJpJy3aaFqn1qWtmamC1+pYLP/zlD0=
X-Received: by 2002:a05:6870:7389:b0:1b3:d4fa:cf97 with SMTP id
 z9-20020a056870738900b001b3d4facf97mr11688633oam.5.1689018918518; Mon, 10 Jul
 2023 12:55:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230626181531.2312002-1-james.hilliard1@gmail.com>
 <20230626181531.2312002-5-james.hilliard1@gmail.com>
 <20230710195338.6ba40839@windsurf>
In-Reply-To: <20230710195338.6ba40839@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 10 Jul 2023 13:55:06 -0600
Message-ID: <CADvTj4royxeS0avEdcpevqFNR_=Tv-D=GnG_cwk-0KG78FED+Q@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689018918; x=1691610918;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VDnLFllEhrDQl0mj+weV8El7j0d43SgOAmqS0Fbzg4I=;
 b=pqLKAAI6Tk7L1r+Qq5FFZnVyyYORSpJnXRnY27HhzZfE81hIn8Ov7qrfgPnfYLTCw6
 yy164ccPTAvBho/B94qRsYP3sJmMMjcO50xMiGnVSNDdeAcUCFhF6nRZs94ittF+WE0E
 NvVqmwuO8fZcyJizrtb3Vm80lPg6JuXd8aI0AAgOGI9l1LK+j9Ze8dyw9JGgS4tf2mLB
 6dMheJx6Oqzjp7xKeZBUU1bzOIopXzpyVMS1RVLJL3/i2h45muZZMm92QgPlkZHi184q
 djbSj7dSmCb0nD3X6kKo6iUZ4woSY7k+HlZYd/EzYoXU9O7Ly+XBfecY2UI8+OyqB3qM
 2rTQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=pqLKAAI6
Subject: Re: [Buildroot] [PATCH 5/5] package/pkg-python.mk: migrate
 setuptools to pep517
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Gustavo Heinz <gustavo@gsthnz.com>, Michael Rommel <rommel@layer-7.net>,
 Samuel Martin <s.martin49@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBKdWwgMTAsIDIwMjMgYXQgMTE6NTPigK9BTSBUaG9tYXMgUGV0YXp6b25pCjx0aG9t
YXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhlbGxvIEphbWVzLAo+Cj4gT24g
TW9uLCAyNiBKdW4gMjAyMyAxMjoxNTozMSAtMDYwMAo+IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5o
aWxsaWFyZDFAZ21haWwuY29tPiB3cm90ZToKPgo+ID4gTm93IHRoYXQgc2V0dXB0b29scyBhbmQg
aXRzIGRlcGVuZGVuY2llcyBhcmUgdXNpbmcgcGVwNTE3IHdlIGNhbgo+ID4gbWlncmF0ZSB0aGUg
c2V0dXB0b29scyBpbmZyYXN0cnVjdHVyZSBpdHNlbGYgdG8gdXNlIHRoZSBwZXA1MTcKPiA+IGJ1
aWxkIGZyb250ZW5kLgo+ID4KPiA+IEFzIHBhcnQgb2YgdGhpcyB3ZSBuZWVkIHRvIG1pZ3JhdGUg
dGhlIGFsbCBweXRob24gcGFja2FnZXMgdXNpbmcKPiA+IF9CVUlMRF9PUFRTIHRvIHRoZSBuZXcg
Y29uZmlnIHNldHRpbmdzIGZvcm1hdCB1c2VkIGJ5IHRoZSBwZXA1MTcKPiA+IGJ1aWxkIGZyb250
ZW5kLgo+ID4KPiA+IFdlIGFsc28gbmVlZCB0byBhZGQgYSBwYXRjaCBmaXhpbmcgYSBidWcgaW4g
cHl0aG9uLXB5cGEtYnVpbGQgd2hpY2gKPiA+IHdhcyBwcmV2ZW50aW5nIHRoZSBjb25maWcgc2V0
dGluZ3MgZnJvbSBiZWluZyBwYXNzZWQgdG8gc29tZSBvZiB0aGUKPiA+IHBlcDUxNyBidWlsZCBo
b29rcy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlh
cmQxQGdtYWlsLmNvbT4KPgo+IENvdWxkIHlvdSBjbGFyaWZ5IHRoZSByZWxhdGlvbnNoaXAgYmV0
d2VlbiB0aGlzIFBBVENIIDUvNSBhbmQgdGhlIHJlc3QKPiBvZiB0aGUgc2VyaWVzPyBUaGV5IGFy
ZSBwYXJ0IG9mIHRoZSBzYW1lIHNlcmllcywgc28gdGhlcmUgbXVzdCBiZSBzb21lCj4ga2luZCBv
ZiByZWxhdGlvbnNoaXAsIGJ1dCBJIGZhaWwgdG8gc2VlIHdoaWNoIG9uZS4KClRob3NlIHBhY2th
Z2VzIGhhdmUgX0JVSUxEX09QVFMgd2hpY2ggaGFzIGEgZGlmZmVyZW50IGZvcm1hdCBmb3IgcGVw
NTE3LApJIHVwZGF0ZWQgdGhlbSB0byB0aGVpciBsYXRlc3QgdmVyc2lvbnMgYW5kIG1pZ3JhdGVk
IHRoZW0gdG8gbWVzb24gc28gdGhhdCB0aGV5Cndvbid0IGJyZWFrIHdoZW4gd2UgZG8gdGhlIHBl
cDUxNyBtaWdyYXRpb24gaW4gb3VyIHB5dGhvbiBpbmZyYXN0cnVjdHVyZS4KCgo+Cj4gVGhhbmtz
LAo+Cj4gVGhvbWFzCj4gLS0KPiBUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBC
b290bGluCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5p
bmcKPiBodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
