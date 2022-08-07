Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B77E0C19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 12:42:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6027A81328;
	Sun,  7 Aug 2022 12:42:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6027A81328
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J8mD48O6wP3u; Sun,  7 Aug 2022 12:42:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95F9E8131A;
	Sun,  7 Aug 2022 12:42:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95F9E8131A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0F9831BF2F0
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 12:42:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DCB1D410C6
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 12:42:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCB1D410C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GlSzyGBLH95n for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 12:42:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 880024089B
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 880024089B
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 12:42:18 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B1D0B240004;
 Sun,  7 Aug 2022 12:42:16 +0000 (UTC)
Date: Sun, 7 Aug 2022 14:42:15 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220807144215.43b7119f@windsurf>
In-Reply-To: <20220807093135.209053-1-fontaine.fabrice@gmail.com>
References: <20220807093135.209053-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659876137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v6fDQLniQLWy3SRfWIu59Fp/K9hsYbj3F/QJIIi/qng=;
 b=IYRZ0pNLANPNc5mw/gJcFB0up/nzEGenwixlRFYAv0iJE30LQQmy/LvKuytpRyV/H/NBo8
 XVR0MWJBl/PsbNcZEkmb3K7kN7pjX4KX8myUamSjxypqTuAsRMf24a/hHCeWz+aTYut5+K
 JrBDWN7QdQcftuGjD1tVRAd5QN8IL1lX8VOWVwlYiA4DqXmoD4+yM13REn/7VsmLcr5Avu
 7Scj/Ao+fLGvs4fGvhl0/4KOQ5UedXODAfTXfkmWzmMdeIUCx1hv79UdhdHV9H4zm8/bFR
 xlxW7WFOFbLWmeppTYHYZCbi2TtyINJEdlm2+7kyDzL+IGSSO4QqmBP102sZZA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IYRZ0pNL
Subject: Re: [Buildroot] [PATCH 1/1] package/lapack: fix build without
 BUILD_COMPLEX
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
Cc: Benjamin Kamath <kamath.ben@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  7 Aug 2022 11:31:35 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure without BUILD_COMPLEX raised since bump
> to version 3.10.1 in commit b3e96b1fb0d0a7245cea6921fcdd7986762e5ec1 and
> https://github.com/Reference-LAPACK/lapack/commit/bd1fba15d0d6f54891cb822f4ab2e8afd0a3ea4b:
> 
> CMake Error at LAPACKE/CMakeLists.txt:38 (message):
>   LAPACKE_BUILD_COMPLEX requires BUILD_COMPLEX to be ON
> 
> CMake Error at LAPACKE/CMakeLists.txt:38 (message):
>   LAPACKE_BUILD_COMPLEX16 requires BUILD_COMPLEX16 to be ON
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/418d15f734c87a70edf0d670c0548d550e6e70ba
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/lapack/lapack.mk | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)

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
