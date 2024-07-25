Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DECE4C3DA49
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 10:15:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BE1A4046D;
	Thu, 25 Jul 2024 10:15:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EzlICxzNTdpd; Thu, 25 Jul 2024 10:15:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 520CA404EE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 520CA404EE;
	Thu, 25 Jul 2024 10:15:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5873D1BF422
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 10:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4690E40414
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 10:15:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VG41H_ZxyWdA for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 10:15:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AE43E403A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE43E403A7
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE43E403A7
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 10:15:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9E73D240006;
 Thu, 25 Jul 2024 10:15:38 +0000 (UTC)
Date: Thu, 25 Jul 2024 12:15:37 +0200
To: =?UTF-8?B?R2HDq2w=?= PORTAY <gael.portay@gmail.com>
Message-ID: <20240725121537.7f987369@windsurf>
In-Reply-To: <D2YJ1IQ4XJ62.17GIHGKSB1ZYE@gmail.com>
References: <20240723212011.23048-1-gael.portay@rtone.fr>
 <20240723212011.23048-3-gael.portay@rtone.fr>
 <20240724182158.07c7436b@windsurf>
 <D2YJ1IQ4XJ62.17GIHGKSB1ZYE@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721902539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MNxUZ2iliHzzQ7Pp/E92pO7s7N5YXmkucy+YLl4pOPY=;
 b=DfHQ4mTlVA17e437aezB/axaWqOc7XhUi36CjD//S8QDjxGW79BzPoR4rsf92jwR9yalLO
 VzE09J0NVKavXF5zWApR7Cp4Ysb/+yuTS66xd2ebfYKbKqPEB7H+rckJulsot3nq0A+ntz
 vWNzUSeOTlblPdCkv6QaMfsoEOQfhJHJjmVflpeidHsRBPHiXUhjK2Fq0i0jZmI7k/4wGz
 uiXJz+bEL5NC8JqW+Jz1y/3Y3G5PtMCkJa9/wsLRDLDGiEJr/qW+4RJDR8NdP23L3Qtgmr
 cbPYb43rVvF1GQwFRKqlniJHNmECc2vZB6ha2cgeqbDS7DmdtszoW85ghTJCew==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DfHQ4mTl
Subject: Re: [Buildroot] [PATCH 2/2] package/rpi-userland: package is
 deprecated
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 =?UTF-8?B?R2HDq2w=?= PORTAY <gael.portay@rtone.fr>, Mahyar
 Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gR2HDq2wsCgpPbiBUaHUsIDI1IEp1bCAyMDI0IDExOjUzOjQ1ICswMjAwCkdhw6tsIFBP
UlRBWSA8Z2FlbC5wb3J0YXlAZ21haWwuY29tPiB3cm90ZToKCj4gV2VsbCwgSSBoYXZlIG5vIGlk
ZWEgdG8gYmUgaG9uZXN0Lgo+IAo+IEFsbCBJIGtub3cgZm9yIG5vdyBpcyB0aGF0IEkgd2FzIGFi
bGUgdG8gbWFrZSBpdCB3b3JrcyBvbiBwaTUgd2l0aAo+IHF0NXdlYmVuZ2luZSAodjNkIGlzIHN1
cHBvc2VkIHRvIHN1cHBvcnQgcGk0LzUsIHZjNCBpcyBzdXBwb3NlZCB0bwo+IHN1cHBvcnQgdGhl
IGZvcm1lciBwaSk7IGJ1dCBtZXNhIGNhbm5vdCBiZSBidWlsdCBvbiBwaSAxL3plcm8gZm9yIG5v
dyBhcwo+IGl0IHJlcXVpcmVzIHN1cHBvcnQgZm9yIE5lb24gYW5kIEJDTTI4MzUgaGFzIG5vIHN1
cHBvcnQgZm9yIGl0LgoKV2VsbCwgdGhlbiB3ZSBuZWVkIHRvIGZpZ3VyZSBvdXQgdGhpcyBiZWZv
cmUgZGVjbGFyaW5nIHJwaS11c2VybGFuZCBhcwpvYnNvbGV0ZS9kZXByZWNhdGVkLiBJbmRlZWQs
IG5vdCBoYXZpbmcgc3VwcG9ydCBmb3IgdGhlIG9sZGVyIFJQaQpwbGF0Zm9ybXMgaXMgYSBwcm9i
bGVtLgoKPiBCdXQgZmlyc3QsIEkgYW0gZml4aW5nIHRoZSBsYXN0IGlzc3VlcyB3aXRoIHF0NXdl
YmVuZ2luZSBvbiBBUk0gMzItYml0Cj4gdXNpbmcgcmFzcGJlcnJ5cGkzX3F0NXdlX2RlZmNvbmZp
ZyBhbmQgSSBhbSBtYWtpbmcgdGhlIHBhY2thZ2UgbW9yZQo+IHJvYnVzdC4gSSB3aWxsIHNlbnQg
dGhlIHBhdGNoIG9uY2UgSSBoYXZlIHRoZSB0aW1lIHRvIHdyaXRlIHRoZSBjb21taXQKPiBtZXNz
YWdlcy4gQW5kIHRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHlvdXIgZml4ZXMhCgpZZWFoLCBJIHNw
ZW50IHF1aXRlIGEgbG90IG9mIHRpbWUgZHVyaW5nIHRoZSByZWNlbnQgQnVpbGRyb290IGhhY2th
dGhvbgp0byBmaXggdGhlIGJ1aWxkIG9mIHF0NXdlYmVuZ2luZS4gRm9yIEFSTSAzMi1iaXQsIGl0
IHdhcyBidWlsZGluZwplbnRpcmVseSBhbGwgdGhlIHdheSB0byBwb2ludCBvZiBsaW5raW5nIFF0
V2ViRW5naW5lLnNvLCB3aGVyZSB0aGUKbGlua2VyIHdhcyBzaW1wbHkgcmV0dXJuaW5nIGFuIGVy
cm9yIChub24gemVybyBleGl0IGNvZGUpLCBidXQgd2l0aG91dApzcGl0dGluZyBhbnkgZXJyb3Ig
bWVzc2FnZS4gSSBkb3duZ3JhZGVkIHRvIGFuIG9sZGVyIHZlcnNpb24gb2YKYmludXRpbHMganVz
dCB0byBjaGVjaywgYW5kIGV4YWN0IHNhbWUgYmVoYXZpb3IuIEkgcmFuICJzdHJhY2UiIG9uIHRo
ZQpsaW5rZXIsIGFuZCBpdCBkb2VzIHdyaXRlIHRoZSBsaWJRdFdlYkVuZ2luZS5zbyBmaWxlLCBh
cHBhcmVudGx5CmVudGlyZWx5IGFuZCB0aGVuIGF0IHNvbWUgcG9pbnQgaXQgZGVjaWRlcyBzb21l
dGhpbmcgaXMgd3JvbmcsIGFuZCBpdApkZWxldGVzIGl0IGFuZCBleGl0cyB3aXRoIGFuIGVycm9y
LiBJIGNvdWxkbid0IGZpZ3VyZSBvdXQgd2hhdCB3YXMKaGFwcGVuaW5nLgoKQmVzdCByZWdhcmRz
LAoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGlu
CkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCmh0dHBz
Oi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
