Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1850EE77199
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 09:21:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2271403F9;
	Thu,  9 Jan 2025 09:21:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4atL2j_TYwkI; Thu,  9 Jan 2025 09:21:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A004040401
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A004040401;
	Thu,  9 Jan 2025 09:21:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D7337940
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 09:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8D6280F44
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 09:21:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R2hZJugp-Fxl for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 09:21:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E7FF880F38
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7FF880F38
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E7FF880F38
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 09:21:46 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1288599;
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 09 Jan 2025 09:21:40 +0000 (UTC)
Message-ID: <a58bb770-6e83-4ee9-a2a3-7f96ad0536a2@korsgaard.com>
Date: Thu, 9 Jan 2025 10:21:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
References: <20250107210923.1127755-1-romain.naour@smile.fr>
 <cabf6dca22e81938b46cd749c5ceb921@free.fr>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <cabf6dca22e81938b46cd749c5ceb921@free.fr>
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=mG7IJh6anybzq9AiwoMhVRVLXJsL9ic84OcHv43hcWF+RQPyBcotic15bBL3iOOx4l52W+6sQlRknB5d0Fw3492Us2J6LLSZ/RB2eM9omn3gHMNnKvoQsiaMeEI8j/D1Ugyth85Y74clbDMr4Vqd11OUiBoi3sGt3V+egyx2v0Jlc4O0S5wcAh2vrBfpyrVGRqPV80EM2XiJVomCghonNvBdKzgCtLrtP6KFiC+aaNnIQ3OGO8VHFxU2M45dJchuD5BQRpjFsw/wwrzy31vX4NJ5LsS9kbEPK0AySJ7quL5kc6MKBMjQqVcq0Zjz2T6gwTF0ur5f4iTsqxcWy12vDA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=0MakOF690PUE/5UCzyLrvnuPEFr8xVr7egW+6JUIe8w=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=mG7IJh6a
Subject: Re: [Buildroot] [PATCH] package/qemu: fix Qemu stub builds
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMS83LzI1IDIyOjUxLCBKdWxpZW4gT2xpdmFpbiB3cm90ZToKPiBPbiAwNy8wMS8yMDI1IDIy
OjA5LCBSb21haW4gTmFvdXIgdmlhIGJ1aWxkcm9vdCB3cm90ZToKPj4gU2luY2UgY29tbWl0ICJz
dHViczogYXZvaWQgZHVwbGljYXRlIHN5bWJvbHMgaW4gbGlicWVtdXV0aWwuYSIgWzFdLAo+PiBR
ZW11IGRvZXNuJ3QgYnVpbGQgd2l0aDoKPj4KPj4gwqAgLi9jb25maWd1cmUgLS1lbmFibGUtdXNl
ciAtLWRpc2FibGUtc3lzdGVtIC0tZW5hYmxlLXRvb2xzCj4+Cj4+IMKgIC91c3IvYmluL2xkOiBs
aWJod2NvcmUuYS5wL2h3X2NvcmVfcWRldi5jLm86IGluIGZ1bmN0aW9uIAo+PiAnZGV2aWNlX2Zp
bmFsaXplJzoKPj4gWy4uLl1vdXRwdXQvYnVpbGQvaG9zdC1xZW11LTkuMi4wL2J1aWxkLy4uL2h3
L2NvcmUvcWRldi5jOjY4OTogCj4+ICgudGV4dCsweDc1Yyk6IHVuZGVmaW5lZCByZWZlcmVuY2Ug
dG8gJ3FhcGlfZXZlbnRfc2VuZF9kZXZpY2VfZGVsZXRlZCcKPj4gwqAgY29sbGVjdDI6IGVycm9y
OiBsZCByZXR1cm5lZCAxIGV4aXQgc3RhdHVzCj4+Cj4+IEluZGVlZCwgd2l0aCBoYXZlX3N5c3Rl
bSA9IGZhbHNlIGFuZCBoYXZlX3Rvb2xzID0gdHJ1ZSwgUWVtdSBuZWVkcyB0aGUKPj4gc3R1YnMg
Zm9yIFFBUEkgZXZlbnRzIGFkZGVkIGJ5IHN0dWJfc3MuYWRkKGZpbGVzKCdxZGV2LmMnKSkgdG8g
cHJvdmlkZQo+PiBxYXBpX2V2ZW50X3NlbmRfZGV2aWNlX2RlbGV0ZWQoKS4KPj4KPj4gRml4ZXM6
IDM4OGI4NDlmYjZjMzM4ODJiNDgxMTIzNTY4OTk1YTc0OWE1NGY2NDguCgpGWUksIHRoaXMgc2hv
dWxkIGhhdmUgYmVlbiBlZGZjNjdmYjFhNWYwZmU2N2JhOWRlOTFlOTBiMDZhNDQ5MDJjMjMxIAoo
InBhY2thZ2UvcWVtdTogYnVtcCB0byB2ZXJzaW9uIDkuMi4wIikKCi0tIApCeWUsIFBldGVyIEtv
cnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
