Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0A3C001E0
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 17:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29BFC418D8;
	Wed,  9 Aug 2023 17:41:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29BFC418D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kRU3_RU_sDyP; Wed,  9 Aug 2023 17:41:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBF5E402C0;
	Wed,  9 Aug 2023 17:41:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBF5E402C0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7F77E1BF3B9
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 17:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 642F0401FB
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 17:40:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 642F0401FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xj0KpjszYSFe for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 17:40:26 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1A1694025B
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 17:40:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A1694025B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 288BAE0003;
 Wed,  9 Aug 2023 17:40:23 +0000 (UTC)
Date: Wed, 9 Aug 2023 19:40:22 +0200
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20230809194022.5835baef@windsurf>
In-Reply-To: <20230809132622.39045-1-romain.naour@smile.fr>
References: <20230809132622.39045-1-romain.naour@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691602823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7gmFr0QXBRQl0DIYSeUT8nau2YVS6cRB+gPh6cDeg+Y=;
 b=dNcycFxUruEfj2fbc/CF+AfoWkcNijDJksUnDsmDCswegBTVCiYN5HeB1N2yx0r2wJFBN2
 u9VccQ7f49UV7JjgUY4IHcF/dMpItqixATQ1uAyVbDZUWHdkdNpyloYhbzZLhhq9I5yvmR
 ZeCweMh7xzIIcv+QnIeCmOaTMm8zOu71/y8KKqoyIm3GO+mCji+JsOQ0dXrhQlGzF0LUCD
 vLvfl0jEMJWm12sPG/x1jDMm1IK5Q+OFEQ+C27nowkLCp3Nbm3xA+bE3GyyoAD0s/fjsVu
 ga2k8wMIc3cB+C5S0ltHAZzaZ69rnXJCrPwKOVr/9Fi9kUO1xp1Z+iYetJpJTg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dNcycFxU
Subject: Re: [Buildroot] [PATCH] support/testing: TestPolkitSystemd: fix
 systemctl exit code check on failure
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

On Wed,  9 Aug 2023 15:26:22 +0200
Romain Naour <romain.naour@smile.fr> wrote:

> As reported by [1] [2], the return code of systemctl command between
> systemd 253 and 254 has changed when the polkit authentication is
> refused:
> 
> /bin/systemctl restart systemd-timesyncd.service
> 
> The return code changed from 1 to 4. The Polkit test case
> "TestPolkitSystemd" expected 1 as return code [3].
> 
> The service log is not the same either:
> 
> systemd v253:
> Failed to restart systemd-timesyncd.service: Interactive authentication required.
> 
> systemd v254:
> Failed to restart systemd-timesyncd.service: Access denied
> 
> git bisect report this commit:
> https://github.com/systemd/systemd/commit/959301cf9f42418314abf027183dc25c08731b82
> 
> From the PR (to get more context):
> https://github.com/systemd/systemd/pull/26365
> 
> Note: systemd doesn't recommend using systemctl exit code to check unit states:
> "The mapping of LSB service states to systemd unit states is imperfect, so it is better to
> not rely on those return values but to look for specific unit states and substates instead."
> 
> Since we only want to check if the command failed, update our test to
> check if systemctl returned a non zero code whatever the reason of the
> failure.
> 
> Thanks to Yann E. MORIN for the brainstorming!
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561464 (TestPolkitSystemd)
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2023-August/671900.html
> [2] https://lists.freedesktop.org/archives/systemd-devel/2023-August/049362.html
> [3] https://git.buildroot.net/buildroot/tree/support/testing/tests/package/test_polkit.py?h=2023.08-rc1#n45
> [4] https://github.com/systemd/systemd/blob/v254/man/systemctl.xml#L2612
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---

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
