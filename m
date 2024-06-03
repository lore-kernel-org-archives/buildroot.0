Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C138CC25B76
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 18:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 522D340B2F;
	Mon,  3 Jun 2024 18:43:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id muXhWgpdFf_X; Mon,  3 Jun 2024 18:43:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A17140B54
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A17140B54;
	Mon,  3 Jun 2024 18:43:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E7A6F1BF35F
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 18:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0C0340B54
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 18:43:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ksSSed3ftkBO for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 18:43:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8FA0640B2F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FA0640B2F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8FA0640B2F
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 18:43:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5AE5313F8B8;
 Mon,  3 Jun 2024 20:43:11 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 03 Jun 2024 20:43:11 +0200
Date: Mon, 3 Jun 2024 20:43:11 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <Zl4Ov3hQoTGFl6e8@landeda>
References: <cover.1717360788.git.yann.morin.1998@free.fr>
 <1f9ee4bc875b559abde9a4746ab55fa4ca62dc85.1717360788.git.yann.morin.1998@free.fr>
 <CADvTj4qfHg9=mC_OweMCpfNNBDMweBreqDo_bT=t=m339oLBWQ@mail.gmail.com>
 <Zlzg8I5r7cd8yTz5@landeda>
 <CADvTj4rhK6KUZ-q-w65ZDGJZyh2fs2DnHXM-mxzMv3LS9GOQYA@mail.gmail.com>
 <Zl2uhKujEDzv2Gur@landeda>
 <CADvTj4qyfvGUCbfMj=uWSxcJkBH7LBs-hcdv4Z3_Ax6FtYTnNg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4qyfvGUCbfMj=uWSxcJkBH7LBs-hcdv4Z3_Ax6FtYTnNg@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717440193;
 bh=blQuIEvHIzHScBvKfJ2MC39aE+1wEKbPRRRp8dIxF44=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aVHN5W8jIoPAg35DPKSU6BibgWQxJtpH9SylGf7XfVB6vTt+rkvhooiYMR2ZaipS2
 unCUb9h+hHZDuUOUdYqh6r8gPe1oNQhRMMR8gUWtYRkzrLMXsQDpMfAyb3iGTbTOjr
 +1i6sRGkUX47hSd2N6WU/r0jgXYMOMm8QQmIe5dBfPms/pDqBT2RU4h+u/MAroHW7x
 1SDQJog4KoPVT8ZE8TpYjI7veGkDTVd2dk/yD6LlMlNQjrsDYtGSQnDDgRUFo8OzQk
 5qT+yUW/X8nYoqoutbNWqn/DOI9pKV7NimycT+gF43/q4t145Dkpl23no+7ngwjkQ8
 5ZvNRic7Cv1ug==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aVHN5W8j
Subject: Re: [Buildroot] [PATCH 14/16] package/pkg-cargo: add support for
 unlocked packages
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

