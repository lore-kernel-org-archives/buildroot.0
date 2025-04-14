Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C3FC369B2
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 13:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAAC66F65A;
	Mon, 14 Apr 2025 13:24:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ouw5XSRXAd9x; Mon, 14 Apr 2025 13:24:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4470060AD6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4470060AD6;
	Mon, 14 Apr 2025 13:24:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DB72DE
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 13:24:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 33A0F81B48
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 13:24:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4K3qLzCL9XP8 for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 13:24:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B231781589
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B231781589
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B231781589
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 13:23:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EA8F04385D;
 Mon, 14 Apr 2025 13:23:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1u4Jn1-005U3f-0P;
 Mon, 14 Apr 2025 15:23:55 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Scott Fan <fancp2007@gmail.com>
Cc: buildroot@buildroot.org, Titouan Christophe <titouanchristophe@gmail.com>
References: <20250414060233.3292625-1-fancp2007@gmail.com>
Date: Mon, 14 Apr 2025 15:23:55 +0200
In-Reply-To: <20250414060233.3292625-1-fancp2007@gmail.com> (Scott Fan's
 message of "Mon, 14 Apr 2025 14:02:31 +0800")
Message-ID: <87tt6qkhas.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvddtieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufhfffgjkfgfgggtgfesthhqtddttderjeenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpedtfeehjeekvdeiveegkeelledvvdevfeeihffgheeugefhiedvhfelvdekgeduvdenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedujeekrdduudelrddurddufeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejkedrudduledruddrudefjedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehfrghntghpvddttdejsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhithhouhgrnhgthhhrihhsthhophhhvgesghhmrghilhdrtghomh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/mosquitto: security bump to version
 2.0.21
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

