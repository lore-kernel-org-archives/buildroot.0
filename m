Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F14C982CC
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 21:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CA5E40CA8;
	Sat, 19 Sep 2026 21:36:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sPKM-VNkc8q4; Sat, 19 Sep 2026 21:36:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8E47840C9B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789853788;
	b=UzFUei3+xHnViKLP7mMGwv4LK91T8ccu2bSMN7U3n+4SX9Al3nd6cdhfeKuZnPjYMZ4B
	 zsrkMf4n1JQ8CmmuH3zZB34qpIRo6/+twEVmiE6BTfpATq7INoA75hsr5Qukk4V2NlAxY
	 jBuNYSvLIh02pm4gudUNk7a4vhyF2M3LY1Lh2ghowg2+bvg6+l1zBw2bTSB45Jp7OrFg7
	 zJ/AYJH8CalbuiRPBCTxsRdFIRWch8j5GYpgwDPynFHUUMr/MmAKqhQOxZAQatWPrKij9
	 udSFG14YN3JCeSsy4y83LnwEmIm3HUeMmn74mZeEiLx4FQdUnTtsnzYfQhKNAZlIALw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789853788;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=ahf3/YJXPxSMwngKaBlR2PIcRNbJdqfKw7b7yXEdf1s=;
	b=m/mt474Eb7lUcgHkZoqtsMs9HIFWrF197vACsGnPxwNWSJdHjymO7DaowND+FaDQ4cdI
	 CsrY6/dK2nP50nD8vzOQeeaGkzDHLrEVqMnvjWznFZWj+On/X8L6gxN40Lww9fHWJvLNG
	 tlwh4uC296Yz3dTzS9s71oA8eLeTLH7zcxCId1D8thX0I8tKtHXN1XuNNLSm/dsPpB+HX
	 Nh1bq6ylzJyxRrVx6JM5g/hq33YLYmOKK8zUUEIqUKEVw/NSRyq6CIHBro2jvYWo7hmsv
	 eBUjrfHEDS4dalgf9VVlMWuwxk6AqrmRKSbiL80sD0/TwEeEld2/G2s8yb7vTl5/h3Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789853788;
	bh=ahf3/YJXPxSMwngKaBlR2PIcRNbJdqfKw7b7yXEdf1s=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WlcAM9OSjc49kRUsUpHIZprX9Qhfh0hAkIXZLNXrvC5OaIeoq+vcKudNclqQi4B0F
	 ocswTfu4jV/QoEzl3fTwGB1rCGC2B6pT87sfbHh58dVCVRLyW9DfHxLrobdW1g0jEv
	 bU1KkeUZJAvfXqfqJ04teYKJr3s6zqiEECaH5o6Y7bwWURjtNAslgauB2xAGaxA6sD
	 YwZBMHHBW+OIApZeVDU7qR/9yyFLk1kDuYTBTiJN61IKtBWvHKyQpdyO0a3bQGpJw6
	 WOIjHKo8Wbc9nImmUkhS934/Rx9/dJjSdJzDivcYC6XB2JW/gJzcfjcU2zQs3aHtur
	 QPdDglrjGvhOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E47840C9B;
	Sat, 19 Sep 2026 21:36:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 75B2713D
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 21:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C2294007E
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 21:36:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WidkzKXJdPY4 for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 21:36:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org EADC140055
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789853786;
 b=AhEIEggz9UbxjvXxWZi14a0vMy4nl3eIhi8zCRkkp93oMOui5S+RejrAVW0xG1vJxAXo
 7hPIs9N62HJP/dTgrCndCQSHq24zX3rlPGWrnyFWB/5myS2BWReWMxmy/QAwcORIkEsF5
 ARY+bTgbgwMW79pS/YqDg2nIfcdgC9sDRjUMHYvLhBWXTQ6d/dOpY7houqHTIuygLMYR4
 eW1L/FFb3rvV4zaY9LML0LeXRpohQPUbj/nAAW5KNlBsAHAwe9j05e0twlXlZbcPmYmsx
 20pLITOdJiNOa8DhfMwRza1NlIvudmfoEIUFJSLv/pwatMiIlvn4W0Pbgl3Q95Hmt6A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789853786;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=7XjSHny7TGqQsmUYXKjOV380zzN2eAhi+9WIHzeSIZU=;
 b=V9sx38IPC9vaBry5WfT0rVt/jxYQI3516FYge8T0md3IrpMjkp3Jd9qixkswB2rJvBpq
 PMBvCtTyvlk/B/UfN9b3yDS7gpOUxsdu1kJMPVlKwfq9iY+z2RrKDdXiGvh9P5ZjdhQif
 PU8hjMuLPoXcmhvlOxNb3d4+YVaU/zEMS0IJvAfNePeNKoeuqX8AJzhnlpvsy6UaRGR19
 J2/NUDaBFiXJQswMxLlJtWc9FZzooiSMYFwCz1YnO529ZV/GcRg32HCGbbWyuNIDMRLSQ
 tx/FBSk7dv929AuPoKA0186ZtxpNTrXx8U71jUVTvOtSAMUgsWayG7OrEEEQbIqnE6A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=IPJzVtfv; 
 arc=none smtp.remote-ip=212.227.15.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EADC140055
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 21:36:25 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M42nS-1x82jP0gYS-002IOf; Sat, 19
 Sep 2026 23:36:23 +0200
