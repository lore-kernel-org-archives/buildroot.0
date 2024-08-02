Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71DEAC3DA7F
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 21:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 244EE6069C;
	Fri,  2 Aug 2024 21:57:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gB7FvhUcvp7j; Fri,  2 Aug 2024 21:57:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3975B606A5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3975B606A5;
	Fri,  2 Aug 2024 21:57:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 676731BF3FF
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 21:57:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52CA140142
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 21:57:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YCAi_0Lu_GE7 for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 21:57:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1B69F400C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B69F400C6
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1B69F400C6
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 21:57:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 46CED60005;
 Fri,  2 Aug 2024 21:57:43 +0000 (UTC)
Date: Fri, 2 Aug 2024 23:57:43 +0200
To: =?UTF-8?B?Wm9sdMOhbiBLw7Njc2k=?= <zoltan@bendor.com.au>
Message-ID: <20240802235743.58a983a5@windsurf>
In-Reply-To: <20240803062508.312de54e@mazsola>
References: <20240803062508.312de54e@mazsola>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722635864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9SF3prTuk6ZUCP7awvinIQvp9V8rRyjEE8IqXt7yGDk=;
 b=RUm7ajO/5M0D/0Lnnb+CIXhSQ61OfsDltUDOHMX0FkzrYrWHAsbgzQ7puaCDw/8F6PYgG4
 0aT8ofZ3IrWyM87uTMljQ2iegDeWVT+YxqmkxjcmLi/ikOZta2k5MsXanHhCQM4+dBF6af
 +Xf6S3/+TF9CncpwLfi5c0SVAsuexLLysfjamtB93/O6TZt4iO3KlaMAEOBdVtHj/3DPT3
 UAYPGZtM/yLfD/46br/LEQ3ZYGZdTDJ8ejI8AfFuXHEQKE8jJrmAs8abixVMsP1alR4Wn3
 uS1/3lex5izDOUXBWYEVkuLeyyLBpLRzlf9MZM8wljI2qPf6nM6Vv6+lLXEUZw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RUm7ajO/
Subject: Re: [Buildroot] User mailing list?
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gWm9sdMOhbiwKCk9uIFNhdCwgMyBBdWcgMjAyNCAwNjoyNTowOCArMTAwMApab2x0w6Fu
IEvDs2NzaSA8em9sdGFuQGJlbmRvci5jb20uYXU+IHdyb3RlOgoKPiBUaGlzIG1haWxpbmcgbGlz
dCBzZWVtcyB0byBiZSBmb3IgQnVpbGRyb290IGRldmVsb3BlcnMgYW5kIG1haW50YWluZXJzLgo+
IAo+IElzIHRoZXJlIGEgbGlzdCBmb3IgdGhlIGxlc3MgaWxsdW1pbmF0ZWQsIHdoZXJlIHN0dXBp
ZCBxdWVzdGlvbnMgbGlrZQo+ICJteSBidWlsZCBmYWlscyBhbmQgSSBkb24ndCBrbm93IHdoeSIg
YW5kICJJIGhhdmUgbm8gaWRlYSB3aGF0IEknbQo+IGRvaW5nLCBhbnlvbmUgY291bGQgZ3VpZGUg
bWUgYSBiaXQiIHR5cGUgcXVlc3Rpb25zIGNhbiBiZSBhc2tlZD8KClRoaXMgbWFpbGluZyBsaXN0
IGlzIGFjdHVhbGx5IHVzZWQgZm9yIGJvdGgsIHNvIGZlZWwgZnJlZSB0byBhc2sgeW91cgp1c2Vy
J3MgcXVlc3Rpb25zLgoKQSBzZWNvbmQgb3B0aW9uIHRvIGdldCBzdXBwb3J0IGlzIHRvIGpvaW4g
dGhlIElSQyBjaGFubmVsLiBCdXQgcmVhbGx5CnRoZSBtYWlsaW5nIGxpc3QgaXMgZmluZSBhcyB3
ZWxsIQoKQmVzdCByZWdhcmRzLAoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBjby1vd25l
ciBhbmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcg
YW5kIHRyYWluaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
