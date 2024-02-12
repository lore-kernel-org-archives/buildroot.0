Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB6CC4829D
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 21:56:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F7414069D;
	Mon, 12 Feb 2024 21:56:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zJ3SyjgRim_2; Mon, 12 Feb 2024 21:56:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AEC3407C4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AEC3407C4;
	Mon, 12 Feb 2024 21:56:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D3C3E1BF853
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 21:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C035A40645
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 21:56:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sHiuKMzxfd9G for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 21:56:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DEB77404BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEB77404BC
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DEB77404BC
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 21:56:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E32491C0002;
 Mon, 12 Feb 2024 21:56:08 +0000 (UTC)
Date: Mon, 12 Feb 2024 22:56:08 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240212225608.4b41250b@windsurf>
In-Reply-To: <20240212200442.848248-1-fontaine.fabrice@gmail.com>
References: <20240212200442.848248-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707774969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i2ZWMN2iUT7f6rYhm5/al2W20SqR5ayjfyAc1PXtbyU=;
 b=ddSftwHdb5yt2G7qKa02e1wcEPsti7aTRqyQ5yTsdgN+ZULh7S2Y4oozN2TqRyoWpRRmF/
 g2TH3nJiZaxPurbikxwZtKRCSxKb7Nz6Y1Mobvzg7940dq1C87gVYE3VHwVZ9KdBJSE6CX
 Zm4CVEpuPdJ52UFUB7MHQ3BrzvtiLjUQEhyyPIy0wNE9BYTmFTnVN83Pg4eVgcguEQj9sk
 82lBtElEFu33SqWEthGNFwlDMPIqmVK7a3ewaAxJjN56IejPAKcsggQnERdAtFvdV+N5HL
 DJSBIFOMrnfSASnHdV2W4t9+okEsRWLTaaX0YTu4nagbKtHd1dzQY9k6Bp1tJQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ddSftwHd
Subject: Re: [Buildroot] [PATCH 1/1] package/elfutils: drop ELFUTILS_{C,
 CPP}FLAGS
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

On Mon, 12 Feb 2024 21:04:42 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> ELFUTILS_CFLAGS and ELFUTILS_CPPFLAGS are empty since commit
> 7593aea519dee34cb25715296c1b03f471123ee2 so drop them to avoid setting
> incorrect flags
> 
> Fixes: 7593aea519dee34cb25715296c1b03f471123ee2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/elfutils/elfutils.mk | 4 ----
>  1 file changed, 4 deletions(-)

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
