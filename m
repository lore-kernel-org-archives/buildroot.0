Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0801FEFB7F
	for <buildroot@archiver.kernel.org>; Fri, 27 Feb 2026 19:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF55B40D49;
	Fri, 27 Feb 2026 19:18:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0cJJRpKTuDXu; Fri, 27 Feb 2026 19:18:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5453240D40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772219895;
	bh=kSvZXVOY/hnFP2yslBlOJo9mUpdO4SW11YnjCoG7G54=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OghTlAWLErWaCLU5TJRYyzqYPFWPKsjs0MQvkR6naJHv5Iue6XQS6Zpkk7lHcZJvU
	 rv6LAeoVXWkqnyUlfYcdtQ7PERyEOD5YiBXz3gbqStBt5Dsw9BDyBZXlwM91jheP3U
	 7IBY1t3P+W5YdgHAhyQBg77IeRQsAc/rKkalzLlQTgHYikbeXVLr4FxGE0aeB4mHkS
	 tNF+do/jzLcGuQ5u+Hxo3zv6OM8oBXgIAs6QIqADnmInYOw2BY1E3GQeY59Y29r6Jj
	 6MqN3ON4W/MFMesUSfmZClKElQ6mB4gDxNbFnfkf4QPsHfhahFsd1ysjdOLMdOZi42
	 vWuWZ3GUZ+Tpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5453240D40;
	Fri, 27 Feb 2026 19:18:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A1F11F3
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 19:18:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1779640864
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 19:18:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id njefWJA--3Oj for <buildroot@buildroot.org>;
 Fri, 27 Feb 2026 19:18:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 613104060A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 613104060A
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 613104060A
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 19:18:11 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 892206293; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 27 Feb 2026 19:18:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vw3Lh-00000008Hjz-1xJj;
 Fri, 27 Feb 2026 20:18:05 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Mattias =?utf-8?Q?Walstr=C3=B6m?= <lazzer@gmail.com>
Cc: buildroot@buildroot.org,  Bernd Kuhls <bernd@kuhls.net>,  "Yann E .
 MORIN" <yann.morin@orange.com>
In-Reply-To: <20260227160842.2905924-1-lazzer@gmail.com> ("Mattias
 =?utf-8?Q?Walstr=C3=B6m=22's?=
 message of "Fri, 27 Feb 2026 17:08:42 +0100")
References: <20260227160842.2905924-1-lazzer@gmail.com>
Date: Fri, 27 Feb 2026 20:18:05 +0100
Message-ID: <87wlzyov0y.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=A/0al9rwg784jNKzd+EERKJwhWSgrFEzhNdxn8IWJkriA3o/7WIm5cQdHkoym8ALOim68MarSQnyVEMdHtQ3lxlW84E3KPcXCn1/N5gcVgI7oPS7Hs+xy66qOI2ZV3s6n9HPUIcYQk4a0GNXCKqdwnvhWUxcsoeKYBGeh01rooGI8UsqYBx9rvWOic2dWhsm1Axn8OnO8i/VBt6NYb4CKSQLpEhyLn7eowmYiuM5t6ILBvvshZ4YIxFbRefvNcdzuKfwn8cysrqsGWuUD0TSu8aIGvpjUdk0yQY5T/BMHD6etJrmrrcbsGWZYI3CCP2HFeN1Nsg+Ii7QfIULoOoX1A==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=htj4cmNnLiRn5VXYgQaBFOUwoOMqurn0/KzluF1LndI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=A/0al9rw
Subject: Re: [Buildroot] [PATCH 1/1] package/gpsd: Bump version to 3.27.5
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

Pj4+Pj4gIk1hdHRpYXMiID09IE1hdHRpYXMgV2Fsc3Ryw7ZtIDxsYXp6ZXJAZ21haWwuY29tPiB3
cml0ZXM6CgogPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aWFzIFdhbHN0csO2bSA8bGF6emVyQGdtYWls
LmNvbT4KCkNvbW1pdHRlZCBhZnRlciBhZGRpbmcgYSBsaW5rIHRvIGh0dHBzOi8vZ3BzZC5naXRs
YWIuaW8vZ3BzZC9ORVdTIGFuZAptZW50aW9uaW5nIHRoYXQgdGhpcyBpcyBhIGJ1Z2ZpeCByZWxl
YXNlLCB0aGFua3MuCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
