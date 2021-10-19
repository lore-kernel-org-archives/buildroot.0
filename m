Return-Path: <SRS0=TKET=PH=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E09FCC433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 21:29:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 434746101A
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 21:29:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 434746101A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C408E4014E;
	Tue, 19 Oct 2021 21:29:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yFu6KaN0BSeN; Tue, 19 Oct 2021 21:29:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5752403D4;
	Tue, 19 Oct 2021 21:29:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B1E441BF361
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 21:29:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE44E831CA
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 21:29:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Us0TzGQnhSO for <buildroot@lists.busybox.net>;
 Tue, 19 Oct 2021 21:29:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 883E4831A2
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 21:29:50 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id o11so8623517ljg.10
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 14:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=p7lNRr3j4ScbsjNUaV9+ojQ4XC9Xz8Iuv+J4ipDa2TQ=;
 b=lkfp3uM9r0lPHuvbzzLc1BKzGnryA/FCAAsY80jm0fiK7poA6mz1tZbchUhiqp+yNH
 ZTI+thMCsgKSz7EoIVundDhygWfhi0c7fEb1Qaba0UYSQ96Kr9OHliTUVF+K1YUmmlHw
 ldWq5zpshwhbFXWuOpXiOw1T12s7XeisgWNlZCDia+H11EFRtii5ZkhoYQbq55wtT/Qe
 ozI7aFai27biGa0Zsn0vuOqvrz+bhWzmmKrtextpSZUSLQ9AWlPv0sUa7iXeMEbIWe7X
 vlDV5y6fUCF7dyN/eEDELfaIPTd0yqeboH3jxpHeOS5hG3mGcpHbZhlM+oykUpOO6jWf
 wXlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=p7lNRr3j4ScbsjNUaV9+ojQ4XC9Xz8Iuv+J4ipDa2TQ=;
 b=wgiKSmVfzg4CLoC3vzgcKhxFpNo/Z0z0mgbSm5ZDDnIQ1UJF4sUXcQ4+rGNm8UJfVm
 bHhrb2RCB7MPflz6PG0YopO0cX3/312fetSqqv63dNqYmNyGtlohhxP9QZkxgq0Xaa56
 HbI7SYz9SQxHGd+a1XVBF+SFtXwmlWlhpOvD3/ms+eJYchMvKzXsog/77f8p2JLjBBqU
 TjqexfSrmOWPB2enuC8pj9B8XvExtS5SOUdbSHQib5zA+55OZS4sivd38/uSUZPfZREt
 0OIYlcb/VjGjntdZraZClqSfmv4jet8qQXOYdGdS/KXrbo9V+naK+QaHtW6dssKZ4d0j
 0G4A==
X-Gm-Message-State: AOAM5321FFVhcVNyVWUUA0qvJ7laC8vhW4Lc5YaD7Ocrsw2MRnDoXahl
 T/FPIFjGZmu+IcmQjLVAPHZdhwq7VMqmqJgWnjZ1JfauSrE=
X-Google-Smtp-Source: ABdhPJxSc6Ij3UQs1ikPaxJyGYwljMwUk0sKqopSAwEWffXHCkYeFAKVga3ZJHAftljn0NMw+Wcad/1JCpKGSM9KYTQ=
X-Received: by 2002:a2e:b611:: with SMTP id r17mr8967063ljn.336.1634678988010; 
 Tue, 19 Oct 2021 14:29:48 -0700 (PDT)
MIME-Version: 1.0
References: <20211013065446.1857356-1-fontaine.fabrice@gmail.com>
 <20211018223458.6d52ee5e@windsurf>
