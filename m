Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A55F0E63F1A
	for <buildroot@archiver.kernel.org>; Sun, 15 Feb 2026 22:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AA4060717;
	Sun, 15 Feb 2026 22:04:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RDuxsMrA5K5I; Sun, 15 Feb 2026 22:04:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D32560782
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771193086;
	bh=6zV58TRvRqHR9NXTE0D5R0K/rEHrQaxjsHgluvKeIw8=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jlNQlezPVTfrdj/kKzs3OX7HMUKLgRJFR9VVsaJ/whlzLqTc6gpIIkS89H5V1fdN3
	 lqja5py+q8VG2N1YoddGSHCjD17y7yQF2gb2gjpAr1kz6PRrPmhVM+9TGLKS1Zy2/J
	 9tfTbXccQWg1N4uz0sFkTdMz+3Qi5MOs49MoZxwnnu3kabo5R0DLKRb1c3oEy9PU6y
	 BHKI0fsvDN7duUkGCb/erZTETCFwUB9OhfQxGg7gjTB0Ja26ArtZkjIORu3y2djuRw
	 AT9Fe3pN4egfelPg6PMDAcL0YD8S/oudhsS6HrF8lBuWTAC3e8dVT+1R1tQPsE6Cvw
	 H8SQctJ6ht+pw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D32560782;
	Sun, 15 Feb 2026 22:04:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B6FE3270
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 22:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7D974035C
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 22:04:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JP3TB2sZDWTE for <buildroot@buildroot.org>;
 Sun, 15 Feb 2026 22:04:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 81E9B40042
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81E9B40042
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 81E9B40042
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 22:04:43 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -2032777;
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 15 Feb 2026 22:04:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vrkEB-00000009cGB-0ArX;
 Sun, 15 Feb 2026 23:04:31 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Fiona Klute via buildroot <buildroot@buildroot.org>,  Julien Olivain
 <ju.o@free.fr>,  Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>,
 guenther.harrasser@mobileye.com
In-Reply-To: <55c29855-c3a7-47d5-ae6e-a16062a418b1@gmx.de> (Fiona Klute's
 message of "Sun, 15 Feb 2026 21:33:09 +0100")
References: <20260202141045.1913969-1-jimmy.wesolowski@mobileye.com>
 <a062166d22db6b02629b21913b366fb2@free.fr>
 <81e91ea4-20bd-4786-83f9-5e3810f52cfd@gmx.de>
 <87bjhqpd6c.fsf@dell.be.48ers.dk>
 <55c29855-c3a7-47d5-ae6e-a16062a418b1@gmx.de>
Date: Sun, 15 Feb 2026 23:04:31 +0100
Message-ID: <87y0ktoe8g.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=EWZf8Ur8mqZufF10t2h+AD8Ppj1gaqi/hYOvwBKF6r+hirCBxFj2vafhUlkmnUxBgmezB83fyIIXspILhVEykBmZRDbeL4F4JHthU5xwveIfFvCQzGq79PbeBkPeUjGaRFZ9l8tnJMnkpbJn2uY0B5pzikv20QdPitsQWK0ca0xYArQ50JRlCO7XlEjKu4gQgObIK8UrJE+UMvdFzRZdRDqPp8Bqo8DADHDF3Gd3xhG7530E3bWf2/1GtymAJplvGMDeatQA+JsIJV3TnADaWV2sKFMrzghD9mUSEz2RXY2+lnYATJtp2E7eHGdzOGUlAaA6tB42OM7Q7bhGX7Cl3g==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=ljmaaHboqH/2WuWdTuK/DgJB1PGiWnWQ17kGgtbVIuo=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=EWZf8Ur8
Subject: Re: [Buildroot] [PATCH 1/1] support/testing/run-tests: specify
 multiprocessing method
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

