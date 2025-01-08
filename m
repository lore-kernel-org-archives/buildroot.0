Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53950E77188
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 20:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DA6980585;
	Wed,  8 Jan 2025 20:42:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KkZ0SMOQgxfi; Wed,  8 Jan 2025 20:42:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53BCC805A8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53BCC805A8;
	Wed,  8 Jan 2025 20:42:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6AEAE1EB8
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 20:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5802840391
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 20:42:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XbfqVroTTZ7N for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 20:42:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6A92F40339
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A92F40339
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A92F40339
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 20:42:24 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1322577067; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 08 Jan 2025 20:42:21 +0000 (UTC)
Message-ID: <98910b57-2d60-4eeb-940a-6c334400b262@korsgaard.com>
Date: Wed, 8 Jan 2025 21:42:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20241230201103.203055-1-ju.o@free.fr>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20241230201103.203055-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=dAajyZBZQuH09kctxi1ata5IL3ax+MNTcHk0y3N2Q6lkidb2CQIg0mi2eHpwemEeazw7F/A7LIgdoWWHW97t2nb3S8QjTCs8QSPQvq47e3UXRqyRDWLtTJa7lHRoVhVvOiznaXNfdBo09JQ4i0Kkp1TXQNUd4NrjM6unqwbyJ9ORU7ZLwYn5MjFbhHZXOhgGTwkmYskFeWWldCcFplMXLCGAeBCl8+Y+B2Kdu654DyWf0NusQLth1pthCMzojdVZY2D7k1fi9yM6YBVSuqTZAXiwesqKpw8E3EVtwC2aIUkqCqByzQWJkPNHXW4WKY9Fs8f2BNz8sbbfACCGfbAR0g==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=a53qyY56G33q/FyAyDbRX0GfzqK/K9FVhVldGSJRUyw=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=dAajyZBZ
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: new xxhash runtime test
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

On 12/30/24 21:11, Julien Olivain wrote:
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/8743934301

Committed to 2024.02.x and 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
