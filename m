Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F3B8C3DA4A
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 21:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 124EC608C3;
	Wed, 14 Aug 2024 21:49:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0wSFiYWbxbTg; Wed, 14 Aug 2024 21:49:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30C5E608F4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30C5E608F4;
	Wed, 14 Aug 2024 21:49:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 789FB1BF4DB
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 21:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 656E040392
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 21:49:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fHha6_qloi76 for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 21:49:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C54D24032E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C54D24032E
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C54D24032E
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 21:49:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E7D20FF803;
 Wed, 14 Aug 2024 21:49:38 +0000 (UTC)
Date: Wed, 14 Aug 2024 23:49:38 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240814234938.651915c6@windsurf>
In-Reply-To: <ZrrZvTetrbgQqpCL@waldemar-brodkorb.de>
References: <ZrrZvTetrbgQqpCL@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723672179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l5HTBtNCpkFbnc7ipCoftVmpb6edzoSdPq7wZUMPauQ=;
 b=deGXyAKtSuF60+E6hYtHI20gZ/09jB/2YPhO5imcKWpEesTAHhSCOJtEXdvASj+cfQaaFl
 73aEvC+lWpK8szxlZaikTcJTak0egj6rOFNumTi7GTcBboMBHxy2j0GM3sc+C9OD4vVcXQ
 m3Wf9vKKYLL1XkUX7gb9mY24Rj5GS8u0aHdJqc0qVbRhbFyo9RhhGPTXh18Nfix0HhpA9T
 etrzfFLXWn5I4FAWpXd2N74JXmsv9XX3eus87nir4IYwuy/3qfYcxFbOLJ/hDV+n6wHA4K
 EV8G8gLEmq/rcdEjESRIXIaZ49KP5tpiw54saG9ZLTtOiMmZ5/RuYWPLL4Z5YA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=deGXyAKt
Subject: Re: [Buildroot] [PATCH] package/uclibc: update to 1.0.50
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