Message-ID: <304ce8bf-dd41-4beb-a05e-b8ca66fb7f58@gmx.de>
Date: Sat, 19 Sep 2026 23:36:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
References: <20260916110912.265693-1-fiona.klute@gmx.de>
 <20260916110912.265693-2-fiona.klute@gmx.de>
 <998ccddb36c081ac7f6850a3cb4ad084@free.fr>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <998ccddb36c081ac7f6850a3cb4ad084@free.fr>
X-Provags-ID: V03:K1:wjFCqSuHSig0ptk5scXmX0wS6x/IhBCaFHAKz835P45apbyoiJb
 xSykKMtGcPdg6vAomtCOzO2p+BJzkVfF1O2TjqVV3QJH7nBZ0t1TUw8JWd4IxB7l8mSW53m
 XQC9Cke/mou4zUtkiMYhJ+O11BZwsmrTKnWv3u+sUlpA+SPtoDemKtAcOfvnMwjb5wqevoR
 dAJJuSx7ywHzezf4VxQ0w==
UI-OutboundReport: notjunk:1;M01:P0:vm8PyIOkA+A=;oV17LFxbeR96WomKJTqe0NNp46Y
 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
Subject: Re: [Buildroot] [PATCH v2 2/3] fs/squashfs: add option to build
 verity tree
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSnVsaWVuIQoKQW0gMTkuMDkuMjYgdW0gMTc6NDEgc2NocmllYiBKdWxpZW4gT2xpdmFpbjoK
PiBIaSBGaW9uYSwKPiAKPiBPbiAxNi8wOS8yMDI2IDEzOjA5LCBGaW9uYSBLbHV0ZSB2aWEgYnVp
bGRyb290IHdyb3RlOgo+PiBGcm9tOiAiRmlvbmEgS2x1dGUgKG90aGVybW8gR21iSCkiIDxmaW9u
YS5rbHV0ZUBnbXguZGU+Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEZpb25hIEtsdXRlIDxmaW9uYS5r
bHV0ZUBnbXguZGU+Cj4+IC0tLQo+PiBDaGFuZ2VzIHYxIC0+IHYyOgo+PiAqIGFkZCBCUjJfVEFS
R0VUX1JPT1RGU19TUVVBU0hGU19WRVJJVFlfRVhUUkFfQVJHUwo+Pgo+PiDCoGZzL3NxdWFzaGZz
L0NvbmZpZy5pbiB8IDIzICsrKysrKysrKysrKysrKysrKysrKysrCj4+IMKgMSBmaWxlIGNoYW5n
ZWQsIDIzIGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2ZzL3NxdWFzaGZzL0NvbmZp
Zy5pbiBiL2ZzL3NxdWFzaGZzL0NvbmZpZy5pbgo+PiBpbmRleCBjYjJmNWVjOTY5Li45NzczZjVh
ZjIwIDEwMDY0NAo+PiAtLS0gYS9mcy9zcXVhc2hmcy9Db25maWcuaW4KPj4gKysrIGIvZnMvc3F1
YXNoZnMvQ29uZmlnLmluCj4+IEBAIC0xMjEsNCArMTIxLDI3IEBAIGNvbmZpZyBCUjJfVEFSR0VU
X1JPT1RGU19TUVVBU0hGU19DT01QX09QVFMKPj4gwqDCoMKgwqAgZGVmYXVsdCAiLVhjb21wcmVz
c2lvbi1sZXZlbCAyMiIgaWYgQlIyX1RBUkdFVF9ST09URlNfU1FVQVNIRlM0X1pTVEQKPj4gwqDC
oMKgwqAgZGVwZW5kcyBvbiBCUjJfVEFSR0VUX1JPT1RGU19TUVVBU0hGU19FWFRSRU1FX0NPTVAK
Pj4KPj4gK2NvbmZpZyBCUjJfVEFSR0VUX1JPT1RGU19TUVVBU0hGU19WRVJJVFkKPj4gK8KgwqDC
oCBib29sICJjcmVhdGUgdmVyaXR5IGhhc2ggZGF0YSBmb3Igcm9vdCBmaWxlc3lzdGVtIgo+PiAr
wqDCoMKgIHNlbGVjdCBCUjJfUEFDS0FHRV9IT1NUX0NSWVBUU0VUVVAKPj4gK8KgwqDCoCBoZWxw
Cj4+ICvCoMKgwqDCoMKgIENyZWF0ZSB2ZXJpdHkgaGFzaCB0cmVlIGZvciB0aGUgcm9vdCBmaWxl
c3lzdGVtLiBUaGlzIGFsbG93cwo+PiArwqDCoMKgwqDCoCBzZXR0aW5nIHVwIGEgZG0tdmVyaXR5
IGRldmljZSBmb3IgdGhlIHJvb3QgZmlsZXN5c3RlbSwgdG8KPj4gK8KgwqDCoMKgwqAgZW5zdXJl
IGRhdGEgaW50ZWdyaXR5LiBUaGUgcm9vdCBoYXNoIG11c3QgYmUgcHJvdmlkZWQgZnJvbSBhCj4+
ICvCoMKgwqDCoMKgIHRydXN0ZWQgc291cmNlLCBvciB3aXRoIGEga2VybmVsLXZlcmlmaWFibGUg
c2lnbmF0dXJlLgo+PiArCj4+ICvCoMKgwqDCoMKgIFRoZSB2ZXJpdHkgaGFzaCBpbWFnZSB3aWxs
IGJlIGNhbGxlZCByb290ZnMuc3F1YXNoZnMudmVyaXR5LAo+PiArwqDCoMKgwqDCoCB3aXRoIHRo
ZSByb290IGhhc2ggaW4gcm9vdGZzLnNxdWFzaGZzLnZlcml0eS5yb290LWhhc2guCj4+ICsKPj4g
K2lmIEJSMl9UQVJHRVRfUk9PVEZTX1NRVUFTSEZTX1ZFUklUWQo+PiArCj4+ICtjb25maWcgQlIy
X1RBUkdFVF9ST09URlNfU1FVQVNIRlNfVkVSSVRZX0VYVFJBX0FSR1MKPiAKPiBUaGlzIG5ldyBf
RVhUUkFfQVJHUyBpcyBnZW5lcmF0aW5nIGFuIGVycm9yIHdpdGggb3VyCj4gInV0aWxzL2NoZWNr
LXN5bWJvbHMiIGNoZWNrZXI6Cj4gCj4gZnMvc3F1YXNoZnMvQ29uZmlnLmluOjEzODogQlIyX1RB
UkdFVF9ST09URlNfU1FVQVNIRlNfVkVSSVRZX0VYVFJBX0FSR1MgCj4gZGVmaW5lZCBidXQgbm90
IHJlZmVyZW5jZWQKPiAKPiBJdCdzIHByb2JhYmx5IGR1ZSB0byB0aGUgd2F5IHRoaXMgY29uZmln
IGlzIHVzZWQgaW4gZnMvY29tbW9uLm1rIGFzCj4gJChCUjJfVEFSR0VUX1JPT1RGU18kKDIpX1ZF
UklUWV9FWFRSQV9BUkdTKS4KPiAKPiBJbXByb3ZpbmcgdGhlIGNoZWNrLXN5bWJvbCBzZWVtcyBj
b21wbGV4LCBhcyBpdCB3b3VsZCBuZWVkIHRvIGV2YWx1YXRlCj4gY29tcGxldGVseSB0aGUgTWFr
ZWZpbGVzLgo+IAo+IERvIHlvdSB0aGluayBpdCBpcyBwb3NzaWJsZSB0byByZXdyaXRlIGl0IHNs
aWdodGx5IGRpZmZlcmVudGx5IHNvIGl0Cj4gcGFzc2VzIHRoZSBjaGVjay1zeW1ib2xzIHNjcmlw
dD8KSSBjYW4gYnkgYWRkaW5nIGFub3RoZXIgdmFyaWFibGUgUk9PVEZTXyQoMilfVkVSSVRZX0VY
VFJBX0FSR1MgdGhhdCBoYXMgCnRoZSB1bnF1b3RlZCB2YWx1ZSBvZiAkKEJSMl9UQVJHRVRfUk9P
VEZTXyQoMilfVkVSSVRZX0VYVFJBX0FSR1MpLiBJdCdzIAphIGJpdCBsZXNzIGVsZWdhbnQgKG5l
ZWRzIDMgbGluZXMgaW4gdGhlIEZTIE1ha2VmaWxlIGluY2x1ZGluZyBpZmVxIApibG9jayksIGJ1
dCBhdm9pZHMgdGhlIHdhcm5pbmcuCgpJJ3ZlIHNlbnQgdjMgd2l0aCB0aGF0IGNoYW5nZS4KCkJl
c3QgcmVnYXJkcywKRmlvbmEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
