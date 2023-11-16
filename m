Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38849C5ACB3
	for <buildroot@archiver.kernel.org>; Thu, 16 Nov 2023 14:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BED6283852;
	Thu, 16 Nov 2023 14:02:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BED6283852
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KiskprRNLv6m; Thu, 16 Nov 2023 14:02:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0856583834;
	Thu, 16 Nov 2023 14:02:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0856583834
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 815A01BF32C
 for <buildroot@lists.busybox.net>; Thu, 16 Nov 2023 14:02:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5291383834
 for <buildroot@lists.busybox.net>; Thu, 16 Nov 2023 14:02:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5291383834
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KVPXbtgEv8O0 for <buildroot@lists.busybox.net>;
 Thu, 16 Nov 2023 14:02:14 +0000 (UTC)
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 688A2837D3
 for <buildroot@buildroot.org>; Thu, 16 Nov 2023 14:02:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 688A2837D3
Received: from tarshish (unknown [10.0.8.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 9878B440F4F;
 Thu, 16 Nov 2023 16:01:06 +0200 (IST)
References: <20231116135136.2337261-1-thomas.petazzoni@bootlin.com>
User-agent: mu4e 1.10.7; emacs 29.1
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Nov 2023 16:01:03 +0200
In-reply-to: <20231116135136.2337261-1-thomas.petazzoni@bootlin.com>
Message-ID: <87zfzdzti5.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1700143266;
 bh=sTNNwgJPmsJFJrjA/glMlcdhCFVHQGaI/PfTKt1v4Wk=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=bMLc0mGsj0Zr5aNBkBDz78B+N6U2c9qLzYknAhJT4ktCQE9g4DTk+ReYNz8vNOCBL
 lSSZRAJP3eVcLa+CzyE/861SnX2slMhKJdfsv+Qx0w8QhbZtUm5XCAXwiHotb3YKPe
 rx38iGshnEt8n3kdmmSNPPEsjDCX3B4jwyiU4jijYPTtu4/bj8fQq1ptbumxPPiXah
 eR9PSuXdoUlQKHO+9vGbUkPY4JUXPq5cMrJlPJwYADBFNZz/5jMmO/NvCFdVhV3H6P
 rMxT/cWI5YGM8RT53HayU41YIepOh6jbtNMWF5bT2nXrQzndcHFCSXjlzkQ/N1aruZ
 Wno4IvJEEPQuA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=bMLc0mGs
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Nicolas Carrier <nicolas.carrier@nav-timing.safrangroup.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


On Thu, Nov 16 2023, Thomas Petazzoni via buildroot wrote:
> In commit 13fc9dcb34926e9b6310b23662920c55c96d83a1, netsnmp was bumped
> from 5.9.3 to 5.9.4 to fix two CVEs.
>
> However, even though it's a minor version bump, there are actually 163
> commits upstream between those two minor releases, and some of them
> are breaking existing use-cases. In particular upstream
> a2cb167514ac0c7e1b04e8f151e0b015501362e0 now requires that config_()
> macros in MIB files are terminated with a semicolon, causing a build
> breakage with existing MIB files that were totally valid with 5.9.3.
>
> This commit therefore proposes to revert back to 5.9.3, by reverting
> those two commits:
>
> 56caafceab3ec12669ccb7aa6fc8b653778064e1 package/netsnmp: fix musl build
> 13fc9dcb34926e9b6310b23662920c55c96d83a1 package/netsnmp: security bump to version 5.9.4
>
> and instead revert the one upstream commit that fixes both CVEs.

s/revert/backport/, I guess?

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
