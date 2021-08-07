Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65C6EC4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 10:38:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01F7061104
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 10:38:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 01F7061104
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B88F440426;
	Sat,  7 Aug 2021 10:38:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0kuaBBsc0L6M; Sat,  7 Aug 2021 10:38:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 129ED403F6;
	Sat,  7 Aug 2021 10:38:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6F8F91BF2F6
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 10:38:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B1F583A0C
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 10:38:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ui-c1zZKUrRc for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 10:38:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 743AB83938
 for <buildroot@busybox.net>; Sat,  7 Aug 2021 10:38:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:f16c:16be:6f47:5c9a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 760B113F86F;
 Sat,  7 Aug 2021 12:38:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1628332684;
 bh=FcxbBUHCV6MLDhCcscRLJXngHXXccwhwOLA5t9o6qrM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TxupjKtaQF7AShMrYQRJVptg3maJi6C92tc85P9HZDyTYpaLGP+qw4lvI7X/P3jJg
 YZNhlc3TpRoT4upegCmnULap29FhbglhB4BL3IZJAWfHw6eppsroltK9HtJVEpwIPX
 QlsN5xuzXZrUnN5Ck9xRKJBwye6hToLIspX/F2zoCbZNJ79tIAkcVjM65xvMkgmomU
 yPP1c1Z6gK44rqNA7Z+uEnVitZwCOWs9RKDhiti91z4FN66iqm4+oiVAabeEplgubz
 UnCc8QvpdRmqKmCh8jGrBgApnJY9XH9VantRASVd9SZxwqZg79lcLvGG5fZOE1959M
 ZPYL1xitYCQ2g==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 07 Aug 2021 12:38:00 +0200
