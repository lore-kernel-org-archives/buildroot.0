Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC82C433F5
	for <buildroot@archiver.kernel.org>; Wed, 30 Mar 2022 09:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F40C40CB0;
	Wed, 30 Mar 2022 09:53:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wUAjKr47NwTY; Wed, 30 Mar 2022 09:53:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2347040C9F;
	Wed, 30 Mar 2022 09:53:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2C2881BF2C1
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 09:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A8C881411
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 09:53:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CAW21GmoA674 for <buildroot@lists.busybox.net>;
 Wed, 30 Mar 2022 09:53:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1E81F81410
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 09:53:53 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id j83so21556327oih.6
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 02:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Nbhz33a6QVUMStuxyKhrcgFDl2VEmlKeFZMjHSAf3uA=;
 b=JaqrQ3DEX8lAbmYlUJ1kB46vKljqi8rMDOfcCx/oeSBJkyG7w8K+spTtF5LEBMec4s
 sNph6zOj/rB7R8E/BGuu2CrkyKaa8FYCts0lO7YehbUfduYZDsnuR2+xMi7KJXkRPOxE
 6FVQZDv4xkAHgclNrbw5CPjQXnee3lYKrKqoNAPKQiiGkyyeY52po75gqAldsKK5/B8Y
 qUwSb9nnAaU3wToK318WfIq2C5KMV65NkCM8qAmGOakSSQM0UVCoZBg7Bzg5rRKaySvc
 T0LxG65BLo3anlzyYUvlZVsRYHH/PXRBtcvE9AqGZtFsYjCixxvOSBodPnKg3UQScxAA
 6RrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Nbhz33a6QVUMStuxyKhrcgFDl2VEmlKeFZMjHSAf3uA=;
 b=bClQhreqJ9aiOFtl2xho7uqtYittQ1FsN9fmiFHClq5k6qcl9wjWR8qNS9d9bFv7ij
 8ZSAHiGCCeTGZ6s5SQ1piCrmedg6rIrRrkufltsQ1qJLijR2x5Vzx1wvQsmaDOMGqu4w
 eLjkUrFaf09PLS1uDzhxSpXc3fDpYTUvP0n9KPwFbOzztSjLqikxpujhxChJwWxKG6QB
 LjF2i8Jz3OR1s6Cm1xct1pv3YayVyv0pPKnkm3rm0IYjUhLJ6e4WgD+UComNSFmXQVGB
 xXoI6jzguSxCfy2oDvSWIb8ePF2r7Xh7wL6Ymuyj8Hsjw7CrcmQWcaItl5+gt17GaYQ6
 gQ2A==
X-Gm-Message-State: AOAM530wZQ6k2OClx9YpK+gBTe6pXBKBV5ZOvxTAPYb2YmkH0kvCjyZ5
 qYGheCiiJYAj3KFv0tISxSWOJKEhH9/jKE3iJvZtD42W
X-Google-Smtp-Source: ABdhPJwJCsWaM3KTNXzlbw8Ae0jK0Ueds7/TfkA8rksSoYt/I5yI7NgUpT+Q6YyT2s3aJghtmNN7dvVpqbgO4HMvYBg=
X-Received: by 2002:aca:f1d5:0:b0:2ec:eaab:eb9b with SMTP id
 p204-20020acaf1d5000000b002eceaabeb9bmr1350058oih.228.1648634032024; Wed, 30
 Mar 2022 02:53:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220315173231.1943484-1-fontaine.fabrice@gmail.com>
 <87czi4a63p.fsf@dell.be.48ers.dk>
 <CAPi7W80X5dXac4HJ+8uafLWhqUKRW_j-+qT9KO69HJSRFzj2_w@mail.gmail.com>
 <875ynv98sa.fsf@dell.be.48ers.dk>
