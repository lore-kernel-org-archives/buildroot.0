Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDD7D13572
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 18:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8F554068D;
	Sun, 27 Oct 2024 18:45:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 56PP6yVIBWE3; Sun, 27 Oct 2024 18:45:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79E93406D5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79E93406D5;
	Sun, 27 Oct 2024 18:45:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F0C2AEE
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A68080F1F
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5uZJZ6MUNuzY for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 18:44:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 707C880D0A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 707C880D0A
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 707C880D0A
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C8A2BFF803;
 Sun, 27 Oct 2024 18:44:45 +0000 (UTC)
Date: Sun, 27 Oct 2024 19:43:05 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20241027194305.1da29e3e@windsurf>
In-Reply-To: <20241026210234.2668381-1-bernd@kuhls.net>
References: <20241026210234.2668381-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730054686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4wHs0lemk696XCi1w0C/kEnyavFPXBwxDqtmsLUFH4Y=;
 b=fMZJSC+na+wdxi2CpKJ3rimXbiQigx0FriZJguFVES9Cw6CUJ3tqPz5ifxF/xSFtq/Juhb
 LDzJK8XRpsBwsZjCitvpIF01xByffVe7E012u86rKVKigjjCgylBQKsxX6p97n55a41dxT
 uXFqdtN00kKtuPGqzauavw/l4xkC0d9tPPRsU8VHtga6D9Ak2qw8qNlU2yJHAN/FsG0vKQ
 wfGEMRRDeBHe42rk3yPbzOKb8YDm1YMg+nsrmPUzJzVpFsNlkLxTRw7d/jGR9qneOxGI6f
 7Kl6RXk92KFNihxVu1V7QyESfEOy6QUYprsGx5RAuYuOlfI/aPIc3SOnqq7p1w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fMZJSC+n
Subject: Re: [Buildroot] [PATCH 1/1] package/jsoncpp: bump version to 1.9.6
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

On Sat, 26 Oct 2024 23:02:34 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://github.com/open-source-parsers/jsoncpp/releases/tag/1.9.6
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/jsoncpp/jsoncpp.hash | 2 +-
>  package/jsoncpp/jsoncpp.mk   | 2 +-
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
