Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86026CD1288
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 20:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38D99404A3;
	Wed,  3 Apr 2024 20:09:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ld1D6eD7q_J7; Wed,  3 Apr 2024 20:09:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C42DC414A1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C42DC414A1;
	Wed,  3 Apr 2024 20:09:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E0DCE1BF408
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 20:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AAF1D811E4
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 20:09:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fRJVocRHotad for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 20:08:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6F72881062
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F72881062
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6F72881062
 for <buildroot@busybox.net>; Wed,  3 Apr 2024 20:08:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8B4DC13F880;
 Wed,  3 Apr 2024 22:08:55 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 03 Apr 2024 22:08:55 +0200
Date: Wed, 3 Apr 2024 22:08:55 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <francois.perrad@gadz.org>
Message-ID: <Zg23Vz4ImE-qlH2f@landeda>
References: <20240403083655.512238-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403083655.512238-1-francois.perrad@gadz.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712174937;
 bh=qz5r9VpmOPpfuIyFrb849QDg9E7ZSQiHRbDcfCjjz2g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Kbpd+kyMVQu4GW/suHqFA+JvKHKZq+wx6BGufBy6HQ7Rsx2p8HCiFLiPiSTaptQsP
 i/D/ZOSyY5IKPHEaWu01mdX3w3gGoYfCc2c4a+KE4KSwKTlfs2hO5FaBVwSEWu0jDB
 XK7cr9Bx8UbMIbb0Wn5je+BP7OCt9qhBk99UUtD3OfxZectAf5q46WMlKXtJFGsytW
 D0i92fhM9Nz68yRJbInmEWSGYWrc0H9pMUzJn1u7CgPa+Y/e61trvLyFsaoL8Fix/B
 APsid0GFCnBDcDyAvAWxoeT3rYnzzdKTY9mlDH42D5Ulmzh7cfBkavWzzEVcSopodG
 rVVDZfDI2LGPA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Kbpd+kyM
