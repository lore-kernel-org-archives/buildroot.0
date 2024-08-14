Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74DC2C3DA4A
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 18:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2DECB40C1D;
	Wed, 14 Aug 2024 18:07:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rj1hwdF_Fc_Z; Wed, 14 Aug 2024 18:07:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7FF540C88
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7FF540C88;
	Wed, 14 Aug 2024 18:07:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 695AE1BF574
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 18:07:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 579764025E
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 18:07:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rg_L62O28qFq for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 18:07:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0BFCB40219
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BFCB40219
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0BFCB40219
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 18:07:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 111C8240004;
 Wed, 14 Aug 2024 18:07:28 +0000 (UTC)
Date: Wed, 14 Aug 2024 20:07:28 +0200
To: "=?UTF-8?B?R2HDq2w=?= PORTAY" <gael.portay@gmail.com>
Message-ID: <20240814200728.5743046c@windsurf>
In-Reply-To: <20240814111821.399174-1-gael.portay@rtone.fr>
References: <20240814111821.399174-1-gael.portay@rtone.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723658849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1OGEktonT50cgdLft2cKRVTmRhVDM4KNE0F6gMN/d5U=;
 b=TbOxwX3/5lK4Roqhwsj73Svo3FrGX8DoyfEk+C0oKFAZwtBjn/xvE++fvcj+eno5NIP9+H
 40kwYiKlP2MX5AvzCkBJEsqxN2go09IeeJIFlYKi4G4DtfpcpCzW6HES7JzbXMfq2l/1oo
 p2Tzispfpk6E/wEofS1KsHr3Jd88lstE9ZVZ6UKt+/pZdO8NcrcnM9uQXs2QV+E0cBcoBn
 j0Nr2ar7a1Oq3HMiENx+lntF9yGygL0dEZmn+Zn2b2zu9K3JKHsaygD+3ZuiK8CK3ij2yP
 3xhh4EhC+NtYf5pQVXnervsicwrFXH/a7RuGy86peDKjfd0VYfBTfj1uX+OsVA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TbOxwX3/
Subject: Re: [Buildroot] [PATCH 1/1] package/qt6tools: fix missing
 host-qt6base dependency
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 =?UTF-8?B?R2HDq2w=?= PORTAY <gael.portay@rtone.fr>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCAxNCBBdWcgMjAyNCAxMzoxODoyMSArMDIwMAoiR2HDq2wgUE9SVEFZIiA8Z2FlbC5w
b3J0YXlAZ21haWwuY29tPiB3cm90ZToKCj4gVGhpcyBhZGRzIHRoZSBob3N0IGRlcGVuZGVuY3kg
aG9zdC1xdDZiYXNlIGFzIGhvc3QtcXQ2dG9vbHMgcmVxdWlyZXMgdGhlCj4gUXQgY21ha2UgbW9k
dWxlcyB0byBiZSBpbnN0YWxsZWQuCj4gCj4gRml4ZXM6Cj4gCj4gCSQgbWFrZSBxdDZ0b29scwo+
IAkoLi4uKQo+IAlDTWFrZSBFcnJvciBhdCBDTWFrZUxpc3RzLnR4dDoyMSAoZmluZF9wYWNrYWdl
KToKPiAJICBDb3VsZCBub3QgZmluZCBhIHBhY2thZ2UgY29uZmlndXJhdGlvbiBmaWxlIHByb3Zp
ZGVkIGJ5ICJRdDYiIChyZXF1ZXN0ZWQKPiAJICB2ZXJzaW9uIDYuNy4yKSB3aXRoIGFueSBvZiB0
aGUgZm9sbG93aW5nIG5hbWVzOgo+IAo+IAkgICAgUXQ2Q29uZmlnLmNtYWtlCj4gCSAgICBxdDYt
Y29uZmlnLmNtYWtlCj4gCj4gCSAgQWRkIHRoZSBpbnN0YWxsYXRpb24gcHJlZml4IG9mICJRdDYi
IHRvIENNQUtFX1BSRUZJWF9QQVRIIG9yIHNldCAiUXQ2X0RJUiIKPiAJICB0byBhIGRpcmVjdG9y
eSBjb250YWluaW5nIG9uZSBvZiB0aGUgYWJvdmUgZmlsZXMuICBJZiAiUXQ2IiBwcm92aWRlcyBh
Cj4gCSAgc2VwYXJhdGUgZGV2ZWxvcG1lbnQgcGFja2FnZSBvciBTREssIGJlIHN1cmUgaXQgaGFz
IGJlZW4gaW5zdGFsbGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEdhw6tsIFBPUlRBWSA8Z2FlbC5w
b3J0YXlAcnRvbmUuZnI+Cj4gLS0tCj4gRGVhciBNYWludGFpbmVycywKCkFwcGxpZWQgdG8gbWFz
dGVyLCB0aGFua3MuCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIENUTywgQm9vdGxpbgpF
bWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
