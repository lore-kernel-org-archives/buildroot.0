Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91666E8305D
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 08:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6691F607EE;
	Tue,  3 Feb 2026 08:15:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BpbTNgn4E_A8; Tue,  3 Feb 2026 08:15:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C6E760804
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770106515;
	bh=FGwGAIONho7+dYZKtpXxTIrDOvzTTOjBNfWGAzQTUgU=;
	h=Date:To:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=fE94m4WdcjsObUO638x5D3uKJdy8dAoZ6ABog4E5DA2QxfPHReRVFDGpev3RnIr6j
	 8QnNAluJcelu+3CxvkLoalXmhZR9t3LoW/St1QQrNJ9jBwpiZaxHFoagTAnu59mnf0
	 TOqp1pwTwEQrOQUKqWzZYe+5Z0WOpv6aKzu8ln2h5OK7WaxC8v5WFHabWnzS3OWfIu
	 FCiIGw417GEmaFxkHRe0ymbmOVht0Mj2vcVvrfjGLyEZ4zLmoztF5CoS6+gusAS4d+
	 m07ThwKBeOFxfLAaPryzuK+PUZbY6xbV+IdlBFbYWArzclKSskLz2SfRHO6Gl4KnPM
	 90Jr5RUITri5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C6E760804;
	Tue,  3 Feb 2026 08:15:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 94A60F4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 08:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76B58607EE
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 08:15:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X2H0-D-Gi-m6 for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 08:15:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=herve.codina@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EE3DA60804
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE3DA60804
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EE3DA60804
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 08:15:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 76C3AC211D2;
 Tue,  3 Feb 2026 08:15:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5C95D60767;
 Tue,  3 Feb 2026 08:15:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A6F9A119A8891; Tue,  3 Feb 2026 09:15:04 +0100 (CET)
Date: Tue, 3 Feb 2026 09:15:03 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20260203091503.0226ba36@bootlin.com>
In-Reply-To: <20260203075731.22481-1-bernd@kuhls.net>
References: <20260203075731.22481-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770106507; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=UE6b9MB63/agg26EvVaefrei7qFHbzsXp+hTxVOfY7w=;
 b=O1/mX18k+e6ZKSRGUl9/xuDBR/tZQuaUNWrJ565+Pbzdyg3gqt5iZV/+Ej0bZ9XpgabDgA
 voRFdmj8tL4fWp9TRD1BeBA2FLDD7Lu5wRmcm76NNGJAXdQfqmb5FeMGkrzrgnP6p2BDsH
 fFU2jIFCoOAJpA2b0mTB/GGqdMpgM/aJXosCKObBkuSeysNg9VjNPCjjJxSsVLLAjr6ssY
 0goJ9KMOh5HH4w7wy48VwDIzWPr6JtXRCPgRGgnBEC3ktDBnPvKK5M/GUg/Qb7UZZ9eZKu
 SSDiuYnBTKuUyVsmKzq+DmtI/woaX8fyqpyGECSC9+HU/fqJfalb59x/Bcrd1g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=O1/mX18k
Subject: Re: [Buildroot] [PATCH 1/1] package/php-lua: add comment for lua
 dependency
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
From: Herve Codina via buildroot <buildroot@buildroot.org>
Reply-To: Herve Codina <herve.codina@bootlin.com>
Cc: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQmVybmQsCgpPbiBUdWUsICAzIEZlYiAyMDI2IDA4OjU3OjMxICswMTAwCkJlcm5kIEt1aGxz
IDxiZXJuZEBrdWhscy5uZXQ+IHdyb3RlOgoKPiBTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8
YmVybmRAa3VobHMubmV0Pgo+IC0tLQo+IFdoaWxlIHRlc3RpbmcgdGhlIHBocCA4LjUgYnVtcCBJ
IGRpZCBub3Qgbm90aWNlIHRoaXMgcGFja2FnZSBiZWNhdXNlIGl0Cj4gZGlkIG5vdCBzaG93IHVw
IGluIG1lbnVjb25maWcuCj4gCj4gIHBhY2thZ2UvcGhwLWx1YS9Db25maWcuaW4gfCAzICsrKwo+
ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UvcGhwLWx1YS9Db25maWcuaW4gYi9wYWNrYWdlL3BocC1sdWEvQ29uZmlnLmluCj4gaW5kZXgg
OTIzZGUyZDc5OS4uOWY0MzUzM2ZhZCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3BocC1sdWEvQ29u
ZmlnLmluCj4gKysrIGIvcGFja2FnZS9waHAtbHVhL0NvbmZpZy5pbgo+IEBAIC02LDMgKzYsNiBA
QCBjb25maWcgQlIyX1BBQ0tBR0VfUEhQX0xVQQo+ICAJICBPTy1BUEkgdG8gbHVhIHZhcmlhYmxl
cyBhbmQgZnVuY3Rpb25zLgo+ICAKPiAgCSAgaHR0cHM6Ly9wZWNsLnBocC5uZXQvcGFja2FnZS9s
dWEKPiArCj4gK2NvbW1lbnQgInBocC1sdWEgbmVlZHMgdGhlIGx1YSBpbnRlcnByZXRlciIKPiAr
CWRlcGVuZHMgb24gIUJSMl9QQUNLQUdFX0hBU19MVUFJTlRFUlBSRVRFUgoKSW5kZWVkLgoKQWNr
ZWQtYnk6IEhlcnZlIENvZGluYSA8aGVydmUuY29kaW5hQGJvb3RsaW4uY29tPgoKVGhhbmtzIGEg
bG90LgoKQmVzdCByZWdhcmRzLApIZXJ2w6kKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