In-Reply-To: <20211018223458.6d52ee5e@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 19 Oct 2021 23:28:23 +0200
Message-ID: <CAPi7W83t+A1eip2Ewr7pTwm+PZmUgTWq_MOuaH5UswHtbPSjiQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/tpm2-tss: needs host-acl
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgbHVuLiAxOCBvY3QuIDIwMjEgw6AgMjI6MzUsIFRob21hcyBQZXRhenpvbmkKPHRob21hcy5w
ZXRhenpvbmlAYm9vdGxpbi5jb20+IGEgw6ljcml0IDoKPgo+IE9uIFdlZCwgMTMgT2N0IDIwMjEg
MDg6NTQ6NDYgKzAyMDAKPiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWls
LmNvbT4gd3JvdGU6Cj4KPiA+IEFkZCBob3N0LWFjbCBtYW5kYXRvcnkgZGVwZW5kZW5jeSBmb3Ig
c2V0ZmFjbCB0byBhdm9pZCB0aGUgZm9sbG93aW5nCj4gPiBidWlsZCBmYWlsdXJlIHNpbmNlIGJ1
bXAgdG8gdmVyc2lvbiAzLjEuMCBpbiBjb21taXQKPiA+IDQ3MGUyZTliYzUyMTExODQ0MzFmYmM4
NjgzNTlhOWQ2OTVlNjI0ZjQgYW5kCj4gPiBodHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2Fy
ZS90cG0yLXRzcy9jb21taXQvOWQ0MmY0ZGJkZTZhOTQ3MjRlOTVkNTdjMzMzY2RhNzcxMWRkYTU3
YzoKPgo+IFNvIHRoaXMgY29tbWl0IGFkZHM6Cj4KPiAjIENoZWNrIGFsbCB0b29scyB1c2VkIGJ5
IG1ha2UgaW5zdGFsbAo+IEFTX0lGKFt0ZXN0ICIkSE9TVE9TIiA9ICJMaW51eCJdLAo+ICAgICAg
IFtFUlJPUl9JRl9OT19QUk9HKFtncm91cGFkZF0pCj4gICAgICAgIEVSUk9SX0lGX05PX1BST0co
W3VzZXJhZGRdKQo+ICAgICAgICBFUlJPUl9JRl9OT19QUk9HKFtpZF0pCj4gICAgICAgIEVSUk9S
X0lGX05PX1BST0coW2Nob3duXSkKPiAgICAgICAgRVJST1JfSUZfTk9fUFJPRyhbY2htb2RdKQo+
ICAgICAgICBFUlJPUl9JRl9OT19QUk9HKFtta2Rpcl0pCj4gICAgICAgIEVSUk9SX0lGX05PX1BS
T0coW3NldGZhY2xdKV0pCj4KPiBCdXQgaW4gdGhlIGNvbnRleHQgb2YgQnVpbGRyb290LCB1c2lu
ZyBncm91cGFkZCwgdXNlcmFkZCwgY2hvd24sIGNobW9kLAo+IHNldGZhY2wgYXQgaW5zdGFsbCB0
aW1lIGNhbm5vdCB3b3JrLCBzaW5jZSB3ZSdyZSBub3QgZG9pbmcgIm1ha2UKPiBpbnN0YWxsIiBh
cyByb290Lgo+Cj4gU28gYXJlIHdlIHN1cmUgdGhhdCBhZGRpbmcgaG9zdC1hY2wgYXMgYSBkZXBl
bmRlbmN5IHRvIGdldCBhIGhvc3QKPiB2YXJpYW50IG9mIHNldGZhY2wgaXMgcmVhbGx5IHRoZSBn
b29kIHNvbHV0aW9uPwo+Cj4gSG93IGlzIGl0IGhhbmRsZWQgZm9yIGdyb3VwYWRkL3VzZXJhZGQv
Y2hvd24vY2htb2QgdG9kYXkgPwpncm91cGFkZC91c2VyYWRkL2Nob3duL2NobW9kIGFyZSBjYWxs
ZWQgc2luY2UgdmVyc2lvbiAzLjAuMCBhbmQKaHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdh
cmUvdHBtMi10c3MvY29tbWl0L2QwMWMyNGU2Y2IwOTVlMThjNWUyOWFmNGEzMDE4MDEwYjMyMzBh
NmQKCnNldGZhY2wgaXMgY2FsbGVkIHNpbmNlIHZlcnNpb24gMy4wLjAgYW5kCmh0dHBzOi8vZ2l0
aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdHNzL2NvbW1pdC84MTFlNDUxYzk0MjU0NDk2MzM4
ZDM2NzgzY2RhNDRhNzcyOWIwODVhCgpCdXQgbW9yZSBpbXBvcnRhbnRseSwgYWxsIHRob3NlIGZ1
bmN0aW9ucyBhcmUgbm90IGV2ZW4gdXNlZCBvbiBhCnRhcmdldCB3aXRob3V0IHN5c3RlbWQgYW5k
IGEgaG9zdCB3aXRoCnN5c3RlbWQte3N5c3VzZXJzLHRtcGZpbGVzfSBiZWNhdXNlIHRwbTItdHNz
IHRyeSB0byBpbnN0YWxsIGZpbGVzIGluCiQoVEFSR0VUX0RJUikvZXRjL3tzeXN1c2Vycyx0bXBm
aWxlc30uZCB3aGljaCBkb24ndCBldmVuIGV4aXN0IGlmCkJSMl9JTklUX1NZU1RFTUQgaXMgbm90
IHNldC4KRXZlbiBpZiBCUjJfSU5JVF9TWVNURU1EIGlzIHNldCwgdGhlIHBhdGggaXMgd3Jvbmcg
YXMgaXQgc2hvdWxkIGJlCmluc3RhbGxlZCBpbiAkKFRBUkdFVF9ESVIpL3Vzci9saWIve3N5c3Vz
ZXJzLHRtcGZpbGVzfS5kCgpUbyBjb25jbHVkZSwgSSB3b3VsZCBzYXkgdGhhdCBpbnN0YWxsIG9m
IHRwbTItdHNzIGlzIHBhcnRpYWxseSBicm9rZW4Kc2luY2UgYXQgbGVhc3QgYnVtcCB0byB2ZXJz
aW9uIDMuMC4wIGluIGNvbW1pdAo4OWYzZDkwZTI0YmIyNGI3MGZjNGEzN2JmOGNmZjYxODY2NzI0
NzVjLgo+Cj4gVGhvbWFzCj4gLS0KPiBUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VP
LCBCb290bGluCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJh
aW5pbmcKPiBodHRwczovL2Jvb3RsaW4uY29tCkJlc3QgUmVnYXJkcywKCkZhYnJpY2UKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
