Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B24E0C0015E
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 20:07:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6BFF540568;
	Sat, 12 Aug 2023 20:07:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BFF540568
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RgaxxOM2a1Ix; Sat, 12 Aug 2023 20:07:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A51A740297;
	Sat, 12 Aug 2023 20:07:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A51A740297
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5ACA51BF4E4
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 20:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 346C840297
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 20:07:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 346C840297
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y9JsrkM9NEEK for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 20:07:10 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CED5440154
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 20:07:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CED5440154
Received: by mail.gandi.net (Postfix) with ESMTPSA id 784E81C0002;
 Sat, 12 Aug 2023 20:07:06 +0000 (UTC)
Date: Sat, 12 Aug 2023 22:07:05 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230812220705.22562760@windsurf>
In-Reply-To: <20230221144505.1515495-1-fontaine.fabrice@gmail.com>
References: <20230221144505.1515495-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691870826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qdhXVNg+3L5YrSq5Qswv4cOC/iGBWQULFS0w+kQ/JOI=;
 b=Rgo7yxF+cwaaD4iXZ2Q+zFow8HzdF9Qd4C2n8e4FL21R3ic9VSkCfL6oRwMY0QINIJ/1o3
 dp7Ir3e/EIPYU0KhT2MP9DxNMD1au4BOJcbhjzoHqkNpqMzXCgPEmtQtIh/F6zOUxgoXW8
 SJR6oCPiDu1f62s0RZYZtWCJvGij3QpVfDdROTRPFuQEGIMGlZQmpjvIeSCr5a5yjlT/K2
 lRwddwCmUJ16qjV8FFnRmWFMUsa4qR0t7z6YXp7ys/a/GZbEnZH0YqHXnyuIkCMB69L4RP
 h16+fZELOaCuf3WXNo57V50zzorwH5cHIlFVUy2IPxKgoEokr5zKEYFxoFRkEQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Rgo7yxF+
Subject: Re: [Buildroot] [PATCH 1/1] utils/genrandconfig: add ubi handling
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

On Tue, 21 Feb 2023 15:45:05 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Add a custom case to make sure that a random configuration with an empty
> configuration file for ubi doesn't fail.
> 
> ubinize: error!: no sections found the ini-file "/home/buildroot/autobuild/instance-2/output-1/build/ubinize.cfg"
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f678c17cc4df06fb2737467e769cd8f72a3ea420
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  utils/genrandconfig | 6 ++++++
>  1 file changed, 6 insertions(+)

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
