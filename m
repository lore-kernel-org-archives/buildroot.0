Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD65CC369B2
	for <buildroot@archiver.kernel.org>; Thu, 17 Apr 2025 05:32:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61B3041285;
	Thu, 17 Apr 2025 05:32:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o5PzIw86h7JA; Thu, 17 Apr 2025 05:32:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F47D40E2E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F47D40E2E;
	Thu, 17 Apr 2025 05:32:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C37CCB01
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 05:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A74C2608AB
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 05:32:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id caHIwdKBz3ms for <buildroot@buildroot.org>;
 Thu, 17 Apr 2025 05:32:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 39BB060715
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39BB060715
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 39BB060715
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 05:32:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A0C4843881;
 Thu, 17 Apr 2025 05:32:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1u5Hr5-00EIs3-03;
 Thu, 17 Apr 2025 07:32:07 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: buildroot@buildroot.org,  Bernd Kuhls <bernd@kuhls.net>
References: <20250328162509.923423-1-peter@korsgaard.com>
 <0f873cea-76fb-435f-8a96-99b2d1ba7c03@rnout.be>
Date: Thu, 17 Apr 2025 07:32:06 +0200
In-Reply-To: <0f873cea-76fb-435f-8a96-99b2d1ba7c03@rnout.be> (Arnout
 Vandecappelle's message of "Wed, 16 Apr 2025 23:18:29 +0200")
Message-ID: <87ldrzz73d.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdekgeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufhfffgjkfgfgggtgfesthhqtddttderjeenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpedtfeehjeekvdeiveegkeelledvvdevfeeihffgheeugefhiedvhfelvdekgeduvdenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedujeekrdduudelrddurddufeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejkedrudduledruddrudefjedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtoheprghrnhhouhhtsehrnhhouhhtrdgsvgdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepsggvrhhnugeskhhuhhhlshdrnhgvth
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/libopenh264: security bump to
 version 2.5.1
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

Pj4+Pj4gIkFybm91dCIgPT0gQXJub3V0IFZhbmRlY2FwcGVsbGUgPGFybm91dEBybm91dC5iZT4g
d3JpdGVzOgoKID4gT24gMjgvMDMvMjAyNSAxNzoyNSwgUGV0ZXIgS29yc2dhYXJkIHdyb3RlOgog
Pj4gRml4ZXMgdGhlIGZvbGxvd2luZyBzZWN1cml0eSBpc3N1ZToKID4+IAogPj4gQ1ZFLTIwMjUt
MjcwOTE6IE9wZW5IMjY0IERlY29kaW5nIEZ1bmN0aW9ucyBIZWFwIE92ZXJmbG93IFZ1bG5lcmFi
aWxpdHkKID4+IAogPj4gQSB2dWxuZXJhYmlsaXR5IGluIHRoZSBkZWNvZGluZyBmdW5jdGlvbnMg
b2YgT3BlbkgyNjQgY29kZWMgbGlicmFyeSBjb3VsZAogPj4gYWxsb3cgYSByZW1vdGUsIHVuYXV0
aGVudGljYXRlZCBhdHRhY2tlciB0byB0cmlnZ2VyIGEgaGVhcCBvdmVyZmxvdy4KID4+IAogPj4g
VGhpcyB2dWxuZXJhYmlsaXR5IGlzIGR1ZSB0byBhIHJhY2UgY29uZGl0aW9uIGJldHdlZW4gYSBT
ZXF1ZW5jZSBQYXJhbWV0ZXIKID4+IFNldCAoU1BTKSBtZW1vcnkgYWxsb2NhdGlvbiBhbmQgYSBz
dWJzZXF1ZW50IG5vbiBJbnN0YW50YW5lb3VzIERlY29kZXIKID4+IFJlZnJlc2ggKG5vbi1JRFIp
IE5ldHdvcmsgQWJzdHJhY3Rpb24gTGF5ZXIgKE5BTCkgdW5pdCBtZW1vcnkgdXNhZ2UuICBBbgog
Pj4gYXR0YWNrZXIgY291bGQgZXhwbG9pdCB0aGlzIHZ1bG5lcmFiaWxpdHkgYnkgY3JhZnRpbmcg
YSBtYWxpY2lvdXMgYml0c3RyZWFtCiA+PiBhbmQgdHJpY2tpbmcgYSB2aWN0aW0gdXNlciBpbnRv
IHByb2Nlc3NpbmcgYW4gYXJiaXRyYXJ5IHZpZGVvIGNvbnRhaW5pbmcgdGhlCiA+PiBtYWxpY2lv
dXMgYml0c3RyZWFtLiAgQW4gZXhwbG9pdCBjb3VsZCBhbGxvdyB0aGUgYXR0YWNrZXIgdG8gY2F1
c2UgYW4KID4+IHVuZXhwZWN0ZWQgY3Jhc2ggaW4gdGhlIHZpY3RpbSdzIHVzZXIgZGVjb2Rpbmcg
Y2xpZW50IGFuZCwgcG9zc2libHksIHBlcmZvcm0KID4+IGFyYml0cmFyeSBjb21tYW5kcyBvbiB0
aGUgdmljdGltJ3MgaG9zdCBieSBhYnVzaW5nIHRoZSBoZWFwIG92ZXJmbG93LgogPj4gCiA+PiBo
dHRwczovL2dpdGh1Yi5jb20vY2lzY28vb3BlbmgyNjQvc2VjdXJpdHkvYWR2aXNvcmllcy9HSFNB
LW05OXEtNWo3eC03bTl4CiA+PiBodHRwczovL2dpdGh1Yi5jb20vY2lzY28vb3BlbmgyNjQvcmVs
ZWFzZXMvdGFnLzIuNS4xCiA+PiAKID4+IFRoZSB1cHN0cmVhbSB0YWcgbm93IGhhcyBubyAndicg
cHJlZml4LCBzbyBkcm9wIGl0IGZyb20gX1NJVEUuCiA+PiAKID4+IFNpZ25lZC1vZmYtYnk6IFBl
dGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4KCiA+IMKgQXBwbGllZCB0byAyMDI1
LjAyLngsIHRoYW5rcy4KClNob3VsZG4ndCB0aGlzIGdvIHRvIDIwMjQuMDIueCAvIDIwMjQuMTEu
eCBhcyB3ZWxsPwoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