In-Reply-To: <875ynv98sa.fsf@dell.be.48ers.dk>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 30 Mar 2022 11:53:40 +0200
Message-ID: <CAPi7W80a6+ZF0enkFBFNdAwf-POxTG7HNvZB4E74niNb8oSVRg@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/grpc: fix build with libexecinfo
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
Cc: Robert Rose <robertroyrose@gmail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgbWVyLiAzMCBtYXJzIDIwMjIgw6AgMDk6NTIsIFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29y
c2dhYXJkLmNvbT4gYSDDqWNyaXQgOgo+Cj4gPj4+Pj4gIkZhYnJpY2UiID09IEZhYnJpY2UgRm9u
dGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPiB3cml0ZXM6Cj4KPiAgPiBMZSBtYXIu
IDI5IG1hcnMgMjAyMiDDoCAyMTo1MywgUGV0ZXIgS29yc2dhYXJkIDxwZXRlckBrb3JzZ2FhcmQu
Y29tPiBhIMOpY3JpdCA6Cj4gID4+Cj4gID4+ID4+Pj4+ICJGYWJyaWNlIiA9PSBGYWJyaWNlIEZv
bnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4gd3JpdGVzOgo+ICA+Pgo+ICA+PiA+
IEZpeCB0aGUgZm9sbG93aW5nIGJ1aWxkIGZhaWx1cmUgcmFpc2VkIG9uIHVjbGliYyBhbmQgbXVz
bCBzaW5jZSB0aGUKPiAgPj4gPiByZWludHJvZHVjdGlvbiBvZiB0aGUgcGFja2FnZSBpbiBjb21t
aXQKPiAgPj4gPiAxNmZmOTQ4NDQ0YzM5NzhkNjNmNDgzMzQ0YTNkOTJkOTk0YzY0MzEyOgo+ICA+
Pgo+ICA+PiBIdWg/IFRoaXMgaXMgdGhlIGNvbW1pdCB3aGVyZSBvbGEgd2FzIHJlaW50cm9kdWNl
ZCwgYnV0IHRoaXMgaXMgYQo+ICA+PiBmYWlsdXJlIGluIGdycGMgYW5kIHRoZSBjb25maWcgZG9l
c24ndCBldmVuIGhhdmUgb2xhIGVuYWJsZWQ/Cj4KPiAgPiBJbmRlZWQsIEkgbWFkZSBhIGNvcHkg
LyBwYXN0ZSBlcnJvciwgdGhlIGNvcnJlY3QgY29tbWl0IG1lc3NhZ2Ugc2hvdWxkCj4gID4gaGF2
ZSBiZWVuOgo+ICA+ICJGaXggdGhlIGZvbGxvd2luZyBidWlsZCBmYWlsdXJlIHJhaXNlZCBvbiB1
Y2xpYmMgYW5kIG11c2wgc2luY2UgdGhlCj4gID4gYWRkaXRpb24gb2YgbGliZXhlY2luZm8gcGFj
a2FnZSBpbiBjb21taXQKPiAgPiBlZWE4YmE0NDZjMTA3MDFhMjczNDMyNTUyMTA4ZDgwZmIyMjI0
ZWY0Igo+Cj4gQWhoLCBzbyBpdCBhbHNvIGFwcGxpZXMgdG8gdGhlIHZlcnNpb24gd2UgaGF2ZSBp
biAyMDIyLjAyLnggKDEuNDMuMCk/Cj4gU3RyYW5nZWx5IGVub3VnaCB3ZSBvbmx5IGhhdmUgYXV0
b2J1aWxkZXIgZmFpbHVyZXMgZm9yIDEuNDQuMC4KCkFmdGVyIGZ1cnRoZXIgaW52ZXN0aWdhdGlv
biwgdGhlIGJ1aWxkIGZhaWx1cmUgaXMgcmFpc2VkIGJ5IGEgbGlicmFyeQpwcm92aWRlZCBieSBs
aWJhYnNlaWwtY3BwLgpsaWJhYnNlaWwtY3BwIHVzZXMgZXhlY2luZm8uaCBzaW5jZSB2ZXJzaW9u
IDIwMjEwMzI0LjAgYW5kCmh0dHBzOi8vZ2l0aHViLmNvbS9hYnNlaWwvYWJzZWlsLWNwcC9jb21t
aXQvZGM5NjlmMzRhNzlkMDE5NDk3YWJiNjFjMmEzZjc5YjViNGJlMmVhOQoKMjAyMi4wMi54IHVz
ZXMgMjAyMTExMDIuMCBzbyBJIHRoaW5rIHRoaXMgcGF0Y2ggc2hvdWxkIGJlIGFwcGxpZWQgdG8K
dGhpcyBicmFuY2guCgo+Cj4gLS0KPiBCeWUsIFBldGVyIEtvcnNnYWFyZApCZXN0IFJlZ2FyZHMs
CgpGYWJyaWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
