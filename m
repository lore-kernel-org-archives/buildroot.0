Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1351C3DA7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 12:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58C7540263;
	Thu, 15 Aug 2024 12:47:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z8Jeh-NrF1IW; Thu, 15 Aug 2024 12:47:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EE5340266
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EE5340266;
	Thu, 15 Aug 2024 12:47:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 204E41BF574
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 12:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E5BC81EAC
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 12:47:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P8sSm05v27iV for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 12:47:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AAFBD81EAD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAFBD81EAD
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AAFBD81EAD
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 12:47:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F1B7020007;
 Thu, 15 Aug 2024 12:47:21 +0000 (UTC)
Date: Thu, 15 Aug 2024 14:47:20 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240815144720.154032f4@windsurf>
In-Reply-To: <20240810134440.903175-1-ju.o@free.fr>
References: <20240810134440.903175-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723726042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8b0xVHmoK9ME0bmD9yowaCkDD70xdSp+3Xbb5kMzIE8=;
 b=bmRjjdiOY8Fs0nycyRk6BxEszQbNbT8ipjpWD3T1TMslfHDFXFF+xptIMjDkQ8iZbLTcg1
 op/lHujxEUvYkL9D0reU45n3I97vNTH8irUZHLOzFUq/m9A+5esJunIc/XcWq/v0ZSeolJ
 nmurVBRAE6o0apDGxJxAwrbpZw9z5tIwrU427GYiH7yK6xYC9bL/iv2c3OD8sB+UQeqFpm
 drUVcCq8vYvvFXR54ZA4OmIJKyBiFfr8x6ukIct02bVw/7l8FS7yLpodJEqf3DQDQu/z7U
 IX86We103+Gib562n9COF2G2vQxIznVYUPADNDf/jRcyNBZUiMEzDyk0hEUYLA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bmRjjdiO
Subject: Re: [Buildroot] [PATCH 1/1] package/mariadb: fix build with fmt >=
 11.0.1
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

On Sat, 10 Aug 2024 15:44:40 +0200
Julien Olivain <ju.o@free.fr> wrote:

> MariaDB is failing to build since commit 6b86f076c3 "package/fmt: bump
> to version 11.0.1" with output:
> 
>     /buildroot/output/build/aarch64-buildroot-linux-gnu/sysroot/usr/include/fmt/base.h:1402:29: error: passing 'const fmt::v11::formatter<String>' as 'this' argument discards qualifiers [-fpermissive]
>      1402 |     ctx.advance_to(cf.format(*static_cast<qualified_type*>(arg), ctx));
>           |                    ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> This commit is fixing the issue by adding an upstream patch, rebased
> on the package version.
> 
> Fixes:
> http://autobuild.buildroot.org/results/3106928a2d6b32acfb075a2840cf549a81784270/
> and many others.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Note: at the time of this writing, there is a newer mariadb version
> 10.11.9 available. It introduces new, unrelated build failures in
> Buildroot. This patch backports the upstream fix on the current
> package version in Buildroot, to be included in the upcoming
> Buildroot 2024.08 version.
> ---
>  ...le-failure-fmt-use-incompatible-with.patch | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 package/mariadb/0002-MDEV-34206-compile-failure-fmt-use-incompatible-with.patch

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
