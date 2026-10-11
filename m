Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C58ECA9EC9
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 12:32:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF6F440359;
	Sun, 11 Oct 2026 12:32:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h_7qGpJTluCN; Sun, 11 Oct 2026 12:32:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 841EE403C7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791721946;
	b=jzZBFl6PP9KepcL7FLMcXo7jFaKNCHnDvT/MiqSNEu4TOQwGgGrxHt1MSBpCR319tRku
	 Jf8Te/o3sHABVkXCJCRcMTqaCma7hBpSYkCsDSYMHBWrQTvfH6KG8gELxUtHNXjOGpEFT
	 lKDt9FknodkFkH4RNk+OHuo/4/Ts1EMqo4JMwgNU/36WGHhtclOno7oHT9ZmDipuviYBQ
	 w16RLEZc7be1uNwx128SLiNtYxJjlY/zcB93OGYxZ2gaEBji+7xALAXjBNxCSw1N0F/jY
	 aODllYBwdBkSgBjCvzo9qGNsoyIiKwRdbX/aCcC5aE+O8xs+A2Z5w/5x4rhMn3NwHmw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791721946;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=dmCqnST1Uz5Bh48zufrg9ySZGC8WacwU+7XgnfINKoc=;
	b=TStAmMu7/regSHJjbaAlMJ5A/b307eMeiRuub6KZK6Ml6mrQpZgapvIKlip/b2UxFUD6
	 7GL3Ji1XSEIQZQo0ESbiKz+i+XOCwV+OCATUZjfXKLiWRI2CrF0c1PVRFikFdGHCpgq6x
	 1zhdFSzeBJnELfLpaiq/vrN7R2DXO+2k3qrvJWuYXwPSVu5koGhjsLnKnw8QqVcUyTXNB
	 KdoH4KuQ+38hg3dg1Xthn+N3FRABQxzn028eLg5I1vs8hlxkh783tyv1geh/JPdJEfEIR
	 yX2dS8w0Fx1YzMZTZxJQtzJ1j1IJEtBgMsCNpMp/WeT/IxxrQ+VQGkCLXh1MvZbRwtg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791721946;
	bh=dmCqnST1Uz5Bh48zufrg9ySZGC8WacwU+7XgnfINKoc=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qb/0o76B8PQjuNbuGXUNCjAHgXN5kVk1N5CwqCMLkonCvXzIQyis3d5qneVo6tW4C
	 m9jIRBNbOrZkxSjvmS+9zfeCz5feGb7o403Riv9YgILVJwmR5XmOKR7R5A8+OPqtyy
	 1PnJNpH6lcZEYjzdLGIkg73BlJmO1Fjj479CXZeE3+9J9fIRRqoeq4n8Y7wPiXle8d
	 1Wz09dRA5unwb0jPdAZBoQUOe4dp/dquQ/Cto2oyS6BOr/n4GCt6OyNtWM9aj/8I2Z
	 BbNxo7wtzuUMHxTMw3CB8lFrn22ARUbiQomgvxQ4xaZsdNzcJNJ2dwuV0TbfmGk7wm
	 1qFtPBH2IYLKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 841EE403C7;
	Sun, 11 Oct 2026 12:32:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E4C871A6
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 12:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E262680DD7
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 12:32:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EU_2hpNDvG_G for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 12:32:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1133680BF7
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791721944;
 b=B5/W0+ROX2SPohMS/reTLDJVW7C06/eOYkUKTA803eejO8xV9V2uAwfj71vLCBfpN4a3
 FZW2uON6EXPFtnKZEaiRLIA+y43LfjkXDTdbDJC0KuI/4Rhox5gdK979cK237copkk6cw
 Wth6tkefhlJIFGi62V0CD0qPoQP+x94gIakpX9ewArdRjEq8zTAC19ERRxetKD359VCOf
 xx9BWIt9J7H8tXfUMnP2AT6JfE9y5qAGTrVRkmd1HGsspAOnXn6Dy0Rnw2fcF3WrO6tdj
 6Cm7Y/famcPYadmDJ6iHUL7C8R152g6hqkK/AyU7ZxgLRpqAIBpY4CqAq3zeWASOw7Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791721944;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=IAu5e0st+q6AElQswfLJHQUpDpvyVJ5n/kLkwpsFydE=;
 b=GQ/GlRiYGcuBjigXPoQXR2+HX7Q+lCI15J99O+/5RbDstRk8JBAE/j0WcLsyAP1Tn/Ca
 sKx2MeeR2tk0JmuY8xweajC3+d6L2jNqA+JLzPvWccBfXjEiUibCN+i3cQZRR3v28DdyV
 xLLF3CoRQskQK0DMImyG5try/AKZg575OAGDNLuP7GNScV45wft3mDYu1wgM9BEGIoCz0
 vrEk7u5FRsqGPa2DAM0gPDmpww6OckbiRoLvFBAjmvb2UmDrtntqjusRUdtC0sQ25jt8r
 nXZbsuw1HNFoljE/NrywOapJx8d8J8+Sm6ALqufoYA9ww9jUTsNk1gdIcpVtHN9LDLw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail2 header.b=HVJ9LXlZ; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=HVJ9LXlZ
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1133680BF7
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 12:32:20 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=HVJ9LXlZtuLpma8/L5xchZEcPamnF/nh7ewmJuhw5Bb4hK0YQ7riu21wZVgdWZGknNCE8uxhjchjkqRXJTK5qbp1mC/TgHSBno1C2DM3NfM9/IAZDH1ztE0NwRbsgO5WHk8zVyUv7LkorIM2TqvpGxFcVQ+PYLZl6Wb9ObJTxGPfNI+cc2FAEV5dvM0y1p5WucZgNmHMTACGxGdRhs/Jtmq5xJSnsCWuVMl71ftL8hojdRQNsBZ/zEVCaX2cdU2ThMJMD5Ct+O2MYi2WIoMekl3JwzpNl/Z8vH0/rDSblf18HGIFJlia6eFGZmioHC5dyBkqtfl+PtzulHEeOGFi+g==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=XgQ5vEbDwKfiy3gOhk1hjB/PgpkriOA6gUNa1muWbhg=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -504920487; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 11 Oct 2026 12:32:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xFsiu-000000090BU-2dJx;
 Sun, 11 Oct 2026 14:32:16 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org,  git@jdknight.me,
 thomas.petazzoni@bootlin.com,  arnout@rnout.be,  thomas.perale@mind.be,
 ju.o@free.fr
