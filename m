Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A738DC5472C
	for <buildroot@archiver.kernel.org>; Sat, 24 Aug 2024 07:19:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71CEB40392;
	Sat, 24 Aug 2024 07:19:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tf5yZ8WlqRdA; Sat, 24 Aug 2024 07:19:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67BB6403A5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67BB6403A5;
	Sat, 24 Aug 2024 07:19:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 03BF61BF2FE
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 07:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F38B760616
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 07:19:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 808qJgHd_65C for <buildroot@lists.busybox.net>;
 Sat, 24 Aug 2024 07:19:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D85096060A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D85096060A
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D85096060A
 for <buildroot@buildroot.org>; Sat, 24 Aug 2024 07:19:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 00A4DFF804;
 Sat, 24 Aug 2024 07:19:04 +0000 (UTC)
Date: Sat, 24 Aug 2024 09:19:04 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240824091904.059b0c38@windsurf>
In-Reply-To: <20240824060754.1929956-1-dario.binacchi@amarulasolutions.com>
References: <20240824060754.1929956-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724483945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gB84r00BagSvXZCRsHiQRC42aQBIHd7rHwWaRRyJ04w=;
 b=kU5nFRoPB6PirkXUmZylQ+nWHpPSAe80YnPXlMtNAiWi1GJSc+jtIJAK7YBwVMb2DEGiZm
 N4mAYLqsmcgIqgN7kIKuN+rDb6++EPuIEblzAK7/nOKjLKHa+Vngo6hXrxvFQcT+Atbxcc
 1gTjPMORsmPEm4jYvPvvSqvPDoFJmUjk9ImiR0DeVgOU9rtKGO4gTrLLheyjBbJUd8VJEv
 bD3uxE+ryiKv79it+4Ybtmd0gSyRxqnh3f2V5cl40ACbHMeNmXxAvuBlsdKIah8bRSXMh5
 FVFBbYeOxpkpwczpk5nsb2gtWb5zZVaUrRsu+YJaNEqwHnHbXS7MNaKN+EIhfg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kU5nFRoP
Subject: Re: [Buildroot] [PATCH v2 1/1] package/libcuefile: fix build
 failure due to implicit declaration
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
Cc: linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 24 Aug 2024 08:07:54 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> Fixes:
> - http://autobuild.buildroot.org/results/28f1e34166e836bf3b984f228bb09842840de82a
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---

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
