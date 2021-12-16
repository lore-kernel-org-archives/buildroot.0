Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE221C433EF
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 21:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 40EE840124;
	Thu, 16 Dec 2021 21:08:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D8qPRDtKxxdd; Thu, 16 Dec 2021 21:08:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 171574049D;
	Thu, 16 Dec 2021 21:08:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 665FB1BF392
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 21:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5657D417AD
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 21:08:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OJUr28eDP411 for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 21:08:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EBAB8417AA
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 21:08:18 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8844:86e8:1e5c:6e33])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id BD990780344;
 Thu, 16 Dec 2021 22:08:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1639688895;
 bh=msPhIQTx7Jum4USLz8bZhsHWzHzhe/1iBXJi7zGxnO0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jwEWEn/xFVldv1sGhNZB7DlSBBFr8xzr8xD8uf8Sv+Oq6GCAYfPHfiaxprSM4RGGv
 h6A5hZRo6ICxf+/Arh0ztKQKL6s1BenYR+/Z6aHRa+oKsXP5h7MlBUwgKanFksiG+P
 NlPXpK+g1d1XIQLQc/pcb7P4R73JdRrsoMXRSbpjlhwCEhuiX9t4BIgSNQ+Nz5MZJx
 3Rpca6n3IQmzssQOJLYD8xvwiWqo9VsWGSMbvwYLIPWKXBzhSWq0It1fdnvB5RGyq3
 Kz2Y4mPN7yfkO6xUzd4tdsXLlAY2cTJnLk/DbclDwQd9MgapOKWrrsi6EPKkUhQ8LB
 +TtZAmhRdJp1Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 16 Dec 2021 22:08:08 +0100
