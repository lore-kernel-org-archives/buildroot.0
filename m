Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF4CD33992
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 14:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77048402EB;
	Mon, 28 Oct 2024 14:42:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fq2LhXrDY0Vi; Mon, 28 Oct 2024 14:42:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FE484018F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FE484018F;
	Mon, 28 Oct 2024 14:42:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E444AEE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 14:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F1404018F
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 14:42:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ro3vR9Vi_Jo for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 14:42:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 62E314002A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62E314002A
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 62E314002A
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 14:42:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DB1FA40010;
 Mon, 28 Oct 2024 14:42:45 +0000 (UTC)
Date: Mon, 28 Oct 2024 15:42:45 +0100
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Message-ID: <20241028154245.6855aa6b@windsurf>
In-Reply-To: <20241028124423.710867-2-buildroot@heine.tech>
References: <20241028124423.710867-2-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730126566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yv10+0xeO3knlX9hxb9AXVxB7A/oiqHRey4ju5Fsrw8=;
 b=YmO7wcKj2pn8OY1EcFfdDw3gVB2iPCnBU3HswqVLX7aq3DDdj7OmcvZ4UcuqvDJFnDGO1k
 f7C1khF4gC1EsHSj0JCDRevbXVYZbs1hs2hyueiwQE5bAaLirfGg2sla0TtuU6mDOWqlbQ
 AXG9K0acQ4C7JXXrzpmt3uqonKco8wkox92qu/589VXIVHWqjRjIlAKzWQgnHHDzI7BXOf
 UaowVSfBEulwzq4vI+SwQ6tlDQGUyoJXo0pY0WxPF+WmUyMK3rB0afOBqyd5uhcNLfUMXX
 OOKOFVJjVhYjGxMtSojiXMD27wQFSFxPNaybmrVw6kH3iV+UUhYZtBHRyrAy+Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YmO7wcKj
Subject: Re: [Buildroot] [PATCH] package/criu: fix comment condition
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 28 Oct 2024 13:44:13 +0100
Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:

> in e97fc89e7b a dependency on host-gcc >= 7 was added but
> for the comment the condition was not correctly inverted.
> 
> Fixes: e97fc89e7b ("package/protobuf-c: bump to version 1.5.0")
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  package/criu/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Good catch: applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
