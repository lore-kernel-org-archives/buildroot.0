Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2091DC3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 08:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E172A40108;
	Tue, 23 Jul 2024 08:51:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1pbeq-YtnQc0; Tue, 23 Jul 2024 08:51:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1307409E5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C1307409E5;
	Tue, 23 Jul 2024 08:51:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4A6051BF29D
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 08:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43805401F8
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 08:51:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 94tvqJwCwabF for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 08:51:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2F50D4028C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F50D4028C
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2F50D4028C
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 08:51:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D7EA7240004;
 Tue, 23 Jul 2024 08:51:51 +0000 (UTC)
Date: Tue, 23 Jul 2024 10:51:51 +0200
To: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Message-ID: <20240723105151.0c071de5@windsurf>
In-Reply-To: <20240722-optee-bump-v1-0-8e25b342634d@ti.com>
References: <20240722-optee-bump-v1-0-8e25b342634d@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721724712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7POHhXEhCdzcN7M/sxdKy0fz7q5Fa56i5S7rVajag/I=;
 b=gaSWDwJR3YYsyYy3lH6YQwAUtoyc8GfpV7BhSG8QsDj/ilhHb36IaORKZMVZTYbFo5Y18c
 eReDp/PbbhP5W5w/HnGgmW2vS7geQpd2sYvBseEOOAx2MtIZa4o9dmb0dcgQmWYl7vJNv6
 7EeBgJns7X0dqiGMcKW3PlZXrnMyW2zMtaGBvwI0ROCFOYnE4tguKS4PsFNAikOEoqF30b
 gC7oJ/xr5jQtf/H4ttlBqTYkq86yh1rCzEspG/qKIw+3wv9IG9gKAuGteQ0+YeyrEwAZlZ
 /EMPMq7QixUP3xyd0F9X/SChqQ3kFbI8q0BpNexGdQtRNZf5NilNUkAvEcnIlw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gaSWDwJR
Subject: Re: [Buildroot] [PATCH 0/4] bump optee to 4.3.0
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
Cc: Bryan Brattlof <bb@ti.com>, Etienne Carriere <etienne.carriere@foss.st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 22 Jul 2024 20:32:05 -0500
Bryan Brattlof via buildroot <buildroot@buildroot.org> wrote:

> Bryan Brattlof (4):
>       boot/optee-os: bump to 4.3.0
>       package/optee-client: bump to 4.3.0
>       package/optee-examples: bump to 4.3.0
>       package/optee-test: bump to 4.3.0

Series applied, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
