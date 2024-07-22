Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8082C3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 12:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ABC2D400C6;
	Mon, 22 Jul 2024 12:50:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MlB851lxIU7g; Mon, 22 Jul 2024 12:50:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8621540156
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8621540156;
	Mon, 22 Jul 2024 12:50:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0F2011BF2A1
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:50:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFCA140156
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:50:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HCKrsHhF7wYj for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 12:50:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 95DBE400C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95DBE400C6
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 95DBE400C6
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 12:50:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DDE20FF805;
 Mon, 22 Jul 2024 12:50:09 +0000 (UTC)
Date: Mon, 22 Jul 2024 14:50:08 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240722145008.5df77847@windsurf>
In-Reply-To: <20240111052225.2922249-1-james.hilliard1@gmail.com>
References: <20240111052225.2922249-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721652610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WLYnMuYlkS8lSzo8HNIferaGHUec/2YWZ+Pl4YbMfss=;
 b=CQNHtfk1eV6842GXAGb72kHAVha4FS5/7blhy1G+449HTsXomIrWH/NH4p1ARzV9gKxVJI
 KderLukSU4jzxB4qY0XIb4FsyeqLFOxZumTKhDvRBkwtb8TzHCNPHxvQkC7siuWMX7qifA
 eVJQxxgGbrUgMfmFsK3gIAzNtJMgHs4ap0WfUlz/sEfkefvL3UdG2VF8aJAyq7rVRwJkx0
 j2GVzFD4megsqKxLI0HxgfUGqei1oarq3LwMeSo1tBKJsgDhVtb0OVCxCeZJdir22lSndA
 S+u92PG3thXf3anrJBBu2dzWM5EWCVOrbJE5/iy0xwoeJUGW4eUM9kiAlzz30w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CQNHtfk1
Subject: Re: [Buildroot] [PATCH 1/1] package/python-rtoml: bump to version
 0.10.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Wed, 10 Jan 2024 22:22:25 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Migrate from setuptools-rust to maturin infrastructure.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-rtoml/python-rtoml.hash | 2 +-
>  package/python-rtoml/python-rtoml.mk   | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)

Not sure if it's related to this version bump or not, but our
python-rtoml test case is failing:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/7391793165

[BRTEST# python sample_python_rtoml.py
Traceback (most recent call last):
  File "/root/sample_python_rtoml.py", line 18, in <module>
    loaded_obj = rtoml.load("""\
                 ^^^^^^^^^^
AttributeError: module 'rtoml' has no attribute 'load'

Could you perhaps have a look?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
