Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B4DAC433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 20:44:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0A3361074
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 20:44:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D0A3361074
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1F6080FF7;
	Mon, 27 Sep 2021 20:44:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JJyk3XyUQDnN; Mon, 27 Sep 2021 20:44:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C247780E3E;
	Mon, 27 Sep 2021 20:44:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 76E5D1BF239
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 20:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54EA9402BE
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 20:44:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NP5asWM6nwN2 for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 20:44:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D44C440207
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 20:44:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9ded:7cc8:164a:d8a6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 9BC2D7802D7;
 Mon, 27 Sep 2021 22:43:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1632775441;
 bh=YCrzSoAveJwJAC35qAjW/2VEN7Px0ytZPeOWR7aYwNQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FiP3Upp6K0+r1FKncgTZ6iMuaXs07soq23veHY7KlB+IjiY4N+6XH+1CDjNBlY4dE
 4KjKqXFSMIGefI+1D9gJMh9lC9Aot/O0+U+g+QqVNsmDY70QseER9/aRwGzgwdP7uT
 V1cK2waBH865/GN+icS6/obPOXpmJOT76UErUCooGRc7fTm4HgVT9FlbrWCh3PVcN6
 wbvuNNSPbKyQRYnTooeFE4AbxlC4/aYCRE9PNA/L+AY2DKGzAjDllo2k54DxtscusG
 LNX3rWoFohGatJ4Eb2QNzTacccjMkk4yx1o/f7ELzkxZWmdo2YgYfZZ/T9pASnklI+
 +LeBFRmTiYrzA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 27 Sep 2021 22:43:55 +0200
Date: Mon, 27 Sep 2021 22:43:55 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Kory Maincent <kory.maincent@bootlin.com>
Message-ID: <20210927204355.GE1504958@scaer>
References: <20210923155726.87851-1-kory.maincent@bootlin.com>
 <20210923155726.87851-4-kory.maincent@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210923155726.87851-4-kory.maincent@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v3 3/7] fs/iso9660: add support to Grub EFI
 bootloader in the image
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
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

