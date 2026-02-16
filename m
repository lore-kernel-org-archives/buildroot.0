Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0851CE7BDB8
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 12:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A360560B67;
	Mon, 16 Feb 2026 12:59:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1EQYRxpCb65T; Mon, 16 Feb 2026 12:59:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1DBD60B5F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771246771;
	bh=qoCrWNp0jSKFaWuv14hB3Th/WsFklQAV1JZi7Ea9IAY=;
	h=Date:Cc:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=B+WLxCpxRpsAkHAVKHhxKqTbjMmoPGr8AypP/vCBfnpK7higtWM261+Bd2YdUfCPi
	 yy4c+oBHJsHEZAq/Z0CLulVBChdUmM54cjMgOpSEdH12jbmlZp1ddONefhCarSc5Zi
	 D/tP9KAadv51BjJXhcNr8ig2giMZA/quqEGmKVrvjQtwlrOHUqGa9A+rW9DLpTGzaQ
	 4I24bZkRSgCATPdD6F0MLnAWAMzy1jJMwDyuxIqV9b0nyf/LbVhREIR94K5KH7oVGD
	 DSmtwZ9An9+7TBnH8uPva6EiJNsAgoWEVjdPxf3aBDJF8l9EYKx1tvvbRQ+AoSCE9g
	 ja/n+OAY/KXTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1DBD60B5F;
	Mon, 16 Feb 2026 12:59:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DD1735B
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 12:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F39D440BE0
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 12:59:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C2yEantY-kGv for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 12:59:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1016B40BD2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1016B40BD2
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1016B40BD2
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 12:59:28 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id B5B3B1A0FBD
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 12:59:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8C50B606CF
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 12:59:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BC29D10369137; Mon, 16 Feb 2026 13:59:24 +0100 (CET)
Mime-Version: 1.0
Date: Mon, 16 Feb 2026 13:59:24 +0100
Message-Id: <DGGEKQ9KMK68.2QOAAZOR2M5YV@bootlin.com>
Cc: <buildroot@buildroot.org>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260216-openscap_cpp-v1-1-3372149da5b0@bootlin.com>
 <aZLpW6VY-EmXGyn-@windsurf>
In-Reply-To: <aZLpW6VY-EmXGyn-@windsurf>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1771246765; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=71hEQmzVCvSXJtn3ODm8e8EvEsLLKSN8sI6+wNP0+Sk=;
 b=wVIYf8XifFwWYIFgMaXw0NusXuZqza85HI8z99gJMRAqIhzm4U2iCEyNTZ7n5/Y8p6el/3
 KAeySgsuKuSxMV42xdtl7cWnXB5zA7NCOOhD5STnOe4lc+T8vW4mwPnR6nH4F3QZd1yoWQ
 NCToGIbyK/Okk8y7SrkZYVY+t97vB2p1z9tyMh23JUywKe6tbf2W27Vd37ph4BfFWjMUOS
 KmuQsRDCBHpyL4QNXPCxnQU2VLQFgHbTbJ4NlI5ExdfTL7NeGsU7mKXAzi9pjnsExpFKMa
 /5LSlUWSyFDLNXJkGJd8p4pii8he+DjdabXKCXAqX7ea4HsSikvaS8q/YGVAYw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=wVIYf8Xi
Subject: Re: [Buildroot] [PATCH] package/openscap: set dependency on C++
 support
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uIEZlYiAxNiwgMjAyNiBhdCAxMDo1NiBBTSBDRVQsIFRob21hcyBQZXRhenpvbmkgd3Jv
dGU6Cj4gSGVsbG8gQWxleGlzLAo+Cj4gVGhhbmtzIGZvciB0aGUgZml4IQo+Cj4gT24gTW9uLCBG
ZWIgMTYsIDIwMjYgYXQgMTA6NDA6NDJBTSArMDEwMCwgQWxleGlzIExvdGhvcsOpIHdyb3RlOgo+
PiBXaGVuIHRoZSB0b29sY2hhaW4gaW52b2x2ZWQgaW4gb3BlbnNjYXAgYnVpbGQgZG9lcyBub3Qg
c3VwcG9ydCBDKyssIHRoZQo+PiBjb25maWd1cmUgc3RlcCBmYWlscyB3aXRoIHRoZSBmb2xsb3dp
bmcgZXJyb3I6Cj4+IAo+PiAgIC0tIERldGVjdGluZyBDWFggY29tcGlsZXIgQUJJIGluZm8KPj4g
ICAtLSBEZXRlY3RpbmcgQ1hYIGNvbXBpbGVyIEFCSSBpbmZvIC0gZmFpbGVkCj4+ICAgLS0gQ2hl
Y2sgZm9yIHdvcmtpbmcgQ1hYIGNvbXBpbGVyOiAvYmluL2ZhbHNlCj4+ICAgLS0gQ2hlY2sgZm9y
IHdvcmtpbmcgQ1hYIGNvbXBpbGVyOiAvYmluL2ZhbHNlIC0gYnJva2VuCj4+ICAgQ01ha2UgRXJy
b3IgYXQgL3Vzci9zaGFyZS9jbWFrZS9Nb2R1bGVzL0NNYWtlVGVzdENYWENvbXBpbGVyLmNtYWtl
OjczIChtZXNzYWdlKToKPj4gICAgIFRoZSBDKysgY29tcGlsZXIKPgo+IEZyb20gYSBxdWljayBs
b29rLCBpdCBkb2Vzbid0IHNlZW0gbGlrZSBvcGVuc2NhcCBjb250YWlucyBDKysgY29kZS4gU28K
PiBpbnN0ZWFkIHRoZSByaWdodCBmaXggaXMgbW9zdCBsaWtlbHkgdG8gY2hhbmdlIENNYWtlTGlz
dHMudHh0IHRvIGNoZWNrCj4gZm9yIHRoZSBDIGNvbXBpbGVyIG9ubHkuCj4KPiBUbyBkbyB0aGF0
LCBpbiBDTWFrZUxpc3RzLnR4dCwgY2hhbmdlOgo+Cj4gcHJvamVjdChibGFibGEpCj4KPiB0bwo+
Cj4gcHJvamVjdChibGFibGEgQykKCkdvb2QgcG9pbnQsIHRoYW5rcy4gSSdsbCBzZW5kIHRoaXMg
Zml4IHRvIHRoZSB1cHN0cmVhbSBwcm9qZWN0LiBBcwp0aGUgcGFja2FnZSBpcyBub3cgaW50ZWdy
YXRlZCBpbiBtYXN0ZXIgKGFuZCBzbyB0cmlnZ2VyaW5nIGZhaWx1cmVzCmV2ZXJ5IGRheSBpbiB0
aGUgYXV0b2J1aWxkZXIpLCBJIGd1ZXNzIGl0IGlzIG9rIHRvIGZvbGxvdy11cCB3aXRoIGEgdjIK
YnJpbmdpbmcgdGhlIGNvcnJlc3BvbmRpbmcgcGF0Y2ggc3VibWl0dGVkIG9uIHRoZSB1cHN0cmVh
bSBwcm9qZWN0LCBldmVuCmlmIG5vdCBtZXJnZWQgeWV0ID8KCkFsZXhpcwoKCi0tIApBbGV4aXMg
TG90aG9yw6ksIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpo
dHRwczovL2Jvb3RsaW4uY29tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
