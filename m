Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E102C87FCB
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 17:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 540D9608A9;
	Wed,  6 Aug 2025 17:15:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ou9mxIQsRaxK; Wed,  6 Aug 2025 17:15:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 006EB60A82
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 006EB60A82;
	Wed,  6 Aug 2025 17:15:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 07FFED79
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 17:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E51F341282
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 17:15:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J6JuvSCR68QV for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 17:15:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com;
 envelope-from=fabien.lehoussel@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 14E2F41280
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14E2F41280
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 14E2F41280
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 17:15:04 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-33230f1347fso648801fa.3
 for <buildroot@buildroot.org>; Wed, 06 Aug 2025 10:15:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754500502; x=1755105302;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sumy8Rh95vKlOZtfZ+47Be+kEkc8c2aeWxzBYj9sX2E=;
 b=F0Q72EeBAgOMhsMXXh1udpl61Ny/2w+NSyv0ivbgdShBDbWR8S0l/lF2pJbZJxaaSw
 7OaYpBwLBAPyYYMITXdTAprW+rUby9eLnrR3xsNcxAq0N7ALxY1Vb52G1lC/o4heLkKe
 3nBYT33plgjrti5GZYDgm5+Qtf/OQzE0YwGNzBR8pRjTG3mO6SYCYFtXCLWpVMCjCJG+
 z1kajEn7iSDA/jCLLnS4tIw5Hb8iQDPy6f985+hMl8q4RhFMCYZYlZU0opcjIou72PVv
 ZidEF3626ZHHMcvFMfH5FN4deXk5Rfq5MmNfFBR5/zi76kEGIHBz+40p0Q+nnnOpyHN0
 TXzQ==
X-Gm-Message-State: AOJu0YzMEx1kIOz/6HbQJBZxNhI3f9HF0uqJljM303hlrCPP3UAGNJ0n
 7F17fS7EMhrg5RRtf04eplgvtzLeNYeTiHNq+zHe8fUrehfUP6RPD7ecuVbUppWncvIy9W8CGxD
 3ZvSIeZAKvDGaO0MxeYkueBJe2IEc9XePNfN7Ms1CqLBDj6zDPuAydT+rww==
X-Gm-Gg: ASbGncsw472ltPn/r2YIhi3dj/+VAnAP/UifIYQlr1ekIEW7PoznHx6qRsXtSSM0yWK
 r9EPiIChkXNT8z31CLOV1s3fwgrTlnEiWuBkvohQzz8A3WoLK136WchENg6GM2bdeg+HM6L7iyU
 FH/ku//wkk3xb97uUX50ILCM/DfksXAxWawhlrngJVBDPli204L1DLERFnTUBu3fnANhd1e7pUp
 q/lH+DzCVSuOYwgZEhhzIWYVCviYhjdBSTVAw==
X-Google-Smtp-Source: AGHT+IHXGX/ie9PjU9729s+xQEOmbbO7o4/RrzxbKojoNMtUYQ4JqoC2px6QCAmMzNUoIZuYrUZ349fSOrpbPYJ7wQE=
X-Received: by 2002:a2e:b887:0:b0:32b:59d1:7ef3 with SMTP id
 38308e7fff4ca-333814586f5mr9713301fa.35.1754500502243; Wed, 06 Aug 2025
 10:15:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250716093401.1213358-1-fabien.lehoussel@smile.fr>
 <20250716093401.1213358-2-fabien.lehoussel@smile.fr>
 <87pld8im6v.fsf@dell.be.48ers.dk>
 <CAKWtHtxtsJz14bqoO1MqhC3m7SpfNn1DvYPbJLSTEAS_oATKUw@mail.gmail.com>
 <878qjwifig.fsf@dell.be.48ers.dk>
In-Reply-To: <878qjwifig.fsf@dell.be.48ers.dk>
Date: Wed, 6 Aug 2025 19:14:51 +0200
X-Gm-Features: Ac12FXxMa11kISn02goJb3jsMFAXhc7BZ4w1BFdEIS7Rdxqsu9iXzDsk7MN4o6E
Message-ID: <CAKWtHtxDD79MhiXN6QDBVzMKhw+4RXB=xDmfr4FALRvBK3xhNw@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754500502; x=1755105302; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sumy8Rh95vKlOZtfZ+47Be+kEkc8c2aeWxzBYj9sX2E=;
 b=XZfz7Jl79eYDHxEmgNJi/ifE2E6TF/MVg28j5wjceoa1y84p/8V6UhWr7vf0f9hIW3
 EwmbeNMzp7/FZmtkvSkNrTiviCWObSGYwvmizzAkRYMvFrA/k2uptwzyStPzbyEqXuEM
 xj3LpLAzV4lqeOb7VzfBlLvQDlhqD2sAfFOY0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=XZfz7Jl7
