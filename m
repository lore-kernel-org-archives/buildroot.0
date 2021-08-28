Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81EAAC432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 14:47:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D46F60EBC
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 14:47:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1D46F60EBC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDE9260689;
	Sat, 28 Aug 2021 14:47:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5ziQZagh3JWU; Sat, 28 Aug 2021 14:47:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 727D260699;
	Sat, 28 Aug 2021 14:47:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6AB681BF37B
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 14:47:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66F0A407E9
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 14:47:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aTcW8iiEwTFp for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 14:47:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3D09A402B5
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 14:47:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c0ce:7c4d:7a73:f3f6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 8A47F780304;
 Sat, 28 Aug 2021 16:47:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1630162046;
 bh=Aa++OwInTJdZmuxzKCj2pZMW5Mac9zLKvplHfo+xjHI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P6S3mhaRkiWQ20sgYCRUcUgRwseWs2Yni9Fq0twQF0rzITNHNp1u6wRk0f5+H/N/D
 aC2S3RGPtl4tj+fTKRDuv+boadYy4/Uq6lKsUBU8ui63F0Bjcwo/mOkmfviTuiCAJh
 5NV7BocOB6yVto2MTJtcd6Q1JGaIoKKqBxYO8MDz9dM5M/YDIHb2r7kH2b+hqWWUCi
 dhPadfPV1h2rRF6Y4Pd86ug+lJtszjXK9qQdIEm+y+oWNjfik7BXOysFFlDfkol+KF
 nIyZc5megd5NCGDsAfD7n+SWsjZU8/tlfChI//wic/Hr7cb53Q60qrrxK78ROCvrWz
 olvjp9EsPqz9Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 28 Aug 2021 16:47:08 +0200
Date: Sat, 28 Aug 2021 16:47:08 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Herve Codina <herve.codina@bootlin.com>
Message-ID: <20210828144708.GN2661@scaer>
References: <20210817083930.3718711-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210817083930.3718711-1-herve.codina@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v3 00/16] Overwritten file detection and
 fixes, one more step to TLP build
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
Cc: Naumann Andreas <ANaumann@ultratronik.de>,
 Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGVydsOpLCBBbGwsCgpPbiAyMDIxLTA4LTE3IDEwOjM5ICswMjAwLCBIZXJ2ZSBDb2RpbmEgc3Bh
