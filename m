Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2917AC3DA5D
	for <buildroot@archiver.kernel.org>; Wed, 17 Jul 2024 21:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5AB3400EA;
	Wed, 17 Jul 2024 21:21:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xX5WQtA1RB6N; Wed, 17 Jul 2024 21:21:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB2DF40C0E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB2DF40C0E;
	Wed, 17 Jul 2024 21:21:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CE5C61BF385
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 21:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC80381253
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 21:21:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VVgqkoWsniOe for <buildroot@lists.busybox.net>;
 Wed, 17 Jul 2024 21:21:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B646F80CE7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B646F80CE7
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B646F80CE7
 for <buildroot@buildroot.org>; Wed, 17 Jul 2024 21:21:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BA26D1C0003;
 Wed, 17 Jul 2024 21:21:14 +0000 (UTC)
Date: Wed, 17 Jul 2024 23:21:13 +0200
To: "=?UTF-8?B?R2HDq2w=?= PORTAY" <gael.portay@gmail.com>
Message-ID: <20240717232113.0f00055d@windsurf>
In-Reply-To: <20240716054359.92966-5-gael.portay@rtone.fr>
References: <20240716054359.92966-1-gael.portay@rtone.fr>
 <20240716054359.92966-5-gael.portay@rtone.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721251275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3G/pnI7mNaVua07alEydJaBQD1NPwjJNl6jMDzgDQfk=;
 b=Xrf0+UY6Lc/uX+wkJqBicwU48mIh4UcwBauh26bhonzx4zNiaSdkguYMtaqwcKkJzwvgRb
 YqiNMnOD0ClVxkKkxVa3mVVgb3FUcsVMa+LZsaoWQjzmGRZBROu1PQo8QsIzovWXm1lw7K
 o4GLS/1qVTNKUGD2nqAf4Ag2EsycYkdEepx2y2dhkh5zME+ojvMmFm3OambWzC9n3UJdpP
 Leni3G+QZ9dzCiexmd9gEC/rWKYtMIkVsEW44Ate5S7g65H3mFXogXIBZuEl+UHOHtZoLx
 gLRfftTycrJq2EKJq/gDlZbajb3+OUn39GqRbDWc2z/MWepr7vtAm6sb3GYU0g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Xrf0+UY6
Subject: Re: [Buildroot] [PATCH 4/8] configs/raspberrypi3_64: remove
 upstream device-tree blob
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

T24gVHVlLCAxNiBKdWwgMjAyNCAwNzo0Mzo1NSArMDIwMAoiR2HDq2wgUE9SVEFZIiA8Z2FlbC5w
b3J0YXlAZ21haWwuY29tPiB3cm90ZToKCj4gVGhpcyByZW1vdmVzIHRoZSB1cHN0cmVhbSBkZXZp
Y2UtdHJlZSBibG9iIGZvciB0aGUgYmVhdXR5IG9mCj4gY29uc2lzdGVuY3kuCj4gCj4gTm90ZTog
SXQgaXMgcG9zc2libGUgdG8gbG9hZCB0aGUgdXBzdHJlYW0gZGV2aWNlLXRyZWUgdXNpbmcgdGhl
Cj4gdXBzdHJlYW1fa2VybmVsIHByb3BlcnR5WzNdLgoKQnV0IEkgc3VwcG9zZSB0aGlzIG9ubHkg
d29ya3MgaWYgdGhlIHVwc3RyZWFtIERUQnMgYXJlIGluc3RhbGxlZC4uLiBhbmQKd2UgYXJlIG5v
dCBpbnN0YWxsaW5nIHRoZW0sIHJpZ2h0PwoKQnV0IEkgZ3Vlc3MgdXBzdHJlYW0gRGV2aWNlIFRy
ZWVzIG1ha2Ugc2Vuc2UgaWYgeW91IHVzZSB0aGUgdXBzdHJlYW0Ka2VybmVsLCB3aGlsZSB0aG9z
ZSBkZWZjb25maWdzIGFsbCB1c2UgdGhlIHZlbmRvci9kb3duc3RyZWFtIGtlcm5lbCwgc28KaXQg
bWFrZXMgY29tcGxldGUgc2Vuc2UgdG8gdXNlIHRoZSBjb3JyZXNwb25kaW5nIHZlbmRvci9kb3du
c3RyZWFtCmtlcm5lbC4KClRoYW5rcywKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28t
b3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVy
aW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
