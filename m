Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A92F5C4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 07:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75F22414E5;
	Thu,  2 May 2024 07:49:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h_9OYy-vvFlH; Thu,  2 May 2024 07:49:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2204B41549
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2204B41549;
	Thu,  2 May 2024 07:49:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 19AAA1BF990
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 07:49:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00CC7419F3
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 07:49:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VrFRsN1VqrVH for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 07:49:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DA0DF41773
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA0DF41773
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA0DF41773
 for <buildroot@buildroot.org>; Thu,  2 May 2024 07:49:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 190A020011;
 Thu,  2 May 2024 07:49:12 +0000 (UTC)
Date: Thu, 2 May 2024 09:49:11 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240502094911.40e41fc3@windsurf>
In-Reply-To: <20240411210028.2127823-1-bernd@kuhls.net>
References: <20240411210028.2127823-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1714636152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YUCTWuQ2ctUpILxFMiEC4TOCBiMRgG5F181i4LaVGMA=;
 b=h3RVd2QoeWyOaqnvCgZ2URgupTwHeXKyt5KkrQKS/I+9KCXTLtsISOYMWrYLeTDg59pZZU
 wxJji7dDuSZMDuIpAZcXw/FBjShACgzVDZbmZfMWRFclJ5PbKOPV2Y3XXB8a6aBXD4qd0Z
 0XL/2RltQoF+QaIFt4OLwXwtKkRRnS8P0/5c73IgwV0eWoNS75ZT0nF6WKJ+rc7GfJKm9p
 QcBqRWYcZzZkKqSxAGqR7tl/DLcALzkP4o9ZV/7iDgH+0H/5KV/l01dXcNEADa4BAfUw7e
 t2M+azZ+0hurZLBJD8zRUj8aFwkVAPP1j+rdeQjeYstPwEKUS9XKnsfum0Lmbw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=h3RVd2Qo
Subject: Re: [Buildroot] [PATCH] package/libcap-ng: bump version to 0.8.5
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 11 Apr 2024 23:00:28 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Switched _SITE to https.
> 
> Changelog: https://people.redhat.com/sgrubb/libcap-ng/ChangeLog
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libcap-ng/Config.in      | 2 +-
>  package/libcap-ng/libcap-ng.hash | 2 +-
>  package/libcap-ng/libcap-ng.mk   | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)

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
