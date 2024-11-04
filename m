Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10138D1CA01
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 21:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAC8860787;
	Mon,  4 Nov 2024 21:59:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DXdxSLEgOrH6; Mon,  4 Nov 2024 21:59:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E81B7606BB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E81B7606BB;
	Mon,  4 Nov 2024 21:59:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C53F0723
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 21:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A60B3805B8
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 21:59:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u8dh-EFlZF_X for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 21:59:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A39D480E47
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A39D480E47
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A39D480E47
 for <buildroot@busybox.net>; Mon,  4 Nov 2024 21:59:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CDD311BF207;
 Mon,  4 Nov 2024 21:59:11 +0000 (UTC)
Date: Mon, 4 Nov 2024 22:59:11 +0100
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
Message-ID: <20241104225911.2f54430c@windsurf>
In-Reply-To: <20241025085211.615132-1-francois.perrad@gadz.org>
References: <20241025085211.615132-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730757552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w0rhKNeMAltx8xgJOcYWfSe3x+WAiH2xrt1/U7Ln9z0=;
 b=ezKHLjtUdtS2A/kLv+QBem4qjzquna0X3QxFFH5jSBupa2TD8eqZfNUtSpeXraqlOQeP9y
 X104HvZ+u1oGNM10/b1WNejhiMll//CMrAPNtnh/927HEvrkFCB1mP4QiBcoMnkvoxgyfT
 KgptQubHIxAssKBUv8O4Z1ItmfxmaZjfSsqmtYkCd82BDB5PKaW2Bof4TzhaD8txk4Zcdf
 9kQJGWg8nT3rjQ+4d+7TUPrTjYZqUtebXhC/qt4Ll8k7xZP7kLOt3QGb0lSk9JMG+Kb+hr
 vYE7xtMvCRYkedDkUyl4v6WLHmmZOOLBrHdXR62nmVB+KlX87dVMQu7XZUQqPw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ezKHLjtU
Subject: Re: [Buildroot] [PATCH] package/lua-lsdbus: bump to version
 ae5e674e5e792dd72e4164c436ca7b064158e7c6
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 25 Oct 2024 10:52:10 +0200
Francois Perrad <francois.perrad@gadz.org> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/lua-lsdbus/lua-lsdbus.hash | 2 +-
>  package/lua-lsdbus/lua-lsdbus.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
