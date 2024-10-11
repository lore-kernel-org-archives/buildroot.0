Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EDA7D2447F
	for <buildroot@archiver.kernel.org>; Fri, 11 Oct 2024 06:39:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E26C982049;
	Fri, 11 Oct 2024 06:39:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r_Ej0mSpn0km; Fri, 11 Oct 2024 06:39:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 614F282044
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 614F282044;
	Fri, 11 Oct 2024 06:39:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8DEE21BF385
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 06:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D4A082044
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 06:39:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b8FkiApuvbXU for <buildroot@lists.busybox.net>;
 Fri, 11 Oct 2024 06:39:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 78CF182042
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78CF182042
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 78CF182042
 for <buildroot@busybox.net>; Fri, 11 Oct 2024 06:39:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D77AA1C0005;
 Fri, 11 Oct 2024 06:39:08 +0000 (UTC)
Date: Fri, 11 Oct 2024 08:39:07 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Message-ID: <20241011083907.089ec1fa@windsurf>
In-Reply-To: <20241010163200.249090-1-francois.perrad@gadz.org>
References: <20241010163200.249090-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1728628749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=65OxtqUltRwJrAkde2QCfs/85AqH5XBiD+Mw1KS0SRk=;
 b=DcDGXt0/+ASkz+HvpkZrNjs65NeRHI+AcssyP3Dl9CCQwkmBKMOfBLBX3CpkB9dwcU6PJP
 r7mQm55JAkYZmobiP3g1JTxZdGcLgOaZMoVQ6zAwB26xtz9ZC3LE3MEs0rpD7exXUaLixP
 yBBLFdlc5/HbLBDQSVDlLwKKce3GAmsh+8iW9UrrRcjy5n43hGmRDGuYAYZozUsT8hxvAJ
 55BfVy3GOjDna51uYvQmLdLTiLoaocNvCbCMf9AkvfCFnkgK4UKsyBPlTaJiHOXu5Xtaiy
 mojc3U8F0v3fmXAnypLKex11d77SLdgXd85JjFwkNSLhF+KDosCcbs6dKnT8EQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DcDGXt0/
Subject: Re: [Buildroot] [PATCH] configs/olimex_a20_olinuxino_lime*: bump
 Linux and U-Boot
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCAxMCBPY3QgMjAyNCAxODozMTo1OSArMDIwMApGcmFuY29pcyBQZXJyYWQgPGZyYW5j
b2lzLnBlcnJhZEBnYWR6Lm9yZz4gd3JvdGU6Cgo+IG5vdywgVS1Cb290IG5lZWRzIGdudXRscyAo
bWtlZmljYXBzdWxlKQo+IAo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPgo+IC0tLQo+ICBib2FyZC9vbGltZXgvYTIwX29saW51eGluby9w
YXRjaGVzL2xpbnV4L2xpbnV4Lmhhc2ggfCAyICstCj4gIGJvYXJkL29saW1leC9hMjBfb2xpbnV4
aW5vL3BhdGNoZXMvdWJvb3QvdWJvb3QuaGFzaCB8IDIgKy0KPiAgY29uZmlncy9vbGltZXhfYTIw
X29saW51eGlub19saW1lMl9kZWZjb25maWcgICAgICAgIHwgNSArKystLQo+ICBjb25maWdzL29s
aW1leF9hMjBfb2xpbnV4aW5vX2xpbWVfZGVmY29uZmlnICAgICAgICAgfCA1ICsrKy0tCj4gIDQg
ZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKVGhhbmtzIEZy
YW7Dp29pcyBmb3IgdGhlIHBhdGNoLiBIb3dldmVyIGl0IGRvZXNuJ3QgYXBwbHkgb24gdGhlIGxh
dGVzdAptYXN0ZXIsIGFzIHRoZSBkZWZjb25maWdzIGhhdmUgYmVlbiBtb2RpZmllZCBpbiBtYXN0
ZXIuIENvdWxkIHlvdQpyZWJhc2Ugb24gdGhlIGxhdGVzdCBtYXN0ZXIgYW5kIHJlc2VuZD8KClRo
YW5rcyBhIGxvdCEKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgQ1RPLCBCb290bGluCkVt
YmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
