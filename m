Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27314D35162
	for <buildroot@archiver.kernel.org>; Wed,  1 Apr 2026 09:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE58661063;
	Wed,  1 Apr 2026 09:27:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id it8_jCm4W5mL; Wed,  1 Apr 2026 09:27:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2450661034
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775035668;
	bh=qFLhjSgNX2yuOPzNRGPhPp0RAfYpF6SXv0o1ZeU4rNQ=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y8fP9vW+6bHYAHSOLXBjyEyNwn33wuYEkdoay2bI2ARPDfa6jLDu1Z9nCULGJbDJj
	 buQn3jkk75h2o6uORLoHIF5IaHQJTN/oygvkV1GfIWj9Og3D3/Bs0p382K2aHWWUYL
	 ZJ3mXheWQtZphjEBwtmSe0DWV0EL8lXYT2LOPNvwrLuS11/gQdGTxhdna8wOps1hc1
	 n2EZzDgtFGTyud+POJBakzqOrdEz3L6jU9gKP9pU9CawMX5d6fIrIc04U4GV6pRHwC
	 9/bC5LyyT3Bh9L9I1eSzVuPsvveFCebvNJ3lU2U1jmFw+Bus0JMyEZ8V/HaGaqjOQf
	 i+CeLx+WHZJeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2450661034;
	Wed,  1 Apr 2026 09:27:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E8DAE4
 for <buildroot@buildroot.org>; Wed,  1 Apr 2026 09:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 019BE81312
 for <buildroot@buildroot.org>; Wed,  1 Apr 2026 09:27:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id miWrr-0W5AMn for <buildroot@buildroot.org>;
 Wed,  1 Apr 2026 09:27:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E36A881240
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E36A881240
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E36A881240
 for <buildroot@buildroot.org>; Wed,  1 Apr 2026 09:27:44 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 17636336;
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 01 Apr 2026 09:27:41 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1w7rrP-00000005m23-3iyX;
 Wed, 01 Apr 2026 11:27:39 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: <yann.morin@orange.com>
Cc: <buildroot@buildroot.org>,  Titouan Christophe
 <titouan.christophe@mind.be>,  Vincent =?utf-8?Q?Stehl=C3=A9?=
 <vincent.stehle@arm.com>, Joseph Kogut <joseph.kogut@gmail.com>
In-Reply-To: <7b86fd0c400abfa616573d98d996c3a32cf87135.1775020521.git.yann.morin@orange.com>
 (yann morin's message of "Wed, 1 Apr 2026 07:15:21 +0200")
References: <7b86fd0c400abfa616573d98d996c3a32cf87135.1775020521.git.yann.morin@orange.com>
Date: Wed, 01 Apr 2026 11:27:39 +0200
Message-ID: <87se9f58tw.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=WRFDpPn8yyKIJZQWHA5LDPfu5kYjGUWUhLZKLsPxlrM6J2tNTGmiFrbrMMlhmac5djTAGNHu9xA+qiCuK5lWi5SOvM52BwQ92QgomGcxxoHqZye+IrnpN+wwbFbtG3adNNI15sxVGesngkI3Yc2J7fd3UwH8pAQIMEjIkVflXztuRmaIL9nsarcf/61E9QZS3li/ry44HaYZNSTDTuTHJiv930n5AtrObC+P/09ouQLF/RtMquhKvb7P7hfCJmJsA9yB5zwKJNB4QNCWDVzUQ20jzALoQSCt14BPdlqKCSN4dExi6NkLGHiAR7XMkCZm61yH0U02JjPsiJohHK0o/Q==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=cCUg4y72p5RfDORUgezopymiVdZ2Dnnp7jHvVzfLtF0=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=WRFDpPn8
Subject: Re: [Buildroot] [PATCH] package/mosquitto: disable building the
 crtl-shell for host variant
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gICA8eWFubi5tb3JpbkBvcmFuZ2UuY29tPiB3cml0ZXM6CgogPiBGcm9tOiAiWWFubiBF
LiBNT1JJTiIgPHlhbm4ubW9yaW5Ab3JhbmdlLmNvbT4KID4gVGhlIGN0cmwtc2hlbGwsIGluIG1v
c3F1aXR0b19jdHJsLCBvcHRpb25hbGx5IHVzZXMgYSBsaW5lLWVkaXRpbmcKID4gbGlicmFyeSwg
ZWl0aGVyIGxpYmVkaXQgb3IgcmVhZGxpbmUuIFRoZXJlIGlzIGEgc2luZ2xlIG9wdGlvbiAoaW4K
ID4gbW9zcXVpdHRvKSB0aGF0IGRyaXZlcyB3aGV0aGVyIHRvIGJ1aWxkIGFsbCB0aGUgYW9wcHMg
b3Igbm9uZSwgYnV0CiA+IGZvciB0aGUgaG9zdCB2YXJpYW50LCB3ZSdyZSBvbmx5IGludGVyZXN0
ZWQgaW4gbW9zcXVpdHRvX3Bhc3N3ZCwKID4gbm90IG1vc3F1aXR0b19jdHJsIChub3IgdGhlIG90
aGVycyBlaXRoZXIpLgoKID4gRXhwbGljaXRseSBkaXNhYmxlIHRoZSBjdHJsLXNoZWxsLCB0byBh
dm9pZCBidWlsZCBmYWlsdXJlcyB3aGVuIHRoZQogPiBob3N0IGhhcyBhIG1peGVkIGluc3RhbGxh
dGlvbiBvZiByZWFkbGluZSBvciBsaWJlZGl0IHRoYXQgaXMgbm90CiA+IGNvbXBhdGlibGUgd2l0
aCBvdXJzLgoKID4gRml4ZXM6CiA+ICAgICBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3Qub3Jn
L3Jlc3VsdHMvODU2Lzg1NjM1MmRkZDY5MGRjOGIyMzE0ZDQ2YTZhODM3ZDc0YzIzN2Q2OWYKCiA+
IFNpZ25lZC1vZmYtYnk6IFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW5Ab3JhbmdlLmNvbT4KID4g
Q2M6IFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4KID4gQ2M6IFRpdG91YW4g
Q2hyaXN0b3BoZSA8dGl0b3Vhbi5jaHJpc3RvcGhlQG1pbmQuYmU+CiA+IENjOiBWaW5jZW50IFN0
ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFybS5jb20+CiA+IENjOiBKb3NlcGggS29ndXQgPGpvc2Vw
aC5rb2d1dEBnbWFpbC5jb20+CgogPiAtLS0KID4gTm90ZTogSSB3YXMgbm90IGFibGUgdG8gcmVw
cm9kdWNlIHRoZSBpc3N1ZSBsb2NhbGx5LCBzbyBJIGFtIG5vdCBjZXJ0YWluCiA+IG9mIHRoZSBm
aXguIFZpbmNlbnQsIEpvc2VwaCwgaWYgeW91IGNvdWxkIHRlc3QgaW4geW91ciBhdXRvYnVpbGRl
cnMgKG9yCiA+IHByb3ZpZGUgdGhlIGBkcGtnIC0tZ2V0LXNlbGVjdGlvbnNgIG9yIHNpbWlsYXIg
Zm9yIEFyY2guLi4pCgpUaGVyZSBpc24ndCByZWFsbHkgYW55IHVzZSBjYXNlIGZvciBoYXZpbmcg
YSBob3N0IHZlcnNpb24gb2YgaXQsIHNvCmNvbW1pdHRlZCwgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0
ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
