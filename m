Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E97E7717F
	for <buildroot@archiver.kernel.org>; Mon, 16 Dec 2024 20:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E00240928;
	Mon, 16 Dec 2024 20:36:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WVQ-koe2e5gA; Mon, 16 Dec 2024 20:36:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A03EF4069F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A03EF4069F;
	Mon, 16 Dec 2024 20:36:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DB608C5
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 20:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B364360B42
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 20:36:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GmjkW9_JCZIo for <buildroot@buildroot.org>;
 Mon, 16 Dec 2024 20:36:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 635C460EC9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 635C460EC9
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 635C460EC9
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 20:36:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3F939FF803;
 Mon, 16 Dec 2024 20:36:06 +0000 (UTC)
Date: Mon, 16 Dec 2024 21:36:05 +0100
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: buildroot@buildroot.org, =?UTF-8?B?TWlxdcOobA==?= Raynal
 <miquel.raynal@bootlin.com>
Message-ID: <20241216213605.17b86ffb@windsurf>
In-Reply-To: <20241216-fix_gcc14_libsha1-v2-1-ceb3588e6866@bootlin.com>
References: <20241216-fix_gcc14_libsha1-v2-1-ceb3588e6866@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1734381366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kypTcodseKF9xJ7tZyRLgaWQE+ToceEs5p3EHX52Q4c=;
 b=QM7YTzXWn0IagHXa9/6xPhDtCVMmeQw78tfUkgpVvZDO82x7b3vHZ+AAJzg4GL8tJSVsj1
 Xi14s4wXHD2lfNYmR8WRTvQbXzT98QYhVqAaVU1LiOD+IT2ALzRUcrPyRVV73wyowcnZBR
 QPC7t+pR7iQojjdDe1TN2iKDtjs22WaNoVZUUjGanPZLq6Sv0IKaH9GRrUSndi0pxBNoc9
 9eFOX+VGXUPKmo8WrVYagA5UKCmZ7tjR8a39zHqzx+2o4zR4EKQ6m2gSZqUhlHkEtyr49f
 ScQA3Yfvj6sKiNatTlIaRkkQj9ke2QNFBF2JHnLbcU8XTyaAaITMxqle6eLntA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QM7YTzXW
Subject: Re: [Buildroot] [PATCH v2] package/libsha1: Fix gcc14 compilation
 in libsha1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKT24gTW9uLCAxNiBEZWMgMjAyNCAxODo0ODoyOSArMDEwMApUaG9tYXMg
Qm9ubmVmaWxsZSA8dGhvbWFzLmJvbm5lZmlsbGVAYm9vdGxpbi5jb20+IHdyb3RlOgoKPiBHQ0Mx
NCByZW1vdmVkIHRoZSBpbXBsaWNpdCBpbnQgc3VwcG9ydC4KPiBUaGlzIGNvbW1pdCBhZGRzIGEg
cGF0Y2ggdG8gbGlic2hhMSB0byBmaXggYW4gaW1wbGljaXQgaW50IGRlY2xhcmF0aW9uCj4gYXMg
cmVjb21tZW5kZWQuCj4gCj4gTGluazogaHR0cHM6Ly9nY2MuZ251Lm9yZy9nY2MtMTQvcG9ydGlu
Z190by5odG1sCj4gCj4gRml4ZXM6Cj4gICAgIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5l
dC9yZXN1bHRzLzg3ZGM5YmE5NjkwY2JiNmE4Mjg3NTczNGNlOWNiOGRiYWY4NzhlNDYvCj4gCj4g
U2lnbmVkLW9mZi1ieTogVGhvbWFzIEJvbm5lZmlsbGUgPHRob21hcy5ib25uZWZpbGxlQGJvb3Rs
aW4uY29tPgoKVGhhbmtzIGZvciB0aGUgbmV3IGl0ZXJhdGlvbiEgSXQgZml4ZXMgdGhlIGlzc3Vl
cyBJIHBvaW50ZWQgb3V0LCBidXQgSQpoYXZlIG1vcmUgcXVlc3Rpb25zL2NvbW1lbnRzLgoKPiAr
Rml4ZXM6Cj4gKwo+ICsgIHRlc3QuYzoxNDo4OiBlcnJvcjogdHlwZSBkZWZhdWx0cyB0byDigJhp
bnTigJkgaW4gZGVjbGFyYXRpb24gb2Yg4oCYbnVtX3Rlc3TigJkgWy1XaW1wbGljaXQtaW50XQo+
ICsgICAgIDE0IHwgc3RhdGljIG51bV90ZXN0Owo+ICsgICAgICAgIHwgICAgICAgIF5+fn5+fn5+
Cj4gKwo+ICtVcHN0cmVhbTogaHR0cHM6Ly9naXRodWIuY29tL3BzZWlkZXJlci9saWJzaGExL2Nv
bW1pdC9kNDQ5ZjI2Zjc4MmJlOTFiMzg0N2Y4OGVkMmJkOTM3NTgyYTU3NWI2CgpUaGlzIHNob3Vs
ZCBpZGVhbGx5Li4uCgo+ICsKPiArU2lnbmVkLW9mZi1ieTogUGV0ZXIgU2VpZGVyZXIgPHBzLnJl
cG9ydEBnbXgubmV0PgoKLi4uIGdvIGhlcmUsIGkuZSByaWdodCBhZnRlciBQZXRlcidzIFNvQiwg
YnV0IGJlZm9yZSB5b3VycywgYXMgaXQncyBhbgppbmZvcm1hdGlvbiBhZGRlZCBieSB5b3UuCgpC
dXQgbW9yZSBpbXBvcnRhbnRseTogaHR0cHM6Ly9naXRodWIuY29tL3BzZWlkZXJlci9saWJzaGEx
LyBpc24ndAoidXBzdHJlYW0iLiBVcHN0cmVhbSBmb3IgdGhpcyBwYWNrYWdlIGlzCmh0dHBzOi8v
Z2l0aHViLmNvbS9kb3R0ZWRtYWcvbGlic2hhMS4gU28gd2UncmUgaW50ZXJlc3RlZCBpbiBzZWVp
bmcKdGhlIGNoYW5nZSBoYXZpbmcgYmVlbiBzdWJtaXR0ZWQgb3IgYWNjZXB0ZWQgYnkgdGhlIHJl
YWwgdXBzdHJlYW0sIG5vdApqdXN0IGEgY29tbWl0IGluIHNvbWUgInJhbmRvbSIgR2l0aHViIHJl
cG9zaXRvcnkgKGV2ZW4gdGhvdWdoIFBldGVyClNlaWRlcmVyIGlzIGEgd2VsbCBrbm93biBCdWls
ZHJvb3QgY29udHJpYnV0b3IhKQoKVGhhbmtzIQoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25p
LCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5n
aW5lZXJpbmcgYW5kIHRyYWluaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
