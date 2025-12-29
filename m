Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA33E9273E
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 16:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 144D7813F8;
	Mon, 29 Dec 2025 16:51:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JHFRQs7gd6Mv; Mon, 29 Dec 2025 16:51:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 876DB813AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767027105;
	bh=8sa6OHluwwz1fAUz96jrsG/tBFGhE3dk9639SKb2B5I=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mmbWyPoKQHmsfou48pHCEU40b0whLT66qJMkM9D2p05LdWtE2yPg+NsvhlU6q/ec5
	 cgLW3ltCnIqOH8CwIiRg6YUJiGa2EjBlCX9tumtDlvE9rY03k65Vqw6s2CBUjt6Jsw
	 WEwrZeL0pJ1wB7xS4KFec7+eiCS02Ja4sp99LByZXWBo2fMUZS6qjE3txMIbyvQU6p
	 vepbALZ4fvTYyuiNjuq7UjpoxAQXmOdqSI18RZ1zNztWy34EbQGRBpwHe6+5AzzsCm
	 oSLG6hJi8ZIVc1enJTmPrWpDN04AIxrIfjWp46LjiLFb+ocIXK1uOCBLDu74cyHpjK
	 VjXW7PXZH1V7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 876DB813AC;
	Mon, 29 Dec 2025 16:51:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F658177
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 16:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E9AF6403D8
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 16:51:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HKAAmW6LcFe5 for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 16:51:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 176B04036E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 176B04036E
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 176B04036E
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 16:51:42 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id E01BA4E41E51;
 Mon, 29 Dec 2025 16:51:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A361960725;
 Mon, 29 Dec 2025 16:51:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DE1FF113B0451; Mon, 29 Dec 2025 17:51:37 +0100 (CET)
Date: Mon, 29 Dec 2025 17:51:31 +0100
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>, =?UTF-8?B?UsOpbWkgUsOpcm9sbGU=?=
 <remi.rerolle@gmail.com>
Message-ID: <20251229175131.4b44b95a@windsurf>
In-Reply-To: <20251013204005.42277-1-thomas.perale@mind.be>
References: <20251013204005.42277-1-thomas.perale@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767027098; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ophTYYMNjwxAockwHrHq+gPi8nha5r7hhgwrlqv4aYs=;
 b=XVv0IiPzNB4MlgvygPxdTdtT20hevGTKcKMHywcFi7zC/CnbVvZjS8sVzsQqxl6Sn45he8
 EFZEiAE3Pc+M3Yz6uMs9qip4Ts9GZ3/pX8pXXVLCUOT4vfrHBi40+ZkLy5N1Lra7qGjpok
 yuPj6QNAkXZlsR6Tt88kSMriVotfreobE1NH83SXuKjH6HFfosuwYHZ2NpAK7pKG8N7MMx
 WSWF80OFf8W81Z0r07YQOoCNJPZvAz/+NPOQIUkQf7JvhDD/hhBtKvV4cBWoKhTQBdFa7X
 mLuTnMUTBqaEWpmK5eakO/a+MougCRq9zXXwRYa7u6mKrYOJAYn58bNSIrYWCA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=XVv0IiPz
Subject: Re: [Buildroot] [PATCH] package/libfreeimage: various vulnerability
 patches
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

T24gTW9uLCAxMyBPY3QgMjAyNSAyMjo0MDowNSArMDIwMApUaG9tYXMgUGVyYWxlIHZpYSBidWls
ZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90ZToKCj4gVGhpcyBwYWNrYWdl4oCZ
cyBsYXN0IHJlbGVhc2UgZGF0ZXMgYmFjayB0byBKdWx5IDIwMTguIFNpbmNlIHRoZW4sIGEKPiBu
dW1iZXIgb2YgQ1ZFcyBoYXZlIGFjY3VtdWxhdGVkLiBUaGlzIHBhdGNoIGFwcGxpZXMgc2V2ZXJh
bAo+IHZ1bG5lcmFiaWxpdHkgZml4ZXMgZnJvbSB0aGUgRmVkb3JhIHByb2plY3QuIE5vdCBhbGwg
dnVsbmVyYWJpbGl0aWVzIGFyZQo+IGFkZHJlc3NlZCBieSB0aGlzIHBhdGNoLgoKVGhhbmtzLCBJ
J3ZlIGFwcGxpZWQuIFRvIGJlIGhvbmVzdCwgYW4gaW1hZ2UgcGFyc2luZyBsaWJyYXJ5IHdpdGgg
bm8KcmVsZWFzZSBzaW5jZSBKdWx5IDIwMTggc2VlbXMgY3JhenkgdG8gbWUuIFRoZSBvbmx5IHJl
dmVyc2UKZGVwZW5kZW5jaWVzIGluIEJ1aWxkcm9vdCBhcmUgY2VndWkgKHdoaWNoIG5vYm9keSBp
cyB1cGRhdGluZykgYW5kIG9ncmUuCgpTaG91bGQgd2UgZHJvcCBhbGwgb2YgdGhpcywgYW5kIHNh
eSBubyB0byB1bm1haW50YWluZWQgaW5zZWN1cmUKc29mdHdhcmU/CgpCZXN0IHJlZ2FyZHMsCgpU
aG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1i
ZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9i
b290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
