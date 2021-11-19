Return-Path: <SRS0=y7vk=QG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E6EBC433EF
	for <buildroot@archiver.kernel.org>; Fri, 19 Nov 2021 17:50:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 023836120E
	for <buildroot@archiver.kernel.org>; Fri, 19 Nov 2021 17:50:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 023836120E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0F5882983;
	Fri, 19 Nov 2021 17:50:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9htkX2HmvHRm; Fri, 19 Nov 2021 17:50:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C565482978;
	Fri, 19 Nov 2021 17:50:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 393FA1BF37C
 for <buildroot@lists.busybox.net>; Fri, 19 Nov 2021 17:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28A2C41C34
 for <buildroot@lists.busybox.net>; Fri, 19 Nov 2021 17:50:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ixEEF4lN11uD for <buildroot@lists.busybox.net>;
 Fri, 19 Nov 2021 17:50:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1B21041C30
 for <buildroot@buildroot.org>; Fri, 19 Nov 2021 17:50:22 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8ce3:604:2d0f:2718])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id C0A052003E0;
 Fri, 19 Nov 2021 18:50:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1637344219;
 bh=23CPyN+OWg200pjufd7ZfE2vHEHhtuE4SJO8T197m6Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KoOsKI1H3hCgRuok5t7VV+NVBmPbPEs1v3DFPTXYn39/+WsRmuqAuOKqnsEUZFAKe
 nT2HI12MGeKELIOnflniiC5UbcA7smm/mViBfqXLf0mZfuRu8VwcbI1VJxvCAjbyaI
 1VoUf/MBR+DjNjEjgno+nMQUEMU9t7Pq1NmdlO/5n/OZ82/WJusKXPI2CPXSMqEI/U
 ikh8LClj/QQF5Xo8yznWvBKgwenhs2UdTzVmL0dsY/AORavwBjUgx9a2E4pizoHwic
 0qbNhCShbk88pskImeUxaH8v4abmqWbg/5YzGnYHWqeaSJxzXxXICksoFp/g/Rj+41
 9fxBhftWJZgKQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 19 Nov 2021 18:50:12 +0100
