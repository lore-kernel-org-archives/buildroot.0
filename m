Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B79C369BD
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 14:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE7B540585;
	Sat, 19 Apr 2025 14:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RNsbJq-JaVSn; Sat, 19 Apr 2025 14:06:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A64840591
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A64840591;
	Sat, 19 Apr 2025 14:06:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D88A122F
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE32B606BE
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:06:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SRy74c2vJ80F for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 14:06:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7716C605BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7716C605BE
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7716C605BE
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:06:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3FA7B433E9;
 Sat, 19 Apr 2025 14:06:01 +0000 (UTC)
Date: Sat, 19 Apr 2025 16:05:59 +0200
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= via buildroot
 <buildroot@buildroot.org>
Message-ID: <20250419160559.3ee73fba@windsurf>
In-Reply-To: <20250414141150.994811-1-raphael.melotte@mind.be>
References: <20250414141150.994811-1-raphael.melotte@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeehvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepueetjeejveetheekvdfhheetjedvueeuueeiheeuvedvkeehuefhvddtteetuedvnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehrrghphhgrvghlrdhmvghlohhtthgvsehmihhnugdrs
 ggvpdhrtghpthhtoheprghnghgvlhhordgtohhmphgrghhnuhgttghisehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghrnhhouhhtsehrnhhouhhtrdgsvg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745071561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xBFoTq/BVclmtE2XmWu1O0JULbxVSSOJjvGVf8M/Ao4=;
 b=JavMnxNBiQrZ55YDlBZtaXBUap3WpH8w0VRkgE4liOVqYHu8nORmGTEfLFi2vi/tKgDRWd
 yaWSNtK2p5C4HmioskwaBvPJ2gHDwy8ez5OmpXdXjDpuQ974PEJOUTbOltxb8VM14r6aeV
 WIp4QXzbW/t2SokQ6VvoRk4AXFVOO5JhbyNcTZCbekwO+wf8RRa8ikx/RgPJvvHuQpRzEu
 ifqonXaPB1XDw4sfeGetB7JSPIKjYqlJEg9bVw1cxfbJ5HlcoQmO3SOX0YeRe2HzhvZyrO
 k7FjrlQWFFRrn7rgR9Sq0u5j1c1STWFMrEY2bYkUXoRUoOCxg247HdzFnX2Qcg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JavMnxNB
Subject: Re: [Buildroot] [PATCH 1/1] package/apparmor: ignore CVE-2016-1585
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUmFwaGHDq2wsCgpPbiBNb24sIDE0IEFwciAyMDI1IDE2OjExOjQ4ICswMjAwClJhcGhh
w6tsIE3DqWxvdHRlIHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90
ZToKCj4gQ1ZFLTIwMTYtMTU4NSBpcyBmaXhlZCBpbiB0aGUgZm9sbG93aW5nIHZlcnNpb25zOgo+
IGFwcGFybW9yIDMuMS42IGh0dHBzOi8vZ2l0bGFiLmNvbS9hcHBhcm1vci9hcHBhcm1vci8tL3dp
a2lzL1JlbGVhc2VfTm90ZXNfMy4xLjYKPiBhcHBhcm1vciAzLjAuMTIgaHR0cHM6Ly9naXRsYWIu
Y29tL2FwcGFybW9yL2FwcGFybW9yLy0vd2lraXMvUmVsZWFzZV9Ob3Rlc18zLjAuMTIKPiBhcHBh
cm1vciAyLjEzLjEwIGh0dHBzOi8vZ2l0bGFiLmNvbS9hcHBhcm1vci9hcHBhcm1vci8tL3dpa2lz
L1JlbGVhc2VfTm90ZXNfMi4xMy4xMAo+IAo+IFNlZSB0aGUgYnVnIHJlcG9ydCBhdCBbMV0gYW5k
IGluIHBhcnRpY3VsYXIgdGhlIGNvbW1lbnQgYXQgWzJdLgo+IAo+IFRoZSBOVkQgQ1BFIGRvZXMg
bm90IGNvbnRhaW4gdmVyc2lvbiBudW1iZXJzLCBzbyBvdXIgQ1ZFIGNoZWNrZXIgc3RpbGwKPiBy
ZXBvcnRzIGl0Lgo+IFRoZSBpc3N1ZSB3YXMgcmVwb3J0ZWQgdG8gdGhlIE5WRCBieSBlbWFpbCwg
YnV0IGluIHRoZSBtZWFudGltZSBsZXQncwo+IGlnbm9yZSBpdCB0byByZWR1Y2UgdGhlIG5vaXNl
IGluIG91ciBDVkUgY2hlY2tlci4KClRoYW5rcyBmb3IgdGhlIHBhdGNoLiBIb3dldmVyLCBJJ20g
bm90IHN1cmUgSSdtIGhhcHB5IHdpdGggaWdub3JpbmcKZW50cmllcyB0aGF0IGFyZSB1bHRpbWF0
ZWx5ICJidWdzIiBpbiB0aGUgTlZEIGRhdGFiYXNlLiBIYXZlIHlvdSBoZWFyZApiYWNrIGZyb20g
dXBzdHJlYW0gTlZEIGFib3V0IHlvdXIgcmVwb3J0PwoKSW4gZmFjdCwgSSdtIHdvcnJpZWQgYWJv
dXQgdGhpcyBBUFBBUk1PUl9JR05PUkVfQ1ZFUyBzdGF5aW5nIGZvcmV2ZXIuCkRvZXMgb3VyIHBr
Zy1zdGF0cyBzY3JpcHQgcmVwb3J0IHRob3NlIHN0YWxlIENWRSBlbnRyaWVzPyBJZiBpdCBkaWQs
CnRoZW4gd2UgY291bGQgY29uc2lkZXIgbWVyZ2luZyB5b3VyIHBhdGNoLCBiZWNhdXNlIHdlIGtu
b3cgdGhhdCBvbmNlCnRoZSBOVkQgZGF0YWJhc2UgZ2V0cyB1cGRhdGVkLCB3ZSdsbCBnZXQgYSB3
YXJuaW5nL25vdGlmaWNhdGlvbiBmcm9tCnBrZy1zdGF0cyB0aGF0IHRoaXMgQVBQQVJNT1JfSUdO
T1JFX0NWRVMgZW50cnkgc2hvdWxkIGJlIGRyb3BwZWQuCgpCZXN0IHJlZ2FyZHMsCgpUaG9tYXMK
LS0gClRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQg
TGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGlu
LmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
