Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6850CC02182
	for <buildroot@archiver.kernel.org>; Thu, 23 Jan 2025 17:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5BB170527;
	Thu, 23 Jan 2025 17:33:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fg_K3D820nTO; Thu, 23 Jan 2025 17:33:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65DB8704EE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65DB8704EE;
	Thu, 23 Jan 2025 17:33:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FE9DB88
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 17:33:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5AC6E81DF9
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 17:33:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qGDQ6P3viD6U for <buildroot@buildroot.org>;
 Thu, 23 Jan 2025 17:33:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=glbb-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8D1A382118
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D1A382118
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8D1A382118
 for <buildroot@busybox.net>; Thu, 23 Jan 2025 17:33:01 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <glbb-buildroot@m.gmane-mx.org>) id 1tb14a-0000HT-P3
 for buildroot@busybox.net; Thu, 23 Jan 2025 18:32:56 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@busybox.net
From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Thu, 23 Jan 2025 17:32:50 -0000 (UTC)
Message-ID: <vmtug2$bn$1@ciao.gmane.io>
References: <vmtsjv$aba$1@ciao.gmane.io>
 <4b9b3ef0-afbe-4cf2-94c6-966496c4a92f@mind.be>
User-Agent: slrn/1.0.3 (Linux)
Cc: buildroot@uclibc.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=gmail.com
Subject: Re: [Buildroot] How to set target system PATH?
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
>
>
> On 23/01/2025 18:00, Grant Edwards wrote:
>> I've set the desired PATH in the config file:
>> 
>>    BR2_SYSTEM_DEFAULT_PATH="/bin:/sbin:/usr/bin:/usr/sbin:/apps/bin"
>> 
>> But that only seems to affect login shells, and not daemons started
>> from /etc/init.d.
>> 
>> How do I set the _system_ PATH rather than just the login shell PATH.
>
>   Good question! That depends on the init system (because that one is 
> responsible to set the path). I looked in the source, and it looks like both 
> systemd and busybox init hardcode it without any configuration option...
>
>   So unless you convince the maintainers of your favourite init system to 
> change, you won't be able to customize the system path.

Yea, I've been looking at the busybox init docs, and it doesn't look
like there's any way to add/change the environment variables.  It sure
would have been nice if that could be done in /etc/inittab.

I dug through the local archives, and it turns out I addressed this
problem once 13 years ago. I used a postbbuild script and sed commands
to insert a couple lines into etc/init.d/rcS to set/export PATH and
LD_LIBRARY_PATH.

IIRC, I wasn't very happy with that at the time, but I guess I'll have
to do it again.

--
Grant


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
