Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A7B1CD6E4A
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 10:41:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B4068418C;
	Fri, 29 May 2026 10:41:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dk-eTgQ38F5K; Fri, 29 May 2026 10:41:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BCE0841B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780051291;
	bh=44rUOLBAwWoE3WLBNh9gN+iYN3GT7Nzdl57bqVcdYPY=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ywkl471WGGUHxja3oQiweE8xyc9QM3Z/MMMXpqrkug1fRZIG5/5bYAeitne0/69vi
	 422vU8wHN4Hs4ybXSB+SycC0yTVu01WKkAbLvurWRakx9BzuX7sepDT1YOJTbSs46A
	 i1ClCExK2UElvwvVmjr3BpGexigun9fm01dfmIt+hFJsNSGwtq9ozkE12DpM8ZqGsi
	 3fd+Kuq6bVvB7uqDea5gKVJVLkUsWU/WCqx/ciaiyVYL64jATTiaMEMrt3rafX6trs
	 MU/ZzXE5Y7BDRc+FIJrj6UVXra7pIxNaTiGOTU1J6PuicXot2hsLqVxE5EU2U72GUp
	 fqOghx6c3xMpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BCE0841B9;
	Fri, 29 May 2026 10:41:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5AA4AF4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 10:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 579EF406F2
 for <buildroot@buildroot.org>; Fri, 29 May 2026 10:41:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H6fxX0CgHexL for <buildroot@buildroot.org>;
 Fri, 29 May 2026 10:41:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 268BB406D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 268BB406D7
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 268BB406D7
 for <buildroot@buildroot.org>; Fri, 29 May 2026 10:41:28 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -2087072658; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 29 May 2026 10:41:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wSueU-00000001frv-0Cpi;
 Fri, 29 May 2026 12:41:18 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org,  Petr Vorel <petr.vorel@gmail.com>,  Devreese
 Jorik <jorik.devreese@barco.com>,  Thomas Devoogdt
 <thomas.devoogdt@barco.com>
In-Reply-To: <20260507123534.318763-1-thomas@devoogdt.com> (Thomas Devoogdt's
 message of "Thu, 7 May 2026 14:35:34 +0200")
References: <20260507123534.318763-1-thomas@devoogdt.com>
Date: Fri, 29 May 2026 12:41:18 +0200
Message-ID: <87y0h2ijld.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=EhjKsaX9RE9SMj/ShUMpxTm8h7ShMquwg9tbQAXywm+kQhm1AQEZ4gGJIgWcq+RITew6n/kBakYlrUcvMwrf/XROAk22l7TwgLDSHLWHX7S//a0UuxsLjI1sF0qj7yf3IR6+pmzLQTw0OLcFH06rdGqSAxbGJag8Pn8+VBETsoJhqYYwdNwK/9bCpYynjQSVchME/UP4hmg4lfljevROmpmlZYTVFPnsFEOxJssBHw7nPTYo6gv/WsNNu6Qh/Qm0f4ZmXRKwVRd6NoP180GbLLzg3ZK03B1SfpXsVh5LtbZw7bnO3meqn8BOITjmCTPCuJQeH3babMFTsdHtyJiHeg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=YijQLFTAnRM0NXVtbN+sWZrwf0yo82lnlqeBViKdIAE=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=EhjKsaX9
Subject: Re: [Buildroot] [PATCH v1] support/kconfig: fix compiler warnings
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

Pj4+Pj4gIlRob21hcyIgPT0gVGhvbWFzIERldm9vZ2R0IDx0aG9tYXNAZGV2b29nZHQuY29tPiB3
cml0ZXM6CgogPiBGcm9tOiBEZXZyZWVzZSBKb3JpayA8am9yaWsuZGV2cmVlc2VAYmFyY28uY29t
PgogPiBDb21taXQgMzI0NjEyZDY4ZTA5ZDBkYjQ0YzUxYzQ1MWJjNmI4NzQ2NmY3Zjg3NCBmaXhl
ZCBzZXZlcmFsIGNvbXBpbGVyIHdhcm5pbmdzLAogPiBidXQgYWN0dWFsbHkgaW50cm9kdWNlZCBh
IG5ldyBvbmUgYnkgaW5jcmVhc2luZyB0aGUgYnVmZmVyIHNpemUgaW4gY29uZmRhdGEuYyB0aGF0
IGdldHMgcGFzc2VkCiA+IGFsb25nIHRvIGZpbGVfd3JpdGVfZGVwIGluIHV0aWwuYywgYmVjYXVz
ZSBidWYyJ3Mgc2l6ZSB3YXNuJ3QgaW5jcmVhc2VkIGFsb25nIHdpdGggaXQuCgogPiAuL3V0aWwu
YzogSW4gZnVuY3Rpb24g4oCYZmlsZV93cml0ZV9kZXDigJk6CiA+IC4vdXRpbC5jOjg2OjI2OiB3
YXJuaW5nOiDigJglc+KAmSBkaXJlY3RpdmUgd3JpdGluZyAxMCBvciBtb3JlIGJ5dGVzIGludG8K
ID4gYSByZWdpb24gb2Ygc2l6ZSBiZXR3ZWVuIDEgYW5kIDQwOTcgWy1XZm9ybWF0LW92ZXJmbG93
PV0KID4gICAgODYgfCAgICAgICAgIHNwcmludGYoYnVmMiwgIiVzJXMiLCBkaXIsIG5hbWUpOwog
PiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICBefgogPiAuL3V0aWwuYzo4Njo5OiBu
b3RlOiDigJhzcHJpbnRm4oCZIG91dHB1dCAxMSBvciBtb3JlIGJ5dGVzIChhc3N1bWluZyA0MTA3
KQogPiBpbnRvIGEgZGVzdGluYXRpb24gb2Ygc2l6ZSA0MDk3CiA+ICAgIDg2IHwgICAgICAgICBz
cHJpbnRmKGJ1ZjIsICIlcyVzIiwgZGlyLCBuYW1lKTsKID4gICAgICAgfCAgICAgICAgIF5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CgogPiBGaXggdGhpcyBieSBpbmNyZWFzaW5nIHRo
ZSBzaXplIG9mIGJ1ZjIgdG8gbWF0Y2ggdGhlIHBhc3NlZCBidWZmZXIgc2l6ZS4KCiA+IFNpZ25l
ZC1vZmYtYnk6IERldnJlZXNlIEpvcmlrIDxqb3Jpay5kZXZyZWVzZUBiYXJjby5jb20+CiA+IFNp
Z25lZC1vZmYtYnk6IFRob21hcyBEZXZvb2dkdCA8dGhvbWFzLmRldm9vZ2R0QGJhcmNvLmNvbT4K
CkNvbW1pdHRlZCwgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
