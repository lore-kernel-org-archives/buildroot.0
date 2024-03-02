Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F49C5478C
	for <buildroot@archiver.kernel.org>; Sat,  2 Mar 2024 20:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1598406A6;
	Sat,  2 Mar 2024 20:04:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dlTERv5v6goF; Sat,  2 Mar 2024 20:04:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD18C406A9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD18C406A9;
	Sat,  2 Mar 2024 20:04:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 86D4C1BF834
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 20:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7493F83386
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 20:04:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CfXyYeUA8fwJ for <buildroot@lists.busybox.net>;
 Sat,  2 Mar 2024 20:04:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4301283330
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4301283330
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4301283330
 for <buildroot@buildroot.org>; Sat,  2 Mar 2024 20:04:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id CDC4613F879;
 Sat,  2 Mar 2024 21:04:23 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 02 Mar 2024 21:04:23 +0100
Date: Sat, 2 Mar 2024 21:04:23 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZeOGR-mLVryLRXI0@landeda>
References: <20240302100259.251307-1-fontaine.fabrice@gmail.com>
 <ZeNFzUSTpCvstKLW@landeda>
 <CAPi7W80doZ_BQeALCe4nh+orvGcAGMgzr3OtzJ+-kB_ZgOPU1g@mail.gmail.com>
 <ZeNvUxJde1-CBurL@landeda>
 <CAPi7W83MYxj1qgLjDzNYSiN5R3ESKz7-o9-O=UrDLMP+ebTZ6A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPi7W83MYxj1qgLjDzNYSiN5R3ESKz7-o9-O=UrDLMP+ebTZ6A@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1709409867;
 bh=tgFOBzGo1JpYqBmRtgWwybfI4XiggmX+DaZWV4oigyA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BKTxohi4Z5e1sd0teC093vXpqXVY1PFENlvXCbWCqLj3h3DTflpXLQ7NXMujxT3Ce
 Dk8DvP9sklTdVWjWjn6Tpn9iEb5RbAUNY227dCEKai0+2XKSNy6AM+vocf1FdYJ3hs
 imfVpl9TjTB3iE6o52AewtQyZ1JEUqCtgBvz4h9eWaKqkKXeUlOiFgP8bqiLuICR8U
 9eBw507Kv8KUDh1HqnFyvLskEYPPIxT0GSer6jvpptqlGP1rEjiefJjjcDjYWyDiWN
 MuwrCUIB7obV4lELprRT80Syt31aiNHnhqzHrvjb55Xf+w/TE/AemAl91nET/mjsm/
 5+m3DzyEbqWPw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BKTxohi4
