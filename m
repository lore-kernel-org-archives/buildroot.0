Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99EA5CD1288
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 20:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39BB841814;
	Wed,  3 Apr 2024 20:32:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SF56huVERHBy; Wed,  3 Apr 2024 20:32:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9732A4181F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9732A4181F;
	Wed,  3 Apr 2024 20:32:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D373B1BF408
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 20:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0E9782230
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 20:32:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JDOrqKd66y1P for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 20:32:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AA0B682110
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA0B682110
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA0B682110
 for <buildroot@busybox.net>; Wed,  3 Apr 2024 20:32:47 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A50B113F8A7;
 Wed,  3 Apr 2024 22:32:43 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 03 Apr 2024 22:32:43 +0200
Date: Wed, 3 Apr 2024 22:32:43 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <francois.perrad@gadz.org>
Message-ID: <Zg2868jF6GtlAMb8@landeda>
References: <20240403084203.512309-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403084203.512309-1-francois.perrad@gadz.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712176365;
 bh=vtvuZwNvWWoorWz7wQgCmfnEPuf4dwx8DF944YQZOGY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FhrsVZqEWcGy4D+lMz4b9ER7Eqw3pIseiFK3BZnMksmgvbMZiMkOcT8KqEv1zQbAw
 /F1TDZR0s3fAcOnT7GtSWRnD+ayr1llvVKHwmesSARHRkn10ZsI8qi2AXNuzKIkvKj
 FLE0TrdvHvigGLfcFPATEZvWfuvxAQNVRQwxDX3snd4wNiysvXVKICkkvX7+xEB8ct
 QfAPAvKNc5Jsj0cjDOfY6EEH1FJ+WLzx9eMowi3YYqswOS0wNRpB45gPNRFQGlgtHe
 xqworQ2iXsjXX9AxB6Vg1kKSc5di6zIOFd7vlS1sGuTmZBfEP73hKdkgak2ub0SiLF
 piuxp6fgj4jIg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FhrsVZqE
Subject: Re: [Buildroot] [PATCH] package/libressl: bump to version 3.8.4
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDI0LTA0LTAzIDEwOjQyICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClJlZ2FyZHMs
Cllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBwYWNrYWdlL2xpYnJlc3NsL2xpYnJlc3NsLmhhc2gg
fCAyICstCj4gIHBhY2thZ2UvbGlicmVzc2wvbGlicmVzc2wubWsgICB8IDIgKy0KPiAgMiBmaWxl
cyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL3BhY2thZ2UvbGlicmVzc2wvbGlicmVzc2wuaGFzaCBiL3BhY2thZ2UvbGlicmVzc2wvbGli
cmVzc2wuaGFzaAo+IGluZGV4IDQwYjQ5ZGJiOC4uNWQzYjU0ZWE5IDEwMDY0NAo+IC0tLSBhL3Bh
Y2thZ2UvbGlicmVzc2wvbGlicmVzc2wuaGFzaAo+ICsrKyBiL3BhY2thZ2UvbGlicmVzc2wvbGli
cmVzc2wuaGFzaAo+IEBAIC0xLDQgKzEsNCBAQAo+ICAjIEZyb20gaHR0cHM6Ly9mdHAub3BlbmJz
ZC5vcmcvcHViL09wZW5CU0QvTGlicmVTU0wvU0hBMjU2Cj4gLXNoYTI1NiAgNmQ0YjhkNWJiYjI1
YTFmODMzNjYzOWU1NmVjNTA4ODA1MmQ0M2E5NTI1NjY5N2E4NWM0Y2U5MTMyM2MyNTk1NCAgbGli
cmVzc2wtMy44LjIudGFyLmd6Cj4gK3NoYTI1NiAgYzBjZWY5Y2ZlMTc0YWMzNjZjZTQ4MmY1NDJm
ZGRiMDc3MjFlN2ZhMGNhZmFjZTM0YjQ5YTg3MjBmYTM3ZmU3ZCAgbGlicmVzc2wtMy44LjQudGFy
Lmd6Cj4gICMgTG9jYWxseSBjb21wdXRlZAo+ICBzaGEyNTYgIDVjNjM2MTNmMDA4ZjE2YTljMDAy
NWMwOTZiYmQ3MzZjZWNmNzIwNDk0ZDEyMWI1YzUyMDNlMGVjNmU1OTU1YjEgIENPUFlJTkcKPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS9saWJyZXNzbC9saWJyZXNzbC5tayBiL3BhY2thZ2UvbGlicmVz
c2wvbGlicmVzc2wubWsKPiBpbmRleCBiNzJmM2IzOGMuLjFkOTBhYTg1MyAxMDA2NDQKPiAtLS0g
YS9wYWNrYWdlL2xpYnJlc3NsL2xpYnJlc3NsLm1rCj4gKysrIGIvcGFja2FnZS9saWJyZXNzbC9s
aWJyZXNzbC5tawo+IEBAIC00LDcgKzQsNyBAQAo+ICAjCj4gICMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjCj4gIAo+IC1MSUJSRVNTTF9WRVJTSU9OID0gMy44LjIKPiArTElCUkVTU0xfVkVSU0lPTiA9
IDMuOC40Cj4gIExJQlJFU1NMX1NJVEUgPSBodHRwczovL2Z0cC5vcGVuYnNkLm9yZy9wdWIvT3Bl
bkJTRC9MaWJyZVNTTAo+ICBMSUJSRVNTTF9MSUNFTlNFID0gSVNDIChuZXcgYWRkaXRpb25zKSwg
T3BlblNTTCBvciBTU0xlYXkgKG9yaWdpbmFsIE9wZW5TU0wgY29kZSkKPiAgTElCUkVTU0xfTElD
RU5TRV9GSUxFUyA9IENPUFlJTkcKPiAtLSAKPiAyLjQwLjEKPiAKPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0t
LS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwg
IFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8
IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2ln
bmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAw
OTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRo
ZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBc
IEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0t
LS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
