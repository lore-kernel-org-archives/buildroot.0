Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7970AC04FFE
	for <buildroot@archiver.kernel.org>; Tue, 14 May 2024 08:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2701F407B9;
	Tue, 14 May 2024 08:21:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eNv3jxRcsUTx; Tue, 14 May 2024 08:20:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B41F407FA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B41F407FA;
	Tue, 14 May 2024 08:20:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D1EDE1BF2FD
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 08:20:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD71F82BC3
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 08:20:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HyKCNjA10AuZ for <buildroot@lists.busybox.net>;
 Tue, 14 May 2024 08:20:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 319A282BA1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 319A282BA1
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 319A282BA1
 for <buildroot@buildroot.org>; Tue, 14 May 2024 08:20:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 46E8B20009;
 Tue, 14 May 2024 08:20:50 +0000 (UTC)
Date: Tue, 14 May 2024 10:20:49 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240514102049.39a4d771@windsurf>
In-Reply-To: <20240206161715.550268-1-james.hilliard1@gmail.com>
References: <20240206161715.550268-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715674850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b/hCZyJY/8e30aoz9knmdIKVTAO4sCTPkwMiHypv7eY=;
 b=Zyv/jh1hib6mTDFuKd+fkdKfmkFWIDpYAx1gkAp3cHEKkLS+MdOLV08YCBiPggK+3/ceTk
 1Fw8lw2fmd6IZVaH74ZQBDuJIzoLm2NqqKKzCtyXE2eIb8MJk0p9JEuB5PsMyiRFeg2VAE
 PuWcvPJQoF3r2moWfdeAGrmCpwZm9fOjsckChpsz/LHh46u5N3dCEJ4pws6fQXbAPCJlKK
 5z6PsBWAK6Y1MhyQG5lkgbtygHgrsgtVuaH1fB6hbXNwauzSkJ8jKBeMRfPgLhZcr0AE5M
 Egf925HhWHwHUB8qt02dCtHSS+U5aBbNKxLXD+P2UixCaJkZRgm0y7ZJnA7slg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Zyv/jh1h
Subject: Re: [Buildroot] [PATCH v2 1/1] package/python-ml-dtypes: bump to
 version 0.3.2
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
Cc: Julien Olivain <ju.o@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Tue,  6 Feb 2024 09:17:15 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Migrate from distutils which is being deprecated to setuptools.
> 
> Drop python-pybind which is no longer required:
> https://github.com/jax-ml/ml_dtypes/blob/v0.3.2/CHANGELOG.md#032---2024-01-03
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v1 -> v2:
>   - drop pybind
> ---
>  package/python-ml-dtypes/Config.in             | 1 -
>  package/python-ml-dtypes/python-ml-dtypes.hash | 4 ++--
>  package/python-ml-dtypes/python-ml-dtypes.mk   | 9 ++++-----
>  3 files changed, 6 insertions(+), 8 deletions(-)

This package fails to build:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/6833308461

Could you have a look? If you submit a fix, please don't just "fix" the
issue, research since when the issue started occurring, so that we know
if the issue is affecting one of our stable branches. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
