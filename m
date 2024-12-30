Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30EEAE77188
	for <buildroot@archiver.kernel.org>; Mon, 30 Dec 2024 12:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1B2580AB8;
	Mon, 30 Dec 2024 12:43:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OOJVCB--azqb; Mon, 30 Dec 2024 12:43:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0454805A3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0454805A3;
	Mon, 30 Dec 2024 12:43:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B78D6968
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 12:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A458C4056E
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 12:43:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uXG6y4M7vm4m for <buildroot@buildroot.org>;
 Mon, 30 Dec 2024 12:43:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E75034056D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E75034056D
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E75034056D
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 12:43:40 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1162095528; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 30 Dec 2024 12:43:33 +0000 (UTC)
Message-ID: <b58674e6-2aa1-4f27-831a-be9461070242@korsgaard.com>
Date: Mon, 30 Dec 2024 13:43:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
References: <20241229093332.334759-1-thomas.petazzoni@bootlin.com>
 <4ec6a821a844d53ce68489983d4e4068@free.fr> <20241229210352.684be2d5@windsurf>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20241229210352.684be2d5@windsurf>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=P9V7tGY3USqUtbwB+9eFCtAT+GvHqafcaOivu8ftDYN/NUvz4ddo8TMkmIba1faHzTHygfgRnoWRbpkTTnYY1rbaVE4/Zw6E8nGb3CSLJBWFlIa8WNxvGJUzpaYNp9yDVMaLknra4iyV4fo3a4hOyErQ8sxj6rSQyC9+ux6+TH0kRr1shg30LtUYXPH2pApzGjNUtPoXL6Q+1Ez1goiJLZ2WSmywzljao1zxKQS44tj3cFfeEitmEx8+0BhX38JyGsgQcBzkm3s0UuGbySgJx1Q7vwlnd/UYHwxqwLY5iKZNC+wOSjAqHHgobQ7FFo7RpR2pwFz0Sp3q+dG2n38qcQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=BWhfWpIgizTOnUrgjxfVRwkcvtEUnMufAz8RVLupPLg=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=P9V7tGY3
Subject: Re: [Buildroot] [PATCH] linux: select
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL when needed
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

On 12/29/24 21:03, Thomas Petazzoni wrote:

> I am not sure myself what is the right solution here. I'm trying to
> avoid recurring autobuilder failures. I discussed this topic some time
> ago with Peter. My idea was to do tweaks in utils/genrandconfig, but
> Peter was on the opinion that we should deal with those issues directly
> in the linux package, so that it doesn't just benefit the autobuilders,
> but also our users.
> 
> Clearly, it's going to be a cat-and-mouse game: we discover issues in
> the autobuilders and address them. This is for example the case for the
> x86-64 situation you reported. But for example, I only took care of the
> "latest kernel version" case, but we might have similar issues for the
> CIP versions as well. My idea was to simply deal with those
> progressively, improving the logic as we discover new cases.
> 
> Note that I am not 100% sure of what the best approach is. Maybe it's
> one of those cases where we simply to try one approach, and decide
> later if it was the right approach or not?

Yes, I think the complexity is more or less the same (+/- differences in 
kconfig vs python) no matter where we put it, so having it in kconfig 
and helping everyone rather than just the autobuilders IMHO makes most 
sense.

But lets see how complicated it turns out over time.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
