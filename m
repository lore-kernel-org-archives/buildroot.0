Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D2DC0218F
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 08:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CABA340339;
	Tue,  4 Feb 2025 08:42:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L8PFC8llfQmd; Tue,  4 Feb 2025 08:42:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF5334033A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF5334033A;
	Tue,  4 Feb 2025 08:42:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7AB72185
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 08:42:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A10F4032C
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 08:42:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nTkuiaKOe9Mc for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 08:42:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3415140323
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3415140323
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3415140323
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 08:42:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6EB044419B;
 Tue,  4 Feb 2025 08:42:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tfEVw-00FDgW-1o;
 Tue, 04 Feb 2025 09:42:36 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?B?0JvQtdC+0L3QuNC0INCu0YDRjNC10LI=?= <leo@yuriev.ru>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <20250112171832.2886452-1-leo@yuriev.ru>
 <218931738620849@mail.yandex.ru>
Date: Tue, 04 Feb 2025 09:42:36 +0100
In-Reply-To: <218931738620849@mail.yandex.ru> (=?utf-8?B?ItCb0LXQvtC90Lg=?=
 =?utf-8?B?0LQg0K7RgNGM0LXQsiIncw==?= message of
 "Tue, 04 Feb 2025 01:15:35 +0300")
Message-ID: <87msf2qewz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevufhfffgjkfgfgggtgfesthhqtddttderjeenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpedvuedtgeeiveelhfelieehffduledtuedvieevteeuheekgfekueektefhhfehffenucffohhmrghinhepohiilhgrsghsrdhorhhgnecukfhppedutdelrdekledrvdefvddrheehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddtledrkeelrddvfedvrdehhedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheplhgvoheshihurhhivghvrdhruhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/libmdbx: bump version to 0.13.3
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

Pj4+Pj4gItCb0LXQvtC90LjQtCIgPT0g0JvQtdC+0L3QuNC0INCu0YDRjNC10LIgPGxlb0B5dXJp
ZXYucnU+IHdyaXRlczoKCiA+IEhpLAogPiBBIGZldyB3ZWVrcyBhZ28sIEkgc3VibWl0dGVkIHRo
ZSBwYXRjaCBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L2xp
c3QvP3Nlcmllcz00Mzk5ODIuCiAKID4gUGxlYXNlIGNhbmNlbCBpdCBhcyBhbiBlcnJvciBoYXMg
YmVlbiBmb3VuZCAoSSBoYXZlbid0IGZvdW5kIGFueSBpbnN0cnVjdGlvbnMgb24gaG93IHRvIGRv
IGl0IG15c2VsZikuCiAKID4gVGhlIG5ldyB2ZXJzaW9uIG9mIGxpYm1kYnggd2lsbCBiZSByZWxl
YXNlZCBpbiBhIHdlZWsgYW5kIEkgd2lsbCBzZW5kIGEgbmV3IHBhdGNoLgoKVGhhbmtzLCBJIGhh
dmUgbWFya2VkCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3Qv
cGF0Y2gvMjAyNTAxMTIxNzE4MzIuMjg4NjQ1Mi0xLWxlb0B5dXJpZXYucnUvCmFzIHN1cGVyc2Vl
ZGVkLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
