Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41757D3B7E5
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 19:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66A50405DF;
	Sun, 28 Dec 2025 19:09:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w1QExDnjyF_C; Sun, 28 Dec 2025 19:09:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E97FB404AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766948983;
	bh=/7Ad7PjXdchJppn8pCvdXUf8op3OZgN4hpsEfnIPt1o=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VXVVppsCoOClFtQFVBiNCB+MFUlqR3v+7DEOSbXLpLFXttp9ORDrqtFP4l0ewS7gx
	 mHe+rX/glBx1o6lfugaDKKGiynu9ny54Y5y6iRS2Tt7/7gJHfdPTO4hIavqir1DfhW
	 BGD3HnM8pzlKWiv4iu9nqWn3J9bEfbUwuSf7ZebxxVC/RZPshzwNi9i9BgR5tpR18f
	 X8p8qHweLLkbyLF5Fgo8M0z4QyEI8LU0Ae3nc1HHLY5UgZi2qsO05l/3a3x7cO9lk3
	 WmDGVgBTNx1VHPTwlHxGhou5VHrdJPYuS8HXYhqQIYeh9biuN2bjkqtg0GS/VFkNlx
	 XnlqivDqTdXOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E97FB404AD;
	Sun, 28 Dec 2025 19:09:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 172E81E1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 19:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E96C2404AD
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 19:09:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j-YT42vX0IWp for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 19:09:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F14CE404A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F14CE404A1
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F14CE404A1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 19:09:39 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id B5788C1D70B;
 Sun, 28 Dec 2025 19:09:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0A2F260725;
 Sun, 28 Dec 2025 19:09:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 896F611978462; Sun, 28 Dec 2025 20:09:33 +0100 (CET)
Date: Sun, 28 Dec 2025 20:09:32 +0100
To: "J. =?UTF-8?B?TmV1c2Now6RmZXI=?=" <j.neuschaefer@gmx.net>
Cc: "J. =?UTF-8?B?TmV1c2Now6RmZXI=?= via buildroot"
 <buildroot@buildroot.org>, Angelo Compagnucci
 <angelo.compagnucci@gmail.com>, Grzegorz Blach <grzegorz@blach.pl>, James
 Hilliard <james.hilliard1@gmail.com>
Message-ID: <20251228200932.7e958db3@windsurf>
In-Reply-To: <aVF8lcjpAKr1uOQa@probook>
References: <20251226-rgbmatrix-bump-v1-0-69c2aa62beaa@gmx.net>
 <20251226-rgbmatrix-bump-v1-1-69c2aa62beaa@gmx.net>
 <20251228001415.0335f4c0@windsurf> <aVF8lcjpAKr1uOQa@probook>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766948975; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=0C3gK4RaGXo2aH0j2D40yhn7qlL8QinKp4VchWOdwq0=;
 b=v2Sf0kRn+YPeFr5Z1rwz4fbG0VPxCwc3j8moYkzaBcCYOfJXvxCP+oidk4lw9MZT/qkeb1
 x84mh+G5UVl5U0zDUIg4nUVL29Vt+tDB27JpdPOOVWzxyZoYUKi0gqpmLufEx6W3koppqo
 iX7uclG6GFASmUaoRzXdQALmimNLsb0E12CI5kmlJL8h7tgpy038nWanTQf6R1QkcAG6c6
 OiDqW3E5Ce49zflqPep6fkJuDt/k6ZecFfgWk7NLk7vQ8+cKarfF3oyOUn3si5ZhT46Qzr
 A0223iUevOyL8BnQG6q4qkV6YmUG9rL2x3nVMIHtzkRH2RQK8CZIkQmg8is8Nw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=v2Sf0kRn
Subject: Re: [Buildroot] [PATCH RFC 1/2] package/python-pillow: install
 libImaging headers
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

T24gU3VuLCAyOCBEZWMgMjAyNSAxOTo1MzowOSArMDEwMApKLiBOZXVzY2jDpGZlciA8ai5uZXVz
Y2hhZWZlckBnbXgubmV0PiB3cm90ZToKCj4gUHJldHR5IG11Y2guIHB5dGhvbi1waWxsb3cgaXMg
YSBQeXRob24gbW9kdWxlLCBidXQgaXQncyBwYXJ0aWFsbHkKPiBpbXBsZW1lbnRlZCBpbiBDLiBw
eXRob24tcmdibWF0cml4ICh0aGUgUHl0aG9uIG1vZHVsZSBmb3IgdGhlCj4gcnBpLXJnYi1sZWQt
bWF0cml4IEMrKyBsaWJyYXJ5KSBhY2Nlc3NlcyBpbnRlcm5hbCBzdGF0ZSBvZiBvYmplY3RzCj4g
Y3JlYXRlZCBieSBweXRob24tcGlsbG93LiBUaGVyZSBpcyBubyBkaXJlY3QgbGlua2luZywgYm90
aCBuYXRpdmUKPiBsaWJyYXJpZXMgZXhpc3QgaW4gdGhlIHNhbWUgcHJvY2VzcyBiZWNhdXNlIHRo
ZXkgYXJlIGxvYWRlZCBhcyBwYXJ0IG9mCj4gdGhlaXIgcmVzcGVjdGl2ZSBQeXRob24gbW9kdWxl
cy4gUHJpb3IgdG8gdGhpcyBjb21taXQsIHB5dGhvbi1yZ2JtYXRyaXgKPiBpbmNsdWRlZCBpdHMg
b3duIGRlZmluaXRpb24gb2Ygc3RydWN0IEltYWdpbmdNZW1vcnlJbnN0YW5jZSAoY2FsbGVkCj4g
UGlsbG93SW1hZ2luZ0luc3RhbmNlKS4gV2l0aCB0aGlzIGNvbW1pdCwgcGlsbG93J3MgSW1hZ2lu
Zy5oIGlzIGluY2x1ZGVkCj4gdG8gZ2V0IHRoZSBzdHJ1Y3QgbGF5b3V0IGFuZCB1bHRpbWF0ZWx5
IHRoZSBvZmZzZXQgb2YgdGhlICJpbWFnZTMyIgo+IG1lbWJlci4KCkF3ZXNvbWUgZXhwbGFuYXRp
b24sIHRoYW5rcyBhIGxvdCEgQ291bGQgeW91IGNvcHkvcGFzdGUgdGhpcyBpbnRvIHRoZQpjb21t
aXQgbWVzc2FnZT8KClRoYW5rcyEKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3du
ZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5n
IGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
