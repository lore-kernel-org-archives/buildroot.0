Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EECF1C00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 21:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 925998146D;
	Mon,  8 Aug 2022 21:10:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 925998146D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AOgxYjyQnrBb; Mon,  8 Aug 2022 21:10:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C36248142E;
	Mon,  8 Aug 2022 21:10:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C36248142E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 90D2C1BF3BF
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 21:10:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C09B8142E
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 21:10:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C09B8142E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v3YGlXiCPDRi for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 21:10:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B692813AC
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B692813AC
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 21:10:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 92D4D20003;
 Mon,  8 Aug 2022 21:10:30 +0000 (UTC)
Date: Mon, 8 Aug 2022 23:10:29 +0200
To: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <20220808231029.42121fe0@windsurf>
In-Reply-To: <20220808210459.1256243-1-f.fainelli@gmail.com>
References: <20220808210459.1256243-1-f.fainelli@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659993031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7jGmi9omxe6OAO5Sj6vAw0Kq8lya3tcjKj6zmy9dKrk=;
 b=SHH+/0LpXVAP1xXohxbq6g/l7Qf57TaZdY6JNPNJnFIzN71VkZCEHV9QByDz3iVoM4OZgM
 aCceNGgzzb8t/diXpdaVAdMisgMe5TGp2gaXc17QRZG03mYMj3kg6NrRMWycTfBbKU3lhI
 7BdDgrVrAXLf0Jd16jmjaq6YqIDpJOGpMiba6Ko0FFzvakbNw4L6JA2kSHPIVvkBofnZvD
 YBREAFh5icKpdxhM/gseFT7UDGYmEDpm6TjB8LtCoXSQk9CS31DrybRnTVrxB5ENlDA/Sk
 MxPWskMwq+ZlGMOWiQPo0nWL3JDw9xayuex137f/C434arnK6a4jleHxZ/IxLg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SHH+/0Lp
Subject: Re: [Buildroot] [PATCH v2] package/xfsprogs: Fix builds for
 architectures without MAP_SYNC
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
Cc: bernd.kuhls@t-online.de, chrismcc@gmail.com, yann.morin.1998@free.fr,
 buildroot@buildroot.org, fontaine.fabrice@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  8 Aug 2022 14:04:59 -0700
Florian Fainelli <f.fainelli@gmail.com> wrote:

> Back port a patch from upstream that will be in the next xfsprogs release:
> 
> https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/commit/?h=for-next&id=28965957f4ea5c79fc0b91b997168c656a4426c5
> 
> required a tiny bit of massaging to apply cleanly to xfsprogs-5.14.2.
> 
> Fixes: http://autobuild.buildroot.net/results/407131b767fc8241e8f5f5001c0b5d4e2c488dea
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
> Changes in v2:

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
