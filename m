Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A6E6C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 15:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56B9740569;
	Sun, 11 Feb 2024 15:09:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h-cgkhSlzGrS; Sun, 11 Feb 2024 15:09:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33BD7403CA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33BD7403CA;
	Sun, 11 Feb 2024 15:09:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DBA631BF403
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 15:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D2A44606F9
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 15:09:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DhPReq9Hl_Zb for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 15:09:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F20FB606E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F20FB606E5
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F20FB606E5
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 15:09:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 30046240004;
 Sun, 11 Feb 2024 15:09:24 +0000 (UTC)
Date: Sun, 11 Feb 2024 16:09:24 +0100
To: Sen Hastings <sen@phobosdpl.com>
Message-ID: <20240211160924.775f7908@windsurf>
In-Reply-To: <20240211131635.152044-1-sen@phobosdpl.com>
References: <20240211131635.152044-1-sen@phobosdpl.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707664165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tfM2ZNnfuWN327jbzKZZloWBW68oQZELxuGoJ0DNAac=;
 b=iI868/1SwHA6rW0Np5hF49PhgulSeb/xBeePX8qaoKq4JzdraSGL+FDgo0ic1NR/8yHXc1
 vkjE0s3L6aC3N8udA+iBH89VrQNF42duV58Lij8yMwsL5P0t7tbLZB/A/uPAF9+HOg86SV
 9zJFE+jfoF2MvVOB1YZGrYePoYj1wqEyZVL0qWG6I8oOMiQqcPj8/YktUfiLCki6leowxr
 LA6MAq/9xjvkRG3LbFSi4XvsTNGwPBreukEN1vonKgNDHelwvxbUFv9daJLHMy3yGBP2QX
 JcS3Pbflvg4dgHESFjI407q+VzkiJAG/BaHg4lkhI5/7ZvRlnbeelwUEoRE+NA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iI868/1S
Subject: Re: [Buildroot] [PATCH 1/1] update sen hastings email in DEVELOPERS
 file
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

On Sun, 11 Feb 2024 13:16:35 +0000
Sen Hastings <sen@phobosdpl.com> wrote:

> phobosdpl is an old work email I don't really use anymore,
> so I'm changing it to my personal email.
> 
> Signed-off-by: Sen Hastings <sen@phobosdpl.com>
> ---
>  DEVELOPERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