In-Reply-To: <20261010201508.963412-3-titouan.christophe@mind.be> (Titouan
 Christophe's message of "Sat, 10 Oct 2026 22:15:07 +0200")
References: <20261010201508.963412-1-titouan.christophe@mind.be>
 <20261010201508.963412-3-titouan.christophe@mind.be>
Date: Sun, 11 Oct 2026 14:32:16 +0200
Message-ID: <871p9we7u7.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/3] linux: add first-class support for all
 upstream linux versions
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

>>>>> "Titouan" == Titouan Christophe <titouan.christophe@mind.be> writes:

 > Add new KConfig symbols for all actively supported longterm versions of the
 > Linux kernel. This makes it easier for individual configs to follow updates
 > of their kernels, without having to frequently update them. This should
 > generally improve the security of the target systems, which receive frequent
 > security updates while preserving a stable feature set.

 > Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
 > ---
 >  linux/Config.in                      | 49 ++++++++++++++++++++++++++--
 >  linux/linux.mk                       |  2 +-
 >  package/linux-headers/Config.in.host |  4 +--
 >  3 files changed, 48 insertions(+), 7 deletions(-)

 > diff --git a/linux/Config.in b/linux/Config.in
 > index 3521fe5cd5..717c964dcd 100644
 > --- a/linux/Config.in
 > +++ b/linux/Config.in
 > @@ -32,15 +32,53 @@ config BR2_LINUX_NEEDS_MODULES
 >  choice
 >  	prompt "Kernel version"
 
 > +config BR2_LINUX_KERNEL_LATEST_SERIES
 > +	# Helper symbol to indicate if one of the "latest" kernel
 > +	# (either the very latest one or from a longterm supported series)
 > +	# has been selected
 > +	bool
 > +

check-symbols complains about this:

./utils/check-symbols
linux/Config.in:44: BR2_LINUX_KERNEL_LATEST_SERIES is part of a "choice" and should not be "select"ed
linux/Config.in:49: BR2_LINUX_KERNEL_LATEST_SERIES is part of a "choice" and should not be "select"ed
linux/Config.in:54: BR2_LINUX_KERNEL_LATEST_SERIES is part of a "choice" and should not be "select"ed
linux/Config.in:59: BR2_LINUX_KERNEL_LATEST_SERIES is part of a "choice" and should not be "select"ed
linux/Config.in:64: BR2_LINUX_KERNEL_LATEST_SERIES is part of a "choice" and should not be "select"ed
linux/Config.in:69: BR2_LINUX_KERNEL_LATEST_SERIES is part of a "choice" and should not be "select"ed
linux/Config.in:74: BR2_LINUX_KERNEL_LATEST_SERIES is part of a "choice" and should not be "select"ed
linux/Config.in:81: BR2_LINUX_KERNEL_LATEST_SERIES is part of a "choice" and should not be "select"ed
linux/Config.in:104: BR2_LINUX_KERNEL_LATEST_SERIES is part of a "choice" and should not be "select"ed

So I moved it outside the choice and committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
