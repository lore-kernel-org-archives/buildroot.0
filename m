Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E38C02198
	for <buildroot@archiver.kernel.org>; Sat,  8 Feb 2025 12:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF3E14174A;
	Sat,  8 Feb 2025 12:46:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EPYucX23pvml; Sat,  8 Feb 2025 12:46:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DB234175C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DB234175C;
	Sat,  8 Feb 2025 12:46:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A250CF
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 12:46:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F245760661
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 12:46:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XChuq1E_pqwh for <buildroot@buildroot.org>;
 Sat,  8 Feb 2025 12:46:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BF4B06067A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF4B06067A
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BF4B06067A
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 12:46:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3C48743427;
 Sat,  8 Feb 2025 12:46:33 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tgkEC-000l8O-0v;
 Sat, 08 Feb 2025 13:46:32 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>,  Romain Naour <romain.naour@smile.fr>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
References: <20250123213541.1737622-1-ju.o@free.fr>
 <2154a936-8a6c-4087-8f7a-1606601eb31f@smile.fr>
Date: Sat, 08 Feb 2025 13:46:32 +0100
In-Reply-To: <2154a936-8a6c-4087-8f7a-1606601eb31f@smile.fr> (Romain Naour via
 buildroot's message of "Wed, 5 Feb 2025 11:04:07 +0100")
Message-ID: <87seoobo47.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefvddvfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufhffjgfkfgggtgfgsehtqhdttddtreejnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepleehuedvleeltefhhffhveekgfekgeeiffegjeehgeekffekhfehueelgfegfefhnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhdpsghuihhlughrohhothdrohhrghenucfkphepudejkedrudduledruddrudefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedujeekrdduudelrddurddufeejpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepjhhurdhosehfrhgvvgdrfhhrpdhrtghpthhtoheprhhomhgrihhnrdhnrghouhhrsehsmhhilhgvrdhfrhdprhgtphhtthhopehrihgtrghrughordhmrghrthhinhgtohhskhhisegurghtrggtohhmrdgtohhmrdgsr
 h
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] utils/check-symbols: allow BR2_BROKEN
 to be unused
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

Pj4+Pj4gIlJvbWFpbiIgPT0gUm9tYWluIE5hb3VyIHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnPiB3cml0ZXM6CgogPiBIZWxsbyBKdWxpZW4sIEFsbCwKID4gTGUgMjMvMDEv
MjAyNSDDoCAyMjozNSwgSnVsaWVuIE9saXZhaW4gYSDDqWNyaXTCoDoKID4+IENvbW1pdCBbMV0g
aW50cm9kdWNlZCB0aGUgQlIyX0JST0tFTiBoaWRkZW4gc3ltYm9sLiBUaGUgaW50ZW50IG9mCiA+
PiB0aGlzIHN5bWJvbCBpcyB0byB0ZW1wb3JhcmlseSBtYXJrIGEgY29uZmlndXJhdGlvbiBrbm93
biB0byBiZSBicm9rZW4uCiA+PiBUaGlzIGNvbW1pdCB3YXMgYWRkZWQgdG8gZml4IGFuIHVuZGVm
aW5lZCB1c2FnZSBvZiB0aGUgc3ltYm9sLCBpbiBhCiA+PiBwcmV2aW91cyBjb21taXQgWzJdLgog
Pj4gCiA+PiBXaXRoIHRoaXMgc29tZXdoYXQgc3BlY2lhbCBzeW1ib2wsIGl0IGlzIGFsc28gcGVy
ZmVjdGx5IG5vcm1hbCB0bwogPj4gaGF2ZSBubyB1c2Ugb2YgaXQuCiA+PiAKID4+IFJ1bm5pbmcg
dGhlIGNvbW1hbmQgInV0aWxzL2NoZWNrLXN5bWJvbHMiIGluIGEgc3RhdGUgdGhlcmUgaXMgbm8g
dXNhZ2UKID4+IG9mIHRoZSBCUjJfQlJPS0VOLCB0aGUgc2NyaXB0IGZhaWxzIHdpdGggb3V0cHV0
OgogPj4gCiA+PiBDb25maWcuaW46MTU6IEJSMl9CUk9LRU4gZGVmaW5lZCBidXQgbm90IHJlZmVy
ZW5jZWQKID4+IAogPj4gVGhpcyBjb21taXQgYWRkcyBhbiBleGNlcHRpb24gZm9yIHRoaXMgc3lt
Ym9sLCBhbGxvd2luZyBpdCB0byBiZQogPj4gdW51c2VkIGluIHRoZSB3aG9sZSBCdWlsZHJvb3Qg
dHJlZS4KID4+IAogPj4gRml4ZXM6CiA+PiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9y
Zy9idWlsZHJvb3QvLS9qb2JzLzg5MjU0MzMzODIKID4+IAogPj4gWzFdIGh0dHBzOi8vZ2l0bGFi
LmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2NvbW1pdC8yZGRjNTgwOGNkMTlmNTc3OTE3
NTY2YWQ4M2UyYTM4MzVkNmQ0M2I5CiA+PiBbMl0gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9v
dC5vcmcvYnVpbGRyb290Ly0vY29tbWl0LzExYThjZGQyYmJiZDBlZjRhZGY2MDBlNDc5MmQ3NWY2
ZjIxMjJlYzgKCiA+IFRlc3RlZCBsb2NhbGx5IGJ5IHJlbW92aW5nIEJSMl9CUk9LRU4gZnJvbSBB
UkMgZXh0ZXJuYWwgdG9vbGNoYWluLgoKID4gQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCkNv
bW1pdHRlZCB0byAyMDI0LjExLngsIHRoYW5rcy4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
