Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6006C433F5
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 20:31:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C8128415F;
	Mon, 30 May 2022 20:31:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TT3hU-f8fz6r; Mon, 30 May 2022 20:31:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EABFD841B4;
	Mon, 30 May 2022 20:31:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EE5EF1BF31A
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8101403A2
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:30:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LXpAAi8WtCSn for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 20:30:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E63640239
 for <buildroot@buildroot.org>; Mon, 30 May 2022 20:30:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:f587:e70b:15ff:66a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id A7B1E5FF13;
 Mon, 30 May 2022 22:30:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1653942631;
 bh=vWJ3JvwVXEY43iD2QwSdhnzG9w0dJKiysrx6jojt3+M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T+MDajI3IH5KdYAV8cCMp2wYpOWiZpxbHnOGUczdCuOyJX4wqFyEy0U/LN7m4A182
 gU37MyOFVoUjkAdqfLVUINpLJjAoI015C9R6VigqNuHPHqknNzspK/LTVdsIshE/nU
 1y+RT5opZr6cHb9OOWq5qR8OrKOA3FWmGKpMjA+1K/CmEdhP53o4bOV1RBSeEhqIsN
 MwUKLQXhUm/4AIvMGzxCp7mqH9u2LNJ6JAUMfIk6/3uC1DAwx85T+plfz71bU3ruqj
 4BqesxcesyvK1M6LUQq2j6glqf1SZhGIBMnSvQCImnHfrZTPGQhhTBK+tCPU1GNxSL
 kgGTnM+6m5hAQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 30 May 2022 22:30:29 +0200
Date: Mon, 30 May 2022 22:30:29 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20220530203029.GB1390376@scaer>
References: <20220527112146.387164-1-romain.naour@gmail.com>
 <20220528100508.GE301044@scaer>
 <f76f9cc6-4188-e92a-a753-b962849f2230@gmail.com>
 <20220530202339.GA1390376@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220530202339.GA1390376@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] boot/edk2: fix gcc 11 Werror
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Um9tYWluLCBBbGwsCgpPbiAyMDIyLTA1LTMwIDIyOjIzICswMjAwLCBZYW5uIEUuIE1PUklOIHNw
YWtlIHRodXNseToKPiBPbiAyMDIyLTA1LTMwIDIxOjA0ICswMjAwLCBSb21haW4gTmFvdXIgc3Bh
a2UgdGh1c2x5Ogo+ID4gTGUgMjgvMDUvMjAyMiDDoCAxMjowNSwgWWFubiBFLiBNT1JJTiBhIMOp
Y3JpdMKgOgo+ID4gPiBPbiAyMDIyLTA1LTI3IDEzOjIxICswMjAwLCBSb21haW4gTmFvdXIgc3Bh
a2UgdGh1c2x5Ogo+ID4gPj4gQmFja3BvcnQgYSBwYXRjaCBbMV0gaW5jbHVkZWQgaW4gZWRrMi1z
dGFibGUyMDIyMDIgcmVsZWFzZS4KPiBbLS1TTklQLS1dCj4gPiBJdCBzZWVtcyB0aGUgcGF0Y2gg
ZmlsZSBoYXMgYmVlbiBjb3JydXB0ZWQgYnkgcGF0Y2h3b3JrOgo+IFstLVNOSVAtLV0KPiA+IEl0
J3MgZHVlIHRvIGxpbmUgZW5kaW5nLgo+ID4gU2VlIGF0dGFjaG1lbnQgZmlsZS4KPiBBcyBkaXNj
dXNzZWQgb24gSVJDOiB0aGlzIGlzIGFsc28gYm9ya2VkIHNvbWVob3cuLi4KCldlIGV2ZW50dWFs
bHkgbWFuYWdlZCB0byBmaXggdGhlIHRoaW5nIHdpdGggbWFudWFsIHN0ZXBzIChJCmNoZXJyeS1w
aWNrZWQgdGhlIHBhdGNoIGZyb20gUm9tYWluJ3MgdHJlZSkuCgpSZWdhcmRzLApZYW5uIEUuIE1P
UklOLgoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0t
LS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVh
bC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8
CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAg
ICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0u
LS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDov
L3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAg
IGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4t
LS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
