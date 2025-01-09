Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA5EE77197
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 09:54:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 262B34062E;
	Thu,  9 Jan 2025 09:54:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KmyCakQ2F-_w; Thu,  9 Jan 2025 09:54:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 199B740644
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 199B740644;
	Thu,  9 Jan 2025 09:54:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C0B8E940
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 09:54:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98A9382CCA
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 09:54:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FCzeN6IiSY04 for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 09:54:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 263FD82CAC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 263FD82CAC
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 263FD82CAC
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 09:54:51 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 900414238; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 09 Jan 2025 09:54:43 +0000 (UTC)
Message-ID: <ec2dda65-987d-43fa-ba63-816be9273b08@korsgaard.com>
Date: Thu, 9 Jan 2025 10:54:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20250108213411.2091627-1-thomas.petazzoni@bootlin.com>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20250108213411.2091627-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=PUoMVCY5ZoqRDU6a3w/4UqMOV3iD4nGWGPW9rRSfoWc5AQaNpModVR/VBaEmD5DqwLSD2ybBse10zeHI5erfJxXqqNWEBI/xLIIs//5LbYSs4AuNDarGjFVf7LkdIOz7WER2H7VFXIzjf/YI6+3hJb9FFT+J5zQ9x41iJAXRxFAW3bPR/u6maR7j1ya52z2VvetbT6jr+AHpD0fVNtBDiSGrU/aFA+gVy8GtsmZSZEi48ccBycCHpv5WWs0japtJ4hDsZDSiHdEfzCo5BTlGaQsH2qvAsucMLwqAHt/N1jvT11QI//HvzBbxNKa0jogFLjaviuGTtJCh3IVF4KQgEw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=0b5JTUmfYc25Cu8WJiWfSCTQzoBoViNQ/DcKyIvz/v0=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=PUoMVCY5
Subject: Re: [Buildroot] [PATCH 1/3] package/linux-pam: backport upstream
 patch to fix build issue
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

On 1/8/25 22:34, Thomas Petazzoni via buildroot wrote:
> We are seeing build issues with linux-pam in the autobuilders such as:
> 
> md5_crypt.c: In function 'Goodcrypt_md5':
> md5_crypt.c:145:13: error: implicit declaration of function 'asprintf'; did you mean 'vsprintf'? [-Wimplicit-function-declaration]
>    145 |         if (asprintf(&passwd, "%s%.*s$%s", magic, sl, sp, buf) < 0)
>        |             ^~~~~~~~
>        |             vsprintf
> 
> This is due to the fact that <stdio.h> gets included without
> _GNU_SOURCE being defined, and so the prototype of asprintf() is not
> accessible, at least with uclibc-ng.
> 
> The _GNU_SOURCE definition is properly in linux-pam's config.h, but
> config.h doesn't get properly included first everywhere. This issue
> has been fixed upstream in the mean time, so we simply backport the
> upstream patch.
> 
> Fixes:
> 
>    http://autobuild.buildroot.net/results/49b190b3fbae3cdca4c7a08b3ab5100a937ede9e/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2024.02.x and 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
