Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B71DCC43334
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 11:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6477B826BF;
	Wed, 20 Jul 2022 11:46:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6477B826BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3hLO7t3DC3D3; Wed, 20 Jul 2022 11:46:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 863A382662;
	Wed, 20 Jul 2022 11:46:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 863A382662
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9704B1BF2F0
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 11:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F1A882662
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 11:46:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F1A882662
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3gid70jvNi_q for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 11:46:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5139E80850
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5139E80850
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 11:46:00 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 012D024000B;
 Wed, 20 Jul 2022 11:45:56 +0000 (UTC)
Date: Wed, 20 Jul 2022 13:45:56 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220720134556.371f1ebe@windsurf>
In-Reply-To: <20220719215619.3144281-1-fontaine.fabrice@gmail.com>
References: <20220719215619.3144281-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658317557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s9tSOie3e11jT8CYB3IrnTnIj/jVA+WuUMCHn+MPbAY=;
 b=bVuLArg4/s/EL8s7+fdvWlBOxmuRDV/OTVipQwP0lUCUEI3/6zP6qjSHWlKCb7jT6WtYNn
 Ir9zlxGF/0X0fZBp7T+r6KXjPLZknTv1SAtriqIxYP6/TKS4i2NP6E/A/C+bAPuwcOIo/R
 GQpzH+2Rvr0GxN2GKx82Qm0B42ugl2bqVFA4HYiuznv7kQCd/ghgF9eGjUnduVxbgsCLti
 Kj281F5q1qbA3Lro2D9bIBNHJqoshmTPvgjJwKbaRFDx5ynVYRV8AQ+bkP9Ir1+yM9YTGk
 U1XZPYQO2yO0O+hhlFuNzGAF8fRDhp4kQbi7K2jXxqql0lkSzmYTzhlP3utVzg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bVuLArg4
Subject: Re: [Buildroot] [PATCH 1/1] package/libp11: needs threads
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

On Tue, 19 Jul 2022 23:56:19 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> threads are mandatory since bump to version 0.4.12 in commit
> 86ab91483dcb4b60de8c1daa20e2f42bd95ab5fb and
> https://github.com/OpenSC/libp11/commit/4bd92da60a670e3c25d9cb69fca3363f47a225c7:
> 
> In file included from eng_back.c:30:
> p11_pthread.h:92:2: error: #error Locking not supported on this platform.
>    92 | #error Locking not supported on this platform.
>       |  ^~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/22adeb78ec4a807c362e6666825f50db6c0408f7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libp11/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

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