Subject: Re: [Buildroot] [PATCH] package/fakeroot: bump to version 1.34
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDI0LTA0LTAzIDEwOjM2ICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCkFzIEkgc2Fp
ZCBpbiBteSBwcmV2aW91cyByZXZpZXcsIHF1b3Rpbmc6CgpSYXRoZXIgdGhhbiB1c2luZyB0aGUg
ZGViaWFuIGFyY2hpdmUsIHdoaWNoIGlzIGdvaW5nIHRvIGNoYW5nZSBldmVyeQp0aW1lIHdlIGNo
YW5nZSB0aGUgdmVyc2lvbiwgY2FuIHdlIGp1c3Qgc3dpdGNoIHRvIHVzaW5nIHRoZSBvZmZpaWNh
bApnaXQgdHJlZSAod2hpY2ggaGFwcGVucyB0byBiZSBob3N0ZWQgYXQgRGViaWFuJ3MgZ2l0bGFi
IGluc3RhbmNlKQppbnN0ZWFkPwoKICAgIGh0dHBzOi8vc2Fsc2EuZGViaWFuLm9yZy9jbGludC9m
YWtlcm9vdAoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCj4gLS0tCj4gIHBhY2thZ2UvZmFrZXJv
b3QvZmFrZXJvb3QuaGFzaCB8IDUgKysrLS0KPiAgcGFja2FnZS9mYWtlcm9vdC9mYWtlcm9vdC5t
ayAgIHwgNCArKy0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2Zha2Vyb290L2Zha2Vyb290Lmhhc2gg
Yi9wYWNrYWdlL2Zha2Vyb290L2Zha2Vyb290Lmhhc2gKPiBpbmRleCA1ZTdiNmFmOTQuLmExNDhk
ZTY3NiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2Zha2Vyb290L2Zha2Vyb290Lmhhc2gKPiArKysg
Yi9wYWNrYWdlL2Zha2Vyb290L2Zha2Vyb290Lmhhc2gKPiBAQCAtMSw0ICsxLDUgQEAKPiAtIyBG
cm9tIGh0dHBzOi8vZGViLmRlYmlhbi5vcmcvZGViaWFuL3Bvb2wvbWFpbi9mL2Zha2Vyb290L2Zh
a2Vyb290XzEuMzIuMS0xLmRzYwo+IC1zaGEyNTYgIGMwNzJiMGY2NWJhZmM0Y2M1YjYxMTJmN2M2
MTE4NWY1MTcwY2U0Y2IwYzQxMGQxNjgxYzFhZjRhMTgzZTk0ZTYgIGZha2Vyb290XzEuMzIuMS5v
cmlnLnRhci5nego+ICsjIEZyb20gaHR0cHM6Ly9kZWIuZGViaWFuLm9yZy9kZWJpYW4vcG9vbC9t
YWluL2YvZmFrZXJvb3QvZmFrZXJvb3RfMS4zNC0xLmRzYwo+ICtzaGExICBhYWE2YmYwMTU4ZDg4
NmUwMDkzZWZmYzBlOTQyMjcxN2Q1YzYwZWVlICBmYWtlcm9vdF8xLjM0Lm9yaWcudGFyLmd6Cj4g
K3NoYTI1NiAgNTcyN2YxNmQ4OTAzNzkyNTg4ZWZhN2E5ZjhlZjhjZTcxZjg3NTZlNzQ2YjYyZTQ1
MTYyZTc3MzU2NjJlNTZiYiAgZmFrZXJvb3RfMS4zNC5vcmlnLnRhci5nego+ICAjIExpY2Vuc2Ug
ZmlsZXMsIGxvY2FsbHkgY2FsY3VsYXRlZAo+ICBzaGEyNTYgIGZjODJjYThiNmZkYjE4ZDRlM2U4
NWNmZDhhYjU4ZDFiY2QzZjFiMjlhYmU3ODI4OTVhYmQ5MWQ2NDc2M2Y4ZTcgIENPUFlJTkcKPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS9mYWtlcm9vdC9mYWtlcm9vdC5tayBiL3BhY2thZ2UvZmFrZXJv
b3QvZmFrZXJvb3QubWsKPiBpbmRleCAxYTBhZDcwYzEuLjFhMDk5NmNhMSAxMDA2NDQKPiAtLS0g
YS9wYWNrYWdlL2Zha2Vyb290L2Zha2Vyb290Lm1rCj4gKysrIGIvcGFja2FnZS9mYWtlcm9vdC9m
YWtlcm9vdC5tawo+IEBAIC00LDkgKzQsOSBAQAo+ICAjCj4gICMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjCj4gIAo+IC1GQUtFUk9PVF9WRVJTSU9OID0gMS4zMi4xCj4gK0ZBS0VST09UX1ZFUlNJT04g
PSAxLjM0Cj4gIEZBS0VST09UX1NPVVJDRSA9IGZha2Vyb290XyQoRkFLRVJPT1RfVkVSU0lPTiku
b3JpZy50YXIuZ3oKPiAtRkFLRVJPT1RfU0lURSA9IGh0dHBzOi8vc25hcHNob3QuZGViaWFuLm9y
Zy9hcmNoaXZlL2RlYmlhbi8yMDIzMDcyNFQxNjA0MjlaL3Bvb2wvbWFpbi9mL2Zha2Vyb290Cj4g
K0ZBS0VST09UX1NJVEUgPSBodHRwczovL3NuYXBzaG90LmRlYmlhbi5vcmcvYXJjaGl2ZS9kZWJp
YW4vMjAyNDA0MDFUMDg0NDM4Wi9wb29sL21haW4vZi9mYWtlcm9vdAo+ICAKPiAgSE9TVF9GQUtF
Uk9PVF9ERVBFTkRFTkNJRVMgPSBob3N0LWFjbAo+ICAjIEZvcmNlIGNhcGFiaWxpdGllcyBkZXRl
Y3Rpb24gb2ZmCj4gLS0gCj4gMi40MC4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QKCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0t
LS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1P
UklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29u
c3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBD
QU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0t
LS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAg
fAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwg
ICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
Xi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
