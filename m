Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7478AC25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 21:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 383A242C2F;
	Fri, 10 May 2024 21:35:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2EHMdky6GU4d; Fri, 10 May 2024 21:35:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6D5442DDE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6D5442DDE;
	Fri, 10 May 2024 21:35:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8F1521BF995
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 21:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D32F042C2A
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 21:35:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YRKyBmCz9rEV for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 21:35:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 19EB6404A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19EB6404A3
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 19EB6404A3
 for <buildroot@buildroot.org>; Fri, 10 May 2024 21:34:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 71DE3E0002;
 Fri, 10 May 2024 21:34:58 +0000 (UTC)
Date: Fri, 10 May 2024 23:34:57 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240510233457.67eb68e3@windsurf>
In-Reply-To: <20240307101638.15609-1-fontaine.fabrice@gmail.com>
References: <20240307101638.15609-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715376898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nl4X4O5qOZBsr8jF8RtOSczE35yyJwq7IwKuHcOXse0=;
 b=HaSdXPCHu9NqmJ6anuwKdkGvoKiinTaopa5BIVTic+2f0MrdFEMKNTDL0ERrylfp5S4gDs
 CzcqqBJzpy8iljck/EMsuXbDDCPiYXCLuKY5f5PAAIaK+hNm4fZMXGj+yLj8Su7ZwIkpDD
 6efcywLjSEH9W+o77Ca/nolCJmAzI1woHSp+FR3jYKMLNpkjzHRtsYQkJc6swQsHPAgjmi
 5luJRjDW8QIuiqRM7LuuI0FNYGHtraeP+S+1ScwGFGHmi4l5wDz5j4VCsd0u0GmL2JCA1x
 xCvvxDE9N9TqD3F5LZT1egad/T/0AZ+yBovcuSYe5t6/B+RV6DC68KF743TKrg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HaSdXPCH
Subject: Re: [Buildroot] [PATCH 1/1] package/zxing-cpp: needs threads
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

On Thu,  7 Mar 2024 11:16:38 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> threads are mandatory since switch to an active fork in commit
> 456a7398316655ad0b669635f580e4887c24a700:
> 
> CMake Error at /home/buildroot/autobuild/run/instance-1/output-1/host/share/cmake-3.28/Modules/FindPackageHandleStandardArgs.cmake:230 (message):
>   Could NOT find Threads (missing: Threads_FOUND)
> 
> Fixes: 456a7398316655ad0b669635f580e4887c24a700
>  - http://autobuild.buildroot.org/results/b600582d9c5407c7324af70d61fa5c1f96d929f6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gstreamer1/gst1-plugins-bad/Config.in | 5 +++--
>  package/zxing-cpp/Config.in                   | 5 +++--
>  2 files changed, 6 insertions(+), 4 deletions(-)

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
