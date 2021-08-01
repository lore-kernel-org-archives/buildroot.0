Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31033C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 19:25:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6F5260EE9
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 19:24:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D6F5260EE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1438607EC;
	Sun,  1 Aug 2021 19:24:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H2p3QExnIdh3; Sun,  1 Aug 2021 19:24:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1FC560677;
	Sun,  1 Aug 2021 19:24:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0A6E11BF35E
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 19:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 038CE835ED
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 19:24:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x3z60LkERrsr for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 19:24:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0DF1E83529
 for <buildroot@busybox.net>; Sun,  1 Aug 2021 19:24:54 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:89a2:641e:9d1f:2c0d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id D04085FF9D;
 Sun,  1 Aug 2021 21:24:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1627845892;
 bh=r2HsfSlO8Veg4Sg2OTNnJltEsrbrzXjrwnzwh39C/tY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BfGf5EH1/T+Nl12iv+GVKLuHINyJEbVmXKE1BVX1uGpsXeWMj1IAA1mA+2NNJA1Rj
 DhNPsWukBzCopXaCPEN5CZcz4Gflk3njpuv+jEUqaeleRFz34NV16E7/xo7Jj6q2T8
 MJFViRIOpAG4YhG8EzcNzUxO4cKuzUhJSLGCuQ4oToNf8cksxbYJyC8XJrINzSCFtZ
 TMsV8XisQ2ITR4sce9wZT9/7Gc4/6A2aJgNLPN4cXUN+aGUMEvM3tDP5Q8FcDgBmRM
 CIV0vRxtEBCT6VSW940OoVcfvQPIulvrsQApaSMc5yyTlhKx4iFlvRxawYZjTgD/WR
 X3ylaxHkFlJ6A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 01 Aug 2021 21:24:47 +0200
