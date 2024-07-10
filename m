Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E227C3DA42
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 14:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3D22820B3;
	Wed, 10 Jul 2024 14:51:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iF8EZ5vaFSgA; Wed, 10 Jul 2024 14:51:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED077820B6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED077820B6;
	Wed, 10 Jul 2024 14:51:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A947E1BF232
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 14:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95984820B6
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 14:51:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kb4G57lOSLq1 for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 14:51:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 78A5781FE8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78A5781FE8
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 78A5781FE8
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 14:51:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B0E58E0008;
 Wed, 10 Jul 2024 14:51:07 +0000 (UTC)
Date: Wed, 10 Jul 2024 16:51:06 +0200
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20240710165106.5066873b@windsurf>
In-Reply-To: <20240709202438.27298-1-heiko.thiery@gmail.com>
References: <20240709202438.27298-1-heiko.thiery@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720623067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LX5BoFms59QHg8FGh2QsbmaIom7a2MkGy3/1PICukSw=;
 b=NXXrxp3sCUPsx+Yd7aW66aZnyCgOC4EfcBMo9aIhzws42oSwbQLFLSSIMUTsKiTrLT9Pjm
 IU6JCMDzia+f7HvrKYOPeMlHBYk5RroaodUZOPpjhqUq1UYXAnlONcvGRP9R5d+ZOm/RWo
 16mjhmbhh6imOjW9i9r2U6JU1UlSaLE5vfUqgDyfYP+BzWlgWQ7Mk0fvX6gD6tkqgAd8ZV
 ZTI0ExH3/vsOi0q2teUFx4YDu5lxJmWLyarIuBWtcDqR9Gzvg9NsOzJlE4n/XZnd0uDySj
 3xpjUz58/phVWO2WpjH77jxe6WUBvcZdFSM8dnj/DG95St6dmiWHiCpb70RIxg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NXXrxp3s
Subject: Re: [Buildroot] [PATCH] package/libssh: select
 BR2_PACKAGE_LIBOPENSSL_ENGINES
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

On Tue,  9 Jul 2024 22:24:39 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> This fixes link time errors, undefined references to various ENGINE_*
> functions in case libopenssl backend is used.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

Is this
fixing http://autobuild.buildroot.net/results/5bb/5bb845be7f861dc3540a8dc618ccd1a0a759f2d5/build-end.log
and similar build issues ?

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
