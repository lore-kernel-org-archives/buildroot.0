Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F1F4C87FCF
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 15:39:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26E1580B44;
	Sun, 10 Aug 2025 15:39:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xG7vjyIiK-cd; Sun, 10 Aug 2025 15:39:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E57180B9E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E57180B9E;
	Sun, 10 Aug 2025 15:39:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C3A1D154
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 15:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9BF940CB6
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 15:39:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nDpwu966T_XW for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 15:39:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0F12D40C86
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F12D40C86
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0F12D40C86
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 15:39:23 +0000 (UTC)
Received: by nyx.n621.de (Postfix, from userid 1000)
 id B37B2E00346; Sun, 10 Aug 2025 17:39:21 +0200 (CEST)
Date: Sun, 10 Aug 2025 17:39:21 +0200
From: Florian Larysch <fl@n621.de>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org, Simon Dawson <spdawson@gmail.com>
Message-ID: <20250810153921.ihmmge4dqvtxtbel@n621.de>
References: <20250810150509.13653-1-fl@n621.de>
 <d84a5c0a-2cc5-462b-9b28-bb5ad63c6adb@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d84a5c0a-2cc5-462b-9b28-bb5ad63c6adb@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1754840361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6TRN0SWamzA+K7UGLyrHLQcSd59Quk/ImSsCwbo0oIY=;
 b=uhAttPGgKYcpP8dEP3Wf5CyM5F8bALrdhG7KJSHBZlNN5VSPaFCJVTjiGC225YOLUAooAm
 sMPEhsXzlD0ehvDBOhsGIjiHH3FvdhWQe3Npsc3Kaa9I9dVwuRnUgkX9hRoMn2B9Zqs48z
 0hbA3yCSb6ksP5QtDEr2uXT7vW8Yfp4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=uhAttPGg
Subject: Re: [Buildroot] [PATCH 1/1] package/nanocom: fix build with GCC 15
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Aug 10, 2025 at 05:32:27PM +0200, Romain Naour via buildroot wrote:
> I'm able to reproduce the issue with gcc 14 (note the config used by the
> autobuilder also uses BR2_GCC_VERSION_14_X=y).

Fair. The implicit function declaration problem triggers with GCC 14 and
GCC 15 triggers both. I'll reword things to make it more specific. Or
would you prefer that I split the patch into one for the GCC 14 issue
and one for the GCC 15 issue?

Florian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
