Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BB8C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 21:34:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 470AB84201;
	Sun, 11 Feb 2024 21:34:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6VwtRhsY9nvX; Sun, 11 Feb 2024 21:34:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60DB8843DC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60DB8843DC;
	Sun, 11 Feb 2024 21:34:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B8E21BF2EF
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:34:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24B6240B67
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:34:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7RlU2aNGYGTM for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 21:34:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A06234011D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A06234011D
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A06234011D
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 21:34:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 958FC20003;
 Sun, 11 Feb 2024 21:34:40 +0000 (UTC)
Date: Sun, 11 Feb 2024 22:34:39 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240211223439.01ab2bb7@windsurf>
In-Reply-To: <20240211172756.704681-1-fontaine.fabrice@gmail.com>
References: <20240211172756.704681-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707687280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M+UVXd5ZEZz7lEJD2VjwJvGxEeUbavO638Hh5dwzXmw=;
 b=T2W80bRLDAwhVQIUb6MQDi1k3uw5kSwe4+W3zkQGYZjR/SGuVRLH3B8A4SVxWJ9rjkb1r8
 ZG+BCEN/wvX4IS3sGT6tvSYrvp0t8vdTPyn5GIgbfJA761GFZgkm76iQszg9H9CIhwKqDU
 t4jQKKnuE3A2yVmGuJFcjnXit0Q5hM2995OvYZe96Nbw7Nm3CHsj2C/OmzpYWfm4wlAO8G
 f+ZnyNdByHdBA2o+uGVCzIlH/VvXNxXTGh26L3zt/pXj64oghM2fMouYVjOu+Oja89QoTO
 jVQFu29t7zogR3eH9Oex1x1G2/Doy0mP8BtaZQEF+PkmXAPRUppWoNEbpz6ZKw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=T2W80bRL
Subject: Re: [Buildroot] [PATCH 1/1] package/libpwquality: fix build with
 python 3.12
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
Cc: Stefan =?UTF-8?B?U8O4cmVuc2Vu?= <stefan.sorensen@spectralink.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 11 Feb 2024 18:27:56 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Switch from distutils to setuptools to avoid the following build failure
> raised since bump of python to version 3.12.1 in commit
> 36e635d2d5c0166476858aa239ccbe78e8f2af14:
> 
> Traceback (most recent call last):
>   File "/home/fabrice/buildroot/output/build/libpwquality-1.4.5/python/setup.py", line 9, in <module>
>     from distutils.core import setup, Extension
> ModuleNotFoundError: No module named 'distutils'
> 
> Fixes: 36e635d2d5c0166476858aa239ccbe78e8f2af14
> No autobuilder failures (yet)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-Use-setuptools-instead-of-distutils.patch | 78 +++++++++++++++++++
>  package/libpwquality/libpwquality.mk          |  6 +-
>  2 files changed, 82 insertions(+), 2 deletions(-)
>  create mode 100644 package/libpwquality/0001-Use-setuptools-instead-of-distutils.patch

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
