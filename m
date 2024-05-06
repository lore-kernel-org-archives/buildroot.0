Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34337C25B10
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 19:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFFB68219F;
	Mon,  6 May 2024 19:45:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xfBilIQHiP07; Mon,  6 May 2024 19:45:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E68F6821A9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E68F6821A9;
	Mon,  6 May 2024 19:45:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B23B41BF3CA
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 19:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9EE1941481
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 19:45:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RmS2PzAwuEe7 for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 19:45:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6DB5940B9D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DB5940B9D
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6DB5940B9D
 for <buildroot@buildroot.org>; Mon,  6 May 2024 19:45:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B9888FF804;
 Mon,  6 May 2024 19:45:52 +0000 (UTC)
Date: Mon, 6 May 2024 21:45:51 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240506214551.4fda91cf@windsurf>
In-Reply-To: <20240506070049.137839-1-fontaine.fabrice@gmail.com>
References: <20240506070049.137839-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715024752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Oyo45U8Eq4WQ6IhIl+Zg1qXtrEXH6HDSweARJbUAb+c=;
 b=b0QnXbiIg/SUx7E5POFnjE15/l9Zo9HtrIPytjABzhPHLX9LAd2Qo2E/Ypcd9vNVgyNZrg
 pKkgts0OemvjOV08WdYqPg2fLhw81OHF/hx4u2t3Trgfx0e9J820N5HcBhcts8In9AiXc4
 0K+bg5rbbywZtaSIHEMbLkFatYcqCBli9RMPd603XkIX/jdAPznQadK8FBaQIOUXZ0lu8N
 fH7opZpRAgH2feXXMHRDpkcXq/VKIeM2FGQQKJ4jueAkOPEB8Op7Jvs5y857U8aKsVKiaD
 YtyZLOI4JT21czH3/58JmrtMBTp+cidLGJSghUrv/80Gy4PZ915QKh/r/g4laQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=b0QnXbiI
Subject: Re: [Buildroot] [PATCH 1/1] package/oprofile: fix static build with
 binutils >= 2.40
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

On Mon,  6 May 2024 09:00:49 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> sframe library was added by binutils 2.40 and
> https://github.com/bminor/binutils-gdb/commit/19e559f1c91bfaedbd2f91d85ee161f3f03fda3c
> resulting in the following static build failure:
> 
> /home/buildroot/autobuild/run/instance-1/output-1/build/binutils-2.41/bfd/elf-sframe.c:220: undefined reference to `sframe_decode'
> 
> [...]
> 
> configure: error: bfd library not found
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/a9f3e09e6543b3773440c011e93bd41e357691e4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-fix-static-build-with-binutils-2.40.patch | 62 +++++++++++++++++++
>  package/oprofile/oprofile.mk                  |  7 +++
>  2 files changed, 69 insertions(+)
>  create mode 100644 package/oprofile/0002-fix-static-build-with-binutils-2.40.patch

Life would *really* be easier if binutils was installing a libbfd.pc,
and oprofile would use it to detect libbfd and automatically know about
its indirect dependencies.

But oh well, patch applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
