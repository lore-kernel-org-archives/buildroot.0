Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1095C282DE
	for <buildroot@archiver.kernel.org>; Thu, 13 Mar 2025 20:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB7DF405A3;
	Thu, 13 Mar 2025 20:47:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KRN_3ZmhAW_7; Thu, 13 Mar 2025 20:47:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 849DD41781
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 849DD41781;
	Thu, 13 Mar 2025 20:47:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CE340EA
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 20:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF74C41781
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 20:47:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5mqeQ8VDXxs4 for <buildroot@buildroot.org>;
 Thu, 13 Mar 2025 20:47:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8834E405A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8834E405A3
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8834E405A3
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 20:47:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 864EF433E9;
 Thu, 13 Mar 2025 20:47:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tspSc-00ETkZ-2O;
 Thu, 13 Mar 2025 21:47:22 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?Rapha=C3=ABl_M=C3=A9lotte?= via buildroot
 <buildroot@buildroot.org>
Cc: =?utf-8?Q?Rapha=C3=ABl_M=C3=A9lotte?= <raphael.melotte@mind.be>
References: <20250310110841.1556155-1-raphael.melotte@mind.be>
Date: Thu, 13 Mar 2025 21:47:22 +0100
In-Reply-To: <20250310110841.1556155-1-raphael.melotte@mind.be>
 (=?utf-8?Q?=22Rapha=C3=ABl=09M=C3=A9lotte?= via buildroot"'s message of
 "Mon, 10 Mar 2025 11:08:40 +0000")
Message-ID: <87plik64kl.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvdekleehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufhfffgjkfgfgggtgfesthhqtddttderjeenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpeffgeeffedvgeehgeefvddttedvtdejheeikedtledugedvudeiteffuddtvdehieenucffohhmrghinheptghvvgdrohhrghenucfkphepudejkedrudduledruddrudefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedujeekrdduudelrddurddufeejpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtoheprhgrphhhrggvlhdrmhgvlhhothhtvgesmhhinhgurdgsvg
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/jbig2dec: add upstream security
 fix for CVE-2023-46361
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

Pj4+Pj4gIlJhcGhhw6tsIiA9PSBSYXBoYcOrbCBNw6lsb3R0ZSB2aWEgYnVpbGRyb290IDxidWls
ZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JpdGVzOgoKID4gRml4ZXMgdGhlIGZvbGxvd2luZyBzZWN1
cml0eSBpc3N1ZToKID4gQ1ZFLTIwMjMtNDYzNjE6IEFydGlmZXggU29mdHdhcmUgamJpZzJkZWMg
djAuMjAgd2FzIGRpc2NvdmVyZWQgdG8KID4gY29udGFpbiBhIFNFR1YgdnVsbmVyYWJpbGl0eSB2
aWEgamJpZzJfZXJyb3IgYXQgL2piaWcyZGVjL2piaWcyLmMuCgogPiBodHRwczovL3d3dy5jdmUu
b3JnL0NWRVJlY29yZD9pZD1DVkUtMjAyMy00NjM2MQoKID4gTm90ZSB0aGF0IGpiaWcyZGVjIHZl
cnNpb24gMC4xOSAodXNlZCBpbiBCdWlsZHJvb3QgMjAyNC4wMi4xMSkgaXMgbm90CiA+IG9mZmlj
aWFsbHkgbGlzdGVkIGFzIGFmZmVjdGVkLCBidXQgaXQgYWN0dWFsbHkgaGFzIHRoZSBzYW1lIGJ1
Zy4KCiA+IEFsc28gbm90ZSB0aGF0IHRoaXMgQ1ZFIGlzIGFib3V0IGEgY3Jhc2ggaW4gdGhlIENM
SSB0b29sIG9ubHkuCgogPiBTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFl
bC5tZWxvdHRlQG1pbmQuYmU+CgpDb21taXR0ZWQgdG8gMjAyNC4wMi54IGFuZCAyMDI0LjExLngs
IHRoYW5rcy4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