S8O2cnksIEFsbCwKCk9uIDIwMjEtMDktMjMgMTc6NTcgKzAyMDAsIEtvcnkgTWFpbmNlbnQgc3Bh
a2UgdGh1c2x5Ogo+IEFkZCBzdXBwb3J0IHRvIGJvb3QgdGhlIEdydWIgYm9vdGxvYWRlciBmcm9t
IGFuIEVGSSBCSU9TIGluIHRoZSBJU085NjYwCj4gaW1hZ2UuCj4gRm9yIHRoYXQgd2UgbmVlZCB0
byBjcmVhdGUgRUZJIFN5c3RlbSBQYXJ0aXRpb24gKEVTUCkuIFRoZSBFU1AgaXMgYSB2ZmF0Cj4g
cGFydGl0aW9uIHdoaWNoIGNvbnRhaW4gdGhlIEdydWIyIGJpbmFyeSBhdCB0aGUgL0VGSS9CT09U
LyBsb2NhdGlvbi4KPiB4b3JyaXNvIGNvbW1hbmQgd2lsbCBnZW5lcmF0ZSB0aGUgaXNvIGltYWdl
IGluY2x1ZGluZyB0aGUgRVNQLgo+IAo+IFdlIG5vdGljZSBHcnViIGNhbiBub3QgcmVhZCBhbmQg
bW91bnQgdGhlIEVTUCwgdGhlcmVmb3JlIHdlIHBsYWNlIHRoZSBHcnViCj4gY29uZmlndXJhdGlv
biBmaWxlIGluIHRoZSBJU085NjYwIHBhcnRpdGlvbi4gQSBHcnViMiBidWlsdGluIGNvbmZpZ3Vy
YXRpb24KPiBuZWVkIHRvIGJlIHVzZWQgdG8gdGVsbCBHcnViMiB0byBzZWFyY2ggYXV0b21hdGlj
YWxseSBpdHMgY29uZmlndXJhdGlvbgo+IGZpbGUgaW4gdGhlIElTTzk2NjAgcGFydGl0aW9uLiBV
c2UgJ3NldCByb290PShjZDApJyBpbiB0aGUgY29uZmlndXJhdGlvbgo+IGZpbGUgcGFzc2VkIHRv
IEJSMl9UQVJHRVRfR1JVQjJfQlVJTFRJTl9DT05GSUdfRUZJLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEtvcnkgTWFpbmNlbnQgPGtvcnkubWFpbmNlbnRAYm9vdGxpbi5jb20+Cj4gLS0tClstLVNOSVAt
LV0KPiBkaWZmIC0tZ2l0IGEvZnMvaXNvOTY2MC9pc285NjYwLm1rIGIvZnMvaXNvOTY2MC9pc285
NjYwLm1rCj4gaW5kZXggMjM0MjFhOWE1Yy4uOTIxZWZhMWIwMiAxMDA2NDQKPiAtLS0gYS9mcy9p
c285NjYwL2lzbzk2NjAubWsKPiArKysgYi9mcy9pc285NjYwL2lzbzk2NjAubWsKPiBAQCAtNTcs
NyArNTcsMTIgQEAgZWxzZQo+ICBST09URlNfSVNPOTY2MF9UTVBfVEFSR0VUX0RJUiA9ICQoVEFS
R0VUX0RJUikKPiAgZW5kaWYKPiAgCj4gLWlmZXEgKCQoQlIyX1RBUkdFVF9ST09URlNfSVNPOTY2
MF9HUlVCMikseSkKPiAraWZlcSAoJChCUjJfUkVQUk9EVUNJQkxFKSx5KQo+ICtST09URlNfSVNP
OTY2MF9WRkFUX09QVFMgPSAtLWludmFyaWFudAo+ICtST09URlNfSVNPOTY2MF9GSVhfVElNRSA9
IHRvdWNoICQoU09VUkNFX0RBVEVfRVBPQ0gpCgpJIHRoaW5rIHlvdSBtYXkgaGF2ZSBtaXNzZWQg
c29tZXRoaW5nIGFib3V0IFNPVVJDRV9EQVRFX0VQT0NIOiBpdCBpcyBhClVOSVggdGltZXN0YW1w
LCBhcyBhIG51bWJlciBvZiBzZWNvbmRzIGVsYXBzZWQgc2luY2UgMTk3MC0wMS0wMVQwMDowMDow
MCswMDAwLgpSaWdodCBub3csIGl0J3MgYXJvdW5kIDE2MzI3NzUxODcuCgpTbywgd2hhdCB5b3Ug
d3JvdGUgd291bGQgY3JlYXRlIGEgZmlsZSBuYW1lZCAnMTYzMjc3NTE4NycgaW4gdGhlCkJ1aWxk
cm9vdCB0b3AtbGV2ZWwgZGlyZWN0b3J5Li4uIFByb2JhYmx5IG5vdCB3aGF0IGlzIGV4cGVjdGVk
Li4uCgpTbyBJJ3ZlIGNoYW5nZWQgdG86CgogICAgaWZlcSAoJChCUjJfUkVQUk9EVUNJQkxFKSx5
KQogICAgUk9PVEZTX0lTTzk2NjBfVkZBVF9PUFRTID0gLS1pbnZhcmlhbnQKICAgIFJPT1RGU19J
U085NjYwX0ZJWF9USU1FID0gdG91Y2ggLWQgQCQoU09VUkNFX0RBVEVfRVBPQ0gpCiAgICBlbHNl
CiAgICBST09URlNfSVNPOTY2MF9GSVhfVElNRSA9IEA6CiAgICBlbmRpZgoKLi4uIGFuZCB0aGVu
Li4uCgo+ICtpZmVxICgkKEJSMl9UQVJHRVRfUk9PVEZTX0lTTzk2NjBfR1JVQjIpJChCUjJfVEFS
R0VUX1JPT1RGU19JU085NjYwX0JJT1NfQk9PVExPQURFUikseXkpCj4gIFJPT1RGU19JU085NjYw
X0RFUEVOREVOQ0lFUyArPSBncnViMgo+ICBST09URlNfSVNPOTY2MF9CT09UTE9BREVSX0NPTkZJ
R19QQVRIID0gXAo+ICAJJChST09URlNfSVNPOTY2MF9UTVBfVEFSR0VUX0RJUikvYm9vdC9ncnVi
L2dydWIuY2ZnCj4gQEAgLTY2LDYgKzcxLDIyIEBAIGRlZmluZSBST09URlNfSVNPOTY2MF9JTlNU
QUxMX0JPT1RMT0FERVIKPiAgCSQoSU5TVEFMTCkgLUQgLW0gMDY0NCAkKEJJTkFSSUVTX0RJUikv
Z3J1Yi1lbHRvcml0by5pbWcgXAo+ICAJCSQoUk9PVEZTX0lTTzk2NjBfVE1QX1RBUkdFVF9ESVIp
L2Jvb3QvZ3J1Yi9ncnViLWVsdG9yaXRvLmltZwo+ICBlbmRlZgo+ICtlbHNlIGlmZXEgKCQoQlIy
X1RBUkdFVF9ST09URlNfSVNPOTY2MF9HUlVCMikkKEJSMl9UQVJHRVRfUk9PVEZTX0lTTzk2NjBf
RUZJX0JPT1RMT0FERVIpLHl5KQo+ICtST09URlNfSVNPOTY2MF9ERVBFTkRFTkNJRVMgKz0gZ3J1
YjIgaG9zdC1kb3Nmc3Rvb2xzIGhvc3QtbXRvb2xzCj4gK1JPT1RGU19JU085NjYwX0VGSV9QQVJU
SVRJT04gPSBib290L2ZhdC5lZmkKPiArUk9PVEZTX0lTTzk2NjBfRUZJX1BBUlRJVElPTl9QQVRI
ID0gJChST09URlNfSVNPOTY2MF9UTVBfVEFSR0VUX0RJUikvJChST09URlNfSVNPOTY2MF9FRklf
UEFSVElUSU9OKQo+ICtST09URlNfSVNPOTY2MF9FRklfUEFSVElUSU9OX0NPTlRFTlQgPSAkKEJJ
TkFSSUVTX0RJUikvZWZpLXBhcnQKPiArUk9PVEZTX0lTTzk2NjBfQk9PVExPQURFUl9DT05GSUdf
UEFUSCA9IFwKPiArCSQoUk9PVEZTX0lTTzk2NjBfVE1QX1RBUkdFVF9ESVIpL2Jvb3QvZ3J1Yi9n
cnViLmNmZwo+ICtkZWZpbmUgUk9PVEZTX0lTTzk2NjBfSU5TVEFMTF9CT09UTE9BREVSCj4gKwly
bSAtcmYgJChST09URlNfSVNPOTY2MF9FRklfUEFSVElUSU9OX1BBVEgpCj4gKwlta2RpciAtcCAk
KGRpciAkKFJPT1RGU19JU085NjYwX0VGSV9QQVJUSVRJT05fUEFUSCkpCj4gKwlkZCBpZj0vZGV2
L3plcm8gb2Y9JChST09URlNfSVNPOTY2MF9FRklfUEFSVElUSU9OX1BBVEgpIGJzPTFNIGNvdW50
PTEKPiArCSQoUk9PVEZTX0lTTzk2NjBfRklYX1RJTUUpCj4gKwkkKEhPU1RfRElSKS9zYmluL21r
ZnMudmZhdCAkKFJPT1RGU19JU085NjYwX1ZGQVRfT1BUUykgJChST09URlNfSVNPOTY2MF9FRklf
UEFSVElUSU9OX1BBVEgpCgouLi4gaGVyZToKCiAgICAkKFJPT1RGU19JU085NjYwX0ZJWF9USU1F
KSAkKFJPT1RGU19JU085NjYwX0VGSV9QQVJUSVRJT05fQ09OVEVOVCkvKgoKLi4uIGFuZC4uLgoK
PiArCSQoSE9TVF9ESVIpL2Jpbi9tY29weSAtcCAtbSAtaSAkKFJPT1RGU19JU085NjYwX0VGSV9Q
QVJUSVRJT05fUEFUSCkgLXMgXAo+ICsJCSQoUk9PVEZTX0lTTzk2NjBfRUZJX1BBUlRJVElPTl9D
T05URU5UKS8qIDo6LwoKLi4uIGhlcmU6CgogICAgJChST09URlNfSVNPOTY2MF9GSVhfVElNRSkg
JChST09URlNfSVNPOTY2MF9FRklfUEFSVElUSU9OX1BBVEgpCgpBcHBsaWVkIHRvIG1hc3RlciB3
aXRoIHRoZSBhYm92ZSBjaGFuZ2VzLCB0aGFua3MuCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoK
PiArZW5kZWYKPiAgZWxzZSBpZmVxICgkKEJSMl9UQVJHRVRfUk9PVEZTX0lTTzk2NjBfSVNPTElO
VVgpLHkpCj4gIFJPT1RGU19JU085NjYwX0RFUEVOREVOQ0lFUyArPSBzeXNsaW51eAo+ICBST09U
RlNfSVNPOTY2MF9CT09UTE9BREVSX0NPTkZJR19QQVRIID0gXAo+IEBAIC0xMjgsOSArMTQ5LDI1
IEBAIFJPT1RGU19JU085NjYwX1BSRV9HRU5fSE9PS1MgKz0gUk9PVEZTX0lTTzk2NjBfRElTQUJM
RV9FWFRFUk5BTF9JTklUUkQKPiAgCj4gIGVuZGlmICMgUk9PVEZTX0lTTzk2NjBfVVNFX0lOSVRS
RAo+ICAKPiArUk9PVEZTX0lTTzk2NjBfT1BUUyArPSBcCj4gKwktSiBcCj4gKwktUiBcCj4gKwkt
bm8tZW11bC1ib290Cj4gKwo+ICtpZmVxICgkKEJSMl9UQVJHRVRfUk9PVEZTX0lTTzk2NjBfQklP
U19CT09UTE9BREVSKSx5KQo+ICtST09URlNfSVNPOTY2MF9PUFRTICs9IFwKPiArCS1ib290LWxv
YWQtc2l6ZSA0IFwKPiArCS1ib290LWluZm8tdGFibGUgXAo+ICsJLWIgJChST09URlNfSVNPOTY2
MF9CT09UX0lNQUdFKQo+ICtlbmRpZgo+ICsKPiAraWZlcSAoJChCUjJfVEFSR0VUX1JPT1RGU19J
U085NjYwX0VGSV9CT09UTE9BREVSKSx5KQo+ICtST09URlNfSVNPOTY2MF9PUFRTICs9IFwKPiAr
CS0tZWZpLWJvb3QgJChST09URlNfSVNPOTY2MF9FRklfUEFSVElUSU9OKQo+ICtlbmRpZgo+ICsK
PiAgZGVmaW5lIFJPT1RGU19JU085NjYwX0NNRAo+IC0JJChIT1NUX0RJUikvYmluL3hvcnJpc28g
LWFzIG1raXNvZnMgLUogLVIgLWIgJChST09URlNfSVNPOTY2MF9CT09UX0lNQUdFKSBcCj4gLQkJ
LW5vLWVtdWwtYm9vdCAtYm9vdC1sb2FkLXNpemUgNCAtYm9vdC1pbmZvLXRhYmxlIFwKPiArCSQo
SE9TVF9ESVIpL2Jpbi94b3JyaXNvIC1hcyBta2lzb2ZzIFwKPiAgCQkkKFJPT1RGU19JU085NjYw
X09QVFMpIFwKPiAgCQktbyAkQCAkKFJPT1RGU19JU085NjYwX1RNUF9UQVJHRVRfRElSKQo+ICBl
bmRlZgo+IC0tIAo+IDIuMjUuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBsaXN0
cy5idWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0t
LS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBN
T1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNv
bnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8g
Q0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0t
LS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8g
IHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlM
ICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
