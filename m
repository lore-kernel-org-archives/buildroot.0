Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F121EC001E0
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 19:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DB0B41C54;
	Thu, 10 Aug 2023 19:55:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DB0B41C54
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZFKDdQkOVrGJ; Thu, 10 Aug 2023 19:55:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CA6C41603;
	Thu, 10 Aug 2023 19:55:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CA6C41603
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C96FC1BF5A6
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 19:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A36AE82314
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 19:55:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A36AE82314
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id njYEK28tvRuH for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 19:55:21 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 819AE822A3
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 19:55:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 819AE822A3
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9802E240003;
 Thu, 10 Aug 2023 19:55:19 +0000 (UTC)
Date: Thu, 10 Aug 2023 21:55:18 +0200
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20230810215518.0208983e@windsurf>
In-Reply-To: <20230809215221.29965-1-ps.report@gmx.net>
References: <20230809215221.29965-1-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691697320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sN4b70kL/Kih5ZJYQ/WB4bUaXbwPEmzUMzXfa9SYn+s=;
 b=hBCRa9jB+9/IciJN97tYUwH+csQirG0Ibnj0e0qbON7uV+Ot5hASwdXwG3KS+Ltwcxciro
 1vvvTB3QXTb0pfZw3R8Xn/IC+Ipdf/KvjNzIaxDS3I5/1Wa/o9u6ej6ZYmj6UJCkKSPBgo
 LpuRGGLbyFT0ePiF1MmBhnu3DTW1rkhO4jk/4N9trPOCsE45qXKaKjprX8AjrbdKfXpV21
 jn8KXMIS8tq+aSkQu/7w/WxYutL8TKY8RenFxDlb77KNYHt381MySwRz0I6Dr5kEs3qHoo
 Pa8a2ftxIO+bcbZzB1BkrT4Fzusn9uw/VNI9ZffN69fsNed74bKZCNsDDJ2P+Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hBCRa9jB
Subject: Re: [Buildroot] [PATCH v1] package/libserial: fix gcc-13.x compile
 (add patch to add missing cstdint include)
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
Cc: Simon Dawson <spdawson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCAgOSBBdWcgMjAyMyAyMzo1MjoyMSArMDIwMApQZXRlciBTZWlkZXJlciA8cHMucmVw
b3J0QGdteC5uZXQ+IHdyb3RlOgoKPiBBZGQgcGF0Y2ggdGFrZW4gZnJvbSB1cHN0cmVhbSBwdWxs
IHJlcXVlc3QgKFsxXSkgdG8gZml4IGdjYy0xMy54IGNvbXBpbGUKPiBmYWlsdXJlIGJlY2F1c2Ug
b2YgYSBtaXNzaW5nIGNzZHRpbnQgaW5jbHVkZS4KPiAKPiBGaXhlczoKPiAKPiAgIEluIGZpbGUg
aW5jbHVkZWQgZnJvbSBsaWJzZXJpYWwvU2VyaWFsU3RyZWFtQnVmLmg6MzYsCj4gICAgICAgICAg
ICAgICAgICAgIGZyb20gU2VyaWFsU3RyZWFtQnVmLmNwcDozNDoKPiAgIC4vbGlic2VyaWFsL1Nl
cmlhbFBvcnRDb25zdGFudHMuaDo5MzozNzogZXJyb3I6IOKAmHVpbnQ4X3TigJkgd2FzIG5vdCBk
ZWNsYXJlZCBpbiB0aGlzIHNjb3BlCj4gICAgICA5MyB8ICAgICB1c2luZyBEYXRhQnVmZmVyID0g
IHN0ZDo6dmVjdG9yPHVpbnQ4X3Q+IDsKPiAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXn5+fn5+fgo+IAo+IFsxXSBodHRwczovL2dpdGh1Yi5jb20vY3JheXpl
ZXd1bGYvbGlic2VyaWFsL3B1bGwvMTg2Cj4gCj4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgU2VpZGVy
ZXIgPHBzLnJlcG9ydEBnbXgubmV0Pgo+IC0tLQo+ICAuLi5zaW5nLWNzdGRpbnQtaGVhZGVyLWZv
ci11aW50OF90LXR5cGUucGF0Y2ggfCAyOCArKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBj
aGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2xp
YnNlcmlhbC8wMDAzLUFkZC1taXNzaW5nLWNzdGRpbnQtaGVhZGVyLWZvci11aW50OF90LXR5cGUu
cGF0Y2gKCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpUaG9tYXMKLS0gClRob21hcyBQZXRh
enpvbmksIENUTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5n
Cmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
