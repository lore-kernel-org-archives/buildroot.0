Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00246C5AC80
	for <buildroot@archiver.kernel.org>; Sun,  9 Aug 2026 10:42:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4A9040522;
	Sun,  9 Aug 2026 10:42:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BoJW1RgPeTBY; Sun,  9 Aug 2026 10:42:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA7134052F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786272131;
	bh=3ht3aYq+MYWJCDVjrl8rET7Nk8K4bPPyyWZQkvAoLbQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MNstqtr87eH5vIOggktucVygEQsmoPqEtZg5HGKpPgdiz8ogsWVOdjpCoBo3hR1FE
	 kKWFaHdFH6+mu3GqXY54PF5Sz5IZGSNiC5vwZCAuwlWdt6pBq+d5V5x2iEb1XDYEh6
	 z7X8BIUEY2Cuf7+VK/RO0jd4wTxPc2a3C9/ODGTZ+unteG3pzLNRA7wqOR+gszYR6j
	 CPht2SusfwECtIfjC5HP+7XW8DHx8z+CYYh/PAC1ocEtAA0jMdBK/vAMwANfEvWcL7
	 lJJMH0z33BmBPN4GlWxJ3hPar4RevyCfukYObikRg7Vzd4zoR9IPGdqC/wOW+BLgrF
	 mPz3Acw9HfARQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA7134052F;
	Sun,  9 Aug 2026 10:42:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E823C28A
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 10:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA6A54002B
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 10:42:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 75QERujUWT44 for <buildroot@buildroot.org>;
 Sun,  9 Aug 2026 10:42:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D05AF4005D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D05AF4005D
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D05AF4005D
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 10:42:08 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 9DF484E4117C;
 Sun,  9 Aug 2026 10:42:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 670A96033B;
 Sun,  9 Aug 2026 10:42:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F157011C489E4; 
 Sun,  9 Aug 2026 12:41:59 +0200 (CEST)
Date: Sun, 9 Aug 2026 12:41:58 +0200
To: Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, 
 Julien Olivain <ju.o@free.fr>
Message-ID: <anhY2jHfrtuxplGy@windsurf>
References: <20260803-libxmslxec-bump-v2-1-7b668ecb24e8@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260803-libxmslxec-bump-v2-1-7b668ecb24e8@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1786272120; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=JZNE5NW4lNmrAaUX45/5ou2sM8OqPJt/tTHSAobk+HI=;
 b=U9fdNGK9Bdq1/f97W4NBEA+4UYgAck7sl/z99HiVLQ7ViAssM949l3XJzJZBcz20PQospy
 OLvVjOJkCJ5qb5GNInR8rS/8vkvOfhDU5u3YaJYbjamvjUZ3YuhQe0IV379KpbiLecmeG4
 BGsqHh1jxHvE/SR2QzyZUnq5xouQsoAyPl68mmD5fCXxqnYELpc1FgE3/r1ysy0GyvWly9
 B1njLfmM2OyKV1fMbyLictg9sxKSYY3QeWnS6jaTa3zwGFnzYfuDkLiW+jLprblbtHFDkJ
 mw6cNZQfcYNN15lPo9qsHnGd3SnTPNmGYmTkF+4pHhRGN8u7IVvmN41nTKqLoQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=U9fdNGK9
Subject: Re: [Buildroot] [PATCH v2] package/libxmlsec1: bump version to
 1.3.12
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