Subject: Re: [Buildroot] [PATCH v2 2/5] utils/generate-cyclonedx: update
 package filtering
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fabien LEHOUSSEL via buildroot <buildroot@buildroot.org>
Reply-To: Fabien LEHOUSSEL <fabien.lehoussel@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Fabien Lehoussel via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgbWVyLiA2IGFvw7t0IDIwMjUgw6AgMTg6MjUsIFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29y
c2dhYXJkLmNvbT4gYSDDqWNyaXQgOgo+Cj4gPj4+Pj4gIkZhYmllbiIgPT0gRmFiaWVuIExFSE9V
U1NFTCA8ZmFiaWVuLmxlaG91c3NlbEBzbWlsZS5mcj4gd3JpdGVzOgo+Cj4gSGksCj4KPiAgPj4g
PiBkaWZmIC0tZ2l0IGEvdXRpbHMvZ2VuZXJhdGUtY3ljbG9uZWR4IGIvdXRpbHMvZ2VuZXJhdGUt
Y3ljbG9uZWR4Cj4gID4+ID4gaW5kZXggMDhjNTkxZTg2Yi4uMTRmNjU1YmNhMiAxMDA3NTUKPiAg
Pj4gPiAtLS0gYS91dGlscy9nZW5lcmF0ZS1jeWNsb25lZHgKPiAgPj4gPiArKysgYi91dGlscy9n
ZW5lcmF0ZS1jeWNsb25lZHgKPiAgPj4gPiBAQCAtMjc3LDggKzI3Nyw3IEBAIGRlZiBtYWluKCk6
Cj4gID4+ID4gICAgICAgICAgICAgICAgICAgICAgICAgIGRlZmF1bHQ9KE5vbmUgaWYgc3lzLnN0
ZGluLmlzYXR0eSgpIGVsc2Ugc3lzLnN0ZGluKSkKPiAgPj4gPiAgICAgIHBhcnNlci5hZGRfYXJn
dW1lbnQoIi1vIiwgIi0tb3V0LWZpbGUiLCBuYXJncz0iPyIsIHR5cGU9YXJncGFyc2UuRmlsZVR5
cGUoInciKSwKPiAgPj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgZGVmYXVsdD1zeXMuc3Rk
b3V0KQo+ICA+PiA+IC0gICAgcGFyc2VyLmFkZF9hcmd1bWVudCgiLS12aXJ0dWFsIiwgZGVmYXVs
dD1GYWxzZSwgYWN0aW9uPSdzdG9yZV90cnVlJywKPiAgPj4gPiAtICAgICAgICAgICAgICAgICAg
ICAgICAgaGVscD0iVGhpcyBvcHRpb24gaW5jbHVkZXMgdmlydHVhbCBwYWNrYWdlcyB0byB0aGUg
Q3ljbG9uZURYIG91dHB1dCIpCj4gID4+ID4gKwo+ICA+Pgo+ICA+Pgo+ICA+PiBJIGFtIG5vdCBz
dXJlIGV4YWN0bHkgd2hhdCB0aGUgdXNlIGNhc2UgaXMgb2YgLS12aXJ0dWFsLCBidXQgd2h5IHJl
bW92ZQo+ICA+PiBpdD8KPgo+ICA+IERvbid0IGtub3csIEkgZGlkbid0IHVuZGVyc3RhbmQgd2hh
dCBpdCB3YXMgZm9yLCBidXQgdGhpcyBpcyBub3QKPiAgPiBjb21wYXRpYmxlIHdpdGggdGhlIG5l
dyBmaWx0ZXIuCj4gID4gRG9lcyBhbnlvbmUgaGF2ZSB0aGUgYW5zd2VyPwo+Cj4gSSBndWVzcyB3
ZSBfQ09VTERfIGRlZmluZSAidmlydHVhbCIgYXMgYW55dGhpbmcgd2l0aG91dCBhIFNJVEUsIGJ1
dCBJCj4gYWxzbyBkb24ndCByZWFsbHkgc2VlIHRoZSB1c2UgY2FzZSBmb3IgdGhpcyBvcHRpb24s
IHNvIEkgd291bGQgYmUgT0sKPiB3aXRoIGRyb3BwaW5nIGl0Lgo+Cj4gVGhvbWFzL0Fybm91dD8K
CkluIG15IG1ha2Ugc2hvdy1pbmZvIHRlc3QgZW52aXJvbm1lbnQsIGFsbCB2aXJ0dWFsIHBhY2th
Z2VzIGhhdmUgbm8KYXNzb2NpYXRlZCBTSVRFIChkb3dubG9hZCBmaWxlZCBpbiB0aGUganNvbiku
ClRoZXkgY29ycmVzcG9uZCB0byBwYWNrYWdlcyBkZWZpbmVkIHVzaW5nICQoZXZhbCAkKHZpcnR1
YWwtcGFja2FnZSkpCgpGYWJpZW4KPiAtLQo+IEJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