T24gVHVlLCAxMyBBdWcgMjAyNCAwNTo1Nzo0OSArMDIwMApXYWxkZW1hciBCcm9ka29yYiA8d2J4
QG9wZW5hZGsub3JnPiB3cm90ZToKCj4gU2VlIHRoaXMgZ2l0IHNob3J0bG9nIGZvciBjaGFuZ2Vz
Ogo+IAo+IERtaXRyeSBDaGVzdG55a2ggKDIpOgo+ICAgICAgIEZpeCBjb21waWxhdGlvbiB3aXRo
IDQueCBrZXJuZWwgaGVhZGVycwo+ICAgICAgIEdyb3VwIGNvbmRpdGlvbnMgYWZ0ZXIgYCYmYAo+
IAo+IEZyYW5rIE1laG5lcnQgKDYpOgo+ICAgICAgIGxpYmRsOiBwcm9wZXJseSBjYXN0IHBhcmFt
ZXRlcnMgZm9yICVwIGZvcm1hdCBzdHJpbmcgc3BlY2lmaWVyCj4gICAgICAgaWNvbnY6IGV4cGxp
Y2l0IGNhc3QgdG8gYHVuc2lnbmVkIGNoYXIqYAo+ICAgICAgIGljb252OiBleHBsaWNpdGx5IHN0
YXRlIG9wZXJhdG9yIHByZWNlZGVuY2UKPiAgICAgICBsZHNvLmM6IHVzZSAndW5zaWduZWQgaW50
JyBhcyBsb29wIHZhcmlhYmxlIHR5cGUKPiAgICAgICBpY29udjogZml4IHBhcmFtZXRlciB0eXBl
IG9mIHV0ZjhzZXFfaXNfe292ZXJsb25nLHN1cnJvZ2F0ZSxpbGxlZ2FsfQo+ICAgICAgIGljb252
OiBwcmV2ZW50IGNvbXBpbGVyIHdhcm5pbmcgZHVyaW5nIGluaXRpYWxpemF0aW9uIHdpdGggamlz
MDIwOAo+IAo+IEouIE5ldXNjaMOkZmVyICgxKToKPiAgICAgICBiaXRzL3N0YXQuaDogRGVjbGFy
ZSBzdF9tdGltIGlmIGRlZmluZWQoX19VU0VfWE9QRU4ySzgpLCBldmVyeXdoZXJlCj4gCj4gTWFy
Y3VzIEhhZWhuZWwgKDUpOgo+ICAgICAgIGxkc28vZGwtdmRzbzogYXZvaWQgY29tcGlsZXIgd2Fy
bmluZyBpZiBjb25maWd1cmVkIHdpdGhvdXQgdmRzbwo+ICAgICAgIHVjbGliYzogRml4IGRvdWJs
ZSBwcm9tb3Rpb24gd2FybmluZwo+ICAgICAgIGxpYm06IEZpeCBmbG9hdCBjb252ZXJzaW9uIGNv
bXBpbGVyIHdhcm5pbmcKPiAgICAgICBmZWF0dXJlcy5oOiBhZGQgY2xhbmcgcHJlcmVxdWlzaXRl
IG1hY3JvCj4gICAgICAgYnVpbGRzeXM6IGFsbG93IGJ1aWxkaW5nIHdpdGggZ2NjLTE0Cj4gCj4g
U3ZlbiBMaW5rZXIgKDEpOgo+ICAgICAgIGMrKzogUmVtb3ZlIGRlcHJlY2F0ZWQgZHluYW1pYyBl
eGNlcHRpb24gc3BlY2lmaWNhdGlvbgo+IAo+IFZhbGVudGluIEdlaHJrZSAoMSk6Cj4gICAgICAg
YXJtOiBSZXBsYWNlIGRlcHJlY2F0ZWQgYXNtIGluc3RydWN0aW9ucyBmb3IgQVJNdjggQUFyY2gz
Mgo+IAo+IFdhbGRlbWFyIEJyb2Rrb3JiICg5KToKPiAgICAgICBDbGFuZyBzdXBwb3J0IGZvciBn
bnVfaW5saW5lIGF0dHJpYnV0ZQo+ICAgICAgIGFsbG93IHRvIHVzZSA8c3lzL3Vjb250ZXh0Lmg+
Cj4gICAgICAgYWRkIFNFRUtfREFUQS9TRUVLX0hPTEUKPiAgICAgICBsc2VlazogYWxsb3cgU0VF
S19EQVRBL1NFRUtfSE9MRSB0byBiZSB1c2VkCj4gICAgICAgYml0cy9zdGF0Lmg6IERlY2xhcmUg
c3RfbXRpbSBpZiBkZWZpbmVkKF9fVVNFX1hPUEVOMks4KSwgYWRkIG1pc3NpbmcKPiAgICAgICBy
aXNjdjogcmVtb3ZlIGluY29tcGxldGUgY29udGV4dCBpbXBsZW1lbnRhdGlvbiwgdXNlIGxpYnVj
b250ZXh0Cj4gICAgICAgYWRkIG1lbWZkX2NyZWF0ZSBzeXNjYWxsIHdyYXBwZXIKPiAgICAgICBn
ZXRyYW5kb206IHJlbW92ZSBfX1VTRV9HTlUgLyBhZGQgR1JORF9JTlNFQ1VSRQo+ICAgICAgIGJ1
bXAgdmVyc2lvbiBmb3IgMS4wLjUwIHJlbGVhc2UKPiAKPiBZYW5uIExlIER1ICgxKToKPiAgICAg
ICBzdGRsaWI6IGluY3JlYXNlIG51bWJlciBvZiBzdGF0aWMgYXRleGl0IGhhbmRsZXJzIHRvIDMy
Cj4gCj4gQWxsIGJ1aWxkcm9vdCBwYXRjaGVzIGFyZSB1cHN0cmVhbS4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBXYWxkZW1hciBCcm9ka29yYiA8d2J4QG9wZW5hZGsub3JnPgo+IC0tLQoKSXQncyBhIHZl
cnNpb24gYnVtcCBvZiBhIGNyaXRpY2FsIGNvbXBvbmVudCwgaW4gbWFzdGVyLCBxdWl0ZSBsYXRl
IGluCnRoZSByZWxlYXNlIGN5Y2xlLCBidXQgcmVhbGx5IHRoZSBudW1iZXIgb2YgY2hhbmdlcyB1
cHN0cmVhbSBpcwpsaW1pdGVkLCBzbyBsZXQncyBnaXZlIGl0IGEgdHJ5IGFuZCBob3BlIGl0IHdv
bid0IGJyZWFrIGFueXRoaW5nIDotKQoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcyEKClRob21h
cwotLSAKVGhvbWFzIFBldGF6em9uaSwgQ1RPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBL
ZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
