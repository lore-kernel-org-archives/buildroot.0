Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07987C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 13:02:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B62B840C8D;
	Sun, 20 Sep 2026 13:02:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2cyEE5TsQ_oH; Sun, 20 Sep 2026 13:02:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D88BD40BFF
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789909326;
	b=CrKXmivNG2bWHadRN4wRXFpMjEIBZB/gw2t3ggsJRArIGbDCHa4zmjhttTrQE75fKLKM
	 3NkUnziMkWpUfQhWJf7ZEvf5nleWSDGSbj/jUmj1W8bnApjCM2O0/NOm+m1k6KPbf2LC9
	 p9uGSoWImNSVaLEPKRDxvyp3HL33kxHF4mId3Dy/8y7FRk79FuRuQ2YdJnboB08RAtMYL
	 afxFX/D+EXTXvcRLRX2v3z6GE09EjIYriSLQ0dL9MOWUBuO0lt+38V8rxXUr2KKNcTap7
	 jDyx7AtevCp0GbLuf+74+TCnvuFEMBM+rWi44cRUR56CZ9AVY8KzZWP7uwDmePlhQsQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789909326;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=XYKCQ+4hvKA4k2H2ZA+pRHlAG//OhoBDw9R1rgcppEI=;
	b=tI4W5D8ELt/xu0gHWFvIuOCxscIQ05nDgqiZAb5jOXT/X0fCmcYjyoQvBXhhgjW64lNS
	 BT144vMQXEf2SLhucI5IUdWbP+xoBX/Y9prOk5HpCsJvMfD3h8KzVk4sHHxiPZ3DNOh2d
	 kvKCmoEnGpTLmFkSWsYVBH4DHmC2rZjQNJJEj7epC+1f+QaFoIj7g0bmQL3iqcRUfzKQu
	 yJT/YEtYIE+MDLxgrReuN3cCukIESk9BRUuAM29HrWdFD+klF9oYWORq4NTIcx8nTHYUc
	 ui0nIAC8q6UQBK2iOeR6hjrH+SJYaOjtmUSpYmTweWb1YPRMSMwkdMt/OC+KRvwpddQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789909325;
	bh=XYKCQ+4hvKA4k2H2ZA+pRHlAG//OhoBDw9R1rgcppEI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TUj4SlxaW7xxAZJ9IUjyot6F23EBvOOMNZdrzhPHNC49nsvICUXT33LUhDHo5U5xx
	 J7eKRQ1R3ROFbaX9SUJXvUiT4g7SoMFzCbaRoMkkJ1QPT0THJzcLH0inWZE3x0IFiq
	 w7FGvz32HLF6xWtJKaCmbn1bmW1yvEBBhgcTm+mUyQa+cYxTV6+I/0l1EAuO6HpMRU
	 OThoozm3TG4t2nQy/VKTyMkv/sl5ApZCTbeqEsQVtbqIMLH6wd9FUWrktiEpPqb1S7
	 UwLe4i9u2Y/qZxO6y7lnrURKtBYD1uFBkcT5JTSczBjxhEt/xsccKRPGNgG1+J2c5O
	 wjtzYzQouC6gg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D88BD40BFF;
	Sun, 20 Sep 2026 13:02:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A6E0037A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:02:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8CD0940BFF
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:02:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2nERCBbJYx0f for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 13:02:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DEDF040A59
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789909323;
 b=UN4b3vLNmKp/wO8At9R6Ee7dJpBHbxlnoUFz4Wn492lJYDSHpTbLgHSCduojo/NuRQbf
 oUDz5oJTdYmultzbcAMWXOjLwzoSrQA1kGJU13ZcroJg740XwoZEPzabNGSD+9kGjFGB3
 fmuaHMXRnFlKIw4SRjiiJCsgHF/tFOMzgwunNcgQeb4xeTLf5jYJ69AZhv0bRSu8EPplM
 tXs/jzOykz88wu5fcNGRtWSa2CN16iL2KlMB/s7Wyrc03pbW5ecliyXEzUcVfonRFLDDT
 fql/lIDFdkwZyvnOcdNoZm1Y2lAAMlThr8zwEQQgDokZXFfeJlFfYgwpt4iSfqY+7+Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789909323;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-Last-TLS-Session-Version;
 bh=mlDW1quDY0fbtl4uA9penPWuwDFXwGjdrpAqJiRdoWM=;
 b=MMdcvRtMquBbQP/sTCv5Zy/KDOUEhRQjO2ZDzLKcfOm8W38sAf6HynCY4xuwXmrNycII
 6KFkdrNzkyA2uZV1gbp5B+OOfkqt+QkA5+ic5UNyOXgKhuy5AyH+N8jUFlhWSDcqsSqAg
 HCs68dRUc5SUwKslWKWCXVVhU3eGv3YHOgLZDZ+0Z+X85s7Cg2EEX0OfS7/cyLKLDXEyD
 YQJTq4sPwYtQkMtGrQQn2zRyFTdR9s6lxjirYFahOnqs0EitywlAy7/LwTRZpQpxvijyS
 Q/vJBVGT1YGk1Ow3nsWpET5H0opRMoRdCE/s0/SuAx6QsEsJwPZowfTBbZ9yOdrlT7A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="gr//pKvF"; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DEDF040A59
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:02:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id B97E44E4082F;
 Sun, 20 Sep 2026 13:02:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 82595604C9;
 Sun, 20 Sep 2026 13:02:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2C7581032829C; 
 Sun, 20 Sep 2026 15:01:52 +0200 (CEST)
