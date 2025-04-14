Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E5FC369B2
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 19:42:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF02140D45;
	Mon, 14 Apr 2025 19:42:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IdTSY_BK90qD; Mon, 14 Apr 2025 19:42:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DE2A40D52
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DE2A40D52;
	Mon, 14 Apr 2025 19:42:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 69C2E205
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 19:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47BA881353
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 19:42:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HxvZUdrGo8oD for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 19:41:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8D3E88122A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D3E88122A
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8D3E88122A
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 19:41:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E3712438AD;
 Mon, 14 Apr 2025 19:41:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1u4Pgn-006Rvy-2g;
 Mon, 14 Apr 2025 21:41:53 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?Rapha=C3=ABl_M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: buildroot@buildroot.org,  Bernd Kuhls <bernd@kuhls.net>
References: <20250414133235.987304-1-raphael.melotte@mind.be>
Date: Mon, 14 Apr 2025 21:41:53 +0200
In-Reply-To: <20250414133235.987304-1-raphael.melotte@mind.be>
 (=?utf-8?Q?=22Rapha=C3=ABl=09M=C3=A9lotte=22's?= message of "Mon, 14 Apr
 2025 15:32:33 +0200")
Message-ID: <87ikn6bke6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvddugedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufhfffgjkfgfgggtgfesthhqtddttderjeenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpedtfeehjeekvdeiveegkeelledvvdevfeeihffgheeugefhiedvhfelvdekgeduvdenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedujeekrdduudelrddurddufeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejkedrudduledruddrudefjedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtoheprhgrphhhrggvlhdrmhgvlhhothhtvgesmhhinhgurdgsvgdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepsggvrhhnugeskhhuhhhlshdrnhgvth
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/libopenh264: ignore
 CVE-2025-27091
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

Pj4+Pj4gIlJhcGhhw6tsIiA9PSBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1p
bmQuYmU+IHdyaXRlczoKCiA+IEJvdGggb3BlbmgyNjQgMi42LjAgYW5kIDIuNS4xIGNvbnRhaW4g
dGhlIGZpeCBmb3IgdGhpcyBDVkUgKHNlZSB0aGUKID4gcmVsZWFzZSBub3RlcyBhdCBbMV0pLgoK
ID4gSW4gb3RoZXIgd29yZHMgdGhlIHZlcnNpb24gd2UgaGF2ZSBpcyBubyBsb25nZXIgdnVsbmVy
YWJsZSBzaW5jZQogPiBhN2FlYjVhNDZlYWFmOGEzOTU2MGM4NjY0NTkzMDE4Y2YyNTM4MzVhICgi
cGFja2FnZS9saWJvcGVuaDI2NDoKID4gc2VjdXJpdHkgYnVtcCB0byB2ZXJzaW9uIDIuNS4xIikg
YnV0IHBrZy1zdGF0cyBzdGlsbCByZXBvcnRzIGl0LgoKID4gQW4gZW1haWwgd2FzIHNlbnQgdG8g
dGhlIE5WRCB0byBmaXggdGhlIENQRSB2ZXJzaW9uIG51bWJlciwgYnV0IGluIHRoZQogPiBtZWFu
dGltZSBsZXQncyBpZ25vcmUgaXQgdG8gcmVkdWNlIHRoZSBub2lzZSBpbiBvdXIgQ1ZFIGNoZWNr
ZXIuCgogPiBbMV06IGh0dHBzOi8vZ2l0aHViLmNvbS9jaXNjby9vcGVuaDI2NC9yZWxlYXNlcy90
YWcvMi41LjEKCiA+IFNpZ25lZC1vZmYtYnk6IFJhcGhhw6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1l
bG90dGVAbWluZC5iZT4KCkNvbW1pdHRlZCwgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dh
YXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
