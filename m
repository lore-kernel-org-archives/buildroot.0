Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA9AC3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 16:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DF7482004;
	Fri,  2 Aug 2024 16:51:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZhqEadz6dAQk; Fri,  2 Aug 2024 16:51:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3423782107
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3423782107;
	Fri,  2 Aug 2024 16:51:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1F6CD1BF3EF
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 16:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 192F1404ED
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 16:51:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FPvYFbNmECGj for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 16:51:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C50CC4039D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C50CC4039D
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C50CC4039D
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 16:51:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A9686240003;
 Fri,  2 Aug 2024 16:51:21 +0000 (UTC)
Date: Fri, 2 Aug 2024 18:51:20 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240802185120.2bbc1425@windsurf>
In-Reply-To: <20240723093312.770586-1-fontaine.fabrice@gmail.com>
References: <20240723093312.770586-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722617481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fqayiDIq8FSccgztjXtu4ZVvibeLO7o8odLmTBN1VZ0=;
 b=HX8mo8/qKSmkMXy83CU/vuMrLfLZD0lv5d5XiZQtNQhNv6BGrNGlZVnHNSMYdtCTQh0M54
 +ir8WoV+0NfPhtimKrplEk78FVLv7fiEZyOrOxij1S0Z44eySD32qa4Mp1vFI3A9ovFJgz
 QM/6m0XjZwAIEKSKaXiNzEIXovuM8kZqbOpZBXibE5XLem9mlKXE2HJ+Gwcl1/Ii64gX58
 Q+7pN0F6WajUngamZrIaaXaQwxQ3ZVSyWwhkNwd8pOYR/YhWe5HRtKCa5HbG4UD8eXEdeG
 Q99LCG0b/NdA+b+hxcoSxJCI3XY2TUKv2drqm6XNVhOkODwK2WLZBmfxeyZYBA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HX8mo8/q
Subject: Re: [Buildroot] [PATCH v3,
 1/1] package/cwiid: fix build with gcc >= 14
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 23 Jul 2024 11:33:12 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with gcc >= 14:
> 
> led.c: In function 'wmplugin_exec':
> led.c:86:42: error: assignment to 'struct cwiid_btn_message *' from incompatible pointer type 'struct cwiid_btn_mesg *' [-Wincompatible-pointer-types]
>    86 |                                 btn_mesg = &mesg[i].btn_mesg;
>       |                                          ^
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/a3bde74ff2137d088f4261e62930859bfe460cb9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v2 -> v3:
>  - Fix patch number
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Fix variable declaration instead of adding a wrong cast

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
