Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F47C3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 20:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53794405FD;
	Sun, 18 May 2025 20:46:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iZQDpFjLpiyW; Sun, 18 May 2025 20:46:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93FB04060B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93FB04060B;
	Sun, 18 May 2025 20:46:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BCF61BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 20:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D07780FB0
 for <buildroot@buildroot.org>; Sun, 18 May 2025 20:46:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 74T0EZaP_if4 for <buildroot@buildroot.org>;
 Sun, 18 May 2025 20:46:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C50CA8101D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C50CA8101D
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C50CA8101D
 for <buildroot@buildroot.org>; Sun, 18 May 2025 20:46:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2D6DC1C12DE; Sun, 18 May 2025 22:46:31 +0200 (CEST)
Message-ID: <fe807e99-8a7c-4557-a4be-a4f34a2d379c@rnout.be>
Date: Sun, 18 May 2025 22:46:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michael Walle <michael@walle.cc>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <20230313081549.493823-1-michael@walle.cc>
 <20230313081549.493823-2-michael@walle.cc> <20230313092131.04406301@windsurf>
Content-Language: en-GB, fr-BE
In-Reply-To: <20230313092131.04406301@windsurf>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747601191; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=94v/JVirg6iTNu1QTAlu6x0dMkL1rOtndJJjg4MjxXw=;
 b=VJotqMuqcUNi400LjAWwc7BACzyqT/YdHg18iWB0mfpttQYnzbNkLz9ZWdXKnY8OrZKVmR
 HR03x43M9wyK2gfCKkn4yxuyIx4mJzVhREwnqudY5DkiatQdV85EVuadnKCcUoc42je7W7
 lA6YCP1p3Cxw91HjEaVM/FvDvfp4ogmwjX5zuPx0NVWgpYlDqa4tvzHdOTEEJ9bZIiGD38
 CGhMqygLjheVojlwD4/7DurnQt9r/Grcim5D6PwwYQH0aOqN9pkXYcLe7R8/l1Hp0IknS6
 ZUQvREKw+H0772B4cBMkKjcuUIh4rPDhqP1KIHP3aaiJBcZfyY2utEesOUwyUQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=VJotqMuq
Subject: Re: [Buildroot] [PATCH RESEND 1/2] package/urandom-scripts: move to
 new package busybox-initscripts
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Michael,

On 13/03/2023 09:21, Thomas Petazzoni via buildroot wrote:
> On Mon, 13 Mar 2023 09:15:48 +0100
> Michael Walle <michael@walle.cc> wrote:
> 
>> +config BR2_PACKAGE_URANDOM_SCRIPTS
>> +	bool "urandom-initscripts package was renamed"
>> +	select BR2_LEGACY
>> +	select BR2_PACKAGE_BUILDROOT_INITSCRIPTS
>> +	select BR2_PACKAGE_BUILDROOT_INITSCRIPTS_URANDOM
> 
> This is basically causing to cause the legacy warning to trigger for
> virtually all configurations, as this package is enabled in basically
> all non-systemd configurations.
> 
> It's a bit annoying :-/
> 
> One option would be to not have the "select BR2_LEGACY", which would
> work OK because of the 2 selects that enable the new package. But
> it would also mean that people will keep BR2_PACKAGE_URANDOM_SCRIPTS=y
> in their .config forever.
> 
> I don't really have a good solution/idea here, just pointing out this
> inconvenience.

  We _finally_ got around to reviewing this patch, and decided that the added 
value of a buildroot-initscripts package is too low to be worth the bother of 
the legacy stuff. So we marked this patch as Rejected.

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
