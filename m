Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F7BCF2579
	for <buildroot@archiver.kernel.org>; Sun, 13 Oct 2024 10:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1FE2140922;
	Sun, 13 Oct 2024 10:48:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V5-FD71PD_md; Sun, 13 Oct 2024 10:48:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B305409FA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B305409FA;
	Sun, 13 Oct 2024 10:48:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7530F1BF35D
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 10:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64A0360759
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 10:47:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o-6fnJrNpr4o for <buildroot@lists.busybox.net>;
 Sun, 13 Oct 2024 10:47:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 50689607BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50689607BE
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 50689607BE
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 10:47:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 706D3C0002;
 Sun, 13 Oct 2024 10:47:50 +0000 (UTC)
Date: Sun, 13 Oct 2024 12:47:34 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20241013124734.24cda05c@windsurf>
In-Reply-To: <20241011201436.535326-1-ju.o@free.fr>
References: <20241011201436.535326-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1728816470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JhwlbEFPb75z6zANOfMWkLWHY7z66jDTFVe+JJjb7ec=;
 b=gFsMGk9o3xRnGVWh0RnLscoYZbVvDqeK+5DN16vsbjLbGhIHO5CSO1ce2kLYyQ5Vrj+tr9
 Kalyhrwe4eXeV+gwml43BpXCGK6NDXKRGc+Sj4e/m/vs/beaSdBElIyq7OmbdCEcso36Vz
 QidHc/q/9SsqgJVAqxTqjpAtCUi7FhgaiSZh+LAr4ZHrFdxvVbPaqAZy1DIzYUKaDU/T7h
 hcJKdeWcX/q/ehFEWHpFlj5XB5u8PE2YU5WKomCXDoMWyLv+KbdylFvfFsdISrXyV99dVQ
 z06JC21Ujn3gBQwSzWEVsXrtClff4mW42FeJAFX5fdlj739VU+W4fE+1w6gjYQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gFsMGk9o
Subject: Re: [Buildroot] [PATCH 1/1] package/opencsd: bump to version 1.5.4
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

On Fri, 11 Oct 2024 22:14:36 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For change log, see:
> https://github.com/Linaro/OpenCSD/blob/v1.5.4/README.md?plain=1#L336
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/opencsd/opencsd.hash | 2 +-
>  package/opencsd/opencsd.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
