Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9825C48BF6
	for <buildroot@archiver.kernel.org>; Wed, 21 Feb 2024 06:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 372D28219A;
	Wed, 21 Feb 2024 06:28:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VgwGnowDTPVg; Wed, 21 Feb 2024 06:28:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B59B182137
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B59B182137;
	Wed, 21 Feb 2024 06:28:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 16B231BF487
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 06:28:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04374415C7
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 06:28:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aJnqPzVn761t for <buildroot@lists.busybox.net>;
 Wed, 21 Feb 2024 06:28:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 121D4415A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 121D4415A9
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 121D4415A9
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 06:28:26 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 4CD1313F861;
 Wed, 21 Feb 2024 07:28:20 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 21 Feb 2024 07:28:20 +0100
Date: Wed, 21 Feb 2024 07:28:20 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <ZdWYBJ7mt1L2CTjL@landeda>
References: <c90e4512-405c-40fb-b597-1a04d7449afa@clermont.in2p3.fr>
 <d2a4dc21-1140-497d-91d6-2dde78e98cd0@smile.fr>
 <a6433199-1362-4d80-9ccf-389d8e7ed517@clermont.in2p3.fr>
 <643b99fe-655d-45b9-80dd-f47bb53efcb2@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <643b99fe-655d-45b9-80dd-f47bb53efcb2@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1708496903;
 bh=h4oMT926Auw3ITm1lnMOF2HE2qHnkMhjLBueLeFjDVU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qxLa+wtHk4Qd3TUT2WadZqAxPrGq+Qofvb+m9ULdBYZvsvYW6PLKTePLlTCJiCjPf
 AshswXkFgPt1peRROa9yPi/j34cAfrvQ9wL5GhTDpikl5l93IptzoxjmJZAKwvpXL+
 rhEMfJcSlbUGf5QzpAmNO9V6eQHTHTjgatHOHz0Zng/ic/6NV5h8WPRezq9DGSRY6b
 FQO6lu3ozi9BGQvRq9tm4v/RrTkYUFHI2qKtfkAizjYCmnVxzfuB5HEvm3hOC7dKj1
 r8S0ZVg1fWX9m8AD43XSY7710/fad0XNIgbUe2hJbqiaJPfg7C2p4OGmvIjPM8CwDd
 eo+PeKtemJIGQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=qxLa+wtH
Subject: Re: [Buildroot] [PATCH 1/1] package/intel-socfpga-hwlib: add new
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
Cc: David Picard <david.picard@clermont.in2p3.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Um9tYWluLCBEYXZpZCwgQWxsLAoKT24gMjAyNC0wMi0yMCAyMzoyNiArMDEwMCwgUm9tYWluIE5h
b3VyIHNwYWtlIHRodXNseToKPiBMZSAyMC8wMi8yMDI0IMOgIDIyOjE4LCBEYXZpZCBQaWNhcmQg
YSDDqWNyaXTCoDoKWy0tU05JUC0tXQo+ID4+PiArSU5URUxfU09DRlBHQV9IV0xJQl9MSUNFTlNF
ID0gUFJPUFJJRVRBUlkKPiA+PiBJdCdzIHVuZXhwZWN0ZWQgdG8gZmluZCBhIFBST1BSSUVUQVJZ
IHRvb2wgaW4gYSBnaXRidWIgYWNjb3VuZCB3aXRoICJvcGVuc291cmNlIgo+ID4+IGluIHRoZWly
IG5hbWUgOikKCkl0J3Mgbm90IGNvbW1vbiwgYnV0IHdlIGRvIGFscmVhZHkgaGF2ZSBhIGJ1bmNo
IG9mIHN1Y2ggcGFja2FnZXM6CgogICAgJCBnaXQgZ3JlcCAtRSAnUFJPUFJJRVRBUllcPicgcGFj
a2FnZS8gYm9vdC8gfHdjIC1sCiAgICAxMwoKWy0tU05JUC0tXQo+ID4gSSBkaWQgaXQgb24gcHVy
cG9zZS4gVGhpcyBwYWNrYWdlIGlzIGNhbGxlZCBhIGxpYnJhcnksIGJ1dCBpdCByZWFsbHkgaXMg
YSBidW5jaAo+ID4gb2YgQyBmaWxlcy4gWW91IG9ubHkgdXNlIGEgc3Vic2V0LCBkZXBlbmRpbmcg
b24geW91ciBoYXJkd2FyZS4gVGhpcyBjb2RlIHdhcwo+ID4gbWFkZSB0byBiZSBjb21waWxlZCBp
biB0aGUgYXBwbGljYXRpb24sIG5vdCBhcyBhIGNvbnZlbnRpb25hbCBsaWJyYXJ5Lgo+ID4gSSBj
b3VsZCBjb3B5IHRoZSBmaWxlcyB0byBTVEFHSU5HLCBidXQgY2xlYW5pbmcgd291bGQgYmUgbW9y
ZSBjb21wbGljYXRlZCBhbmQgaXQKPiA+IHdvdWxkIHdhc3RlIHNvbWUgZGlzayBzcGFjZS4KPiBP
aywgbWF5YmUgaXMgc2hvdWxkIG5vdCBiZSBwYWNrYWdlZCBpbiBCdWlsZHJvb3QgdGhlbi4KPiBX
aGVuIGEgcGFja2FnZSBpcyBidWlsZCBieSBCdWlsZHJvb3QsIGl0IGNhbiBnZW5lcmF0ZSBhIGJp
bmFyeSwgYSBsaWJyYXJ5IG9yCj4gcHJvdmlkZSBzb21lIGhlYWRlciBmaWxlcy4KPiBJZiB5b3Vy
IGFwcGxpY2F0aW9uIGRvZXNuJ3QgYnVuZGxlIGludGVsLXNvY2ZwZ2EtaHdsaWIgc291cmNlcyBi
dXQgaXQgcmVxdWlyZXMKPiBpdCB0byBidWlsZCBpbiBCdWlsZHJvb3QsIHlvdSBjYW4gdXNlIExJ
QkZPT19FWFRSQV9ET1dOTE9BRFMgdG8gYWRkIGFuIGV4dHJhCj4gZG93bmxvYWQgc3RlcC4KCkkg
YWdyZWUgd2l0aCBSb21haW4uIEl0IGRvZXMgbm90IG1ha2UgbWl1Y2ggc2Vuc2UgSU1ITyB0byBq
dXN0IGRyb3AKc291cmNlIGZpbGVzIGxpa2UgdGhhdC4gQW5kIHRoZSBfRVhUUkFfRE9XTkxPQURT
IG1lY2hhbmlzbSBpcyBleGFjdGx5CnRhaWxvcmVkIHRvIHN1Y2ggY2FzZXMuCgpSZWdhcmRzLApZ
YW5uIEUuIE1PUklOLgoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0t
LS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9S
SU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25z
cGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENB
TVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0t
LS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8
CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAg
ICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1e
LS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
