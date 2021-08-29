Return-Path: <SRS0=tQX8=NU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6BD3C432BE
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 12:51:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 231DA60F35
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 12:51:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 231DA60F35
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B56774045D;
	Sun, 29 Aug 2021 12:51:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iQm74hMRH_OC; Sun, 29 Aug 2021 12:51:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B260740444;
	Sun, 29 Aug 2021 12:51:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 15B831BF957
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 12:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0049F400F5
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 12:51:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g4yY7iC8TIt4 for <buildroot@lists.busybox.net>;
 Sun, 29 Aug 2021 12:51:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5ABE840193
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 12:51:40 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c87f:483a:a09f:382b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 164D45FF3F;
 Sun, 29 Aug 2021 14:51:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1630241497;
 bh=l5DnR1fq2QbJSZ2hT9CX4pk9DhO0Z0skf7LAZykoskc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=urbZpr7MfdsX6eXs5uLuKkUXb+OcBVO/KKVVk1n+LtrRrWuYn4tKkd32OJxzFMnqq
 U4bHncoMn3gt5dOA9XrJ6Q/5QRcqFLKairOr7s3DTH9j7VjkAnEaVv3dqgIAQNsEOt
 yQbNTGoxKt2vogQZON6Ah8Y8d+A2tFsYMbb2DfIpbQJZ/rEr1PI3hbWRiICGi1n213
 ZxdftcWuD5fkLgGey9C+bnvemx3BMqNCR+97Cl5zHQfzuGv1etxpoyjuRw9Z2KiJ9Z
 1GjvWXzbKZcxOTnDGlaYigII1gkyoPrysuq4tDjaXcNuJWWCgPD4EgF45Qhat3HX2F
 snxtbqC3hIfCw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 Aug 2021 14:51:21 +0200
Date: Sun, 29 Aug 2021 14:51:21 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20210829125121.GA1053080@scaer>
References: <20210817083930.3718711-1-herve.codina@bootlin.com>
 <20210817083930.3718711-8-herve.codina@bootlin.com>
 <20210828224740.GS2661@scaer> <20210829133955.74d921e9@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210829133955.74d921e9@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v3 07/16] package/pkg-generic.mk: detect
 files overwritten in TARGET_DIR and HOST_DIR
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
Cc: Herve Codina <herve.codina@bootlin.com>,
 Naumann Andreas <ANaumann@ultratronik.de>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>, buildroot@buildroot.org,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

