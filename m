Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B148DC4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 21:18:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64C3760ED3
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 21:18:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 64C3760ED3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D27D42513;
	Thu, 19 Aug 2021 21:18:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dSufv4q5JR2i; Thu, 19 Aug 2021 21:18:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 355AD42527;
	Thu, 19 Aug 2021 21:18:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 984F01BF4D5
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 21:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 887DB81A18
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 21:18:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bP5ZIjnVCU6C for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 21:18:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E544A81A16
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 21:18:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9904:2733:9b91:ffcc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 6287F200371;
 Thu, 19 Aug 2021 23:18:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1629407915;
 bh=hWi1XPEAQ6CmO1u+ivxNWcWY7nk+ttWZSAE2A5NWCL0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MjBYsRfJACJ+kjCLsyFWJVGpEumPOzW/+QoaV/0FN56FMsNeZFVIv0ppiQ2UD5aH6
 pNDkQapjPzWPDshhHwfgLqgIj/EBwgSOrWFji3v0zi71jMVmff5pathDbl5O/cQjnh
 1EeyC10X9pJQklWjUe8iOGwArORvGFbS74LpvUkyTaK2goRvqIxZh7aidXroqbbi0j
 x3rr+ZbTsZSJuEM9OrKsZdA2Z76CJtzgtfVrxa6O+rvXZFfsiVc+3MlRmM3IHKwMJF
 DSBljpDK/sDmpW4ZbCAOXSLOe0NVoZ/ONaqqtUDcjAur0w7tvuDikfRPUZitPTnp3f
 ohqgtGGhV+qKQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 19 Aug 2021 23:18:31 +0200
Date: Thu, 19 Aug 2021 23:18:31 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?Sm9zw6k=?= Pekkarinen <jose.pekkarinen@unikie.com>
Message-ID: <20210819211831.GH27036@scaer>
References: <20210819075758.286416-1-jose.pekkarinen@unikie.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210819075758.286416-1-jose.pekkarinen@unikie.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/policycoreutils: Install scripts
 folder
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Sm9zw6ksIEFsbCwKCk9uIDIwMjEtMDgtMTkgMTA6NTcgKzAzMDAsIEpvc8OpIFBla2thcmluZW4g
c3Bha2UgdGh1c2x5Ogo+IFRoaXMgZm9sZGVyIGluY2x1ZGVzIHRoZSBmaXhmaWxlcyBzY3JpcHQg
dGhhdCBpcyB1c2VkCj4gYnkgc2VsaW51eCBhdXRvcmVsYWJlbCBmZWF0dXJlLiBDdXJyZW50bHkg
aXQgaW5zdGFsbHMKPiBpdCB1bmRlciAvdXNyL3NiaW4uCgpJbiB0aGUgQnVpbGRyb290IGNvbnRl
eHQsIHdlIG5lZWQgdGhlIHBvbGljeSB0byBiZSBjb3JyZWN0IHdoZW4gdGhlCmZpbGVzeXN0ZW0g
aXMgZ2VuZXJhdGVkLCBhcyBJIGV4cGxhaW5lZCBpbiBteSByZXBseSB0byB5b3VyCmNvcnJlc3Bv
bmRpbmcgcGF0Y2guCgpIb3dldmVyLCBJIGNhbiBzZWUgYSBjYXNlIHdoZXJlIHBlb3BsZSBhcmUg
YWRkaW5nL2NoYW5naW5nIGZpbGVzIGF0CnJ1bnRpbWUgb24gYSBsaXZlIGRldmljZSwgYW5kIHRo
ZXkgbWF5IHdhbnQgdG8gYmUgYWJsZSB0byByZWxhYmVsCnRoZWlyIHN5c3RlbXMuIFNvLCB0aGV5
IHdpbGwgbmVlZCB0aGlzIHNjcmlwdC4KCj4gU2lnbmVkLW9mZi1ieTogSm9zw6kgUGVra2FyaW5l
biA8am9zZS5wZWtrYXJpbmVuQHVuaWtpZS5jb20+CgpBcHBsaWVkIHRvIG5leHQsIHRoYW5rcy4K
ClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBwYWNrYWdlL3BvbGljeWNvcmV1dGls
cy9wb2xpY3ljb3JldXRpbHMubWsgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3BvbGljeWNvcmV1
dGlscy9wb2xpY3ljb3JldXRpbHMubWsgYi9wYWNrYWdlL3BvbGljeWNvcmV1dGlscy9wb2xpY3lj
b3JldXRpbHMubWsKPiBpbmRleCAwZGZkYzdhZjAzLi41MjkwYzViOWY4IDEwMDY0NAo+IC0tLSBh
L3BhY2thZ2UvcG9saWN5Y29yZXV0aWxzL3BvbGljeWNvcmV1dGlscy5tawo+ICsrKyBiL3BhY2th
Z2UvcG9saWN5Y29yZXV0aWxzL3BvbGljeWNvcmV1dGlscy5tawo+IEBAIC00Myw3ICs0Myw3IEBA
IFBPTElDWUNPUkVVVElMU19NQUtFX09QVFMgKz0gXAo+ICBQT0xJQ1lDT1JFVVRJTFNfTUFLRV9E
SVJTID0gXAo+ICAJbG9hZF9wb2xpY3kgbmV3cm9sZSBydW5faW5pdCBcCj4gIAlzZWNvbiBzZW1v
ZHVsZSBzZXN0YXR1cyBzZXRmaWxlcyBcCj4gLQlzZXRzZWJvb2wKPiArCXNldHNlYm9vbCBzY3Jp
cHRzCj4gIAo+ICAjIFdlIG5lZWQgdG8gcGFzcyBERVNURElSIGF0IGJ1aWxkIHRpbWUgYmVjYXVz
ZSBpdCdzIHVzZWQgYnkKPiAgIyBwb2xpY3ljb3JldXRpbHMgYnVpbGQgc3lzdGVtIHRvIGZpbmQg
aGVhZGVycyBhbmQgbGlicmFyaWVzLgo+IC0tIAo+IDIuMjUuMQo+IAo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlz
dAo+IGJ1aWxkcm9vdEBidXN5Ym94Lm5ldAo+IGh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0t
LS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlh
bm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVy
aWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVy
IHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkg
NDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJl
IGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhU
TUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0n
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1c3lib3gubmV0Cmh0dHA6Ly9saXN0cy5idXN5Ym94
Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
