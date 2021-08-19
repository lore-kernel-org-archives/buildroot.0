Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBB3CC4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 21:10:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B4796108D
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 21:10:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6B4796108D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EC3B605E9;
	Thu, 19 Aug 2021 21:10:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G0eMOoPlb9a5; Thu, 19 Aug 2021 21:10:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A3C9605EE;
	Thu, 19 Aug 2021 21:10:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D0D361BF4D5
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 21:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD5E5605EE
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 21:10:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1vZRes1Hm1Ir for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 21:10:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AC722605E9
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 21:10:03 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9904:2733:9b91:ffcc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 189892003B4;
 Thu, 19 Aug 2021 23:09:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1629407402;
 bh=j0siWC1k04QpRzutmNZX9U5ovMHgqdWw186nY/8Vaqc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f1N83s+vowTQ8uDyrBR7h39JJyvp8KpUdzkwPYSLeq8hD0ytcv4IwiFRmBMA3ZBa2
 htJRhyQ3TU+Bk98LGGeu3lHUapGpEsqk8Duilxr4GQ1II0jxKDmzHV8jTpRGMvdSZx
 CRarwDleZeTttlHv7W/87thVW0KWZRI6KT9JTUdsc4nFTLPJk+GGveZwF0rSgKdwmX
 VwbfmGrfUSCjTTfE9NhOhJhhf2nD5/FN9RJ0DKmAkw9or1O4nOLPW5huUZKFIz+1Or
 JtEETrQYp3HFXxVGs2mp0wDiB4vEyO7akRNJbWDNKWMp3JAczQdv05i7y/qOUBstKL
 TtslM+k6EfUyg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 19 Aug 2021 23:09:55 +0200
Date: Thu, 19 Aug 2021 23:09:55 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210819210955.GG27036@scaer>
References: <20210817221530.2343233-1-fontaine.fabrice@gmail.com>
 <20210819225118.361fe904@windsurf>
 <CAPi7W83S32fCdbuv-rGxz2QoTjWLFnA=AhL0AnG3AwaNSHMVxA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPi7W83S32fCdbuv-rGxz2QoTjWLFnA=AhL0AnG3AwaNSHMVxA@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] Revert "package/libshout: enable
 optional dependency for libressl"
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

RmFicmljZSwgQWxsLAoKT24gMjAyMS0wOC0xOSAyMjo1NyArMDIwMCwgRmFicmljZSBGb250YWlu
ZSBzcGFrZSB0aHVzbHk6Cj4gTGUgamV1LiAxOSBhb8O7dCAyMDIxIMOgIDIyOjUxLCBUaG9tYXMg
UGV0YXp6b25pCj4gPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IGEgw6ljcml0IDoKPiA+
Cj4gPiBPbiBXZWQsIDE4IEF1ZyAyMDIxIDAwOjE1OjMwICswMjAwCj4gPiBGYWJyaWNlIEZvbnRh
aW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gPiBUaGlzIHJl
dmVydHMgY29tbWl0IDQ2YjhmYjc1MDBlY2NhNjVhNzk1MDczMThmZDMwNTIyMDg1NTljMDkgaW5k
ZWVkIGlmCj4gPiA+IGxpYnJlc3NsIGlzIHNlbGVjdGVkIGFzIHRoZSBvcGVuc3NsIHByb3ZpZGVy
LCB0aGUgQlIyX1BBQ0tBR0VfT1BFTlNTTAo+ID4gPiBjb25kaXRpdGlvbiB3aWxsIGFsd2F5cyBi
ZSB1c2VkIGFuZCB0aGUgQlIyX1BBQ0tBR0VfTElCUkVTU0wgY29uZGl0aW9uCj4gPiA+IHdpbGwg
bmV2ZXIgYmUgdHJpZ2dlcmVkLiBNb3Jlb3ZlciwgbGlicmVzc2wgcHJvdmlkZXMgYSBwa2ctY29u
ZmlnIGZpbGUuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZv
bnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+ID4gPiAtLS0KPiA+ID4gIHBhY2thZ2UvbGlic2hv
dXQvbGlic2hvdXQubWsgfCAzIC0tLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgZGVsZXRpb25z
KC0pCj4gPgo+ID4gSSd2ZSBhcHBsaWVkIHRvIG1hc3RlciwgYmVjYXVzZSB5b3UncmUgcmlnaHQs
IHdoYXQKPiA+IDQ2YjhmYjc1MDBlY2NhNjVhNzk1MDczMThmZDMwNTIyMDg1NTljMDkgaGFzIGFk
ZGVkIGlzIGEgbm8tb3AsIGJlY2F1c2UKPiA+IEJSMl9QQUNLQUdFX0xJQlJFU1NMIGNhbm5vdCBi
ZSAneScgd2l0aG91dCBCUjJfUEFDS0FHRV9PUEVOU1NMIGFsc28KPiA+IGJlaW5nICd5Jy4KPiA+
Cj4gPiBIb3dldmVyLCBjb3VsZCB5b3UgbG9vayBhdCB0aGUgYXV0b2J1aWxkZXIgaXNzdWUgdGhh
dAo+ID4gNDZiOGZiNzUwMGVjY2E2NWE3OTUwNzMxOGZkMzA1MjIwODU1OWMwOSB3YXMgaW50ZW5k
ZWQgdG8gZml4LCBhbmQgc2VlCj4gPiB3aGF0IGlzIHRoZSBwcm9wZXIgZml4IGZvciBpdCA/Cj4g
VGhlIGF1dG9idWlsZGVyIGxpbmsgZ2l2ZW4gaW4gdGhlIGNvbW1pdCBtZXNzYWdlIHJldHVybnMg
NDA0LgoKQWgsIHRoYXQncyBmcm9tIGJlZm9yZSB3ZSBsb3N0IHRoZSBEQiBpbiBhbiBIREQgY3Jh
c2guLi4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+ID4gQmVzdCByZWdhcmRzLAo+ID4KPiA+
IFRob21hcwo+ID4gLS0KPiA+IFRob21hcyBQZXRhenpvbmksIENUTywgQm9vdGxpbgo+ID4gRW1i
ZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwo+ID4gaHR0cHM6Ly9ib290bGluLmNv
bQo+IEJlc3QgUmVnYXJkcywKPiAKPiBGYWJyaWNlCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRy
b290QGJ1c3lib3gubmV0Cj4gaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0t
Li0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJ
TiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNw
aXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FN
UEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0t
LS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwK
fCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAg
IHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4t
LS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVzeWJveC5uZXQKaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
