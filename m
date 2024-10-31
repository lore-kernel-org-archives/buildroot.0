Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED50E68944
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 08:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6868E81274;
	Thu, 31 Oct 2024 08:04:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YeaDEZIh3ozV; Thu, 31 Oct 2024 08:04:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3E3F81298
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3E3F81298;
	Thu, 31 Oct 2024 08:04:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E567E494E
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 08:04:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D434260671
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 08:04:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oBqT6cPDOdp1 for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 08:04:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 95BDD6065D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95BDD6065D
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 95BDD6065D
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 08:04:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 641F1E0009;
 Thu, 31 Oct 2024 08:04:02 +0000 (UTC)
Date: Thu, 31 Oct 2024 09:04:00 +0100
To: Vladimir Oltean <olteanv@gmail.com>
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>
Message-ID: <20241031090400.67f6bdc5@windsurf>
In-Reply-To: <20241029231936.3712769-1-olteanv@gmail.com>
References: <20241029231936.3712769-1-olteanv@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730361842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sh14HBBTbXOc8yfk0eSZBgcjZTlqwdto1gScgqn2WdQ=;
 b=pR0d0pAuzoaNVpd8w2ISNVT1MaJFCohSgrDp5GxWrKrwQjT870f4Sy/dvhOQngknoGUc4k
 LWl/JB/O8B21/T1gFWj7G0OJY173P8hSa2lXh3hqpL4TVaC2eQDNhnmY21GZSt75sMdRw5
 xJMX1GvEiikobx7aGGRJem2Qkwd3T6/1rYzeF/bPZLhNl8xi5qdp1TG+842G0hQy81Z4Mu
 gl4oXCIXxSPP0BSCshYirrGj8Dyy9/IdYV7hwQyr6o0Ky5/JWx5aoERjXmxrk3sos5viUD
 0mqUzF/HJI3U17IB7n6RTFEeNe6g4xgyN7avm7KbfBn5aplFrljdrDnZQrvgRQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pR0d0pAu
Subject: Re: [Buildroot] [PATCH] package/sshguard: patch
 /usr/local/sbin/sshguard path in systemd service
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

On Wed, 30 Oct 2024 01:19:36 +0200
Vladimir Oltean <olteanv@gmail.com> wrote:

> The systemd service deployed to the target is derived from an example
> hardcoded for the /usr/local/sbin/ path, but we install sshguard at
> /usr/sbin/. Thus, by default we get this error message:
> 
> $ journalctl -b -u sshguard.service -f
> systemd[1]: Started SSHGuard - blocks brute-force login attempts.
> (sshguard)[612]: sshguard.service: Unable to locate executable '/usr/local/sbin/sshguard': No such file or directory
> (sshguard)[612]: sshguard.service: Failed at step EXEC spawning /usr/local/sbin/sshguard: No such file or directory
> systemd[1]: sshguard.service: Main process exited, code=exited, status=203/EXEC
> systemd[1]: sshguard.service: Failed with result 'exit-code'.
> systemd[1]: sshguard.service: Scheduled restart job, restart counter is at 5.
> systemd[1]: sshguard.service: Start request repeated too quickly.
> systemd[1]: sshguard.service: Failed with result 'exit-code'.
> systemd[1]: Failed to start SSHGuard - blocks brute-force login attempts.
> 
> Fix up the path in the service after the $(INSTALL) command has run.
> 
> Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
> ---
>  package/sshguard/sshguard.mk | 2 ++
>  1 file changed, 2 insertions(+)

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