Date: Fri, 19 Nov 2021 18:50:12 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211119175012.GR247986@scaer>
References: <20211119165458.2410686-1-fontaine.fabrice@gmail.com>
 <20211119171046.GQ247986@scaer>
 <CAPi7W81VusJ3puVf8epMCvuHC+sWg-2YbCHcjrpLMoKY9oxkQw@mail.gmail.com>
 <CAPi7W81Q5geT6Qd_mKdu4UPOF3qzmUJd1=4L7tBLagJ0dhJ6jQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPi7W81Q5geT6Qd_mKdu4UPOF3qzmUJd1=4L7tBLagJ0dhJ6jQ@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/2] Revert "package/log4cxx: select boost
 chrono and date-time with gcc < 7"
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
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RmFicmljZSwgQWxsLAoKKHR5cGluZyB0aGlzIHdpdGhvdXQgbGlnaHQsIEkgYWNjaWRlbnRhbGx5
IGJyb2tlIHRoZSBidWxiLi4uIEhvcGVmdWxseSwKdGhlcmUgd2lsbCBiZSBsZXNzIHR5cG9lcyB0
aGFuIGluIG15IHVzdWFsIG1haWxzLCBhcyBJIGFtIGV4dHJhIGNhcmVmdWwKd2hhdCBrZXkgSSBh
bSB0eXBpbmcuIEhleSwgdGhhdCdzIG5vdCBldmVuIGd1YXJhbnRlZWQhIDstXSApCgpPbiAyMDIx
LTExLTE5IDE4OjQzICswMTAwLCBGYWJyaWNlIEZvbnRhaW5lIHNwYWtlIHRodXNseToKPiBMZSB2
ZW4uIDE5IG5vdi4gMjAyMSDDoCAxODozMSwgRmFicmljZSBGb250YWluZQo+IDxmb250YWluZS5m
YWJyaWNlQGdtYWlsLmNvbT4gYSDDqWNyaXQgOgo+ID4gTGUgdmVuLiAxOSBub3YuIDIwMjEgw6Ag
MTg6MTAsIFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiBhIMOpY3JpdCA6
Cj4gPiA+IE9uIDIwMjEtMTEtMTkgMTc6NTQgKzAxMDAsIEZhYnJpY2UgRm9udGFpbmUgc3Bha2Ug
dGh1c2x5Ogo+ID4gPiA+IFRoaXMgcmV2ZXJ0cyBjb21taXQgM2MyMjQ1Y2I2NTc0MWM5NjVmNGJi
ODdkMzVhYzNjNjRmMjUwYTFhZSB0byBtb3ZlCj4gPiA+ID4gdGhlc2Ugc2VsZWN0cyBvbiBib29z
dCBzaWRlIGFzIHRoZSBidWlsZCBmYWlsdXJlIHdhcyByYWlzZWQgd2l0aCBnY2MgPj0KPiA+ID4g
PiA3Lgo+ID4gPiBTbywgaWYgSSB1bmRlcnN0YW5kIGNvcnJlY3RseSwgaWYgd2UganVzdCBhcHBs
eSB0aGlzIHJldmVydCwgYnV0IG5vdCB0aGUKPiA+ID4gZm9sbG93aW5nIHBhdGNoLCB3ZSBicmVh
ayB0aGUgYnVpbGQgYWdhaW4sIHJpZ2h0PyBJZiBzbywgdGhlbiBpdCBtYWtlcwo+ID4gPiB0aGUg
aGlzdG9yeSBub3QgYmktc2VjdGFibGUuCj4gPiBObywgYmFzaWNhbGx5IHRoZSBwYXRjaCB0aGF0
IEknbSByZXZlcnRpbmcgaXMgYSAibm8tb3AiLgoKQWosIE9LLCBzbyB0aGUgb3JkZXIgaW5kZWVk
IGRvZXMgbm90IG1hdHRlciBtdWNoLiBCdXQgc2VtYW50aWNhbGx5LCBpdApkb2VzIG1hdHRlciwg
YW5kIHRoYXQgdGhlIHJldmVydCBjb21lcyBmaXJzdCBpcyB0aGVuIGNvcnJlY3QsIHdpdGggeW91
cgpleHBsYW5hdGlvbnMuCgo+ID4gSXQgZG9lcyBub3QgZml4IGFueXRoaW5nIGFzIHRoZSBidWls
ZCBmYWlsdXJlIGlzIHJhaXNlZCB3aXRoIGdjYyA+PTcsCj4gPiBub3QgZ2NjIDwgNy4KPiA+IEkg
bWFkZSB0aGlzIG1pc3Rha2UsIGJlY2F1c2UgdGhlIGJ1aWxkIGZhaWx1cmUgaXMgb25seSByYWlz
ZWQgc2luY2UKPiA+IGNtYWtlID49IDMuMjEuMyBhbmQKPiBJbiBmYWN0LCBJIG1hZGUgYW5vdGhl
ciBtaXN0YWtlLCB0aGUgYnVpbGQgZmFpbHVyZSBpcyByYWlzZWQgd2l0aAo+IGNtYWtlIDwgMy4y
MS4zLgo+IEkgcmVhbGx5IGhhdGUgY21ha2UgOy0pLiBJJ2xsIHNlbmQgYSB2MiB3aXRoIGFuIHVw
ZGF0ZWQgY29tbWl0IGxvZy4KCkhpaGloaSEgOi0pCgpUaGFua3MhCgpSZWdhcmRzLApZYW5uIEUu
IE1PUklOLgoKPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9LaXR3YXJlL0NNYWtlL2NvbW1pdC8xYWQw
YzVhZTUzZmMwYzRmNzc0MTY2MzM3ZjBlOWM5M2M1NzhjZjliLgo+ID4KPiA+IGNtYWtlIGhhcyB0
aGUgZm9sbG93aW5nIGJlaGF2aW9yOgo+ID4gIC0gaWYgaXQgInJlY29nbml6ZXMiIHRoZSBib29z
dCB2ZXJzaW9uLCBpdCB3aWxsIHNldCB0aGUgYm9vc3QgdGhyZWFkCj4gPiBkZXBlbmRlbmNpZXMg
dG8gY2hyb25vIGRhdGVfdGltZSBhdG9taWMuCj4gPiAgLSBIb3dldmVyLCBpZiBpdCBkb2VzIG5v
dCByZWNvZ25pemUgaXQgKGkuZS4gd2l0aCBjbWFrZSA8IDMuMjEuMyBhbmQKPiA+IGJvb3N0IDEu
NzcuMCksIGl0IHdpbGwgc2V0IHRoZSBib29zdCB0aHJlYWQgZGVwZW5kZW5jaWVzIHRvIGNocm9u
bwo+ID4gYXRvbWljLgo+ID4gPgo+ID4gPiBJbnN0ZWFkLCB0aGUgYm9vc3QgcGF0Y2ggbXVzdCBi
ZSBhcHBsaWVkIGZpcnN0LCBhbmQgb25jZSB0aGF0IGlzIGRvbmUsCj4gPiA+IHRoZW4gd2UgY2Fu
IGFwcGx5IHRoaXMgcmV2ZXJ0Lgo+ID4gPgo+ID4gPiBJZiB0aGUgYWJvdmUgaXMgY29ycmVjdCwg
anVzdCBzYXkgc28sIHdlIGNhbiByZS1vcmRlciB0aGUgcGF0Y2hlcyB3aGVuCj4gPiA+IGFwcGx5
aW5nLi4uCj4gPiA+Cj4gPiA+IFJlZ2FyZHMsCj4gPiA+IFlhbm4gRS4gTU9SSU4uCj4gPiA+Cj4g
PiA+ID4gU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBn
bWFpbC5jb20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gIHBhY2thZ2UvbG9nNGN4eC9Db25maWcuaW4g
fCAyIC0tCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQo+ID4gPiA+Cj4g
PiA+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbG9nNGN4eC9Db25maWcuaW4gYi9wYWNrYWdlL2xv
ZzRjeHgvQ29uZmlnLmluCj4gPiA+ID4gaW5kZXggMjdhNWYwNjk4OC4uNmYxOTU2ZjgyOSAxMDA2
NDQKPiA+ID4gPiAtLS0gYS9wYWNrYWdlL2xvZzRjeHgvQ29uZmlnLmluCj4gPiA+ID4gKysrIGIv
cGFja2FnZS9sb2c0Y3h4L0NvbmZpZy5pbgo+ID4gPiA+IEBAIC0xMiw4ICsxMiw2IEBAIGNvbmZp
ZyBCUjJfUEFDS0FHRV9MT0c0Q1hYCj4gPiA+ID4gICAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX0FQ
Ul9VVElMCj4gPiA+ID4gICAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX0JPT1NUIGlmICFCUjJfVE9P
TENIQUlOX0dDQ19BVF9MRUFTVF83Cj4gPiA+ID4gICAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX0JP
T1NUX0FUT01JQyBpZiAhQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfNwo+ID4gPiA+IC0gICAg
IHNlbGVjdCBCUjJfUEFDS0FHRV9CT09TVF9DSFJPTk8gaWYgIUJSMl9UT09MQ0hBSU5fR0NDX0FU
X0xFQVNUXzcKPiA+ID4gPiAtICAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfQk9PU1RfREFURV9USU1F
IGlmICFCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF83Cj4gPiA+ID4gICAgICAgc2VsZWN0IEJS
Ml9QQUNLQUdFX0JPT1NUX1RIUkVBRCBpZiAhQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfNwo+
ID4gPiA+ICAgICAgIGhlbHAKPiA+ID4gPiAgICAgICAgIEFwYWNoZSBsb2c0Y3h4IGlzIGEgbG9n
Z2luZyBmcmFtZXdvcmsgZm9yIEMrKyBwYXR0ZXJuZWQKPiA+ID4gPiAtLQo+ID4gPiA+IDIuMzMu
MAo+ID4gPiA+Cj4gPiA+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiA+ID4gPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gPiA+ID4gYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKPiA+ID4gPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QKPiA+ID4KPiA+ID4gLS0KPiA+ID4gLi0tLS0tLS0tLS0tLS0t
LS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0t
LS0tLS0tLS4KPiA+ID4gfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAv
IlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKPiA+ID4gfCArMzMgNjYyIDM3
NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAg
ICAgICAgICAgIHwKPiA+ID4gfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0t
OiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKPiA+ID4gfCBodHRwOi8v
eW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAg
Y29uc3BpcmFjeS4gIHwKPiA+ID4gJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0t
LS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKPiA+IEJlc3QgUmVn
YXJkcywKPiA+Cj4gPiBGYWJyaWNlCgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0t
LS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFu
biBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJp
Y3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIg
fCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0
MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUg
aXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRN
TCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
