Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20576C531DC
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 21:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA0C940B7F;
	Tue, 20 Aug 2024 21:34:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0JnwB4WbXOK3; Tue, 20 Aug 2024 21:34:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B78AB40BAE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B78AB40BAE;
	Tue, 20 Aug 2024 21:34:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 61CDC1BF3B8
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 21:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 50206811D0
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 21:34:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7sOr6JCCQ6sp for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 21:34:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4B08880FB7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B08880FB7
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4B08880FB7
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 21:34:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2951920009;
 Tue, 20 Aug 2024 21:34:17 +0000 (UTC)
Date: Tue, 20 Aug 2024 23:34:17 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240820233417.6016bac0@windsurf>
In-Reply-To: <ZsSwnkkSQUhjoTEH@waldemar-brodkorb.de>
References: <ZsSwnkkSQUhjoTEH@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724189658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NGc2teeFCgeiPo4fQmavNLvrRpNsu19qh1O5BllUsPw=;
 b=V7jUHY0MDoyrP/ho9D7GoK3qVoxuMWESkC4POJlEXMsXLlPo+qWgbsITEXSAWu73NtgB5O
 HpAnqlQvIzZtexlhdaoKCejbkloGKAjeR4c69Rrd7mHdGysDNvt5yJXRGGYdN6XfU8tF18
 lAjfQdNZxkiJ5qsWpHTafdYWVpEra9b0Ab46yHoimC0lDGhxj2r5HOyB0NQxTZjJhXIj6t
 jTZEcz4bubUY6zs/UPVAxX7X4z/YxtK2E0gyZpwCaNQyMAWh1NmEIZ3YLWr8FDt3jLTEt6
 chjCuFOeCMtPo+QU9sRMAdFYD7n8ct4i7NyfMqoJcdxoxHw3WjFC6pDrz5wCHw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=V7jUHY0M
Subject: Re: [Buildroot] [PATCH next] package/batman-adv: update to 2024.2
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
Cc: Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 20 Aug 2024 17:05:02 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/batman-adv/batman-adv.hash | 6 +++---
>  package/batman-adv/batman-adv.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
