Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B395CE7A8E
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 19:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A091540361;
	Thu,  5 Sep 2024 19:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nl_Cjyruvlk0; Thu,  5 Sep 2024 19:46:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B78D040EA3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B78D040EA3;
	Thu,  5 Sep 2024 19:46:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 77D941BF423
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 19:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43C7E81467
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 19:46:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9pt-WlYfDebG for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 19:46:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 48EDA8129D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48EDA8129D
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 48EDA8129D
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 19:46:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2F9B7E0003;
 Thu,  5 Sep 2024 19:46:37 +0000 (UTC)
Date: Thu, 5 Sep 2024 21:46:36 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240905214636.06d7b10a@windsurf>
In-Reply-To: <20240905051925.3337643-1-james.hilliard1@gmail.com>
References: <20240905051925.3337643-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725565597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bZ3Ys88D9oxdyBa40aU620FGV/lp8L40UA735V3X7QY=;
 b=KBmqpwmpCuxZcBoDXWPXbmKDEcMUZunPDhCwzzMqEtOTeh9wc3EValjjPYbZMqN6qcQABm
 CBQ7IlZ4+HrynM9xssi48QV3C9YKCZVGHC2MLuFSj8HbhksKijqGyaBevtYtEqdijhDi9B
 1oSRgyUc7Yy2iQh2RMDmuSEXuRF26fQSfFf6fH+RUJYd6uzOFjAfRPf5valkW44c77aGpU
 jqY+a4lI358vPqf+sJOXv2FkE+G8C2hdpKRG+9rRSgu3m11DSHdBfREWnnVB8H61qsvP+V
 GvJ5Ah0WBGxIPYKSPT96xvXWm34IFNJkNodebTqlIiNv5Z/SxuX4qEZzk+J0Uw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KBmqpwmp
Subject: Re: [Buildroot] [PATCH 1/1] package/python-sentry-sdk: bump to
 version 2.13.0
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  4 Sep 2024 23:19:25 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-sentry-sdk/python-sentry-sdk.hash | 4 ++--
>  package/python-sentry-sdk/python-sentry-sdk.mk   | 4 ++--
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
