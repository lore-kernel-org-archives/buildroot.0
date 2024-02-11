Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF511C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 21:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8135D84D9E;
	Sun, 11 Feb 2024 21:40:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sin9ftcxEPAC; Sun, 11 Feb 2024 21:40:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A551D84E37
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A551D84E37;
	Sun, 11 Feb 2024 21:40:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8A4CB1BF2EF
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7792060EA5
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:40:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fm8Y77NSoP0q for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 21:40:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5622160E67
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5622160E67
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5622160E67
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 21:40:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8963460002;
 Sun, 11 Feb 2024 21:40:36 +0000 (UTC)
Date: Sun, 11 Feb 2024 22:40:35 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240211224035.69db8394@windsurf>
In-Reply-To: <20240210100928.172584-1-ju.o@free.fr>
References: <20240210100928.172584-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707687636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4EJsuGgopFDCUgyIuRnHGy4Q9BZIPoh7sZUEEgWPqYE=;
 b=KC6ZF6DNCoFfayNP42wCCeM5vYERhF7h+YdZhOriHS4lvwZQY4iIwf/1coM42n+y3RoyUx
 3upW4s+yLRyHmP5IVzXqKfSbdq80eYJfQ+UH3ZhEAywwGLCx5u67EUFt/UyqPe2e+hsnHW
 /RafZ5X//jpE8G3NF1t8RtLqWWCAtoKpch8WaaLJ+sgFooq6Ii4DpCJbwtu8GxNja4fiAV
 FYS1YlLeHIqWxs0J/iy7sz0fYuHTaxrtP8wU0gTPaWN8W1bpukvJLuoVs5XUifAebykAx+
 xtrD4PvoZblMYoy5EQY0Y8N49CNS4epQ2MUmcvmJYvyETOUFR/YA3T19cKh6UA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KC6ZF6DN
Subject: Re: [Buildroot] [PATCH 1/1] package/ghostscript: security bump to
 version 10.02.1
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 10 Feb 2024 11:09:28 +0100
Julien Olivain <ju.o@free.fr> wrote:

> For release note, see:
> https://ghostscript.readthedocs.io/en/gs10.02.1/News.html
> 
> For detailed history, see:
> https://git.ghostscript.com/?p=ghostpdl.git;a=shortlog;h=refs/tags/ghostpdl-10.02.1
> 
> Fixes:
> - CVE-2023-46751:
>   https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-46751
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/ghostscript/ghostscript.hash | 4 ++--
>  package/ghostscript/ghostscript.mk   | 2 +-
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
