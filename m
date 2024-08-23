Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A4F7C52D7C
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 15:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51F848410A;
	Fri, 23 Aug 2024 15:52:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wrH1dvJGFIfZ; Fri, 23 Aug 2024 15:52:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0D8C8410C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0D8C8410C;
	Fri, 23 Aug 2024 15:52:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A43731BF313
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 15:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90F32402DE
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 15:52:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cUjSCLTTe_m8 for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 15:52:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4158A402C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4158A402C4
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4158A402C4
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 15:52:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5C9FD240009;
 Fri, 23 Aug 2024 15:52:08 +0000 (UTC)
Date: Fri, 23 Aug 2024 17:52:07 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20240823175207.52335623@windsurf>
In-Reply-To: <20240823151249.1808674-1-thomas@devoogdt.com>
References: <20240823151249.1808674-1-thomas@devoogdt.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724428328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uHxlcyWQFR0ykTSZ777O2ZOJIqIpWhA09xQSUdAnFZM=;
 b=jkJgQ4gXQlZBAixtLdaoRs+HrD8WhHeZVOFBtnIFrGuBfmU8gseNsivmUZwSXJMFHCqXBT
 CyYsBbCYsK5ak8u/64KL6KnrE0WGWu8qBOkYrCefo/6p0vgyh2iH+hzcjgkZIE3P22r5sE
 8agqXZoVBgUnJ9uelYuWm+7q0RgUPnxGfF0jN5+2HcqaHuLRB9JN7Wf1bF5j34v/mtlNEF
 o1iiN5fOk/9QiTNGcRozkA5zfnmDIQo0KIEfbZcZr6IhgiSaeT174oG4fRI/7sQ1HWNwl9
 RZVxLmNsTM/WWnAD/HtumzQ+dVVVhQuNRTysgObTLnXdShBY3h1updFyqLlnZA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jkJgQ4gX
Subject: Re: [Buildroot] [PATCH v1] package/pv: bump to 1.8.13
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
Cc: Thomas Devoogdt <thomas.devoogdt@barco.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 23 Aug 2024 17:12:49 +0200
Thomas Devoogdt <thomas@devoogdt.com> wrote:

> From: Thomas Devoogdt <thomas.devoogdt@barco.com>
> 
> News: https://www.ivarch.com/programs/pv.shtml
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
> ---
>  package/pv/pv.hash | 2 +-
>  package/pv/pv.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
