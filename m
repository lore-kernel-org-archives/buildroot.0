Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C025C54ED1
	for <buildroot@archiver.kernel.org>; Sat, 28 Jun 2025 15:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2395F6088D;
	Sat, 28 Jun 2025 15:25:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cgs_WN8cBKH9; Sat, 28 Jun 2025 15:25:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F491608B5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F491608B5;
	Sat, 28 Jun 2025 15:25:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D78871C9
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 15:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C863E608B5
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 15:25:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g1QHXXr7buNm for <buildroot@buildroot.org>;
 Sat, 28 Jun 2025 15:25:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D6BE46088D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6BE46088D
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D6BE46088D
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 15:25:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 7F526B00548;
 Sat, 28 Jun 2025 17:25:38 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 28 Jun 2025 17:25:38 +0200
MIME-Version: 1.0
Date: Sat, 28 Jun 2025 17:25:38 +0200
To: =?UTF-8?Q?Rapha=C3=ABl_M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20250626111922.1851579-1-raphael.melotte@mind.be>
References: <20250626111922.1851579-1-raphael.melotte@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <cf2bc1b78c3e215d3313450ba34fed9c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751124339;
 bh=RK2IholyGjWvRE0VNgOycIa0diqSR8gUp28/RSJRgZw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZqJm/iLShvf/MfRYbAxLsjbRT4Efpa/sS4GR+/pt4vCqL/MkXosIr4LIU3d8qLh3/
 f1dCCjo+qcG3qRUwDlFBWDDsbNxIpk3KBhn4GC44b3noqHQRwDf7XmBAaNdWVhAI1q
 bRVaTBMQ6YOKfCcsPoCO5Bs+L1LE7Ky3yiFnYnqw0NweMk7hgyYKSrB0/MhTiRGvAH
 Jp9ld8sD3sVcaNbjd/tCQsgw/nnRhyrVOviMOT01yqrURAulxR6xIE/sYn214K+1Rw
 fztpgwOV4xQEHqhP9sMsRbDQQz7oT42dgA1Z1aPdIsi4tdQk+4b/wrBstCRUTHkhfP
 aEWzmpdzaHi0Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ZqJm/iLS
Subject: Re: [Buildroot] [PATCH 1/3] package/gumbo-parser: update upstream
 repository
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjYvMDYvMjAyNSAxMzoxOSwgUmFwaGHDq2wgTcOpbG90dGUgdmlhIGJ1aWxkcm9vdCB3cm90
ZToKPiBEZXZlbG9wbWVudCBvbiBHb29nbGUncyBHaXRIdWIgcmVwb3NpdG9yeSBoYXMgc3RvcHBl
ZCBhIGxvbmcgdGltZSBhZ28uCj4gQSBmb3JrIGV4aXN0cyBvbiBDb2RlYmVyZywgYW5kIG11bHRp
cGxlIGRpc3RyaWJ1dGlvbnMgKEZlZG9yYSwgQXJjaAo+IExpbnV4LCAuLi4pIGFyZSBhbHJlYWR5
IHVzaW5nIGl0IChzZWUgWzFdKS4KPiAKPiBVcGRhdGUgdGhlIHNvdXJjZSBVUkwgdG8gdXNlIHRo
ZSBuZXcgdXBzdHJlYW0gbG9jYXRpb24uCj4gCj4gVGhlIG5ldyB1cHN0cmVhbSBoYXMgYSBkaWZm
ZXJlbnQgaGFzaCBmb3IgdGhlIDAuMTAuMSB0YXJiYWxsLCBzbwo+IHVwZGF0ZSBpdCBhcyB3ZWxs
Lgo+IAo+IFsxXTogaHR0cHM6Ly9yZXBvbG9neS5vcmcvcHJvamVjdC9ndW1iby1wYXJzZXIvdmVy
c2lvbnMKPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxv
dHRlQG1pbmQuYmU+CgpTZXJpZXMgYXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCkZvciBpbmZv
LCBJIGZpeGVkIHRoZSBsaWNlbnNlIGZpbGUgcGF0aC4gU2VlOgpodHRwczovL2dpdGxhYi5jb20v
YnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvNWMxOGViMWE1NWRiZWM0YjZiZjRiN2Qw
YTlhNGZhMDMzN2NjYzVkOAoKQmVzdCByZWdhcmRzLAoKSnVsaWVuLgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
