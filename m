Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1254CC61DD9
	for <buildroot@archiver.kernel.org>; Sun, 30 Aug 2026 03:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9FF64069D;
	Sun, 30 Aug 2026 03:18:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7XoNECTYaQI0; Sun, 30 Aug 2026 03:18:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788059893;
	bh=sV1QlD+tTVGN42ZtuYzRqDVvQbuuB0VzrpRse0bVdNA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f4pwQwknNslU9VWi/cnUsiQWwgNfXXJQ91DaZe2kdME2P3WA1df8CIlOZ9Fzsm7Ko
	 dmSFlBaEEQ1UdPwvPi9acmeA48XAz+2s6gaUftgRo9B2SNLrI+LNTXfcWKYndnp+sw
	 9EdxW6WJL7RTnv+cAq1q6iOfGgTOcgDpJCXXJU+DoR1P3zQWJYffqB1NNWt25+m2Xf
	 XkLYv0MBv6uvKTagG782LYpIZJ7wEqOWhvzZ7+O+3PE1l6UVUg5ST5P9oHKojOAURM
	 B0+mnuo6Taq8BVoqf2wz01swMPFouMPHH/uyXZ6RZzqx4cIMBdAzYV+n+oYBDHSlM+
	 aCa7FZviFrEJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E20BA40607;
	Sun, 30 Aug 2026 03:18:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A951355
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 03:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67FD780E15
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 03:18:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jg02NEhVjp47 for <buildroot@buildroot.org>;
 Sun, 30 Aug 2026 03:18:10 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=umbiko.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=0xZ8WwMy
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D859B80E0F
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 03:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=umbiko.net; s=mail;
 t=1788059884; bh=o08JUZvC1Lzf92Ou9xUSfjxoRWMBla4a5lIHRelDCu0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=0xZ8WwMywTOiikcdYxWcu/uTqzUdjumxzy+PKOM33hFahLgHejKJXKxfAyuzmPYAi
 vFACd2qfxlUAVt7F6L/1i6SNa/Zu2NeCu7yRvrKGii4G+aoCSkkeIHtrcdIb9Qk2a2
 OtKFRRvaRim4JupW7tTggZkHA6rpLx8ona0qQlWg=
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 68F3DBDE0DEE;
 Sun, 30 Aug 2026 05:18:04 +0200 (CEST)
MIME-Version: 1.0
Date: Sun, 30 Aug 2026 03:18:04 +0000
From: Andreas Ziegler <br025@umbiko.net>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Buildroot List <buildroot@buildroot.org>
In-Reply-To: <20260828194058.2405217-2-thomas.petazzoni@bootlin.com>
References: <20260828194058.2405217-1-thomas.petazzoni@bootlin.com>
 <20260828194058.2405217-2-thomas.petazzoni@bootlin.com>
Message-ID: <0c9a1ffb5999588f85cc29e56a049137@umbiko.net>
X-Sender: br025@umbiko.net
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
Subject: Re: [Buildroot] [PATCH v3 1/2] package/libnfs: fix gnutls support
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

Thank you for taking care of this!

On 2026-08-28 19:40, Thomas Petazzoni wrote:
> In Buildroot commit a035a0f99fa3bbeca776d741bbdeb6c04b3b35c8, libnfs
> was bumped from 5.0.3 to 6.0.2, and 6.0.2 brought optional gnutls
> support.
> 
> Unfortunately, the gnutls support was a bit buggy, as the libnfs
> library ends up using gnutls symbols without being linked to
> libgnutls, causing build failures down the road when other packages
> try to link against libnfs.
> 
> We backport 3 commits from upstream 6.0.2..7.0.0 to address this
> issue.
> 
> Fixes:
> 
>   
> https://autobuild.buildroot.net/results/b070248b2bceaceaaed8e826b1247ccfba1ba9fb
>   
> https://autobuild.buildroot.net/results/e1461b76121addd8f04f08819b2e3e453a12c679
>   
> https://autobuild.buildroot.net/results/87c79193d2ea86f47e36232fe514837ad99c5f30
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Tested-by: Andreas Ziegler <br025@umbiko.net>
---
Tested on x86_64 (build, run)

Kind regards,
Andreas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
