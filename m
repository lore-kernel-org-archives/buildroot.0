Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90AC8CA0FF0
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 21:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 641C161AD2;
	Fri, 29 Aug 2025 21:55:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id avbKg43pJyyr; Fri, 29 Aug 2025 21:55:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1FBA61AD5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1FBA61AD5;
	Fri, 29 Aug 2025 21:55:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F0958D2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 21:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D466241770
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 21:55:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PpqhCWgj5QEV for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 21:55:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EA8A5404A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA8A5404A0
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA8A5404A0
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 21:55:16 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 3A0761A0DAD
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 21:55:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 138C1605F1;
 Fri, 29 Aug 2025 21:55:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EBEBF1C22DCD5; 
 Fri, 29 Aug 2025 23:55:12 +0200 (CEST)
Date: Fri, 29 Aug 2025 23:55:11 +0200
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>
Message-ID: <20250829235511.1fd98d89@windsurf>
In-Reply-To: <20250710081059.482390-1-thomas.perale@mind.be>
References: <20250709211636.846101-1-thomas.petazzoni@bootlin.com>
 <20250710081059.482390-1-thomas.perale@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756504514; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=3TOaB0bN1V0uAz/eHilX5HOzTqdjKEc5i8VQ/R67VWw=;
 b=DVXq+Wa47R7KkhJopZzlkJ6/tBIWLOUoLs+7awHF71n87J6DNffQ4RT6GeEYWc2crtPQRn
 /GfwnQ+4I+4HarGIT/lYzvkwM5DLEhn+CWPyFEQNPrk5JfajUGGBuGBbihF4ejuiQ8lDDR
 OnRpp1VtEJI8l4eB3f1vAdD0tVnVlCLDVwmoAzRNLBoBF68YhwIddMw0XrpENSutqWu+od
 iB8X3oSxk7w7SyZXlIYlKL2Tf1MCEwjVDwQ1ONbxWuYdQ73qysBxYC0SisHFn5o5FYcoQY
 NA2vVLs6lMEN0WUzeBRW0dfi5MFyPeKANJ8A7squrgcdtZxnwiLdAcX0ja/F9Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=DVXq+Wa4
Subject: Re: [Buildroot] [PATCH] package/bctoolbox: disable mbedtls support
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKT24gVGh1LCAxMCBKdWwgMjAyNSAxMDoxMDo1OCArMDIwMApUaG9tYXMg
UGVyYWxlIHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90ZToKCj4g
VGhleSBkaWQgYWRkIHN1cHBvcnQgZm9yIG1iZWR0bHMgMy42IGluIGNvbW1pdCBbMV0uIEkgd291
bGQgcHJlZmVyIHRvIG5vdAo+IGRlcHJlY2F0ZSBpdCBvbiB0aGUgTFRTIGJyYW5jaCBzbyBJIHRy
aWVkIHRvIGJ1bXAgdG8gdGhlIGxhdGVzdCB2ZXJzaW9uIGJ1dCBJCj4gZ2V0IHRoZSBmb2xsb3dp
bmcgZXJyb3IgbGlua2VkIHRvIG1iZWR0bHM6Cj4gCj4gY3J5cHRvL21iZWR0bHMuY2M6IEluIGNv
bnN0cnVjdG9yIOKAmGJjdG9vbGJveDo6e2Fub255bW91c306Om1iZWR0bHNTdGF0aWNDb250ZXh0
czo6bWJlZHRsc1N0YXRpY0NvbnRleHRzKCnigJk6Cj4gY3J5cHRvL21iZWR0bHMuY2M6ODM6MTc6
IGVycm9yOiDigJhtYmVkdGxzX3RocmVhZGluZ19zZXRfYWx04oCZIHdhcyBub3QgZGVjbGFyZWQg
aW4gdGhpcyBzY29wZTsgZGlkIHlvdSBtZWFuIOKAmG1iZWR0bHNfdGhyZWFkaW5nX211dGV4X3Ti
gJk/Cj4gICAgODMgfCAgICAgICAgICAgICAgICAgbWJlZHRsc190aHJlYWRpbmdfc2V0X2FsdCh0
aHJlYWRpbmdfbXV0ZXhfaW5pdF9jcHAsIHRocmVhZGluZ19tdXRleF9mcmVlX2NwcCwgdGhyZWFk
aW5nX211dGV4X2xvY2tfY3BwLAo+ICAgICAgIHwgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn4KPiAgICAgICB8ICAgICAgICAgICAgICAgICBtYmVkdGxzX3RocmVhZGlu
Z19tdXRleF90Cj4gY3J5cHRvL21iZWR0bHMuY2M6IEluIGRlc3RydWN0b3Ig4oCYYmN0b29sYm94
Ojp7YW5vbnltb3VzfTo6bWJlZHRsc1N0YXRpY0NvbnRleHRzOjp+bWJlZHRsc1N0YXRpY0NvbnRl
eHRzKCnigJk6Cj4gY3J5cHRvL21iZWR0bHMuY2M6OTU6MTc6IGVycm9yOiDigJhtYmVkdGxzX3Ro
cmVhZGluZ19mcmVlX2FsdOKAmSB3YXMgbm90IGRlY2xhcmVkIGluIHRoaXMgc2NvcGU7IGRpZCB5
b3UgbWVhbiDigJhtYmVkdGxzX3RocmVhZGluZ19tdXRleF904oCZPwo+ICAgIDk1IHwgICAgICAg
ICAgICAgICAgIG1iZWR0bHNfdGhyZWFkaW5nX2ZyZWVfYWx0KCk7Cj4gICAgICAgfCAgICAgICAg
ICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPiAgICAgICB8ICAgICAgICAgICAg
ICAgICBtYmVkdGxzX3RocmVhZGluZ19tdXRleF90Cj4gCj4gSWYgYW55b25lIGNvdWxkIGxvb2sg
aW50byB0aGlzLCBJIHdvdWxkIGFwcHJlY2lhdGUgaXQuIEkgdHJpZWQgdG8gY2hhbmdlIHRoZQo+
IG1iZWR0bHNfY29uZmlnLmggdG8gZW5hYmxlIHRoZSBBTFQgdGhyZWFkaW5nIGZ1bmN0aW9uIGJ1
dCB3aXRob3V0IHN1Y2Nlc3MuCgpOb2JvZHkgc3RlcHBlZCB1cCB0byBmaXggdGhpcyBpc3N1ZSwg
c28gSSBzdWdnZXN0IHRoYXQgd2UgYXBwbHkgbXkKcGF0Y2ggZGlzYWJsaW5nIE1iZWRUTFMgc3Vw
cG9ydCBpbiBiY3Rvb2xib3ggZm9yIHRoZSB0aW1lIGJlaW5nLiBJZgpzb21lb25lLCBvbmUgZGF5
LCBuZWVkcyBNYmVkVExTIHN1cHBvcnQgaW4gYmN0b29sYm94LCB0aGF0IHNvbWVvbmUgY2FuCmFs
d2F5cyBmaXggaXQgdXAuCgpJJ20gcGVyc29uYWxseSBub3QgaW50ZXJlc3RlZCBpbiBiY3Rvb2xi
b3gvQysrL01iZWRUTFMgZGVidWdnaW5nLCBzbyBJCndvbid0IGludmVzdGlnYXRlIHRoaXMgYnVp
bGQgaXNzdWUuCgpCZXN0IHJlZ2FyZHMsCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIGNv
LW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVl
cmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
