Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D2CC10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 15:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D038813A2;
	Thu,  9 May 2024 15:45:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TT6hLe4SzRYs; Thu,  9 May 2024 15:45:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3928813B6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3928813B6;
	Thu,  9 May 2024 15:45:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9E15A1BF39C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 15:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A6A741767
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 15:45:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VcdoDc0wvsJ8 for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 15:45:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6125D41766
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6125D41766
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6125D41766
 for <buildroot@buildroot.org>; Thu,  9 May 2024 15:45:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7BD8F60002;
 Thu,  9 May 2024 15:45:21 +0000 (UTC)
Date: Thu, 9 May 2024 17:45:20 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20240509174520.14c3990f@windsurf>
In-Reply-To: <20240412080413.1407759-1-aperez@igalia.com>
References: <20240412080413.1407759-1-aperez@igalia.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715269521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/txGiYGXTwBrALWHjtg1bpS3OQCB8Mg47GHi2ypXwjw=;
 b=IyD782qcyO77imeBM4ukKmaHIID2EXacx9iX4tlEkwwyHvYWpJJzY7AyPcFS3lVCdOSvLp
 9OKkH0IFvup3/P957BC/npylkhgYGHNTpa+q/ikRHMJKcsKlp8Tt7SnqxnM6kCV2gQ5Jwr
 9//ujD9JgrNJHlhSKCaWFIUFrSPmGwbhT0PFkTiv6L6WdD1RxlhgI58HfIWE2OJeiyMREB
 Fx7dFBym3toiApaJk89JRmfZNAfWzSC2ON18r2YvNuPNbxYyoRGLlrUDmEVc3PIyJncxov
 dMdF/8ibRJ6ieE632Ae95KxmINsXxOtL9NxXM1pO53RZTjUDKB8inQ1GcVqEJg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IyD782qc
Subject: Re: [Buildroot] [PATCH] package/bubblewrap: bump to version 0.9.0
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

On Fri, 12 Apr 2024 11:04:12 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> This version adds a new --argv0 flag, has better error reporting, and
> fixes and important file descriptor double-close when using --args,
> --seccomp, and --seccomp-fd. Release notes:
> 
>   https://github.com/containers/bubblewrap/releases/tag/v0.9.0
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  package/bubblewrap/bubblewrap.hash | 4 ++--
>  package/bubblewrap/bubblewrap.mk   | 2 +-
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
