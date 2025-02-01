Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F748C0218A
	for <buildroot@archiver.kernel.org>; Sat,  1 Feb 2025 12:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3089760848;
	Sat,  1 Feb 2025 12:19:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Pq59b3YQTSA; Sat,  1 Feb 2025 12:19:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 427366FAC8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 427366FAC8;
	Sat,  1 Feb 2025 12:19:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E251017D
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 12:19:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF24D84A48
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 12:19:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FlPYMKu8jHDs for <buildroot@buildroot.org>;
 Sat,  1 Feb 2025 12:19:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EF33381778
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF33381778
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF33381778
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 12:19:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ED39244398;
 Sat,  1 Feb 2025 12:19:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1teCTT-009wsY-0H;
 Sat, 01 Feb 2025 13:19:47 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Vincent =?utf-8?Q?Stehl=C3=A9?= via buildroot <buildroot@buildroot.org>
Cc: Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@laposte.net>,  Alistair
 Francis <alistair@alistair23.me>,  Julien Olivain <ju.o@free.fr>
References: <20250126173402.24273-1-vincent.stehle@laposte.net>
 <20250126173402.24273-2-vincent.stehle@laposte.net>
Date: Sat, 01 Feb 2025 13:19:46 +0100
In-Reply-To: <20250126173402.24273-2-vincent.stehle@laposte.net> ("Vincent
 =?utf-8?Q?Stehl=C3=A9?= via buildroot"'s message of "Sun, 26 Jan 2025
 18:34:01 +0100")
Message-ID: <87zfj5zwkd.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudejtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufhffjgfkfgggtgfgsehtqhdttddtreejnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepgeefjeduleeikeelteejfffgfffflefgiefgffffieejjefhudfhleeuhedvvdeunecukfhppedujeekrdduudelrddurddufeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejkedrudduledruddrudefjedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehvihhntggvnhhtrdhsthgvhhhlvgeslhgrphhoshhtvgdrnhgvthdprhgtphhtthhopegrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvgdprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 1/2] package/xen: xen tools needs bash at
 runtime
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

Pj4+Pj4gIlZpbmNlbnQiID09IFZpbmNlbnQgU3RlaGzDqSB2aWEgYnVpbGRyb290IDxidWlsZHJv
b3RAYnVpbGRyb290Lm9yZz4gd3JpdGVzOgoKID4gV2hlbiB0aGUgWGVuIHRvb2xzIGFyZSBidWls
dCwgYSBudW1iZXIgb2YgaW5pdCBzY3JpcHRzIGFyZSBpbnN0YWxsZWQgdG8KID4gdGhlIHRhcmdl
dC4KCiA+IFNvbWUgb2YgdGhvc2UgWGVuIHNjcmlwdHMgcmVxdWlyZSBiYXNoIHRvIHJ1bjoKID4g
LSAvZXRjL2luaXQuZC9TNTB4ZW5jb21tb25zCiA+IC0gL2V0Yy9pbml0LmQvUzUweGVuLXdhdGNo
ZG9nCiA+IC0gL2V0Yy9pbml0LmQvUzYweGVuZG9tYWlucwogPiAtIC9ldGMveGVuL3NjcmlwdHMv
bGF1bmNoLXhlbnN0b3JlCiA+IC0gL3Vzci9saWIveGVuL2Jpbi94ZW5kb21haW5zCgogPiBNYWtl
IHN1cmUgdG8gc2VsZWN0IGJhc2ggd2hlbiB0aGUgWGVuIHRvb2xzIGFyZSBzZWxlY3RlZCAod2Ug
bmVlZCB0bwogPiBzZWxlY3QgImJ1c3lib3ggc2hvdyBvdGhlcnMiIGZvciB0aGF0LCB0b28pLgoK
ID4gU3VnZ2VzdGVkLWJ5OiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPgogPiBTaWduZWQt
b2ZmLWJ5OiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGxhcG9zdGUubmV0PgogPiBD
YzogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXJAYWxpc3RhaXIyMy5tZT4KCkNvbW1pdHRlZCB0
byAyMDI0LjAyLnggYW5kIDIwMjQuMTEueCwgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dh
YXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
