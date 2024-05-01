Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31BC9C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 19:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC04E820D3;
	Wed,  1 May 2024 19:37:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cg1jIW0reQm1; Wed,  1 May 2024 19:37:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 187A2820D4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 187A2820D4;
	Wed,  1 May 2024 19:37:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D9F0D1BF2C9
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:36:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C60D440736
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:36:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 44gMWhrNqDOK for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 19:36:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1EE6640735
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EE6640735
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1EE6640735
 for <buildroot@buildroot.org>; Wed,  1 May 2024 19:36:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 184521C0004;
 Wed,  1 May 2024 19:36:55 +0000 (UTC)
Date: Wed, 1 May 2024 21:36:54 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240501213654.4ee4e9c9@windsurf>
In-Reply-To: <20240330221122.1112448-1-fontaine.fabrice@gmail.com>
References: <20240330221122.1112448-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1714592215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BKnwLWBrp09amep9Vr+M+9nUs1ZjZu6dgR7frjiYGHU=;
 b=BcaMJMaubPWLE9DWDNj2bgEOaQ+uIKRNmcc2e6kKQsb6+u3a8GbxqEa8vUVn3x/C+CW2M8
 Dn5ajyJ1F3uAJISYh3ZdIXQ2YpIp78gJUMcwkgMAsS2tQEHqjzufy8f6N3yPSesvO4GKqh
 HvYf0RpE011mDGKmfOcJhRULZ+fFqbKK57UcifgBK1LVfh31f+fwxHT3yDu4daLbsc8SDC
 W7cAjn5MWX7VWvNDN45Lm4BqRw9ULuOs74klsxytFr7fOBzuclQyH4A8IEMQyZpCvlIjtP
 HlmAEwmYmGgRx8RcME3JUjpjpw5m/h82SuFIS7NUMoTGVpZalVS/t5QfGmdW2g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BcaMJMau
Subject: Re: [Buildroot] [PATCH 1/1] package/apcupsd: set ac_cv_path_SHUTDOWN
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 30 Mar 2024 23:11:22 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Set ac_cv_path_SHUTDOWN to /sbin/shutdown to avoid the following build
> failure when shutdown is not available on host raised since the addition
> of the package in commit d12b63b741586b89c4017551308c43512a617287:
> 
> configure: error: Missing required tool; need any one of: shutdown shutdown.bsd
> 
> Fixes: d12b63b741586b89c4017551308c43512a617287
>  - http://autobuild.buildroot.org/results/a8bbb5ced8343e08070361f260050de422144710
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/apcupsd/apcupsd.mk | 1 +
>  1 file changed, 1 insertion(+)

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