VGhvbWFzLCBIZXJ2w6ksIEFsbCwKCk9uIDIwMjEtMDgtMjkgMTM6MzkgKzAyMDAsIFRob21hcyBQ
ZXRhenpvbmkgc3Bha2UgdGh1c2x5Ogo+IE9uIFN1biwgMjkgQXVnIDIwMjEgMDA6NDc6NDAgKzAy
MDAKPiAiWWFubiBFLiBNT1JJTiIgPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPiA+
IEhvd2V2ZXIsIHdoYXQgcHJvbXB0ZWQgbWUgZnJvbSBhcHBseWluZyBmb3Igbm93LCBpcyB0aGF0
IHRoaXMgbmV3Cj4gPiBkZXRlY3Rpb24gaXMgYSBoYXJkIGVycm9yLgpbLS1TTklQLS1dCj4gV2Ug
aGFkIHNvbWUgZGlzY3Vzc2lvbiB3aXRoIEhlcnbDqSBiYWNrIHdoZW4gaGUgd29ya2VkIG9uIHRo
aXMsIGFuZCBJCj4gZGlzYWdyZWVkIHdpdGggYWRkaW5nIGFuIG9wdGlvbi4gV2hlbiBCUjJfUEVS
X1BBQ0tBR0VfRElSRUNUT1JJRVM9eSwgYQo+IGZpbGUgb3ZlcndyaXRlIG11c3QgYmUgYSBoYXJk
IGVycm9yLCBhcyB0aGUgcmVzdWx0IG9mIHRoZSBidWlsZCBpcwo+IGluY29ycmVjdCBpZiB0aGVy
ZSBpcyBhbiBvdmVyd3JpdGUuIEl0J3Mgbm90IHRoZSAibGF0ZXN0IiBwYWNrYWdlIHRoYXQKPiB3
aW5zIGluIGFuIG92ZXJ3cml0ZSBzaXR1YXRpb24sIGxpa2UgaXQgZG9lcyBpbiBhIG5vbi1QUEQg
Y2FzZS4KClNvLCBleGlzdGluZyBidWlsZHMgdGhhdCBzdWNjZWVkIHdpdGggUFBELCBhbmQgZm9y
IHdoaWNoIGFuIG92ZXJ3cml0ZQppcyBub3QgYW4gaXNzdWUgZXZlbiBhdCBydW50aW1lLCB3aWxs
IG5vdyBiZSBicm9rZW4gYXQgYnVpbGQgdGltZS4KCkFmdGVyIGFsbCwgd2UgX2tub3dfIHRoZXJl
IGFyZSB1c2VycyB0aGF0IGFscmVhZHkgdXNlIFBQRCAoZm9yIFRMUEIpLAphbmQgdGhvc2UgdXNl
cnMgaGF2ZSB3b3JraW5nIHN5c3RlbXMsIGJ1dCBJIGhpZ2hseSBkb3VidCB0aGVzZSBidWlsZHMK
aGF2ZSBubyBmaWxlIG92ZXJ3cml0ZSB3aGF0c29ldmVyLi4uCgo+IFNvIEkgcmVhbGx5IHRoaW5r
IHRoaXMgbXVzdCBiZSBhIGhhcmQgZXJyb3IgZm9yIFBQRCBidWlsZHMsIGFuZCBqdXN0IGEKPiB3
YXJuaW5nIGZvciBub24tUFBEIGJ1aWxkcy4KCkZvciBub24tUFBELCB0aGF0IGNvZGUgaXMgbm90
IGV2ZW4gdXNlZCwgYmVjYXVzZSB0aGUgbWFjcm9zIGFyZSBvbmx5CmRlZmluZWQgaWYgQlIyX1BF
Ul9QQUNLQUdFX0RJUkVDVE9SSUVTPXk7IHNvIGZvciBub24tUFBELCB3ZSB3aWxsIG5vdApldmVu
IGdldCBhIHdhcm5pbmcuCgo+IFllcywgZm9yIFBQRCBidWlsZHMsIGl0IG1lYW5zIHVzZXJzIHdp
bGwgZ2V0IGZhaWx1cmVzLCBidXQgdGhvc2UKPiBmYWlsdXJlcyBhcmUgcG9pbnRpbmcgdG8gcmVh
bCBwcm9ibGVtcy4KCkkgZnVsbHkgYWdyZWUsIGJ1dCBpbiBwcmFjdGljZSwgc29tZSBvZiB0aG9z
ZSBvdmVyd3JpdGVzIG1heSBiZSB0b3RhbGx5Cmlubm9jdXNvdXMgd2hlbiBydW5uaW5nIHRoZSBz
eXN0ZW0uIFRoaW5rIHRoZSBnbnUgaW5mbyBkYjogd2UgMTAwJSBkb24ndApjYXJlIGFib3V0IGl0
IGF0IHJ1bnRpbWUsIGJ1dCB0aGlzIGlzIGFuIG92ZXJ3cml0ZSAoeWVzLCB3ZSBhbHJlYWR5CmZp
eGVkIHRoYXQgb25lLCBidXQgaXQgd2FzIGluIHRoaXMgY3ljbGUsIHNvIHVzZXJzIG9mIHByZXZp
b3VzIHJlbGVhc2VzCndobyB1c2UgUFBEIGRvIGhhdmUgb3ZlcndyaXRlcyB0aGF0IHRoZXkgZG9u
J3QgY2FyZSBhYm91dCkuCgo+IFNvLCBteSBwcmVmZXJlbmNlIHdvdWxkIGJlIHRvIG1lcmdlIGFz
IGFuIHVuY29uZGl0aW9uYWwgY2hlY2ssIGFuZCBzZWUKPiBob3cgaXQgZ29lcy4KCk9LLCBJIGFt
IGFsaWduaW5nIHdpdGggdGhhdCBwb3NpdGlvbi4gVW5sZXNzIHNvbWVvbmUgZWxzZSBiZWF0cyBt
ZSB0bwppdCwgSSdsbCByZXN1bWUgd29yayBvbiB0aGlzIHNlcmllcyBsYXRlciBpbiB0aGUgV0Us
IG9yIGVhcmx5IG5leHQKd2Vlay4uLgoKPiBQZXJoYXBzIHRoZSBzaXR1YXRpb24gd2lsbCBiZSBz
byBiYWQgdGhhdCB3ZSB3aWxsIGhhdmUgdG8KPiBtYWtlIGl0IGNvbmRpdGlvbmFsLCBidXQgSSB3
b3VsZCBwcmVmZXIgdG8gaGF2ZSBpdCB1bmNvbmRpdGlvbmFsIGZpcnN0Cj4gYW5kIHNlZSB0aGUg
aW1wYWN0LgoKTm90ZSB0aGF0IG15IHByb3Bvc2FsIHdvdWxkIGhhdmUgdW5jb25kaXRpb25hbGx5
IGVuYWJsZWQgaXQgaW4gdGhlCmF1dG9idWlsZGVycywgc28gd2Ugd291bGQgaGF2ZSBub3RpY2Vk
IGFzIHdlbGwsIHNvIHdlIGNhbiBzdGlsbCBkbyB0aGF0CmlmIHdlIGxhdGVyIGRlY2lkZSB0byBt
YWtlIHRoZSBoYXJkIGVycm9yIGNvbmRpdGlvbmFsLgoKRmluYWxseSwgYXMgYSBzaWRlIG5vdGU6
IHRoZXJlIGlzIHN0aWxsIGEgY2FzZSBvZiBmaWxlIG92ZXJ3cml0ZSB0aGF0IHdlCmRvIG5vdCBk
ZXRlY3QsIGV2ZW4gd2l0aCB0aGlzIHNlcmllczogaWYgdHdvIHBhY2thZ2VzIHRoYXQgYXJlIG5v
dCBwYXJ0Cm9mIHRoZSBzYW1lIGRlcGVuZGVuY3kgY2hhaW4gKGkuZS4gdGhleSBkbyBub3QgZGVw
ZW5kIG9uZSBvbiB0aGUgb3RoZXIpLAphbmQgdGhleSBib3RoIGluc3RhbGwgdGhlIHNhbWUgZmls
ZSwgdGhlbiB0aGUgZmlsZS1vdmVyd3JpdGUgd2lsbCBvbmx5CmhhcHBlbiB3aGVuIHdlIGV2ZW50
dWFsbHkgYXNzZW1ibGUgdGhlIGdsb2JhbCB0YXJnZXQvIGFuZCBob3N0LyBmcm9tIHRoZQppbmRp
dmlkdWFsIFBQRCB0YXJnZXQvIGFuZCBob3N0LyBhbmQgd2Ugc3RpbGwgaGF2ZSB0byBhZGQgYSBk
ZXRlY3Rpb24KZm9yIHRoYXQgY2FzZSAod2hpY2ggaXMgbm90IGEgcHJlLXJlcXVpc2l0ZSBiZWZv
cmUgd2UgYXBwbHkgdGhlIGN1cnJlbnQKc2VyaWVzLCBvZiBjb3Vyc2UpLgoKUmVnYXJkcywKWWFu
biBFLiBNT1JJTi4KCj4gQmVzdCByZWdhcmRzLAo+IAo+IFRob21hcwo+IC0tIAo+IFRob21hcyBQ
ZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KPiBFbWJlZGRlZCBMaW51eCBhbmQg
S2VybmVsIGVuZ2luZWVyaW5nCj4gaHR0cHM6Ly9ib290bGluLmNvbQo+IF9fX19fX19fX19fX19f
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
