Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6560DC5321D
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 17:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC122810FC;
	Fri, 23 Aug 2024 17:40:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x0IGaDDKYKkl; Fri, 23 Aug 2024 17:40:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE5CE81A50
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE5CE81A50;
	Fri, 23 Aug 2024 17:40:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E92621BF34F
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6ABF612F6
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:40:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PdIScR8bu-7B for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 17:40:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E0D42612EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0D42612EC
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E0D42612EC
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 17:40:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 30AB11C0002;
 Fri, 23 Aug 2024 17:40:38 +0000 (UTC)
Date: Fri, 23 Aug 2024 19:40:37 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240823194037.6bdee995@windsurf>
In-Reply-To: <20240820000325.2453824-1-james.hilliard1@gmail.com>
References: <20240820000325.2453824-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724434838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xioc6fbca6z1rU/VM0EceYOqvw17WhiJgBNtKGDTA7Y=;
 b=ejabLQufHHcRB7rZl+/C3Brv/K+N8sMlrKLzkPGNwWmxnIbhf6nfBrQBYTF+zMBvaBb45Z
 VuREjCU7lS0L4nWTJaPmyEHn5kHB5TsmUwvU1WTGFcGd7fci2XnTIhY6zR60hFCwMcskSv
 5pmNAp9zptvpGsD01iysrZPpE/leRWDSIn8M7Ju65blY6LL8hDXqKSpTYmiezxpshC5kzq
 Nq2rc9FdFw7Z3SlDUdjv1DqFRzeOj00bjZfgoq1ssfu9l4PSwhm2QRVaV0Llv43CftZQ/s
 wjl9CQj+mHipfuIp4QNwMPHlKW8nvLfLw458rT/1bwgluoI4SvAP3RpJ85yDbg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ejabLQuf
Subject: Re: [Buildroot] [PATCH v4 1/1] utils/genrandconfig: allow
 overriding KCONFIG_PROBABILITY
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

On Mon, 19 Aug 2024 18:03:25 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Tweaking this variable should allow us to get better coverage of
> packages with larger dependency trees.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v3 -> v4:
>   - rebase
> Changes v2 -> v3:
>   - rebase
> Changes v1 -> v2:
>   - rebase
> ---
>  utils/genrandconfig | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)

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
