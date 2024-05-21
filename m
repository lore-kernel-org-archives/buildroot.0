Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB645C25B74
	for <buildroot@archiver.kernel.org>; Tue, 21 May 2024 05:25:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43BD340201;
	Tue, 21 May 2024 05:25:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IQXF5UQBmsEB; Tue, 21 May 2024 05:25:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C40D840206
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C40D840206;
	Tue, 21 May 2024 05:25:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DA9771BF35A
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 05:25:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C496681916
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 05:25:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BLVtWj_FRIua for <buildroot@lists.busybox.net>;
 Tue, 21 May 2024 05:25:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C51E5818A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C51E5818A2
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C51E5818A2
 for <buildroot@buildroot.org>; Tue, 21 May 2024 05:25:22 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6C86313F8A7;
 Tue, 21 May 2024 07:25:11 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 21 May 2024 07:25:11 +0200
Date: Tue, 21 May 2024 07:25:11 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Message-ID: <ZkwwN1NKZ2o1xMba@landeda>
References: <20240421095353.208034-1-dario.binacchi@amarulasolutions.com>
 <20240421095353.208034-2-dario.binacchi@amarulasolutions.com>
 <20240510215442.3475120a@windsurf>
 <CAOf5uwkDmcxhWJUFhxjw_GJTiTEO5oEexb0Xjh6aNJx+K_9dXA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOf5uwkDmcxhWJUFhxjw_GJTiTEO5oEexb0Xjh6aNJx+K_9dXA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1716269119;
 bh=LXfAzzei24vu3jLXKh6uFsowrrwbUAqQjJ6PjlabD8Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R+4Auhs6zebIK41lNvJXW4XSY+wkDlBXD1L/Ks4AZzWSyruxpkh5rxsrS7W6ExmUI
 wyrwVueiCXLXgDLQDnFMLDuBnG3KrFQQYjnUoMIf5dTigqOaVdSDWlAlEHdLJkLSfl
 ENNhmaOBSqAvSK+RDDtAH67y7ZfkT1Mu5Yb86yRcWwc33YslIoPT6VZ4p9EZ907OM+
 TSKXxOkFEufuSnBTy+3qy4uj/D5sxAgXmiVwb6VMRzT7nYRnm1xAhLaoOROul0uisy
 CYiVaLo9//u4Yo6cVBoxRTVx3Fn8q1F4TJLKTBlwGHV3jshFFmMIolhsUSGENxi0X7
 8TuM1kXzjtDsg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=R+4Auhs6
