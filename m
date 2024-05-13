Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A4E8C25B10
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 21:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5734A408B5;
	Mon, 13 May 2024 21:27:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 70Rvd1a8Lb7K; Mon, 13 May 2024 21:27:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 111B4408FF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 111B4408FF;
	Mon, 13 May 2024 21:27:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D6A3D1BF2A4
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 21:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D07B9822FE
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 21:27:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xUrhHC9cfg2m for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 21:27:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B053B822FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B053B822FC
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B053B822FC
 for <buildroot@buildroot.org>; Mon, 13 May 2024 21:27:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0BB32FF802;
 Mon, 13 May 2024 21:27:19 +0000 (UTC)
Date: Mon, 13 May 2024 23:27:19 +0200
To: =?UTF-8?B?R2HDq2w=?= PORTAY <gael.portay@rtone.fr>
Message-ID: <20240513232719.09befc04@windsurf>
In-Reply-To: <20240218011118.1077002-1-gael.portay@rtone.fr>
References: <20240218011118.1077002-1-gael.portay@rtone.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715635640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5M9raBSsJQ59s6FWntLT/nOZxjVjEytAgYi+21aOTdc=;
 b=Fn62luuC614f78sY/ERzR51wxqXC9UdDiaD6lwQmCIjgyEeHXRC2bx7swZbYlPgck72M5Y
 bDLjhAY0yEWVSQ4bZtLVYl3T686DNmZ9W3zg1WVD7eNlUv3FJeUFSnRucr6cdc6LFpl9rj
 EA4B9QQmsL/2eK6FR33qconFfXJ4oXKYC5r0IxGNuxuCqb3AFNWQ4OeK7Bn0xxK0C9xTvA
 PvmYpGcGJEEyQDDFkFp7a+DpAjWten7uAXCjKsRXsIjEBiWdiexR7EEgRqwf3q/mxnqlWQ
 7qJvXXJraJACtiMLzSaMeWMtDX/p1AjFsmrNe1ZDckf6L3TQIPXdXGWqLeO3AA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Fn62luuC
Subject: Re: [Buildroot] [PATCH 1/1] package/musl: enable on s390x
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCAxOCBGZWIgMjAyNCAwMjoxMToxNyArMDEwMApHYcOrbCBQT1JUQVkgPGdhZWwucG9y
dGF5QHJ0b25lLmZyPiB3cm90ZToKCj4gQWRkIHMzOTB4IG11c2wgc3VwcG9ydGVkIGFyY2hzLiBV
cHN0cmVhbSBtdXNsIGFscmVhZHkgc3VwcG9ydHMgczM5MHhbMV0uCj4gCj4gVGVzdGVkIHdpdGgg
cWVtdV9zMzkwc19kZWZjb25maWc6Cj4gCj4gCSQgb3V0cHV0L2hvc3QvYmluL3FlbXUtc3lzdGVt
LXMzOTB4IC1NIHMzOTAtY2N3LXZpcnRpbyAtY3B1IG1heCx6cGNpPW9uIC1tIDRHIC1zbXAgMiAt
a2VybmVsIG91dHB1dC9iekltYWdlIC1kcml2ZSBmaWxlPW91dHB1dC9pbWFnZXMvcm9vdGZzLmV4
dDIsaWY9dmlydGlvLGZvcm1hdD1yYXcgLWFwcGVuZCAicm9vdHdhaXQgcm9vdD0vZGV2L3ZkYSBu
ZXQuaWZuYW1lcz0wIGJpb3NkZXZuYW1lPTAiIC1kaXNwbGF5IG5vbmUgLXNlcmlhbCBtb246c3Rk
aW8gLW5ldCBuaWMsbW9kZWw9dmlydGlvIC1uZXQgdXNlcgo+IAkoLi4uKQo+IAlXZWxjb21lIHRv
IEJ1aWxkcm9vdAo+IAlidWlsZHJvb3QgbG9naW46IHJvb3QKPiAJIyB1bmFtZSAtYQo+IAlMaW51
eCBidWlsZHJvb3QgNi4xLjQ0ICMyIFNNUCBTdW4gRmViIDE4IDAxOjMzOjQyIENFVCAyMDI0IHMz
OTB4IEdOVS9MaW51eAo+IAkjIC9saWIvbGQtbXVzbC1zMzkweC5zby4xCj4gCW11c2wgbGliYyAo
czM5MHgpCj4gCVZlcnNpb24gMS4yLjQKPiAJRHluYW1pYyBQcm9ncmFtIExvYWRlcgo+IAlVc2Fn
ZTogL2xpYi9sZC1tdXNsLXMzOTB4LnNvLjEgW29wdGlvbnNdIFstLV0gcGF0aG5hbWUgW2FyZ3Nd
Cj4gCj4gWzFdOiBodHRwczovL2dpdC5tdXNsLWxpYmMub3JnL2NnaXQvbXVzbC9jb21taXQvP2lk
PTE1MDk0OTQzMDUwZWI5YTU2NGY0MDkzMjMwNzBlNTBiNDBmNzg4MTYKPiAKPiBTaWduZWQtb2Zm
LWJ5OiBHYcOrbCBQT1JUQVkgPGdhZWwucG9ydGF5QHJ0b25lLmZyPgo+IC0tLQo+ICBwYWNrYWdl
L211c2wvQ29uZmlnLmluIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoK
QXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwg
Q1RPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6
Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
