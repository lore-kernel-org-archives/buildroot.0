Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B952DCD37B2
	for <buildroot@archiver.kernel.org>; Sat,  9 May 2026 20:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C28014266A;
	Sat,  9 May 2026 20:49:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Dy1Lb60FrIQ; Sat,  9 May 2026 20:49:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98F8E4223C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778359783;
	bh=nECAAEcVRNnbcUSln1sKzS23ZWzv+xfVqZC/DwaHhmM=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=coNUeZJiTeTpdqN/hHmeFe4bw2snNgas6ET5Q5yCmtD5xwP4KW++hKo167EaNQK2f
	 TJUlRsIGd7DGqMWUhy3bNuFO64slB3F9Ch7TBLwW/bxM0Ic7NyxSx+DJLPdgG2hUgq
	 EkqvFYrN1yHQTkBWnequFbPMOyrnxmSrqsYmsJ8+rBg9WlvdZxK32Sus7ZY2T2ia+Q
	 cE2FdhKC0avKekyhfKHMq5cmtr79PqrC+hmTi9GIvY3I565p6b8k3Zb3UYLNFCzc3g
	 rfj96IWNzcUhFxQv6GZkrVh0TdHtKRxQzwH91LokYEgOxqpeq52JL1IS7s3xhv67Xh
	 wAssnONZx8izg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98F8E4223C;
	Sat,  9 May 2026 20:49:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 68D02272
 for <buildroot@buildroot.org>; Sat,  9 May 2026 20:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59F834194F
 for <buildroot@buildroot.org>; Sat,  9 May 2026 20:49:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u3o3rA4V_T5c for <buildroot@buildroot.org>;
 Sat,  9 May 2026 20:49:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ADA49403EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADA49403EC
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ADA49403EC
 for <buildroot@buildroot.org>; Sat,  9 May 2026 20:49:40 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -470245033; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 09 May 2026 20:49:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wLocC-000000079VS-3p0P;
 Sat, 09 May 2026 22:49:36 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <CADvTj4p1VpLavsumv0zp4dZic7ejyooSXGthS_=qqgP6=yd1Tg@mail.gmail.com>
 (James Hilliard's message of "Sat, 9 May 2026 13:00:42 -0600")
References: <20260509093853.1651716-1-peter@korsgaard.com>
 <CADvTj4p1VpLavsumv0zp4dZic7ejyooSXGthS_=qqgP6=yd1Tg@mail.gmail.com>
Date: Sat, 09 May 2026 22:49:36 +0200
Message-ID: <87pl34pau7.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Gmcp/NBIg5CA9tzdjuI9AfKsW/70X44FoK0w1+YFfzGs41/xQUCeR0pu0A1OUOkd1Nu4AC1ujkRCJ4v0KoYccRDdZk46WrVqt1uphD70Am0FOGVRkN3fKbYLh3CXBgC8QvoGrvN0Mq85eyuGESdLS8gcV/E4eGjoACc5R2iyND351lDk8BKmh6vLKCG7MMr7slXn2SliJ+d8rO4+l/dmfkVo6wdfs8iBHynSOR8NVOO9Rsh6yDU8mNAXgCK/K4tpL3BynH8/or585Ccl0T22Kw/PWURO+NumV60zlGMAuKF2jSthuX6gkrU7a/ME7luahmxVt2cTswTauXBZ8Hevpg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=LcLX+giPczfDSjb/K6D/QzZ3+AZsPMBS7UfcHaQ5pXg=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=Gmcp/NBI
Subject: Re: [Buildroot] [PATCH] Revert "package/python-setuptools: bump to
 version 82.0.0"
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkphbWVzIiA9PSBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNv
bT4gd3JpdGVzOgoKID4gT24gU2F0LCBNYXkgOSwgMjAyNiBhdCAzOjM44oCvQU0gUGV0ZXIgS29y
c2dhYXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPiB3cm90ZToKID4+IAogPj4gVGhpcyByZXZlcnRz
IGNvbW1pdCA1MTM2NWZmMDYzNzlhYWY2ZmNjOWE3NTFlOGZmMzJhYzY5NGYzZTkyLgogPj4gCiA+
PiBUaGlzIGJyZWFrcyB1LWJvb3QgPCB2MjAyNS4xMCBidWlsZHMgdXNpbmcgYmlubWFuLCBzbyBy
ZXZlcnQgaXQgZm9yIG5vdwogPj4gZ2l2ZW4gdGhhdCB2MjAyNS4xMCBpcyBhIHF1aXRlIHJlY2Vu
dCByZWxlYXNlLgogPj4gCiA+PiBGaXhlczogaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5v
cmcvYnVpbGRyb290Ly0vam9icy8xNDI0OTMzMjAxNgogPj4gQW5kIG1hbnkgbW9yZS4KID4+IAog
Pj4gTG9uZ2VyIHRlcm0gd2UgZWl0aGVyIHdhbnQgdG8gdXBncmFkZSBhbGwgdGhlIGRlZmNvbmZp
Z3MgKHdoaWNoIHdpbGwgbm90IGZpeAogPj4gdGhlIGlzc3VlIGZvciBleHRlcm5hbCB1c2Vycykg
b3IgZmluZCBhIHdheSB0byBwYXRjaCBvbGRlciB1LWJvb3QgdmVyc2lvbnMuCgogPiBNYXliZSB3
ZSBjYW4gaW5zdGFsbCB0aGlzIHNvbWVob3cgZm9yIGNvbXBhdGliaWxpdHk/OgogPiBodHRwczov
L2dpdGh1Yi5jb20vcHlwYS9wa2dfcmVzb3VyY2VzCgpZZXMsIHRoYXQgbWF5IGJlIGEgc29sdXRp
b24gbG9uZ2VyIHRlcm0uIEkgd291bGQgbGlrZSB0byB0YWcgLXJjMSB2ZXJ5CnNvb24sIHNvIEkg
c3RpbGwgdGhpbmsgdGhhdCBhIHJldmVydCBpcyBtYXliZSB0aGUgYmVzdCBmb3IgMjAyNi4wNS4K
Ci0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