Date: Sat, 7 Aug 2021 12:38:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20210807103800.GB27036@scaer>
References: <20210807085752.3269-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210807085752.3269-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v4 1/2] package/lua-lunix: force no sysctl
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

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIxLTA4LTA3IDEwOjU3ICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IEZpeGVzOiBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQv
cmVzdWx0cy83NDlhMTFkNTI4OWM2ZmVjM2IyZjIzNmI5MDczZmMxYWI3MzBkMDkwLwo+IFNpZ25l
ZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNvaXMucGVycmFkQGdhZHoub3JnPgo+IC0t
LQo+ICBwYWNrYWdlL2x1YS1sdW5peC8wMDAzLWZvcmNlLW5vLXN5c2N0bC5wYXRjaCB8IDMyICsr
KysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspCj4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2x1YS1sdW5peC8wMDAzLWZvcmNlLW5vLXN5c2N0
bC5wYXRjaAo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2x1YS1sdW5peC8wMDAzLWZvcmNlLW5v
LXN5c2N0bC5wYXRjaCBiL3BhY2thZ2UvbHVhLWx1bml4LzAwMDMtZm9yY2Utbm8tc3lzY3RsLnBh
dGNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAuLjM0NjdlMjcxMwo+
IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL2x1YS1sdW5peC8wMDAzLWZvcmNlLW5vLXN5
c2N0bC5wYXRjaAo+IEBAIC0wLDAgKzEsMzIgQEAKPiArRnJvbSBkOWI2NWUzMDY0NzhmNWQyMzU2
ZWY5MGVhYjgxOTE5ODQ1MzQyMzhhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ICtGcm9tOiBG
cmFuY29pcyBQZXJyYWQgPGZyYW5jb2lzLnBlcnJhZEBnYWR6Lm9yZz4KPiArRGF0ZTogV2VkLCA0
IEF1ZyAyMDIxIDE1OjI3OjA1ICswMjAwCj4gK1N1YmplY3Q6IFtQQVRDSF0gZm9yY2Ugbm8gc3lz
Y3RsCj4gKwo+ICtTaWduZWQtb2ZmLWJ5OiBGcmFuY29pcyBQZXJyYWQgPGZyYW5jb2lzLnBlcnJh
ZEBnYWR6Lm9yZz4KPiArLS0tCj4gKyBsdW5peC1yZWwtMjAxNzA5MjAvbHVuaXgtMjAxNzA5MjAt
MS5yb2Nrc3BlYyB8IDkgKysrKysrKysrCj4gKyAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25z
KCspCj4gKwo+ICtkaWZmIC0tZ2l0IGEvbHVuaXgtcmVsLTIwMTcwOTIwL2x1bml4LTIwMTcwOTIw
LTEucm9ja3NwZWMgYi9sdW5peC1yZWwtMjAxNzA5MjAvbHVuaXgtMjAxNzA5MjAtMS5yb2Nrc3Bl
Ywo+ICtpbmRleCA3NmNhZmViLi5lNDJmZDM0IDEwMDY0NAo+ICstLS0gYS9sdW5peC1yZWwtMjAx
NzA5MjAvbHVuaXgtMjAxNzA5MjAtMS5yb2Nrc3BlYwo+ICsrKysgYi9sdW5peC1yZWwtMjAxNzA5
MjAvbHVuaXgtMjAxNzA5MjAtMS5yb2Nrc3BlYwo+ICtAQCAtMzUsNSArMzUsMTQgQEAgYnVpbGQg
PSB7Cj4gKyAJCQkJfTsKPiArIAkJCX07Cj4gKyAJCX07Cj4gKysJCWxpbnV4ID0gewo+ICsrCQkJ
bW9kdWxlcyA9IHsKPiArKwkJCQlbInVuaXgiXSA9IHsKPiArKwkJCQkJZGVmaW5lcyA9IHtuaWws
IG5pbCwgbmlsOwo+ICsrCQkJCQkJIkhBVkVfU1lTX1NZU0NUTF9IPTAiOwo+ICsrCQkJCQl9Owo+
ICsrCQkJCX07Cj4gKysJCQl9Owo+ICsrCQl9OwoKU28sIHRoaXMgbG9va3MgbGlrZSB0aGUgZXhh
Y3Qgc2FtZSBwYXRjaCBhcyB2My4gVGhlcmUgaXMgbm8gbmVlZGVkIHRvCnJlcHNpbiBpbiBzdWNo
IGEgY2FzZSwgZXhjZXB0IHRvIHByb3ZpZGUgbW9yZSBpbmZvIGluIHRoZSBjb21taXQgbG9nCih3
aGljaCBpcyBub3QgdGhlIGNhc2UpLgoKQmVyc2lkZXMsIEkgdGhpbmsgdGhlIHNvbHV0aW9uIHN1
Z2dlc3RlZCBieSBBcm5vdXQgYW5kIEksIHRoYXQgcGFja2FnZXMKY2FuIHByb3ZpZGUgZXh0cmEg
Q0ZMQUdTLCBpcyBiZXR0ZXIuCgpBbHNvLCB3aGVuIGVyLXNlbmRpbmcgYSBuZXcgaXRlcmF0aW9u
LCBjYW4geW91IHBsZWFzZSBtYXJrIHRoZSBwcmV2aW91cwpvbmUgYXMgc3VwZXJzZWRlZCBpbiBQ
YXRjaHdvcmsgKEkgZGlkIGl0IHRoaXMgdGltZSk6CiAgICBodHRwczovL3BhdGNod29yay5vemxh
YnMub3JnL3Byb2plY3QvYnVpbGRyb290L2xpc3QvCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoK
PiArIAl9Owo+ICsgfQo+ICstLSAKPiArMi4zMC4yCj4gKwo+IC0tIAo+IDIuMzAuMgo+IAo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290
IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidXN5Ym94Lm5ldAo+IGh0dHA6Ly9saXN0cy5idXN5
Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0t
LS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0t
LS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJ
IFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdh
cmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8Cnwg
KzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8
ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8v
KlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0t
LS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1c3lib3gubmV0Cmh0dHA6Ly9s
aXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