Pj4+Pj4gIlNjb3R0IiA9PSBTY290dCBGYW4gPGZhbmNwMjAwN0BnbWFpbC5jb20+IHdyaXRlczoK
CiA+IEZpeGVzIHRoZSBmb2xsb3dpbmcgc2VjdXJpdHkgaXNzdWVzOgogPiAtIEZpeCBsZWFrIG9u
IG1hbGljaW91cyBTVUJTQ1JJQkUgYnkgYXV0aGVudGljYXRlZCBjbGllbnQuCiA+ICAgQ2xvc2Vz
IGVjbGlwc2UgIzI0OC4KID4gLSBGdXJ0aGVyIGZpeCBmb3IgQ1ZFLTIwMjMtMjgzNjYuCgogPiBB
bHNvIGRyb3AgdGhlIHBhdGNoIHRoYXQgd2FzIGZpeGVkIGluIHRoZSB2Mi4wLjIxLCBzZWUgdGhl
IGNsb3NlZCBpc3N1ZXM6CiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9lY2xpcHNlLW1vc3F1aXR0by9t
b3NxdWl0dG8vaXNzdWVzLzMxODMKID4gaHR0cHM6Ly9naXRodWIuY29tL2VjbGlwc2UtbW9zcXVp
dHRvL21vc3F1aXR0by9pc3N1ZXMvMzE5MwoKID4gRm9yIG1vcmUgZGV0YWlscywgc2VlIHRoZSBj
aGFuZ2Vsb2c6CiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9lY2xpcHNlLW1vc3F1aXR0by9tb3NxdWl0
dG8vYmxvYi92Mi4wLjIxL0NoYW5nZUxvZy50eHQKCiA+IFNpZ25lZC1vZmYtYnk6IFNjb3R0IEZh
biA8ZmFuY3AyMDA3QGdtYWlsLmNvbT4KCkl0IHVuZm9ydHVuYXRlbHkgc2VlbXMgdG8gYmUgYnJv
a2VuIGZvciBub24tb3BlbnNzbCBidWlsZHM6Cgphcm0tbm9uZS1saW51eC1nbnVlYWJpaGYtZ2Nj
IC1EX0xBUkdFRklMRV9TT1VSQ0UgLURfTEFSR0VGSUxFNjRfU09VUkNFIC1EX0ZJTEVfT0ZGU0VU
X0JJVFM9NjQgLUkuIC1JLi4gLUkuLi9pbmNsdWRlIC1JLi4vLi4vaW5jbHVkZSAtSS4uL2xpYiAt
RFdJVEhfQlJJREdFIC1EV0lUSF9QRVJTSVNURU5DRSAtRFdJVEhfTUVNT1JZX1RSQUNLSU5HIC1E
V0lUSF9TWVNfVFJFRSAtRFdJVEhfRUMgLURXSVRIX0FETlMgLURXSVRIX0NPTlRST0wgLURXSVRI
X1VOSVhfU09DS0VUUyAtRFdJVEhfRVBPTEwgLUkuLi9kZXBzIC1EX0xBUkdFRklMRV9TT1VSQ0Ug
LURfTEFSR0VGSUxFNjRfU09VUkNFIC1EX0ZJTEVfT0ZGU0VUX0JJVFM9NjQgIC1PMiAtZzAgLURf
Rk9SVElGWV9TT1VSQ0U9MSAtRFZFUlNJT049IlwiMi4wLjIxXCIiIC1EV0lUSF9CUk9LRVIgLWMg
Y29uZi5jIC1vIGNvbmYubwpjb25mLmM6IEluIGZ1bmN0aW9uIOKAmGNvbmZpZ19fY2hlY2vigJk6
CmNvbmYuYzoyMzE4OjU0OiBlcnJvcjog4oCYc3RydWN0IG1vc3F1aXR0b19fbGlzdGVuZXLigJkg
aGFzIG5vIG1lbWJlciBuYW1lZCDigJhjYWZpbGXigJkKIDIzMTggfCAgICAgICAgICAgICAgICAg
IGJvb2wgY2FmaWxlID0gISFjb25maWctPmxpc3RlbmVyc1tpXS5jYWZpbGU7CiAgICAgIHwgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCmNvbmYu
YzoyMzE5OjU0OiBlcnJvcjog4oCYc3RydWN0IG1vc3F1aXR0b19fbGlzdGVuZXLigJkgaGFzIG5v
IG1lbWJlciBuYW1lZCDigJhjYXBhdGjigJkKIDIzMTkgfCAgICAgICAgICAgICAgICAgIGJvb2wg
Y2FwYXRoID0gISFjb25maWctPmxpc3RlbmVyc1tpXS5jYXBhdGg7CiAgICAgIHwgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCmNvbmYuYzoyMzIw
OjU2OiBlcnJvcjog4oCYc3RydWN0IG1vc3F1aXR0b19fbGlzdGVuZXLigJkgaGFzIG5vIG1lbWJl
ciBuYW1lZCDigJhjZXJ0ZmlsZeKAmQogMjMyMCB8ICAgICAgICAgICAgICAgICAgYm9vbCBjZXJ0
ZmlsZSA9ICEhY29uZmlnLT5saXN0ZW5lcnNbaV0uY2VydGZpbGU7CiAgICAgIHwgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KY29uZi5jOjIz
MjE6NTU6IGVycm9yOiDigJhzdHJ1Y3QgbW9zcXVpdHRvX19saXN0ZW5lcuKAmSBoYXMgbm8gbWVt
YmVyIG5hbWVkIOKAmGtleWZpbGXigJkKIDIzMjEgfCAgICAgICAgICAgICAgICAgIGJvb2wga2V5
ZmlsZSA9ICEhY29uZmlnLT5saXN0ZW5lcnNbaV0ua2V5ZmlsZTsKICAgICAgfCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCgpFLkcuIHdpdGgg
dGhlIGZvbGxvd2luZyBkZWZjb25maWc6CgpjYXQgZGVmY29uZmlnCkJSMl9hcm09eQpCUjJfY29y
dGV4X2E3PXkKQlIyX1RPT0xDSEFJTl9FWFRFUk5BTD15CkJSMl9QQUNLQUdFX01PU1FVSVRUTz15
CgpJdCBsb29rcyBsaWtlIHNvbWUgY29kZSBpcyBtaXNzaW5nIHRoZSBXSVRIX1RMUyBjb25kaXRp
b25hbC4gQ2FyZSB0bwpoYXZlIGEgbG9vayBhdCBmaXhpbmcgdGhhdD8KCi0tIApCeWUsIFBldGVy
IEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
