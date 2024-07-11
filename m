Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE8AC3DA45
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 20:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1FB9607E4;
	Thu, 11 Jul 2024 20:00:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 87OpvZHfPO5l; Thu, 11 Jul 2024 20:00:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB7C160EA7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB7C160EA7;
	Thu, 11 Jul 2024 20:00:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1295C1BF479
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 20:00:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0020D60EA7
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 20:00:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ffK27alvP-Kp for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 20:00:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DCFC4607E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCFC4607E4
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DCFC4607E4
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 20:00:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 614111C0005;
 Thu, 11 Jul 2024 20:00:42 +0000 (UTC)
Date: Thu, 11 Jul 2024 22:00:40 +0200
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= via buildroot
 <buildroot@buildroot.org>
Message-ID: <20240711220040.22319e31@windsurf>
In-Reply-To: <20240617080310.2433521-1-raphael.melotte@mind.be>
References: <20240617080310.2433521-1-raphael.melotte@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720728043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qyaudh4crI9NiJpzbN+zn5L1cQCutgXwnGD4M9SX92U=;
 b=WG9vSzf0foQYPZPHRIwwEADiPdmugi4fpXeLbGxh4EP6jcFyOrpWEmaNbDCER2Fn6mql1y
 qV5CrTkQvFMIGuY8Y1cwhlCEeB3Ff3SQkjnTKxgpTjPWiM7An/BYYaCgoY+M8yKzoow92a
 HmZdgZgMJC28BMgcwsDR+pRIO7Qu1s1BCo/QVnq7grV8u4njXoARVRZHHq2TBgGxMglccx
 jtiDvtcrwWD7PXQI9I4v2QV1mWsGwDEX9NU5HWLHCDtFiHloHl9Wu8tXZBF4YoxPE7/icE
 NP4Yf9150EZC1xS6TDOWdu0EURAs5q8YV9e7RHogxHezPcq98y/xQ0rUwOJBIg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WG9vSzf0
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: fix compiling with
 headers < 4.14
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
Cc: Sen Hastings <sen@hastings.org>, Norbert Lange <nolange79@gmail.com>,
 =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCAxNyBKdW4gMjAyNCAxMDowMzowOSArMDIwMApSYXBoYcOrbCBNw6lsb3R0ZSB2aWEg
YnVpbGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cgo+IEluIGNvbW1pdCAz
NjBhN2NkNzM4YTg1MDY3YmE2MGIwMjljYTg4ZWI3Yzg3NGJmZTRmICgicGFja2FnZS9zeXN0ZW1k
Ogo+IGJ1bXAgbGludXgtaGVhZGVycyBkZXBlbmRlbmN5IHRvIDQuMTQiKSwgdGhlIGhlYWRlcnMg
cmVxdWlyZW1lbnRzIHdlcmUKPiBidW1wZWQgdG8gNC4xNCBiZWNhdXNlIG9mIG5ldyBidWlsZCBm
YWlsdXJlcyBkdWUgdG8KPiBMT09QX1NFVF9CTE9DS19TSVpFLgo+IAo+IEV2ZW4gdGhvdWdoIHN5
c3RlbWQgZG9lcyBub3QgcmVjb21tZW5kIHVzaW5nIGl0IHdpdGggaGVhZGVycyA8Cj4gNC4xNSAo
c2VlIFsxXSksIGl0IGlzIHN0aWxsIHBvc3NpYmxlIHRvIGJ1aWxkIGl0IGFuZCB1c2Ugc29tZSBv
ZiBpdHMKPiBmZWF0dXJlcyAoYWZ0ZXIgZml4aW5nIHRoZSBidWlsZCBmYWlsdXJlKS4KPiAKPiBO
b3RlIHRoYXQgdGhpcyB3YXMgYnVpbGQtdGVzdGVkIHdpdGggNC40IGhlYWRlcnMgb25seSwgYW5k
IG5vdCBhbGwgdGhlCj4gd2F5IGJhY2sgdG8gMy4xNSAod2hpY2ggaXMgdGhlIHZlcnNpb24gcmVx
dWlyZW1lbnQgdGhhdCB3YXMgdXNlZAo+IGJlZm9yZSAzNjBhN2NkNzM4YTg1MDY3YmE2MGIwMjlj
YTg4ZWI3Yzg3NGJmZTRmKS4KPiAKPiBbMV06IGh0dHBzOi8vZ2l0aHViLmNvbS9zeXN0ZW1kL3N5
c3RlbWQvYmxvYi9tYWluL1JFQURNRQo+IAo+IFNpZ25lZC1vZmYtYnk6IFJhcGhhw6tsIE3DqWxv
dHRlIDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT4KPiAtLS0KPiAgLi4uZ19sb29wLmgtZml4LW1p
c3NpbmctTE9PUF9TRVRfQkxPQ0tfLnBhdGNoIHwgNDAgKysrKysrKysrKysrKysrKysrKwo+ICBw
YWNrYWdlL3N5c3RlbWQvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgfCAgNyArKy0tCj4g
IHN5c3RlbS9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA2ICstLQo+
ICAzIGZpbGVzIGNoYW5nZWQsIDQ3IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3N5c3RlbWQvMDAwMS1zcmMtYmFzaWMtbWlzc2luZ19s
b29wLmgtZml4LW1pc3NpbmctTE9PUF9TRVRfQkxPQ0tfLnBhdGNoCgpBcHBsaWVkIHRvIG1hc3Rl
ciwgYWZ0ZXIgcmVmcmVzaGluZyB0aGUgcGF0Y2ggc28gdGhhdCBpdCBhcHBsaWVzIG9uIHRoZQpj
dXJyZW50IHZlcnNpb24gb2Ygc3lzdGVtZCB3ZSBoYXZlIHBhY2thZ2VkLCBhbmQgdXBkYXRpbmcg
dGhlIFVwc3RyZWFtOgp0YWcgb2YgdGhlIHBhdGNoIHRvIHBvaW50IHRvIHRoZSB1cHN0cmVhbSBj
b21taXQsIG5vdyB0aGF0IHlvdXIgcHVsbApyZXF1ZXN0IGhhcyBiZWVuIGFjY2VwdGVkIHVwc3Ry
ZWFtLgoKVGhhbmtzIGEgbG90IQoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBDVE8sIEJv
b3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3Rs
aW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
