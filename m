Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A2DCC3DA61
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 16:30:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B17A6068A;
	Sun, 21 Jul 2024 16:30:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mfAc0Cs9-Gdj; Sun, 21 Jul 2024 16:30:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1910860638
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1910860638;
	Sun, 21 Jul 2024 16:30:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3E8881BF321
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C04340306
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:30:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XGnAX_0QsnU7 for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 16:30:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A16D240301
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A16D240301
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A16D240301
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 16:30:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B6C6060005;
 Sun, 21 Jul 2024 16:30:47 +0000 (UTC)
Date: Sun, 21 Jul 2024 18:30:47 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240721183047.0e1259fc@windsurf>
In-Reply-To: <20240721082543.150026-1-fontaine.fabrice@gmail.com>
References: <20240721082543.150026-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721579447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bkmVT1THSK2wDM+9v52ohfcAvRjAIG+pQmCz3n1GHR8=;
 b=nzG1SdID5zS8AMJzVRcxdaxVspsI79KL6CbQOC1gCYCYtbP/qyac3Cf7iyhf1dVphll90h
 QgGw7Iqo5HesiQqNoeSiiSvilP0ztjFHxn29OGVbmnfuWkK00Cb+1XIQ8W22HngMAoO/8j
 ckHXivejVd7e21A/8Tvb6z+J5ptT/xGQ4YVLllzh5+1tsWH80lcKu/G4GjwFvarYT7nv0I
 F5JJeIDk96473NvyM0MdAv3ARMwc9TfHl9MRnLJps2v1pka/oOPi0Om8EquQHXRv5LQday
 5aE2KHf1argvKo/TmtGPOv3460SCVQjy9BfEWibmwsq688doacKwpsrLS8BQUA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nzG1SdID
Subject: Re: [Buildroot] [PATCH 1/1] package/rabbitmq-c: bump to version
 0.14.0
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
Cc: Joris Lijssens <joris.lijssens@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 21 Jul 2024 10:25:42 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop patch (already in version)
> - Update hash of README.md (updates unrelated to license:
>   https://github.com/alanxz/rabbitmq-c/commit/ea9acb88814a9240327bd27a30cdc06e5b69735c
>   https://github.com/alanxz/rabbitmq-c/commit/7dab48f03419661133abdf12d53733a4d4369b76
>   https://github.com/alanxz/rabbitmq-c/commit/8f8a320c5a9a58647f2f39d66107e7f116f4bc4a)
> - This bump will fix the following build failure without the deprecated
>   libopenssl engines raised since commit
>   623d3bbe43e9193aa8e3395367d01af59071b859:
> 
>   /home/autobuild/autobuild/instance-1/output-1/build/rabbitmq-c-0.13.0/librabbitmq/amqp_openssl.c:602:42: error: 'ENGINE_METHOD_ALL' undeclared (first use in this function)
>     602 |   if (ENGINE_set_default(openssl_engine, ENGINE_METHOD_ALL) == 0) {
>         |                                          ^~~~~~~~~~~~~~~~~
> 
> https://github.com/alanxz/rabbitmq-c/releases/tag/v0.14.0
> 
> Fixes: 623d3bbe43e9193aa8e3395367d01af59071b859
>  - http://autobuild.buildroot.org/results/b95d080a0de635baaea2f08a888746cddcd1f26e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-to-read-username-password-from-file.patch | 130 ------------------
>  package/rabbitmq-c/rabbitmq-c.hash            |   4 +-
>  package/rabbitmq-c/rabbitmq-c.mk              |   5 +-
>  3 files changed, 3 insertions(+), 136 deletions(-)
>  delete mode 100644 package/rabbitmq-c/0001-Add-option-to-read-username-password-from-file.patch

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
