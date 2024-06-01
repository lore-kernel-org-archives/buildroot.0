Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825C3C27C44
	for <buildroot@archiver.kernel.org>; Sat,  1 Jun 2024 19:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D8EC8424E;
	Sat,  1 Jun 2024 19:49:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T76ZxPsCqNRS; Sat,  1 Jun 2024 19:49:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D0B484260
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D0B484260;
	Sat,  1 Jun 2024 19:49:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8B8091BF2C2
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 19:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 785658424E
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 19:49:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KYVm9NtTU13r for <buildroot@lists.busybox.net>;
 Sat,  1 Jun 2024 19:49:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2101284248
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2101284248
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2101284248
 for <buildroot@busybox.net>; Sat,  1 Jun 2024 19:49:14 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 499B313F899;
 Sat,  1 Jun 2024 21:49:10 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Jun 2024 21:49:10 +0200
Date: Sat, 1 Jun 2024 21:49:10 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <francois.perrad@gadz.org>
Message-ID: <Zlt7Ng9Fiw1ijU1G@landeda>
References: <20240601125930.29745-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240601125930.29745-1-francois.perrad@gadz.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717271352;
 bh=WrNhINDSp5APjAMeJow2ngXG3iVfrlI6tR8c1+QCdns=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S5wiDAdKl7WWVnWAq5dn34BLLb7ORDTWFqOvGsUIoQyt3EuxkcOHQMOKHvMHlqtEP
 H6iMvVLEFs5PNLUBW50/WVvUOn9s8h4W+IHTXUnnep1LQixhtDnR6jnON/SZHJvaa/
 r66A2pFhDsP0WN8EaRCcouxgY73jZXkQA6iAzRAxYBpHsq7M8nsW+pmR5sDO0Z7jNO
 mG4VFLm+Ci+Zaf/Rdi4XSGJaOff4a/kE6ITe3RfTl952BFWAFWPblLxA9KKZIQlhvl
 nfezMKI1UlXsgUHrjQBVgQ5hectZ4AWTe4h1QvPMU43uI6WoNiE73A8sX14e+zArgo
 rkJKAw8vQldCQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=S5wiDAdK
Subject: Re: [Buildroot] [PATCH] package/nano: bump to version 8.0
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

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDI0LTA2LTAxIDE0OjU5ICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPgoKQXBwbGllZCB0byBuZXh0LCB0aGFua3MuCgpSZWdhcmRzLApZ
YW5uIEUuIE1PUklOLgoKPiAtLS0KPiAgcGFja2FnZS9uYW5vL25hbm8uaGFzaCB8IDQgKystLQo+
ICBwYWNrYWdlL25hbm8vbmFuby5tayAgIHwgNCArKy0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL25h
bm8vbmFuby5oYXNoIGIvcGFja2FnZS9uYW5vL25hbm8uaGFzaAo+IGluZGV4IDNjYTM3YzYzMy4u
ZmM5YTA5NDdhIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbmFuby9uYW5vLmhhc2gKPiArKysgYi9w
YWNrYWdlL25hbm8vbmFuby5oYXNoCj4gQEAgLTEsNSArMSw1IEBACj4gICMgTG9jYWxseSBjYWxj
dWxhdGVkIGFmdGVyIGNoZWNraW5nIHBncCBzaWduYXR1cmUKPiAtIyBodHRwczovL3d3dy5uYW5v
LWVkaXRvci5vcmcvZGlzdC92Ny9uYW5vLTcuMi50YXIueHouYXNjCj4gKyMgaHR0cHM6Ly93d3cu
bmFuby1lZGl0b3Iub3JnL2Rpc3QvdjgvbmFuby04LjAudGFyLnh6LmFzYwo+ICAjIHVzaW5nIGtl
eSAxNjhFNkY0Mjk3QkZEN0E3OUFGRDQ0OTY1MTRCQkUyRUI4RTE5NjFGCj4gLXNoYTI1NiAgODZm
MzQ0Mjc2OGJkMjg3M2NlYzY5M2Y4M2NkZjgwYjRiNDQ0YWQzY2MxNDc2MGI3NDM2MTQ3NGZjODdh
NDUyNiAgbmFuby03LjIudGFyLnh6Cj4gK3NoYTI1NiAgYzE3ZjQzZmMwZTM3MzM2YjMzZWU1MGEy
MDljNzAxZDViZWI4MDhhZGMyZDlmMDg5Y2E4MzFiNDA1MzljOWFjNCAgbmFuby04LjAudGFyLnh6
Cj4gIHNoYTI1NiAgZmM4MmNhOGI2ZmRiMThkNGUzZTg1Y2ZkOGFiNThkMWJjZDNmMWIyOWFiZTc4
Mjg5NWFiZDkxZDY0NzYzZjhlNyAgQ09QWUlORwo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL25hbm8v
bmFuby5tayBiL3BhY2thZ2UvbmFuby9uYW5vLm1rCj4gaW5kZXggOGI5MzUyN2JlLi43MmY0ZGU2
YTAgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9uYW5vL25hbm8ubWsKPiArKysgYi9wYWNrYWdlL25h
bm8vbmFuby5tawo+IEBAIC00LDggKzQsOCBAQAo+ICAjCj4gICMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjCj4gIAo+IC1OQU5PX1ZFUlNJT05fTUFKT1IgPSA3Cj4gLU5BTk9fVkVSU0lPTiA9ICQoTkFO
T19WRVJTSU9OX01BSk9SKS4yCj4gK05BTk9fVkVSU0lPTl9NQUpPUiA9IDgKPiArTkFOT19WRVJT
SU9OID0gJChOQU5PX1ZFUlNJT05fTUFKT1IpLjAKPiAgTkFOT19TSVRFID0gaHR0cHM6Ly93d3cu
bmFuby1lZGl0b3Iub3JnL2Rpc3QvdiQoTkFOT19WRVJTSU9OX01BSk9SKQo+ICBOQU5PX1NPVVJD
RSA9IG5hbm8tJChOQU5PX1ZFUlNJT04pLnRhci54ego+ICBOQU5PX0xJQ0VOU0UgPSBHUEwtMy4w
Kwo+IC0tIAo+IDIuNDAuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0t
LS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBS
ZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6
IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04g
ICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0t
LS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRw
Oi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2
ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0t
Xi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
