Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A719EA7944
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 19:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CEA581196;
	Wed,  4 Feb 2026 19:38:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VZRKDXy-0qOU; Wed,  4 Feb 2026 19:38:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53D48821A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770233936;
	bh=ItGiliXv8a8miiHxMZ3Ayr3wMMKljJxjEjHBAHfNLmI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GXfPe2ULWY+jT3PdLAnUQUYBhh4+9gy6uXCfpobHHcmV9UstcSJeBm2qeEkUHNHul
	 8zACOPxRDUZfLw0g0ccJGMJK2t7fUUh2480Zoz2w7BMh6jpI44U9EcOEwa/Oz6bCzD
	 r5+Ls0SyhsUJP++qptiz9PuVh/oDdhWpVu2Mfpt9dWXNALoNbs0uD6l+mH1ELGEdwU
	 S9L6Efj61pwlY+yOpmr2V8BeSDKPmr/hpAKuvdhMMZ16AipR4/FknOHeHYGaov5i72
	 dnBx8kS3SEFWZLn3jBlpGqr0dXF4qF2inbLwG8zz4vs9tOeTB9GO5Jbt3oM8RPkFLo
	 aFXzYoBnh/G6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53D48821A1;
	Wed,  4 Feb 2026 19:38:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 901CD173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 19:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C231821A1
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 19:38:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dseUnQV4oKUc for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 19:38:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 54DE681196
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54DE681196
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 54DE681196
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 19:38:53 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 7710FC24381;
 Wed,  4 Feb 2026 16:53:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B23CD60705;
 Wed,  4 Feb 2026 16:53:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 682FE119A8891; Wed,  4 Feb 2026 17:53:05 +0100 (CET)
Date: Wed, 4 Feb 2026 17:53:04 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
Message-ID: <aYN5VVlrsOHibzSF@windsurf>
References: <20251206113430.571889-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251206113430.571889-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770223988; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=It0/kgFzhmlb34URGuLmCvzMCvXj7DzKfcdptmFLdVs=;
 b=NbeYjC8gg8L95IR8bJJ0kXt/pHdo8/tJS0CPc+LbDlvvSBFGu3o9rhhgTStH8kSy9V+HA4
 0/4rlU5lWwMLRUXRx6nDsjQFLO77jkTKNLyR92m9b/h6x6pc3E+kGo1I/jrZi/jWmYKXk7
 rt6GTY+L/Sa6ulQu1OOHALuolhTa3IlygTL7rthP56kHc7NZ8cQBpwhQFvS3wrON9WB52U
 CUeK3z6eeZj670F3rTZzpNEyYaHCwFVjYy8lx5KfMsF2hk3UKhmCKTYbyWZvKxBM0GxUqs
 vglDv8YGGAyQpmEYxQ2z+KPhCQ/3ZIkWuQCCXf/s9Z5UdgvJQQo/xdUQb6AUbA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=NbeYjC8g
Subject: Re: [Buildroot] [PATCH 1/1] package/squeezelite: fix build with
 gcc-15.x
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

On Sat, Dec 06, 2025 at 12:34:30PM +0100, Bernd Kuhls wrote:
> No autobuilder errors recorded yet.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Thanks a lot, patch applied. I updated the Upstream: tag to point to
the final commit in the upstream, since your PR was merged.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
