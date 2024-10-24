Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A40D10380
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 21:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8622A60A93;
	Thu, 24 Oct 2024 21:07:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XT8Dn7kRxDRt; Thu, 24 Oct 2024 21:07:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85FB060A80
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85FB060A80;
	Thu, 24 Oct 2024 21:07:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DB9F04960
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 21:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D57D781467
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 21:07:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aBGPGplXbr8k for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 21:07:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C042C8145C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C042C8145C
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C042C8145C
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 21:07:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A010A40003;
 Thu, 24 Oct 2024 21:07:06 +0000 (UTC)
Date: Thu, 24 Oct 2024 23:07:05 +0200
To: Vincent =?UTF-8?B?U3RlaGzDqQ==?= <vincent.stehle@arm.com>
Cc: buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>
Message-ID: <20241024230705.0363f318@windsurf>
In-Reply-To: <20241003074518.3214072-1-vincent.stehle@arm.com>
References: <20241003074518.3214072-1-vincent.stehle@arm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729804026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fk/yYtdKpRvldAs2JC0NRB25MWH8A1TgbVX82fTGCh8=;
 b=EdqV7Kcwr9lisL8H+8N+Z+4ihlPGrpCiMtZRZMwdylHr+UTCwiNNaLI0320dSlx8I15LsV
 IuK8jzmKCC9/+3Dox/JCp88AXaV80/qQxWTedjJv6nXTL+fbWiQH1IlsM2ctIUMpkS205E
 C1WrwY1L6iaTQdAcCLvKf0K+wTa1qCpfm+k821DuMm+3y9Uveb6rb0gLPNizsNCQsr0/Ga
 Wqh0qczrA+nmEHM0TfInPxrcVgRMuiSj9uuSAEexbsme5PjVeBIuVxnUxe/bzdcoLHG/b8
 /6ejGImpnTA2SmcWZywBLHujYiNKsHhx/exlj2wojffG44TVQ+Uk1mJWTWmOaw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EdqV7Kcw
Subject: Re: [Buildroot] [PATCH] configs/arm_fvp_ebbr: bump Linux, U-Boot,
 TF-A and FVP
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

T24gVGh1LCAgMyBPY3QgMjAyNCAwOTo0NToxOCArMDIwMApWaW5jZW50IFN0ZWhsw6kgPHZpbmNl
bnQuc3RlaGxlQGFybS5jb20+IHdyb3RlOgoKPiAtIEJ1bXAgTGludXgga2VybmVsIHRvIDYuMTAu
MTIgYW5kIGFkZCB0aGUgZGVwZW5kZW5jeSBvbiBob3N0LXB5dGhvbjMuCj4gLSBCdW1wIFUtQm9v
dCB0byAyMDI0LjA3Lgo+IC0gQnVtcCBURi1BIHRvIHYyLjExLiBSZW1vdmUgdGhlIHN0ZG91dCBw
YXRjaCwgd2hpY2ggaXMgcHJlc2VudAo+ICAgdXBzdHJlYW0uIFJlbW92ZSBvdXIgaGFzaCBmaWxl
IG5vdyB0aGF0IHRoZSBhcm0tdHJ1c3RlZC1maXJtd2FyZQo+ICAgcGFja2FnZSBjZW50cmFsaXNl
cyB0aG9zZS4KPiAtIEJ1bXAgRlZQIHRvIDExLjI3LjE5IGluIHRoZSBkb2N1bWVudGF0aW9uLgo+
IC0gQ29udmVydCB0byBgbWFrZSBzYXZlZGVmY29uZmlnJyBmb3JtYXQuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogVmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBhcm0uY29tPgo+IC0tLQo+ICAu
Li4vMDAwMS1mZWF0LWZ2cC1hZGQtc3Rkb3V0LXBhdGgucGF0Y2ggICAgICAgfCA0NSAtLS0tLS0t
LS0tLS0tLS0tLS0tCj4gIC4uLi9hcm0tdHJ1c3RlZC1maXJtd2FyZS5oYXNoICAgICAgICAgICAg
ICAgICB8ICAyIC0KPiAgYm9hcmQvYXJtL2Z2cC1lYmJyL3BhdGNoZXMvbGludXgvbGludXguaGFz
aCAgIHwgIDQgKy0KPiAgYm9hcmQvYXJtL2Z2cC1lYmJyL3BhdGNoZXMvdWJvb3QvdWJvb3QuaGFz
aCAgIHwgIDIgKy0KPiAgYm9hcmQvYXJtL2Z2cC1lYmJyL3JlYWRtZS50eHQgICAgICAgICAgICAg
ICAgIHwgIDQgKy0KPiAgY29uZmlncy9hcm1fZnZwX2ViYnJfZGVmY29uZmlnICAgICAgICAgICAg
ICAgIHwgMjQgKysrLS0tLS0tLQo+ICA2IGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyks
IDcxIGRlbGV0aW9ucygtKQo+ICBkZWxldGUgbW9kZSAxMDA2NDQgYm9hcmQvYXJtL2Z2cC1lYmJy
L3BhdGNoZXMvYXJtLXRydXN0ZWQtZmlybXdhcmUvMDAwMS1mZWF0LWZ2cC1hZGQtc3Rkb3V0LXBh
dGgucGF0Y2gKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGJvYXJkL2FybS9mdnAtZWJici9wYXRjaGVz
L2FybS10cnVzdGVkLWZpcm13YXJlL2FybS10cnVzdGVkLWZpcm13YXJlLmhhc2gKCkFwcGxpZWQg
dG8gbWFzdGVyLCB0aGFua3MuCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIENUTywgQm9v
dGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxp
bi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