Date: Sun, 20 Sep 2026 15:01:50 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Koen Martens <gmc@sonologic.nl>, 
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>, 
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>, 
 Yair Ben Avraham <yairba@protonmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, 
 =?utf-8?Q?C=C3=A9dric_Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Titouan Christophe <titouan.christophe@mind.be>, 
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>, 
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, 
 Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>, 
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>, 
 =?utf-8?Q?No=C3=A9?= Rubinstein <noe.rubinstein@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>, 
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?utf-8?B?QW5kcsOp?= Zwing <nerv@dawncrow.de>, 
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>, 
 Philippe Reynes <philippe.reynes@softathome.com>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>, 
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Message-ID: <aq_Y-0UhbjpybGbZ@windsurf>
References: <20260919155845.5776-1-bernd@kuhls.net>
 <20260919155845.5776-11-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260919155845.5776-11-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 10/77] package/libtorrent-rasterbar: bump
 version to 2.1.1
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

T24gU2F0LCBTZXAgMTksIDIwMjYgYXQgMDU6NTc6MzVQTSArMDIwMCwgQmVybmQgS3VobHMgd3Jv
dGU6Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlidG9ycmVudC1yYXN0ZXJiYXIvMDAwMS1maXgt
bW9yZS1jLTE3LXRoYXQtbWFkZS1pdC1pbi5wYXRjaCBiL3BhY2thZ2UvbGlidG9ycmVudC1yYXN0
ZXJiYXIvMDAwMS1maXgtbW9yZS1jLTE3LXRoYXQtbWFkZS1pdC1pbi5wYXRjaAo+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uYWZjZTc1YjlmZgo+IC0tLSAvZGV2L251
bGwKPiArKysgYi9wYWNrYWdlL2xpYnRvcnJlbnQtcmFzdGVyYmFyLzAwMDEtZml4LW1vcmUtYy0x
Ny10aGF0LW1hZGUtaXQtaW4ucGF0Y2gKPiBAQCAtMCwwICsxLDUzIEBACj4gK0Zyb20gMjYzODc4
OWI3MDQ4ZTE3YWJhN2NjODY3NDMwNWYzNmJkMzQ5Yzc5NSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKPiArRnJvbTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KPiArRGF0ZTogTW9uLCAx
NCBTZXAgMjAyNiAxNzozMToyNCArMDIwMAo+ICtTdWJqZWN0OiBbUEFUQ0hdIGZpeCBtb3JlIGMr
KzE3IHRoYXQgbWFkZSBpdCBpbgo+ICtNSU1FLVZlcnNpb246IDEuMAo+ICtDb250ZW50LVR5cGU6
IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKPiArQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzog
OGJpdAo+ICsKPiArUGF0Y2ggd2FzIGluc3BpcmVkIGJ5IGh0dHBzOi8vZ2l0aHViLmNvbS9hcnZp
ZG4vbGlidG9ycmVudC9wdWxsLzQ4MDUKPiArYW5kIGZpeGVzIGEgYnVpbGQgZXJyb3Igd2l0aCBn
Y2MtOS4zLjAKPiArCj4gK2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvbGlidG9ycmVudC1yYXN0ZXJi
YXItMi4xLjEvc3JjL3RvcnJlbnRfaW5mby5jcHA6ODU1OjE2Ogo+ICsgZXJyb3I6IGZ1bmN0aW9u
IOKAmGxpYnRvcnJlbnQ6OnRvcnJlbnRfaW5mbyYgbGlidG9ycmVudDo6dG9ycmVudF9pbmZvOjpv
cGVyYXRvcj0obGlidG9ycmVudDo6dG9ycmVudF9pbmZvJiYp4oCZCj4gKyBkZWZhdWx0ZWQgb24g
aXRzIHJlZGVjbGFyYXRpb24gd2l0aCBhbiBleGNlcHRpb24tc3BlY2lmaWNhdGlvbiB0aGF0Cj4g
KyBkaWZmZXJzIGZyb20gdGhlIGltcGxpY2l0IGV4Y2VwdGlvbi1zcGVjaWZpY2F0aW9uIOKAmOKA
mQo+ICsKPiArVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHViLmNvbS9hcnZpZG4vbGlidG9ycmVudC9w
dWxsLzg4NjkKClVwc3RyZWFtIGlzIGFwcGFyZW50bHkgbm90IGhhcHB5IHdpdGggdGhlIHByb3Bv
c2VkIGNoYW5nZS4gTWF5YmUgeW91CmNhbiBwcm92aWRlIGZlZWRiYWNrIG9uIHRoZSBnY2MgdmVy
c2lvbiB0aGF0IHdhcyB0ZXN0ZWQgKGdjYyA5LngpIGFuZApzZWUgd2hhdCB0aGV5IHNheT8KClRo
b21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJl
ZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jv
b3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
