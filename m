Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00058CDB465
	for <buildroot@archiver.kernel.org>; Thu, 19 Oct 2023 19:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E41D43138;
	Thu, 19 Oct 2023 19:45:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E41D43138
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ymX9E5vrZ6Iy; Thu, 19 Oct 2023 19:45:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A913F430F0;
	Thu, 19 Oct 2023 19:45:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A913F430F0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 01FB41BF5F8
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 19:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD5C7430F0
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 19:45:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD5C7430F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pAntHzvbexrR for <buildroot@lists.busybox.net>;
 Thu, 19 Oct 2023 19:45:45 +0000 (UTC)
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B6BD7401F1
 for <buildroot@buildroot.org>; Thu, 19 Oct 2023 19:45:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6BD7401F1
Received: from [IPV6:2a01:e0a:947:3d0:49f7:3e68:6eba:4cf6] (unknown
 [IPv6:2a01:e0a:947:3d0:49f7:3e68:6eba:4cf6])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id A701EC1855
 for <buildroot@buildroot.org>; Thu, 19 Oct 2023 21:45:43 +0200 (CEST)
Message-ID: <8dc2b3d0-26ae-4455-88c3-20825adfcab8@grenoble.cnrs.fr>
Date: Thu, 19 Oct 2023 21:45:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
References: <20231017143424.430007-1-anaumann@ultratronik.de>
 <PH1P110MB1603AE1FC3925D2A2D33EEED9FD6A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
 <38dd6e9a-7fea-e3fb-21a1-5a381a36c8cf@mind.be>
 <bede2a82-ee1f-4f8a-97f8-c6e2b54b2b84@grenoble.cnrs.fr>
 <PH1P110MB160358C3869C0C4BADDCB52B9FD4A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
 <CAEktqctCpzEL25Rxi4=BUH4VoA7OKac8rMWFkxeRqh9QRbsURw@mail.gmail.com>
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
In-Reply-To: <CAEktqctCpzEL25Rxi4=BUH4VoA7OKac8rMWFkxeRqh9QRbsURw@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1697744743;
 bh=XwmOGKOblAwIYbNbHNJ5/dD8y1n22dH10zXbMYUr8XE=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=WzpQQnXGv5amq0NQ7Txv3gr51YakUiFd+vUwFf4rMPjjigHN+VPbC7ZExaqYb4WTk
 UPgJR4d1J5xs666xUNA2aAeSpl4BRoeNzvSvOy7l1yxs8QczlItJKsiKR/RG06Hwm+
 OARVSxuMHuCJTvphJW/0avfbzKIrxzfMq16OWfGw0X9zgEwqQeZtuhlSeCWXLeiArX
 KjtjleKjWpZZaH/Gx0/+/oHBd2D4tgxzJy/WZEQZ2Y+Pr6CbU+dJEKaHgiPpuYyxgY
 r+Vp5pQHu4s9LLbCXsdbSz/c/qtIfH6jFoiBqA5FK61MlTrlZatfNeSZAClwYJVSqy
 6LJd2e4PuC2pg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=WzpQQnXG
Subject: Re: [Buildroot] [External] - [PATCH 0/1] libgpiod v2
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWJvdXQgcGF0Y2hpbmcgdXBzdHJlYW0gcGFja2FnZXMgdG8gbWFrZSB0aGVtIGJ1aWxkIHdpdGgg
Ym90aCB2ZXJzaW9ucyAxCmFuZCAyIG9mIGxpYmdwaW9kLCBCw7ZyZ2UgU3Ryw7xtcGZlbCB3cm90
ZToKPiBBdCBsZWFzdCBmb3Igc2ltcGxlIG9wZXJhdGlvbnMgWy4uLl0gdGhlIHJld29yayBpcyBx
dWl0ZSBzdHJhaWdodAo+IGZvcndhcmQuCgpHb29kIHRvIGtub3chCgo+IGluc3RlYWQgb2YgZ29p
bmcgd2l0aCBhIG5hbWUgd2hpY2ggaXMgbm8gbG9uZ2VyIHVzZWQsIGkgd2VudCB3aXRoIGEKPiBu
YW1lIHRoYXQgaGFzIGJlZW4gaW50cm9kdWNlZCBpbiB2MgoKSSBjb3VsZG4ndCBmaW5kIGFueSBt
YWNybyBkZWZpbmVkIGluIGxpYmdwaW9kIHYyIG90aGVyIHRoYW4gdGhlIGluY2x1ZGUKZ3VhcmQg
X19MSUJHUElPRF9HUElPRF9IX18sIHdoaWNoIGlzIGFsc28gZGVmaW5lZCBpbiB2MS4KCj4gR1BJ
T19WMl9MSU5FU19NQVgKClRoaXMgb25lIGNvbWVzIGZyb20gdGhlIExpbnV4IGhlYWRlciBsaW51
eC9ncGlvLmg6IGl0IGlzIHRoZSBrZXJuZWwgR1BJTwp1QVBJIHYyLiBZb3UgY291bGQgd2VsbCBo
YXZlIHRoaXMgdUFQSSB2MiBhdmFpbGFibGUgZnJvbSB0aGUga2VybmVsLCB5ZXQKYmUgdXNpbmcg
bGliZ3Bpb2QgdjEuCgpSZWdhcmRzLAoKRWRnYXIuCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
