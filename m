Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A78BE87841
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 15:55:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0630340BB8;
	Tue,  3 Feb 2026 15:55:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a1SvMzEH7iAQ; Tue,  3 Feb 2026 15:54:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EC4C40BBC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770134099;
	bh=gi0w3OHy4FSIdMQSKCePtAF1xIkRCqi4mVzQB4rDiV4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XNeqSaR8itB16ZJDYaP5zWw75pj+qLr5Cd/2asBpv4uH7/bXKDcQsMIIYqqi7XtDY
	 vewBegml0BWDNtG8yLq9J1SD21CvAuYnpZxLWIVx3DTNlIIbNyMY7PL3e7SPWoGRJQ
	 8tumlkkiW+k7DgyvrZ3G0YxKMfLCJMzoN9EaAOmqRO2Qyhvu08/prW1wTFh1k7I9F0
	 2Oa8+H7uCiQiKG/b6DQZWU4h+qt32ut7rivtu8erITbHZ0NzmgxBkhltH6v5DY9sXB
	 paeO/o7IV5DZTtO61SA6lBbtaVmLCEWla6YadO/ozplg4+cgq/F5BW+71KiioX9S/I
	 m4X1XitUWbINQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EC4C40BBC;
	Tue,  3 Feb 2026 15:54:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C6CF5F4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:54:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4E3960766
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:54:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G9ZhOgWyIgx6 for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 15:54:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B8D426075A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8D426075A
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B8D426075A
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:54:56 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 9953FC24382;
 Tue,  3 Feb 2026 15:54:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5964060728;
 Tue,  3 Feb 2026 15:54:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B4150119A8888; Tue,  3 Feb 2026 16:54:50 +0100 (CET)
Date: Tue, 3 Feb 2026 16:54:48 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, "Yann E . MORIN" <yann.morin@orange.com>
Message-ID: <aYIaGJJ1zJEBhLE6@windsurf>
References: <20251229083748.835336-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251229083748.835336-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770134092; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=qjzxztcqRnmtsIdzlUyJ/tl+bEbxm0iwejZ4wffvKA0=;
 b=iIR6jobFLtN9tAPASqe69fcxXtX6/GO00hbxsTvl+KFrr8mQQ2lfGPpYssomMkWokJZNGE
 crocy4AFDmbYqURTTV8mqnmObVBari8tdhQ9cW3XZKQrpRQd+JFez9HXLBjSumEbJbOqGK
 FJfUc5nBfAT90BH6ghenLmRYSV5w5Rm6H/HV3N0kvvhJyjWY8QVcip9pWdfEJ448Uw3AFL
 3sRrYfiH2T9o6KaDcCL2opS+b1wIs8ivEny+FQSOkTuc9UJcqpUrwWa5RwKlNTJPInrETM
 KNmN+2sjwLnBPEhaYHX9kxFMPgifm9c53rsdmhyYmZTp92eim+kTVhs+kgXSyw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=iIR6jobF
Subject: Re: [Buildroot] [PATCH 1/1] package/gpsd: security bump version to
 3.27.2
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

Hello Bernd,

On Mon, Dec 29, 2025 at 09:37:48AM +0100, Bernd Kuhls wrote:
> https://gitlab.com/gpsd/gpsd/-/blob/release-3.27.2/NEWS
> 
> Removed all patches which are included in this release.
> 
> Fixes CVE-2025-67268 & CVE-2025-67269.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

As usual, when possible we try to minimize the impact on the LTS
branches. So I've split this into two steps:

1. Backport the security fixes
2. Bump

This helps our LTS maintainers by reducing their workload.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
