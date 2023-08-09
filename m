Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB72C001B0
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 16:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE95E60F3F;
	Wed,  9 Aug 2023 16:48:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE95E60F3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hSmZy8WTF15d; Wed,  9 Aug 2023 16:48:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B65260681;
	Wed,  9 Aug 2023 16:48:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B65260681
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DC3931BF5A3
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 16:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B60B583264
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 16:48:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B60B583264
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wszj02vALkkj for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 16:48:01 +0000 (UTC)
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com
 [IPv6:2607:f8b0:4864:20::e29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 624C883148
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 16:48:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 624C883148
Received: by mail-vs1-xe29.google.com with SMTP id
 ada2fe7eead31-447a4316052so18540137.0
 for <buildroot@buildroot.org>; Wed, 09 Aug 2023 09:48:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691599680; x=1692204480;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=50IzQFY4gklMUl/ziEsliHe1S/Eh0r62/dyS5nMVN9I=;
 b=Vp6c9XYCmcRjpfginPx/78Uz2HXIfkIP63ZngobknO271/WQf1tDa23friM58J4DNt
 pTDZPXwEFQc4KWVEEFnfqOtDatQfNsevUqpdEd3Fqf8/73Z2M9nxm0yGWzJw/Tv9kV3A
 D6w8+MWwwVKajn4CobF8V77o2LxEaVzpWa34quhexKUgrowXlFeFAaAEjsO5sP/CH7jB
 n96cg8bO5WVEiBHwKSyHEsePXxPhkQdb+h1uGVFQvYM92s3Kr0IkKnYEbBGrXGBHB7Fa
 XRu1cFpQw6X2ijF2Wr+oETSMBJ45BJyk9aTZnGTD40Kr6D6pSOxIsYB2wZahjKrl8+aq
 4QpA==
X-Gm-Message-State: AOJu0Yy2lZ4Vb0m51NupkE7Au84kQjS1RSaVAepeeo1foqfylU3NdI19
 JPchaRmKgMJSdxHhM8ShdqdTfZepMhMRl7DSiFE=
X-Google-Smtp-Source: AGHT+IEFDjxelT/UJBsWFsSAKK7WNaGlf/buxuwWM7MjbuRI0U9Ehnxg+ZdnNBfkbs08WECQ448YJiZrYtJJ+3O/Aoo=
X-Received: by 2002:a67:e3c4:0:b0:446:a477:804b with SMTP id
 k4-20020a67e3c4000000b00446a477804bmr2964408vsm.11.1691599679946; Wed, 09 Aug
 2023 09:47:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230808195753.19748-1-ju.o@free.fr>
In-Reply-To: <20230808195753.19748-1-ju.o@free.fr>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 9 Aug 2023 12:47:34 -0400
Message-ID: <CAKmqyKP8t6WtrTnCktmcPft5Yg0muReRUO+nqrBYRw7MFixvfA@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691599680; x=1692204480;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=50IzQFY4gklMUl/ziEsliHe1S/Eh0r62/dyS5nMVN9I=;
 b=b/59BfzJWHpgGD2OPv6poJHx56txGhMgV2srEcPtyCpxXA2V1ebpt7OQXmtfjncVJV
 SR8ZQDKlbB69u+x8c1Zc+g9Ct6zltevef1/zoZAI6im2lCwyeCiBk/kvOEMUVH4dtmPt
 jGzHjoYElhcsK0/W4JCaiy3QFSxwteXexu9T4T6hfA4lfzSB1m6rNHfOo3t4spHSJiPE
 iu5Os2lEaqt3u2uqkJIXpGv4UydF1wa92wC30bt8Qkeewd4cUOkHHM1BoGOhur2a6GPJ
 bMmXc5wkf6E0gU0PnJ7b+Tw0b0ZdnAwm6vVZpH8uCs3Ot8I0zIWpovC90Rx9PLwhPUjS
 wbsw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=b/59BfzJ
Subject: Re: [Buildroot] [PATCH next 1/1] support/docker: add
 qemu-system-misc for riscv runtime tests
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

T24gVHVlLCBBdWcgOCwgMjAyMyBhdCAzOjU44oCvUE0gSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJl
ZS5mcj4gd3JvdGU6Cj4KPiBUaGUgZG9ja2VyIGltYWdlIGN1cnJlbnRseSBjb250YWlucyBxZW11
LXN5c3RlbS1hcm0gYW5kCj4gcWVtdS1zeXN0ZW0teDg2LiBFYWNoIHBhY2thZ2UgY29udGFpbnMg
dGhlIDMyYml0IGFuZCA2NGJpdCB2YXJpYW50cy4KPiBUaGlzIGhhcyBiZWVuIHN1ZmZpY2llbnQg
Zm9yIHRoZSB0aW1lIGJlaW5nLgo+Cj4gVGhlIFJJU0MtViBlY29zeXN0ZW0gaXMgZ3Jvd2luZyBy
YXBpZGx5LiBJdCBpcyBzdGFydGluZyB0byBiZWNvbWUKPiBtYWluc3RyZWFtLiBUbyBpbmNyZWFz
ZSB0aGUgZGl2ZXJzaXR5IGluIEJ1aWxkcm9vdCBydW50aW1lIHRlc3RzLAo+IHRoaXMgY29tbWl0
IGFkZHMgdGhlIHFlbXUtc3lzdGVtLW1pc2MgcGFja2FnZSBpbiB0aGUgRG9ja2VyIGltYWdlLAo+
IGluIG9yZGVyIHRvIGhhdmUgdGhlIGNvbW1hbmRzIHFlbXUtc3lzdGVtLXJpc2N2ezMyLDY0fS4g
VGhpcyBwYWNrYWdlCj4gYWxzbyBjb250YWlucyBvdGhlciBhcmNoaXRlY3R1cmVzIChmb3IgZXhh
bXBsZTogbWljcm9ibGF6ZSwgbmlvczIsCj4gczM5MHgsIHh0ZW5zYSwgLi4uKS4KPgo+IEZvciBE
ZWJpYW4gcGFja2FnZSBkZXRhaWxzLCBzZWU6Cj4gaHR0cHM6Ly9wYWNrYWdlcy5kZWJpYW4ub3Jn
L2J1bGxzZXllL3FlbXUtc3lzdGVtLW1pc2MKPgo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBPbGl2
YWluIDxqdS5vQGZyZWUuZnI+CgpSZXZpZXdlZC1ieTogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3Rh
aXIuZnJhbmNpc0B3ZGMuY29tPgoKQWxpc3RhaXIKCj4gLS0tCj4gTm90ZTogSSBoYXZlIGFscmVh
ZHkgdHdvIHdvcmstaW4tcHJvZ3Jlc3MgcGF0Y2ggc2VyaWVzIHVzaW5nCj4gcWVtdS1zeXN0ZW0t
cmlzY3Y2NC4gSSdsbCB3YWl0IGZvciB0aGlzIHBhdGNoIHRvIGJlIGFjY2VwdGVkLCBhbmQKPiAu
Z2l0bGFiLWNpLnltbCB0byBiZSB1cGRhdGVkIHRvIHVzZSB0aGUgaW1hZ2UgYmVmb3JlIHNlbmRp
bmcgdGhvc2UuCj4gLS0tCj4gIHN1cHBvcnQvZG9ja2VyL0RvY2tlcmZpbGUgfCAxICsKPiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC9kb2Nr
ZXIvRG9ja2VyZmlsZSBiL3N1cHBvcnQvZG9ja2VyL0RvY2tlcmZpbGUKPiBpbmRleCBhMTZjMWUz
ODQ5Li44YzZlMmFkZDYwIDEwMDY0NAo+IC0tLSBhL3N1cHBvcnQvZG9ja2VyL0RvY2tlcmZpbGUK
PiArKysgYi9zdXBwb3J0L2RvY2tlci9Eb2NrZXJmaWxlCj4gQEAgLTQ0LDYgKzQ0LDcgQEAgUlVO
IGFwdC1nZXQgLW8gQVBUOjpSZXRyaWVzPTMgaW5zdGFsbCAteSAtLW5vLWluc3RhbGwtcmVjb21t
ZW5kcyBcCj4gICAgICAgICAgcHl0aG9uMy1wZXhwZWN0IFwKPiAgICAgICAgICBweXRob24zLXB5
dGVzdCBcCj4gICAgICAgICAgcWVtdS1zeXN0ZW0tYXJtIFwKPiArICAgICAgICBxZW11LXN5c3Rl
bS1taXNjIFwKPiAgICAgICAgICBxZW11LXN5c3RlbS14ODYgXAo+ICAgICAgICAgIHJzeW5jIFwK
PiAgICAgICAgICBzaGVsbGNoZWNrIFwKPiAtLQo+IDIuNDEuMAo+Cj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0
Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
