Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE4ADD5B15A
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 21:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D1CE405F9;
	Mon, 28 Oct 2024 21:46:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8fFGVhB_ETL1; Mon, 28 Oct 2024 21:46:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BDD040604
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BDD040604;
	Mon, 28 Oct 2024 21:46:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 60BD9AEE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F42340015
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:46:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9QSHRCsXXFJE for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 21:46:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 938A6400D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 938A6400D6
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 938A6400D6
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:46:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6399920002;
 Mon, 28 Oct 2024 21:46:04 +0000 (UTC)
Date: Mon, 28 Oct 2024 22:46:03 +0100
To: Jon Henrik =?UTF-8?B?QmrDuHJuc3RhZA==?= via buildroot
 <buildroot@buildroot.org>
Cc: Jon Henrik =?UTF-8?B?QmrDuHJuc3RhZA==?= <jonhenrik@qbee.io>
Message-ID: <20241028224603.7631cfef@windsurf>
In-Reply-To: <20240906094356.565951-1-jonhenrik@qbee.io>
References: <20240906094356.565951-1-jonhenrik@qbee.io>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730151964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3CVoJDmPeOPjb+MgljIl5B8fm4dpUJHwJE9ZsF8YZFQ=;
 b=As4BY/LKEJrrFkXnzZFVpLtsm9nxUT+Gej/4AcbK2NoaDD7rsPLI6V9vVsdAELJjhkWiFd
 fmy3gx1OrT7864On34JgliyzY5z0WDDaL5ML5OfPcExOEv7bwyBWEIGfcIjwk2nwg56G/W
 ogHq23vZp6hOdqiAyAhJ4XsYWATcc2CsofSjt+FimzJkKmcsTpx7Hs4EM00Z/UxPFLtlnY
 WkxJxC4nJPRopiv4xQuVINMXfG3lncx1P6yGck5lA2dZEEpVNx6soSsg7uS7nT4JOK6mwi
 XAZ8/0ZVNOOrRnXSj7ZFvKw3xaWeMOKa+PNNbYar4ZAQtPBev+lbvgDKP0USkQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=As4BY/LK
Subject: Re: [Buildroot] [PATCH 1/1] package/qbee-agent: bump version to
 2024.36
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

T24gRnJpLCAgNiBTZXAgMjAyNCAxMTo0Mzo1NiArMDIwMApKb24gSGVucmlrIEJqw7hybnN0YWQg
dmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgoKPiBTaWduZWQt
b2ZmLWJ5OiBKb24gSGVucmlrIEJqw7hybnN0YWQgPGpvbmhlbnJpa0BxYmVlLmlvPgo+IC0tLQo+
ICBwYWNrYWdlL3FiZWUtYWdlbnQvcWJlZS1hZ2VudC5oYXNoIHwgMiArLQo+ICBwYWNrYWdlL3Fi
ZWUtYWdlbnQvcWJlZS1hZ2VudC5tayAgIHwgNCArKy0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4K
ClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgQ1RPLCBCb290bGluCkVtYmVkZGVkIExpbnV4
IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
