Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F99C4167B
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 08:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E8FC6F4B1;
	Thu, 30 Nov 2023 08:21:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E8FC6F4B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lUNsozuLIOHl; Thu, 30 Nov 2023 08:21:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC0DB61B3A;
	Thu, 30 Nov 2023 08:21:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC0DB61B3A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A29F41BF3BC
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 08:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B26861B3A
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 08:21:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B26861B3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FMKhHuDcnPPI for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 08:21:53 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8CD3161B39
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 08:21:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CD3161B39
Received: by mail.gandi.net (Postfix) with ESMTPSA id 37399E000D;
 Thu, 30 Nov 2023 08:21:50 +0000 (UTC)
Message-ID: <39ac9dca-0ba7-479d-b6de-b7158a0e80e4@korsgaard.com>
Date: Thu, 30 Nov 2023 09:21:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20231116135136.2337261-1-thomas.petazzoni@bootlin.com>
 <20231126173421.GC3177259@scaer>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20231126173421.GC3177259@scaer>
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/netsnmp: revert back to 5.9.3,
 backport security fix
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
Cc: Nicolas Carrier <nicolas.carrier@nav-timing.safrangroup.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 26/11/2023 18.34, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2023-11-16 14:51 +0100, Thomas Petazzoni via buildroot spake thusly:
>> In commit 13fc9dcb34926e9b6310b23662920c55c96d83a1, netsnmp was bumped
>> from 5.9.3 to 5.9.4 to fix two CVEs.
>>
>> However, even though it's a minor version bump, there are actually 163
>> commits upstream between those two minor releases, and some of them
>> are breaking existing use-cases. In particular upstream
>> a2cb167514ac0c7e1b04e8f151e0b015501362e0 now requires that config_()
>> macros in MIB files are terminated with a semicolon, causing a build
>> breakage with existing MIB files that were totally valid with 5.9.3.
>>
>> This commit therefore proposes to revert back to 5.9.3, by reverting
>> those two commits:
>>
>> 56caafceab3ec12669ccb7aa6fc8b653778064e1 package/netsnmp: fix musl build
>> 13fc9dcb34926e9b6310b23662920c55c96d83a1 package/netsnmp: security bump to version 5.9.4
>>
>> and instead revert the one upstream commit that fixes both CVEs.
> 
> s/revert/backport/ as noticed by Baruch.
> 
>> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> Applied to master, thanks.
> 
>> ---
>> Note: for master, we probably want to keep the bump to 5.9.4, as it's
>> upstream decision. This commit is really intended for
>> 2023.02.x (perhaps other maintenance branches), where we don't want to
>> break things for users.
> 
> I saw that comment a bit too late, and pushed to master.
> 
> However, after reasing the CHANGES file, I noticed that:
> 
>      IMPORTANT: SNMP over TLS and/or DTLS are not functioning properly
>      in this release with various versions of OpenSSL and will be fixed
>      in a future release.
> 
> So, it was anyway a good idea to revert (pfeew...)

Yeah, lets release 2023.11 with 5.9.3 and then revisit this issue for 
2024.02.

Committed to 2023.02.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
