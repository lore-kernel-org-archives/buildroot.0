Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C9D6D767FA
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 19:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1029981461;
	Thu, 31 Oct 2024 19:54:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oGdBLYZ_X915; Thu, 31 Oct 2024 19:54:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CC3F8148F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CC3F8148F;
	Thu, 31 Oct 2024 19:54:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A0B585E50
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 19:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81E154021C
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 19:54:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MskUDSGnAuIA for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 19:54:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0E681400D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E681400D7
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E681400D7
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 19:54:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A8C241C0005;
 Thu, 31 Oct 2024 19:54:31 +0000 (UTC)
Date: Thu, 31 Oct 2024 20:54:30 +0100
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Cc: buildroot@buildroot.org, Michael Fischer <mf@go-sys.de>, Anthony
 Viallard <viallard@syscom-instruments.com>
Message-ID: <20241031205430.45907fec@windsurf>
In-Reply-To: <e229fa46-f9ef-4ab6-b7d2-523809e2a3d6@grenoble.cnrs.fr>
References: <7a7eb00c-ce72-4a05-adf2-7229578c0030@grenoble.cnrs.fr>
 <e229fa46-f9ef-4ab6-b7d2-523809e2a3d6@grenoble.cnrs.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730404472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qnwf9SV5f2rXEesuDL4tzjIXPk9hcP+LnakMPkJnnCg=;
 b=hCXIDE+Nxd7gxE/cRxZfHd45VCUWFxUNCp1TlmfUZYkrsz/MhzNsb3s18CUz8yDddCl29j
 9YYBxYs321QzAUepPhQw3LcdzvFokpwxKuEjSnt1OSQbBamhZPHU1EeB4C4sojzxxGjkwn
 KCBF63k/Ti3Y9jTo7cQdQElZx+vgr1fHBXAir92myfn7+YQCfglP/NmlxjjBCjODpXHxbW
 GBfQLtuYfPGK30+EOKgjJK9qhFRlFOuWZ+50Lq3nyxQenOxNySUERdBwlHRWHeG3DkVg2B
 SwSHOgX7lGQzmBWwIuiJnURnmn7vvIbPjtII501V/iOGhzdojPMDhcCZm+IpIw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hCXIDE+N
Subject: Re: [Buildroot] [PATCH v2 1/1] package/gnuplot: fix build failures
 on undefined FE_UNDERFLOW
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

On Fri, 27 Sep 2024 14:09:01 +0200
Edgar Bonet <bonet@grenoble.cnrs.fr> wrote:

> Gnuplot carries the implicit assumption that, if the header fenv.h is
> available, then it must define FE_UNDERFLOW. This assumption fails on
> microblaze{,el}, mips{,64}{,el}, nios2 and or1k.
> 
> Fixes:
>   - https://autobuild.buildroot.org/results/aa177c4f4f7c7429f052cebbf54f7027e4b2cabd/
>   - https://autobuild.buildroot.org/results/868ca441daa2485b997f307edeede31dd229bfc2/
>   - https://autobuild.buildroot.org/results/0a152cbfe23703bc5012098864d7fd5608775882/
>   - https://autobuild.buildroot.org/results/d43be86091c9bd9163c145264151532f0f485528/
> Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
> ---
> Changes v1 -> v2:
>   - replaced the submitted patch with the version accepted upstream
>     (different title and slightly different contents)
>   - removed Upstream: link to the submitted patch
>   - added Upstream: links to the accepted commits (for 'master' and the
>     'branch-6-0-stable' maintenance branch)
>   - in the commit log, updated the list of architectures where the build
>     fails
>   - in the commit log, updated Fixes: links to point to the latest
>     failure on each architecture family

Applied to master, thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
