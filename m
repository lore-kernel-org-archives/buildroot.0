Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A6FEDE9BF
	for <buildroot@archiver.kernel.org>; Tue, 10 Sep 2024 21:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADACC60720;
	Tue, 10 Sep 2024 21:17:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i-BXlmFOk57D; Tue, 10 Sep 2024 21:17:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C687B608B6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C687B608B6;
	Tue, 10 Sep 2024 21:16:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1184A1BF359
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 21:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F186A80C97
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 21:16:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2OHGpgekVJH9 for <buildroot@lists.busybox.net>;
 Tue, 10 Sep 2024 21:16:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=glbb-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3C81C80C87
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C81C80C87
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C81C80C87
 for <buildroot@busybox.net>; Tue, 10 Sep 2024 21:16:57 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <glbb-buildroot@m.gmane-mx.org>) id 1so8EI-0006AZ-Ig
 for buildroot@busybox.net; Tue, 10 Sep 2024 23:16:54 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@busybox.net
From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 10 Sep 2024 21:16:47 -0000 (UTC)
Message-ID: <vbqcvv$mjg$1@ciao.gmane.io>
References: <vbq51m$cnj$1@ciao.gmane.io> <vbq5j5$aai$1@ciao.gmane.io>
 <20240910224640.5f832e45@windsurf>
User-Agent: slrn/1.0.3 (Linux)
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=gmail.com
Subject: Re: [Buildroot] How to control host gcc version?
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
Cc: buildroot@uclibc.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2024-09-10, Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:
> On Tue, 10 Sep 2024 19:10:29 -0000 (UTC) Grant Edwards <grant.b.edwards@gmail.com> wrote:
>
>> Ah, found it:
>> 
>>     8.6. Environment variables
>> 
>>     Buildroot also honors some environment variables, when they are
>>     passed to make or set in the environment:
>> 
>>     HOSTCXX, the host C++ compiler to use
>>     HOSTCC, the host C compiler to use
>
> Indeed. But in your case, what you probably should do is use a Docker
> container. You can use the utils/docker-run script to easily run the
> build in a docker container.
>
> Basically do:
>
> 	./utils/docker-run make
>
> and it will do the Buildroot build in our "reference" Debian bullseye
> Docker container.

Thanks! I'll definitely take a look at that. I don't currently have my
development hosts set up with docker support, but it's looking like
we're probably headed that way for other projects too.

> If you're not happy with this container, you can do:
>
> 	IMAGE=<your-docker-image> ./utils/docker-run make


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
