Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F81DEED626
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 17:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CAEB407D4;
	Thu,  1 Jan 2026 17:37:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rHwaej0DkGN9; Thu,  1 Jan 2026 17:37:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 466CF40313
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767289037;
	bh=1P+5XQNEFFPsEZxlNy/J9xYyA8rMUcGNL+uefqo453Q=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qqR8nvjE7LYfiq5VjaSIcTRBhf7c0M8+9Jto7l4iHw3GNvM146OeLa41H0f++7Xcj
	 g4JLwCmiEeMB8IPz63ZCUo0+uUmdtzlCBbcheNuhR4l7bpyNdOdOu5FuWyPeoVg7ZR
	 XX9+n6k9HZDpylsEhoQsoCoWmQt6aLz7ODP140HHJTgcAP8+F7+WzUSg+WLmJVkOiV
	 xt0gulDqGpo5MVz/TcuyF9gp6zLrP7IoNDtnM2tIXSKSPjfHQHMe4+UkMnR25m/2Ol
	 PwJ6zH1nm75vU+dMvaK36EjS70ulUwEUAZnJu31gyZVohnrqcPJGLTkYvVE9k5PL6a
	 PCjJEEmzUP5mA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 466CF40313;
	Thu,  1 Jan 2026 17:37:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 63B47206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 17:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA6BC80F2B
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 17:37:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uDW1R4bCa83c for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 17:37:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A092880F37
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A092880F37
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A092880F37
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 17:37:13 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 504F64E41EDE;
 Thu,  1 Jan 2026 17:37:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 17AE860749;
 Thu,  1 Jan 2026 17:37:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0825B113B0712; Thu,  1 Jan 2026 18:37:09 +0100 (CET)
Date: Thu, 1 Jan 2026 18:37:09 +0100
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>
Message-ID: <20260101183709.2dcdedcb@windsurf>
In-Reply-To: <20250829074509.77782-1-thomas.perale@mind.be>
References: <20250829074509.77782-1-thomas.perale@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767289030; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=js/FyOAyyDe/nNwIaAtrHwJhp7D2J5fy8pUpZXz5fvs=;
 b=dHWD4XvpITqWdhycieuZavLE6NgUCftFJsSZX9XjMvkkgGdb+twFulOCwbFZVM78N41kUp
 tSS52r61vDJ+LWW1WBDXzaU1hn6Ba9WMrbW3FnhveoVivOVUTnwfOwMUhUJYJhyS71x88b
 7+abxh0IsdF2taW/rmQslSwAZcowxlVxQg4TaGbAL5O5/W8N8+U3zH5+TmeipQTrjpimyA
 RBUb90iPG/gkaLG/FIeGGg+JjDnpoNuKnT26JXxD6vwaTp1fbdDisIN0K/IwD+1g+OiM9h
 5zU5DI8ZJwdodOAwmmRoJmnXKfM8Iv815ey1UJgKuxM1EeX8q+2aILjMDILBHA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=dHWD4Xvp
Subject: Re: [Buildroot] [PATCH v2 1/2] package/softether: fix various build
 errors
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 29 Aug 2025 09:45:06 +0200
Thomas Perale via buildroot <buildroot@buildroot.org> wrote:

> This patch add several upstream patches that fix build error we are
> experiencing on the autobuilder related to host-gcc15 and gcc14.

Thanks, I've applied both patches!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
