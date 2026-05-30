Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F21CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 13:09:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D7256F56D;
	Sat, 30 May 2026 13:09:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5QbIAKUxyfQP; Sat, 30 May 2026 13:09:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63D6F6F560
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780146574;
	bh=keP7DZjsqIR/2tgx01FGoPN7CaE7nj2z49xxtRx1Y1Y=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UBQDHhLJsGhqzVPVr2sQdlBKCQMeGsILVwoJPWnAcJ/JmO1KBwEBU8gLcIMd1K+yC
	 lvRwyP1CP651mjcm9S1B0QwWsDezJN5M7eYdDnHh4EBUTiFQDikcvuHSGNfJ0hWmwr
	 Psaa9BX0c5buQQf/xcg4eOuxrr5Q8EkCReBbjX+YkC95HypJsi5UjdZ4zTroDmWH4P
	 7sy5kezeB50ViaYjiZdqlCtqXqYOZbVFmo2UIP6SFXsDqp+TPxi6oauBca56v94vgz
	 KONLJgaauG3KIXdF0BqZ8739Hw7MHCxIqFk512D5+f9lMF009us/4DgpM5oIsY2bep
	 IDXNeYcG5zgRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63D6F6F560;
	Sat, 30 May 2026 13:09:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A74AAD3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D23881304
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:09:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0i1k6p62__s3 for <buildroot@buildroot.org>;
 Sat, 30 May 2026 13:09:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EB437812CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB437812CA
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EB437812CA
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:09:30 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 600214806; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 30 May 2026 13:09:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wTJRP-00000005ETw-2xij;
 Sat, 30 May 2026 15:09:27 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Vincent =?utf-8?Q?Stehl=C3=A9?= via buildroot <buildroot@buildroot.org>
Cc: Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@laposte.net>
In-Reply-To: <20260530101218.14545-1-vincent.stehle@laposte.net> ("Vincent
 =?utf-8?Q?Stehl=C3=A9?= via buildroot"'s message of "Sat, 30 May 2026
 12:12:18 +0200")
References: <20260530101218.14545-1-vincent.stehle@laposte.net>
Date: Sat, 30 May 2026 15:09:27 +0200
Message-ID: <8733z96o3c.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Lzg0UtIfyLQ7/OooKJc8MYdJ6cPn+DdCMcyIX2kBizc4g86VzuwOZBlOPa6Lww9blWP0XRNtGBMuyXavKq/Y+zWUeG9A7GPimmk6OmqJ2p6pm/xHTtXwwRvSpzkj9VdEdOHQ2ydPOU9RQhr+srhKksh6EkVcFFRLW2njOIElFPEdAo48UNPS8BX2bw583+jxiiuVo8XTNrGoSQYqdB7uAHn7AhQKmYNqrUYcxWhwLZHARsCRBTaF4/Mj/DqZe3KV200DguFH3esZmTcs5GOeqs6iwvCzKPZOc1U3Es1/lVxzOceMnFByqa+AP8P2HUXLi8qWNouvsoYJXK53t+lDOQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=/D13PGwMiSvrLvBiupudIpZ6GCFJ4YzShSaaTb2GDY4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=Lzg0UtIf
Subject: Re: [Buildroot] [PATCH] arch/hppa: remove pa-risc 1.0
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

Pj4+Pj4gIlZpbmNlbnQiID09IFZpbmNlbnQgU3RlaGzDqSB2aWEgYnVpbGRyb290IDxidWlsZHJv
b3RAYnVpbGRyb290Lm9yZz4gd3JpdGVzOgoKID4gVGhlIG5ldyBnbGliYyAyLjQzIHdlIGhhdmUg
aW4gQnVpbGRyb290IHNpbmNlIGNvbW1pdCBbMV0gaW50cm9kdWNlZCBjaGFuZ2VzCiA+IGFyb3Vu
ZCA2NEIgYXRvbWljcyBbMl0sIHdoaWNoIGJyZWFrIHRoZSBidWlsZCBmb3IgUEEtUklTQyAxLjAu
IFszXQoKID4gVGhpcyBpcyB0aGUgb25seSBDIGxpYnJhcnkgd2Ugc3VwcG9ydCBhdCB0aGlzIHBv
aW50OyBmb3JjaW5nIHNvZnQtZmxvYXQKID4gc2VlbXMgdG8gYmUgYSB3b3JrYXJvdW5kLCBidXQg
YXMgdGhpcyBhcmNoaXRlY3R1cmUgdmVyc2lvbiB3YXMgbm90IGFzCiA+IHdpZGVseSB1c2VkIGFz
IHRoZSBsYXRlciAxLjEgYW5kIHdlIGhhdmUgbm8gaGFyZHdhcmUgb3Igc2ltdWxhdG9yIGZvciBp
dCBhdAogPiB0aGlzIHBvaW50LCByZW1vdmUgaXQgY29tcGxldGVseSBpbnN0ZWFkIHRvIHNwYXJl
IHRoZSBhdXRvYnVpbGRlcnMuCgogPiBMaW5rOgogPiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRy
b290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvMjI3Mzc4YjU5MzBiNjgxYzc5YTEzNDc2YWU2MGE5
ODc1M2E5OGEwMwogPiBbMV0KID4gTGluazoKID4gaHR0cHM6Ly9zb3VyY2V3YXJlLm9yZy9naXQv
P3A9Z2xpYmMuZ2l0O2E9Y29tbWl0O2g9OWRhMDU4NTg1MmU1NTk5YWQ2ZTg0OWNjZGYyZjZmOWIw
NDAzOGEzYwogPiBbMl0KID4gTGluazogaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9y
ZXN1bHRzLzkwNWM3ZThkYjBmOGI5MDE0ZjI2OTI1YzZlMTM3OWEwYzU0YWQ0NDYvIFszXQogPiBT
aWduZWQtb2ZmLWJ5OiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGxhcG9zdGUubmV0
PgoKQ29tbWl0dGVkLCB0aGFua3MuCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
