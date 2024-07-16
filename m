Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8485AC3DA49
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 21:25:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2AE7140C05;
	Tue, 16 Jul 2024 21:25:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qgwngCQXpr7Q; Tue, 16 Jul 2024 21:25:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E894540BF4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E894540BF4;
	Tue, 16 Jul 2024 21:25:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 270281BF37B
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 21:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10D5C409FA
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 21:25:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3wVWqLaOwHoa for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 21:25:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9274040C0A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9274040C0A
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9274040C0A
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 21:25:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DA5C01C0002;
 Tue, 16 Jul 2024 21:25:25 +0000 (UTC)
Date: Tue, 16 Jul 2024 23:25:25 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240716232525.529808b4@windsurf>
In-Reply-To: <20240716162412.1741036-1-james.hilliard1@gmail.com>
References: <20240716162412.1741036-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721165126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PWufRTR1J9FqiyWtMiqB0KE9+tWspG6y22RExtQ0Iso=;
 b=VNvP3BfRFObPL4HPIwywSy+s0EAqD6W9UIwcI7McOTTY3J0oxF4oPc4YFYHCI+qmlb2bdh
 3nkZs4Ou4/xwAlXEI3vMhgn/bxtABrNQQqW+hS13AHj7Y40OvmZLuuKzFwbOzG3wcefv8L
 b4neqPKnbEIP7/F7XoqRrn27wKQbSmqPzQi/A0Q6LZhzkBZzEQaeV1zcZhZbArHIwOxlP7
 F4SrYLYTcdKg/1ydAEW/Ft2JiVGC+jqx3idUA1FqfPuXtIGH5BMqgK9Ma+02CQPmxI2nyg
 fIkz2ZxvWN6Z+brHdLC+J5KU60SVWtueKcLIedMiPVhnSrTeL9aosc7wHX2LQA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VNvP3BfR
Subject: Re: [Buildroot] [PATCH 1/1] package/libjcat: fix package name in
 comment
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 16 Jul 2024 10:24:12 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/libjcat/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
