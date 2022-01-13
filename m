Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 804DAC433F5
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 12:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED24441685;
	Thu, 13 Jan 2022 12:18:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5B_QAejndiZ2; Thu, 13 Jan 2022 12:18:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FDDF41680;
	Thu, 13 Jan 2022 12:18:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5255C1BF57B
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 12:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3FD7784BD3
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 12:18:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NJkr3RUi5yWq for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 12:18:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.steinkuehler.net (unknown [70.184.225.181])
 by smtp1.osuosl.org (Postfix) with ESMTP id 436E484B2F
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 12:18:52 +0000 (UTC)
Received: (qmail 6384 invoked from network); 13 Jan 2022 06:18:51 -0600
Received: from 152.ks.newtek.dhcp (HELO ?10.34.1.152?) (charles@10.34.1.152)
 by mail.steinkuehler.net with SMTP; 13 Jan 2022 06:18:51 -0600
Message-ID: <2fc839d4-9c06-0197-dc15-58893d78afe9@steinkuehler.net>
Date: Thu, 13 Jan 2022 06:18:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: "Karicheri, Murali" <Murali.Karicheri@sandc.com>
References: <DM5PR02MB3291BEB37006D28524E582C38A519@DM5PR02MB3291.namprd02.prod.outlook.com>
From: Charles Steinkuehler <charles@steinkuehler.net>
In-Reply-To: <DM5PR02MB3291BEB37006D28524E582C38A519@DM5PR02MB3291.namprd02.prod.outlook.com>
Subject: Re: [Buildroot] creating packages for opkg for buildroot based
 embedded platform software
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 1/11/2022 11:37 AM, Karicheri, Murali wrote:
> Hi Baruch,
 > > <snip>
> 
> I fully appreciate the intentions of buildroot to keep it simple. I
> had already reviewed the FAQ you had pointed out.  What I am looking
> for is something outside buildroot. Typically, embedded systems that
> I am working with have firmware update mechanism in place. System
> doesn't modify the active rootfs but update an alternate set of
> partitions and switch to that once update is successful. So, we could
> potentially generate two rootfs contents using buildroot. One using
> say version 2021.02.02 and another with 2021.02.06 for example. We
> are using ARM tool chain for our build and assume we will keep it
> same for incremental updates. Understand that we might have to change
> the tool chain as well since there could be vulnerability fixes to
> tool chain. So, wondering if we could do a diff of both rootfs
> contents and create an ipk for the diff and update the alternate
> media for this purpose. Also, we will do extensive testing of our
> product software. So, this will be QA tested before pushing to field.
 >
> Is there anything work done for this type of use cases?

As you have discovered, buildroot is focused on building a complete root 
filesystem.  There are many tools available to manage updates and handle 
firmware upgrades.  Buildroot can build these tools for you (eg: RAUC, 
SWupdate, etc), but configuration of the embedded system, the update 
process, and generating the update packages is up to you.  There is 
almost infinite flexibility, which means you can probably do exactly 
what you want, but that can also make it hard to get something running.

I needed a mechanism to do "A B" firmware updates and recently put 
together a Buildroot + RAUC example for the Raspberry Pi that generates 
a working basic system that can be updated:

https://github.com/cdsteinkuehler/br2rauc

This does full rootfs updates and allows for atomic boot loader updates, 
using the post-image.sh script to build the RAUC bundles needed for 
performing an update along with the root filesystem image generated by 
Buildroot.  If you want to do partial updates, you can setup RAUC 
differently, perhaps with an overlay partition to hold your point 
release updates.

-- 
Charles Steinkuehler
charles@steinkuehler.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
