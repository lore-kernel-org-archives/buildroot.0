Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDF9C30653
	for <buildroot@archiver.kernel.org>; Tue, 25 Jun 2024 20:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D873400FF;
	Tue, 25 Jun 2024 20:59:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q5WeIU8rE7eM; Tue, 25 Jun 2024 20:59:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECBB340103
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ECBB340103;
	Tue, 25 Jun 2024 20:59:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 884A61BF20F
 for <buildroot@lists.busybox.net>; Tue, 25 Jun 2024 20:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 73F9E80BB2
 for <buildroot@lists.busybox.net>; Tue, 25 Jun 2024 20:59:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A7qM9nwC9pk3 for <buildroot@lists.busybox.net>;
 Tue, 25 Jun 2024 20:59:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 22D7F80BA8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22D7F80BA8
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 22D7F80BA8
 for <buildroot@buildroot.org>; Tue, 25 Jun 2024 20:58:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B17AF13F846;
 Tue, 25 Jun 2024 22:58:41 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 25 Jun 2024 22:58:41 +0200
Date: Tue, 25 Jun 2024 22:58:41 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <ZnsvgdItWs8iXni4@landeda>
References: <20240522070238.3282121-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240522070238.3282121-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1719349136;
 bh=WZkc9kKE4fXY73slobUhny9ogbPUekbxR0sJxELDCCc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dGXmCZ6ZPSg/br3GwyYu9yAjB2G4EQKmMu8dQtdRHimVtthIqf5WVeXw8Tf0XLJdd
 r9n8i/jixK4p1tE9LXxmrkYJTaV7PBlHw+9VMclqby7iG/rY8PF8QhBlgL7F6E/mUN
 eQiN3ex0UpA4crYrxIfG4OuybuEB1Q1nrdR3oq8tfyeSqmuNJQd3dMnX8JQg9PQgvu
 7nM12ZVlKYSp5fShob9LF4A0ZJw+Rm3TZvz0UKIZ0fMgvJSL9cK/ng2MtftY0AutW1
 rQjgy5Op2PYgzZ/IZDaeFRfMCgHDCjtfmHb125yyhVURoIrwEJby16RSzJuBoUeZNV
 4rTmuuFsh545A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=dGXmCZ6Z
Subject: Re: [Buildroot] [PATCH v2 00/18] apply patches with fuzz factor 0
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Bernd Kuhls <bernd@kuhls.net>, Jagan Teki <jagan@amarulasolutions.com>,
 =?utf-8?B?TWljaGHFgiDFgXlzemN6ZWs=?= <michal.lyszczek@bofc.pl>,
 buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RGFyaW8sIEFsbCwKCk9uIDIwMjQtMDUtMjIgMDk6MDIgKzAyMDAsIERhcmlvIEJpbmFjY2hpIHNw
