Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AE8DC433FE
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 05:34:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97A4F6128A
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 05:34:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 97A4F6128A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6915F82FBE;
	Tue,  5 Oct 2021 05:34:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JGzmAvxP7gpT; Tue,  5 Oct 2021 05:34:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC28683D06;
	Tue,  5 Oct 2021 05:34:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8BC821BF301
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 05:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7442D404B1
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 05:34:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jKYlRje8CFR6 for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 05:34:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A66640452
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 05:33:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:19f9:cbe2:8053:b89b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 98F9119F4F3;
 Tue,  5 Oct 2021 07:33:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1633412035;
 bh=2zEdGXwCF5I0gQ9M20LS+kTPqlLgUXeNvwrIk6oorDw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j5zzRx7EpG33XyXichcyxqeiG106ByNNhtnw6D40+cJHujXdToYfvZicl5BGUKSYy
 QLc+zTxZDX+WLhnhTdOnONLLq1Md/krzk8rx54xQz3qMZz9Nq/W1umbcUmDLKYdp65
 V9pwY4PzYzJCJAHD4sMoVyqKHLD+qfqqv9fD6zP1g5t2RbNKVXR9jXMxscA5iXuAN0
 n0tgfIndtEvxrGBv+Lnsj9glLve9TQ77ZNGOvJtrDKF+4UmyXGCrZx8iqQD+FE/Eep
 Quviqme5yli0ZLLg2Wk81b23H1ZSlay554iyHERWWvqqoZH/ExQoSE8/GyYmitsorI
 5LQi3KpwGKHzg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 05 Oct 2021 07:33:51 +0200
Date: Tue, 5 Oct 2021 07:33:51 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Message-ID: <20211005053351.GG1504958@scaer>
References: <20210919141053.3afc7389@windsurf>
 <d2a735d1-aadb-2c28-72f3-babef83448cc@grenoble.cnrs.fr>
 <11632800-793a-6d2d-8ee4-0182092c8f35@grenoble.cnrs.fr>
 <878rz9j97a.fsf@dell.be.48ers.dk>
 <d39a8eba-8e49-a9a2-6ec3-62c6969a0af9@grenoble.cnrs.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d39a8eba-8e49-a9a2-6ec3-62c6969a0af9@grenoble.cnrs.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] Issue with capture of emulator output in runtime
 test infra
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

RWRnYXIsIEFsbCwKCk9uIDIwMjEtMTAtMDQgMjI6NDYgKzAyMDAsIEVkZ2FyIEJvbmV0IHNwYWtl
IHRodXNseToKPiBBcyBJIHN1Z2dlc3RlZCB0aGF0IHRoZSB3cmFwcGluZyBjb3VsZCBiZSBwcmV2
ZW50ZWQgYnkgc2V0dGluZyB0aGUKPiAiQ09MVU1OUyIgZW52aXJvbm1lbnQgdmFyaWFibGUgdG8g
YSBsYXJnZSB2YWx1ZSAoYnV0IG5vIGxhcmdlciB0aGFuCj4gMjk5OTkpLCBQZXRlciBLb3JzZ2Fh
cmQgd3JvdGU6Cj4gCj4gPiAyOTk5OSBjaGFycyBzaG91bGQgYmUgZW5vdWdoIGZvciBhbnlib2R5
ICh0bSkgOykKPiA+Cj4gPiBDYXJlIHRvIHNlbmQgYSBwYXRjaCBmb3IgdGhpcz8KPiAKPiBJIHdv
dWxkIGJlIGhhcHB5IHRvIGRvIHNvLiBIb3dldmVyLCBhcyBJIGFtIG5vdCBmYW1pbGlhciB3aXRo
IHRoaXMgd2hvbGUKPiB0ZXN0aW5nIGluZnJhc3RydWN0dXJlLCB0aGUgcGF0Y2ggd291bGQgbmVl
ZCB0byBiZSB0ZXN0ZWQgYnkgc29tZW9uZQo+IGVsc2UuCj4gCj4gUmlnaHQgbm93IEkgYW0gdHJ5
aW5nIHRvIGNoZWNrIG15IGh5cG90aGVzaXMgdGhhdCBzZXR0aW5nIENPTFVNTlM9Mjk5OTkKPiBp
cyBlbm91Z2ggdG8gbWFrZSBhc2ggKEJ1c3lib3gncyBzaGVsbCkgYmVoYXZlIHByb3Blcmx5LiBB
bmQgSSBmb3VuZCBhCj4gbGl0dGxlIHN1cnByaXNlOiB0aGUgY29tbWFuZAo+IAo+ICAgICBleHBv
cnQgQ09MVU1OUz0yOTk5OQo+IAo+IGRvZXMgX25vdF8gYWRkIHRoZSBDT0xVTU5TIHZhcmlhYmxl
IHRvIHRoZSBzaGVsbCdzIGVudmlyb25tZW50LiBUaGUKPiB2YXJpYWJsZSBpcyBhZGRlZCB0byB0
aGUgZW52aXJvbm1lbnQgb2YgdGhlIHByb2Nlc3NlcyBzdGFydGVkIGJ5IHRoZQo+IHNoZWxsLCBi
dXQgaXQgaXMgbm90IGluIHRoZSBlbnZpcm9ubWVudCBvZiB0aGUgc2hlbGwgaXRzZWxmLiBJdCBk
b2Vzbid0Cj4gcHJldmVudCB0aGUgc2hlbGwgZnJvbSB3cmFwcGluZyB0aGUgY29tbWFuZHMgYXQg
ODDCoGNvbHVtbnMuCj4gCj4gUmlnaHQgbm93IHRoZSBmaXggSSBoYXZlIGluIG1pbmQgaXMgdG8g
cnVuCj4gCj4gICAgIENPTFVNTlM9Mjk5OTkgZXhlYyBzaAoKV2hhdCBhYm91dCBhY3R1YWxseSB0
ZWxsaW5nIHRoZSBzaGVsbCB0aGUgc2l6ZSB3ZSB3YW50OjoKCiAgICAjIHN0dHkgY29sdW1ucyAy
OTk5OQoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCj4gYWZ0ZXIgbG9nZ2luZyBpbiwgYXQgdGhl
IGVuZCBvZiB0aGUgbG9naW4oKSBtZXRob2QuIEkganVzdCBjaGVja2VkIHRoYXQKPiByZWxvYWRp
bmcgYXNoIGluIHRoaXMgd2F5IGRvZXMgcHV0IHRoZSB2YXJpYWJsZSBpbiB0aGUgc2hlbGwncwo+
IGVudmlyb25tZW50LCBhbmQgZG9lcyBmaXggdGhpcyB3cmFwcGluZyBiZWhhdmlvci4gQXQgbGVh
c3Qgb24gdGhlIGNvcHkKPiBvZiBCdXN5Ym94IEkgY29tcGlsZWQgb24gbXkgVWJ1bnR1LCBJIHN0
aWxsIGhhdmUgdG8gdGVzdCBpdCBvbiBhCj4gQnVpbGRyb290IGVudmlyb25tZW50Lgo+IAo+IERv
ZXMgdGhpcyBzb3VuZCBsaWtlIGFuIGFwcHJvcHJpYXRlIGZpeD8KPiAKPiBSZWdhcmRzLAo+IAo+
IEVkZ2FyLgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgotLSAK
Li0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0t
LS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1i
ZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYy
IDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAg
ICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAg
WCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlz
LWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFj
eS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0t
LS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
