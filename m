Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D84EFCD98ED
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 16:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18E05613F2;
	Thu, 18 Jun 2026 16:15:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CDKmEDacw0rp; Thu, 18 Jun 2026 16:15:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 040F860FDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781799303;
	bh=UiEyXX6L06fzTK7o8TghKToCbFeEGoEtmRlOxDRPCRQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=E7mNlWSKo3fdlatz1IqAaeZvm0hdrL2cQ9vFGg4KX9S0jufsLVTibHe8WTOWhlLFK
	 SU6/Qy1hiwbVTfTqMN+Smw6bv+9NgzxOS3jhbqmB5CiJCbFBlhyaVzWWKe5MBO+Ur8
	 cldG0xPbzQTJsNcmFQXA3hKPRMEeJ0Rkr3IUVibxtGEjQaGJFTz7V0aXw8q6Sq+f4z
	 igqF0uL0SyXUzmIjpU0uhFX5LmuqARLlvZaCLuXr6lm3AR+hUh9Q0//R0Skju/9n8C
	 2puqOnz8bqV0stXmRz8sdhxf8lAKa7fxmm5KCw4psjTJ+If4uLDntoNUW+PWk7GQT7
	 FhiCQb6tsqpsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 040F860FDB;
	Thu, 18 Jun 2026 16:15:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C6EF358
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 16:15:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8268A83B5D
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 16:15:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iOhTdgvaPD9I for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 16:15:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6AC2E83B50
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AC2E83B50
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6AC2E83B50
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 16:14:59 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 3E7EC4E42FAD
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 16:14:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id F0E31601AC;
 Thu, 18 Jun 2026 16:14:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 286B7106C8221; 
 Thu, 18 Jun 2026 18:14:53 +0200 (CEST)
Date: Thu, 18 Jun 2026 18:14:52 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, thomas.petazzoni@bootlin.com, Ricardo
 Martincoski <ricardo.martincoski@datacom.com.br>
Message-ID: <20260618181452.6fe3794d@kmaincent-XPS-13-7390>
In-Reply-To: <abca804a-1a63-4319-9b7e-ff9cdfed053d@gmx.de>
References: <20260615123930.447-1-kory.maincent@bootlin.com>
 <abca804a-1a63-4319-9b7e-ff9cdfed053d@gmx.de>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1781799296; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=G0N+Vb0goY5G2Uav+9e3NSw+8opiQDFNZl1TGy9FeII=;
 b=RaklTi+wjvDMlJdrNxNoRyM79pNbbXo307HqMhZtpy7nNa0VQh05vjx2cQ5tfBkoAMjOZn
 YWujVT0mlwe55r7xkUDputcYckQTqROf45gibydJX2P/MamCwcuU+yThIKIBXAu28GBQJs
 AcRS1Z3/+1CrwBT07kJEWxqCuBgh/eZzC75J9mIv+TNa4nWzYNe6Ogy978QHNB+9AZoa85
 CHSZjiKGEJpWywcnNQAMSIt3C/cZeWbUFC0OPRRPX3FshpEkSUum0sIKZ8jIkfi2iWu3WT
 ghpT+nX8BnINdFsvOqzyind7WuMFiOSPC05nOXtj5o6QT3ZFSvduO8mUDfm5jg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=RaklTi+w
Subject: Re: [Buildroot] [PATCH] utils/docker-run: Support BR2_EXTERNAL with
 relative paths
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCAxNSBKdW4gMjAyNiAyMDowNzowOSArMDIwMApGaW9uYSBLbHV0ZSA8ZmlvbmEua2x1
dGVAZ214LmRlPiB3cm90ZToKCj4gQW0gMTUuMDYuMjYgdW0gMTQ6Mzkgc2NocmllYiBLb3J5IE1h
aW5jZW50IHZpYSBidWlsZHJvb3Q6Cj4gPiBUaGUgZG9ja2VyLXJ1biBzY3JpcHQgZGlkIG5vdCBo
YW5kbGUgdGhlIEJSMl9FWFRFUk5BTCBlbnZpcm9ubWVudCB2YXJpYWJsZSwKPiA+IHByZXZlbnRp
bmcgdXNlIG9mIGV4dGVybmFsIHRyZWVzIGluIERvY2tlciBidWlsZHMuCj4gPiAKPiA+IEFkZCBz
dXBwb3J0IGJ5IGNvbnZlcnRpbmcgcmVsYXRpdmUgcGF0aHMgdG8gYWJzb2x1dGUsIG1vdW50aW5n
IHRoZSBkaXJlY3RvcnkKPiA+IGludG8gdGhlIGNvbnRhaW5lciwgYW5kIHBhc3NpbmcgdGhlIHZh
cmlhYmxlIHRvIHRoZSBEb2NrZXIgZW52aXJvbm1lbnQuICAKPiAKPiBJJ3ZlIHNlbnQgYSBwYXRj
aCBhIHdoaWxlIGFnbyB0aGF0IGRvZXMgcHJldHR5IG11Y2ggdGhlIHNhbWUgdGhpbmcsIGFuZCAK
PiBoYW5kbGVzIHRoZSBwb3NzaWJpbGl0aWVzIG9mIG11bHRpcGxlIGV4dGVybmFsIHRyZWVzIChz
cGFjZSBzZXBhcmF0ZWQgCj4gbGlzdCwgb3IgbGVnYWN5IGNvbG9uIHNlcGFyYXRlZCkgYW5kIGVt
cHR5IEJSMl9FWFRFUk5BTCAodG8gZGlzYWJsZSBhbnkgCj4gY29uZmlndXJlZCBleHRlcm5hbCB0
cmVlcyk6Cj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9w
YXRjaC8yMDI2MDQwNTE4NTYwOC4xMzU3NjMzLTEtZmlvbmEua2x1dGVAZ214LmRlLwo+IAo+IENv
dWxkIHlvdSB0ZXN0IHRoYXQgb25lPwoKT2ggSSBoYXZlIG1pc3NlZCB5b3VyIHBhdGNoLgpJdCB3
b3JrcyB3ZWxsIG9uIG15IHNpZGUuCllvdSBjYW4gYWRkIG15IFJldmlld2VkLWJ5LgoKU21hbGwg
cXVlc3Rpb24sIHdoeSB3b3VsZCB5b3Ugd2FudCB0byBkaXNhYmxlIGNvbmZpZ3VyZWQgZXh0ZXJu
YWwgdHJlZXM/CgpSZWdhcmRzLAotLSAKS8O2cnkgTWFpbmNlbnQsIEJvb3RsaW4KRW1iZWRkZWQg
TGludXggYW5kIGtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
