Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C29F6C3DA41
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 21:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87CB2402AC;
	Mon,  8 Jul 2024 21:06:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yVtz1lCX3IqD; Mon,  8 Jul 2024 21:06:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56D05403E5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56D05403E5;
	Mon,  8 Jul 2024 21:06:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 974BA1BF3BD
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 21:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90964405B5
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 21:06:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qNUQrI34fV42 for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 21:06:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3FF9F400AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FF9F400AF
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3FF9F400AF
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 21:06:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 865C1240006;
 Mon,  8 Jul 2024 21:06:14 +0000 (UTC)
Date: Mon, 8 Jul 2024 23:06:13 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240708230613.5a290ae0@windsurf>
In-Reply-To: <Zoe0clGGRNNCktcE@waldemar-brodkorb.de>
References: <Zoe0clGGRNNCktcE@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720472774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yKFL6i4PYKxwhFMb9jOkUuZfgG/4zYCXgk1txz2MDY8=;
 b=MZTehfM0/YWWuxzE2jxWRMSpS5ASop2sDLmIWPTijc9m7qfTRnTVysP+Z6KyP++qyU8f5h
 yuNdkBPNsHd8B6yhuyyBhidNxP4vKwTZCuTmZ5q1QZHyZM/wiGH7ENtuK1C/gF4taxKx6R
 4/qA+/QAj484E4HSV33uk7iTkUeIjsjW9Acu9KuXfMdaWaku6kSh4ViXF97bm5OVzzgGcs
 IokpjKfx5f3MniZVoFxDYQNx+llDf32OXOGOB0L58wwHAil0N7dSEGPHBUUZ9gSjDebUMi
 3pnWZL/JBOUac89opSLml8usFS0KfslBSNuyI2pGAJlLhkSvHkIJOnPRymHO0g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MZTehfM0
Subject: Re: [Buildroot] [PATCH v3 2/2] configs/qemu: Update defconfigs to
 Linux 6.6.32
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

On Fri, 5 Jul 2024 10:53:06 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Linux version are changed to 6.6.32 (LTS) for all qemu defconfigs.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied, after fixing two issues:

- You forgot to update .checkpackageignore to drop the
  lib_defconfig.ForceCheckHash ignore lines for qemu defconfig

- The hash file for arm-trusted-firmware had a minor formatting issue
  (1 space while 2 spaces are needed)

I fixed those when applying. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
