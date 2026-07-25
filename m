Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D896EC531C9
	for <buildroot@archiver.kernel.org>; Sat, 25 Jul 2026 09:46:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 289C140702;
	Sat, 25 Jul 2026 09:46:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fosiuk4BvvuP; Sat, 25 Jul 2026 09:46:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23681406F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784972776;
	bh=SD4rzBlQOC8/KAr9B+uj6XyITewwIh1H/ewbnLWKqGU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kXG9DG9RvbuluWNUZWEfYLpLCd0j7rgoTX5RVrv8hmCLM4W5fu0e7m4Uc/J96JqVw
	 S7Aqg+Nbh978xbhx1IXyOM/N/ZPDjxhkXd/v+x/VhZeTJ7RMWsw+btIZlpOIRum41j
	 jPFlitHWa7sQxDkMIyCTOpdrNVSi5fNsAppuvmWFVPE+L0aUnM/+i6Han/UkV9jah9
	 Ye4bJocSccL1CgFF/VgoRvI6umWi1/RjZOLOk/6XRQifWLs9FWhbLPkwUAsceWwb7/
	 gWGbqBbvXIRYZO3bfVKRco91v5nmE2EcGy02EDEoo/Uayy5qc1SmuSyjbpxABDS84p
	 6eQkni/8G4LxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23681406F1;
	Sat, 25 Jul 2026 09:46:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D9F326C
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 09:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5362A60681
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 09:46:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tXDeO4jTQ4YV for <buildroot@buildroot.org>;
 Sat, 25 Jul 2026 09:46:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E41096066F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E41096066F
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E41096066F
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 09:46:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id CFEA478034D;
 Sat, 25 Jul 2026 11:46:09 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Jul 2026 11:46:09 +0200
MIME-Version: 1.0
Date: Sat, 25 Jul 2026 11:46:09 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260724172124.319019-1-bernd@kuhls.net>
References: <20260724172124.319019-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <2615844c06fe46a963013c0c4c456f1d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784972770;
 bh=yVt4RkNC/W8dh4A1seSe5Z7XbH3njBuX7fZuqk0xLFM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MJPpPAyN4YYGm0+zCLnn/HHq4Ooa5uJXREyFwZT168hqq8JJypfFdC6HQR4edLm/i
 2qakXoArWYm75s5/KVtT6W+tGeag7K7TccvHelRByD6aNhrWEYd3r/h/X4ycIa0tqN
 SyABBJVYt290DEbXyxBMtAF6c/y5wNPw5cI408larL0aUu9Yy+UEb9V3el2qoz+d3J
 VUjkzp0VwDVqOt0ljh1hfc/+kPv4ZVPHa3IrMf2lDyH3IteCxdnFAwDDk+Ehqw9Or6
 1k+4/OY340ylbHirsgugwl8cbNMZjejqHgQqc6OmToAGa7Q36gdcDqk4M27TjqyuR4
 PuDOCbRsoD8Nw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=MJPpPAyN
Subject: Re: [Buildroot] [PATCH 1/1] package/libheif: security bump version
 to 1.23.1
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

T24gMjQvMDcvMjAyNiAxOToyMSwgQmVybmQgS3VobHMgd3JvdGU6Cj4gaHR0cHM6Ly9naXRodWIu
Y29tL3N0cnVrdHVyYWcvbGliaGVpZi9yZWxlYXNlcy90YWcvdjEuMjMuMQo+IAo+IEZpeGVzIHRo
ZSBmb2xsb3dpbmcgQ1ZFczoKPiAKPiBDVkUtMjAyNi02MjI4OSAoR0hTQS1qYzhmLXAyM3AtNWhq
ZykKPiBJbnRlZ2VyIHVuZGVyZmxvdyBpbiBGcmFjdGlvbiBjb25zdHJ1Y3RvciB2aWEgZG91Ymxl
IGNsYXAgdHJhbnNmb3JtCj4gYXBwbGljYXRpb24KPiAKPiBDVkUtMjAyNi02MjI5MSAoR0hTQS14
cHczLTlyaHctNDgyeCkKPiBIZWFwIG91dCBvZiBib3VuZHMgd3JpdGUgaW4gbGliaGVpZiB1bmNv
bXByZXNzZWQgZW5jb2RlciB3aGVuIHdyaXRpbmcKPiBpbWFnZXMgd2l0aCBtaXNtYXRjaGVkIGF1
eGlsaWFyeSBhbHBoYSBkaW1lbnNpb25zCj4gCj4gQ1ZFLTIwMjYtNjIyOTIgKEdIU0EtNzNwNy1t
N2dnLXcyanYpCj4gT3V0LW9mLWJvdW5kcyByZWFkIGluIHVuY29tcHJlc3NlZCB1bmNpIHRpbGUg
cmFuZ2Ugc2xpY2luZwo+IAo+IENWRS0yMDI2LTYyMzc3IChHSFNBLTl3dzQtOXY0Ny1tN3BqKQo+
IFJlYWNoYWJsZSBhc3NlcnRpb24gaW4gSGVpZkNvbnRleHQ6OmdldF90cmFjaygpIGFib3J0cyBv
biBhIHZhbGlkLWJ1dC0KPiBlbXB0eSBIRUlGIHNlcXVlbmNlIGZpbGUKPiAKPiAoR0hTQS00NnJw
LXBjcTItcnBtcikKPiBIZWFwIG91dC1vZi1ib3VuZHMgd3JpdGUgaW4gdGhlIHVuY29tcHJlc3Nl
ZCBlbmNvZGVyIGZvciBSUkdHQkIgaW1hZ2VzCj4gd2l0aCBpbnRlcmxlYXZlZCBiaXQtZGVwdGgg
4omkIDgKPiAKPiBTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgoK
QXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