a2UgdGh1c2x5Ogo+IFRoaXMgdjMgc2VyaWVzIGFkZHMgYSBuZXcgcGF0Y2ggKHBhdGNoIDEpIHRv
IGZpeCBhIGZpbmQgZmFpbHVyZSBhbHJlYWR5IHByZXNlbnQKPiBpbiBQS0dfUFlUSE9OX0ZJWFVQ
X1NZU0NPTkZJRyB0aGF0IHdhcyBoaWdobGlnaHRlZCBpbiB0aGUgcHJldmlvdXMgdmVyc2lvbgo+
IG9mIHRoaXMgc2VyaWVzLgo+IEl0IGFsc28gcmV3b3JrcyB0aGUgcHl0aG9uIGZpeHVwIGFjY29y
ZGluZyB0byBwcmV2aW91cyByZXZpZXcgKHBhdGNoZXMgMiBhbmQgMykKPiBhbmQgZml4ZXMgdGhl
IHRlc3QgZ2l2ZW4gaW4gcGF0Y2ggMTIuCj4gCj4gVHdvIHBhdGNoZXMgYXJlIGFkZGVkIHJlbGF0
ZWQgdG8gUXQ1LiBUaGUgZmlyc3Qgb25lIChwYXRjaCA1KSB3YXMgcHJldmlvdXNseQo+IHNlbnQg
YnkgQW5kcmVhcyBOYXVtYW5uIGFuZCBmaXhlcyBhIFF0NSBvdmVyd3JpdGUuIAo+IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2J1aWxkcm9vdC8yMDIxMDYyMzA4MzkyNy44Mjc4LTEtYW5hdW1hbm5A
dWx0cmF0cm9uaWsuZGUvCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290L2IxZDBj
NWE1LWY3NmYtZTM4ZS0wMjU3LTEzMDBmNmEzMGVhYkBhbmRpbi5kZS8KPiBUaGUgc2Vjb25kIG9u
ZSAocGF0Y2ggNikgbW92ZXMgdGhlIGZpeHVwIGZ1bmN0aW9uIHRvIHRoZSBwb3N0LXByZXBhcmUg
aG9va3MuCj4gCj4gT25lIG1vcmUgcGF0Y2ggd2FzIGFkZGVkIGluIHRoaXMgc2VyaWUgKHBhdGNo
IDE0KSB0byBtb3ZlIGZpeHVwLWxpYnRvb2wtZmlsZSB0bwo+IHRoZSBwb3N0LXByZXBhcmUgaG9v
a3MuIFRoaXMgd2FzIG1lbnRpb25uZWQgZHVyaW5nIHRoZSByZXZpZXcgb2YgdGhlIGZpcnN0Cj4g
dmVyc2lvbiBvZiB0aGlzIHNlcmllcyAoaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290
LzIwMjEwNjI1MDkyNzA0LkdKMjg1MkBzY2Flci8pLgo+IAo+IE1vcmUgY2hhbmdlcyBkZXRhaWxz
IGFyZSBnaXZlbiBpbiBlYWNoIGluZGl2aWR1YWwgcGF0Y2hlcy4KPiAKPiBCZXN0IHJlZ2FyZHMs
Cj4gSGVydsOpIENvZGluYQo+IAo+IEFuZHJlYXMgTmF1bWFubiAoMSk6Cj4gICBxdDU6IEZpeCBz
cG9yYWRpYyBidWlsZCBmYWlsdXJlIGR1cmluZyB0b3AtbGV2ZWwgcGFyYWxsZWwgYnVpbGQKPiAK
PiBIZXJ2ZSBDb2RpbmEgKDExKToKPiAgIHBhY2thZ2UvcGtnLXB5dGhvbjogZml4IFBLR19QWVRI
T05fRklYVVBfU1lTQ09ORklHREFUQQo+ICAgcGFja2FnZS9wa2ctcHl0aG9uOiBpbnZhbGlkYXRl
IHByZWNvbXBpbGVkIF9zeXNjb25maWdkYXRhKi5weWMKPiAgIHBhY2thZ2UvcGtnLWdlbmVyaWMu
bWs6IG1vdmUgcHl0aG9uIGZpeHVwIHRvIGdlbmVyaWMgcGFja2FnZQo+ICAgICBpbmZyYXN0cnVj
dHVyZQo+ICAgcGFja2FnZS9vd2ZzOiByZW1vdmUgUHl0aG9uIHN5c2NvbmZpZ2RhdGEgZml4dXAK
CkkndmUgYXBwbGllZCB0aG9zZSBmb3VyIHB5dGhvbi1yZWxhdGVkIGZpeGVzIHRvIG5leHQsIHRo
YW5rcyEKCkknbGwgcmVzdW1lIHRoZSByZXN0IG9mIHRoZSBzZXJpZXMgbGF0ZXIgaW4gdGhlIFdF
OyBubyBuZWVkIHRvIHJlc3BpbiEKClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+ICAgcGFja2Fn
ZS9wa2ctcW1ha2UubWs6IE1vdmUgUVQ1X1FUX0NPTkZfRklYVVAgdG8gcG9zdC1wcmVwYXJlIGhv
b2sKPiAgIHBhY2thZ2UvcGtnLWdlbmVyaWMubWs6IGdlbmVyYXRlIGZpbmFsIHJzeW5jIGV4Y2x1
ZGUgZmlsZSBsaXN0Cj4gICBNYWtlZmlsZTogcnN5bmMgZ2xvYmFsIHtUQVJHRVQsSE9TVH1fRElS
IHVzaW5nIGV4Y2x1c2lvbiBmaWxlIGxpc3QKPiAgIE1ha2VmaWxlOiBicmVha3MgaGFyZGxpbmtz
IGluIGdsb2JhbCB7VEFSR0VULEhPU1R9X0RJUiBvbiBwZXItcGFja2FnZQo+ICAgICBidWlsZAo+
ICAgcGFja2FnZS9wa2ctZ2VuZXJpYy5tazogZml4IHBlci1wYWNrYWdlCj4gICAgIDxwa2c+LXty
ZWNvbmZpZ3VyZSxyZWJ1aWxkLHJlaW5zdGFsbH0KPiAgIHBhY2thZ2UvcGtnLWdlbmVyaWMubWs6
IHJlbW92ZSAuZmlsZXMtZmluYWwtcnN5bmMuYmVmb3JlIHRlbXBvcmFyeQo+ICAgICBmaWxlCj4g
ICBwYWNrYWdlL3BrZy1nZW5lcmljLm1rOiBtb3ZlIGZpeHVwLWxpYnRvb2wtZmlsZXMgdG8gcG9z
dC1wcmVwYXJlIGhvb2sKPiAKPiBUaG9tYXMgUGV0YXp6b25pICg0KToKPiAgIHBhY2thZ2UvcGtn
LWdlbmVyaWMubWs6IGRldGVjdCBmaWxlcyBvdmVyd3JpdHRlbiBpbiBUQVJHRVRfRElSIGFuZAo+
ICAgICBIT1NUX0RJUgo+ICAgc3VwcG9ydC90ZXN0aW5nL2luZnJhOiBhZGQgbG9nX2ZpbGVfcGF0
aCgpIGZ1bmN0aW9uCj4gICBzdXBwb3J0L3Rlc3RpbmcvdGVzdHM6IGFkZCB0ZXN0IGZvciBjaGVj
a19iaW5fYXJjaAo+ICAgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzOiBhZGQgdGVzdCBmb3IgZmlsZSBv
dmVyd3JpdGUgZGV0ZWN0aW9uCj4gCj4gIE1ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAzNCArKysrLQo+ICBwYWNrYWdlL293ZnMvb3dmcy5tayAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgIDkgLS0KPiAgcGFja2FnZS9wa2ctZ2VuZXJpYy5tayAgICAg
ICAgICAgICAgICAgICAgICAgIHwgMTI1ICsrKysrKysrKysrKysrKystLQo+ICBwYWNrYWdlL3Br
Zy1weXRob24ubWsgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMTAgLS0KPiAgcGFja2FnZS9w
a2ctcW1ha2UubWsgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAzICstCj4gIHBhY2thZ2Uv
cXQ1L3F0NS5tayAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCj4gIHN1cHBvcnQv
dGVzdGluZy9pbmZyYS9fX2luaXRfXy5weSAgICAgICAgICAgICB8ICAxMSArLQo+ICAuLi4vYnIy
LWV4dGVybmFsL2RldGVjdC1iYWQtYXJjaC9Db25maWcuaW4gICAgfCAgIDEgKwo+ICAuLi4vZGV0
ZWN0LWJhZC1hcmNoL2V4dGVybmFsLmRlc2MgICAgICAgICAgICAgfCAgIDEgKwo+ICAuLi4vYnIy
LWV4dGVybmFsL2RldGVjdC1iYWQtYXJjaC9leHRlcm5hbC5tayAgfCAgIDEgKwo+ICAuLi4vcGFj
a2FnZS9kZXRlY3QtYmFkLWFyY2gvQ29uZmlnLmluICAgICAgICAgfCAgIDQgKwo+ICAuLi4vZGV0
ZWN0LWJhZC1hcmNoL2RldGVjdC1iYWQtYXJjaC5tayAgICAgICAgfCAgMTUgKysrCj4gIC4uLi9i
cjItZXh0ZXJuYWwvZGV0ZWN0LW92ZXJ3cml0ZS9Db25maWcuaW4gICB8ICAgMSArCj4gIC4uLi9k
ZXRlY3Qtb3ZlcndyaXRlL2V4dGVybmFsLmRlc2MgICAgICAgICAgICB8ICAgMSArCj4gIC4uLi9i
cjItZXh0ZXJuYWwvZGV0ZWN0LW92ZXJ3cml0ZS9leHRlcm5hbC5tayB8ICAgMSArCj4gIC4uLi9w
YWNrYWdlL2RldGVjdC1vdmVyd3JpdGUvQ29uZmlnLmluICAgICAgICB8ICAgNSArCj4gIC4uLi9k
ZXRlY3Qtb3ZlcndyaXRlL2RldGVjdC1vdmVyd3JpdGUubWsgICAgICB8ICAxOSArKysKPiAgc3Vw
cG9ydC90ZXN0aW5nL3Rlc3RzL2NvcmUvdGVzdF9iYWRfYXJjaC5weSAgIHwgIDE5ICsrKwo+ICAu
Li4vdGVzdGluZy90ZXN0cy9jb3JlL3Rlc3RfZmlsZV9vdmVyd3JpdGUucHkgfCAgNDggKysrKysr
Kwo+ICAxOSBmaWxlcyBjaGFuZ2VkLCAyNjkgaW5zZXJ0aW9ucygrKSwgNDAgZGVsZXRpb25zKC0p
Cj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvY29yZS9icjItZXh0
ZXJuYWwvZGV0ZWN0LWJhZC1hcmNoL0NvbmZpZy5pbgo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgc3Vw
cG9ydC90ZXN0aW5nL3Rlc3RzL2NvcmUvYnIyLWV4dGVybmFsL2RldGVjdC1iYWQtYXJjaC9leHRl
cm5hbC5kZXNjCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvY29y
ZS9icjItZXh0ZXJuYWwvZGV0ZWN0LWJhZC1hcmNoL2V4dGVybmFsLm1rCj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvY29yZS9icjItZXh0ZXJuYWwvZGV0ZWN0LWJh
ZC1hcmNoL3BhY2thZ2UvZGV0ZWN0LWJhZC1hcmNoL0NvbmZpZy5pbgo+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL2NvcmUvYnIyLWV4dGVybmFsL2RldGVjdC1iYWQt
YXJjaC9wYWNrYWdlL2RldGVjdC1iYWQtYXJjaC9kZXRlY3QtYmFkLWFyY2gubWsKPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IHN1cHBvcnQvdGVzdGluZy90ZXN0cy9jb3JlL2JyMi1leHRlcm5hbC9kZXRl
Y3Qtb3ZlcndyaXRlL0NvbmZpZy5pbgo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgc3VwcG9ydC90ZXN0
aW5nL3Rlc3RzL2NvcmUvYnIyLWV4dGVybmFsL2RldGVjdC1vdmVyd3JpdGUvZXh0ZXJuYWwuZGVz
Ywo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL2NvcmUvYnIyLWV4
dGVybmFsL2RldGVjdC1vdmVyd3JpdGUvZXh0ZXJuYWwubWsKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IHN1cHBvcnQvdGVzdGluZy90ZXN0cy9jb3JlL2JyMi1leHRlcm5hbC9kZXRlY3Qtb3ZlcndyaXRl
L3BhY2thZ2UvZGV0ZWN0LW92ZXJ3cml0ZS9Db25maWcuaW4KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IHN1cHBvcnQvdGVzdGluZy90ZXN0cy9jb3JlL2JyMi1leHRlcm5hbC9kZXRlY3Qtb3ZlcndyaXRl
L3BhY2thZ2UvZGV0ZWN0LW92ZXJ3cml0ZS9kZXRlY3Qtb3ZlcndyaXRlLm1rCj4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvY29yZS90ZXN0X2JhZF9hcmNoLnB5Cj4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvY29yZS90ZXN0X2ZpbGVf
b3ZlcndyaXRlLnB5Cj4gCj4gLS0gCj4gMi4zMS4xCj4gCgotLSAKLi0tLS0tLS0tLS0tLS0tLS0t
Li0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0t
LS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkg
UklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2Fy
ZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCAr
MzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwg
IFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8q
XF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0t
LS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVzeWJveC5uZXQKaHR0cDovL2xp
c3RzLmJ1c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