Subject: Re: [Buildroot] [PATCH 1/1] package/powertop: fix gettext build
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
Cc: Steven Noonan <steven@uplinklabs.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RmFicmljZSwgQWxsLAoKT24gMjAyNC0wMy0wMiAyMDoxMiArMDEwMCwgRmFicmljZSBGb250YWlu
ZSBzcGFrZSB0aHVzbHk6Cj4gTGUgc2FtLiAyIG1hcnMgMjAyNCDDoCAxOToyNiwgWWFubiBFLiBN
T1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IGEgw6ljcml0IDoKPiA+ID4gaHR0cHM6Ly9n
aXRodWIuY29tL2ZlbnJ1czc1L3Bvd2VydG9wL2NvbW1pdC9kNWM2YWViNzBkNzExNzIyZWIzZjRk
ZmE4OGI3MjBjMWIyMGVlYzRhCj4gPiA+IFRoZSByYXRpb25hbGUgd2FzOgo+ID4gPiAiVGhpcyBw
YXRjaCBpcyBrbm93biB0byBjYXVzZSBpc3N1ZXMgb24gcGxhdGZvcm1zIHRoYXQgYXJlIHVwZGF0
ZWQgdG8KPiA+ID4gZ2V0dGV4dCAwLjIwLjIgb3IgaGlnaGVyIGFuZCB3b3VsZG50IGJlIGFibGUg
dG8gbW92ZSBmb3J3YXJkIHdpdGgKPiA+ID4gYnVpbGRpbmcgUG93ZXJUb3Agc3VjZXNzZnVsbHku
IEhlbmNlIHJldmVydCB0aGlzIHBhdGNoLiIKPiA+Cj4gPiBCdXQgdGhhdCBtZWFucyB0aGF0IHdl
IHdpbGwgaGF2ZSB0byBjYXJyIHl0aGF0IHBhdGNoIGZvcmV2ZXIsIGFuZCByZWJhc2UKPiA+IGl0
IGV2ZXJ5IHRpbWUgd2UgdXBkYXRlIGlmIGNvbmZpZ3VyZS5hYyBvciBwby9NYWtlZmlsZS5pbi5p
biBjaGFuZ2UuLi4KPiAKPiBJbmRlZWQsIEkgY2FuIG9wZW4gYW4gaXNzdWUgdG8gdXBzdHJlYW0g
YnV0IHRoZXkgYXJlIG5vdCB2ZXJ5Cj4gcmVzcG9uc2l2ZSBhcyBjYW4gYmUgc2VlbiBpbiB0aGUg
bGFjayBvZiBwcm9ncmVzcyBvbiBteSBQUiBmb3IgdGhlCj4gZmlyc3QgcGF0Y2ggLi4uCgpbLS1T
TklQLS1dCj4gPiBEaWQgeW91IHRyeSB0byBzZXQgUE9XRVJUT1BfQVVUT1BPSU5UID0gWUVTID8K
PiBZZXMgYW5kIGl0IGRvZXNuJ3Qgd29yay4KCldlaXJkLi4uIGF1dG9wb2ludCBpcyB0aGVyZSBl
eHBsaWNpdGx5IGZvciB0aGlzIGtpbmQgb2YgaXNzdWVzIChhZmFpaykuClNvIEkgdHJpZWQgaGVy
ZSwgYW5kIGl0IGRpZCBmaXggdGhlIGJ1aWxkIGZvciB0aGUgYXV0b2J1aWxkZXIgZmFpbHVyZQp5
b3UgcmVwb3J0ZWQsIGF0IGxlYXN0OgoKICAgIGRpZmYgLS1naXQgYS9wYWNrYWdlL3Bvd2VydG9w
L3Bvd2VydG9wLm1rIGIvcGFja2FnZS9wb3dlcnRvcC9wb3dlcnRvcC5tawogICAgaW5kZXggMDQ4
MWNhZWUwNy4uNTA2ZGJhMDM4ZCAxMDA2NDQKICAgIC0tLSBhL3BhY2thZ2UvcG93ZXJ0b3AvcG93
ZXJ0b3AubWsKICAgICsrKyBiL3BhY2thZ2UvcG93ZXJ0b3AvcG93ZXJ0b3AubWsKICAgIEBAIC0x
Nyw2ICsxNyw3IEBAIFBPV0VSVE9QX0RFUEVOREVOQ0lFUyA9IFwKICAgICAJJChpZiAkKEJSMl9Q
QUNLQUdFX1BDSVVUSUxTKSxwY2l1dGlscykgXAogICAgIAkkKFRBUkdFVF9OTFNfREVQRU5ERU5D
SUVTKQogICAgCiAgICArUE9XRVJUT1BfQVVUT1BPSU5UID0gWUVTCiAgICAgUE9XRVJUT1BfQ09O
Rl9FTlYgPSBMSUJTPSQoVEFSR0VUX05MU19MSUJTKQogICAgICMgMDAwMS1hZGQtZGlzYWJsZS1z
dGFjay1wcm90ZWN0b3Itb3B0aW9uLnBhdGNoCiAgICAgUE9XRVJUT1BfQVVUT1JFQ09ORiA9IFlF
UwoKICAgICQgbWFrZSBkaXN0Y2xlYW4KICAgICQgd2dldCAtTyAuY29uZmlnICdodHRwOi8vYXV0
b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy9iYjgwYTc4NDJkMTg2NTFlNTA2OWYzYTkxZjA2
YTljMjMyMThkMjYwL2RlZmNvbmZpZycKICAgICQgbWFrZSBvbGRkZWZjb25maWcKICAgICQgbWFr
ZSBwb3dlcnRvcC1idWlsZAoKKEkgdHJpZWQgYm90aCB3aXRoIGFuZCB3aXRob3V0IFBQRCwgYm90
aCBzdWNjZWVkZWQgd2l0aCB0aGUgcGF0Y2gKYWJvdmUuKQoKV2hhdCB3YXMgYnJva2VuIG9uIHlv
dXIgc2lkZT8KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgotLSAKLi0tLS0tLS0tLS0tLS0tLS0t
Li0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0t
LS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkg
UklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2Fy
ZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCAr
MzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwg
IFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8q
XF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0t
LS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