Date: Thu, 16 Dec 2021 22:08:08 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20211216210808.GH2603@scaer>
References: <20211215173432.r75invoe3ff6mthg@zenon.in.qult.net>
 <f1f9e092-9b0d-880b-bdd7-7e6a50f2382d@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f1f9e092-9b0d-880b-bdd7-7e6a50f2382d@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/fakedate: fix finding the right
 date executable
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
Cc: Ignacy =?utf-8?B?R2F3xJlkemtp?= <ignacy.gawedzki@green-communications.fr>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QXJub3V0LCBBbGwsCgpPbiAyMDIxLTEyLTE2IDIxOjAzICswMTAwLCBBcm5vdXQgVmFuZGVjYXBw
ZWxsZSBzcGFrZSB0aHVzbHk6Cj4gT24gMTUvMTIvMjAyMSAxODozNCwgSWduYWN5IEdhd8SZZHpr
aSB3cm90ZToKPiA+SWYgdGhlIFBBVEggaW5pdGlhbGx5IGNvbnRhaW5zIGhvc3QvYmluLCB0aGVu
IHRoZSByaWdodCBkYXRlCj4gPmV4ZWN1dGFibGUgaXMgdG8gYmUgZm91bmQgYWZ0ZXIgdGhlICpm
aXJzdCogb2NjdXJyZW5jZSBvZiBmYWtlZGF0ZSBpbgo+ID5ub3JtYWwgKGZvcndhcmQpIFBBVEgg
b3JkZXIuICBGaXggdGhlIHdyYXBwZXIgc28gdGhhdCB0aGF0IGZpcnN0Cj4gPm9jY3VycmVuY2Ug
aXMgZm91bmQgaW5kZWVkLgo+ICBKdXN0IHRvIGJlIGNsZWFyOiB0aGUgcHJvYmxlbSBpcyB0aGF0
IGlmIHlvdSBkbwo+IFBBVEg9JFBBVEg6JFBXRC9vdXRwdXQvaG9zdC9iaW4gbWFrZQo+IHRoYXQg
aXQgZG9lc24ndCBmaW5kIHRoZSByZWFsIGRhdGUgcHJvZ3JhbSwgcmlnaHQ/CgpUaGlzIGlzIHZl
cnkgbm90IG5pY2UgdG8gZG8gc3RvLCBpbmRlZWQuLi4gOi0oClVubGVzcyB0aGlzIGlzIGFnYWlu
IHRoaXMgU0RLIHRoaW5nIHRoYXQgaXMgYml0dGluZyB1cyBiYWNrPwoKPiA+U2lnbmVkLW9mZi1i
eTogSWduYWN5IEdhd8SZZHpraSA8aWduYWN5Lmdhd2VkemtpQGdyZWVuLWNvbW11bmljYXRpb25z
LmZyPgo+ID4tLS0KPiA+ICBwYWNrYWdlL2Zha2VkYXRlL2Zha2VkYXRlIHwgOSArKysrKysrLS0K
PiA+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4K
PiA+ZGlmZiAtLWdpdCBhL3BhY2thZ2UvZmFrZWRhdGUvZmFrZWRhdGUgYi9wYWNrYWdlL2Zha2Vk
YXRlL2Zha2VkYXRlCj4gPmluZGV4IDliZWYxMTMzNTcuLjAzYTRmMDQwNzkgMTAwNzU1Cj4gPi0t
LSBhL3BhY2thZ2UvZmFrZWRhdGUvZmFrZWRhdGUKPiA+KysrIGIvcGFja2FnZS9mYWtlZGF0ZS9m
YWtlZGF0ZQo+ID5AQCAtMjEsMTMgKzIxLDE4IEBACj4gPiAgREFURV9CSU49ZmFsc2UKPiA+ICAj
IERvIG5vdCBjYWxsIGFueSAnZGF0ZScgYmVmb3JlIHVzIGluIHRoZSBQQVRILCBvciB0aGF0IHdv
dWxkIGNyZWF0ZQo+ID4gICMgYW4gaW5maW5pdGUgcmVjdXJzaW9uLgo+ID4rbGFzdF9kYXRlPWZh
bHNlCj4gPiAgZm9yIGRhdGUgaW4gJCh3aGljaCAtYSBkYXRlIHx0YWMpOyBkbwo+ID4gICAgICBp
ZiBbICIke2RhdGV9IiAtZWYgIiQwIiBdOyB0aGVuCj4gPi0gICAgICAgIGJyZWFrCj4gPisJREFU
RV9CSU49JGxhc3RfZGF0ZQo+ID4gICAgICBmaQo+ID4tICAgIERBVEVfQklOPSIke2RhdGV9Igo+
ID4rICAgIGxhc3RfZGF0ZT0iJHtkYXRlfSIKPiA+ICBkb25lCj4gCj4gIEFsdGhvdWdoIHRoaXMg
d29ya3MsIHdvdWxkbid0IGl0IGJlIHNpbXBsZXIgdG8gdGhyb3cgYXdheSB0aGUgdGFjCj4gaW52
b2NhdGlvbiBhbmQgaW5zdGVhZCBqdXN0IHRha2UgdGhlIGZpcnN0IG9uZSBhZnRlciBvdXJzZWx2
ZXM/IEkuZS4sCj4gc29tZXRoaW5nIGxpa2U6Cj4gCj4gZm91bmQ9ZmFsc2UKPiBmb3IgZGF0ZSBp
biAkKHdoaWNoIC1hIGRhdGUpOyBkbwo+ICAgICBpZiBbICIke2RhdGV9IiAtZWYgIiRAIiBdOyB0
aGVuCj4gICAgICAgICBmb3VuZD10cnVlCj4gICAgIGVsaWYgWyAiJGZvdW5kIiA9IHRydWUgXTsg
dGhlbgoKWW91IGNhbiBzaW1wbGlmeSB0aGUgZWxpZiB0ZXN0IHdpdGggKGFmdGVyIGFsbCwgdGhh
dCdzIHRoZSB3aG9sZSBwb2ludApvZiB1c2luZyBmYWxzZS90cnVlIGluc3RlYWQgb2YgMC8xKToK
CiAgICBlbGlmICR7Zm91bmR9OyB0aGVuCgo+ICAgICAgICAgREFURV9CSU49IiR7ZGF0ZX0iCgpB
bmQgdGhlbiwgeW91IGNhbiBicmVhayB0aGUgbG9vcCBiZWNhdXNlIHdlIGRpZCBmaW5kIGl0LgoK
PiAgICAgZmkKPiBkb25lCgpUaGlzIGlzIHVzdWFsbHkgd2hhdCBJIHdvdWxkIGhhdmUgc3VnZ2Vz
dGVkLi4uIEhvd2V2ZXIsIHNlZSBiZWxvdy4uLgoKPiAoYXMgdXN1YWwsIHVudGVzdGVkKS4KCj4g
IFlhbm4/IFJlbWVtYmVyIHdoYXQgd2FzIHRoZSByZWFzb24gZm9yIHRoZSB0YWM/CgowZmU1MzZi
Nzk3YyAocGFja2FnZS9mYWtlZGF0ZTogYXZvaWQgcmVjdXJzaW9uIGlmIG5vdCBmaXJzdCBpbiB0
aGUgUEFUSCkKCkkgdXNlZCB0YWMgYmVjYXVzZSBpdCBhdm9pZGVkIHVzaW5nIGFuIGludGVybWVk
aWF0ZSB2YXJpYWJsZSBsaWtlIHlvdQpzdWdnZXN0IGFib3ZlLCB3aXRoICJmb3VuZD10cnVlIjoK
CiAgICBXZSBmaXggdGhhdCBieSBpdGVyYXRpbmcsIGluIHJldmVyc2Ugb3JkZXIsIG92ZXIgYWxs
IHRoZSAnZGF0ZScgd2UgY2FuCiAgICBmaW5kIGluIFBBVEgsIGFuZCB3aGVuIHdlIGZpbmQgb3Vy
c2VsdmVzLCB0aGVuIHdlIGtub3cgdGhlIG9uZSB3ZSBmb3VuZAogICAgaW4gdGhlIGl0ZXJhdGlv
biBqdXN0IGJlZm9yZSBpcyB0aGUgb25lIHRoYXQgd2Ugc2hvdWxkIGNhbGwuCgpUaGlzIHdhcyBh
IGhhY2ssIGFuZCBpbiByZXN0cm9zcGVjdCwgbm90IHRoYXQgc21hcnQgYXMgaXQgc2VlbWVkIHRv
IGJlLi4uCgpTbyB0aGlzIG1lYW5zIHRoYXQgd2Ugbm93IGhhdmUgdGhlIHJldmVyc2UgcHJvYmxl
bTogd2UgcmVjdXJzZSBpZiB3ZSBhcmUKYWxzbyB0aGUgbGFzdC4uLgoKWW91ciAoQXJub3V0J3Mp
IHNvbHV0aW9uIGlzIHRoZSBiZXN0IEkgY2FuIHRoaW5rIG9mOiBpdCBpcyBvYnZpb3VzLApzdHJh
aWdodGZvcndhcmQsIGFuZCBpdCBpcyBub3QgdHJ5aW5nIHRvIGJlIHNtYXJ0LCBzbyBJIGxpa2Ug
aXQuCgpJZ25hY3ksIHdoZW4geW91IHJlc3BpbiB3aXRoIEFybm91dCdzIHByb3Bvc2FsLCBkbyBu
b3QgZm9yZ2V0IHRvIGFkZCBhCmxpbmUgbGlrZSB0aGF0IHRvIHlvdXIgY29tbWl0IGxvZywgcGxl
YXNlOgoKICAgIEZpeGVzOiAwZmU1MzZiNzk3Y2MwYWUxMWJkNTRlZDcwNDZjZDM5YjczNzgwYzE4
CgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiAgUmVnYXJkcywKPiAgQXJub3V0Cj4gCj4gCj4g
PitpZiBbICIkREFURV9CSU4iID0gZmFsc2UgXTsgdGhlbgo+ID4rICAgIERBVEVfQklOPSRsYXN0
X2RhdGUKPiA+K2ZpCj4gCj4gPisKPiA+ICBpZiBbIC1uICIkU09VUkNFX0RBVEVfRVBPQ0giIF07
IHRoZW4KPiA+ICAgICAgRk9SQ0VfRVBPQ0g9MQo+ID4gICAgICBmb3IgaSBpbiAiJEAiOyBkbwo+
ID4KCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0t
LS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwt
VGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8
ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAg
fCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0t
LS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95
bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBj
b25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0t
LS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