Subject: Re: [Buildroot] [RFC PATCH 1/2] support/scripts/genimage.sh:
 support creating a bmap image
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
Cc: Xuanhao Shi <X15000177@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@smile.fr>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TWljaGFlbCwgQWxsLAoKT24gMjAyNC0wNS0xMCAyMjoxNyArMDIwMCwgTWljaGFlbCBOYXp6YXJl
bm8gVHJpbWFyY2hpIHNwYWtlIHRodXNseToKPiBPbiBGcmksIE1heSAxMCwgMjAyNCBhdCA5OjU0
4oCvUE0gVGhvbWFzIFBldGF6em9uaQo+IDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3
cm90ZToKPiA+IE9uIFN1biwgMjEgQXByIDIwMjQgMTE6NTM6NTIgKzAyMDAKPiA+IERhcmlvIEJp
bmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4gd3JvdGU6Cj4gPiA+
IFRoZSBwYXRjaCBhZGRzIGFuIG9wdGlvbiB0byBjcmVhdGUsIGluIGFkZGl0aW9uIHRvIHRoZSB1
c3VhbCBpbWFnZSwgYW4KPiA+ID4gaW1hZ2Ugb2YgdHlwZSBibWFwIHRoYXQgZHJhc3RpY2FsbHkg
cmVkdWNlcyB0aGUgYW1vdW50IG9mIGRhdGEgdGhhdAo+ID4gPiBuZWVkcyB0byBiZSB3cml0dGVu
IHRvIGFuIFNEIGNhcmQsIHJlc3VsdGluZyBpbiB0aW1lIHNhdmluZ3MuClstLVNOSVAtLV0KPiA+
IEFub3RoZXIgcXVlc3Rpb24sIHBlcmhhcHMgZm9yIERhcmlvLCBvciBvdGhlciBwZW9wbGUgZmFt
aWxpYXIgd2l0aAo+ID4gZ2VuaW1hZ2U6IGlmIHRoZSByb290ZnMuZXh0NCBnZW5lcmF0ZWQgYnkg
QnVpbGRyb290IGlzIHNwYXJzZSwgaXMKPiA+IGdlbmltYWdlIGFibGUgdG8gcHJlc2VydmUgdGhl
ICJob2xlcyIgd2hlbiBnZW5lcmF0aW5nIHRoZSBzZGNhcmQuaW1nCj4gPiB0aGF0IGluY2x1ZGVz
IHRoZSByb290ZnMuZXh0NCA/Cgo+IEFybm91dCwgWWFubiwgUGV0ZXIsIFJvbWFpbiwgd2hhdCBk
byB5b3UgdGhpbms/IERvIHlvdSBzZWUgb3RoZXIKPiBhcHByb2FjaGVzIHRvIGVhc2lseSBhbGxv
dyBnZW5lcmF0aW5nIGJtYXAtY29tcGF0aWJsZSBpbWFnZXM/CgpJIHdvbmRlciBpZiB3ZSBzaG91
bGQgcmVhbGx5IGRvIHRoYXQsIGluIGZhY3QuCgpJIGJlbGlldmUgaXQgaXMgaW4tc2NvcGUgdGhh
dCB3ZSBkbyBnZW5lcmF0ZSBkaXNrIGltYWdlcywgd2hpY2ggd2UgZG8Kd2l0aCBnZW5pbWFnZS4g
SG93ZXZlciwgdHJhbnNmZXJyaW5nLCBkaXN0cmlidXRpbmcsIHdyaXRpbmcsIGV0Yy4uIHRoZQpn
ZW5lcmF0ZWQgaW1hZ2VzIEkgdGhpbmsgaXMgb3V0IG9mIHNjb3BlLiBXZSBtYXkgcHJvdmlkZSB0
b29scyB0byBoZWxwCndpdGggdGhhdCwgdGhvdWdoLCBhbmQgd2UgZG8gYnkgcHJvdmlkaW5nIHto
b3N0LSx9Ym1hcC10b29scy4KCj4gSWYgeW91IGNvbnNpZGVyIHNwYXJzZSB0aGUgd2F5IHRoYXQg
ZmFzdGJvb3QgaGFuZGxlIGl0LCBzbyBJIGhhdmUKPiBxdWljayB0ZXN0ZWQgYW5kIHNlZW1zCj4g
Z2VuaW1hZ2UgY2FuIGNyZWF0ZSBzZGNhcmQuaW1nIGFuZCBzZGNhcmQtc3BhcnNlLmltZyB1c2lu
ZyBhIHNwZWNpZmljIGdlbmNvbmZpZwoKSSB0aGluayB0aGUgcXVlc3Rpb24gYnkgVGhvbWFzIHdh
cyB3aGV0aGVyLCBnaXZlbiBhbiBpbnB1dCBzcGFyc2UgZmlsZSwKZ2VuaW1hZ2Ugd2lsbCBrZWVw
IHRoZSBnZW5lcmF0ZWQgaW1hZ2Ugc3BhcnNlIGluIHRoZSBzYW1lIHBsYWNlcyB0aGUKaW5wdXQg
ZmlsZSB3YXMgKG9ubHkgc2hpZnRlZCBieSB0aGUgb2Zmc2V0IHRoYXQgaW5wdXQgZmlsZSB3YXMg
Y29waWVkCmF0IGluIHRoZSBpbWFnZSkuCgpGb3IgZXhhbXBsZSwgbWtmcy5leHQgY2FuIGNyZWF0
ZSBzcGFyc2UgZmlsZXMsIGFuZCBzdWNoIGEgZmlsZSBjYW4gYmUKZmVkIHRvIGdlbmltYWdlLCB0
byBjcmVhdGUgYSBkaXNrIGltYWdlLiBXZSB3YW50IHRoZSBnZW5lcmF0ZWQgZGlzawppbWFnZSB0
byBiZSBzcGFyc2VkIGluIHRoZSBzYW1lIHBvc2l0aW9ucyB0aGUgZXh0MiBpbWFnZSB3YXMsIGUu
Zy4gd2l0aAonWCcgYXMgbm8taG9sZSBibG9ja3MsICcuJyBhcyBob2xlcywgYW5kICdCJyBhcyB0
aGUgYm9vdGxvYWRlcjoKCiAgcm9vdGZzLmV4dDIgICAgICAgIFhYWFhYLi4uLi4uLi5YWFguLi5Y
WFhYLi4uLlhYWFhYLi4uLi4uLi5YLi4uLgogIGRpc2suaW1nICAgICAgIEJCQkJYWFhYWC4uLi4u
Li4uWFhYLi4uWFhYWC4uLi5YWFhYWC4uLi4uLi4uWC4uLi4KCk5vdGUgdGhhdCBzb21lIFggYmxv
Y2sgY2FuIGJlIGFsbC16ZXJvZXMsIGJlY2F1c2UgdGhleSBhcmUgdGhlIGJpdG1hcCBvZgp0aGUg
ZmlsZXN5c3RlbTsgdGhvc2UgbXVzdCBub3QgYmUgc2tpcHBlZCB3aGVuIHdyaXRpbmcgdG8gdGhl
IGZpbmFsCnN0b3JhZ2UsIG90aGVyd2lzZSB0aGUgZmlsZXN5c3RlbSB3b3VsZCBiZSBjb3JydXB0
ZWQuIElmIGdlbmltYWdlCmRlY2lkZXMgdGhhdCBhbGwtemVyb2VzIGJsb2NrIGFyZSBzcGFyc2Vk
LCB0aGVuIHRoaXMgaXMgYnJva2VuLgoKSSB0aGluayB0aGF0IHdhcyB0aGUgcXVlc3Rpb24gcmFp
c2VkIGJ5IFRob21hcywgYW5kIEkgZG9uJ3QgdW5kZXJzdGFuZApob3cgeW91ciByZXBseSBhbnN3
ZXJzIHRoYXQsIHNvIG1heWJlIEkgbWlzc2VkIHNvbWV0aGluZy4uLgoKUmVnYXJkcywKWWFubiBF
LiBNT1JJTi4KCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0t
LS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8
IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFj
eTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlH
TiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0t
LS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0
dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAg
IHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0t
LS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