SmFtZXMsIEFsbCwKCk9uIDIwMjQtMDYtMDMgMTE6NDggLTA2MDAsIEphbWVzIEhpbGxpYXJkIHNw
YWtlIHRodXNseToKPiBPbiBNb24sIEp1biAzLCAyMDI0IGF0IDU6NTLigK9BTSBZYW5uIEUuIE1P
UklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gd3JvdGU6Cj4gPiBIbW1tLi4uIEluZGVlZCwg
dGhpcyB3b3VsZCBjYXVzZSBxdWl0ZSBzb21lIGdyaWVmIGlmIHdlIHdvdWxkIGNoYW5nZSB0aGUK
PiA+IENhcmdvLmxvY2suLi4KPiA+IEhvd2V2ZXIsIEkgZG9uJ3Qgc2VlIGFuIGVhc3kgc29sdXRp
b24gdG8gdGhpcyBpc3N1ZS4uLiA6LS8KPiA+IFdlbGwsIEkgZG8gaGF2ZSBhbiBpZGVhLCBhbmQg
aXQgd291bGQgZGVmaW5pdGVseSB3b3JrLCBidXQgaXQgd291bGQgYmUKPiA+ICpleGNlc3NpdmVs
eSogdWdseS4uLiBJJ2xsIHRyeSB0byBpbXBsZW1lbnQgaXQsIGJ1dCBhcyBhbiBhZGRpdGlvbmFs
Cj4gPiBjaGFuZ2Ugb24tdG9wIG9mIHRoZSBleGlzdGluZyBzZXJpZXMsIGJlY2F1c2UgSSBhbSBu
b3Qgc3VyZSBpdCB3b3VsZCBicgo+ID4gbWVhbmluZ2Z1bCBpbiB0aGUgZW5kLi4uIExldCdzIHNl
ZS4uLgo+IFByb2JhYmx5IGl0IHdvdWxkIGJlIGdvb2QgZW5vdWdoIHRvIHNheSB0YWtlIHRoZSBm
aXJzdCA3IGNoYXJhY3RlcnMgb2YgdGhlCj4gc2hhMjU2IGhhc2goc2FtZSBsZW5ndGggYXMgYSBn
aXQgc2hvcnRoYXNoKSBvZiB0aGUgQ2FyZ28ubG9jayBmaWxlIGFuZAo+IGluY29ycG9yYXRlIHRo
YXQgaW50byB0aGUgYXJjaGl2ZSBmaWxlbmFtZSBhcHBlbmRlZCB0byB0aGUgcGFja2FnZSB2ZXJz
aW9uLgoKVGhlIHByb2JsZW0gd2l0aCBzaG9ydCBoYXNoZXMsIGlzIHRoYXQgdGhleSBhcmUgbXVj
aCBsZXNzIHVuaXF1ZSB0aGFuCmZ1bGwgaGFzaGVzLiBXZSd2ZSBleGNsdWRlZCB1c2luZyBzaG9y
dCBoYXNoZXMgd2hlcmV2ZXIgd2UgaGFkIHRoZQpjaG9pY2UgKHNlZSBmb3IgZXhhbXBsZSB0aGUg
cmVjZW50IGdpdCBleHBvcnQtc3Vic3QgYXR0cmlidXRlLCB3aGVyZSB3ZQpyZXBsYWNlIHRoZSBz
aG9ydC1oYXNoIHBsYWNlaG9sZGVyIHdpdGggdGhlIGZ1bGwtbGVuZ3RoIGhhc2gpLiBTbyBJCndv
dWxkIHJlZnJhaW4gZnJvbSB1c2luZyBhIHNob3J0LWhhc2ggYW55d2hlcmUgZWxzZSBhcyB3ZWxs
LgoKVGhlcmUgaXMgYSBzaW1wbGVyIHNvbHV0aW9uLCB0aG91Z2gsIHdoaWNoIGlzIHRvIHJlbHkg
b24gdGhlIC5tayB0byBzZXQKdGhlIHZlcnNpb24gYW5kIGJlIGRvbmUgd2l0aCBpdDoKCiAxLiBp
dCBpcyB2ZXJ5IHNlbGRvbSB0aGF0IGEgY2FyZ28gcGFja2FnZSBpcyBub3QgbG9ja2VkLCBzbyB3
ZSBkb24ndAogICAgbmVlZCBhbnl0aGluZyB0b28gY29tcGxleDsKIDIuIGZvciB1bmxvY2tlZCBw
YWNrYWdlcywgd2UnbGwgdmVyeSBzZWxkb20gdXBkYXRlIG91ciBDYXJnby5sb2NrLCBzbwogICAg
d2UgZG9uJ3QgbmVlZCBhbnl0aGluZyB0b28gZmFuY3k7CiAzLiBpZiBvbmUgZm9yZ2V0cyB0byB1
cGRhdGUgdGhlIHZlcnNpb24gd2hlbiB1cGRhdGluZyBDYXJnby5sb2NrLAogICAgdGhlcmUgd2ls
bCBiZSBhIGhhc2ggbWlzbWF0Y2ggb24gZG93bmxvYWQgYW55d2F5LCBzbyB3ZSdsbCBub3RpY2Uu
CgpTbyB0aGF0J3Mgd2hhdCBJJ3ZlIGdvbmUgd2l0aC4gSXQgcmVxdWlyZXMgYSBmZXcgdHJpY2tz
IGFuZCB0d2Vha3MgaGVyZQphbmQgdGhlcmUsIGJ1dCB0aGlzIGlzIGFscmVhZHkgd29ya2luZyBz
aW5jZSBhIGZldyBob3VycyBhZ28sIGJ1dCBJIGdvdApkaXN0cmFjdGVkIGFuZCBkaWQgbm90IGhh
dmUgdGltZSB0byBmaW5pc2ggdGhlIHdvcmsgKGFuZCB0aGUgY29tbWl0CmxvZ3MpOyBtYXliZSBs
YXRlciB0b25pZ2h0LCBvciB0b21vcnJvdy4uLgoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCi0t
IAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0t
LS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBF
bWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2
NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19f
ICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06
ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4u
aXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGly
YWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0t
LS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