YWtlIHRodXNseToKPiBUaGUgc2VyaWVzIHdpbGwgYWxsb3cgYXBwbHlpbmcgcGFja2FnZSBwYXRj
aGVzIHdpdGggYSBmdXp6IGZhY3RvciBvZiAwCj4gaW5zdGVhZCBvZiAyICh0aGUgcGF0Y2ggY29t
bWFuZCBkZWZhdWx0IHZhbHVlKS4KPiBCeSBzZXR0aW5nIHRoZSBtYXhpbXVtIGZ1enogZmFjdG9y
IHRvIDAsIHdlIGF2b2lkIHRoYXQgcGF0Y2hlcyB3aGljaAo+IGNhbm5vdCBiZSBhcHBsaWVkIGFy
ZSBpbmNvcnJlY3RseSByZXBvcnRlZCBhcyB2YWxpZCwgd2l0aCBwb3NpdGl2ZQo+IHNpZGUtZWZm
ZWN0cyBvbiB2ZXJzaW9uIGJ1bXBzLgo+IAo+IFRvIGF2b2lkIHJlZ3Jlc3Npb25zLCBpdCB3YXMg
bmVjZXNzYXJ5IHRvIGZpeCBhbGwgdGhvc2UgcGF0Y2hlcyB0aGF0Cj4gd2VyZSBhcHBsaWNhYmxl
IHdpdGggYSBmdXp6IGZhY3RvciBvZiAxIG9yIDIgYmVmb3JlIGltcGxlbWVudGluZyB0aGlzCj4g
Y2hhbmdlLiBUaGUgc2VyaWVzIHdhcyB0ZXN0ZWQgb24gY29tbWl0IDQ3MDc4Y2MxMTg2MiAoInBh
Y2thZ2UvenhpbmctY3BwOgo+IGFkZCBvcHRpb25zIGZvciBlbmFibGluZyByZWFkZXJzIGFuZC9v
ciB3cml0ZXJzIikgd2l0aCBhIHNjcmlwdCB0aGF0Cj4gZXhlY3V0ZWQgdGhlIG1ha2UgbGVnYWwt
aW5mbyBjb21tYW5kIGZvciBhbGwgZGVmY29uZmlncyBjb250YWluZWQgaW4KPiBCdWlsZHJvb3Qu
IFRoZW4sIGZvciBhbGwgdGhlIGFmZmVjdGVkIHBhY2thZ2VzLCB0aGUgY29tcGlsYXRpb24gd2Fz
Cj4gZXhlY3V0ZWQuCgpUaGFua3MgYSBsb3QgZm9yIGFsbCB0aG9zZSBlZmZvcnRzISDwn5GNCgpB
cyBBcm5vdXQgc2FpZCwgaXQgaXMgbm90IHVuZXhwZWN0ZWQgdGhhdCB3ZSBtaXNzZWQgc29tZSwg
YW5kIHRoYXQgbmV3CnBhdGNoZXMgYWRkZWQgc2luY2UgdGhlbiB3b3VsZCBub3QgYmUgZnV6ei16
ZXJvLXJlYWR5LgoKU28sIEkgY2FtZSB1cCB3aXRoIGEgbGl0dGxlIGJpdCBvZiBzaGVsbCB0cmlj
a2VkcnkgdG8gc3RhcnQgYW5kIHRlc3QgYWxsCm91ciBwYXRjaGVzIChvciBhdCBsZWFzdCB0aGUg
dmFzdCBtYWpvcml0eSBvZiB0aGVtKToKCiAgICAkIGNhdCBmb28ubHN0CgogICAgIyBJZ25vcmUg
Ym9vdC8gYW5kIGxpbnV4LyBhcyB0aGV5IGFyZSB0b28gc3BlY2lhbC4uLgogICAgZmluZCBwYWNr
YWdlLyAtdHlwZSBmIC1uYW1lICcqLm1rJyAtcHJpbnRmICclaFxuJyBcCiAgICB8c29ydCAtdSBc
CiAgICB8d2hpbGUgcmVhZCBkaXI7IGRvCiAgICAgICAgWyAtZSAiJHtkaXJ9L0NvbmZpZy5pbiIg
XSB8fCBjb250aW51ZQogICAgICAgICggZmluZCAiJHtkaXJ9IiAtdHlwZSBmIC1uYW1lICcqLnBh
dGNoJyAtcHJpbnQgLXF1aXQgfGdyZXAgLXEgLiApIHx8IGNvbnRpbnVlCiAgICAgICAgcGtnPSIk
KCBiYXNlbmFtZSAiJHtkaXJ9IiApIgogICAgICAgIFsgLWUgIiR7ZGlyfS8ke3BrZ30ubWsiIF0g
fHwgY29udGludWUKICAgICAgICBzZWQgLXIgLWUgJy9eXCRcKGV2YWwgXCRcKChob3N0LSk/W14t
XSstcGFja2FnZVwpXCkkLyFkOyBzLy9cMSciJHtwa2d9IictcGF0Y2gvJyAiJHtkaXJ9LyR7cGtn
fS5tayIKICAgIGRvbmUgXAogICAgfGdyZXAgLXYgLUUgJ2FtMzM1eC1wcnUtcGFja2FnZXxhc3Rl
cmlza3xhdWZzLXV0aWx8YXVtaXh8Y2dpYycKCgogICAgJCBtYWtlIGRlZmNvbmZpZwoKICAgICQg
Li91dGlscy9jb25maWcgLS1zZXQtc3RyIEJSMl9CQUNLVVBfU0lURSAiIgoKICAgICQgbWFrZSAk
KC4gLi9mb28ubHN0KQoKSSBzdG9wcGVkIGFkZGluZyBleGNlcHRpb25zIHdoZW4gSSByZWFjaGVk
IGNnaWMuLi4KCkV4Y2VwdGlvbnM6CiAgLSBQYXRjaCBmdXp6OgogICAgICAtIGFzdGVyaXNrCgog
IC0gT3RoZXJzOgogICAgICAtIGFtMzM1eC1wcnUtcGFja2FnZTogaGFzaCBlcnJvciwgZ2l0aHVi
LWdlbmVyYXRlZAogICAgICAtIGF1ZnMtdXRpbDogbmVlZHMgYSBrZXJuZWwsIHBhdGNoZXMgdW5r
bndvbgogICAgICAtIGF1bWl4OiA0MDMgZm9yYmlkZGVuLCBwYXRjaGVzIE9LLCB0ZXN0ZWQgd2l0
aCBzLmIuby4KICAgICAgLSBic2RpZmY6IDQwMyBmb3JiaWRkZW4sIHBhdGNoZXMgT0ssIHRlc3Rl
ZCB3aXRoIHMuYi5vLgogICAgICAtIGNnaWM6IGhhc2ggZXJyb3IsIHVwc3RyZWFtIGlzIGRlYWQg
KHBhcmtpbmcgc2l0ZSkKClNvLCBJIGZvdW5kIG1vcmUgZG93bmxvYWQgaXNzdWVzIHRoYW4gSSBm
b3VuZCBwYXRjaCBmdXp6IGlzc3Vlcy4uLiBJJ20Kbm90IHN1cmUgaWYgdGhhdCdzIGEgZ29vZCBv
ciBhIGJhZCB0aGluZz8gOy1dCgpUaGVuIGxpbnV4LyBhbmQgYm9vdC8gd2lsbCBoYXZlIHRvIGJl
IGNoZWNrZWQgIm1hbnVhbGx5Ii4uLgoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCi0tIAouLS0t
LS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0t
LS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRl
ZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2
IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAg
ICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBB
R0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1n
ZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAg
fAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0t
LS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