Pj4+Pj4gIkZpb25hIiA9PSBGaW9uYSBLbHV0ZSA8ZmlvbmEua2x1dGVAZ214LmRlPiB3cml0ZXM6
CgpIaSwKCiA+IEkndmUgYmVlbiBkaWdnaW5nIGEgbGl0dGxlIG1vcmUsIGFuZCBpdCBsb29rcyBs
ZXNzIGJsZWFrLiBLZXkgcmVzdWx0czoKCiA+ICogQ2hhbmdpbmcgdGhlIG11bHRpcHJvY2Vzc2lu
ZyBzdGFydCBtZXRob2QgaW4gb3IgZm9yIG5vc2UgaXMgKm5vdCoKID4gICB0aGUgY29ycmVjdCBh
cHByb2FjaCwgb3IgbmVlZGVkIChhdCBsZWFzdCBub3QgaW4gZ2VuZXJhbCDigJMgdGhlcmUgYXJl
CiA+ICAgc29tZSBpc3N1ZXMgdXNpbmcgY292ZXJhZ2UgSSBkaWRuJ3QgZGlnIGludG8sIGJ1dCB3
ZSBkb24ndCBuZWVkIHRoYXQKID4gICBpbiBCdWlsZHJvb3QgYmVjYXVzZSB3ZSdyZSBub3QgYWN0
dWFsbHkgdGVzdGluZyBQeXRob24gY29kZSkuIFNlZQogPiAgIFsxXSBmb3IgZGV0YWlscy4KCk9L
LCB0aGFua3MuCgogPiAqIFRoZSBvbmx5IHJlYXNvbiB3ZSBoYXZlIHRyb3VibGUgd2l0aG91dCAi
Zm9yayIgaW4gQnVpbGRyb290IGlzIHRoYXQKID4gICBzdXBwb3J0L3Rlc3RpbmcvcnVuLXRlc3Rz
IHNldHMgY2xhc3MgdmFyaWFibGVzIGluIEJSQ29uZmlnVGVzdCwgYW5kCiA+ICAgdGhvc2UgYXJl
IGxvc3QgaWYgdGhlIGluZnJhLmJhc2V0ZXN0IG1vZHVsZSBpcyBsb2FkZWQgYWdhaW4gaW4gYSBu
ZXcKID4gICBwcm9jZXNzIChpbnN0ZWFkIG9mIGNhcnJpZWQgb3ZlciBkdXJpbmcgZm9yaykuCgog
PiBDb25jbHVzaW9uOiBUaGUgcHJvcGVyIGZpeCBmb3IgQnVpbGRyb290IGlzIHRvIGF2b2lkIHBh
c3NpbmcgY29uZmlnIGluCiA+IGNsYXNzIHZhcmlhYmxlcy4KCiA+IEkndmUgdGVzdGVkIHRoaXMg
d2l0aCBlbnZpcm9ubWVudCB2YXJpYWJsZXMgYW5kIGl0IHdvcmtlZCBmaW5lLCB0aG91Z2gKID4g
SSdkIHByZWZlciBzb21ldGhpbmcgdGhhdCBhbGxvd3MgdHlwZSBjaGVja2luZywgYW5kIGRvZXNu
J3QgcmVxdWlyZQogPiBzZXR0aW5nIGEgYnVuY2ggb2YgZW52aXJvbm1lbnQgdmFyaWFibGVzLiBI
b3cgYWJvdXQgYWRkaW5nIGEgbGl0dGxlCiA+IGRhdGFjbGFzcyAob3Igc2VyaWFsaXplL2Rlc2Vy
aWFsaXplIGZ1bmN0aW9ucyBpbiBCUkNvbmZpZ1Rlc3QpIGFuZAogPiB1c2luZyBhbiBlbnZpcm9u
bWVudCB2YXJpYWJsZSB0byBwYXNzIHRoZSBwYXRoIG9mIGEgZmlsZSB3aXRoCiA+IHNlcmlhbGl6
ZWQgY29uZmlnIHRvIGJlIGxvYWRlZCBpbiBCUkNvbmZpZ1Rlc3QuX19pbml0X18oKT8gSSdkCiA+
IHByb2JhYmx5IHVzZSBKU09OIGJlY2F1c2UgaXQncyBlYXN5IHRvIGhhbmRsZSB3aXRoIHRoZSBQ
eXRob24gc3RhbmRhcmQKID4gbGlicmFyeS4KClllcywgdGhhdCBzb3VuZHMgZ29vZCAtIENhcmUg
dG8gc2VuZCBhIHBhdGNoPwoKCiA+IEFub3RoZXIgb3B0aW9uIHdvdWxkIGJlIHRvIHN3aXRjaCB0
byBhIHRlc3QgcnVubmVyIHRoYXQgaGFzIGJ1aWx0LWluCiA+IHN1cHBvcnQgZm9yIHBhc3Npbmcg
Y29uZmlnIChsaWtlIFB5dGVzdCksIGJ1dCB0aGF0J2QgYmUgYSBtYWpvcgogPiBjaGFuZ2UsIG5v
dCBhIHNpbXBsZSBmaXguCgpJbmRlZWQsIHRoYXQgaXMgcHJvYmFibHkgd2hhdCB3ZSBzaG91bGQg
ZG8gbG9uZ2VyIHRlcm0sIGJ1dCBub3QgYSBxdWljawpmaXguCgotLSAKQnllLCBQZXRlciBLb3Jz
Z2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