Date: Sun, 1 Aug 2021 21:24:47 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20210801192447.GJ3189549@scaer>
References: <20210801165107.3294045-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210801165107.3294045-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2] package/lua-lunix: fix build with recent
 gcc
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIxLTA4LTAxIDE4OjUxICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IEZpeGVzOiBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQv
cmVzdWx0cy83NDlhMTFkNTI4OWM2ZmVjM2IyZjIzNmI5MDczZmMxYWI3MzBkMDkwLwo+IFNpZ25l
ZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNvaXMucGVycmFkQGdhZHoub3JnPgo+IC0t
LQo+ICAuLi5jdGwtaW5zdGVhZC1vZi1kZXByZWNhdGVkLXN5cy1zeXNjdGwucGF0Y2ggfCAzMSAr
KysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspCj4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2x1YS1sdW5peC8wMDAzLXVzZS1saW51eC1zeXNj
dGwtaW5zdGVhZC1vZi1kZXByZWNhdGVkLXN5cy1zeXNjdGwucGF0Y2gKPiAKPiBkaWZmIC0tZ2l0
IGEvcGFja2FnZS9sdWEtbHVuaXgvMDAwMy11c2UtbGludXgtc3lzY3RsLWluc3RlYWQtb2YtZGVw
cmVjYXRlZC1zeXMtc3lzY3RsLnBhdGNoIGIvcGFja2FnZS9sdWEtbHVuaXgvMDAwMy11c2UtbGlu
dXgtc3lzY3RsLWluc3RlYWQtb2YtZGVwcmVjYXRlZC1zeXMtc3lzY3RsLnBhdGNoCj4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAuLjdhOTA0ODg0ZAo+IC0tLSAvZGV2L251
bGwKPiArKysgYi9wYWNrYWdlL2x1YS1sdW5peC8wMDAzLXVzZS1saW51eC1zeXNjdGwtaW5zdGVh
ZC1vZi1kZXByZWNhdGVkLXN5cy1zeXNjdGwucGF0Y2gKPiBAQCAtMCwwICsxLDMxIEBACj4gK0Zy
b20gOTliMDJiMDhkM2YxYTUzZTU4YjU1OGI5ZjIyNTAyMjVlNTY5YTU1MCBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKPiArRnJvbTogVGlhZ28gU2VjbyA8dGlhZ29Ac2Vjby53cz4KPiArRGF0ZTog
U3VuLCAyMCBKdW4gMjAyMSAxMToyMDoyMyArMDIwMAo+ICtTdWJqZWN0OiBbUEFUQ0hdIHVzZSA8
bGludXgvc3lzY3RsLmg+IGluc3RlYWQgb2YgZGVwcmVjdGFlZCA8c3lzL3N5c2N0bC5oPiBmb3IK
PiArIGxpbnV4IHN5c3RlbXMKPiArCj4gK0ZldGNoZWQgZnJvbSBodHRwczovL2dpdGh1Yi5jb20v
d2FoZXJuL2x1bml4L3B1bGwvMTgKPiArU2lnbmVkLW9mZi1ieTogRnJhbmNvaXMgUGVycmFkIDxm
cmFuY29pcy5wZXJyYWRAZ2Fkei5vcmc+Cj4gKy0tLQo+ICsgbHVuaXgtcmVsLTIwMTcwOTIwL3Ny
Yy91bml4LmMgfCA2ICsrKysrLQo+ICsgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+ICsKPiArZGlmZiAtLWdpdCBhL2x1bml4LXJlbC0yMDE3MDkyMC9zcmMv
dW5peC5jIGIvbHVuaXgtcmVsLTIwMTcwOTIwL3NyYy91bml4LmMKPiAraW5kZXggYmVhNGQxNC4u
ZGZhMjZhMyAxMDA2NDQKPiArLS0tIGEvbHVuaXgtcmVsLTIwMTcwOTIwL3NyYy91bml4LmMKPiAr
KysrIGIvbHVuaXgtcmVsLTIwMTcwOTIwL3NyYy91bml4LmMKPiArQEAgLTU2MCw3ICs1NjAsMTEg
QEAKPiArICNlbmRpZgo+ICsgCj4gKyAjaWYgSEFWRV9TWVNfU1lTQ1RMX0gKPiArLSNpbmNsdWRl
IDxzeXMvc3lzY3RsLmg+IC8qIENUTF9LRVJOIEtFUk5fUkFORE9NIFJBTkRPTV9VVUlEIHN5c2N0
bCgyKSAqLwo+ICsrI2lmZGVmIF9fbGludXhfXwo+ICsrI2luY2x1ZGUgPGxpbnV4L3N5c2N0bC5o
PiAvKiBDVExfS0VSTiBLRVJOX1JBTkRPTSBSQU5ET01fVVVJRCBzeXNjdGwoMikgKi8KPiArKyNl
bHNlCj4gKysjaW5jbHVkZSA8c3lzL3N5c2N0bC5oPgo+ICsrI2VuZGlmCgpJIGRvbid0IHRoaW5r
IHRoaXMgaXMgYSBjb3JyZWN0IGZpeC4KCkluZGVlZCwgdGhlIHN5c2N0bCgpIHN5c2NhbGwgaGFz
IGJlZW4gZW50aXJlbHkgcmVtb3ZlZCBpbiBrZXJuZWwgNS41LApidXQgbHVuaXggc3RpbGwgdXNl
cyBpdC4KCkFsc28sIHN3aXRjaGluZyB0byBpbmNsdWRpbmcgbGludXgvc3lzY3RsLmggd2lsbCBu
b3QgYnJpbmcgYSBkZWZpbml0aW9uCmZvciBzeXNjdGwoKSBlaXRoZXIuCgpJJ3ZlIGFkZGVkIGNv
bW1lbnQgd2l0aCBzb21lIGJhY2tncm91bmQsIHRvIHRoZSB1cHN0cmVhbSBwdWxsIHJlcXVlc3Q6
CgogICAgaHR0cHM6Ly9naXRodWIuY29tL3dhaGVybi9sdW5peC9wdWxsLzE4I2lzc3VlY29tbWVu
dC04OTA1NzI1MjAKCkl0IGlzIG15IHVuZGVyc3RhbmRpbmcgdGhhdCBsdW5peCB3aWxsIGhhdmUg
dG8gY2hhbmdlIHNvbWVob3csIGFuZCBub3QKanVzdCBjaGFuZ2UgdGhlIGluY2x1ZGVkIGhlYWRl
ci4uLgoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCj4gKyAjZW5kaWYKPiArIAo+ICsgI2lmIEhB
VkVfSUZBRERSU19ICj4gKy0tIAo+ICsyLjMwLjIKPiAtLSAKPiAyLjMwLjIKPiAKPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKPiBidWlsZHJvb3RAYnVzeWJveC5uZXQKPiBodHRwOi8vbGlzdHMuYnVzeWJveC5u
ZXQvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0t
LS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0t
Lgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJC
T04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBE
ZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1
NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUv
ICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8
IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0t
LS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidXN5Ym94Lm5ldApodHRwOi8vbGlzdHMu
YnVzeWJveC5uZXQvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