SGVsbG8gQWxleGlzLCBIZWxsbyBKdWxpZW4sCgpPbiBNb24sIEF1ZyAwMywgMjAyNiBhdCAwNDox
Njo0NlBNICswMjAwLCBBbGV4aXMgTG90aG9yw6kgdmlhIGJ1aWxkcm9vdCB3cm90ZToKPiBVcGRh
dGUgbGlieG1sc2VjIGZyb20gMS4zLjkgdG8gMS4zLjEyLiBUaGUgcGFja2FnZSB0aGVuIG5lZWRz
IGEgZmV3Cj4gYWRqdXN0bWVudHM6Cj4gLSB0aGVyZSBhcmUgdW5kZWZpbmVkIHJlZmVyZW5jZXMg
dG8geG1sRGVidWdEdW1wRG9jdW1lbnQgKFsxXSk6Cj4gCj4gICB1bml0X3Rlc3RzL3RyYW5zZm9y
bV9oZWxwZXJzX3VuaXRfdGVzdHMuYzoyOTE6OTogZXJyb3I6IGltcGxpY2l0Cj4gICBkZWNsYXJh
dGlvbiBvZiBmdW5jdGlvbiDigJh4bWxEZWJ1Z0R1bXBEb2N1bWVudOKAmQo+ICAgWy1XaW1wbGlj
aXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCj4gCj4gVGhpcyBpcyBkdWUgdG8geG1sc2VjMSB1bml0
IHRlc3RzIGJlaW5nIGJ1aWx0IHN5c3RlbWF0aWNhbGx5LCBhbmQKPiBkZXBlbmRpbmcgb24gbGli
eG1sMiBiZWluZyBidWlsdCB3aXRoIC0td2l0aC1kZWJ1Zywgc28gcGF0Y2gKPiBhcHBzL01ha2Vm
aWxlLmFtIGFjY29yZGluZ2x5IGF0IGJ1aWxkIHRpbWUgdG8gZGlzYWJsZSB1bml0IHRlc3RzIGJ1
aWxkLgo+IAo+IC0gdGhlIGJ1aWxkIGNhbiBmYWlsIHdpdGggb2xkZXIgR0NDIHZlcnNpb25zIGR1
ZSB0byBhbiB1bmltcGxlbWVudGVkCj4gICBwYXJhbWV0ZXIgKFsyXSk6Cj4gCj4gICBhYXJjaDY0
LWxpbnV4LWdjYy5icl9yZWFsOiBlcnJvcjogdW5yZWNvZ25pemVkIGNvbW1hbmQgbGluZSBvcHRp
b24gXAo+ICAg4oCYLVdmb3JtYXQtb3ZlcmZsb3c9MuKAmTsgZGlkIHlvdSBtZWFuIOKAmC1Xc3Ry
aWN0LW92ZXJmbG93PeKAmT8KPiAKPiBUaGlzIGZvcm1hdC1vdmVyZmxvdyBwYXJhbWV0ZXIgaGFz
IGJlZW4gaW1wbGVtZW50ZWQgaW4gR0NDIDcsIHNvIG1ha2UKPiB0aGUgcGFja2FnZSBkZXBlbmQg
b24gR0NDID49IDcuIEFub3RoZXIgc29sdXRpb24gY291bGQgaGF2ZSBiZWVuIHRvCj4gcGFzcyAt
LWRpc2FibGUtcGVkYW50aWMgdG8gdGhlIHBhY2thZ2UncyBjb25maWd1cmUsIGJ1dCB0aGF0IHNv
dW5kcyBhCj4gYml0IHN0cm9uZyBqdXN0IHRvIGRpc2FibGUgYSBwYXJhbWV0ZXIgdGhhdCBoYXMg
YmVlbiBleGlzaXRpbmcgZm9yCj4gYWxtb3N0IDEwIHllYXJzLgoKRllJLCBJIGRvbid0IHRoaW5r
IHRoZSBzb2x1dGlvbnMgYnJvdWdodCB0byB0aG9zZSB0d28gcHJvYmxlbXMgYXJlCnJlYWxseSB0
aGUgZ29vZCBzb2x1dGlvbnMuIFRoZSBwcm9ibGVtcyBzaG91bGQgYmUgZml4ZWQgYXQgdGhlIHJv
b3QKdXBzdHJlYW0gcmF0aGVyIHRoYW4gd29ya2VkIGFyb3VuZC4KClNvIGZvciB0aGUgZmlyc3Qg
cHJvYmxlbTogaW1wcm92ZSBjb25maWd1cmUuYWMgdG8gZGV0ZWN0IGlmIGxpYnhtbDIKd2FzIGJ1
aWx0IHdpdGggZGVidWcgc3VwcG9ydCBvciBub3QsIGFuZCBidWlsZCB1bml0IHRlc3RzIG9yIG5v
dAphY2NvcmRpbmdseS4KCkZvciB0aGUgc2Vjb25kIHByb2JsZW06IHRlc3QgdGhlIEdDQyBmbGFn
cyBpbiBjb25maWd1cmUuYWMgYmVmb3JlCnVzaW5nIHRoZW0uCgpTbyBJIHdlbnQgYWhlYWQgYW5k
IGltcGxlbWVudGVkIHRob3NlIGltcHJvdmVtZW50cywgYW5kIHByb3Bvc2VkIHRoZW0KdXBzdHJl
YW06CgogIGh0dHBzOi8vZ2l0aHViLmNvbS9sc2gxMjMveG1sc2VjL3B1bGwvMTIxOQoKV2Ugd2ls
bCBzZWVuIHVwc3RyZWFtJ3MgZmVlZGJhY2suCgpCdXQgb3ZlcmFsbCBJIGZlZWwgbGlrZSBCdWls
ZHJvb3QncyBwb2xpY3kgc2hvdWxkIGJlIHRvIG1vcmUgaW50byB0aGlzCmRpcmVjdGlvbiAoZml4
aW5nIGlzc3VlcyB1cHN0cmVhbSB0aGF0IHBhcGVyaW5nIG92ZXIgdGhlIHByb2JsZW0gaW4KQnVp
bGRyb290KS4KCkJlc3QgcmVnYXJkcywKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28t
b3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVy
aW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
