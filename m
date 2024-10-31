Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7731D767F4
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 17:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9340F600CB;
	Thu, 31 Oct 2024 17:45:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nGvSpHtKBd6M; Thu, 31 Oct 2024 17:45:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B581B60A99
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B581B60A99;
	Thu, 31 Oct 2024 17:45:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B3D045E4F
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 17:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9439740204
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 17:45:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BwNveaA-eVKx for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 17:45:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5BA5140158
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BA5140158
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5BA5140158
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 17:45:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E59EB20002;
 Thu, 31 Oct 2024 17:45:32 +0000 (UTC)
Date: Thu, 31 Oct 2024 18:45:31 +0100
To: Cherniaev Andrei <dungeonlords789@naver.com>
Cc: buildroot@buildroot.org
Message-ID: <20241031184531.39b21c15@windsurf>
In-Reply-To: <20241031110441.2953443-1-dungeonlords789@naver.com>
References: <20241031110441.2953443-1-dungeonlords789@naver.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730396733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/EOYBMfv5dQZDvSrh9NiTawOiBCr50G1d1VeRq8ZkLA=;
 b=YlTl1He1jSTY8Cx1/MbD4wJ4b8QCIa67KiFSrxh6fjsTHkVwfBjny/LW/RqO6z0B5g+74u
 HgC3EYRHNtVmY8Z0Xd5Roy1JDf8fMZpOfSQyu24VaejNjJ7ah/PCB7qiMTT4fbBFN4hLba
 6Yx+eS4xRehI2T8ijad/su6YZad2dzW67DEowQchrwosoyvYPE29DM8dTdva3ckkP9ZA+U
 NIwzgxZpb96AZTqWvbeLHXTAbYTdCpPgGG4+/PQ+q5C7LG8LE1HpsEH/LjlhQwvYe3LWB+
 XfEWUMAouiHA1ReORismnPMxLNiVqu8aHYkKruEjCd31f7aifVJBrlVFooeIEQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YlTl1He1
Subject: Re: [Buildroot] [PATCH 1/1] configs/pc: fix grub root device in help
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Thu, 31 Oct 2024 20:04:41 +0900
Cherniaev Andrei <dungeonlords789@naver.com> wrote:

> Also make docs more user-friendly
> 
> Signed-off-by: Cherniaev Andrei <dungeonlords789@naver.com>

Thanks for your contribution, I have applied the part of your patch
fixing root=/dev/sda1 and root=/dev/vda1. The rest wasn't relevant, as
it's considered general Buildroot knowledge. We're not going to repeat
in each and every configuration file which package to rebuild to get
things taken into account.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
