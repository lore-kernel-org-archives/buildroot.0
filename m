Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B51C3DA5D
	for <buildroot@archiver.kernel.org>; Wed, 17 Jul 2024 21:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C84E400C1;
	Wed, 17 Jul 2024 21:20:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3CQ0g6GJ5IJb; Wed, 17 Jul 2024 21:20:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A438540C15
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A438540C15;
	Wed, 17 Jul 2024 21:20:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6EAFE1BF385
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 21:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 667F540264
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 21:20:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id reR3WpPRFf3H for <buildroot@lists.busybox.net>;
 Wed, 17 Jul 2024 21:19:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2107D40149
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2107D40149
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2107D40149
 for <buildroot@buildroot.org>; Wed, 17 Jul 2024 21:19:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F30CC20004;
 Wed, 17 Jul 2024 21:19:54 +0000 (UTC)
Date: Wed, 17 Jul 2024 23:19:54 +0200
To: "=?UTF-8?B?R2HDq2w=?= PORTAY" <gael.portay@gmail.com>
Message-ID: <20240717231954.6fed9730@windsurf>
In-Reply-To: <20240716054359.92966-1-gael.portay@rtone.fr>
References: <20240716054359.92966-1-gael.portay@rtone.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721251195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=10Wl4iZxOGK8JSoEBnxJv0HEo8SkpyjAfb7YRs4K1FM=;
 b=BIvk/WrAhcjCE74slky3X0cWGisFn7RACYbwTV+ItJFEjqoUSvwkW4xKRgsGamZT1sEiHz
 EXfxQcnzCApYF+jAN35vyevT+UM2ZLbT9mH950mJ7HFIuSCuhOQSP39aP2lQIkTDCIAAJs
 Ey5WkSjQATz37HtXFkMxlBBF8wL94iAoqqh4zToF9992z48XGEsCknZNzbdfZTHiP0mBK3
 lSt5BcSKCpXZS8Rig8c4/c9g2Pa8+dgBXy4WA+uHj3qS2yF+gvlUv+TttsVMsUtQDArqEh
 uTBhOu3tMdAteNbWmWikCsDXmmOYp61uHdPJvkyRUOjkecXkJOMaYSUBBst4uQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BIvk/WrA
Subject: Re: [Buildroot] [PATCH 0/8] configs/raspberrypi*: install missing
 dtb
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
Cc: =?UTF-8?B?R2HDq2w=?= PORTAY <gael.portay@rtone.fr>,
 Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiBUdWUsIDE2IEp1bCAyMDI0IDA3OjQzOjUxICswMjAwCiJHYcOrbCBQT1JUQVki
IDxnYWVsLnBvcnRheUBnbWFpbC5jb20+IHdyb3RlOgoKCj4gVGhlIGxhc3QgcGF0Y2ggbW92ZXMg
c29tZSBjb25maWdzIGluIHRoZSBkZWZjb25maWdzIGFuZCByZW1vdmVzIHNvbWUKPiBjb21tZW50
cyBzbyB0aGUgZGVmY29uZmlnIGZpbGVzIGxvb2sgc2ltaWxhciBhbmQgaXQgbWFrZXMgYSBkaWZm
IGVhc3kuCj4gCj4gUXVlc3Rpb246IEkgYW0gYSBiaXQgcGVycGxleCBieSBpbnN0YWxsaW5nIHRo
ZSBSYXNwYmVycnkgUGkgMiByZXYgMS4yIGluCj4gdGhlIHJhc3BiZXJyeXBpMl9kZWZjb25maWcg
c2luY2UgaXRzIHN3aXRjaGVkIGZyb20gQkNNMjgzNiAoY29ydGV4LWE3KQo+IHRvIEJDTTI4Mzcg
KGNvcnRleC1hNTMsIHRoZSBzYW1lIGFzIHBpMyBhbmQgcGl6ZXJvMncpLgo+IAo+IEkgdGhpbmsg
aXQgbWFrZXMgc2Vuc2UgdG8gaW5zdGFsbCBpdHMgZHRiIHVzaW5nIGl0cyBib2FyZCdzIGRlZmNv
bmZpZwo+IChyYXNwZXJyeXBpMl9kZWZjb25maWcpIGF0IHRoZSBjb3N0IG9mICJwZXJmb3JtYW5j
ZSIgYmVjYXVzZSBpdCBsb3Nlcwo+IGl0cyB0cnVlIGFyY2hpdGVjdHVyZS4KClNob3VsZCB3ZSBp
bnRyb2R1Y2UgYSByYXNwYmVycnkyXzY0X2RlZmNvbmZpZz8KCj4gR2HDq2wgUE9SVEFZICg4KToK
PiAgIGNvbmZpZ3MvcmFzcGJlcnJ5cGk6IGluc3RhbGwgUmFzcGJlcnJ5IFBpIHJldiAxLjAgZGV2
aWNlLXRyZWUgYmxvYgo+ICAgY29uZmlncy9yYXNwYmVycnlwaTI6IGluc3RhbGwgUmFzcGJlcnJ5
IFBpIDIgcmV2IDEuMiBkZXZpY2UtdHJlZSBibG9iCj4gICBjb25maWdzL3Jhc3BiZXJyeXBpM182
NDogaW5zdGFsbCBDb21wdXRlIE1vZHVsZSAzIGRldmljZS10cmVlIGJsb2IKPiAgIGNvbmZpZ3Mv
cmFzcGJlcnJ5cGkzXzY0OiByZW1vdmUgdXBzdHJlYW0gZGV2aWNlLXRyZWUgYmxvYgo+ICAgY29u
Zmlncy9yYXNwYmVycnlwaTQqOiBpbnN0YWxsIFJhc3BiZXJyeSBQaSA0MDAgZGV2aWNlLXRyZWUg
YmxvYgo+ICAgY29uZmlncy9yYXNwYmVycnlwaTQqOiBpbnN0YWxsIENvbXB1dGUgTW9kdWxlIDQv
NHMgZGV2aWNlLXRyZWUgYmxvYnMKPiAgIGNvbmZpZ3MvcmFzcGJlcnJ5cGk1OiBpbnN0YWxsIEJD
TTI3MTJEMCBkZXZpY2UtdHJlZSBibG9iCj4gICBjb25maWdzL3Jhc3BiZXJyeXBpKjogc29ydCBz
b21lIGNvbmZpZ3MKCkFsbCBhcHBsaWVkLCB0aGFua3MhCgpUaG9tYXMKLS0gClRob21hcyBQZXRh
enpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5l
bCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
