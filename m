Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F476C02182
	for <buildroot@archiver.kernel.org>; Thu, 23 Jan 2025 17:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AB1C4246F;
	Thu, 23 Jan 2025 17:40:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AVtoS3T8TnJT; Thu, 23 Jan 2025 17:40:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E88542482
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E88542482;
	Thu, 23 Jan 2025 17:40:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F0822B88
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 17:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D19A884CE0
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 17:40:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7GYeGDwDBpNH for <buildroot@buildroot.org>;
 Thu, 23 Jan 2025 17:40:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=glbb-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0A82F84CDA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A82F84CDA
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A82F84CDA
 for <buildroot@busybox.net>; Thu, 23 Jan 2025 17:40:51 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <glbb-buildroot@m.gmane-mx.org>) id 1tb1CD-0009A1-EC
 for buildroot@busybox.net; Thu, 23 Jan 2025 18:40:49 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@busybox.net
From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Thu, 23 Jan 2025 17:40:41 -0000 (UTC)
Message-ID: <vmtuup$11q0$1@ciao.gmane.io>
References: <vm633c$k42$1@ciao.gmane.io>
 <929cc71a-1d78-46b7-b99f-99936c9fff20@mind.be>
User-Agent: slrn/1.0.3 (Linux)
Cc: buildroot@uclibc.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=gmail.com
Subject: Re: [Buildroot] Can we build static host tools (e.g. tar)?
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2025-01-23, Arnout Vandecappelle via buildroot <buildroot@buildroot.org> wrote:

> On 14/01/2025 17:24, Grant Edwards wrote:
>> I'm having problems with the SDK that Buildroot builds.  Things like
>> opkg-build are failing because they're using buildroot's SDK version
>> of tar, and the glibc version isn't compatible between the host where
>> the sdk was built and the devleoper host where the sdk is being used.
>
>   The SDK is meant to be relocatable, but it is very hard to make it possible to 
> just run anywhere. Static linking can help but even with -static you may still 
> get a shared binary. So even if we do that, there's no guarantee that it will 
> work on another build machine.

Right, but it should reduce the areas that could cause problems
(though static binaries would probably end up being absurding large).

>   BTW I'm surprised you complain about tar - the compiler should have the same 
> issue, no?

The change that's tripping us up was at glibc 2.38.  So far, the only
change we've run into using the SDK that wasn't compatible was in
libacl, and the only thing that uses that in the SDK (at least for us)
is tar.

Our temporary work-around is to go into the sdk tree on the affected
hosts and replace 'tar' with a symlink to the host's native
tar. Eventually those hosts will get OS updates that will allow the
SDK's tar to work again.

--
Grant

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
