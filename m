Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E56A3C4320A
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:20:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 945F960BD3
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:20:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 945F960BD3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57C98404FF;
	Thu,  5 Aug 2021 19:20:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d-Bbw5AHpOXR; Thu,  5 Aug 2021 19:20:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1FF4A4026E;
	Thu,  5 Aug 2021 19:20:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5A2621BF361
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A118827CA
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:19:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s_fdgbLjV4Fh for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 19:19:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 02F7482640
 for <buildroot@busybox.net>; Thu,  5 Aug 2021 19:19:57 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:70be:8b43:5d22:5801])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 5D2D1B004EE;
 Thu,  5 Aug 2021 21:19:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1628191194;
 bh=bmMXgdtM8MROpQZXjpQyaj28WLpS7vsKdScDwy0669E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lJGuRwkJi1RgZRUujTSYze7QJnmFbLEfZ1VgfWsYCIsLdJxeXnBrbyc/lNBrO5faE
 V37cbUL3fM5MLgoigAcTTeayZSDhpBP5OesS71v37vjR5QrKEBd4/an16cBnWKclXn
 AR7OHqXOi2F9uDPnRxoxGbkXrCjjC20drsKgP2OSdgYZOOcJswciP1SEnNheP3lOum
 TYrDXXuiIq34nfdT5EPLWu1s28qoqyk94I0zkCfat1caQOrF36zC9C0XhJYpMmEjbN
 rJxsLoxp9X8pI263MNY11mk/X66n4aQLkOxrSaoUVmv/70rFPuBwY1UVRZP092/f87
 ZxlcfJMDG1QSg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 05 Aug 2021 21:19:50 +0200
Date: Thu, 5 Aug 2021 21:19:50 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20210805191950.GM27036@scaer>
References: <20210804134635.262095-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210804134635.262095-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v3 1/2] package/lua-lunix: fix build with
 recent gcc
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

RnJhbsOnb2lzLCBBbGwsCgpUaGUgY29tbWl0IHRpdGxlIGlzIHdyb25nOiBhcyBJIGV4cGxhaW5l
ZCBpbiB0aGUgdXBzdHJlYW0gUFIsIHRoZQpwcm9ibGVtIGlzIG5vdCB3aXRoICJyZWNlbnQgZ2Nj
Ii4KClRoZSBoZWFkZXIgb2YgY29uY2VybiBpcyBmcm9tIHRoZSBDIGxpYnJhcnksIHNvIGl0IGlz
IG1pc3NpZ24gZnJvbQpyZWNlbnQgZ2xpYmMgdmVyc2lvbnMuCgpBbmQgZXZlbnR1YWxseSwgdGhl
IHN5c2N0bCBzeXNjYWxsIGlzIG1pc3NpbmcgaW4gcmVjZW50IGtlcm5lbCB2ZXJzaW9ucy4KTm90
aGluZyB0byBkbyB3aXRoIHJlY2VudCBnY2MgdmVyc2lvbnMuCgpPbiAyMDIxLTA4LTA0IDE1OjQ2
ICswMjAwLCBGcmFuY29pcyBQZXJyYWQgc3Bha2UgdGh1c2x5Ogo+IEZpeGVzOiBodHRwOi8vYXV0
b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy83NDlhMTFkNTI4OWM2ZmVjM2IyZjIzNmI5MDcz
ZmMxYWI3MzBkMDkwLwo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNvaXMu
cGVycmFkQGdhZHoub3JnPgo+IC0tLQo+ICBwYWNrYWdlL2x1YS1sdW5peC8wMDAzLWZvcmNlLW5v
LXN5c2N0bC5wYXRjaCB8IDMyICsrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAzMiBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2x1YS1sdW5p
eC8wMDAzLWZvcmNlLW5vLXN5c2N0bC5wYXRjaAo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2x1
YS1sdW5peC8wMDAzLWZvcmNlLW5vLXN5c2N0bC5wYXRjaCBiL3BhY2thZ2UvbHVhLWx1bml4LzAw
MDMtZm9yY2Utbm8tc3lzY3RsLnBhdGNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAw
MDAwMDAwMDAuLjM0NjdlMjcxMwo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL2x1YS1s
dW5peC8wMDAzLWZvcmNlLW5vLXN5c2N0bC5wYXRjaAo+IEBAIC0wLDAgKzEsMzIgQEAKPiArRnJv
bSBkOWI2NWUzMDY0NzhmNWQyMzU2ZWY5MGVhYjgxOTE5ODQ1MzQyMzhhIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQo+ICtGcm9tOiBGcmFuY29pcyBQZXJyYWQgPGZyYW5jb2lzLnBlcnJhZEBnYWR6
Lm9yZz4KPiArRGF0ZTogV2VkLCA0IEF1ZyAyMDIxIDE1OjI3OjA1ICswMjAwCj4gK1N1YmplY3Q6
IFtQQVRDSF0gZm9yY2Ugbm8gc3lzY3RsCj4gKwo+ICtTaWduZWQtb2ZmLWJ5OiBGcmFuY29pcyBQ
ZXJyYWQgPGZyYW5jb2lzLnBlcnJhZEBnYWR6Lm9yZz4KPiArLS0tCj4gKyBsdW5peC1yZWwtMjAx
NzA5MjAvbHVuaXgtMjAxNzA5MjAtMS5yb2Nrc3BlYyB8IDkgKysrKysrKysrCj4gKyAxIGZpbGUg
Y2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCj4gKwo+ICtkaWZmIC0tZ2l0IGEvbHVuaXgtcmVsLTIw
MTcwOTIwL2x1bml4LTIwMTcwOTIwLTEucm9ja3NwZWMgYi9sdW5peC1yZWwtMjAxNzA5MjAvbHVu
aXgtMjAxNzA5MjAtMS5yb2Nrc3BlYwo+ICtpbmRleCA3NmNhZmViLi5lNDJmZDM0IDEwMDY0NAo+
ICstLS0gYS9sdW5peC1yZWwtMjAxNzA5MjAvbHVuaXgtMjAxNzA5MjAtMS5yb2Nrc3BlYwo+ICsr
KysgYi9sdW5peC1yZWwtMjAxNzA5MjAvbHVuaXgtMjAxNzA5MjAtMS5yb2Nrc3BlYwo+ICtAQCAt
MzUsNSArMzUsMTQgQEAgYnVpbGQgPSB7Cj4gKyAJCQkJfTsKPiArIAkJCX07Cj4gKyAJCX07Cj4g
KysJCWxpbnV4ID0gewo+ICsrCQkJbW9kdWxlcyA9IHsKPiArKwkJCQlbInVuaXgiXSA9IHsKPiAr
KwkJCQkJZGVmaW5lcyA9IHtuaWwsIG5pbCwgbmlsOwo+ICsrCQkJCQkJIkhBVkVfU1lTX1NZU0NU
TF9IPTAiOwoKSWNreS4uLiA6LSgKClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+ICsrCQkJCQl9
Owo+ICsrCQkJCX07Cj4gKysJCQl9Owo+ICsrCQl9Owo+ICsgCX07Cj4gKyB9Cj4gKy0tIAo+ICsy
LjMwLjIKPiArCj4gLS0gCj4gMi4zMC4yCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290
QGJ1c3lib3gubmV0Cj4gaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0t
LS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAg
fCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJh
Y3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJ
R04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0t
LS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBo
dHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwg
ICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0t
LS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVzeWJveC5uZXQKaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
