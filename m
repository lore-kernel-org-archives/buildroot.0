Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE399C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 12:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4EFE4175D;
	Wed,  5 Feb 2025 12:50:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vkON1gJ0rU3p; Wed,  5 Feb 2025 12:50:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6223F4054A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6223F4054A;
	Wed,  5 Feb 2025 12:50:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D00312F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 12:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 313F081097
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 12:50:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rMFE0ia9012R for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 12:50:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A38B880F8C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A38B880F8C
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A38B880F8C
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 12:50:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id 3A7321814B9; Wed,  5 Feb 2025 13:50:19 +0100 (CET)
In-Reply-To: <e332ee2d-da83-4134-b57d-4079fc086253@mind.be>
References: <20241107191634.378670-1-james.hilliard1@gmail.com>
 <20241107191634.378670-2-james.hilliard1@gmail.com>
 <e332ee2d-da83-4134-b57d-4079fc086253@mind.be>
Date: Wed, 05 Feb 2025 13:50:19 +0100
Cc: "James Hilliard" <james.hilliard1@gmail.com>, buildroot@buildroot.org,
 "Marcus Folkesson" <marcus.folkesson@gmail.com>,
 "Kamel Bouhara" <kamel.bouhara@gmail.com>,
 "Marcin Niestroj" <m.niestroj@grinn-global.com>,
 "Julien Olivain" <ju.o@free.fr>, "Asaf Kahlon" <asafka7@gmail.com>,
 "Woodrow Douglass" <wdouglass@carnegierobotics.com>,
 "Christian Stewart" <christian@aperture.us>,
 "Robert Rose" <robertroyrose@gmail.com>,
 "Fabrice Fontaine" <fontaine.fabrice@gmail.com>
To: "Arnout Vandecappelle" <arnout@mind.be>
MIME-Version: 1.0
Message-ID: <699ab-67a35e80-5-3c0d1ac0@151826379>
User-Agent: SOGoMail 5.11.2
X-Last-TLS-Session-Version: None
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; t=1738759821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q8F0AxQCnG9Zz+hmhWWrujBPci0YNslS3ZtDzixtOz0=;
 b=sK6OV4KH2KT3f6aTAImWvhFTJMnc0AzNllD4WOEVDaI33UdfXNkuZzdIU7UEWp5qZJ3MBG
 yQwMW+IfZtswee+Vkr1v+p26NN43oZ+DFneEFddrHYXqA45Kf3h/bejjKvLXhosnuDzELs
 nMAgiOnJvLXPhDQ8IeBsZWPpWE8ZFiw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=sK6OV4KH
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH_v5_2/4=5D_package/=7Bpython-=7Dpr?=
 =?utf-8?q?otobuf=3A_bump_to_version_28=2E1?=
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout, James,

On Wednesday, February 05, 2025 13:02 CET, Arnout Vandecappelle via buildroot <buildroot@buildroot.org> wrote:
> 
> 
>   There are a bunch of other reverse dependencies of protobuf that I didn't get 
> around to testing.
> 
>   Could you take a look? If not we'll need to revert.
> 

As I already wrote on the bug tracker [0] this is a known issue in ola and there currently
seems no easy fix. Other distributions are also already keeping back updates of protobuf
because of it. see [1].

So to me it seems: either revert protobuf or drop the ola package. I'm not sure how much
usage there is of either. For me a bump of protobuf would be more important because 
(I'm using protobuf and) it's also required to be able to bump the grpc package.

(grpc is currently also broken because libabseil-cpp was bumped as part of this patchset but grpc wasn't)

[0] https://gitlab.com/buildroot.org/buildroot/-/issues/83
[1] https://github.com/OpenLightingProject/ola/issues/1879#issuecomment-2567133849

Regards,
Michael 

>   Regards,
>   Arnout
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
