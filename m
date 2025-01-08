Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 867FDE77188
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 20:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55EAA80D6B;
	Wed,  8 Jan 2025 20:37:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cdcXg9nR4nOw; Wed,  8 Jan 2025 20:37:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72A1F80E2A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72A1F80E2A;
	Wed,  8 Jan 2025 20:37:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C5317AA
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 20:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3743460872
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 20:37:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VcD-RtSfzMIm for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 20:37:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5BF986086D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BF986086D
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5BF986086D
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 20:37:03 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 2007141480; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 08 Jan 2025 20:36:56 +0000 (UTC)
Message-ID: <6e3bb22b-97a6-431a-b4af-fe1211aa0b65@korsgaard.com>
Date: Wed, 8 Jan 2025 21:36:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot List <buildroot@buildroot.org>
References: <20241229123751.639378-1-thomas.petazzoni@bootlin.com>
 <20241229123751.639378-5-thomas.petazzoni@bootlin.com>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20241229123751.639378-5-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=LcfhA/fprGidclQRP1/p7y8dCTQfuEkHYZLMrYuCMekfm+yJef/Jc7/0FtSZO6ZynGA8JF0fgNMmH8n0W7DD3nfoAvhhGtRUittXkitt5/l6a7/gm46ArhWXYreOd+AHKyXmu5Ncep9oGgz9lL5yc/9/+5NFP9/waXQ8ciwN2FDPDjP0z7NfzDd8c0L0ZS5ipjjwOZuirmdPkzk1dm/Ji+f30cDP5LkzZjz8CQ8D50/SMpbN/jwUQzxhVkhiYPMfSPMeH5kb1sW90WPcrYol/pNsdh2H++j7lyRBe9wkKUgdwfA8KEyYr0W6Ef5zjtIjmUGaSzpFSu1kU3YwMiZn1w==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=0RgKNkZuj2e69qmg49jWpWRVoQ9iC19r6RoetZ/r6xM=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=LcfhA/fp
Subject: Re: [Buildroot] [PATCH 4/4] linux: select proper defconfig on ARC
 750d/770d
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 12/29/24 13:37, Thomas Petazzoni wrote:
> The Linux kernel "defconfig" on ARC is haps_hs_smp_defconfig, which
> cannot be built on ARC 750d/770d targets, so let's use a kernel
> defconfig that works properly on ARC 750d/770d.
> 
> Fixes:
> 
>    http://autobuild.buildroot.net/results/2913e5958cd6b20dbfdcdad304a5f5a0f8030d8d/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2024.02.x and 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
