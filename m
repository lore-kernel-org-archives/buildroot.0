Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEED0C3DA64
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 10:16:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8295B400FB;
	Tue,  6 Aug 2024 10:16:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0up_9Gl7i-4Z; Tue,  6 Aug 2024 10:16:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F03740119
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F03740119;
	Tue,  6 Aug 2024 10:16:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 13D7B1BF288
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 10:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51778400FB
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 10:16:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4WtqeHg5IAxh for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 10:16:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 12C1D40311
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12C1D40311
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 12C1D40311
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 10:16:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3801A60004;
 Tue,  6 Aug 2024 10:16:39 +0000 (UTC)
Date: Tue, 6 Aug 2024 12:16:38 +0200
To: "J. =?UTF-8?B?TmV1c2Now6RmZXI=?= via buildroot" <buildroot@buildroot.org>
Message-ID: <20240806121638.7f767d1f@windsurf>
In-Reply-To: <20240806-tipidee-fixes-v1-1-7f50779b0484@gmx.net>
References: <20240806-tipidee-fixes-v1-1-7f50779b0484@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722939399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=00g2QlTsv3D/H8PIFpB+pb7NJDsYUssZLALAbY3yhd8=;
 b=D7aBf9n/onAcMGUeNeRYVGF1e1MIwKYe1HeKzsqmeo2wNy7A5mGjUeBgb+Wq8u5bDLPM86
 T/zurs1qDZFBCqDKh4Xscqmmce4Hq91NtA0ihUHA6e5Edsg6IuUWAsyQLPGxIRUg+lCqyx
 oBvH1RxmA9WGbaNFpbdHwI2fgqgWSrHj08jNFvtlxmKWRJLVb6A473KQCMnfumi7z1u4If
 /ViLiPYD/MPySyjq1b5SYgqxziUBbAmC1kfxvVGy6WJ7GGiPzH7O2mEJ4dy8I8hkjYXuDG
 UFetQXwcjyI0cusL6MKJfeAa2hUULfno47MZGY3cKSDKYeeZsDsPUeE2U+zsCQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=D7aBf9n/
Subject: Re: [Buildroot] [PATCH RESEND] package/tipidee: Load config from
 /etc, not /usr/etc
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
Cc: "J. =?UTF-8?B?TmV1c2Now6RmZXI=?=" <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCAwNiBBdWcgMjAyNCAwMDoxNjowNSArMDIwMApKLiBOZXVzY2jDpGZlciB2aWEgYnVp
bGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cgo+IC0tcHJlZml4IGluZmx1
ZW5jZXMgdGhlIGRlZmF1bHQgb2YgLS1zeXNjb25mZGlyLCBzbyB3ZSBuZWVkIHRvIHNwZWNpZnkK
PiAtLXN5c2NvbmZkaXI9L2V0YyBleHBsaWNpdGx5Lgo+IAo+IEZpeGVzOiAxN2RlYWY2MGY2ICgi
dGlwaWRlZTogbmV3IHBhY2thZ2UiKQo+IFNpZ25lZC1vZmYtYnk6IEouIE5ldXNjaMOkZmVyIDxq
Lm5ldXNjaGFlZmVyQGdteC5uZXQ+Cj4gLS0tCj4gIHBhY2thZ2UvdGlwaWRlZS90aXBpZGVlLm1r
IHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKQXBwbGllZCB0byBtYXN0
ZXIsIHRoYW5rcy4KClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgQ1RPLCBCb290bGluCkVt
YmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
