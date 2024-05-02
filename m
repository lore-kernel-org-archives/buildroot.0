Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D81F0C04FFE
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 07:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8E29410EA;
	Thu,  2 May 2024 07:49:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 42VnCFu-PtD6; Thu,  2 May 2024 07:49:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 652EE415A5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 652EE415A5;
	Thu,  2 May 2024 07:49:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 20E0D1BF83C
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 07:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8E6E60DFF
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 07:49:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AW3XMJ3GPWBA for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 07:49:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C3EC36063C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3EC36063C
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C3EC36063C
 for <buildroot@buildroot.org>; Thu,  2 May 2024 07:49:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1CD58E0007;
 Thu,  2 May 2024 07:49:31 +0000 (UTC)
Date: Thu, 2 May 2024 09:49:30 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240502094930.798b43da@windsurf>
In-Reply-To: <20240411210147.2127938-1-bernd@kuhls.net>
References: <20240411210147.2127938-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1714636171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GKzuJFhC7vgNRH9NAk20woxj3fc1IvXMUYUXVoMv8cM=;
 b=kyqJh4htj+TIvLKOPyVLAvRlWRXcl4i9zHXpyTZk/b/v1Fk2LQ38tuKqPF2LDAVIO0ZqYt
 rMARl5zQnj9HLxh4/1yKZ+nVA5QsNxCupUzvftU0ltIz2e5J+mRCT6QNIk8CL8Vppv1ZuK
 hiGozh/B4JQMCOBtLu/NXJp/55L/25vsflti5EqCbKMSltYC25MzbPOjflcmTYkr+FZhnR
 EEX3NMLhfwpeQMQOrjrLieCaSPO8ULPnQaRxHe2yp1vrBXbxV4K19LNEmoGq+Y7vIxt39V
 J+6KyU7r4ZpODTukAn/Fngyiw/EXPHneAijumNvXEfz7WN3r2jWBjl5EpeJHfg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kyqJh4ht
Subject: Re: [Buildroot] [PATCH] package/libminiupnpc: bump version to 2.2.7
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

On Thu, 11 Apr 2024 23:01:47 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Update license hash due to copyright year bump:
> https://github.com/miniupnp/miniupnp/commit/e370f25e911d7e37d57c07d62ba1f3e24d1479ab
> 
> Changelog:
> https://github.com/miniupnp/miniupnp/blob/master/miniupnpc/Changelog.txt
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libminiupnpc/libminiupnpc.hash | 4 ++--
>  package/libminiupnpc/libminiupnpc.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
