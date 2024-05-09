Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C69E1C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 20:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9798761387;
	Thu,  9 May 2024 20:51:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1rBFlWUNm5qC; Thu,  9 May 2024 20:51:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9824561389
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9824561389;
	Thu,  9 May 2024 20:51:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C7B1C1BF31C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B447E6137C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:51:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0r7jlnyEC-h0 for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 20:51:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 76FDB61307
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76FDB61307
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 76FDB61307
 for <buildroot@buildroot.org>; Thu,  9 May 2024 20:51:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D642260002;
 Thu,  9 May 2024 20:51:27 +0000 (UTC)
Date: Thu, 9 May 2024 22:51:26 +0200
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Message-ID: <20240509225126.6b340d1a@windsurf>
In-Reply-To: <20240426215144.1107186-1-fiona.klute@gmx.de>
References: <20240426215144.1107186-1-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715287888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wMcWgKdVe+TrutZILDvIF8/i3Xp1ihOpOr3DZPcWVXs=;
 b=RKVpPzYcc8clPXbPY8wVZgbtHeAL8gHZuwIO/k21/NF+LMe9kkaicjdSIBjCvD92fE7OLP
 dbvlcMxZ+9Jpnv/GhD/ag94IsASgDO80YBkg7HlYyW7cLTF88HUTPibAg/DjIzvUFA1FPZ
 zBzrk7uDk8lsXBO/o2ema773rZXPXR9ZCZk6fCZDDmbArD5Gig1wnrHGI6JCO72FWugg1b
 hIz1tqlS3z26dGOrQWdOb5FPhAvhES667krpKRuGrmg6qgtNdRcYgNpAdwPLEbJ7+fKsCB
 JS9RiwpCrfK9wYL1OaNhHukiIp36md+Ks+f/Ah2i15mY134df1Lqn89/1ba6Jg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RKVpPzYc
Subject: Re: [Buildroot] [PATCH 1/1] package/kmod: fix build with musl
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRmlvbmEsCgpPbiBGcmksIDI2IEFwciAyMDI0IDIzOjUxOjQ0ICswMjAwCkZpb25hIEts
dXRlIHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90ZToKCj4gRnJv
bTogRmlvbmEgS2x1dGUgPGZpb25hLmtsdXRlK3dpd2FAZ214LmRlPgo+IAo+IFBhdGNoIGZyb20g
dXBzdHJlYW0gUFIgc3RpbGwgYmVpbmcgZGlzY3Vzc2VkOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9r
bW9kLXByb2plY3Qva21vZC9wdWxsLzMyCj4gCj4gU2lnbmVkLW9mZi1ieTogRmlvbmEgS2x1dGUg
PGZpb25hLmtsdXRlK3dpd2FAZ214LmRlPgoKVGhhbmtzIGZvciB0aGUgcGF0Y2guIE9uZSB0aGlu
ZyB0aGF0IEkgZmluZCBzdHJhbmdlIGlzIHRoYXQgSSBjYW5ub3QKcmVwcm9kdWNlLiBZZXMsIEkg
Z2V0IHdhcm5pbmdzIGR1ZSB0byBiYXNlbmFtZSgpLCBidXQgbm90IGFuIGFjdHVhbApidWlsZCBm
YWlsdXJlIChJJ20gdXNpbmcgYSB0b29sY2hhaW4gYmFzZWQgb24gbXVzbCAxLjIuNSkuIFRoZXJl
IGFyZQphbHNvIG5vIGJ1aWxkIGZhaWx1cmVzIGluIG91ciBhdXRvYnVpbGRlcnMuCgpIZXJlIGlz
IHRoZSBkZWZjb25maWcgdGhhdCBJIHRlc3RlZDoKCkJSMl9hcm09eQpCUjJfY29ydGV4X2E5PXkK
QlIyX0FSTV9FTkFCTEVfVkZQPXkKQlIyX1RPT0xDSEFJTl9FWFRFUk5BTD15CkJSMl9UT09MQ0hB
SU5fRVhURVJOQUxfQk9PVExJTj15CkJSMl9UT09MQ0hBSU5fRVhURVJOQUxfQk9PVExJTl9BUk1W
N19FQUJJSEZfTVVTTF9TVEFCTEU9eQpCUjJfSU5JVF9OT05FPXkKQlIyX1NZU1RFTV9CSU5fU0hf
Tk9ORT15CiMgQlIyX1BBQ0tBR0VfQlVTWUJPWCBpcyBub3Qgc2V0CkJSMl9QQUNLQUdFX0tNT0Q9
eQpCUjJfUEFDS0FHRV9LTU9EX1RPT0xTPXkKIyBCUjJfVEFSR0VUX1JPT1RGU19UQVIgaXMgbm90
IHNldAoKSSBqdXN0IGdldDoKCnRvb2xzL2ttb2QuYzogSW4gZnVuY3Rpb24g4oCYa21vZF9oZWxw
4oCZOgp0b29scy9rbW9kLmM6NzE6NDA6IHdhcm5pbmc6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9m
IGZ1bmN0aW9uIOKAmGJhc2VuYW1l4oCZIFstV2ltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9u
XQogICA3MSB8ICAgICAgICAgICAgICAgICAgICAgICAgICJDb21tYW5kczpcbiIsIGJhc2VuYW1l
KGFyZ3ZbMF0pKTsKICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBefn5+fn5+fgp0b29scy9rbW9kLmM6NzE6NDA6IHdhcm5pbmc6IG5lc3RlZCBleHRlcm4gZGVj
bGFyYXRpb24gb2Yg4oCYYmFzZW5hbWXigJkgWy1XbmVzdGVkLWV4dGVybnNdCnRvb2xzL2ttb2Qu
Yzo2NToxNjogd2FybmluZzogZm9ybWF0IOKAmCVz4oCZIGV4cGVjdHMgYXJndW1lbnQgb2YgdHlw
ZSDigJhjaGFyICrigJksIGJ1dCBhcmd1bWVudCAyIGhhcyB0eXBlIOKAmGludOKAmSBbLVdmb3Jt
YXQ9XQogICA2NSB8ICAgICAgICAgcHJpbnRmKCJrbW9kIC0gTWFuYWdlIGtlcm5lbCBtb2R1bGVz
OiBsaXN0LCBsb2FkLCB1bmxvYWQsIGV0Y1xuIgogICAgICB8ICAgICAgICAgICAgICAgIF5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgouLi4u
Li4KICAgNzEgfCAgICAgICAgICAgICAgICAgICAgICAgICAiQ29tbWFuZHM6XG4iLCBiYXNlbmFt
ZShhcmd2WzBdKSk7CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfn5+fn5+fn5+fn5+fn5+fn4KICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgaW50CgoKVGhvdWdodHM/CgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIGNvLW93bmVy
IGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBh
bmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
