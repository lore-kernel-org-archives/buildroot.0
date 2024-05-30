Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A67C25B78
	for <buildroot@archiver.kernel.org>; Thu, 30 May 2024 09:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59D4C60B77;
	Thu, 30 May 2024 09:25:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jDoJBq8X0ekC; Thu, 30 May 2024 09:25:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EC5F61015
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EC5F61015;
	Thu, 30 May 2024 09:25:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9B85D1D44C1
 for <buildroot@lists.busybox.net>; Thu, 30 May 2024 09:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9587061015
 for <buildroot@lists.busybox.net>; Thu, 30 May 2024 09:25:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AkmoVCpCXQfs for <buildroot@lists.busybox.net>;
 Thu, 30 May 2024 09:25:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1737660B77
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1737660B77
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1737660B77
 for <buildroot@buildroot.org>; Thu, 30 May 2024 09:25:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 678731BF20F;
 Thu, 30 May 2024 09:25:15 +0000 (UTC)
Date: Thu, 30 May 2024 11:25:14 +0200
To: Jan Kraval <jan.kraval@gmail.com>
Message-ID: <20240530112514.1843a3a7@windsurf>
In-Reply-To: <12ae846b-1fc5-49ca-a996-485eb8283405@gmail.com>
References: <20240220051926.68559-1-jan.kraval@gmail.com>
 <20240513233014.3b09e56e@windsurf>
 <12ae846b-1fc5-49ca-a996-485eb8283405@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1717061115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yz00IE/tm/TySM+QVcWZdotxhn4H+bhMa89qR4kHJOg=;
 b=XpR9k+XzFlIWzQIcq77CwhjWEvorBhbxs/h335yiL+Ybr23l7uc1HHX81r4EhD8IZs2/l2
 paQDComIfSOfot8w9dJlR/zdcYeW5FxgY3PTeDJzvbBwAIWJ5BZvRAhHCaJcAl0PXukhSn
 Kxv301PmW8TQ5fsAurxSpyqsj+/lhqoU5pEP7iW/IRPBO5idjnaDo8BdEYxbShYlbnAw3U
 WkN5Y74gQp2W471Uis4PGwGYFld7sTWM5JjB7sWTF+/Ubhdhqv2UcA9Cz0Dn5BMHNTRUnu
 OijDFeOhP3l7K6cj9bxoSHtk2Y8p4Yv8m+QX1JkKoVLBCQCka2mWCTXvhD2G8A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XpR9k+Xz
Subject: Re: [Buildroot] [PATCH 1/2] board/orangepi/orangepi-lite: switch to
 extlinux
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

SGVsbG8gSmFuLAoKT24gV2VkLCAyMiBNYXkgMjAyNCAwNjozNzoyOSArMDIwMApKYW4gS3JhdmFs
IDxqYW4ua3JhdmFsQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNf
UFlUSE9OMz15wqB3YXMgcmVtb3ZlZCBieSBtYWtlIHNhdmVkZWZjb25maWcuIEFjdHVhbAo+IHZh
bHVlIGRpZCBub3QgY2hhbmdlLCBpdCBpcyBlbmFibGVkIGF1dG9tYXRpY2FsbHkgYnl8QlIyX1RB
UkdFVF9VQk9PVF9ORUVEU19QWUxJQkZEVCwgd2hpY2ggcmVtYWluZWQgdW5jaGFuZ2VkIGluIHRo
ZSAKPiBkZWZjb25maWcuIElmIHRoZXJlIGlzIHNvbWUgcmVhc29uIHRvIGtlZXAgdGhlIGxpbmUg
aW4gdGhlIGRlZmNvbmZpZywgCj4gcGxlYXNlIGxldCBtZSBrbm93LCBJJ2xsIHNlbmQgcGF0Y2gg
djIgUmVnYXJkcywgSmFuIHwKCk1ha2VzIHNlbnNlLCBubyBuZWVkIHRvIHNlbmQgYSB2MiB0aGVu
IQoKQmVzdCByZWdhcmRzLAoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBh
bmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5k
IHRyYWluaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
