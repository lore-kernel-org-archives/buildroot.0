Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9035CE95A8C
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 12:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3363381BB0;
	Tue, 30 Dec 2025 12:50:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sf8kQyNZwtJG; Tue, 30 Dec 2025 12:50:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67D1B81BCF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767099002;
	bh=l5phGjW2+tAbVWb9myowV88NTsvQHhfXz4qlrCbAg4Q=;
	h=Date:To:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=PGTUlovwgDRpBTez0fmT+cB2fuKjH0QeIaCz+ImAN2hDCukfdAsXD0OJaIj/gZ81E
	 diTV0y0d4+4rxxPK4xGhVo9bZ5EcrLLYRshq63/kxvf9trQGBTciNJjuky37OXIpkL
	 xqs8jPB1F0+OuKQH9wVs0Q4juEM87bUz98aCKmrsuP4WeB8gSuVECldCcXrWQjRRF3
	 sofEUBd+6iD6BuPU2ZTWJVTlp0khojvdXFi23WOVTSReSgEV2whGQpEs22qBHvlTqk
	 fbZzjBX5COk+K/HIXkNs2gHnLghPts4ozVElUtn4wllbpxlLZ/TyBwQ0ifL8oEbPpW
	 7irJx2q6BDC3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67D1B81BCF;
	Tue, 30 Dec 2025 12:50:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 43B8F372
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 12:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A31360879
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 12:50:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Z6CvZFcsOJH for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 12:49:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3C24260699
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C24260699
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3C24260699
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 12:49:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id AE9F44E41E82;
 Tue, 30 Dec 2025 12:49:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6E0DC6072C;
 Tue, 30 Dec 2025 12:49:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 77F78113B0392; Tue, 30 Dec 2025 13:49:49 +0100 (CET)
Date: Tue, 30 Dec 2025 13:49:46 +0100
To: Francois Perrad via buildroot <buildroot@buildroot.org>
Message-ID: <20251230134946.3d737c29@windsurf>
In-Reply-To: <20251212084954.76257-1-francois.perrad@gadz.org>
References: <20251212084954.76257-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767098995; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=X9jGYVmVJxjL9Z+WqM2P6MDuFW3LJU5tLEczg+ZmYUM=;
 b=YfCgta/tK+OFwRjhaPILpLcYkjTAC59+oR2CGKIECnIoINyPizApufZarKgP7coDIPOiSl
 89zGIDqgfvHIBFLbeww/jBdgRMAwn9/s8Vykw9BX7fTFHloZaoYO41Ui8swfhFBgoZ3AX9
 TaxyMBquh3JsHyxKW5725+9aSkKucQqcSTyknKJU/ajfQN0hs2UHB+xTI/eDYVzNdYafLs
 vzEXZNYiP247Z5lqeWsXN7qZ7Ps3U2JOqtEsEsvIWbe4cUlXns9/+8uCRWcst8g6oVbgbj
 /hBJjV0KuTKWzmbL91uwJAH+bwWzz4ePY/ABtcmFOu4uJNgOTu6rFzXOgSALyw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=YfCgta/t
Subject: Re: [Buildroot] [PATCH] package/ficl: downgrade to version 3.03
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRnJhbsOnb2lzLAoKVGhhbmtzIGZvciB0aGUgcGF0Y2guCgpPbiBGcmksIDEyIERlYyAy
MDI1IDA5OjQ5OjUzICswMTAwCkZyYW5jb2lzIFBlcnJhZCB2aWEgYnVpbGRyb290IDxidWlsZHJv
b3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2ZpY2wvMDAw
MS1taXNzaW5nLWluY2x1ZGUucGF0Y2ggYi9wYWNrYWdlL2ZpY2wvMDAwMS1taXNzaW5nLWluY2x1
ZGUucGF0Y2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMC4uYTUyMDg5
NjIzCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvZmljbC8wMDAxLW1pc3NpbmctaW5j
bHVkZS5wYXRjaAo+IEBAIC0wLDAgKzEsMjYgQEAKPiArRnJvbSA4N2M3OGVlYTJjNGFjNjljMDk5
NDdjOGU0OWY4ZTg2Njg2NDAwNzFjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ICtGcm9tOiBG
cmFuY29pcyBQZXJyYWQgPGZyYW5jb2lzLnBlcnJhZEBnYWR6Lm9yZz4KPiArRGF0ZTogU3VuLCA3
IERlYyAyMDI1IDEwOjE1OjI3ICswMTAwCj4gK1N1YmplY3Q6IFtQQVRDSF0gbWlzc2luZyBpbmNs
dWRlCj4gKwo+ICtTaWduZWQtb2ZmLWJ5OiBGcmFuY29pcyBQZXJyYWQgPGZyYW5jb2lzLnBlcnJh
ZEBnYWR6Lm9yZz4KPiArVXBzdHJlYW06IHVwc3RyZWFtIGlzIGRlYWQKCkFjY29yZGluZyB0byB0
aGUgbGluawpodHRwczovL3NvdXJjZWZvcmdlLm5ldC9wL2ZpY2wvbmV3cy8yMDI1LzA3L2ZpY2w0
LWlzLXJldGlyaW5nLyB5b3UKcG9zdGVkLCB1cHN0cmVhbSBmb3IgdmVyc2lvbiAzLnggaXMgbm90
IGRlYWQuIFNvIHdoeSBkb24ndCB5b3Ugc3VibWl0CnRoaXMgcGF0Y2g/CgpJZiB1cHN0cmVhbSBp
cyByZWFsbHkgZGVhZCwgc2hvdWxkIHdlIHJlbW92ZSB0aGlzIHBhY2thZ2UgaW5zdGVhZD8KClRo
YW5rcyEKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9v
dGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwpo
dHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
